--!optimize 2
--[[
	FDless reanimate by MyWorld
	From Patchma Hub
	Version 61E (E is only here cuz it edited)
	
	MyWorld will forever stay in our hearts
	
	HAX server: discord.gg/QMy5f6DrbH
]]

--[[
	FDless + Uhhhhhh hatmap 合并版
	────────────────────────────────────────────────────────
	内容：
	  1) FDless 本体（作者 MyWorld / Patchma Hub，版本 61E）
	  2) d_hatsmap.lua 的 HatMeshDatabase + HatNameDatabase 合并进 accessorylimbs
	     （Immortality Lord 那段按要求未搬）
	  3) HttpGet 重定向钩子：别的脚本 HttpGet FDless 时直接拿到本文件
	  4) 防重复执行：同一时刻只有一个实例在跑，新实例会先 stop 掉旧的

	用法（和原版 FDless 完全一致，本文件是库，不会自己启动）：
	  local lib = loadstring(game:HttpGet(URL))()
	  lib.reanimate()

	调试：
	  getgenv().FDlessMergedInfo()   -- 看当前会话
	  getgenv().FDlessMergedKill()   -- 强制停掉
]]

-- ===== HttpGet 重定向（原文见 FDless_hook.lua）=====
-- 在别的脚本 HttpGet FDless 时把内容换成本文件；同一环境只装一次
do
	local __HKEY="__FDlessHookInstalled_m1"
	local __G=getgenv and getgenv() or _G
	if not __G[__HKEY] then
		__G[__HKEY]=true
		local function __installFDlessHook()
			-- 本段原为独立的 FDless_hook.lua，现已并入本文件，加载时自动安装

			local MATCH   = "FDless"        -- URL 里包含这串就劫持（严格大小写，按需修改）
			local LOCAL   = {               -- 找替换内容：先本地文件
				"FDless_merged.lua",
				"/storage/emulated/0/Delta/Workspace/FDless_merged.lua",
				"FDless_merged_min.lua",
				"/storage/emulated/0/Delta/Workspace/FDless_merged_min.lua",
			}
			local MIRROR  = "https://raw.githubusercontent.com/Jskfhggjxu/My-Script/main/Loadstring/FDless_merged_min.lua" -- 兜底镜像（本地文件都没有时才用）
			local VERBOSE = true

			local function log(...)
				if VERBOSE then print("[FDlessHook]", ...) end
			end

			local cached = nil
			local function getSource(url)
				if cached then return cached end
				for _, p in ipairs(LOCAL) do
					local ok, d = pcall(readfile, p)
					if ok and type(d) == "string" and #d > 1000 then
						cached = d
						log("命中本地文件:", p, #d .. " bytes")
						return d
					end
				end
				if MIRROR ~= "" then
					local ok, d = pcall(function() return game:HttpGetAsync(MIRROR) end)
					if ok and type(d) == "string" and #d > 1000 then
						cached = d
						log("命中镜像:", MIRROR, #d .. " bytes")
						return d
					end
				end
				return nil
			end

			local function isTarget(u)
				return type(u) == "string" and string.find(u, MATCH, 1, true) ~= nil
			end

			local hooked = 0

			-- 1) game:HttpGet / game:HttpGetAsync
			local function hookMethod(name)
				local ok, orig = pcall(function() return game[name] end)
				if not ok or type(orig) ~= "function" then return end
				local wrapper
				wrapper = function(self, url, ...)
					if isTarget(url) then
						local src = getSource(url)
						if src then return src end
						if VERBOSE then warn("[FDlessHook] 没拿到替换内容，放行原 URL: " .. tostring(url)) end
					end
					return orig(self, url, ...)
				end
				local done = pcall(function() game[name] = wrapper end)
				if not (done and rawget ~= nil and game[name] == wrapper) then
					if type(hookfunction) == "function" then
						done = pcall(hookfunction, orig, wrapper)
					end
				end
				if done then
					hooked = hooked + 1
					log("已 hook game:" .. name)
				end
			end
			hookMethod("HttpGet")
			hookMethod("HttpGetAsync")

			-- 2) 全局同名函数（有些脚本用裸 HttpGet / getgenv().HttpGet）
			local genv = getgenv and getgenv() or _G
			for _, n in ipairs({ "HttpGet", "HttpGetAsync", "httpget", "httpget_async" }) do
				local f = genv[n]
				if type(f) == "function" then
					genv[n] = function(url, ...)
						if isTarget(url) then
							local src = getSource(url)
							if src then return src end
						end
						return f(url, ...)
					end
					hooked = hooked + 1
					log("已 hook getgenv()." .. n)
				end
			end

			-- 3) request 家族（返回 {StatusCode=200, Body=源码} 的假响应）
			local function hookRequest(tbl, n)
				if type(tbl) ~= "table" or type(tbl[n]) ~= "function" then return end
				local orig = tbl[n]
				local ok = pcall(function()
					tbl[n] = function(opts, ...)
						if type(opts) == "table" and isTarget(opts.Url or opts.url) then
							local src = getSource(opts.Url or opts.url)
							if src then
								return {
									StatusCode = 200, StatusMessage = "OK",
									Headers = {}, Body = src, Success = true,
								}
							end
						end
						return orig(opts, ...)
					end
				end)
				if ok then
					hooked = hooked + 1
					log("已 hook " .. n)
				end
			end
			hookRequest(genv, "request")
			hookRequest(genv, "http_request")
			hookRequest(genv, "http_request_async")
			for _, lib in ipairs({ "syn", "fluxus", "http", "krnl", "http_request" }) do
				local ok, t = pcall(require, lib)
				if ok and type(t) == "table" then hookRequest(t, "request") end
				if type(genv[lib]) == "table" then hookRequest(genv[lib], "request") end
			end

			-- 4) 兜底：如果对方是先 loadstring 再执行，顺手把源码里的旧 URL 换掉（明文才行）
			local oldLoad = loadstring
			if type(oldLoad) == "function" then
				genv.loadstring = function(src, chunk, ...)
					if type(src) == "string" and string.find(src, "raw.githubusercontent.com", 1, true) then
						-- 只做提醒，不偷偷改写，避免破坏混淆脚本的校验
						if VERBOSE then log("检测到 loadstring 里有 GitHub raw 引用") end
					end
					return oldLoad(src, chunk, ...)
				end
			end

			log(hooked > 0 and ("装好了，共 " .. hooked .. " 个入口") or "没找到任何可 hook 的入口")
		end
		local __ok,__err=pcall(__installFDlessHook)
		if not __ok then
			__G[__HKEY]=nil
			warn("[FDlessHook] 安装失败: "..tostring(__err))
		end
	end
end

-- ===== 防重复执行：会话登记表 =====
-- FDless 这个库每被 loadstring 一次就是一个独立实例，各自的连接/假部件互不知情，
-- 同时跑两个 = 双重心跳循环 + 双重焊接。这里用 getgenv 里的共享登记表来串起来。
local SESSION_KEY="FDlessMerged"
local SESSION_VERSION="hatmap-m1"

--no need to get and index the library tables with function names every time the script uses them
local osclock=os.clock
local tspawn=task.spawn
local twait=task.wait
local schar=string.char
local ssub=string.sub
local sfind=string.find
local supper=string.upper
local mrandom=math.random
local sin=math.sin
local cos=math.cos
local abs=math.abs
local min=math.min
local clamp=math.clamp
local sqrt=math.sqrt
local tinsert=table.insert
local tremove=table.remove
local tclear=table.clear
local tclone=table.clone
local tfind=table.find
local tconcat=table.concat
local vmagnitude=vector.magnitude --faster than indexing with Magnitude
local vnormalize=vector.normalize --faster than indexing with Unit

--the script doesnt have to read global varaibles every time to get them
--why not have them saved in local varaibles for faster access times
local next=next
local pcall=pcall
local xpcall=xpcall
local type=type
local typeof=typeof
local game=game
local sethiddenproperty=sethiddenproperty or set_hidden_property or set_hidden_prop or sethiddenprop
local setscriptable=setscriptable
local replicatesignal=replicatesignal
local cloneref=cloneref or function(...) return ... end

local i=Instance.new
local ife=Instance.fromExisting
local ih=InstanceHandle.new
local u2=UDim2.new
local v2=Vector2.new
local v3=vector.create
local c3=Color3.new 
local cf=CFrame.new
local cfl=CFrame.lookAt
local angles=CFrame.fromEulerAngles --faster than .Angles
local e=Enum 
local rp=RaycastParams.new
local pp=PhysicalProperties.new

local sine=osclock()
local deltaTime=0
local v3_0=v3(0,0,0)
local v3_101=v3(1,0,1)
local v3_010=v3(0,1,0)
local cf_0=cf()
local v3_xz=v3_101*10
local v3_xzL=v3_101*250.1
local v3_net=v3_010*25.01

--not "local function rs" to not assign debug names
--table.concat is much faster than string interpolation
local rs=@native function()
	local t={}
	for i=1,mrandom(8,15) do
		t[i]=schar(mrandom(2)==2 and mrandom(65,90) or mrandom(97,122))
	end
	return tconcat(t)
end

--it runs even faster if u call __index and __newindex metamethods directly
local getMetamethodFromErrorStack=function(userdata,f,test)
	local ret=nil
	xpcall(f,function()
		ret=debug.info(2,"f")
	end,userdata,nil,0)
	if (type(ret)~="function") or not test(ret) then
		return f
	end
	return ret
end
local insSet=getMetamethodFromErrorStack(game,function(a,b,c) a[b]=c end,function(f) local a=i("Folder") local b=rs() f(a,"Name",b) return a.Name==b end)
local insGet=getMetamethodFromErrorStack(game,function(a,b) return a[b] end,function(f) local a=i("Folder") local b=rs() a.Name=b return f(a,"Name")==b end)
local eGet=getMetamethodFromErrorStack(e,@native function(a,b) return a[b] end,function(f) return e.Material==f(e,"Material") end)
local etGet=getMetamethodFromErrorStack(eGet(e,"Material"),@native function(a,b) return a[b] end,function(f) local t=eGet(e,"Material") return t.Neon==f(t,"Neon") end)
local cfGet=getMetamethodFromErrorStack(cf_0,@native function(a,b) return a[b] end,function(f) return f(cf(1,2,3),"Position")==v3(1,2,3) end)
local cfMul=getMetamethodFromErrorStack(cf_0,@native function(a,b) return a*b end,function(f) return angles(1,2,3)*angles(1,2,3)==f(angles(1,2,3),angles(1,2,3)) end)
local cfAdd=getMetamethodFromErrorStack(cf_0,@native function(a,b) return a+b end,function(f) return cf(1,2,3)+v3(1,2,3)==f(cf(1,2,3),v3(1,2,3)) end)
local v3Get=getMetamethodFromErrorStack(v3_0,@native function(a,b) return a[b] end,function(f) return v3(1,2,3).Unit==f(v3(1,2,3),"Unit") end)
local v2Get=getMetamethodFromErrorStack(v2(),@native function(a,b) return a[b] end,function(f) return f(v2(1,2),"Y")==2 end)
--multiplying and adding vector3 is faster if you use the * and + operators
--its faster to multiply X and Y of vector2 than to multiply vector2 and then get X and Y from it

--no need to index instances every time to call their functions
local ClearAllChildren=insGet(game,"ClearAllChildren")
local Destroy=insGet(game,"Destroy")
local IsA=insGet(game,"IsA")
local FindFirstChildOfClass=insGet(game,"FindFirstChildOfClass")
local FindFirstChildWhichIsA=insGet(game,"FindFirstChildWhichIsA")
local GetChildren=insGet(game,"GetChildren")
local QueryDescendants=insGet(game,"QueryDescendants")
local IsDescendantOf=insGet(game,"IsDescendantOf")
local GetPropertyChangedSignal=insGet(game,"GetPropertyChangedSignal")

--findfirstchildofclass faster than getservice
local plrs=cloneref(FindFirstChildOfClass(game,"Players"))
local rus=cloneref(FindFirstChildOfClass(game,"RunService"))
local ws=cloneref(FindFirstChildOfClass(game,"Workspace"))
local uis=cloneref(FindFirstChildOfClass(game,"UserInputService"))
local gs=cloneref(FindFirstChildOfClass(game,"GuiService"))
local sg=cloneref(FindFirstChildOfClass(game,"StarterGui"))
local cg=FindFirstChildOfClass(game,"CoreGui")
local terrain=insGet(ws,"Terrain")
local lp=insGet(plrs,"LocalPlayer")
local pg=FindFirstChildOfClass(lp,"PlayerGui")
local mouse=insGet(lp,"GetMouse")(lp)
local preanimation=insGet(rus,"PreAnimation")
local heartbeat=insGet(rus,"Heartbeat")
local renderstepped=insGet(rus,"RenderStepped")
local stepped=insGet(rus,"Stepped")

local BreakJoints
local ChangeState
local SetStateEnabled
do
	local model,hum=i("Model"),i("Humanoid")
	BreakJoints=insGet(model,"BreakJoints")
	ChangeState=insGet(hum,"ChangeState")
	SetStateEnabled=insGet(hum,"SetStateEnabled")
	Destroy(model)
	Destroy(hum)
end
local IsGrounded=insGet(terrain,"IsGrounded")
local GetJoints=insGet(terrain,"GetJoints")
local GetPlayers=insGet(plrs,"GetPlayers")
local SetCoreGuiEnabled=insGet(sg,"SetCoreGuiEnabled")
local GetCoreGuiEnabled=insGet(sg,"GetCoreGuiEnabled")
local Raycast=insGet(ws,"Raycast")
local Connect=heartbeat.Connect
local Disconnect=Connect(GetPropertyChangedSignal(game,"CreatorId"),type).Disconnect
local Wait=heartbeat.Wait
local GetMouseLocation=insGet(uis,"GetMouseLocation")
local GetFocusedTextBox=insGet(uis,"GetFocusedTextBox")
local GetMouseDelta=insGet(uis,"GetMouseDelta")
local IsMouseButtonPressed=insGet(uis,"IsMouseButtonPressed")
local IsKeyDown=insGet(uis,"IsKeyDown")

