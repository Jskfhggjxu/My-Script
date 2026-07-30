--!nonstrict

local build = "shared_hui_singleton_v4"
local patch = "luau_module_global_gethui_override_coregui_folder_v7"

type AnyTable = { [any]: any }
type PropertyMap = { [string]: any }


local okEnv, globalEnv = pcall(function()
	if type(getgenv) == "function" then
		return getgenv()
	end
end)

if not okEnv or type(globalEnv) ~= "table" then
	globalEnv = type(_G) == "table" and _G or {}
end

local sharedEnv
pcall(function()
	sharedEnv = shared
end)

if type(sharedEnv) ~= "table" then
	pcall(function()
		sharedEnv = rawget(_G, "shared")
	end)
end

local cacheKey = "__lt_ui_protector"
local cacheHosts: { AnyTable } = {}

local function addCacheHost(t)
	if type(t) ~= "table" then
		return
	end

	for i = 1, #cacheHosts do
		if cacheHosts[i] == t then
			return
		end
	end

	cacheHosts[#cacheHosts + 1] = t
end

addCacheHost(sharedEnv)
addCacheHost(globalEnv)

pcall(function()
	addCacheHost(_G)

	local gShared = rawget(_G, "shared")
	addCacheHost(gShared)
end)

local cacheHost = cacheHosts[1] or globalEnv

local function getCachedProtector()
	for i = 1, #cacheHosts do
		local env = cacheHosts[i]
		local ok, ret = pcall(rawget, env, cacheKey)
		if ok and type(ret) == "table" and rawget(ret, "ready") == true then
			return ret
		end
	end

	return nil
end

local cached = getCachedProtector()

if type(cached) == "table" and rawget(cached, "build") == build and rawget(cached, "patch") == patch then
	if type(cached.installGetHuiOverride) == "function" then
		pcall(cached.installGetHuiOverride)
	end
	return cached
end

if type(cached) == "table" then
	pcall(function()
		if type(cached.cleanup) == "function" then
			cached.cleanup()
		end
	end)

	pcall(function()
		if type(cached.restore) == "function" then
			cached.restore()
		end
	end)
end

local protector: AnyTable = {}

local state: AnyTable = {
	customHui = nil,
	screenGui = nil,
	rawHui = nil,
	heartbeat = nil,
	installed = false,
	last = 0,
	lastFull = 0,
	rate = 0.8,
	fullRate = 3,
	checkBudget = 8,
	connections = setmetatable({}, { __mode = "k" }),
	tracked = setmetatable({}, { __mode = "k" }),
	locked = setmetatable({}, { __mode = "k" }),
	descWatching = setmetatable({}, { __mode = "k" }),
	applying = setmetatable({}, { __mode = "k" }),
	pending = setmetatable({}, { __mode = "k" }),
	funcCache = {},
	localFuncs = {},
	nativeHuiFns = {},
	sessionNameProvider = nil,
	sessionNameMap = {},
	sessionNameCounter = 0,
	descQueue = {},
	descHead = 1,
	descTail = 0,
	descQueued = setmetatable({}, { __mode = "k" }),
	descPump = false,
}

local NIL_PARENT = {}
local startWatchdog

pcall(function()
	state.localFuncs.gethui = gethui
	state.localFuncs.gethiddenui = gethiddenui
	state.localFuncs.gethiddengui = gethiddengui
	state.localFuncs.get_hidden_ui = get_hidden_ui
	state.localFuncs.get_hidden_gui = get_hidden_gui
	state.localFuncs.cloneref = cloneref
	state.localFuncs.compareinstances = compareinstances
	state.localFuncs.setreadonly = setreadonly
	state.localFuncs.isreadonly = isreadonly
	state.localFuncs.protect_gui = protect_gui
	state.localFuncs.protectgui = protectgui
	state.localFuncs.protect_ui = protect_ui
	state.localFuncs.protectui = protectui
	state.localFuncs.getrenv = getrenv
end)

local function isInstance(v)
	return typeof(v) == "Instance"
end

local function tryCall(fn, ...)
	if type(fn) ~= "function" then
		return nil
	end

	local ok, ret = pcall(fn, ...)
	if ok then
		return ret
	end

	return nil
end

local function captureFunc(name)
	local v = state.localFuncs[name]

	if type(v) == "function" then
		return v
	end

	if type(globalEnv) == "table" then
		v = rawget(globalEnv, name)
		if type(v) == "function" then
			return v
		end
	end

	pcall(function()
		if type(_G) == "table" then
			v = rawget(_G, name)
		end
	end)

	if type(v) == "function" then
		return v
	end

	return nil
end

state.nativeHuiFns.gethui = captureFunc("gethui")
state.nativeHuiFns.gethiddenui = captureFunc("gethiddenui")
state.nativeHuiFns.gethiddengui = captureFunc("gethiddengui")
state.nativeHuiFns.get_hidden_ui = captureFunc("get_hidden_ui")
state.nativeHuiFns.get_hidden_gui = captureFunc("get_hidden_gui")

local function getFunc(name)
	local v = state.localFuncs[name]

	if type(v) == "function" then
		return v
	end

	if type(state.funcCache[name]) == "function" then
		return state.funcCache[name]
	end

	if type(globalEnv) == "table" then
		v = rawget(globalEnv, name)
		if type(v) == "function" then
			state.funcCache[name] = v
			return v
		end
	end

	pcall(function()
		if type(_G) == "table" then
			v = rawget(_G, name)
		end
	end)

	if type(v) == "function" then
		state.funcCache[name] = v
		return v
	end

	local gr = state.localFuncs.getrenv

	if type(gr) ~= "function" and type(globalEnv) == "table" then
		gr = rawget(globalEnv, "getrenv")
	end

	if type(gr) == "function" then
		local renv = tryCall(gr)
		if type(renv) == "table" then
			v = rawget(renv, name)
			if type(v) == "function" then
				state.funcCache[name] = v
				return v
			end
		end
	end

	return nil
end

function protector.has(name: string): boolean
	return type(getFunc(name)) == "function"
end

function protector.getFunction(name: string): any
	return getFunc(name)
end

local function cloneRef(v)
	local fn = getFunc("cloneref")

	if type(fn) == "function" and isInstance(v) then
		local ok, ret = pcall(fn, v)
		if ok and ret ~= nil then
			return ret
		end
	end

	return v
end

local function getService(name)
	local ok, ret = pcall(function()
		local fn = getFunc("cloneref")
		if type(fn) == "function" then
			return fn(game:GetService(name))
		end

		return game:GetService(name)
	end)

	if ok and isInstance(ret) then
		return ret
	end

	return nil
end

local function isA(v, class)
	if not isInstance(v) then
		return false
	end

	local ok, ret = pcall(function()
		return v:IsA(class)
	end)

	return ok and ret == true
end

local function sameInstance(a, b)
	if a == b then
		return true
	end

	local fn = getFunc("compareinstances")

	if type(fn) == "function" and isInstance(a) and isInstance(b) then
		local ok, ret = pcall(fn, a, b)
		if ok then
			return ret == true
		end
	end

	return false
end

local function getProperty(obj, prop)
	local ok, ret = pcall(function()
		return obj[prop]
	end)

	if ok then
		return ret
	end

	return nil
end

local function setProperty(obj, prop, val)
	pcall(function()
		obj[prop] = val
	end)
end

local function samePropertyValue(prop, cur, val)
	if prop == "Parent" then
		if val == NIL_PARENT or val == nil then
			return cur == nil
		end

		return isInstance(val) and sameInstance(cur, val)
	end

	return cur == val
end

local function isApplying(obj, prop)
	local props = state.applying[obj]
	return type(props) == "table" and props[prop] == true
end

local function setApplying(obj, prop, active)
	local props = state.applying[obj]

	if active then
		if not props then
			props = {}
			state.applying[obj] = props
		end

		props[prop] = true
	elseif props then
		props[prop] = nil

		if next(props) == nil then
			state.applying[obj] = nil
		end
	end
end

local function enforceTrackedProperty(obj, prop, val)
	if isApplying(obj, prop) then
		return
	end

	if prop == "Parent" and val ~= NIL_PARENT and val ~= nil and not isInstance(val) then
		return
	end

	local cur = getProperty(obj, prop)
	if samePropertyValue(prop, cur, val) then
		return
	end

	setApplying(obj, prop, true)
	setProperty(obj, prop, val == NIL_PARENT and nil or val)
	setApplying(obj, prop, false)
end

local function clearPending(obj, prop)
	local props = state.pending[obj]

	if props then
		props[prop] = nil

		if next(props) == nil then
			state.pending[obj] = nil
		end
	end
end

local function scheduleTrackedProperty(obj, prop)
	if isApplying(obj, prop) then
		return
	end

	local props = state.pending[obj]
	if not props then
		props = {}
		state.pending[obj] = props
	end

	if props[prop] then
		return
	end

	props[prop] = true
end

local function addConnection(obj, con)
	if not con then
		return
	end

	local list = state.connections[obj]
	if not list then
		list = {}
		state.connections[obj] = list
	end

	list[#list + 1] = con
end

local function naEnvList()
	local list = {globalEnv, cacheHost}

	pcall(function()
		if type(shared) == "table" then
			list[#list + 1] = shared
		end
	end)

	pcall(function()
		if type(_G) == "table" then
			list[#list + 1] = _G
			if type(rawget(_G, "shared")) == "table" then
				list[#list + 1] = rawget(_G, "shared")
			end
		end
	end)

	return list
end

local function naManage()
	local list = naEnvList()
	for i = 1, #list do
		local env = list[i]
		if type(env) == "table" then
			local direct = rawget(env, "NAmanage") or rawget(env, "__NAmanage")
			if type(direct) == "table" then
				return direct
			end

			local rootEnv = rawget(env, "__nameless_admin_private")
			local testEnv = type(rootEnv) == "table" and rawget(rootEnv, "testing") or nil
			local sharedState = type(testEnv) == "table" and rawget(testEnv, "shared") or nil
			local nested = type(sharedState) == "table" and (rawget(sharedState, "NAmanage") or rawget(sharedState, "__NAmanage")) or nil
			if type(nested) == "table" then
				return nested
			end
		end
	end

	return nil
end

local function qDesc(obj)
	if not isInstance(obj) then
		return {}
	end

	local mgr = naManage()
	if type(mgr) == "table" and type(mgr.qDesc) == "function" then
		local ok, res = pcall(mgr.qDesc, obj)
		if ok and type(res) == "table" then
			return res
		end
	end

	local desc = tryCall(function()
		return obj:QueryDescendants("Instance")
	end)

	if type(desc) == "table" then
		return desc
	end

	local legacyDesc = tryCall(function()
		return obj:GetDescendants()
	end)

	if type(legacyDesc) == "table" then
		return legacyDesc
	end

	return {}
end

local function bindDescAdd(obj, fn)
	if not isInstance(obj) or type(fn) ~= "function" then
		return false
	end

	local mgr = naManage()
	if type(mgr) == "table" and type(mgr.descAdd) == "function" then
		local ok, con = pcall(mgr.descAdd, obj, fn)
		if ok and con then
			addConnection(obj, con)
			return true
		end
	end

	local ok, con = pcall(function()
		return obj.DescendantAdded:Connect(fn)
	end)

	if ok and con then
		addConnection(obj, con)
		return true
	end

	return false
end

local function applyHardenDescendant(d, rename)
	if not isInstance(d) then
		return
	end

	if rename then
		pcall(function()
			d.Name = protector.randomString()
		end)
	end
end

local function packDescQueue()
	local out = {}
	local n = 0

	for i = state.descHead, state.descTail do
		local item = state.descQueue[i]
		if item ~= nil then
			n += 1
			out[n] = item
		end
	end

	state.descQueue = out
	state.descHead = 1
	state.descTail = n
end

local function processDescQueue()
	local t0 = os.clock()
	local n = 0

	while state.descHead <= state.descTail and n < 32 and os.clock() - t0 < 0.0015 do
		local item = state.descQueue[state.descHead]
		state.descQueue[state.descHead] = nil
		state.descHead += 1
		n += 1

		if type(item) == "table" then
			local inst = item.inst
			if isInstance(inst) then
				state.descQueued[inst] = nil
				applyHardenDescendant(inst, item.rename == true)
			end
		end
	end

	if state.descHead > 128 and state.descHead > state.descTail / 2 then
		packDescQueue()
	end

	if state.descHead > state.descTail then
		state.descQueue = {}
		state.descHead = 1
		state.descTail = 0
		state.descPump = false
	else
		state.descPump = true
	end
end

local function queueHardenDescendant(d, rename)
	if not isInstance(d) then
		return
	end

	if state.descQueued[d] then
		return
	end

	state.descQueued[d] = true
	state.descTail += 1
	state.descQueue[state.descTail] = {
		inst = d,
		rename = rename == true,
	}

	if not state.descPump then
		state.descPump = true
		processDescQueue()
	end

	if state.descPump and type(startWatchdog) == "function" then
		startWatchdog()
	end
end

local function getEnum(a, b)
	local ok, ret = pcall(function()
		return Enum[a][b]
	end)

	if ok then
		return ret
	end

	return nil
end

local function getPath(obj)
	if not isInstance(obj) then
		return nil
	end

	local ok, ret = pcall(function()
		return obj:GetFullName()
	end)

	if ok then
		return ret
	end

	return obj.ClassName
end

local function trackedCount()
	local n = 0

	for obj in state.tracked do
		if isInstance(obj) then
			n += 1
		end
	end

	return n
end

local function nextSessionKey(prefix)
	state.sessionNameCounter = (tonumber(state.sessionNameCounter) or 0) + 1
	return tostring(prefix or "session") .. ":" .. tostring(state.sessionNameCounter) .. ":" .. tostring(os.clock())
end

local function cursedString()
	local len = math.random(10, 20)
	local out = {}
	local marks = {"̶", "̷", "̸", "̹", "̺", "̻", "͓", "͔", "͘", "͜", "͞", "͟", "͢"}

	for i = 1, len do
		out[#out + 1] = string.char(math.random(32, 126))
		if math.random() < 0.5 then
			for _ = 1, math.random(1, 4) do
				out[#out + 1] = marks[math.random(#marks)]
			end
		end
	end

	if utf8 and type(utf8.char) == "function" and math.random() < 0.3 then
		out[#out + 1] = utf8.char(math.random(0x0300, 0x036F))
	end

	if math.random() < 0.1 then
		out[#out + 1] = string.rep("​", math.random(5, 20))
	end

	if utf8 and type(utf8.char) == "function" and math.random() < 0.2 then
		out[#out + 1] = utf8.char(0x202E)
	end

	return table.concat(out)
end

local function localSessionName(key)
	key = tostring(key or nextSessionKey("local"))
	local map = state.sessionNameMap
	if type(map) ~= "table" then
		map = {}
		state.sessionNameMap = map
	end

	local old = map[key]
	if type(old) == "string" and old ~= "" then
		return old
	end

	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-/__--"
	local len = math.random(18, 32)
	local out = {}

	for i = 1, len do
		local n = math.random(1, #chars)
		out[i] = chars:sub(n, n)
	end

	local ret = table.concat(out)
	map[key] = ret
	return ret
end

function protector.setSessionNameProvider(fn: any): boolean
	state.sessionNameProvider = type(fn) == "function" and fn or nil
	return state.sessionNameProvider ~= nil
end

function protector.getSessionInstanceName(key: any): string
	local fn = state.sessionNameProvider
	if type(fn) == "function" then
		local ok, ret = pcall(fn, key)
		if ok and type(ret) == "string" and ret ~= "" then
			return ret
		end
	end

	return localSessionName(key)
end

function protector.randomString(key: any): string
	local out = {}
	local sessionKey = key or nextSessionKey("random")
	local sess = protector.getSessionInstanceName(sessionKey)

	if type(sess) == "string" and sess ~= "" then
		out[#out + 1] = sess
	end

	local cursed = cursedString()
	if type(cursed) == "string" and cursed ~= "" then
		out[#out + 1] = cursed
	end

	out[#out + 1] = "\0"

	local ret = table.concat(out)
	if ret ~= "" then
		return ret
	end
	return "\0"
end

function protector.nativeProtect(obj: any): any
	if not isInstance(obj) then
		return obj
	end

	local names = {
		"protect_gui",
		"protectgui",
		"protect_ui",
		"protectui",
	}

	for i = 1, #names do
		local fn = getFunc(names[i])
		if type(fn) == "function" then
			pcall(fn, obj)
		end
	end

	return obj
end

function protector.setTableReadonly(tbl: any, value: any): any
	if type(tbl) ~= "table" then
		return tbl
	end

	local fn = getFunc("setreadonly")

	if type(fn) == "function" then
		pcall(fn, tbl, value ~= false)
	end

	return tbl
end

local function rawHui()
	local fns = {
		state.nativeHuiFns.gethui,
		state.nativeHuiFns.gethiddenui,
		state.nativeHuiFns.gethiddengui,
		state.nativeHuiFns.get_hidden_ui,
		state.nativeHuiFns.get_hidden_gui,
	}

	for i = 1, #fns do
		local ret = cloneRef(tryCall(fns[i]))
		if isInstance(ret) and not sameInstance(ret, state.customHui) and not sameInstance(ret, state.screenGui) then
			state.rawHui = ret
			return ret
		end
	end

	return state.rawHui
end

function protector.rawHuiGrabber(): Instance?
	return rawHui()
end

local function getPlayerGuiContainer()
	local players = getService("Players")
	local lp = isInstance(players) and cloneRef(players.LocalPlayer) or nil

	if isInstance(lp) then
		local pg = tryCall(function()
			return lp:FindFirstChildWhichIsA("PlayerGui")
		end)

		if isInstance(pg) then
			return pg
		end
	end

	return nil
end

local function isRobloxGuiName(obj)
	return isInstance(obj) and tostring(obj.Name or "") == "RobloxGui"
end

local function isAliasRoot(obj, coreGui)
	if not isInstance(obj) then
		return false
	end

	if isRobloxGuiName(obj) then
		return true
	end

	coreGui = isInstance(coreGui) and coreGui or getService("CoreGui")

	if isInstance(coreGui) and sameInstance(obj, coreGui) then
		return true
	end

	local class = obj.ClassName

	if class == "CoreGui" or class == "PlayerGui" or class == "StarterGui" then
		return true
	end

	return false
end

local function huiKind(obj)
	if not isInstance(obj) then
		return nil
	end

	local coreGui = getService("CoreGui")

	if isAliasRoot(obj, coreGui) then
		return "alias"
	end

	if isA(obj, "ScreenGui") then
		return "screen"
	end

	if isA(obj, "Folder") then
		return "folder"
	end

	if isA(obj, "BasePlayerGui") then
		return "root"
	end

	return "other"
end

function protector.getRawHuiKind(): string?
	return huiKind(rawHui())
end

function protector.getBaseParent(): Instance?
	local coreGui = getService("CoreGui")

	if isInstance(coreGui) then
		return coreGui
	end

	return getPlayerGuiContainer()
end

local function getFolderParent(parent)
	if isInstance(parent) then
		if isRobloxGuiName(parent) then
			local coreGui = getService("CoreGui")
			if isInstance(coreGui) then
				return coreGui
			end
			return parent
		end

		if parent.ClassName == "CoreGui" then
			return parent
		end

		if parent.ClassName == "PlayerGui" or parent.ClassName == "StarterGui" then
			return parent
		end

		if isA(parent, "BasePlayerGui") then
			return parent
		end
	end

	return protector.getBaseParent()
end

local sharedRootKey = "lt-ui-protector-shared-root-v2"
local roleAttr = "__lt_ui_protector_role"
local keyAttr = "__lt_ui_protector_key"
local roleHui = "hui"
local roleScreen = "screen"

local function markSharedContainer(obj, role)
	if not isInstance(obj) then
		return obj
	end

	pcall(function()
		obj:SetAttribute(roleAttr, role)
	end)

	pcall(function()
		obj:SetAttribute(keyAttr, sharedRootKey)
	end)

	return obj
end

local function isSharedContainer(obj, role)
	if not isInstance(obj) then
		return false
	end

	local okRole, gotRole = pcall(function()
		return obj:GetAttribute(roleAttr)
	end)

	local okKey, gotKey = pcall(function()
		return obj:GetAttribute(keyAttr)
	end)

	return okRole and okKey and gotRole == role and gotKey == sharedRootKey
end

local function findSharedContainer(parent, role, className)
	if not isInstance(parent) then
		return nil
	end

	local kids = tryCall(function()
		return parent:GetChildren()
	end)

	if type(kids) ~= "table" then
		return nil
	end

	local found

	for i = 1, #kids do
		local child = kids[i]
		if isInstance(child) and isA(child, className) and isSharedContainer(child, role) then
			if not found then
				found = child
			else
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end

	return found
end

startWatchdog = function()
	if state.heartbeat then
		return
	end

	local runService = getService("RunService")
	if not (isInstance(runService) and runService.Heartbeat) then
		return
	end

	state.heartbeat = runService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - state.last < state.rate then
			return
		end

		state.last = now

		if state.descHead <= state.descTail then
			processDescQueue()
		end

		local active = state.descHead <= state.descTail
		local full = now - state.lastFull >= state.fullRate
		local checked = 0

		if full then
			state.lastFull = now
		end

		for obj, cfg in state.tracked do
			if not isInstance(obj) or cfg.dead then
				state.tracked[obj] = nil
				state.locked[obj] = nil
				state.descWatching[obj] = nil
				state.applying[obj] = nil
				state.pending[obj] = nil
			else
				active = true

				local pend = state.pending[obj]
				if type(pend) == "table" then
					for prop in pend do
						enforceTrackedProperty(obj, prop, cfg.properties[prop])
						clearPending(obj, prop)
					end
				elseif full and checked < state.checkBudget then
					checked += 1

					for prop, val in cfg.properties do
						enforceTrackedProperty(obj, prop, val)
					end
				end
			end
		end

		if not active and state.heartbeat then
			pcall(function()
				state.heartbeat:Disconnect()
			end)

			state.heartbeat = nil
		end
	end)
end

function protector.lockInstance(obj: any, props: PropertyMap): any
	if not isInstance(obj) or type(props) ~= "table" then
		return obj
	end

	state.tracked[obj] = {
		properties = props,
		dead = false,
	}

	for prop, val in props do
		setApplying(obj, prop, true)
		setProperty(obj, prop, val == NIL_PARENT and nil or val)
		setApplying(obj, prop, false)
	end

	if not state.locked[obj] then
		state.locked[obj] = true

		for prop in props do
			local ok, sig = pcall(function()
				return obj:GetPropertyChangedSignal(prop)
			end)

			if ok and sig then
				addConnection(obj, sig:Connect(function()
					local cfg = state.tracked[obj]
					if not cfg or cfg.dead then
						return
					end

					scheduleTrackedProperty(obj, prop)
				end))
			end
		end

		pcall(function()
			addConnection(obj, obj.AncestryChanged:Connect(function()
				local cfg = state.tracked[obj]
				if not cfg or cfg.dead then
					return
				end

				scheduleTrackedProperty(obj, "Parent")
			end))
		end)

		pcall(function()
			addConnection(obj, obj.Destroying:Connect(function()
				local cfg = state.tracked[obj]
				if cfg then
					cfg.dead = true
				end

				state.tracked[obj] = nil
				state.locked[obj] = nil
				state.descWatching[obj] = nil
				state.applying[obj] = nil
				state.pending[obj] = nil
			end))
		end)
	end

	startWatchdog()
	return obj
end

function protector.harden(obj: any, opts: any): any
	if not isInstance(obj) then
		return obj
	end

	opts = type(opts) == "table" and opts or {}

	if opts.rename then
		pcall(function()
			obj.Name = protector.randomString()
		end)
	end

	if opts.deep then
		local desc = qDesc(obj)
		for i = 1, #desc do
			queueHardenDescendant(desc[i], opts.rename == true)
		end
	end

	if opts.watch and not state.descWatching[obj] then
		state.descWatching[obj] = true

		bindDescAdd(obj, function(d)
			queueHardenDescendant(d, opts.rename == true)
		end)
	end

	return obj
end

function protector.protectInstance(obj: any, opts: any): any
	if not isInstance(obj) then
		return nil
	end

	opts = type(opts) == "table" and opts or {}
	local props = {}

	local protectedName = nil
	if opts.renameRoot == true then
		protectedName = type(opts.name) == "string" and opts.name ~= "" and opts.name or protector.randomString(opts.nameKey)
		pcall(function()
			obj.Name = protectedName
		end)
		if opts.enforceName == true then
			props.Name = protectedName
		end
	end

	if opts.renameDescendants == true then
		local desc = qDesc(obj)
		for i = 1, #desc do
			queueHardenDescendant(desc[i], true)
		end
	end

	if opts.enforceParent == true then
		props.Parent = isInstance(opts.parent) and opts.parent or NIL_PARENT
	elseif isInstance(opts.parent) then
		props.Parent = opts.parent
	end

	if opts.watch == true and not state.descWatching[obj] then
		state.descWatching[obj] = true
		bindDescAdd(obj, function(d)
			queueHardenDescendant(d, opts.renameDescendants == true)
		end)
	end

	if opts.register ~= false and next(props) ~= nil then
		protector.lockInstance(obj, props)
	end

	return obj
end

function protector.protectCachedInternal(obj: any, opts: any): any
	opts = type(opts) == "table" and opts or {}
	opts.renameRoot = opts.renameRoot ~= false
	opts.renameDescendants = opts.renameDescendants == true
	opts.enforceParent = opts.enforceParent ~= false
	opts.parent = nil
	opts.enforceName = opts.enforceName == true

	return protector.protectInstance(obj, opts)
end

local function applyScreenDefaults(gui, opts)
	if not isInstance(gui) then
		return nil
	end

	opts = type(opts) == "table" and opts or {}
	local applyIgnoreGuiInset = opts.ignoreGuiInset ~= false
		and opts.IgnoreGuiInset ~= false
		and opts.forceIgnoreGuiInset ~= false
		and opts.enforceIgnoreGuiInset ~= false
		and opts.setIgnoreGuiInset ~= false

	pcall(function()
		gui.ResetOnSpawn = false
	end)

	if applyIgnoreGuiInset then
		pcall(function()
			gui.IgnoreGuiInset = true
		end)
	end

	pcall(function()
		gui.DisplayOrder = 2147483647
	end)

	pcall(function()
		gui.OnTopOfCoreBlur = true
	end)

	local z = getEnum("ZIndexBehavior", "Global")
	if z then
		pcall(function()
			gui.ZIndexBehavior = z
		end)
	end

	local s = getEnum("ScreenInsets", "None")
	if applyIgnoreGuiInset and s then
		pcall(function()
			gui.ScreenInsets = s
		end)
	end

	local a = getEnum("SafeAreaCompatibility", "None")
	if a then
		pcall(function()
			gui.SafeAreaCompatibility = a
		end)
	end

	pcall(function()
		gui.ClipToDeviceSafeArea = false
	end)

	pcall(function()
		gui.OnTopOfCoreBlur = true
	end)

	return gui
end

local function protectFolder(folder, parent, name)
	markSharedContainer(folder, roleHui)
	protector.nativeProtect(folder)

	return protector.lockInstance(folder, {
		Name = type(name) == "string" and name ~= "" and name or protector.randomString("hui"),
		Parent = parent,
	})
end

local function protectScreen(gui, parent, name)
	markSharedContainer(gui, roleScreen)
	applyScreenDefaults(gui)
	protector.nativeProtect(gui)

	return protector.lockInstance(gui, {
		Name = type(name) == "string" and name ~= "" and name or protector.randomString("screen"),
		Parent = parent,
	})
end

local function protectNativeScreen(gui)
	applyScreenDefaults(gui)
	protector.nativeProtect(gui)

	local par = getProperty(gui, "Parent")

	if isInstance(par) then
		protector.lockInstance(gui, {
			Parent = par,
		})
	end

	return gui
end

function protector.getCustomHui(parent: any): Instance?
	parent = getFolderParent(parent)

	if not isInstance(parent) then
		return nil
	end

	if isInstance(state.customHui) and sameInstance(state.customHui.Parent, parent) then
		markSharedContainer(state.customHui, roleHui)
		return state.customHui
	end

	local existing = findSharedContainer(parent, roleHui, "Folder")
	if isInstance(existing) then
		state.customHui = existing
		return protectFolder(existing, parent, existing.Name)
	end

	local folder = Instance.new("Folder")
	markSharedContainer(folder, roleHui)
	state.customHui = folder

	return protectFolder(folder, parent)
end

local function hasLayerCollectorAncestor(obj)
	local parent = getProperty(obj, "Parent")
	local guard = 0

	while isInstance(parent) and guard < 32 do
		if isA(parent, "LayerCollector") then
			return true
		end

		parent = getProperty(parent, "Parent")
		guard += 1
	end

	return false
end

local function getManagedScreenInHui(folder)
	if not isInstance(folder) then
		return nil
	end

	if isInstance(state.screenGui) and sameInstance(state.screenGui.Parent, folder) then
		markSharedContainer(state.screenGui, roleScreen)
		return state.screenGui
	end

	local existing = findSharedContainer(folder, roleScreen, "ScreenGui")
	if isInstance(existing) then
		state.screenGui = existing
		return protectScreen(existing, folder, existing.Name)
	end

	local gui = Instance.new("ScreenGui")
	markSharedContainer(gui, roleScreen)
	state.screenGui = gui

	return protectScreen(gui, folder)
end

local function releaseLegacyScreen(screen)
	if not (isInstance(screen) and isA(screen, "ScreenGui")) then
		return
	end

	if sameInstance(state.screenGui, screen) then
		state.screenGui = nil
	end

	if sameInstance(state.rawHui, screen) then
		state.rawHui = screen
	end

	return screen
end

local function absorbScreenHui(screen)
	if not (isInstance(screen) and isA(screen, "ScreenGui")) then
		return nil
	end

	local folder = protector.getCustomHui(screen)
	if not isInstance(folder) then
		return nil
	end

	local managedScreen = nil

	for _ = 1, 4 do
		local kids = tryCall(function()
			return screen:GetChildren()
		end)

		if type(kids) ~= "table" or #kids <= 0 then
			break
		end

		for i = 1, #kids do
			local child = kids[i]
			if isInstance(child) and not sameInstance(child, folder) then
				local target = folder
				if not isA(child, "LayerCollector") and not hasLayerCollectorAncestor(folder) then
					managedScreen = managedScreen or getManagedScreenInHui(folder)
					target = isInstance(managedScreen) and managedScreen or folder
				end

				setProperty(child, "Parent", target)
			end
		end
	end

	releaseLegacyScreen(screen)
	return folder
end

function protector.huiGrabber(): Instance?
	local hidden = protector.rawHuiGrabber()
	local kind = huiKind(hidden)

	if isInstance(hidden) then
		if kind == "screen" then
			return absorbScreenHui(hidden)
		end

		if kind == "folder" then
			return hidden
		end

		if kind == "root" then
			return hidden
		end

		if kind == "alias" then
			return protector.getCustomHui(hidden)
		end

		return hidden
	end

	return protector.getCustomHui()
end

function protector.getScreenGui(name: any): Instance?
	local hidden = protector.huiGrabber()

	if isInstance(hidden) and isA(hidden, "ScreenGui") then
		state.screenGui = hidden
		return hidden
	end

	if not isInstance(hidden) then
		return nil
	end

	if isInstance(state.screenGui) and sameInstance(state.screenGui.Parent, hidden) then
		markSharedContainer(state.screenGui, roleScreen)
		return state.screenGui
	end

	local existing = findSharedContainer(hidden, roleScreen, "ScreenGui")
	if isInstance(existing) then
		state.screenGui = existing
		return protectScreen(existing, hidden, existing.Name)
	end

	local gui = Instance.new("ScreenGui")
	markSharedContainer(gui, roleScreen)
	state.screenGui = gui

	return protectScreen(gui, hidden, name)
end

function protector.resolveParent(opts: any): Instance?
	opts = type(opts) == "table" and opts or {}

	local fromResolver = tryCall(opts.parentResolver)
	if isInstance(fromResolver) then
		return fromResolver
	end

	if isInstance(opts.parent) then
		return cloneRef(opts.parent)
	end

	local hidden = protector.huiGrabber()
	if isInstance(hidden) then
		return hidden
	end

	return protector.getCustomHui()
end

function protector.parent(): Instance?
	return protector.huiGrabber()
end

function protector.protectUI(gui: any, opts: any): any
	if not isInstance(gui) then
		return nil
	end

	opts = type(opts) == "table" and opts or {}

	protector.nativeProtect(gui)

	if isA(gui, "ScreenGui") then
		applyScreenDefaults(gui, opts)

		local target = protector.resolveParent(opts)
		if not isInstance(target) then
			return nil
		end

		if sameInstance(gui, target) then
			return protectNativeScreen(gui)
		end

		local props = {
			Parent = target,
		}

		if not opts.keepName then
			props.Name = type(opts.name) == "string" and opts.name ~= "" and opts.name or protector.randomString()
		end

		protector.lockInstance(gui, props)

		if opts.harden == true then
			protector.harden(gui, {
				deep = opts.deep == true,
				watch = opts.watch == true,
				rename = opts.rename == true,
			})
		end

		return gui
	end

	local target = protector.getScreenGui()
	if not isInstance(target) then
		return nil
	end

	local props = {
		Parent = target,
	}

	if opts.lockName == true then
		props.Name = type(opts.name) == "string" and opts.name ~= "" and opts.name or protector.randomString()
	end

	protector.lockInstance(gui, props)

	if opts.harden == true then
		protector.harden(gui, {
			deep = opts.deep == true,
			watch = opts.watch == true,
			rename = opts.rename == true,
		})
	end

	return gui
end

function protector.protectName(obj: any, prop: any): any
	if not isInstance(obj) then
		return nil
	end

	pcall(function()
		obj[prop or "Name"] = protector.randomString()
	end)

	return obj
end

function protector.installGetHuiOverride(): boolean
	local function customGetHui()
		return protector.huiGrabber()
	end

	local installed = false
	local names = {
		"gethui",
		"gethiddenui",
		"gethiddengui",
		"get_hidden_ui",
		"get_hidden_gui",
	}

	pcall(function()
		gethui = customGetHui
		gethiddenui = customGetHui
		gethiddengui = customGetHui
		get_hidden_ui = customGetHui
		get_hidden_gui = customGetHui
		installed = true
	end)

	local function apply(env)
		if type(env) ~= "table" then
			return false
		end

		for i = 1, #names do
			rawset(env, names[i], customGetHui)
		end

		return true
	end

	local okGenv = false
	local okG = false

	pcall(function()
		if type(getgenv) == "function" then
			okGenv = apply(getgenv()) == true
		end
	end)

	if not okGenv then
		local okApply, applied = pcall(apply, _G)
		okG = okApply and applied == true
	else
		pcall(apply, _G)
	end

	state.installed = installed or okGenv or okG

	pcall(function()
		protector.getHuiOverrideInstalled = state.installed
	end)

	return state.installed
end

function protector.install(): boolean
	return protector.installGetHuiOverride()
end

function protector.restore(): ()
	local native = state.nativeHuiFns
	local names = {
		gethui = native.gethui,
		gethiddenui = native.gethiddenui,
		gethiddengui = native.gethiddengui,
		get_hidden_ui = native.get_hidden_ui,
		get_hidden_gui = native.get_hidden_gui,
	}

	pcall(function()
		gethui = native.gethui
		gethiddenui = native.gethiddenui
		gethiddengui = native.gethiddengui
		get_hidden_ui = native.get_hidden_ui
		get_hidden_gui = native.get_hidden_gui
	end)

	local function apply(env)
		if type(env) ~= "table" then
			return
		end

		for name, fn in names do
			rawset(env, name, fn)
		end
	end

	pcall(function()
		if type(getgenv) == "function" then
			apply(getgenv())
		else
			apply(_G)
		end
	end)
	pcall(apply, _G)

	state.installed = false

	pcall(function()
		protector.getHuiOverrideInstalled = false
	end)
end

function protector.cleanup(obj: any?): ()
	if isInstance(obj) then
		local list = state.connections[obj]

		if list then
			for i = 1, #list do
				pcall(function()
					list[i]:Disconnect()
				end)

				list[i] = nil
			end
		end

		state.connections[obj] = nil
		state.tracked[obj] = nil
		state.locked[obj] = nil
		state.descWatching[obj] = nil
		state.descQueued[obj] = nil
		state.applying[obj] = nil
		state.pending[obj] = nil

		if trackedCount() <= 0 and state.heartbeat then
			pcall(function()
				state.heartbeat:Disconnect()
			end)

			state.heartbeat = nil
		end

		return
	end

	for object, list in state.connections do
		for i = 1, #list do
			pcall(function()
				list[i]:Disconnect()
			end)

			list[i] = nil
		end

		state.connections[object] = nil
	end

	for object in state.tracked do
		state.tracked[object] = nil
	end

	for object in state.locked do
		state.locked[object] = nil
	end

	for object in state.descWatching do
		state.descWatching[object] = nil
	end

	for object in state.applying do
		state.applying[object] = nil
	end

	for object in state.pending do
		state.pending[object] = nil
	end

	state.descQueue = {}
	state.descHead = 1
	state.descTail = 0
	state.descQueued = setmetatable({}, { __mode = "k" })
	state.descPump = false

	if state.heartbeat then
		pcall(function()
			state.heartbeat:Disconnect()
		end)

		state.heartbeat = nil
	end
end

function protector.destroy(): ()
	protector.cleanup()
	protector.restore()

	pcall(function()
		if isInstance(state.screenGui) then
			local raw = rawHui()
			if not sameInstance(state.screenGui, raw) then
				state.screenGui:Destroy()
			end
		end
	end)

	pcall(function()
		if isInstance(state.customHui) then
			state.customHui:Destroy()
		end
	end)

	state.screenGui = nil
	state.customHui = nil
end

function protector.support(): AnyTable
	local names = {
		"gethui",
		"gethiddenui",
		"gethiddengui",
		"get_hidden_ui",
		"get_hidden_gui",
		"cloneref",
		"compareinstances",
		"setreadonly",
		"isreadonly",
		"protect_gui",
		"protectgui",
		"protect_ui",
		"protectui",
	}

	local result = {}

	for i = 1, #names do
		result[names[i]] = protector.has(names[i])
	end

	return result
end

function protector.status(): AnyTable
	local raw = rawHui()
	local parent = protector.huiGrabber()
	local screen = protector.getScreenGui()

	return {
		build = build,
		patch = patch,
		raw = raw,
		rawClass = isInstance(raw) and raw.ClassName or nil,
		rawKind = huiKind(raw),
		rawPath = getPath(raw),
		parent = parent,
		parentClass = isInstance(parent) and parent.ClassName or nil,
		parentKind = huiKind(parent),
		parentPath = getPath(parent),
		screen = screen,
		screenClass = isInstance(screen) and screen.ClassName or nil,
		screenPath = getPath(screen),
		installed = state.installed,
		tracked = trackedCount(),
		support = protector.support(),
	}
end

protector.ready = true
protector.build = build
protector.patch = patch

pcall(function()
	protector.installGetHuiOverride()
end)

for i = 1, #cacheHosts do
	pcall(rawset, cacheHosts[i], cacheKey, protector)
end

protector.setTableReadonly(protector, true)

return protector
