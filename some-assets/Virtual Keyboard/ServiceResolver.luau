--!nonstrict

export type Resolver = {
	cr: ((Instance) -> Instance)?,
	svc: {
		cache: { [string]: Instance },
		fallback: { [string]: boolean },
		invalid: { [string]: boolean },
	},
	sv: (any) -> boolean,
	fs: (string) -> Instance?,
	gfs: (string) -> Instance?,
	ns: (string) -> Instance?,
	gs: (string) -> Instance?,
	cv: (any) -> any,
	cs: (string, any) -> Instance?,
	ig: (string) -> boolean,
	cm: (string, string, ...any) -> any,
}

type AnyTable = { [any]: any }

local function safeGetGlobalEnv(): AnyTable
	local ok, env = pcall(function()
		if type(getgenv) == "function" then
			return getgenv()
		end

		return _G
	end)

	if ok and type(env) == "table" then
		return env
	end

	if type(_G) == "table" then
		return _G
	end

	return {}
end

local function safeSharedEnv(): AnyTable?
	local ok, env = pcall(function()
		return shared
	end)

	if ok and type(env) == "table" then
		return env
	end

	ok, env = pcall(function()
		return rawget(_G, "shared")
	end)

	if ok and type(env) == "table" then
		return env
	end

	return nil
end

local globalEnv = safeGetGlobalEnv()
local sharedEnv = safeSharedEnv()
local cacheHost = type(sharedEnv) == "table" and sharedEnv or (type(globalEnv) == "table" and globalEnv or nil)

if cacheHost then
	local cached = rawget(cacheHost, "__lt_service_resolver")
	if type(cached) == "table" then
		return cached
	end
end

local cloneRefFn = nil
pcall(function()
	if type(cloneref) == "function" then
		cloneRefFn = cloneref
	elseif type(globalEnv) == "table" and type(rawget(globalEnv, "cloneref")) == "function" then
		cloneRefFn = rawget(globalEnv, "cloneref")
	end
end)

local __lt: Resolver = {
	cr = cloneRefFn,
	svc = {
		cache = {},
		fallback = {},
		invalid = {},
	},
} :: any

function __lt.sv(value: any): boolean
	return typeof(value) == "Instance"
end

function __lt.fs(name: string): Instance?
	local ok, service = pcall(function()
		return game:FindService(name)
	end)

	if ok and __lt.sv(service) then
		return service
	end

	return nil
end

function __lt.gfs(name: string): Instance?
	local ok, service = pcall(function()
		return game:GetService(name)
	end)

	if ok and __lt.sv(service) then
		return service
	end

	return nil
end

function __lt.ns(name: string): Instance?
	local ok, service = pcall(Instance.new, name)

	if ok and __lt.sv(service) then
		return service
	end

	return nil
end

function __lt.gs(name: string): Instance?
	local cached = __lt.svc.cache[name]
	local isFallback = __lt.svc.fallback[name] == true

	if __lt.sv(cached) and not isFallback then
		return cached
	end

	local service = __lt.fs(name)
	if __lt.sv(service) then
		__lt.svc.invalid[name] = nil
		__lt.svc.cache[name] = service :: Instance
		__lt.svc.fallback[name] = nil
		return service
	end

	if __lt.sv(cached) and isFallback then
		return cached
	end

	if __lt.svc.invalid[name] then
		return nil
	end

	service = __lt.ns(name)
	if __lt.sv(service) then
		__lt.svc.cache[name] = service :: Instance
		__lt.svc.fallback[name] = true
		return service
	end

	service = __lt.gfs(name)
	if __lt.sv(service) then
		__lt.svc.invalid[name] = nil
		__lt.svc.cache[name] = service :: Instance
		__lt.svc.fallback[name] = nil
		return service
	end

	__lt.svc.invalid[name] = true
	return nil
end

function __lt.cv(value: any): any
	if __lt.cr and typeof(value) == "Instance" then
		local ok, cloned = pcall(__lt.cr, value)
		if ok and cloned ~= nil then
			return cloned
		end
	end

	return value
end

function __lt.cs(name: string, refFn: any): Instance?
	if type(refFn) ~= "function" then
		return __lt.gs(name)
	end

	local service = __lt.fs(name)
	if __lt.sv(service) then
		local ok, ref = pcall(function()
			return refFn(service)
		end)

		if ok and __lt.sv(ref) then
			return ref
		end

		return service
	end

	if __lt.svc.invalid[name] then
		return nil
	end

	local fallbackOk, fallbackRef = pcall(function()
		return refFn(Instance.new(name))
	end)

	if fallbackOk and __lt.sv(fallbackRef) then
		return fallbackRef
	end

	service = __lt.ns(name)
	if __lt.sv(service) then
		return service
	end

	service = __lt.gfs(name)
	if __lt.sv(service) then
		local ok, ref = pcall(function()
			return refFn(service)
		end)

		if ok and __lt.sv(ref) then
			return ref
		end

		return service
	end

	__lt.svc.invalid[name] = true
	return nil
end

function __lt.ig(method: string): boolean
	return method == "FindFirstChild"
		or method == "WaitForChild"
		or method == "FindFirstChildOfClass"
		or method == "FindFirstChildWhichIsA"
		or method == "FindFirstAncestor"
		or method == "FindFirstAncestorOfClass"
		or method == "FindFirstAncestorWhichIsA"
		or method == "GetChildren"
		or method == "GetDescendants"
		or method == "QueryDescendants"
end

function __lt.cm(name: string, method: string, ...: any): any
	local service = __lt.cs(name, __lt.cr)
	if not __lt.sv(service) then
		error(string.format("Service %s could not be resolved", tostring(name)))
	end

	local fn = (service :: any)[method]
	if type(fn) ~= "function" then
		error(string.format("Service method %s.%s is not callable", tostring(name), tostring(method)))
	end

	return fn(service, ...)
end

if cacheHost then
	cacheHost.__lt_service_resolver = __lt
end

return __lt