local Inverse=cfGet(cf_0,"Inverse")
local Lerp=cfGet(cf_0,"Lerp")
local ToEulerAnglesYXZ=cfGet(cf_0,"ToEulerAnglesYXZ")

local accessorylimbs={
	{meshid="117287001096396",C0=cf_0,Name="Left Arm"},
	{meshid="117287001096396",C0=cf_0,Name="Right Arm"},

	{meshid="90736849096372",C0=angles(0,0,1.5707963267948966),Name="Left Arm"},
	{meshid="105141400603933",C0=angles(0,0,1.5707963267948966),Name="Right Arm"},

	{meshid="11263221350",textureid="11263219250",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
	{meshid="11159370334",textureid="11159284657",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

	{meshid="14255522247",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
	{meshid="14255522247",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

	{meshid="17374767929",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
	{meshid="17374767929",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

	{meshid="12344207333",C0=angles(2,0,0),Name="Left Arm"},
	{meshid="12344206657",C0=angles(2,0,0),Name="Right Arm"},

	{meshid="13831073174",C0=cf(0.017,0,-0.23)*angles(-1.4835298641951802,-0.15707963267948966,2.199114857512855),Name="Left Arm"},
	{meshid="13839903766",C0=cf(0,-0.62,-0.01)*angles(1.6580627893946132,0.15707963267948966,-2.199114857512855),Name="Right Arm"},

	{meshid="121304376791439",C0=cf_0,Name="Left Leg"},
	{meshid="121304376791439",C0=cf_0,Name="Right Leg"},

	{meshid="11159370334",textureid="11159285454",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
	{meshid="12652772399",textureid="12652775021",C0=cf(0,-0.125,0),Name="Right Leg"},

	{meshid="14768684979",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
	{meshid="14768684979",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},

	{meshid="17387586286",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
	{meshid="17387586286",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Leg"},
	
	{meshid="18640899369",C0=cf_0,Name="Torso"},
	{meshid="18640901641",C0=cf_0,Name="Left Leg"},
	{meshid="18640901641",C0=cf_0,Name="Right Leg"},
	{meshid="18640914129",C0=cf_0,Name="Left Arm"},
	{meshid="18640914129",C0=cf_0,Name="Right Arm"},
	
	{meshid="90736849096372",textureid="79186624401216",C0=cf_0,Name="Right Arm"},
	{meshid="105141400603933",textureid="71060417496309",C0=cf_0,Name="Left Arm"},
	{meshid="99608462237958",textureid="130809869695496",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},
	{meshid="139733645770094",textureid="130809869695496",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
	
	{meshid="110684113028749",textureid="70661572547971",C0=cf_0,Name="Torso"},
	{meshid="125405780718494",textureid="136752500636691",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},
	{meshid="125405780718494",textureid="136752500636691",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
	{meshid="125405780718494",textureid="136752500636691",C0=angles(0,0,1.5707963267948966),Name="Right Arm"},
	{meshid="125405780718494",textureid="136752500636691",C0=angles(0,0,1.5707963267948966),Name="Left Arm"},
	
	{meshid="126825022897778",C0=cf_0,Name="Torso"},
	{textureid="135650240593878",C0=angles(0,0,1.5707963267948966),Name="Right Arm"},
	{textureid="135650240593878",C0=angles(0,0,1.5707963267948966),Name="Left Arm"},
	{textureid="73798034827573",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},
	{textureid="73798034827573",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
	
	{meshid="14768666349",C0=cf_0,Name="Torso"},
	{meshid="14241018198",C0=cf_0,Name="Torso"},
	{meshid="13421774668",C0=cf_0,Name="Torso"},
	{meshid="110684113028749",C0=cf_0,Name="Torso"},
	{meshid="127552124837034",C0=angles(0,0,1.5707963267948966),Name="Torso"},

	{meshid="3030546036",C0=cfMul(angles(-1.5271630954950384,-1.5707963267948966,0),cf(0.05,0.2,0)),Name="Right Arm"},
	{meshid="3030546036",C0=cfMul(angles(-1.5271630954950384,1.5707963267948966,0),cf(-0.05,0.2,0)),Name="Left Arm"},
	{meshid="3030546036",C0=cfMul(angles(-1.5707963267948966,-1.5707963267948966,0),cf(-0.1,0.25,0)),Name="Right Leg"},
	{meshid="3030546036",C0=cfMul(angles(-1.5707963267948966,1.5707963267948966,0),cf(0.1,0.25,0)),Name="Left Leg"},
	{meshid="4819720316",textureid="4819722776",C0=angles(0,0,0.2617993877991494),Name="Torso"},
	
	{meshid="139792224823925",C0=cf_0,Name="Torso"},
	{meshid="105263225400272",C0=angles(0,0,1.5707963267948966),Name="Right Arm"},
	{meshid="105263225400272",C0=angles(0,0,1.5707963267948966),Name="Left Arm"},
	{meshid="83395427313429",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},
	{meshid="83395427313429",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
	
	{textureid="97155254696037",C0=angles(1.7671458676442586,-0.16580627893946132,0.39269908169872414),Name="Right Arm"},
	{textureid="82390202293774",C0=angles(1.7671458676442586,0.16580627893946132,-0.39269908169872414),Name="Left Arm"},
	{textureid="93374633946646",C0=angles(1.7802358370342162,0.1832595714594046,-0.3839724354387525),Name="Right Leg"},
	{textureid="133680105074740",C0=angles(1.7802358370342162,-0.1832595714594046,0.3839724354387525),Name="Left Leg"},


	-- ===== 由 d_hatsmap.lua 的 HatMeshDatabase 自动合并（已跳过 Immortality Lord 那段）=====
	{meshid="11601535857",C0=angles(0,3.14,0),Name="Head"},
	{meshid="13953153289",C0=cf_0,Name="Head"},
	{meshid="12410145311",C0=cf(0,-0.6,0),Name="Head",attachments={HatAttachment=cf(0,0.67,0)}},
	{meshid="125405780718494",C0=angles(1.57,0,1.57),Name="Left Arm"},
	{meshid="125405780718494",C0=angles(1.57,0,1.57),Name="Left Leg"},
	{meshid="13953154391",C0=cf_0,Name="Head"},
	{meshid="13778226115",C0=cf_0,Name="Torso"},
	{meshid="11159370334",textureid="11159284657",C0=angles(1.57,0,1.57),Name="Left Leg"},
	{meshid="11263221350",textureid="11263219250",C0=angles(-1.57,0,1.57),Name="Right Leg"},
	{meshid="13058343355",C0=angles(0,3.14,0),Name="Head"},
	{meshid="139733645770094",C0=angles(0,0,1.57),Name="Left Leg"},
	{meshid="99608462237958",C0=angles(0,0,1.57),Name="Right Leg"},
	{meshid="13953094351",C0=cf_0,Name="Head"},
	{meshid="13058309233",C0=angles(0,3.14,0),Name="Head"},
	{meshid="18640899369",textureid="18640899481",C0=cf_0,Name="Torso"},
	{meshid="18640914129",textureid="18640914168",C0=cf_0,Name="Left Arm"},
	{meshid="18640901641",textureid="18640901676",C0=cf_0,Name="Left Leg"},
	{meshid="4154474745",C0=angles(1.57,0,0),Name="Block"},
	{meshid="4324138105",C0=angles(1.57,0,0),Name="Block"},
	{meshid="117554824897780",C0=angles(0,3.14,0),Name="Right Arm"},
	{meshid="123388937940630",C0=angles(0,3.14,0),Name="Left Arm"},
	{meshid="136378854630150",C0=angles(0,3.14,0),Name="Right Arm"},
	{meshid="18989397242",C0=angles(0,3.14,0),Name="Left Arm"},
	{meshid="119861389229755",C0=cf_0,Name="Torso"},
}


-- 部件名匹配表（来自 d_hatsmap.lua 的 HatNameDatabase）
-- 有些 rig 的帽子部件本身就叫 "Accessory (LARM)" 这种，没有可用的 meshid，只能按名字认
-- 语义同原项目：名字精确匹配（忽略大小写），优先级在 mesh 表之前
local hatnamelimbs={}
local hatnamedups={}
do
	local src={
		{Name="Left Arm",Match="Accessory (LARM)",C0=angles(0,0,1.57)},
		{Name="Right Arm",Match="Accessory (RARM)",C0=angles(0,0,1.57)},
		{Name="Left Leg",Match="Accessory (LLEG)",C0=angles(0,0,1.57)},
		{Name="Right Leg",Match="Accessory (RLEG)",C0=angles(0,0,1.57)},
		{Name="Torso",Match="Accessory (TorsoNoob)",C0=cf_0},
		{Name="Torso",Match="Accessory (TorsoWhite)",C0=cf_0},
		{Name="Torso",Match="Accessory (Torso)",C0=cf_0},
		{Name="Left Arm",Match="Accessory (LArmNoob)",C0=angles(0,0,1.57)},
		{Name="Right Arm",Match="Accessory (RArmNoob)",C0=angles(0,0,1.57)},
		{Name="Left Leg",Match="Accessory (LLegNoob)",C0=angles(0,0,1.57)},
		{Name="Right Leg",Match="Accessory (RLegNoob)",C0=angles(0,0,1.57)},
		{Name="Left Leg",Match="Accessory (leftleg)",C0=angles(0,0,1.57)},
		{Name="Right Leg",Match="Accessory (rightleg)",C0=angles(0,0,1.57)},
		{Name="Head",Match="Accessory (big head)",C0=cf_0},
		{Name="Block",Match="International Fedora",C0=angles(1.57,0,0)},
		{Name="Block",Match="InternationalFedora",C0=angles(1.57,0,0)},
		{Name="Head",Match="Accessory (autorig_Head)",C0=cf_0},
		{Name="Torso",Match="Accessory (autorig_Torso)",C0=cf_0},
		{Name="Left Arm",Match="Accessory (autorig_LeftArm)",C0=cf_0},
		{Name="Right Arm",Match="Accessory (autorig_RightArm)",C0=cf_0},
		{Name="Left Leg",Match="Accessory (autorig_LeftLeg)",C0=cf_0},
		{Name="Right Leg",Match="Accessory (autorig_RightLeg)",C0=cf_0},
	}
	for i,v in next,src do
		local k=supper(v.Match)
		if not hatnamelimbs[k] then
			v.k=k
			hatnamelimbs[k]=v
			tinsert(hatnamedups,v)
		end
	end
	-- 名字长的排前面，兜底的前缀匹配才不会认错
	table.sort(hatnamedups,function(a,b) return #a.k>#b.k end)
end
-- 先看部件名，再看它外面那层（Accessory 模型）的名字，最后做前缀兜底
local hatnamelimb=function(p)
	local n=supper(insGet(p,"Name"))
	local pp=insGet(p,"Parent")
	local n2=nil
	if pp then
		n2=supper(insGet(pp,"Name"))
	end
	local i=hatnamelimbs[n]
	if i then
		return i
	end
	if n2 then
		i=hatnamelimbs[n2]
		if i then
			return i
		end
	end
	for j=1,#hatnamedups do
		local v=hatnamedups[j]
		if sfind(n,v.k,1,true)==1 then
			return v
		end
		if n2 and sfind(n2,v.k,1,true)==1 then
			return v
		end
	end
end

--querydescendants faster than getchildren and checks in lua
local timeQueryDescendants=function(p,s,t)
	t+=osclock()
	local refresh=true
	local con=Connect(insGet(p,"DescendantAdded"),function()
		refresh=true
	end)
	local res=nil
	repeat
		if refresh then
			res=QueryDescendants(p,s)
			if next(res) then
				--not using break to have one less jump opcode
				Disconnect(con)
				return res
			end
			refresh=false
		end
		Wait(preanimation)
	until (osclock()>t)
	Disconnect(con)
	return res
end
local makeplaceholder=@native function(v)
	local mesh=FindFirstChildOfClass(v,"SpecialMesh")
	v=ife(v)
	if mesh then
		mesh=ife(mesh)
		insSet(mesh,"Name",rs())
		insSet(mesh,"Parent",v)
	end
	insSet(v,"Name",rs())
	insSet(v,"Anchored",true)
	insSet(v,"CanCollide",false)
	insSet(v,"CanTouch",false)
	insSet(v,"CanQuery",false)
	insSet(v,"Transparency",0.25)
	return v
end
local emptyfunction=function() end

--i like to put enums here
local humanoidStateType=eGet(e,"HumanoidStateType")
local mouseBehaviorType=eGet(e,"MouseBehavior")
local keyCode=eGet(e,"KeyCode")
local rotationOrder=eGet(e,"RotationOrder")
local userInputType=eGet(e,"UserInputType")

local enumphysics=etGet(humanoidStateType,"Physics")
local enumragdoll=etGet(humanoidStateType,"Ragdoll")
local enumrunning=etGet(humanoidStateType,"Running")
local enumseated=etGet(humanoidStateType,"Seated")
local enumdead=etGet(humanoidStateType,"Dead")
local enumMD=etGet(mouseBehaviorType,"Default")
local enumCamS=etGet(eGet(e,"CameraType"),"Scriptable")
local enumRFTExclude=etGet(eGet(e,"RaycastFilterType"),"Exclude")
local enumH=etGet(eGet(e,"CoreGuiType"),"Health")

local Draggable=function(window,obj)
	local MB1enum=etGet(userInputType,"MouseButton1")
	local TOUCHenum=etGet(userInputType,"Touch")
	obj=obj or window
	local active=insGet(obj,"Active")
	local mouseStart=nil
	local dragStart=nil
	local inputbegancon=nil
	local rendersteppedcon=nil
	local inputendedcon=nil
	local inputendedf=function(a)
		a=insGet(a,"UserInputType")
		if (a==MB1enum) or (a==TOUCHenum) then
			Disconnect(rendersteppedcon)
			Disconnect(inputendedcon)
		end
	end
	local rendersteppedf=function()
		local off=GetMouseLocation(uis)-mouseStart
		insSet(window,"Position",dragStart+u2(0,v2Get(off,"X"),0,v2Get(off,"Y")))
	end
	local inputbeganf=function(a)
		a=insGet(a,"UserInputType")
		if ((a==MB1enum) or (a==TOUCHenum)) and active and not GetFocusedTextBox(uis) then
			mouseStart=GetMouseLocation(uis)
			dragStart=insGet(window,"Position")
			if rendersteppedcon then Disconnect(rendersteppedcon) end
			rendersteppedcon=Connect(renderstepped,rendersteppedf)
			if inputendedcon then Disconnect(inputendedcon) end
			inputendedcon=Connect(insGet(uis,"InputEnded"),inputendedf)
		end
	end
	Connect(insGet(obj,"MouseEnter"),function()
		if inputbegancon then Disconnect(inputbegancon) end
		inputbegancon=Connect(insGet(uis,"InputBegan"),inputbeganf)
	end)
	Connect(insGet(obj,"MouseLeave"),function()
		Disconnect(inputbegancon)
	end)
	Connect(GetPropertyChangedSignal(obj,"Active"),function()
		active=insGet(obj,"Active")
	end)
end

local hlp=(gethui and gethui()) or (cloneref((typeof(cg)=="Instance" and cg) or pg))
local sm=v3_010/2
local dense=pp(100,0,0,100,100)
local light=pp(0.0001,0,0,100,100)
local humstatetypes=etGet(humanoidStateType,"GetEnumItems")(humanoidStateType)
tremove(humstatetypes,tfind(humstatetypes,enumrunning))
tremove(humstatetypes,tfind(humstatetypes,etGet(humanoidStateType,"None")))

local allowshiftlock=nil
local allowfreecam=nil
local ctrltp=nil
local placeholders=nil
local allowfling=true
local flingmethod=0
local clickfling=nil
local highlightflingtargets=nil
local discharscripts=nil
local flingchangestate=nil
local respawntp=nil
local breakjointsmethod=nil
local simrad=true
local hidedeatheffect=nil
local prercd=false

local availableSettings={
	"allowshiftlock",
	"allowfreecam",
	"ctrltp",
	"placeholders",
	"allowfling",
	"clickfling",
	"flingmethod",
	"highlightflingtargets",
	"discharscripts",
	"flingchangestate",
	"respawntp",
	"breakjointsmethod",
	"simrad",
	"hidedeatheffect",
	"prercd"
}

local applysettings=@native function(t)
	allowshiftlock=t.allowshiftlock~=nil and t.allowshiftlock
	allowfreecam=t.allowfreecam~=nil and t.allowfreecam
	ctrltp=t.ctrltp~=nil and t.ctrltp
	placeholders=t.placeholders~=nil and t.placeholders
	clickfling=t.clickfling~=nil and t.clickfling
	highlightflingtargets=t.highlightflingtargets~=nil and t.highlightflingtargets
	flingchangestate=t.flingchangestate~=nil and t.flingchangestate
	respawntp=t.respawntp~=nil and t.respawntp
	breakjointsmethod=t.breakjointsmethod~=nil and t.breakjointsmethod
	simrad=t.simrad~=nil and t.simrad
	hidedeatheffect=t.hidedeatheffect~=nil and t.hidedeatheffect
	prercd=t.prercd~=nil and t.prercd
	if t.allowfling~=nil then
		allowfling=t.allowfling
	end
	if t.flingmethod~=nil then
		flingmethod=t.flingmethod
	end
	if t.discharscripts~=nil then
		discharscripts=function(v)
			if IsA(v,"LocalScript") or (IsA(v,"Script") and insGet(v,"RunContext")==etGet(eGet(e,"RunContext"),"Client")) then
				insSet(v,"Disabled",true)
			end
		end
	else
		discharscripts=nil
	end
end

local returnDelta=function() --deltaTime cuz im lazy asf
	return deltaTime
end

local fpdh=insGet(ws,"FallenPartsDestroyHeight")
local caches={}
local cleantable={}
local currenttable=nil
local onstopfunc=nil
local c=nil
local cframes={}
local lpcon=nil
local charcons={}
local flingtable={}
local flingtable1={}
local plrcleanfuncs={}
local onnewcamera=emptyfunction
local getcharacter=function()
	return c
end
local onstopcallback=function(f)
	if type(f)=="function" then
		onstopfunc=f
	end
end
local stopreanimate=@native function() 
	if c then
		c=nil
		if lpcon then
			Disconnect(lpcon)
			lpcon=nil
		end
		for i,v in next,cframes do
			local p=i.v
			if p then
				Destroy(p)
			end
		end
		tclear(cframes)
		for i,v in next,flingtable do
			if v then --it could be false
				Destroy(v)
			end
		end
		tclear(flingtable)
		tclear(flingtable1)
		for _,v in next,cleantable do
			local type=typeof(v)
			if type=="Instance" then
				Destroy(v)
			else
				if type=="RBXScriptConnection" then
					Disconnect(v)
				elseif (type=="table" and v.Disconnect) then
					v:Disconnect()
				end
			end
		end
		tclear(cleantable)
		for _,v in next,caches do
			Destroy(v)
		end
		tclear(caches)
		for _,cleanfunc in next,plrcleanfuncs do
			cleanfunc()
		end
		tclear(plrcleanfuncs)
		if type(onstopfunc)=="function" then
			onstopfunc()
			onstopfunc=nil
		end
		if type(currenttable)=="table" then
			tclear(currenttable)
			currenttable=nil
		end
		insSet(ws,"FallenPartsDestroyHeight",fpdh)
		insSet(uis,"MouseBehavior",enumMD)
		insSet(gs,"TouchControlsEnabled",true)
		onnewcamera()
		return true
	end
	return false
end
local reanimate=function()
	local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them
	local speedlimit = 3000 --makes your parts move slower if the magnitude of their velocity is higher than this
	local retVelTime = 0.51 --time that claimed parts have velocity to reclaim in case u lose them
	local walkSpeed = 16 --your walkspeed (can be changed at runtime)
	local jumpPower = 50 --your jump power (can be changed at runtime)
	local gravity = 196.2 --how fast the characters velocity decreases while falling (can be changed at runtime)
	local ctrlclicktp = ctrltp --makes you teleport where u point ur mouse cursor at when click and hold ctrl down
	local clickfling = clickfling --makes you fling the person you clicked when its available to do so
	local flingvel = v3(15000,16000,15000) --the rotation velocity that ur character will have while flinging
	
	if stopreanimate() then return end
	c=insGet(lp,"Character")
	if not c then return end
	
	local isPhysicsRepFling=flingmethod~=0
	local isRCD=prercd

	local cam=nil
	--theres a way to have ws.currentcamera nil on heartbeat and still have the game run normally
	local refcam=function()
		local newcam=insGet(ws,"CurrentCamera")
		while not newcam do
			Wait(GetPropertyChangedSignal(ws,"CurrentCamera"))
			newcam=insGet(ws,"CurrentCamera")
		end
		cam=newcam
	end
	refcam()
	local freecam=false
	local camoff=cf_0
	local camcf=insGet(cam,"CFrame")
	local scriptablecamcf=nil
	local camt=insGet(cam,"CameraType")
	local camcon0=nil
	local camcon1=nil
	local camcon2=nil
	onnewcamera=function()
		refcam()
		if camcon0 then 
			Disconnect(camcon0)
			Disconnect(camcon1)
			camcon0=nil
		end
		if not c then 
			if insGet(cam,"CameraType")==enumCamS then
				insSet(cam,"CameraType",camt)
			end
			return Disconnect(camcon2) 
		end
		camcon0=Connect(GetPropertyChangedSignal(cam,"CFrame"),function()
			if freecam then
				if insGet(cam,"CFrame")~=camcf then
					insSet(cam,"CFrame",camcf)
				end
			else
				if insGet(cam,"CFrame")~=scriptablecamcf or cfMul(camcf,camoff) then
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
				end
			end
		end)
		camcon1=Connect(GetPropertyChangedSignal(cam,"CameraType"),function()
			if insGet(cam,"CameraType")~=enumCamS then
				insSet(cam,"CameraType",enumCamS)
			end
		end)
		if insGet(cam,"CameraType")~=enumCamS then
			insSet(cam,"CameraType",enumCamS)
		end
		if freecam then
			if insGet(cam,"CFrame")~=camcf then
				insSet(cam,"CFrame",camcf)
			end
		else
			if insGet(cam,"CFrame")~=scriptablecamcf or cfMul(camcf,camoff) then
				insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
			end
		end
	end
	camcon2=Connect(GetPropertyChangedSignal(ws,"CurrentCamera"),onnewcamera)
	onnewcamera()
	
	local wsGravity=insGet(ws,"Gravity")
	tinsert(cleantable,Connect(GetPropertyChangedSignal(ws,"Gravity"),function()
		wsGravity=insGet(ws,"Gravity")
	end))
	
	local cfr=nil
	if c and IsDescendantOf(c,ws) then
		local rootpart=QueryDescendants(c,">BasePart#HumanoidRootPart")[1] or QueryDescendants(c,">BasePart#Torso")[1] or QueryDescendants(c,">BasePart#UpperTorso")[1] or FindFirstChildWhichIsA(c,"BasePart")
		if rootpart then
			cfr=insGet(rootpart,"CFrame")
		else
			cfr=cfAdd(insGet(cam,"Focus"),v3_010*-1.5)
		end
	else
		cfr=cfAdd(insGet(cam,"Focus"),v3_010*-1.5)
	end

	novoid=novoid and (fpdh+1)

	local noVelMode=false
	local Yvel=0
	local pos=cfGet(cfr,"Position")
	cfr=cfl(pos,pos+cfGet(cfr,"LookVector")*v3_101)
	local primarypart=nil
	local shiftlock=false
	local firstperson=false
	local xzvel=v3_0
	local v3_0150=v3_010*1.5
	local camcfLV=cfGet(camcf,"LookVector")
	local camrot=cfl(v3_0,camcfLV)
	local camrotX,camrotY=ToEulerAnglesYXZ(camrot)
	local camcfRV=cfGet(camrot,"RightVector")
	local cammag=-vmagnitude((cfGet(camcf,"Position")-(pos+v3_0150)))
	
	local R6parts={ 
		head={Name="Head"},
		torso={Name="Torso"},
		root={Name="HumanoidRootPart"},
		leftArm={Name="Left Arm"},
		rightArm={Name="Right Arm"},
		leftLeg={Name="Left Leg"},
		rightLeg={Name="Right Leg"}
	}
	rootpart=R6parts.root
	for i,v in next,R6parts do
		cframes[v]=cfr
	end
	local joints={
		{
			Name="Neck",
			Part0=R6parts.torso,Part1=R6parts.head,
			C0=cf(0,1,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
		},
		{
			Name="RootJoint",
			Part0=rootpart,Part1=R6parts.torso,
			C0=cf(0,0,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,0,0,-1,0,0,0,0,1,0,1,-0)
		},
		{
			Name="Right Shoulder",
			Part0=R6parts.torso,Part1=R6parts.rightArm,
			C0=cf(1,0.5,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
		},
		{
			Name="Left Shoulder",
			Part0=R6parts.torso,Part1=R6parts.leftArm,
			C0=cf(-1,0.5,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
		},
		{
			Name="Right Hip",
			Part0=R6parts.torso,Part1=R6parts.rightLeg,
			C0=cf(1,-1,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
		},
		{
			Name="Left Hip",
			Part0=R6parts.torso,Part1=R6parts.leftLeg,
			C0=cf(-1,-1,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
		}
	}
	
	local RCDparts={}
	if isRCD then
		local R6RCDparts={
			Head={Name="Head"},
			Torso={Name="Torso"},
			HumanoidRootPart=rootpart,
			["Left Arm"]={Name="Left Arm"},
			["Right Arm"]={Name="Right Arm"},
			["Left Leg"]={Name="Left Leg"},
			["Right Leg"]={Name="Right Leg"}
		}
		local R15parts={
			Torso={
				UpperTorso=0.2,
				LowerTorso=-0.73
			},
			["Left Arm"]={
				LeftHand=-0.73,
				LeftLowerArm=-0.174,
				LeftUpperArm=0.415
			},
			["Right Arm"]={
				RightHand=-0.73,
				RightLowerArm=-0.174,
				RightUpperArm=0.415
			},
			["Left Leg"]={
				LeftFoot=-0.85,
				LeftLowerLeg=-0.29,
				LeftUpperLeg=0.49
			},
			["Right Leg"]={
				RightFoot=-0.85,
				RightLowerLeg=-0.29,
				RightUpperLeg=0.49
			}
		}
		
		for n,p in next,R6RCDparts do
			for i,v in next,R6parts do
				if v.Name==n then
					tinsert(joints,{C0=cf_0,C1=cf_0,Part0=p,Part1=v})
					RCDparts[n]=p
					break
				end
			end
		end
		for i,v in next,R15parts do
			local R6part=R6RCDparts[i]
			for n,o in next,v do
				local p={Name=n}
				tinsert(joints,{C0=cf(0,-o,0),C1=cf_0,Part0=p,Part1=R6part})
				RCDparts[n]=p
			end
		end
	end

	local refreshedjoints={}
	local refreshjointsI=nil
	refreshjointsI=@native function(part)
		refreshedjoints[part]=true
		for i,v in next,joints do
			local part0=v.Part0
			local part1=v.Part1
			if part1 and (part0==part) then
				cframes[part1]=cfMul(cframes[part],cfMul(v.C0,Inverse(v.C1)))
				if not refreshedjoints[part1] then
					refreshjointsI(part1)
				end
			elseif part0 and (part1==part) then
				cframes[part0]=cfMul(cframes[part],cfMul(v.C1,Inverse(v.C0)))
				if not refreshedjoints[part0] then
					refreshjointsI(part0)
				end
			end
		end
	end
	refreshjointsI(rootpart)
	tclear(refreshedjoints)

	local attachments={
		RightShoulderAttachment={R6parts.rightArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		RightGripAttachment={R6parts.rightArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		LeftFootAttachment={R6parts.leftLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		LeftShoulderAttachment={R6parts.leftArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		LeftGripAttachment={R6parts.leftArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		RootAttachment={rootpart,cf(0,0,0,1,0,0,0,1,0,0,0,1)},
		RightFootAttachment={R6parts.rightLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		NeckAttachment={R6parts.torso,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		BodyFrontAttachment={R6parts.torso,cf(0,0,-0.5,1,0,0,0,1,0,0,0,1)},
		BodyBackAttachment={R6parts.torso,cf(0,0,0.5,1,0,0,0,1,0,0,0,1)},
		LeftCollarAttachment={R6parts.torso,cf(-1,1,0,1,0,0,0,1,0,0,0,1)},
		RightCollarAttachment={R6parts.torso,cf(1,1,0,1,0,0,0,1,0,0,0,1)},
		WaistFrontAttachment={R6parts.torso,cf(0,-1,-0.5,1,0,0,0,1,0,0,0,1)},
		WaistCenterAttachment={R6parts.torso,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		WaistBackAttachment={R6parts.torso,cf(0,-1,0.5,1,0,0,0,1,0,0,0,1)},
		HairAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
		HatAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
		FaceFrontAttachment={R6parts.head,cf(0,0,-0.6,1,0,0,0,1,0,0,0,1)},
		FaceCenterAttachment={R6parts.head,cf(0,0,0,1,0,0,0,1,0,0,0,1)}
	}

	local getPart=@native function(name,blacklist)
		if blacklist then
			for i,v in next,cframes do
				if (i.Name==name) and not tfind(blacklist,i) then
					return i
				end
			end
		else
			for i,v in next,cframes do
				if i.Name==name then
					return i
				end
			end
		end
	end

	local getJoint=@native function(name,ignore)
		for i,v in next,joints do
			if v.Name==name then
				return v
			end
		end
		if not ignore then
			return {C0=cf_0,C1=cf_0}
		end
	end

	local getPartFromMesh=@native function(m,t,blacklist,ignore)
		if blacklist then
			for v,_ in next,cframes do
				if v.m and (not tfind(blacklist,v)) and sfind(v.m,m) and sfind(v.t,t) then
					return v
				end
			end
		else
			for v,_ in next,cframes do
				if v.m and sfind(v.m,m) and sfind(v.t,t) then
					return v
				end
			end
		end
		if not ignore then
			local p={m=m,t=t}
			cframes[p]=cfr
			local j={C0=cf_0,C1=cf_0,Part0=p}
			p.j=j
			return p
		end
	end

	local getPartJoint=@native function(p)
		if cframes[p] then
			local j=p.j
			if j then
				return j
			end
			for i,v in next,joints do
				if v.Part0==p then
					return v
				end
			end
			for i,v in next,joints do
				if v.Part1==p then
					return v
				end
			end
		end
	end
	
	local getAccWeldFromMesh=@native function(m,t)
		return getPartJoint(getPartFromMesh(m,t))
	end
	
	local getPartsFromMesh=@native function(m,t,blacklist,ignore)
		local pt={}
		if blacklist then
			for v,_ in next,cframes do
				if v.m and (not tfind(blacklist,v)) and sfind(v.m,m) and sfind(v.t,t) then
					tinsert(pt,v)
				end
			end
		else
			for v,_ in next,cframes do
				if v.m and sfind(v.m,m) and sfind(v.t,t) then
					tinsert(pt,v)
				end
			end
		end
		if not ignore then
			local p={m=m,t=t}
			cframes[p]=cfr
			local j={C0=cf_0,C1=cf_0,Part0=p}
			p.j=j
			tinsert(pt,p)
		end
		return pt
	end
	
	local getAccWeldsFromMesh=@native function(m,t)
		local pt={}
		for i,p in next,getPartsFromMesh(m,t,nil,true) do
			local w=getPartJoint(p)
			if w then
				tinsert(pt,w)
			end
		end
		return pt
	end
	
	local getAccessories=@native function(blacklist)
		local t={}
		if blacklist then
			for v,_ in next,cframes do
				if v.m and (not tfind(blacklist,v)) and (v.m or v.t) then
					tinsert(t,v)
				end
			end
		else
			for v,_ in next,cframes do
				if v.m and (v.m or v.t) then
					tinsert(t,v)
				end
			end
		end
		return t
	end

	local raycastparams=rp()
	raycastparams.FilterType=enumRFTExclude
	raycastparams.RespectCanCollide=true
	local rayexclusions={}
	local rayfilter={}
	local characters={}
	local refreshrayfilter=@native function()
		tclear(rayfilter)
		local n=0
		for i,v in next,characters do
			n+=1
			rayfilter[n]=v
		end
		for i,v in next,rayexclusions do
			n+=1
			rayfilter[n]=v
		end
		raycastparams.FilterDescendantsInstances=rayfilter
	end
	local rootparts={}
	for i,v in next,accessorylimbs do
		v.p=getPart(v.Name)
		if not v.meshid then
			v.meshid=""
		end 
		if not v.textureid then
			v.textureid=""
		end 
	end
	for i,v in next,hatnamelimbs do
		v.p=getPart(v.Name)
	end
	local makePartCons=function(p,t)
		if (t.p==p) and insGet(p,"Anchored") then
			t.p=nil
		end
		local con0=Connect(GetPropertyChangedSignal(p,"Anchored"),function()
			if insGet(p,"Anchored") then
				if t.p==p then
					t.c=nil
					t.p=nil
				end
			elseif not t.p then
				t.p=p
			end
		end)
		local con1=nil
		con1=Connect(insGet(p,"AncestryChanged"),function()
			if not IsDescendantOf(p,ws) then
				Disconnect(con0)
				Disconnect(con1)
				if t.p==p then
					t.p=nil
				end
			end
		end)
	end
	local ondes=function(v)
		if c and IsA(v,"Attachment") and IsDescendantOf(c,ws) then
			local v1=attachments[insGet(v,"Name")]
			if v1 then
				local p=insGet(v,"Parent")
				if insGet(p,"Parent")~=c then
					-- 先按部件名认帽子（HatNameDatabase）
					local nl=hatnamelimb(p)
					if nl and nl.p then
						local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),p=p}
						makePartCons(p,t)
						if placeholders then
							t.v=makeplaceholder(p)
							t.b=false
						end
						cframes[t]=insGet(p,"CFrame")
						tinsert(joints,{Part0=t,Part1=nl.p,C0=nl.C0,C1=cf_0})
						nl.p=nil
						return
					end
					local meshid=nil
					local textureid=nil
					if IsA(p,"MeshPart") then
						meshid=insGet(p,"MeshId")
						textureid=insGet(p,"TextureID")
					elseif IsA(p,"BasePart") then
						local sm=FindFirstChildOfClass(p,"SpecialMesh")
						if sm then
							meshid=insGet(sm,"MeshId")
							textureid=insGet(sm,"TextureId")
						else
							return
						end
					else
						return
					end
					for i,_ in next,cframes do
						if (meshid==i.m) and (textureid==i.t) then
							local p1=i.p
							if p1 and IsDescendantOf(p1,c) then
								if p1==p then
									return
								end
							else
								i.p=p
								makePartCons(p,i)
								return
							end
						else
							local j=i.j
							if j and sfind(meshid,i.m) and sfind(textureid,i.t) then
								i.m=meshid
								i.t=textureid
								i.l=insGet(p,"Position")
								i.p=p
								makePartCons(p,i)
								i.j=nil
								i.Name=insGet(p,"Name")
								j.C0=insGet(v,"CFrame")
								j.C1=v1[2]
								j.Part1=v1[1]
								tinsert(joints,j)
								return
							end
						end
					end
					for i,l in next,accessorylimbs do
						if l.p and sfind(meshid,l.meshid) and sfind(textureid,l.textureid) then
							local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
							makePartCons(p,t)
							if placeholders then
								t.v=makeplaceholder(p)
								t.b=false
							end
							cframes[t]=insGet(p,"CFrame")
							local lats=l.attachments
							if lats then
								for an,acf in next,lats do
									attachments[an]={t,acf}
								end
							end
							tinsert(joints,{Part0=t,Part1=l.p,C0=l.C0,C1=cf_0})
							l.p=nil
							return
						end
					end
					local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
					makePartCons(p,t)
					if placeholders then
						t.v=makeplaceholder(p)
						t.b=false
					end
					cframes[t]=insGet(p,"CFrame")
					tinsert(joints,{Part0=t,Part1=v1[1],C0=insGet(v,"CFrame"),C1=v1[2]})
				end
			end
		end
	end
	local ondes1=function(v)
		if c and IsA(v,"Attachment") and IsDescendantOf(c,ws) then
			local p=insGet(v,"Parent")
			
			local i=RCDparts[insGet(p,"Name")]
			if i then
				local pt=i.p
				if pt and IsDescendantOf(pt,c) then
					if pt==p then
						return
					end
				end
				
				i.p=p
				i.l=insGet(p,"Position")
				makePartCons(p,i)
				for i,v in next,GetJoints(p) do
					Destroy(v)
				end
				if placeholders and not i.v then
					i.v=makeplaceholder(p)
					i.b=false
				end
				cframes[i]=insGet(p,"CFrame")
				return
			end
			
			local v1=attachments[insGet(v,"Name")]
			if v1 then
				if insGet(p,"Parent")~=c then
					-- 先按部件名认帽子（HatNameDatabase）
					local nl=hatnamelimb(p)
					if nl and nl.p then
						local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),p=p}
						makePartCons(p,t)
						if placeholders then
							t.v=makeplaceholder(p)
							t.b=false
						end
						cframes[t]=insGet(p,"CFrame")
						tinsert(joints,{Part0=t,Part1=nl.p,C0=nl.C0,C1=cf_0})
						nl.p=nil
						return
					end
					local meshid=nil
					local textureid=nil
					if IsA(p,"MeshPart") then
						meshid=insGet(p,"MeshId")
						textureid=insGet(p,"TextureID")
					elseif IsA(p,"BasePart") then
						local sm=FindFirstChildOfClass(p,"SpecialMesh")
						if sm then
							meshid=insGet(sm,"MeshId")
							textureid=insGet(sm,"TextureId")
						else
							return
						end
					else
						return
					end
					for i,_ in next,cframes do
						if (meshid==i.m) and (textureid==i.t) then
							local p1=i.p
							if p1 and IsDescendantOf(p1,c) then
								if p1==p then
									return
								end
							else
								i.p=p
								makePartCons(p,i)
								return
							end
						else
							local j=i.j
							if j and sfind(meshid,i.m) and sfind(textureid,i.t) then
								i.m=meshid
								i.t=textureid
								i.l=insGet(p,"Position")
								i.p=p
								makePartCons(p,i)
								i.j=nil
								i.Name=insGet(p,"Name")
								j.C0=insGet(v,"CFrame")
								j.C1=v1[2]
								j.Part1=v1[1]
								tinsert(joints,j)
								return
							end
						end
					end
					for i,l in next,accessorylimbs do
						if l.p and sfind(meshid,l.meshid) and sfind(textureid,l.textureid) then
							local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
							makePartCons(p,t)
							if placeholders then
								t.v=makeplaceholder(p)
								t.b=false
							end
							cframes[t]=insGet(p,"CFrame")
							local lats=l.attachments
							if lats then
								for an,acf in next,lats do
									attachments[an]={t,acf}
								end
							end
							tinsert(joints,{Part0=t,Part1=l.p,C0=l.C0,C1=cf_0})
							l.p=nil
							return
						end
					end
					local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
					makePartCons(p,t)
					if placeholders then
						t.v=makeplaceholder(p)
						t.b=false
					end
					cframes[t]=insGet(p,"CFrame")
					tinsert(joints,{Part0=t,Part1=v1[1],C0=insGet(v,"CFrame"),C1=v1[2]})
				end
			end
		end
	end

	local simradv=1000
	local refreshf=nil
	local onplayer=function(v)
		simradv+=1000
		local islp=v==lp
		local lastc=nil
		if islp then
			local hrp=nil
			local childadded=function(i)
				if IsA(i,"BasePart") and insGet(i,"Name")=="HumanoidRootPart" then
					hrp=i
					rootparts[v]=hrp
					if lpcon then
						Disconnect(lpcon)
						lpcon=nil
					end
				end
			end
			local oncharacter=function()
				local newc=insGet(v,"Character")
				if newc and (newc~=lastc) then
					lastc=newc
					pcall(Disconnect,cleantable.ondes)
					if lpcon then
						Disconnect(lpcon)
						lpcon=nil
					end
					characters[v]=newc
					refreshrayfilter()
					if discharscripts then
						pcall(Disconnect,cleantable.discharscripts)
						cleantable.discharscripts=Connect(insGet(newc,"DescendantAdded"),discharscripts)
						for i,v in next,QueryDescendants(newc,"LocalScript,Script[RunContext=Client]") do
							insSet(v,"Disabled",true)
						end
					end
					hrp=QueryDescendants(newc,">BasePart#HumanoidRootPart")[1]
					if not hrp then
						lpcon=Connect(insGet(newc,"ChildAdded"),childadded)
						repeat
							twait()
							if (newc~=lastc) then
								return
							end
						until hrp
					end
					c=newc
					if type(refreshf)=="function" then
						tspawn(refreshf)
					end
					if isRCD then
						local hum=FindFirstChildOfClass(c,"Humanoid")
						if hum then
							ChangeState(hum,enumphysics)
							SetStateEnabled(hum,enumseated,false)
						end
						insSet(hrp,"AssemblyLinearVelocity",v3_0)
						insSet(hrp,"AssemblyAngularVelocity",v3_0)
						insSet(hrp,"CFrame",cfr)
						twait(0.3)
						local _,firsttarget=next(flingtable1)
						if isPhysicsRepFling and (firsttarget and firsttarget.p) then
							local p=firsttarget.p
							if sethiddenproperty then
								sethiddenproperty(hrp,"PhysicsRepRootRef",ih(p))
							elseif setscriptable then
								setscriptable(hrp,"PhysicsRepRootRef",true)
								insSet(hrp,"PhysicsRepRootRef",ih(p))
							elseif c then
								local hrpcpp=insGet(hrp,"CustomPhysicalProperties")
								local tparent=insGet(p,"Parent")
								local tcfr=insGet(p,"CFrame")
										
								local model=i("Model")
								local hum=i("Humanoid")
								insSet(hum,"Parent",model)
										
								for i,v in next,humstatetypes do
									SetStateEnabled(hum,v,false)
								end
					
								local restorejoints={}
								for i,v in next,GetJoints(hrp) do
									restorejoints[v]=insGet(v,"Parent")
									insSet(v,"Parent",nil)
								end
								for i,v in next,GetJoints(hrp) do
									restorejoints[v]=insGet(v,"Parent")
									insSet(v,"Parent",nil)
								end
	
								local tcfr1=cf(cfGet(tcfr,"Position")+v3_010*mrandom(10000,20000))
								insSet(p,"Parent",ws)
								insSet(p,"CFrame",tcfr1)
								insSet(hrp,"Parent",model)
								insSet(hrp,"CFrame",cfAdd(tcfr1,(insGet(hrp,"Size")+insGet(p,"Size"))*sm))
								insSet(p,"CustomPhysicalProperties",dense)
								insSet(hrp,"CustomPhysicalProperties",light)
								insSet(model,"Parent",ws)
								ChangeState(hum,enumrunning)
								if not insGet(p,"CanCollide") then
									insSet(p,"CanCollide",true)
								end
								Wait(stepped)
								for i,v in next,restorejoints do
									insSet(i,"Parent",v)
								end
								insSet(p,"CFrame",tcfr)
								insSet(p,"Parent",tparent)
								insSet(hrp,"CustomPhysicalProperties",hrpcpp)
								insSet(hrp,"Parent",c)
								Destroy(model)
							end
						end
					else
						if next(flingtable) then
							local hum=FindFirstChildOfClass(c,"Humanoid")
							if hum then
								if flingchangestate==3 then
									ChangeState(hum,enumphysics)
									SetStateEnabled(hum,enumseated,false)
								elseif flingchangestate==1 then
									ChangeState(hum,enumphysics)
								else
									if flingchangestate==2 then
										SetStateEnabled(hum,enumseated,false)
									end
									if isPhysicsRepFling then
										ChangeState(hum,enumragdoll)
										SetStateEnabled(hum,enumrunning,false)
									end
								end
							end
							twait(0.25)
							for i0,v in next,tclone(flingtable) do
								if not c then
									return
								end
								if isPhysicsRepFling then
									if sethiddenproperty then
										sethiddenproperty(hrp,"PhysicsRepRootRef",ih(i0))
									elseif setscriptable then
										setscriptable(hrp,"PhysicsRepRootRef",true)
										insSet(hrp,"PhysicsRepRootRef",ih(i0))
									else
										local hrpcpp=insGet(hrp,"CustomPhysicalProperties")
										local tparent=insGet(i0,"Parent")
										local tcfr=insGet(i0,"CFrame")
										
										local model=i("Model")
										local hum=i("Humanoid")
										insSet(hum,"Parent",model)
										
										for i,v in next,humstatetypes do
											SetStateEnabled(hum,v,false)
										end
										
										local restorejoints={}
										for i,v in next,GetJoints(hrp) do
											restorejoints[v]=insGet(v,"Parent")
											insSet(v,"Parent",nil)
										end
										for i,v in next,GetJoints(i0) do
											restorejoints[v]=insGet(v,"Parent")
											insSet(v,"Parent",nil)
										end
	
										local tcfr1=cf(cfGet(tcfr,"Position")+v3_010*mrandom(10000,20000))
										insSet(i0,"Parent",ws)
										insSet(i0,"CFrame",tcfr1)
										insSet(hrp,"Parent",model)
										insSet(hrp,"CFrame",cfAdd(tcfr1,(insGet(hrp,"Size")+insGet(i0,"Size"))*sm))
										insSet(i0,"CustomPhysicalProperties",dense)
										insSet(hrp,"CustomPhysicalProperties",light)
										insSet(model,"Parent",ws)
										ChangeState(hum,enumrunning)
										if not insGet(i0,"CanCollide") then
											insSet(i0,"CanCollide",true)
										end
										Wait(stepped)
										for i,v in next,restorejoints do
											insSet(i,"Parent",v)
										end
										insSet(i0,"CFrame",tcfr)
										insSet(i0,"Parent",tparent)
										insSet(hrp,"CustomPhysicalProperties",hrpcpp)
										insSet(hrp,"Parent",newc)
										Destroy(model)
									end
								end
								local startpos=insGet(i0,"Position")
								local stoptime=sine+((isPhysicsRepFling and 0.15) or 3)
								while true do
									if IsGrounded(i0) or not IsDescendantOf(i0,ws) then
										break
									end
									if vmagnitude(startpos-insGet(i0,"Position"))>200 then
										break
									end
									if isPhysicsRepFling then
										local tcf=insGet(i0,"CFrame")
										if novoid and (cfGet(tcf,"Y")<novoid) then
											tcf=cfAdd(tcf,v3_010*(novoid-cfGet(tcf,"Y")))
										end
										insSet(hrp,"CFrame",tcf)
										insSet(hrp,"AssemblyLinearVelocity",flingvel)
									else
										local tcf=cfAdd(insGet(i0,"CFrame"),insGet(i0,"AssemblyLinearVelocity")*(sin(sine*15)+1))
										if novoid and (cfGet(tcf,"Y")<novoid) then
											tcf=cfAdd(tcf,v3_010*(novoid-cfGet(tcf,"Y")))
										end
										insSet(hrp,"CFrame",tcf)
										insSet(hrp,"AssemblyLinearVelocity",insGet(i0,"AssemblyLinearVelocity")*v3_101*75)
									end
									insSet(hrp,"AssemblyAngularVelocity",flingvel)
									if sine>stoptime then
										break
									end
									twait()
								end
								if v then
									Destroy(v)
								end
								flingtable[i0]=nil
							end
							if isPhysicsRepFling then
								if sethiddenproperty then
									sethiddenproperty(hrp,"PhysicsRepRootRef",ih(nil))
								elseif setscriptable then
									setscriptable(hrp,"PhysicsRepRootRef",true)
									insSet(hrp,"PhysicsRepRootRef",ih(nil))
								else
									SetStateEnabled(hum,enumrunning,true)
									ChangeState(hum,enumrunning)
								end
							end
							insSet(hrp,"AssemblyLinearVelocity",v3_0)
							insSet(hrp,"AssemblyAngularVelocity",v3_0)
							insSet(hrp,"CFrame",cfr)
							twait(0.25)
						end
						if respawntp==0 then
							twait()
						elseif respawntp==1 then
							local startpos=pos+v3(mrandom(-32,32),0,mrandom(-32,32))
							local dir=nil
							local poscheck=true
							while poscheck do
								poscheck=false
								for i,v in next,rootparts do
									local diff=(startpos-insGet(v,"Position"))*v3_101
									if vmagnitude(diff)<10 then
										poscheck=true
										dir=dir or (vnormalize(diff)*3)
										startpos+=dir
									end
								end
								local diff=(startpos-pos)*v3_101
								if vmagnitude(diff)<10 then
									poscheck=true
									dir=dir or (vnormalize(diff)*3)
									startpos+=dir
								end
							end
							startpos=cfAdd(cfGet(cfr,"Rotation"),startpos)
							insSet(hrp,"CFrame",startpos)
							insSet(hrp,"AssemblyLinearVelocity",v3_0)
							insSet(hrp,"AssemblyAngularVelocity",v3_0)
							twait(0.3)
						elseif respawntp==2 then
							insSet(hrp,"CFrame",cfAdd(cfr,cfGet(cfr,"RightVector")*3.5-cfGet(cfr,"LookVector")*3.5))
							insSet(hrp,"AssemblyLinearVelocity",v3_0)
							insSet(hrp,"AssemblyAngularVelocity",v3_0)
							twait(0.3)
						elseif respawntp==3 then
							local t=osclock()+0.3
							local startcf=cfAdd(cfMul(cfGet(cfr,"Rotation"),angles(1.5707963267948966,0,0)),pos*v3_101+v3_010*min(fpdh+30,v3Get(pos,"Y")-5))
							while twait() do
								insSet(hrp,"CFrame",startcf)
								insSet(hrp,"AssemblyLinearVelocity",v3_0)
								insSet(hrp,"AssemblyAngularVelocity",v3_0)
								if osclock()>t then
									break
								end
							end
						end
					end
					if newc~=c then
						return
					end
					primarypart=insGet(newc,"PrimaryPart") or hrp
					if hidedeatheffect and GetCoreGuiEnabled(sg,enumH) then
						SetCoreGuiEnabled(sg,enumH,false)
					end
					if breakjointsmethod==4 then
						BreakJoints(newc)
						local h=FindFirstChildOfClass(newc,"Humanoid")
						if h then
							insSet(h,"Health",0)
							if sethiddenproperty then
								sethiddenproperty(h,"NetworkHumanoidState",enumdead)
							else
								ChangeState(h,enumdead)
							end
							if replicatesignal then
								local success,ServerBreakJoints=pcall(insGet,h,"ServerBreakJoints")
								if success then
									replicatesignal(ServerBreakJoints)
								end
							end
						end
					elseif breakjointsmethod==1 then
						BreakJoints(newc)
						local h=FindFirstChildOfClass(newc,"Humanoid")
						if h then
							insSet(h,"Health",0)
						end
					elseif breakjointsmethod==2 then
						local h=FindFirstChildOfClass(newc,"Humanoid")
						if h then
							insSet(h,"Health",0)
						else
							BreakJoints(newc)
						end
					else
						BreakJoints(newc)
					end
					if isRCD then
						cleantable.ondes=Connect(insGet(newc,"DescendantAdded"),ondes1)
						for i,v in next,QueryDescendants(newc,"Attachment") do
							ondes1(v)
						end
					else
						cleantable.ondes=Connect(insGet(newc,"DescendantAdded"),ondes)
						for i,v in next,QueryDescendants(newc,"Attachment") do
							ondes(v)
						end
					end
				end
			end
			tinsert(cleantable,Connect(GetPropertyChangedSignal(v,"Character"),oncharacter))
			oncharacter()
		else
			local con0=nil
			local newc=nil
			local hrp=nil
			local childadded=function(i)
				if newc and (IsA(i,"BasePart") and insGet(i,"Name")=="HumanoidRootPart") then
					hrp=i
					rootparts[v]=hrp
					if con0 then
						Disconnect(con0)
						con0=nil
					end
				end
			end
			local oncharacter=function()
				newc=insGet(v,"Character")
				if newc and (newc~=lastc) then
					lastc=newc
					if con0 then
						Disconnect(con0)
						con0=nil
					end
					characters[v]=newc
					refreshrayfilter()
					hrp=QueryDescendants(newc,">BasePart#HumanoidRootPart")[1]
					if hrp then
						rootparts[v]=hrp
					else
						con0=Connect(insGet(newc,"ChildAdded"),childadded)
					end
				end
			end
			local charcon=Connect(GetPropertyChangedSignal(v,"Character"),oncharacter)
			oncharacter()
			plrcleanfuncs[v]=@native function()
				simradv-=1000
				characters[v]=nil
				rootparts[v]=nil
				if con0 then
					Disconnect(con0)
					con0=nil
				end
				Disconnect(charcon)
			end
		end
	end
	tinsert(cleantable,Connect(insGet(plrs,"PlayerRemoving"),function(v)
		local cleanfunc=plrcleanfuncs[v]
		if cleanfunc then
			cleanfunc()
			plrcleanfuncs[v]=nil
		end
	end))
	for i,v in next,GetPlayers(plrs) do simradv+=1000 if v~=lp then tspawn(onplayer,v) end end
	tinsert(cleantable,Connect(insGet(plrs,"PlayerAdded"),onplayer))
	onplayer(lp)
	local setsimrad=emptyfunction
	if simrad then
		setsimrad=function()
			if pcall(insSet,lp,"SimulationRadius",simradv) then
				setsimrad=function()
					insSet(lp,"SimulationRadius",simradv)
				end
			else
				setsimrad=emptyfunction
			end
		end
	end
	
	local blockedKeys={}
	local mradN05=-0.008726646259971648
	local pi2=3.141592653589793/2-0.0001
	local npi2=-pi2
	local enumYXZ=etGet(rotationOrder,"YXZ")
	local enumMB2=etGet(userInputType,"MouseButton2")
	local enumMLCP=etGet(mouseBehaviorType,"LockCurrentPosition")
	local enumMLC=(insGet(uis,"TouchEnabled") and enumMLCP) or etGet(mouseBehaviorType,"LockCenter") 
	local enumMW=etGet(userInputType,"MouseWheel")
	local enumMM=etGet(userInputType,"MouseMovement")

	local mouseBehavior=insGet(uis,"MouseBehavior")
	tinsert(cleantable,Connect(GetPropertyChangedSignal(uis,"MouseBehavior"),function()
		if insGet(uis,"MouseBehavior")~=mouseBehavior then
			insSet(uis,"MouseBehavior",mouseBehavior)
		end
	end))

	local mode="default"
	local defaultmode={}
	local modes={default=defaultmode}

	local lerpsIdle=emptyfunction
	local lerpsWalk=emptyfunction
	local lerpsJump=emptyfunction
	local lerpsFall=emptyfunction

	local addmode=@native function(key,mode)
		if (type(key)~="string") or (type(mode)~="table") then
			return
		end
		for i,v in next,mode do
			if type(v)~="function" then
				mode[i]=nil
			end
		end
		if key=="default" then
			defaultmode=mode
			modes.default=mode
			lerpsIdle=mode.idle or emptyfunction
			lerpsWalk=mode.walk or emptyfunction
			lerpsJump=mode.jump or emptyfunction
			lerpsFall=mode.fall or emptyfunction
			if mode.modeEntered then
				mode.modeEntered()
			end
		elseif #key==1 then
			key=KeyCode[supper(ssub(key,1,1))]
			modes[key]=mode
		end
	end

	local keyW=etGet(keyCode,"W")
	local Wpressed=IsKeyDown(uis,keyW)
	local keyA=etGet(keyCode,"A")
	local Apressed=IsKeyDown(uis,keyA)
	local keyS=etGet(keyCode,"S")
	local Spressed=IsKeyDown(uis,keyS)
	local keyD=etGet(keyCode,"D")
	local Dpressed=IsKeyDown(uis,keyD)
	local keySpace=etGet(keyCode,"Space")
	local jumpingInput=IsKeyDown(uis,keySpace)
	
	local keyP=etGet(keyCode,"P")
	local keyLeftControl=etGet(keyCode,"LeftControl")
	local keyRightControl=etGet(keyCode,"RightControl")
	local keyLeftShift=etGet(keyCode,"LeftShift")
	local keyRightShift=etGet(keyCode,"RightShift")

	local FWmovement=0
	local RTmovement=0
	local isWalking=false
	local refreshKeyboardMovement=@native function()
		if Wpressed then if Spressed then if Dpressed then if Apressed then isWalking=false else FWmovement=0 RTmovement=1 isWalking=true end else if Apressed then FWmovement=0 RTmovement=-1 isWalking=true else isWalking=false end end else FWmovement=1 if Dpressed then if Apressed then RTmovement=0 else RTmovement=1 end else if Apressed then RTmovement=-1 else RTmovement=0 end end isWalking=true end else if Spressed then FWmovement=-1 if Dpressed then if Apressed then RTmovement=0 else RTmovement=1 end else if Apressed then RTmovement=-1 else RTmovement=0 end end isWalking=true else if Dpressed then if Apressed then isWalking=false else FWmovement=0 RTmovement=1 isWalking=true end else if Apressed then FWmovement=0 RTmovement=-1 isWalking=true else isWalking=false end end end end
	end
	refreshKeyboardMovement()

	tinsert(cleantable,Connect(insGet(uis,"InputBegan"),function(a)
		if insGet(gs,"MenuIsOpen") or GetFocusedTextBox(uis) then
			return
		end
		a=insGet(a,"KeyCode")
		if blockedKeys[a] then
			return
		end
		if a==keyW then
			Wpressed=true
			refreshKeyboardMovement()
		elseif a==keyA then
			Apressed=true
			refreshKeyboardMovement()
		elseif a==keyS then
			Spressed=true
			refreshKeyboardMovement()
		elseif a==keyD then
			Dpressed=true
			refreshKeyboardMovement()
		elseif a==keySpace then
			jumpingInput=true
		elseif a==keyLeftShift then
			shiftlock=allowshiftlock and not shiftlock
		elseif a==keyP and (IsKeyDown(uis,keyLeftControl) or IsKeyDown(uis,keyRightControl)) and (IsKeyDown(uis,keyLeftShift) or IsKeyDown(uis,keyRightShift)) then
			freecam=allowfreecam and not freecam
			insSet(gs,"TouchControlsEnabled",not freecam)
		elseif modes[a] then
			local modeLeft=modes[mode].modeLeft
			if modeLeft then
				modeLeft()
			end
			if mode==a then
				mode="default"
			else
				mode=a
			end
			local modet=modes[mode]
			lerpsIdle=modet.idle or defaultmode.idle or emptyfunction
			lerpsWalk=modet.walk or defaultmode.walk or emptyfunction
			lerpsJump=modet.jump or defaultmode.jump or emptyfunction
			lerpsFall=modet.fall or defaultmode.fall or emptyfunction
			if modes[mode].modeEntered then
				modes[mode].modeEntered()
			end
		end
	end))
	tinsert(cleantable,Connect(insGet(uis,"InputEnded"),function(a)
		a=insGet(a,"KeyCode")
		if a==keyW then
			Wpressed=false
			refreshKeyboardMovement()
		elseif a==keyA then
			Apressed=false
			refreshKeyboardMovement()
		elseif a==keyS then
			Spressed=false
			refreshKeyboardMovement()
		elseif a==keyD then
			Dpressed=false
			refreshKeyboardMovement()
		elseif a==keySpace then
			jumpingInput=false
		end
	end))

	local thumbstickEndX=0
	local thumbstickStartY=0

	local thumbstickSizeMultiplier=0

	local jumpStartX=0
	local jumpStartY=0
	local jumpEndX=0
	local jumpEndY=0

	local thumbstickInputObject=nil
	local jumpInputObject=nil
	local cameraRotateInputObject=nil
	local cameraZoomInputObject=nil

	local thumbstickTouchStart=v3_0
	local cameraZoomInputMagnitude=0

	tinsert(cleantable,Connect(insGet(uis,"TouchStarted"),function(inputObject)
		if insGet(gs,"MenuIsOpen") or GetFocusedTextBox(uis) then
			return
		end

		local touchPos=insGet(inputObject,"Position")
		local touchX=v3Get(touchPos,"X")
		local touchY=v3Get(touchPos,"Y")

		if (not thumbstickInputObject) and touchX<thumbstickEndX and touchY>thumbstickStartY then
			thumbstickInputObject=inputObject
			thumbstickTouchStart=insGet(inputObject,"Position")
			isWalking=false
		elseif (not jumpInputObject) and touchY>jumpStartY and touchX>jumpStartX and touchX<jumpEndX and touchY<jumpEndY then
			jumpInputObject=inputObject
			jumpingInput=true
		elseif not cameraRotateInputObject then
			cameraRotateInputObject=inputObject
		else
			cameraZoomInputObject=inputObject
			cameraZoomInputMagnitude=vmagnitude(insGet(cameraRotateInputObject,"Position")-insGet(cameraZoomInputObject,"Position"))
		end
	end))
	local cameraMoveable=true
	tinsert(cleantable,Connect(insGet(uis,"TouchMoved"),function(inputObject)
		local touchPos=insGet(inputObject,"Position")
		local touchX=v3Get(touchPos,"X")
		local touchY=v3Get(touchPos,"Y")
		if inputObject==thumbstickInputObject then
			local direction=insGet(inputObject,"Position")-thumbstickTouchStart
			local directionMag=vmagnitude(direction)/thumbstickSizeMultiplier
			if directionMag>0.05 then
				direction=vnormalize(direction)*min(1,(directionMag-0.05)/0.95) 
				isWalking=true
				FWmovement=-v3Get(direction,"Y")
				RTmovement=v3Get(direction,"X")
			else
				isWalking=false
			end
		elseif inputObject==jumpInputObject then
			jumpingInput=touchY>jumpStartY and touchX>jumpStartX and touchX<jumpEndX and touchY<jumpEndY
		else
			if cameraZoomInputObject then
				local newMagnitude=vmagnitude(insGet(cameraRotateInputObject,"Position")-insGet(cameraZoomInputObject,"Position"))
				if freecam then
					local delta=(newMagnitude-cameraZoomInputMagnitude)*0.04
					camcf=cfAdd(camcf,camcfLV*delta)
				elseif typeof(scriptablecamcf)~="CFrame" then
					cammag+=(newMagnitude-cameraZoomInputMagnitude)*0.04*(0.75-cammag/4)
					if cammag<0 then
						firstperson=false
					else
						cammag=0
						firstperson=true
					end
				end
				cameraZoomInputMagnitude=newMagnitude
			elseif inputObject==cameraRotateInputObject and cameraMoveable and typeof(scriptablecamcf)~="CFrame" then
				local rotation=GetMouseDelta(uis)
				camrotX=clamp(v2Get(rotation,"Y")*mradN05+camrotX,npi2,pi2)
				camrotY=v2Get(rotation,"X")*mradN05+camrotY
				camrot=angles(camrotX,camrotY,0,enumYXZ)
				camcfLV=cfGet(camrot,"LookVector")
				camcfRV=cfGet(camrot,"RightVector")
				if freecam then
					camcf=cfAdd(camrot,cfGet(camcf,"Position"))
				end
			end
		end
	end))
	tinsert(cleantable,Connect(insGet(uis,"TouchEnded"),function(inputObject)
		if inputObject==thumbstickInputObject then
			thumbstickInputObject=nil
			isWalking=false
		elseif inputObject==jumpInputObject then
			jumpInputObject=nil
			jumpingInput=false
		elseif inputObject==cameraRotateInputObject then
			cameraRotateInputObject=nil
			cameraZoomInputObject=nil
		elseif inputObject==cameraZoomInputObject then
			cameraZoomInputObject=nil
		end
	end))

	local refreshTouchRegions=@native function()
		local sX=insGet(mouse,"ViewSizeX")
		local sY=insGet(mouse,"ViewSizeY")
		local isSmallScreen=min(sX,sY)<=500

		sY+=insGet(gs,"TopbarInset").Height

		thumbstickEndX=sX*0.4
		thumbstickStartY=(sY+0)*0.333

		if isSmallScreen then
			thumbstickSizeMultiplier=35
			jumpStartX=sX-95
			jumpStartY=sY-90
			jumpEndX=jumpStartX+70
			jumpEndY=jumpStartY+70
		else
			thumbstickSizeMultiplier=60
			jumpStartX=sX-170
			jumpStartY=sY-210
			jumpEndX=jumpStartX+120
			jumpEndY=jumpStartY+120
		end
	end
	tinsert(cleantable,Connect(GetPropertyChangedSignal(mouse,"ViewSizeX"),refreshTouchRegions))
	tinsert(cleantable,Connect(GetPropertyChangedSignal(mouse,"ViewSizeY"),refreshTouchRegions))
	tinsert(cleantable,Connect(GetPropertyChangedSignal(gs,"TopbarInset"),refreshTouchRegions))
	refreshTouchRegions()

	local mouseCameraMove=false
	tinsert(cleantable,Connect(insGet(uis,"InputChanged"),function(a,b)
		if b or typeof(scriptablecamcf)=="CFrame" then return end
		local inputType=insGet(a,"UserInputType")
		if mouseCameraMove and inputType==enumMM and cameraMoveable then
			local rotation=GetMouseDelta(uis)
			camrotX=clamp(v2Get(rotation,"Y")*mradN05+camrotX,npi2,pi2)
			camrotY=v2Get(rotation,"X")*mradN05+camrotY
			camrot=angles(camrotX,camrotY,0,enumYXZ)
			camcfLV=cfGet(camrot,"LookVector")
			camcfRV=cfGet(camrot,"RightVector")
			if freecam then
				camcf=cfAdd(camrot,cfGet(camcf,"Position"))
			end
		elseif inputType==enumMW then
			if freecam then
				camcf=cfAdd(camcf,camcfLV*(v3Get(insGet(a,"Position"),"Z")*2))
			else
				cammag+=v3Get(insGet(a,"Position"),"Z")*(0.75-cammag/4)
				if cammag<0 then
					firstperson=false
				else
					cammag=0
					firstperson=true
				end
			end
		end
	end))
	
	tinsert(cleantable,Connect(insGet(uis,"PointerAction"),function(a,b,c,d) --"every updates you guys made are from me" yeah sure bud, yours didnt even have this lmao, now copy and paste this to your update to prove my point
		if d or typeof(scriptablecamcf)=="CFrame" then return end
		if mouseCameraMove and v2Get(b,"Magnitude")>0 then
			camrotX=clamp(v2Get(b,"Y")*mradN05+camrotX,npi2,pi2)
			camrotY+=v2Get(b,"X")*mradN05
			camrot=angles(camrotX,camrotY,0,enumYXZ)
			camcfLV=cfGet(camrot,"LookVector")
			camcfRV=cfGet(camrot,"RightVector")
			if freecam then
				camcf=cfAdd(camrot,cfGet(camcf,"Position"))
			end
		end
		local zoom=a+c
		if zoom~=0 then
			if freecam then
				camcf=cfAdd(camcf,camcfLV*(zoom*2))
			else
				cammag+=zoom*(0.75-cammag/4)
				if cammag<0 then
					firstperson=false
				else
					cammag=0
					firstperson=true
				end
			end
		end
	end))

	local predictionfling=function(target)
		if not allowfling then
			return false
		end
		if typeof(target)~="Instance" then 
			target=insGet(mouse,"Target")
			if not target then
				return false
			end
		end
		if not IsDescendantOf(target,ws) then
			return false
		end
		if IsA(target,"BasePart") or IsA(target,"Humanoid") then 
			target=insGet(target,"Parent") 
			if IsA(target,"Accessory") then
				target=insGet(target,"Parent")
			end
		end
		if (not IsA(target,"Model")) or (target==c) or IsDescendantOf(target,c) then
			return false
		end
		local targetpart=QueryDescendants(target,">BasePart#HumanoidRootPart")[1] or QueryDescendants(target,">BasePart#Torso")[1] or QueryDescendants(target,">BasePart#UpperTorso")[1]
		if (not targetpart) or (flingtable[targetpart]~=nil) then
			return false
		end
		if highlightflingtargets then
			local h=i("Highlight")
			insSet(h,"Name",rs())
			insSet(h,"Adornee",target)
			insSet(h,"OutlineColor",c3(1,0,0))
			insSet(h,"Parent",hlp)
			flingtable[targetpart]=h
		else
			flingtable[targetpart]=false
		end
		if isRCD then
			local root=rootpart.p
			local p,t=next(flingtable1)
			if p then
				p=t.p
			else
				p=targetpart
			end
			if root and p and isPhysicsRepFling then
				if sethiddenproperty then
					sethiddenproperty(root,"PhysicsRepRootRef",ih(p))
				elseif setscriptable then
					setscriptable(root,"PhysicsRepRootRef",true)
					insSet(root,"PhysicsRepRootRef",ih(p))
				elseif c then
					local hrpcpp=insGet(root,"CustomPhysicalProperties")
					local tparent=insGet(p,"Parent")
					local tcfr=insGet(p,"CFrame")
										
					local model=i("Model")
					local hum=i("Humanoid")
					insSet(hum,"Parent",model)
										
					for i,v in next,humstatetypes do
						SetStateEnabled(hum,v,false)
					end
					
					local restorejoints={}
					for i,v in next,GetJoints(root) do
						restorejoints[v]=insGet(v,"Parent")
						insSet(v,"Parent",nil)
					end
					for i,v in next,GetJoints(root) do
						restorejoints[v]=insGet(v,"Parent")
						insSet(v,"Parent",nil)
					end
	
					local tcfr1=cf(cfGet(tcfr,"Position")+v3_010*mrandom(10000,20000))
					insSet(p,"Parent",ws)
					insSet(p,"CFrame",tcfr1)
					insSet(root,"Parent",model)
					insSet(root,"CFrame",cfAdd(tcfr1,(insGet(hrp,"Size")+insGet(p,"Size"))*sm))
					insSet(p,"CustomPhysicalProperties",dense)
					insSet(root,"CustomPhysicalProperties",light)
					insSet(model,"Parent",ws)
					ChangeState(hum,enumrunning)
					if not insGet(p,"CanCollide") then
						insSet(p,"CanCollide",true)
					end
					Wait(stepped)
					for i,v in next,restorejoints do
						insSet(i,"Parent",v)
					end
					insSet(p,"CFrame",tcfr)
					insSet(p,"Parent",tparent)
					insSet(root,"CustomPhysicalProperties",hrpcpp)
					insSet(root,"Parent",c)
					Destroy(model)
				end
			end
			tinsert(flingtable1,{p=targetpart})
		end
		return true
	end

	if ctrlclicktp then
		ctrlclicktp=keyLeftControl
		local tpoff=v3_010*3
		if clickfling then
			tinsert(cleantable,Connect(insGet(mouse,"Button1Down"),function()
				if insGet(mouse,"Target") then
					if IsKeyDown(uis,ctrlclicktp) then
						pos=cfGet(insGet(mouse,"Hit"),"Position")+tpoff
						cfr=cfl(pos,pos+camcfLV*v3_101)
						cframes[rootpart]=cfr
						xzvel=v3_0
						Yvel=0
					else
						predictionfling()
					end
				end
			end))
		else
			tinsert(cleantable,Connect(insGet(mouse,"Button1Down"),function()
				if insGet(mouse,"Target") and IsKeyDown(uis,ctrlclicktp) then
					pos=cfGet(insGet(mouse,"Hit"),"Position")+tpoff
					cfr=cfl(pos,pos+camcfLV*v3_101)
					cframes[rootpart]=cfr
					xzvel=v3_0
					Yvel=0
				end
			end))
		end
	elseif clickfling then
		tinsert(cleantable,Connect(insGet(mouse,"Button1Down"),predictionfling))
	end

	local hhOff=3
	local hhOff1=3.01
	local setHipHeight=@native function(n)
		hhOff=n+3
		hhOff1=n+3.01
	end

	local noYvelTime=1
	local lastsine=sine
	local onground=nil
	local raycastdistance=hhOff
	local con=nil
	local mainFunction=function()
		sine=osclock()
		local delta=sine-lastsine
		deltaTime=min(delta*10,1)
		lastsine=sine

		if shiftlock then
			if allowshiftlock then
				if mouseBehavior~=enumMLC then
					mouseBehavior=enumMLC
					insSet(uis,"MouseBehavior",mouseBehavior)
				end
				mouseCameraMove=true
			else
				shiftlock=false
			end
		elseif firstperson or freecam then
			if mouseBehavior~=enumMLC then
				mouseBehavior=enumMLC
				insSet(uis,"MouseBehavior",mouseBehavior)
			end
			mouseCameraMove=true
		elseif IsMouseButtonPressed(uis,enumMB2) then
			if mouseBehavior~=enumMLCP then
				mouseBehavior=enumMLCP
				insSet(uis,"MouseBehavior",mouseBehavior)
			end
			mouseCameraMove=true
		else
			if mouseBehavior~=enumMD then
				mouseBehavior=enumMD
				insSet(uis,"MouseBehavior",mouseBehavior)
			end
			mouseCameraMove=false
		end

		local raycastresult=Raycast(ws,pos,v3_010*(fpdh-v3Get(pos,"Y")),raycastparams)
		if raycastresult then
			local distance=raycastresult.Distance
			onground=distance<hhOff1
			if onground then
				Yvel=0
				pos+=v3_010*(v3Get(raycastresult.Position,"Y")+hhOff-v3Get(pos,"Y"))*min(delta*20,1)
				if jumpingInput and (jumpPower>0) then
					Yvel=noVelMode and 0 or jumpPower
					onground=false
				end
			else
				Yvel=noVelMode and 0 or Yvel-gravity*delta
				raycastresult=v3Get(raycastresult.Position,"Y")
				if v3Get(pos,"Y")+Yvel*delta<raycastresult then
					Yvel=0
					pos+=v3_010*(raycastresult+hhOff-v3Get(pos,"Y"))
				end
			end
			raycastdistance=distance
		else
			Yvel=0
			raycastdistance=hhOff1
			onground=false
		end
		
		if freecam then
			xzvel=v3_0
			if isWalking then
				local dirv=vnormalize(vnormalize(camcfLV)*FWmovement+vnormalize(camcfRV)*RTmovement)*10*deltaTime
				camcf=cfAdd(camrot,cfGet(cfAdd(camcf,dirv),"Position"))
			end
			if onground then
				cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
				cframes[rootpart]=cfr
				insSet(cam,"CFrame",camcf)
				lerpsIdle()
				noYvelTime=min(noYvelTime+delta*0.3,1)
				xzvel*=(1-noYvelTime)
			elseif Yvel>0 then
				pos+=v3_010*Yvel*delta
				cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
				cframes[rootpart]=cfr
				insSet(cam,"CFrame",camcf)
				lerpsJump()
				noYvelTime=0
			else
				pos+=v3_010*Yvel*delta
				cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
				cframes[rootpart]=cfr
				insSet(cam,"CFrame",camcf)
				lerpsFall()
				noYvelTime=0
			end
		elseif firstperson then
			if isWalking then
				if walkSpeed==0 then
					xzvel=v3_0
					if onground then
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsIdle()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel*=(1-noYvelTime)
					elseif Yvel>0 then
						pos+=v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsJump()
						noYvelTime=0
					else
						pos+=v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsFall()
						noYvelTime=0
					end
				else
					xzvel=noVelMode and v3_0 or vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
					if onground then
						pos+=xzvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsWalk()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel*=(1-noYvelTime)
					elseif Yvel>0 then
						pos+=(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsJump()
						noYvelTime=0
					else 
						pos+=(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsFall()
						noYvelTime=0
					end
				end
			else
				xzvel=v3_0
				if onground then
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsIdle()
					noYvelTime=min(noYvelTime+delta*0.3,1)
					xzvel*=(1-noYvelTime)
				elseif Yvel>0 then
					pos+=v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsJump()
					noYvelTime=0
				else
					pos+=v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsFall()
					noYvelTime=0
				end
			end
		elseif shiftlock then	
			if isWalking then
				if walkSpeed==0 then
					xzvel=v3_0
					if onground then
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsIdle()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel*=(1-noYvelTime)
					elseif Yvel>0 then
						pos+=v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsJump()
						noYvelTime=0
					else
						pos+=v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsFall()
						noYvelTime=0
					end
				else
					xzvel=noVelMode and v3_0 or vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
					if onground then
						pos+=xzvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsWalk()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel*=(1-noYvelTime)
					elseif Yvel>0 then
						pos+=(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsJump()
						noYvelTime=0
					else
						pos+=(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsFall()
						noYvelTime=0
					end
				end
			else
				xzvel=v3_0
				if onground then
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsIdle()
					noYvelTime=min(noYvelTime+delta*0.3,1)
					xzvel*=(1-noYvelTime)
				elseif Yvel>0 then
					pos+=v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsJump()
					noYvelTime=0
				else
					pos+=v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsFall()
					noYvelTime=0
				end
			end
		else
			if isWalking then
				if walkSpeed==0 then
					xzvel=v3_0
					if onground then
						cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsIdle()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel*=(1-noYvelTime)
					elseif Yvel>0 then
						pos+=v3_010*Yvel*delta
						cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsJump()
						noYvelTime=0
					else
						pos+=v3_010*Yvel*delta
						cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsFall()
						noYvelTime=0
					end
				else
					xzvel=noVelMode and v3_0 or vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
					if onground then
						pos+=xzvel*delta
						cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsWalk()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel*=(1-noYvelTime)
					elseif Yvel>0 then
						pos+=(xzvel+(v3_010*Yvel))*delta
						cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsJump()
						noYvelTime=0
					else
						pos+=(xzvel+(v3_010*Yvel))*delta
						cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
						lerpsFall()
						noYvelTime=0
					end
				end
			else
				xzvel=v3_0
				if onground then
					cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
					camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsIdle()
					noYvelTime=min(noYvelTime+delta*0.3,1)
					xzvel*=(1-noYvelTime)
				elseif Yvel>0 then
					pos+=v3_010*Yvel*delta
					cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
					camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsJump()
					noYvelTime=0
				else
					pos+=v3_010*Yvel*delta
					cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
					camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
					lerpsFall()
					noYvelTime=0
				end
			end
		end

		refreshjointsI(rootpart)
		tclear(refreshedjoints)

		local sine15=sine*15
		local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
		local idleoff=idlerv*0.003910064697265625 --0.0156402587890625/4

		local claimpos=insGet(primarypart,"Position")
		local claimposY=v3Get(claimpos,"Y")
		for i,v in next,cframes do
			local part=i.p
			local novel=i.n

			if part then
				if novel then
					local vpos=cfGet(v,"Position")
					if novoid and (v3Get(vpos,"Y")<novoid) then
						v=cfAdd(v,v3_010*(novoid-v3Get(vpos,"Y")))
					end
					insSet(part,"CFrame",v)
					insSet(part,"AssemblyAngularVelocity",v3_0)
				else
					if insGet(part,"ReceiveAge")==0 and (IsDescendantOf(part,ws) and not GetJoints(part)[1]) and not IsGrounded(part) then
						if isRCD and i==rootpart then
							local i,t=next(flingtable1)
							if i then
								local p=t.p
								if p then
									local startpos=t.l
									local stoptime=t.t
									if not startpos then
										startpos=insGet(p,"Position")
										t.l=startpos
									end
									if not stoptime then
										stoptime=sine+((isPhysicsRepFling and 0.15) or 3)
										t.t=stoptime
									end
									
									if sine>stoptime or (IsGrounded(p) or not IsDescendantOf(p,ws)) or vmagnitude(startpos-insGet(p,"Position"))>200 then
										local highlight=flingtable[p]
										if highlight then
											Destroy(highlight)
										end
										flingtable[p]=nil
										tremove(flingtable1,i)
										tclear(t)
										continue
									end
									
									if isPhysicsRepFling then
										local tcf=insGet(p,"CFrame")
										if novoid and (cfGet(tcf,"Y")<novoid) then
											tcf=cfAdd(tcf,v3_010*(novoid-cfGet(tcf,"Y")))
										end
										insSet(part,"CFrame",cfMul(tcf,angles(0,sine,0)))
										insSet(part,"AssemblyLinearVelocity",flingvel)
									else
										local tcf=cfAdd(insGet(p,"CFrame"),insGet(p,"AssemblyLinearVelocity")*(sin(sine*15)+1))
										if novoid and (cfGet(tcf,"Y")<novoid) then
											tcf=cfAdd(tcf,v3_010*(novoid-cfGet(tcf,"Y")))
										end
										insSet(part,"CFrame",tcf)
										insSet(part,"AssemblyLinearVelocity",insGet(p,"AssemblyLinearVelocity")*v3_101*75)
									end
									insSet(part,"AssemblyAngularVelocity",flingvel)
									
									continue
								end
							end
						end
						local placeholder=i.v
						local vpos=cfGet(v,"Position")
						if novoid and (v3Get(vpos,"Y")<novoid) then
							v=cfAdd(v,v3_010*(novoid-v3Get(vpos,"Y")))
						end
						local lastpos=i.l
						local vel=(vpos-lastpos)/delta
						local mag=vmagnitude(vel)
						if mag<0.11730194091796875 then --0.0156402587890625*15/2
							if placeholder and i.b then
								insSet(placeholder,"Parent",nil)
								i.b=false
							end
							i.l=cfGet(v,"Position")
							v=cfAdd(v,idleoff)
						elseif mag>speedlimit then
							if placeholder then
								insSet(placeholder,"CFrame",v)
								if not i.b then
									insSet(placeholder,"Parent",ws)
									i.b=true
								end
							end
							vel=vnormalize(vel)*speedlimit
							local newpos=lastpos+vel*delta
							v=cfAdd(cfGet(v,"Rotation"),newpos)
							i.l=newpos
						else
							if placeholder and i.b then
								insSet(placeholder,"Parent",nil)
								i.b=false
							end
							i.l=cfGet(v,"Position")
						end
						local claimtime=i.c
						if claimtime then
							if (sine-claimtime)<retVelTime then
								local offsetToPrimaryPart=claimpos-cfGet(v,"Position")
								local a=625.5001+wsGravity*-2*v3Get(offsetToPrimaryPart,"Y")
								if a>0 then
									insSet(part,"AssemblyLinearVelocity",v3_net+offsetToPrimaryPart*v3_101/((25.01+sqrt(a))/wsGravity))
								else
									insSet(part,"AssemblyLinearVelocity",v3_net+offsetToPrimaryPart*v3_101/(30.010999900019996/wsGravity))
								end
							else
								local vel1=vel*noYvelTime+xzvel
								if vmagnitude(vel1)>25.01 then
									insSet(part,"AssemblyLinearVelocity",vnormalize(vel1)*v3_xzL+v3_net)
								else
									insSet(part,"AssemblyLinearVelocity",vel1*v3_xz+v3_net)
								end
							end
						else
							i.c=sine
							local vel1=vel*noYvelTime+xzvel
							if vmagnitude(vel1)>25.01 then
								insSet(part,"AssemblyLinearVelocity",vnormalize(vel1)*v3_xzL+v3_net)
							else
								insSet(part,"AssemblyLinearVelocity",vel1*v3_xz+v3_net)
							end
						end
						insSet(part,"CFrame",v)
						insSet(part,"AssemblyAngularVelocity",idlerv)
					else
						i.c=nil
						i.l=insGet(part,"Position")
						local placeholder=i.v
						if placeholder then
							insSet(placeholder,"CFrame",v)
							if not i.b then
								insSet(placeholder,"Parent",ws)
								i.b=true
							end
						end
					end
				end
			else
				local placeholder=i.v
				if placeholder then
					insSet(placeholder,"CFrame",v)
					if not i.b then
						insSet(placeholder,"Parent",ws)
						i.b=true
					end
				end
			end
		end
		
		setsimrad()
	end

	sine=osclock()
	lastsine=sine
	tinsert(cleantable,Connect(heartbeat,mainFunction))
	mainFunction()

	local refreshjoints=@native function(v) --use this on the main part if u have parts that
		refreshjointsI(v) --are connected with each other but arent connected to rootpart
		tclear(refreshedjoints)
	end

	local legcfR=cf(1,-1,0)
	local legcfL=cf(-1,-1,0)
	local raydir=v3_010*-2
	local raycastlegs=function() --this returns 2 values: right leg raycast offset, left leg raycast offset
		local rY=Raycast(ws,cfGet(cfMul(cfr,legcfR),"Position"),raydir,raycastparams)
		local lY=Raycast(ws,cfGet(cfMul(cfr,legcfL),"Position"),raydir,raycastparams)
		if rY then
			if lY then
				return v3Get(rY.Position,"Y")-(v3Get(pos,"Y")-3),v3Get(lY.Position,"Y")-(v3Get(pos,"Y")-3)
			else
				return v3Get(rY.Position,"Y")-(v3Get(pos,"Y")-3),0
			end
		elseif lY then
			return 0,v3Get(lY.Position,"Y")-(v3Get(pos,"Y")-3)
		else
			return 0,0
		end
	end

	local velbycfrvec=@native function() --this returns 2 values: forward/backwards movement (from -1 to 1), right/left movement (from -1 to 1)
		local velN=xzvel/walkSpeed
		local fw=cfGet(cfr,"LookVector")*velN
		local rt=cfGet(cfr,"RightVector")*velN
		return v3Get(fw,"X")+v3Get(fw,"Z"),v3Get(rt,"X")+v3Get(rt,"Z")
	end

	local lastvel=v3_0
	local velchg1=v3_0
	local velchgbycfrvec=@native function() --this returns 2 values: forward/backwards velocity change, right/left velocity change
		velchg1+=lastvel-xzvel --i recommend setting velchg1 to v3_0 when u start using this function or it will look worse
		lastvel=xzvel
		velchg1-=velchg1*(deltaTime/2)
		local fw=cfGet(cfr,"LookVector")*velchg1/32
		local rt=cfGet(cfr,"RightVector")*velchg1/32
		return v3Get(fw,"X")+v3Get(fw,"Z"),v3Get(rt,"X")+v3Get(rt,"Z")
	end

	local lastYvel=0
	local velYchg1=0
	local velYchg=@native function() --this returns Y axis velocity change
		velYchg1=clamp(velYchg1+(lastYvel-Yvel),-50,50) --i recommend setting velYchg1 to 0 when u start using this function or it will look worse
		lastYvel=Yvel
		velYchg1-=velYchg1*(deltaTime/2)
		return velYchg1
	end

	local rotToMouse=@native function(alpha) --this rotates ur character towards your mouse hit position
		local pos1=pos*v3_010+cfGet(insGet(mouse,"Hit"),"Position")*v3_101
		if pos~=pos1 then --could make nan rotation
			cfr=Lerp(cfr,cfl(pos,pos1),alpha or deltaTime)
		end
	end
	
	local rotToPos=@native function(v,alpha) --this rotates ur character towards specific position
		local pos1=pos*v3_010+v*v3_101
		if pos~=pos1 then --could make nan rotation
			cfr=Lerp(cfr,cfl(pos,pos1),alpha or deltaTime)
		end
	end

	local glitchJoint=@native function(joint,targetGlitchTime,delayFrom,delayTo,radiansFrom,radiansTo) 
		if sine>targetGlitchTime then --example usage: local glitchtime=0 addMode("x",{idle=function() glitchtime=glitchJoint(joint,glitchtime,0.2,0.4,-0.1,0.1) end})
			radiansFrom=radiansFrom*100
			radiansTo=radiansTo*100
			joint.C0=cfMul(joint.C0,angles(mrandom(radiansFrom,radiansTo)/100,mrandom(radiansFrom,radiansTo)/100,mrandom(radiansFrom,radiansTo)/100)) 
			return sine+mrandom(delayFrom*100,delayTo*100)/100
		end
		return targetGlitchTime
	end
	local setWalkSpeed=@native function(n)
		if type(n)~="number" then
			n=16
		end
		walkSpeed=n
	end
	local setJumpPower=@native function(n)
		if type(n)~="number" then
			n=50
		end
		jumpPower=n
	end
	local setGravity=@native function(n)
		if type(n)~="number" then
			n=196.2
		end
		gravity=n
	end
	local setCfr=@native function(v) --sets character cframe
		local type=typeof(v)
		if type=="CFrame" then
			local newpos=cfGet(v,"Position")
			if not freecam then
				camcf=cfAdd(camcf,newpos-pos)
				insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
			end
			cfr=v
			cframes[rootpart]=cfr
			pos=newpos
		elseif type=="Vector3" then
			if not freecam then
				camcf=cfAdd(camcf,v-pos)
				insSet(cam,"CFrame",scriptablecamcf or cfMul(camcf,camoff))
			end
			cfr=cfAdd(cfGet(cfr,"Rotation"),v)
			cframes[rootpart]=cfr
			pos=v
		end
	end
	local setCamCF=@native function(v) --sets camera cframe offset
		local type=typeof(v)
		if type=="CFrame" then
			camoff=v
		elseif type=="Vector3" then
			camoff=cf(v)
		end
	end
	local setCamScriptableCF=@native function(v) --sets camera cframe freely (set nil to set back to normal)
		local type=typeof(v)
		if type=="CFrame" then
			scriptablecamcf=v
			camcfLV=cfGet(scriptablecamcf,"LookVector")
			camrot=cfl(v3_0,camcfLV)
			camrotX,camrotY=ToEulerAnglesYXZ(camrot)
			camcfRV=cfGet(camrot,"RightVector")
			cammag=-vmagnitude((cfGet(scriptablecamcf,"Position")-(pos+v3_0150)))
		elseif type=="Vector3" then
			scriptablecamcf=cf(v)
			camcfLV=cfGet(scriptablecamcf,"LookVector")
			camrot=cfl(v3_0,camcfLV)
			camrotX,camrotY=ToEulerAnglesYXZ(camrot)
			camcfRV=cfGet(camrot,"RightVector")
			cammag=-vmagnitude((cfGet(scriptablecamcf,"Position")-(pos+v3_0150)))
		else
			scriptablecamcf=nil
		end
	end
	local setshiftlock=function(v) --turns on/off shiftlock
		shiftlock=v
	end
	local setfreecam=function(v) --turns on/off freecam
		freecam=v
		insSet(gs,"TouchControlsEnabled",not v)
	end
	local setNoVelocity=@native function(b) --true if u want yo char to has no velocity
		noVelMode=b
		if b then
			xzvel=v3_0
			Yvel=0
		end
	end
	local getWalkSpeed=function()
		return walkSpeed
	end
	local getJumpPower=function()
		return jumpPower
	end
	local getHipHeight=function(n)
		return hhOff
	end
	local getGravity=function(n)
		return gravity
	end
	local getVel=@native function() --returns character velocity
		return xzvel+v3_010*Yvel --important: use only in lerps or it might not work
	end
	local getDirs=@native function() --returns character move directions
		return isWalking and vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+v3Get(camcfRV*v3_101,"Unit")*RTmovement) or v3_0
	end
	local getFloorDistance=function() --returns raycast's floor distance
		return raycastdistance
	end
	local getCamCF=function() --returns camera cframe
		return camcf
	end
	local isFirstPerson=function() --returns true if user is in first person camera mode
		return firstperson
	end
	local isShiftlock=function() --returns true if user is on shiftlock mode
		return shiftlock
	end
	local isOnGround=function() --returns true if character is on ground
		return onground
	end
	local isWalking=function() --returns true if character is walking
		return isWalking
	end
	local isFlinging=function(i) --returns true if target (or target's descendant) is scheduled to be flung
		if not i then
			return false
		end
		if not IsDescendantOf(i,ws) then
			return false
		end
		if IsA(i,"BasePart") or IsA(i,"Humanoid") then 
			i=insGet(i,"Parent")
			if IsA(i,"Accessory") then
				i=insGet(i,"Parent")
			end
		end
		if (not IsA(i,"Model")) or (i==c) or (IsDescendantOf(i,c)) then
			return false
		end
		for p in next,flingtable do
			if IsDescendantOf(p,i) then
				return true
			end
		end
		return false
	end
	local setCameraMoveable=function(v) --make camera movement to true or false
		cameraMoveable=v
	end
	local onRefresh=function(f)
		if type(f)=="function" then
			refreshf=f
		end
	end
	local enableKeyCode=function(a,b) --enable/disable specific KeyCode (for reanimation)
		blockedKeys[a]=b
	end
	
	currenttable={
		characters=characters,
		rayexclusions=rayexclusions,
		rootparts=rootparts,
		cframes=cframes,
		joints=joints,
		rayfilter=rayfilter,
		refreshrayfilter=refreshrayfilter,
		fling=predictionfling,
		predictionfling=predictionfling,
		refreshjoints=refreshjoints,
		raycastlegs=raycastlegs,
		velbycfrvec=velbycfrvec,
		velchgbycfrvec=velchgbycfrvec,
		velYchg=velYchg,
		addmode=addmode,
		getPart=getPart,
		getPartFromMesh=getPartFromMesh,
		getAccWeldFromMesh=getAccWeldFromMesh,
		getPartsFromMesh=getPartsFromMesh,
		getAccWeldsFromMesh=getAccWeldsFromMesh,
		getJoint=getJoint,
		getPartJoint=getPartJoint,
		getAccessories=getAccessories,
		rotToMouse=rotToMouse,
		rotToPos=rotToPos,
		glitchJoint=glitchJoint,
		setWalkSpeed=setWalkSpeed,
		setJumpPower=setJumpPower,
		setGravity=setGravity,
		setCfr=setCfr,
		setCamCF=setCamCF,
		setshiftlock=setshiftlock,
		setfreecam=setfreecam,
		setCameraMoveable=setCameraMoveable,
		setNoVelocity=setNoVelocity,
		getWalkSpeed=getWalkSpeed,
		getJumpPower=getJumpPower,
		getHipHeight=getHipHeight,
		getVel=getVel,
		getDirs=getDirs,
		getFloorDistance=getFloorDistance,
		getCamCF=getCamCF,
		setCamScriptableCF=setCamScriptableCF,
		isFirstPerson=isFirstPerson,
		isShiftlock=isShiftlock,
		isOnGround=isOnGround,
		isWalking=isWalking,
		isFlinging=isFlinging,
		setHipHeight=setHipHeight,
		onRefresh=onRefresh,
		enableKeyCode=enableKeyCode
	}
	return currenttable
end

local lib={reanimate=reanimate,stopreanimate=stopreanimate,timeQueryDescendants=timeQueryDescendants,getMetamethodFromErrorStack=getMetamethodFromErrorStack,insSet=insSet,insGet=insGet,cfGet=cfGet,cfMul=cfMul,cfAdd=cfAdd,v3Get=v3Get,v2Get=v2Get,rs=rs,mouse=mouse,emptyfunction=emptyfunction,Draggable=Draggable,applysettings=applysettings,returnDelta=returnDelta,getcharacter=getcharacter,cleantable=cleantable,onstopcallback=onstopcallback,currenttable=function() return currenttable end,pdfunc=emptyfunction,availableSettings=availableSettings,addSecrets=emptyfunction}

-- ===== 防重复执行：同一时刻只允许一个实例在跑 =====
do
	local G=getgenv and getgenv() or _G
	local running=false
	local origReanimate=lib.reanimate
	local origStop=lib.stopreanimate

	local function clearSelf()
		local s=G[SESSION_KEY]
		if (type(s)=="table") and (s.lib==lib) then
			G[SESSION_KEY]=nil
		end
	end

	local function killOthers()
		local old=G[SESSION_KEY]
		if (type(old)=="table") and (old.lib~=lib) and (type(old.stop)=="function") then
			pcall(old.stop)   -- 旧实例的 stopreanimate：断开连接、销毁假部件、还原设置
			G[SESSION_KEY]=nil
			return true
		end
		return false
	end

	lib.reanimate=function(...)
		killOthers()
		if running then
			return -- 本实例已经在跑，再调用就忽略（原版是「停掉自己然后什么都不做」）
		end
		running=true
		local ok,err=pcall(origReanimate,...)
		if not ok then
			running=false
			clearSelf()
			error(err,0)
		end
		if not lib.getcharacter() then
			running=false   -- 没拿到角色，等于没启动
			clearSelf()
			return
		end
		G[SESSION_KEY]={lib=lib,stop=lib.stopreanimate,version=SESSION_VERSION,started=os.clock()}
	end

	lib.stopreanimate=function(...)
		running=false
		local r=origStop(...)
		clearSelf()
		return r
	end

	-- 调试用：getgenv().FDlessMergedInfo() / FDlessMergedKill()
	G.FDlessMergedInfo=function()
		local s=G[SESSION_KEY]
		if type(s)~="table" then
			return "当前没有正在运行的实例"
		end
		return {
			version=s.version,
			seconds=os.clock()-s.started,
			alive=(s.lib.getcharacter()~=nil),
			mine=(s.lib==lib)
		}
	end
	G.FDlessMergedKill=function()
		local s=G[SESSION_KEY]
		if type(s)=="table" and type(s.stop)=="function" then
			pcall(s.stop)
		end
		G[SESSION_KEY]=nil
		return true
	end
end

return lib
