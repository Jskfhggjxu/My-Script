local args = {
	"cmd",
	"-gh 77572384673142,77572384673142,77572384673142,77572384673142,77572384673142,77572384673142,6904794619"
}
game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
wait(2)
-- // Astaria Glitcher //
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/move script.lua"))()
end)
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/VirtualKeyboard.lua"))()
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Cool-Reanimate.lua"))()

local Count = 1
function AlignCharacter(Part0,Part1,Position,Angle)
    local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..Count
    AlignPos.ApplyAtCenterOfMass = true;
    AlignPos.MaxForce = 5772000--67752;
    AlignPos.MaxVelocity = math.huge/9e110;
    AlignPos.ReactionForceEnabled = false;
    AlignPos.Responsiveness = 200;
    AlignPos.RigidityEnabled = false;
    local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..Count
    AlignOri.MaxAngularVelocity = math.huge/9e110;
    AlignOri.MaxTorque = 5772000
    AlignOri.PrimaryAxisOnly = false;
    AlignOri.ReactionTorqueEnabled = false;
    AlignOri.Responsiveness = 200;
    AlignOri.RigidityEnabled = false;
    local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..Count
    local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..Count
    local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..Count
    local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..Count
    AttachmentC.Orientation = Angle
    AttachmentA.Position = Position
    AlignPos.Attachment1 = AttachmentA;
    AlignPos.Attachment0 = AttachmentB;
    AlignOri.Attachment1 = AttachmentC;
    AlignOri.Attachment0 = AttachmentD;
    Count = Count + 1
end

local b, script = xpcall(function()
	return game:GetObjects("rbxassetid://115601638244863")[1]
end, function()
	return script
end)

local P1 = game.Players.LocalPlayer
local Player = P1
local C = P1.Character
local Hum = C.Humanoid

script.Parent = Player.Character
local CAS = {Actions={}}
local Event2 = Instance.new("BindableEvent")
Event2.Parent = Player.Character
Event2.Name = "UserInput_Event"
local FakeEvent = function()
	local T = {_FakeEvent=true}
	T.Connect = function(SelfInjury,FalconPunchIdk)SelfInjury.Function=FalconPunchIdk end
	T.Connect = T.Connect
	return T
end
local M = {
	Target=nil,
	Hit=CFrame.new(),
	KeyDown=FakeEvent(),
	KeyUp=FakeEvent(),
	Button1UP=FakeEvent(),
	Button1DOWN=FakeEvent()
}
local UIS = {InputBegan=FakeEvent(),InputEnded=FakeEvent()}

function CAS:BindAction(nAmE,Happy,Touch,TMinus)
	CAS.Actions[nAmE] = {Name=nAmE,Function=Happy,Keys={TMinus}}
end

function CAS:UnbindAction(Name)
	CAS.Actions[Name] = nil
end

local function TEA(Self,EVOLVE,Okey)
	local T = M[EVOLVE]
	if T and T._FakeEvent and T.Function then
		T.Function(Okey)
	end
end

M.TrigEvent = TEA
UIS.TrigEvent = TEA
Event2.Event:Connect(function(Player,IO)

	if Player~=Player then 
		return 
	end

	if IO.isMouse then
		M.Target = IO.Target
		M.Hit = IO.Hit
	elseif IO.UserInputType == Enum.UserInputType.MouseButton1 then
		if IO.UserInputState == Enum.UserInputState.Begin then
			M.TrigEvent("Button1DOWN")
		else
			M.TrigEvent("Button1UP")
		end
	else
		for n,t in pairs(CAS.Actions) do
			for _,k in pairs(t.Keys) do
				if k==IO.KeyCode then
					t.Function(t.Name,IO.UserInputState,IO)
				end
			end
		end
		if IO.UserInputState == Enum.UserInputState.Begin then
			M:TrigEvent("KeyDown",IO.KeyCode.Name:lower())
			UIS:TrigEvent("InputBegan",IO,false)
		else
			M:TrigEvent("KeyUp",IO.KeyCode.Name:lower())
			UIS:TrigEvent("InputEnded",IO,false)
		end
	end
end)
Mouse,Mice,UserInputService,ContextGirlActioonService = M,M,UIS,CAS
script.ModeFunction.Disabled = false
----------------------------------------------------------------------------
local rad = math.rad;
local cos = math.cos;
local sin = math.sin;
local tan = math.tan; 
local pi = math.pi;
local cosh = math.cosh;
local sinh = math.sinh;
local random = math.random;
local abs = math.abs;
local ceil = math.ceil;
local random = math.random;
local LerpFactor, Alpha = .1,.1
local sine = 0
local change = 1
local Side = 1
-- Wing And Combat.
local MusicVolume = 0
local Combat = false
local Aura = true
local Side = 1
--I DON'T KNOW COMBATS.
local Mode = nil
local Event = script.Mode
local Visualizer = 0
-- // Error's Function Apparently.
local PrimaryError = Color3.fromRGB(0, 0, 0)
local SecondaryError = Color3.fromRGB(155, 0, 0)
local TertiaryError = Color3.fromRGB(255, 0, 0)
-------------------------------------------
local ModeValue = script.SomeElse.WingZ.ModeValue
ModeValue.Value = "Excession"
-- Ceasing Animate, I am Ceasening the Animation with a nice plate of crabs! -- //
C:WaitForChild("Animate"):Destroy() -- Animate needs to C e a s e d -- //
C:FindFirstChildOfClass("Humanoid"):WaitForChild("Animator"):Destroy()  -- Just So animate doesn't cause any further problems. -- //
-- Animate has now Ceased me -- //

local Character = C
local Torso = Character.Torso
local rarm = Character["Right Arm"]
local larm = Character["Left Arm"]
local lleg = Character["Left Leg"]
local rleg = Character["Right Leg"]
local ra = Character["Right Arm"]
local la = Character["Left Arm"]
local rl = Character["Right Leg"]
local ll = Character["Left Leg"]
local LS=Torso["Left Shoulder"] 
local LH=Torso["Left Hip"] 
local RS=Torso["Right Shoulder"] 
local RH=Torso["Right Hip"] 
RW, LW=Instance.new("Weld"), Instance.new("Weld") 
RW.Name="Right Shoulder" 
LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
hed = Character.Head
-- CFrame Functions! : >
function QuaternionFromCFrame(cf) 
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
	local trace = m00 + m11 + m22 
	if trace > 0 then 
		local s = math.sqrt(1 + trace) 
		local recip = .5/s 
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*.5
	else 
		local i = 0 
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then 
			i = 2 
		end 
		if i == 0 then 
			local s = math.sqrt(m00-m11-m22+1) 
			local recip = .5/s 
			return .5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
		elseif i == 1 then 
			local s = math.sqrt(m11-m22-m00+1) 
			local recip = .5/s 
			return (m01+m10)*recip, .5*s, (m21+m12)*recip, (m02-m20)*recip 
		elseif i == 2 then 
			local s = math.sqrt(m22-m00-m11+1) 
			local recip = .5/s 
			return (m02+m20)*recip, (m12+m21)*recip, .5*s, (m10-m01)*recip 
		end 
	end 
end

function QuaternionToCFrame(px, py, pz, x, y, z, w) 
	local xs, ys, zs = x + x, y + y, z + z 
	local wx, wy, wz = w*xs, w*ys, w*zs 
	local xx, xy, xz, yy, yz, zz = x*xs, x*ys, x*zs, y*ys, y*zs, z*zs
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end

function QuaternionSlerp(a, b, t) 
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
	local startInterp, finishInterp
	if cosTheta >= .0001 then 
		if (1 - cosTheta) > .0001 then 
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1/sin(theta) 
			startInterp = sin((1-t)*theta)*invSinTheta 
			finishInterp = sin(t*theta)*invSinTheta  
		else 
			startInterp = 1-t 
			finishInterp = t 
		end 
	else 
		if (1+cosTheta) > .0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1/sin(theta) 
			startInterp = sin((t-1)*theta)*invSinTheta 
			finishInterp = sin(t*theta)*invSinTheta 
		else 
			startInterp = t-1 
			finishInterp = t 
		end 
	end 
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

function clerp(a,b,t) 
	local qa, qb = {QuaternionFromCFrame(a)}, {QuaternionFromCFrame(b)}
	local ax, ay, az = a.X, a.Y, a.Z
	local bx, by, bz = b.X, b.Y, b.Z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end

local euler = CFrame.fromEulerAnglesXYZ
local cf = CFrame.new
local angles = CFrame.Angles
local necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
local LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
local RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
local RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
local RootPart=Character.HumanoidRootPart
local RootJoint=RootPart.RootJoint
local RootCF=euler(-1.57,0,3.14)
local root = Character:FindFirstChild'HumanoidRootPart'
player=Player 
CH=Character
RSH=CH.Torso["Right Shoulder"] 
LSH=CH.Torso["Left Shoulder"] 
-- 
RSH.Parent=nil 
LSH.Parent=nil 
-- 
RW.Name="Right Shoulder"
RW.Part0=CH.Torso 
RW.C0=cf(1.5, 0.5, 0)
RW.C1=cf(0, 0.5, 0) 
RW.Part1=CH["Right Arm"] 
RW.Parent=CH.Torso 
-- 
LW.Name="Left Shoulder"
LW.Part0=CH.Torso 
LW.C0=cf(-1.5, 0.5, 0)
LW.C1=cf(0, 0.5, 0) 
LW.Part1=CH["Left Arm"] 
LW.Parent=CH.Torso
-- END IS GONE!

--Admin function
local Admins = {
	-- Owner
	"sv_0331", -- it's just him
	--no one stole your module
	"vpn_l", -- it's just this user
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	"", -- placeholder
	""  -- placeholder
}

--[[local AGU = script.GUIs:WaitForChild("AGInfo")
AGU.Parent = Player.PlayerGui]]
--
local ABIllBoard = script.GUIs:WaitForChild("ABG")
ABIllBoard.Parent = hed
-- Sound
function SoundEffect(Type,SoundId,Parent,Volume,Pitch,TimePosition,cFrame)
	coroutine.resume(coroutine.create(function()
		if Type == "Sound" then
			local sound = Instance.new("Sound",Parent)
			--[[nice]]--
			sound.SoundId = "rbxassetid://".. SoundId
			sound.Volume = Volume
			sound.PlaybackSpeed = Pitch
			sound.TimePosition = TimePosition
			sound:Play()
			wait(5 + sound.TimeLength)
			if sound.Parent ~= nil then
				sound:Destroy()
			end
		elseif Type == "LongSound" then
			local SoundPart = Instance.new("Part",Character)
			SoundPart.Anchored = true
			SoundPart.CanCollide = false
			SoundPart.Size = Vector3.new(0.05,0.05,0.05)
			SoundPart.Transparency = 1
			SoundPart.CFrame = Parent.CFrame
			local sound = Instance.new("Sound",SoundPart)
			sound.SoundId = "rbxassetid://" .. SoundId
			sound.Volume = Volume
			sound.PlaybackSpeed = Pitch
			sound.TimePosition = TimePosition
			sound:Play()
			coroutine.resume(coroutine.create(function()
				repeat  
					swait(5)
					SoundPart.CFrame = Parent.CFrame
				until Parent.parent == nil or SoundPart.Parent == nil
			end))
			wait(30 + sound.TimeLength)
			if SoundPart.Parent ~= nil then
				SoundPart:Destroy()
			end
		elseif Type == "CFrameSound" then
			local SoundPart = Instance.new("Part",Character)
			SoundPart.Anchored = true
			SoundPart.CanCollide = false
			SoundPart.Size = Vector3.new(0.05,0.05,0.05)
			SoundPart.Transparency = 1
			SoundPart.CFrame = cFrame
			local sound = Instance.new("Sound",SoundPart)
			sound.SoundId = "rbxassetid://" .. SoundId
			sound.Volume = Volume
			sound.PlaybackSpeed = Pitch
			sound.TimePosition = TimePosition
			sound:Play()
			wait(30 + sound.TimeLength)
			if SoundPart.Parent ~= nil then
				SoundPart:Destroy()
			end
		elseif Type == "per" then
			local sound = Instance.new("Sound",Parent)
			sound.SoundId = "rbxassetid://" .. SoundId
			sound.Volume = 1
			sound.PlaybackSpeed = Volume/10
			sound.TimePosition = TimePosition
			sound:Play()
			wait(Volume/100)
			if sound.Parent ~= nil then
				sound:Destroy()
			end
		end
	end))
end

local Music = Instance.new("Sound",Player.PlayerGui)
Music.Name = "Song"
Music.SoundId = "rbxassetid://4404565626"
Music.PlaybackSpeed = 1
Music.Volume = MusicVolume
Music.RollOffMaxDistance = 1000
Music.Playing = true
Music.Looped = true
Music.Parent = Torso
Music.Parent = Player.PlayerGui
-- Artificial Heartbeat --
local ArtificialHB = Instance.new("BindableEvent", Player)
ArtificialHB.Name = "Heartbeat"

Player:WaitForChild("Heartbeat")

local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/60
Player.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				Player.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(Num)
	if Num == 0 or Num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, Num do
			ArtificialHB.Event:wait()
		end
	end
end

function MusicForGlitcher(ID,Vol,Time,Pitch)
	Music.SoundId = "rbxassetid://"..ID
	Music.Volume = Vol
	Music.TimePosition = Time
	Music.PlaybackSpeed = Pitch
end

function HumanVals(WalkSpeed,JumpPower)
	Hum.WalkSpeed = WalkSpeed
	Hum.JumpPower = JumpPower
end

--[[if not game.ServerScriptService:FindFirstChild("Yes") then
	script.Modules.Yes.Parent = game.ServerScriptService
else
	script.Modules.Yes:Destroy()
end]]
local Module = (function() 
	local module = {Steps=0,PlayerStuff={}}

	local RemoteEvent

	if not workspace:FindFirstChild("RemoteMe") then
		Instance.new("BindableEvent",workspace).Name = "RemoteMe"
	end

	RemoteEvent = workspace.RemoteMe

	CF,Angles,Size,Rad,Sine,Cos,random = CFrame.new,CFrame.Angles,Vector3.new,math.rad,math.sin,math.cos,math.random
	NS,NSK,CS,CSK,NR = NumberSequence.new, NumberSequenceKeypoint.new, ColorSequence.new, ColorSequenceKeypoint.new, NumberRange.new

	local DebugMode = false
	local RootCF=CFrame.fromEulerAnglesXYZ(-1.57,0,3.14)

	local ArtificialHB = Instance.new("BindableEvent", script)
	ArtificialHB.Name = "Heartbeat"

	script:WaitForChild("Heartbeat")

	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	local frame = 1/60
	ArtificialHB:Fire()

	game:GetService("RunService").Heartbeat:connect(function(s, p)
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				script.Heartbeat:Fire()
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					ArtificialHB:Fire()
				end
				lastframe = tick()
			end
			if tossremainder then
				tf = 0
			else
				tf = tf - frame * math.floor(tf / frame)
			end
		end
	end)

	function swait(Num)
		if Num == 0 or Num == nil then
			ArtificialHB.Event:wait()
		else
			for i = 0, Num do
				ArtificialHB.Event:wait()
			end
		end
	end

	local swait = module.swait

	local EffectsFolder
	if not workspace:FindFirstChild("Effect") then
		Instance.new("Folder",workspace).Name = "Effect"
	else
		EffectsFolder = workspace:FindFirstChild("Effect")
	end

	local HitBoxFolder
	if not workspace:FindFirstChild("Hitboxes") then
		HitBoxFolder = Instance.new("Folder",workspace)
		HitBoxFolder.Name = "Hitboxes"
	else
		HitBoxFolder = workspace:FindFirstChild("Hitboxes")
	end

	local ignorelist = {EffectsFolder,HitBoxFolder}

	function module.rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
		local ign = ignorelist
		table.insert(ign,Ignore)
		for i,v in pairs(game.Players:GetPlayers()) do
			table.insert(ign,v.Character)
		end
		return workspace:FindPartOnRayWithIgnoreList(Ray.new(Pos, Dir.unit * (Max or 999.999)), ign) 
	end 

	function module.TweenAnimate(Object,Animation,time,Easingstyle,EasingDirection,Repeat,Reverse,Deelaiz,DisableByPass)
		RemoteEvent:Fire("TweenAnimate",Object,Animation,time,Easingstyle,EasingDirection,Repeat,Reverse,Deelaiz)
	end

	coroutine.resume(coroutine.create(function()
		while swait() do
			module.Steps += 1
		end
	end))

	return module
end)() --require(game.ServerScriptService.Yes)
-- Tween Values. --
local rayCast = Module.rayCast

local TweenDisable = {}
function TweenAnimate(Object,Animation,Time,EasingStyle,EasingDirection,Repeat,Reverse,Delayy)
	local TweenAnimate = Module.TweenAnimate
	if TweenDisable and typeof(TweenDisable) == typeof({}) then for i,v in pairs(TweenDisable) do if v == Object then return end end end
	local Infomation=TweenInfo.new(Time,Enum.EasingStyle[EasingStyle],Enum.EasingDirection[EasingDirection],Repeat,Reverse,Delayy)
	local Tween = game:GetService("TweenService"):Create(Object,Infomation,Animation)
	Tween:Play()
	return Tween
end

function TweenEffect(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse)
	v = game.Players.LocalPlayer
	local a = v.PlayerGui
	if a:FindFirstChild(Character.Name.."'s Effectments") then
		a:FindFirstChild(Character.Name.."'s Effectments").EffEvent:Fire(v,Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse,"TweenEffect")
	end
end

function TweenMesh(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse)
	v = game.Players.LocalPlayer
	local a = v.PlayerGui
	if a:FindFirstChild(Character.Name.."'s Effectments") then
		a:FindFirstChild(Character.Name.."'s Effectments").EffEvent:Fire(v,Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse,"TweenMesh")
	end
end

local FolderStuff = Instance.new("Folder",script)
FolderStuff.Name = "Okey"

local Yas = script.OtherResources.Gradient

local G1 = Instance.new("Motor6D",FolderStuff)
G1.Part0 = Yas.G1
G1.Part1 = hed
G1.C1 = cf(0,.3,0)
local G2 = Instance.new("Motor6D",FolderStuff)
G2.Part0 = Yas.G2
G2.Part1 = hed
G2.C1 = cf(0,.27,0)
local G3 = Instance.new("Motor6D",FolderStuff)
G3.Part0 = Yas.G3
G3.Part1 = hed
G3.C1 = cf(0,.25,0)
local G4 = Instance.new("Motor6D",FolderStuff)
G4.Part0 = Yas.G4
G4.Part1 = hed
G4.C1 = cf(0,.23,0)
local G5 = Instance.new("Motor6D",FolderStuff)
G5.Part0 = Yas.G5
G5.Part1 = hed
G5.C1 = cf(0,.21,0)
local G6 = Instance.new("Motor6D",FolderStuff)
G6.Part0 = Yas.G6
G6.Part1 = hed
G6.C1 = cf(0,.19,0)
local G7 = Instance.new("Motor6D",FolderStuff)
G7.Part0 = Yas.G7
G7.Part1 = hed
G7.C1 = cf(0,.17,0)
local G8 = Instance.new("Motor6D",FolderStuff)
G8.Part0 = Yas.G8
G8.Part1 = hed
G8.C1 = cf(0,.15,0)
local G9 = Instance.new("Motor6D",FolderStuff)
G9.Part0 = Yas.G9
G9.Part1 = hed
G9.C1 = cf(0,.13,0)
local G10 = Instance.new("Motor6D",FolderStuff)
G10.Part0 = Yas.G10
G10.Part1 = hed
G10.C1 = cf(0,.11,0)
local G11 = Instance.new("Motor6D",FolderStuff)
G11.Part0 = Yas.G11
G11.Part1 = hed
G11.C1 = cf(0,.09,0)
local G12 = Instance.new("Motor6D",FolderStuff)
G12.Part0 = Yas.G12
G12.Part1 = hed
G12.C1 = cf(0,.07,0)

local PointLight  = Instance.new("PointLight",Torso)
PointLight.Brightness = 1
PointLight.Range = 20
-- Localing Accessories
--// Dominiq's Wing Localment. //--
-- THIS IS THE COOOOORE!
local WingFolder = Instance.new("Folder",Character)
WingFolder.Name = "WongZ"

local Core = script.Cores:WaitForChild("Core"):Clone()
Core.Parent = Character.WongZ
Core.Handle.Anchored = false
Core.Handle.CanCollide = false
local coreweld = Instance.new("Motor6D",Torso)
coreweld.Part0 = Torso
coreweld.Part1 = Core.Handle
coreweld.C0 = CFrame.new(0,0,1)*CFrame.Angles(math.rad(90),0,0)

local lwing1 = script.Wings:WaitForChild("Wing"):Clone()
lwing1.Parent = Character.WongZ
lwing1.Handle.Anchored = false
lwing1.Handle.CanCollide = false
lwing1.Name = "lwing1"
local lwing1weld = Instance.new("Motor6D",Torso)
lwing1weld.Part0 = Torso
lwing1weld.Part1 = lwing1.Handle

local lwing2 = script.Wings:WaitForChild("Wing"):Clone()
lwing2.Parent = Character.WongZ
lwing2.Handle.Anchored = false
lwing2.Handle.CanCollide = false
lwing2.Name = "lwing2"
local lwing2weld = Instance.new("Motor6D",Torso)
lwing2weld.Part0 = Torso
lwing2weld.Part1 = lwing2.Handle

local lwing3 = script.Wings:WaitForChild("Wing"):Clone()
lwing3.Parent = Character.WongZ
lwing3.Handle.Anchored = false
lwing3.Handle.CanCollide = false
lwing3.Name = "lwing3"
local lwing3weld = Instance.new("Motor6D",Torso)
lwing3weld.Part0 = Torso
lwing3weld.Part1 = lwing3.Handle

local rwing1 = script.Wings:WaitForChild("Wing"):Clone()
rwing1.Parent = Character.WongZ
rwing1.Handle.Anchored = false
rwing1.Handle.CanCollide = false
rwing1.Name = "rwing1"
local rwing1weld = Instance.new("Motor6D",Torso)
rwing1weld.Part0 = Torso
rwing1weld.Part1 = rwing1.Handle

local rwing2 = script.Wings:WaitForChild("Wing"):Clone()
rwing2.Parent = Character.WongZ
rwing2.Handle.Anchored = false
rwing2.Handle.CanCollide = false
rwing2.Name = "rwing2"
local rwing2weld = Instance.new("Motor6D",Torso)
rwing2weld.Part0 = Torso
rwing2weld.Part1 = rwing2.Handle

local rwing3 = script.Wings:WaitForChild("Wing"):Clone()
rwing3.Parent = Character.WongZ
rwing3.Handle.Anchored = false
rwing3.Handle.CanCollide = false
rwing3.Name = "rwing3"
local rwing3weld = Instance.new("Motor6D",Torso)
rwing3weld.Part0 = Torso
rwing3weld.Part1 = rwing3.Handle
-- Wing and Effect stuff!
coroutine.resume(coroutine.create(function()
	while true do
		swait(10)
		v = game.Players.LocalPlayer
		if v.Character then
			local PlrGui = v.PlayerGui
			if PlrGui:FindFirstChild(Character.Name.."'s Wing") then
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").ModeValue.Value ~= Mode then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").ModeValue.Value = Mode
				end	
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").lwing1.Value ~= lwing1weld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").lwing1.Value = lwing1weld
				end	
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").lwing2.Value ~= lwing2weld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").lwing2.Value = lwing2weld
				end	
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").lwing3.Value ~= lwing3weld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").lwing3.Value = lwing3weld
				end				
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").rwing1.Value ~= rwing1weld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").rwing1.Value = rwing1weld
				end			
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").rwing2.Value ~= rwing2weld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").rwing2.Value = rwing2weld
				end			
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").rwing3.Value ~= rwing3weld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").rwing3.Value = rwing3weld
				end			
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").core.Value ~= coreweld then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").core.Value = coreweld	
				end					
				if PlrGui:FindFirstChild(Character.Name.."'s Wing").VisValue.Value ~= Visualizer then
					PlrGui:FindFirstChild(Character.Name.."'s Wing").VisValue.Value = Visualizer
				end
			end
		end
		v = game.Players.LocalPlayer
		if v.Character then
			local PlrGui = v.PlayerGui
			if not PlrGui:FindFirstChild(Character.Name.."'s Wing") then
				local WeingZ = script.SomeElse.WingZ:Clone()
				WeingZ.Parent = PlrGui
				WeingZ.Disabled = false
				WeingZ.Name = Character.Name.."'s Wing"
			end
			if not PlrGui:FindFirstChild(Character.Name.."'s Effectments") then
				local EffectStuff = script.SomeElse.Effectments:Clone()
				EffectStuff.Parent = PlrGui
				EffectStuff.Disabled = false
				EffectStuff.Name = Character.Name.."'s Effectments"
			end	
		end
	end
end))
-- Eyes for Dominiq9600.... or Amezsthrasphere.
local EyeFolder = Instance.new("Folder",hed)
-- // Main Eyes// --
local RightEye = Instance.new("Part",EyeFolder) local RightEyeWeld = Instance.new("Motor6D",RightEye) local EyeMesh = Instance.new("SpecialMesh",RightEye)
RightEye.Size = Vector3.new(0.157, 0.3, 0.152)
RightEye.Material = "Neon"
RightEye.Color = Color3.fromRGB(45, 42, 68)
EyeMesh.MeshType = "Sphere"
RightEye.Anchored = false
RightEye.CanCollide = false
RightEye.Transparency = 1
RightEyeWeld.Part0 = hed
RightEyeWeld.Part1 = RightEye
RightEyeWeld.C0 = cf(-0.2,0.2,-0.6)

local RightEyeGlance = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",RightEyeGlance) local RightEyeGlanceWeld = Instance.new("Motor6D",RightEyeGlance)
RightEyeGlance.Size = Vector3.new(0.05, 0.131, 0.075)
RightEyeGlance.Material = "Neon"
RightEyeGlance.Color = Color3.fromRGB(255, 255, 255)
EyeMesh.MeshType = "Sphere"
RightEyeGlance.Anchored = false
RightEyeGlance.CanCollide = false
RightEyeGlance.Transparency = 1
RightEyeGlanceWeld.Part0 = hed
RightEyeGlanceWeld.Part1 = RightEyeGlance
RightEyeGlanceWeld.C0 = cf(-0.18,0.25,-0.65)*angles(math.rad(0),math.rad(0),math.rad(15))

local LeftEye = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",LeftEye) local LeftEyeWeld = Instance.new("Motor6D",LeftEye)
LeftEye.Size = Vector3.new(0.157, 0.3, 0.152)
LeftEye.Material = "Neon"
LeftEye.Color = Color3.fromRGB(54, 54, 76)
EyeMesh.MeshType = "Sphere"
LeftEye.Anchored = false
LeftEye.CanCollide = false
LeftEye.Transparency = 1
LeftEyeWeld.Part0 = hed
LeftEyeWeld.Part1 = LeftEye
LeftEyeWeld.C0 = cf(0.2,0.2,-0.6)

local LeftEyeGlance = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",LeftEyeGlance) local LeftEyeGlanceWeld = Instance.new("Motor6D",LeftEyeGlance)
LeftEyeGlance.Size = Vector3.new(0.05, 0.131, 0.075)
LeftEyeGlance.Material = "Neon"
LeftEyeGlance.Color = Color3.fromRGB(255, 255, 255)
LeftEyeGlance.Transparency = 1
EyeMesh.MeshType = "Sphere"
LeftEyeGlance.Anchored = false
LeftEyeGlance.CanCollide = false
LeftEyeGlanceWeld.Part0 = hed
LeftEyeGlanceWeld.Part1 = LeftEyeGlance
LeftEyeGlanceWeld.C0 = cf(0.22,0.25,-0.65)*angles(math.rad(0),math.rad(0),math.rad(15))

local LeftEyeGlance2 = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",LeftEyeGlance2) local LeftEyeGlanceWeld2 = Instance.new("Motor6D",LeftEyeGlance)
LeftEyeGlance2.Size = Vector3.new(0.05, 0.05, 0.075)
LeftEyeGlance2.Material = "Neon"
LeftEyeGlance2.Color = Color3.fromRGB(255, 255, 255)
LeftEyeGlance2.Transparency = 1
EyeMesh.MeshType = "Sphere"
LeftEyeGlance2.Anchored = false
LeftEyeGlance2.CanCollide = false
LeftEyeGlanceWeld2.Part0 = hed
LeftEyeGlanceWeld2.Part1 = LeftEyeGlance2
LeftEyeGlanceWeld2.C0 = cf(0.18,0.14,-0.65)*angles(math.rad(0),math.rad(0),math.rad(15))

local RightEyeGlance2 = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",RightEyeGlance2) local RightEyeGlanceWeld2 = Instance.new("Motor6D",LeftEyeGlance)
RightEyeGlance2.Size = Vector3.new(0.05, 0.05, 0.075)
RightEyeGlance2.Material = "Neon"
RightEyeGlance2.Color = Color3.fromRGB(255, 255, 255)
RightEyeGlance2.Transparency = 1
EyeMesh.MeshType = "Sphere"
RightEyeGlance2.Anchored = false
RightEyeGlance2.CanCollide = false
RightEyeGlanceWeld2.Part0 = hed
RightEyeGlanceWeld2.Part1 = RightEyeGlance2
RightEyeGlanceWeld2.C0 = cf(-0.21,0.14,-0.65)*angles(math.rad(0),math.rad(0),math.rad(15))

local SecondaryLeftEye = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",SecondaryLeftEye) local SecondaryLeftEyeWeld = Instance.new("Motor6D",LeftEye)
SecondaryLeftEye.Size = Vector3.new(0.14, 0.23, 0.15)
SecondaryLeftEye.Material = "Neon"
SecondaryLeftEye.Color = Color3.fromRGB(35, 128, 209)
EyeMesh.MeshType = "Sphere"
SecondaryLeftEye.Name = "Secondary"
SecondaryLeftEye.Anchored = false
SecondaryLeftEye.CanCollide = false
SecondaryLeftEye.Transparency = 1
SecondaryLeftEyeWeld.Part0 = hed
SecondaryLeftEyeWeld.Part1 = SecondaryLeftEye
SecondaryLeftEyeWeld.C0 = cf(0.2,0.13,-0.57)

local SecondaryRightEye = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",SecondaryRightEye) local SecondaryRightEyeWeld = Instance.new("Motor6D",LeftEye)
SecondaryRightEye.Size = Vector3.new(0.137, 0.23, 0.15)
SecondaryRightEye.Material = "Neon"
SecondaryRightEye.Color = Color3.fromRGB(35, 128, 209)
EyeMesh.MeshType = "Sphere"
SecondaryRightEye.Name = "Secondary"
SecondaryRightEye.Anchored = false
SecondaryRightEye.CanCollide = false
SecondaryRightEye.Transparency = 1
SecondaryRightEyeWeld.Part0 = hed
SecondaryRightEyeWeld.Part1 = SecondaryRightEye
SecondaryRightEyeWeld.C0 = cf(-0.2,0.13,-0.57)
--[[local LeftEyeGlance2 = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",LeftEyeGlance2) local LeftEyeGlanceWeld2 = Instance.new("Motor6D",LeftEyeGlance)
LeftEyeGlance2.Size = Vector3.new(0.05, 0.07, 0.08)
LeftEyeGlance2.Material = "Neon"
LeftEyeGlance2.Color = Color3.fromRGB(255, 255, 255)
LeftEyeGlance2.Transparency = 1
EyeMesh.MeshType = "Sphere"
LeftEyeGlance2.Anchored = false
LeftEyeGlance2.CanCollide = false
LeftEyeGlanceWeld2.Part0 = hed
LeftEyeGlanceWeld2.Part1 = LeftEyeGlance2
LeftEyeGlanceWeld2.C0 = cf(0.18,0.14,-0.65)*angles(math.rad(0),math.rad(0),math.rad(15))

local RightEyeGlance2 = Instance.new("Part",EyeFolder) local EyeMesh = Instance.new("SpecialMesh",RightEyeGlance2) local RightEyeGlanceWeld2 = Instance.new("Motor6D",LeftEyeGlance)
RightEyeGlance2.Size = Vector3.new(0.05, 0.07, 0.08)
RightEyeGlance2.Material = "Neon"
RightEyeGlance2.Color = Color3.fromRGB(255, 255, 255)
RightEyeGlance2.Transparency = 1
EyeMesh.MeshType = "Sphere"
RightEyeGlance2.Anchored = false
RightEyeGlance2.CanCollide = false
RightEyeGlanceWeld2.Part0 = hed
RightEyeGlanceWeld2.Part1 = RightEyeGlance2
RightEyeGlanceWeld2.C0 = cf(-0.21,0.14,-0.65)*angles(math.rad(0),math.rad(0),math.rad(15))]]
--[[local ItemFolder = Instance.new("Folder",char)
ItemFolder.Name = "Items_Okey"

local Hammer = script.OtherResources:WaitForChild("Mallet"):Clone()
Hammer.Parent = char.Items_Okey
Hammer.Handle.Anchored = false
Hammer.Handle.CanCollide = false
Hammer.Name = "Hammer"
local HammerWeld = Instance.new("Motor6D",larm)
HammerWeld.Part0 = larm
HammerWeld.Part1 = Hammer.Handle
HammerWeld.C0 = cf(0,-1,0)*angles(-40,80,-90)
--Okey
local HammerActivation = true
-- Light
local HammerGlow = Hammer.Glow
local PointMeLight = Instance.new("PointLight",HammerGlow)
PointMeLight.Brightness = 2
PointMeLight.Range = 9
PointMeLight.Color = Color3.fromRGB(255,66,66)]]

-- Temporality's Clock Watch.
local TemporalityClockWeld = Instance.new("Motor6D",rarm)
TemporalityClockWeld.Part0 = script.OtherResources.TemporClock 
TemporalityClockWeld.Part1 = rarm 
TemporalityClockWeld.C0 = CFrame.new(0,2,-1)*CFrame.Angles(0,90,0)
-- Main Blast
--        //////////////////////////////////////////////////////
--       //                                                  //
--      //              Recolormentating me..               //
--     //                                                  //
--	  //////////////////////////////////////////////////////

-- Nihil's color shift
function WingColor(Primary,Secondary,Tertiary,PrimaryMaterial,SecondaryMaterial,TertiaryMaterial)
	for i,v in pairs(WingFolder:GetChildren()) do
		PointLight.Color = Secondary
		if v.Name == "lwing1" or v.Name == "lwing2" or v.Name == "lwing3" or v.Name == "rwing1" or v.Name == "rwing2" or v.Name == "rwing3" then
			v.Primary.Color = Primary
			v.Secondary.Color = Secondary
			v.Tertiary.Color = Tertiary
			v.TertiarY.Color = Tertiary
			v.Handle.Trail.Color = ColorSequence.new(Primary,Secondary)
			v.Primary.Material = PrimaryMaterial
			v.Secondary.Material = SecondaryMaterial
			v.Tertiary.Material = TertiaryMaterial
			v.TertiarY.Material = TertiaryMaterial
			v.Tertiary.Light.Color = Tertiary
		elseif v.Name == "Core" then
			v.Primary.Color = Primary
			v.Secondary.Color = Secondary
			v.Tertiary.Color = Tertiary
			v.Primary.Material = PrimaryMaterial
			v.Secondary.Material = SecondaryMaterial
			v.Tertiary.Material = TertiaryMaterial
		end
	end
end

function RecolorAndRename(Name,Information,Font,Primary,Secondary,Tertiary)
	SecondaryRightEye.Color = Secondary
	SecondaryLeftEye.Color = Secondary
	for i,v in pairs(hed.ABG:GetChildren()) do
		local HeadPolicyModeSomething = hed.ABG.NameFrame.MODENAME
		local QuoteSomething = hed.ABG.NameFrame.Quote
		local Prefixment = "〔~"
		local Suffixment = "~〕"
		local Prefixment2 = "｢ "
		local Suffixment2 = " ｣"
		HeadPolicyModeSomething.Text = Prefixment..Name..Suffixment
		QuoteSomething.Text = Prefixment2..Information..Suffixment2
		if v.Name == "NameFrame" then
			v.MODENAME.Text = Name
			v.MODENAME.UIGradient.Color = ColorSequence.new(Primary,Secondary)
			v.MODENAME.TextStrokeColor3 = Tertiary
			v.MODENAME.BorderColor3 = Secondary
			v.MODENAME.BackgroundColor3 = Primary
			v.MODENAME.TextColor3 = Secondary
			v.GlitcherName.UIGradient.Color = ColorSequence.new(Primary,Secondary)
			v.GlitcherName.TextStrokeColor3 = Tertiary
			v.GlitcherName.BorderColor3 = Secondary
			v.GlitcherName.BackgroundColor3 = Primary
			v.GlitcherName.TextColor3 = Secondary
			v.GlitcherName.Text = Prefixment2.."《~ASTERAZUKE~》"..Suffixment2
			--v.GlitcherName.Font = Font
			--v.MODENAME.Font = Font
			v.Quote.UIGradient.Color = ColorSequence.new(Primary,Secondary)
			v.Quote.TextStrokeColor3 = Tertiary
			v.Quote.BorderColor3 = Secondary
			v.Quote.BackgroundColor3 = Primary
			v.Quote.TextColor3 = Secondary
			v.Quote.Text = Information
			--v.Quote.Font = Font
		elseif v.Name == "Frame" then
			v.BackgroundColor3 = Primary
			v.BorderColor3 = Secondary
			v.UIGradient.Color = ColorSequence.new(Primary,Tertiary)
		elseif v.Name == "Frame2" then
			v.BackgroundColor3 = Primary
			v.BorderColor3 = Secondary
			v.UIGradient.Color = ColorSequence.new(Primary,Tertiary)
		elseif v.Name == "Frame3" then
			v.BackgroundColor3 = Primary
			v.UIGradient.Color = ColorSequence.new(Primary,Secondary)
		elseif v.Name == "Frame4" then
			v.BackgroundColor3 = Secondary
			v.UIGradient.Color = ColorSequence.new(Primary,Secondary)
		elseif v.Name == "Frame5" then
			v.BackgroundColor3 = Secondary
			v.BorderColor3 = Tertiary
			v.UIGradient.Color = ColorSequence.new(Secondary,Tertiary)
		elseif v.Name == "Frame6" then
			v.BackgroundColor3 = Secondary
			v.BorderColor3 = Tertiary
			v.UIGradient.Color = ColorSequence.new(Secondary,Tertiary)
		end	
	end
end

function Wow(Primary,Secondary,Tertiary)
	local WalkspeedRestorement = Hum.WalkSpeed
	local JumpspeedRestorement = Hum.JumpPower
	Combat = true
	Aura = false
	HumanVals(0,0)
	SoundEffect("CFrameSound",814635481,root,7,1,0,root.CFrame)
	SoundEffect("CFrameSound",2674547670,root,2,1,0,root.CFrame)
	swait(40)
	SoundEffect("CFrameSound",1577567682,root,6,1.1,0,root.CFrame)
	SoundEffect("CFrameSound",134854740,root,5,1,0,root.CFrame)
	TweenMesh("Explosion1",Torso.CFrame,Primary,Vector3.new(5,5,5),0,"Neon",.7,{Size = Vector3.new(55,55,55), Transparency = 1},1,"Quad","Out",0,false)
	TweenEffect("Sphere",Torso.CFrame,Secondary,Vector3.new(5.5,5),0,"Neon",.4,{Size = Vector3.new(50,50,50), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenEffect("Sphere",Torso.CFrame,Tertiary,Vector3.new(5,5,5),0,"Neon",1,{Size = Vector3.new(65,65,65), ImageTransparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("InvertedSpike",Torso.CFrame,Primary,Vector3.new(5,5,5),0,"Neon",.5,{Size = Vector3.new(60,60,60), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("Wind",root.CFrame,Primary,Vector3.new(0,0,0),0,"Neon",.7,{Size = Vector3.new(200,0,200), Transparency = 1},1,"Quad","Out",0,false)
	for i=1,50 do
		local a = CFrame.new(root.Position)*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))
		TweenEffect("Sphere",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.5,10),0,"Neon",0,{Size = Vector3.new(150,.1,0), Transparency = 1},1,"Quad","Out",0,false)
		TweenMesh("LightWind",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.1,10),0,"Neon",.5,{Size = Vector3.new(80,0.1,80), Transparency = 1},1,"Quad","Out",0,false)
	end
	swait(15)
	Combat = false
	Aura = true
	HumanVals(WalkspeedRestorement,JumpspeedRestorement)
end

--[[function AmezsWow(Primary,Secondary,Tertiary) -- This is just, why did i make this!?
	Aura = false
	Combat = true
	local Walkspeed = Hum.WalkSpeed
	local JumpPower = Hum.JumpPower
	HumanVals(0,0)
	SoundEffect("CFrameSound",814635481,root,7,1,0,root.CFrame)
	SoundEffect("CFrameSound",2674547670,root,2,1,0,root.CFrame)
	swait(40)
	SoundEffect("CFrameSound",1577567682,root,6,1.1,0,root.CFrame)
	SoundEffect("CFrameSound",134854740,root,5,1,0,root.CFrame)
	TweenMesh("Explosion1",Torso.CFrame,Primary,Vector3.new(5,5,5),0,"Neon",.7,{Size = Vector3.new(55,55,55), Transparency = 1},1,"Quad","Out",0,false)
	TweenEffect("Sphere",Torso.CFrame,Secondary,Vector3.new(5.5,5),0,"Neon",.4,{Size = Vector3.new(50,50,50), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenEffect("Sphere",Torso.CFrame,Tertiary,Vector3.new(5,5,5),0,"Neon",1,{Size = Vector3.new(65,65,65), ImageTransparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("InvertedSpike",Torso.CFrame,Primary,Vector3.new(5,5,5),0,"Neon",.5,{Size = Vector3.new(60,60,60), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("Wind",root.CFrame,Primary,Vector3.new(0,0,0),0,"Neon",.7,{Size = Vector3.new(200,0,200), Transparency = 1},1,"Quad","Out",0,false)
	for i=1,50 do
		local a = CFrame.new(root.Position)*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))
		TweenEffect("Sphere",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.5,10),0,"Neon",0,{Size = Vector3.new(150,.1,0), Transparency = 1},1,"Quad","Out",0,false)
		TweenMesh("LightWind",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.1,10),0,"Neon",.5,{Size = Vector3.new(80,0.1,80), Transparency = 1},1,"Quad","Out",0,false)
	end
	TweenMesh("WindSphere",Torso.CFrame,Primary,Vector3.new(5,5,5),0,"Neon",.7,{Size = Vector3.new(55,55,55), Transparency = 1},1,"Quad","Out",0,false)
	TweenMesh("SkatterBallH",Torso.CFrame,Secondary,Vector3.new(5.5,5),0,"Neon",.4,{Size = Vector3.new(50,50,50), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("FancySphereLight",Torso.CFrame,Tertiary,Vector3.new(5,5,5),0,"Neon",1,{Size = Vector3.new(65,65,65), ImageTransparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("FancySphere",Torso.CFrame,Primary,Vector3.new(5,5,5),0,"Neon",.5,{Size = Vector3.new(60,60,60), Transparency = 1},1.5,"Quad","Out",0,false)
	for i=1,50 do
		local a = CFrame.new(root.Position)*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))
		TweenEffect("Sphere",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.5,10),0,"Neon",0,{Size = Vector3.new(150,.1,0), Transparency = 1},1,"Quad","Out",0,false)
		TweenMesh("LightWind",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.1,10),0,"Neon",.5,{Size = Vector3.new(80,0.1,80), Transparency = 1},1,"Quad","Out",0,false)
	end
end]]
--[[ Pointless stuff.
local SpinMe = 0 local GotsaGoFest = 1
function Wow(Primary,Secondary,Tertiary)
	GotsaGoFest = 10
	local WalkspeedRestorement = Hum.WalkSpeed
	local JumpspeedRestorement = Hum.JumpPower
	Combat = true
	Aura = false
	HumanVals(0,0)
	SoundEffect("CFrameSound",814635481,root,7,1,0,root.CFrame)
	SoundEffect("CFrameSound",2674547670,root,2,1,0,root.CFrame)
	swait(40)
	SoundEffect("CFrameSound",1577567682,root,6,1.1,0,root.CFrame)
	SoundEffect("CFrameSound",134854740,root,5,1,0,root.CFrame)
	TweenMesh("Explosion1",Torso.CFrame*CFrame.Angles(0,SpinMe,0),Primary,Vector3.new(5,5,5),0,"Neon",.7,{Size = Vector3.new(55,55,55), Transparency = 1},1,"Quad","Out",0,false)
	TweenMesh("SkatterBallH",Torso.CFrame*CFrame.Angles(0,SpinMe,0),Primary,Vector3.new(5.5,5),0,"Neon",.4,{Size = Vector3.new(40,40,40), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("WindSphere",Torso.CFrame*CFrame.Angles(0,SpinMe,0),Secondary,Vector3.new(5.5,5),0,"Neon",.4,{Size = Vector3.new(45,45,45), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("FancySphere",Torso.CFrame*CFrame.Angles(0,SpinMe,0),Tertiary,Vector3.new(5.5,5),0,"Neon",.4,{Size = Vector3.new(50,50,50), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("FancySphereLight",Torso.CFrame*CFrame.Angles(0,SpinMe,0),Secondary,Vector3.new(5,5,5),0,"Neon",1,{Size = Vector3.new(65,65,65), ImageTransparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("InvertedSpike",Torso.CFrame*CFrame.Angles(0,SpinMe,0),Primary,Vector3.new(5,5,5),0,"Neon",.5,{Size = Vector3.new(60,60,60), Transparency = 1},1.5,"Quad","Out",0,false)
	TweenMesh("Wind",root.CFrame*CFrame.Angles(0,SpinMe,0),Primary,Vector3.new(0,0,0),0,"Neon",.7,{Size = Vector3.new(200,20,200), Transparency = 1},1,"Quad","Out",0,false)
	for i=1,25 do
		local a = CFrame.new(root.Position)*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))
		TweenEffect("Sphere",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.5,10),0,"Neon",0,{Size = Vector3.new(150,.1,0), Transparency = 1},1,"Quad","Out",0,false)
		TweenMesh("Wind",Torso.CFrame*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),Primary,Vector3.new(10,0.1,10),0,"Neon",.5,{Size = Vector3.new(80,0.1,80), Transparency = 1},1,"Quad","Out",0,false)
	end
	HumanVals(WalkspeedRestorement,JumpspeedRestorement)
	swait(15)
	Combat = false
	Aura = true
end
]]

if Mode == "Viz" then
	ModeSetup("Viz")
	local Primary = Color3.fromRGB(0, 0, 0)
	local Vis2 = Visualizer / 1000 if Vis2 >= 1 then Vis2 = 1 end
	local Secondary = Color3.fromHSV(sine/360 - math.floor(sine/360),6,Vis2)
	local Tertiary = Color3.fromHSV(sine/360 - math.floor(sine/360),6,Vis2)
	Wow(Primary,Secondary,Tertiary)
	WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
	RecolorAndRename("VIZARIA","Well i can visualize and you are oblizerized.","Antique",Primary,Secondary,Tertiary)
elseif Mode == "Error" then
	local MathRandom = random(1,3)
	if MathRandom == 1 then
		PrimaryError = Color3.fromRGB(math.random(100,200), math.random(0,30), math.random(0,50))
		SecondaryError = Color3.fromRGB(111, 10, 10)
		TertiaryError = Color3.fromRGB(math.random(100,200), math.random(0,30), math.random(0,50))
	elseif MathRandom == 2 then
		SecondaryError = Color3.fromRGB(255, 255, 255)
		RecolorAndRename("KArAkOTaRu","HAahAHAhAhAHAA!","Antique",PrimaryError,SecondaryError,TertiaryError)
	elseif MathRandom == 3 then
		SecondaryError = Color3.fromRGB(117, 46, 46)
		RecolorAndRename("kArAkoRATu","! FILE MISSING !.","Antique",PrimaryError,SecondaryError,TertiaryError)
	end
	Wow(PrimaryError,SecondaryError,TertiaryError)
	WingColor(PrimaryError,SecondaryError,TertiaryError,"Neon","Neon","Neon")
	RecolorAndRename("KARAKORATU","Well say goodbye to your data.","Antique",PrimaryError,SecondaryError,TertiaryError)
elseif Mode == "Nihil" then
	local Primary = Color3.fromRGB(0, 33, 79)
	local Secondary = Color3.fromRGB(7, 3, 115)
	local Tertiary = Color3.fromRGB(0,0,0)
	local MathRandom = math.random(1,5)
	if MathRandom == 1 then
		Primary = Color3.fromRGB(math.random(100,200), math.random(0,30), math.random(0,50))
		Secondary = Color3.fromRGB(21, 18, 74)
		Tertiary = Color3.fromRGB(math.random(100,200), math.random(0,30), math.random(0,50))
	elseif MathRandom == 2 then
		Secondary = Color3.fromRGB(255, 255, 255)
	elseif MathRandom == 3 then
		Tertiary = Color3.fromRGB(38, 42, 91)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("NiHilICaRIA","! aLl VAluEs ARe BroOkeN !","SciFi",Primary,Secondary,Tertiary)
	end
	Wow(Primary,Secondary,Tertiary)
	WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
	RecolorAndRename("NIHILICARIA","Do i need to break the Stamina Script?..","SciFi",Primary,Secondary,Tertiary)
end
--------------------------------------------------------------------
--        //////////////////////////////////////////////////////  --	 
--       /////                                            /////   --	 
--      /////                ...MODES...                 /////    --	  
--     /////                                            /////     --	 
--	  //////////////////////////////////////////////////////      --	 
--------------------------------------------------------------------
function ModeSetup(GlitchMode)
	Mode = GlitchMode
	ModeValue.Value = tostring(GlitchMode)
end

--As i said, i do not know combacks.
local ShuffleMode = {"Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Beauty","Outbreak"}
local RAndom = math.random(1,#ShuffleMode)

if Mode == nil then
	ModeSetup("Excessive")
	MusicForGlitcher(4404565626,4,.01,1.04)
	local Primary = Color3.fromRGB(94, 0, 0)
	local Secondary = Color3.fromRGB(255, 0, 0)
	local Tertiary = Color3.new(0, 0, 0)
	WingColor(Primary,Secondary,Tertiary,"Granite","Neon","Neon")
	RecolorAndRename("HALARRIASHA","Well as you say, You're overreacting.","Bodoni",Primary,Secondary,Tertiary)
	HumanVals(16,4)
end
Mouse.KeyDown:Connect(function(k)
	if k == "q" and Combat == false and Mode ~= "Excessive" then
		ModeSetup("Excessive")
		MusicForGlitcher(4404565626,4,.01,1.04)
		local Primary = Color3.fromRGB(94, 0, 0)
		local Secondary = Color3.fromRGB(255, 0, 0)
		local Tertiary = Color3.new(0, 0, 0)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Granite","Neon","Neon")
		RecolorAndRename("HALARRIASHA","Well as you say, you're overreacting.","Bodoni",Primary,Secondary,Tertiary)
		HumanVals(16,140)
	elseif k == "m"and Mode == "Excessive" and Combat == false and Mode ~= "Judgement" and table.find(Admins,Player.Name) then
		ModeSetup("Judgement")
		MusicForGlitcher(5524692418,4,.01,1.04)
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromRGB(117,0,0)
		local Tertiary = Color3.fromRGB(255,66,66)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Marble","Neon","Neon")
		RecolorAndRename("JARADASHA","Time has run out for you, my friend.","Antique",Primary,Secondary,Tertiary)
		HumanVals(50,250)
	elseif k == "n" and Mode == "Excessive" and Combat == false and Mode ~= "Amezsthrasphere" and Player.Name == "Dominiq9600" --[[Rename this then i will be siverality angry]] then
		ModeSetup("Amezsthrasphere") -- My Mode...
		MusicForGlitcher(1132669649,4,1,1) --[[MusicForGlitcher(6110709082,4,1,1.07)]]
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromRGB(255, 102, 204)
		local Tertiary = Color3.fromRGB(255, 152, 220)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("AMERAZTHRASPHERU","THERE IS NO SUCH THINGS AS EXITS TOWARDS REALITY...","Fantasy",Primary,Secondary,Tertiary)
		HumanVals(200,400)
	elseif k == "y" and Combat == false and Mode ~= "Heartbreak" then
		ModeSetup("Heartbreak")
		MusicForGlitcher(5844795262,4,60,.5) --[[5283561387]]
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromRGB(110, 40, 154)
		Wow(Primary,Secondary,Primary)
		WingColor(Primary,Secondary,Primary,"SmoothPlastic","Neon","Neon")
		RecolorAndRename("KOKOROKARIAKU","It really does hurt a lot, doesn't it?","Jura",Primary,Secondary,Primary)
		HumanVals(19,132)
	elseif k == "e" and Combat == false and Mode ~= "Depression" then
		ModeSetup("Depression")
		MusicForGlitcher(152773854,4,0,.8)
		local Primary = Color3.fromRGB(80, 76, 107)
		local Secondary = Color3.fromRGB(46, 43, 88)
		local Tertiary = Color3.fromRGB(80, 91, 120)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("DESSAKARASSU","There is nothing ahead of me anymore.","Jura",Primary,Secondary,Primary)
		HumanVals(19,132)
	elseif k == "t" and Combat == false and Mode ~= "Autumn" then
		ModeSetup("Autumn")
		MusicForGlitcher(5121455781,4,0,1.025)
		local Primary = Color3.fromRGB(170, 85, 0)
		local Secondary = Color3.fromRGB(188, 155, 93)
		local Tertiary = Color3.fromRGB(255, 255, 255)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("AKINOOTOZERU","There is nothing ahead of me anymore.","Jura",Primary,Secondary,Primary)
		HumanVals(19,132)
	elseif k == "r" and Combat == false and Mode ~= "Temporality" then
		ModeSetup("Temporality")
		MusicForGlitcher(2606277947,4,3,1.02)
		local Primary = Color3.fromRGB(0, 27, 83)
		local Secondary = Color3.fromRGB(130, 183, 239)
		local Tertiary = Color3.fromRGB(58, 97, 181)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("TIKICHARASUKA","The times has changed...","Garamond",Primary,Secondary,Tertiary)
		HumanVals(66,232)
	elseif k == "m" and Mode == "Temporality" and Combat == false and Mode ~= "SpaceTime" then
		ModeSetup("SpaceTime")
		MusicForGlitcher(586732256,4,0,1.07)
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromRGB(100, 50, 210)
		local Tertiary = Color3.fromRGB(20, 50, 220)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("NIGHTILIGALA","The Universe is timed...","SciFi",Primary,Secondary,Tertiary)
		HumanVals(255,232)
	elseif k == "m" and Mode == "Depression" and Combat == false and Mode ~= "Disarray" then
		ModeSetup("Disarray")
		MusicForGlitcher(1915823549,4,0,1.04)
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromRGB(109, 68, 179)
		local Tertiary = Color3.fromRGB(78, 57, 121)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("DESARUKAKO","Everything is just complicated and messy.","Garamond",Primary,Secondary,Tertiary)
		HumanVals(50,200)
	elseif k == "m" and Mode == "Heartbreak" and Combat == false and Mode ~= "Shinigami" then
		ModeSetup("Shinigami")
		MusicForGlitcher(1001240755,4,0,1.015)
		local Primary = Color3.fromRGB(72, 0, 0)
		local Secondary = Color3.fromRGB(255, 0, 0)
		local Tertiary = Color3.fromRGB(255, 66, 66)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("SHINIJUKAGAMI","There is no god such as me...","Garamond",Primary,Secondary,Tertiary)
		HumanVals(1000,825)
	elseif k == "u" and Combat == false and Mode ~= "Solstice" then
		ModeSetup("Solstice")
		MusicForGlitcher(5000574522,4,0,1.02)
		local Primary = Color3.fromRGB(253, 234, 141)
		local Secondary = Color3.fromRGB(213, 115, 61)
		local Tertiary = Color3.fromRGB(255, 255, 255)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("SOLIRIASHI","...I'll pull the sun away from earth...","Antique",Primary,Tertiary,Secondary)
		HumanVals(100,267)
	elseif k == "g" and Combat == false and Mode ~= "Distortion" then
		ModeSetup("Distortion")
		MusicForGlitcher(4857461826,4,0,1.02)
		local Primary = Color3.fromRGB(89, 34, 89)
		local Secondary = Color3.fromRGB(123, 47, 123)
		local Tertiary = Color3.fromRGB(170, 0, 170)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("DISASTORIACCESS","..DNIHEB SNOISNEMID EHT EVEAL"--[["Leave the dimensions behind...]],"Antique",Primary,Secondary,Tertiary)
		HumanVals(50,225)
	elseif k == "m" and Mode == "Distortion" and Combat == false and Mode ~= "TryTox" then
		ModeSetup("TryTox")
		MusicForGlitcher(4508176762,4,0,1.08)
		local Primary = Color3.fromRGB(0, 0, 255)
		local Secondary = Color3.fromRGB(0, 0, 0)
		local Tertiary = Color3.fromRGB(98, 37, 209)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Metal","Neon","Neon")
		RecolorAndRename("TryT0x","You don't need to be insane to destroy everything.","Antique",Primary,Secondary,Tertiary)
		HumanVals(125,225)
 --[[elseif k == "p" and Combat == false and Mode ~= "Shaitan" then
		ModeSetup("Shaitan")
		MusicForGlitcher(499368524,4,0,1.02)
		local Primary = Color3.fromRGB(255, 255, 175)
		local Secondary = Color3.fromRGB(186, 141, 43)
		local Tertiary = Color3.fromRGB(248, 217, 109)
		WingColor(Primary,Secondary,Tertiary,"Sand","Cobblestone","Neon")
		RecolorAndRename("SHIRATARI","The evil never ends...","Garamond",Primary,Secondary,Tertiary)
		HumanVals(20,125)]]
	elseif k == "j" and Combat == false and Mode ~= "Technology" then
		ModeSetup("Technology")
		MusicForGlitcher(4591651223,4,0,1.07)
		local Primary = Color3.fromRGB(255, 255, 255)
		local Secondary = Color3.fromRGB(0, 0, 0)
		local Tertiary = Color3.fromRGB(10, 161, 255)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Marble","Granite","Neon")
		RecolorAndRename("TERAKOLUGIRA","Devices are driving insanefully.","SciFi",Primary,Secondary,Tertiary)
		HumanVals(400,425)
	elseif k == "m" and Mode == "Technology" and Combat == false and Mode ~= "Error" then
		ModeSetup("Error")
		MusicForGlitcher(3352602056,4,0,1)
		Wow(PrimaryError,SecondaryError,TertiaryError)
		WingColor(PrimaryError,SecondaryError,TertiaryError,"Neon","Neon","Neon")
		RecolorAndRename("KARAKORATU","Well say goodbye to your data.","Antique",PrimaryError,SecondaryError,TertiaryError)
		HumanVals(1000,625)
	elseif k == "n" and Mode == "Technology" and Combat == false and Mode ~= "Viz" then
		ModeSetup("Viz")
		MusicForGlitcher(5336307323,4,90,1.09)
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromHSV(0, 0, 0)
		local Tertiary = Color3.fromHSV(0, 0, 0)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("VIZARIA","Well i can visualize and you are oblizerized.","Antique",Primary,Secondary,Tertiary)
		HumanVals(100,150)
	elseif k == "h" and Combat == false and Mode ~= "Beauty" then
		ModeSetup("Beauty")
		MusicForGlitcher(1173915974,4,0,1.05)
		local Primary = Color3.fromRGB(255, 220, 110)
		local Secondary = Color3.fromRGB(253, 234, 141)
		local Tertiary = Color3.fromRGB(255, 255, 204)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Marble","Neon","Neon")
		RecolorAndRename("ANCHARAZIRA","There is no villian as beautiful like me.","Antique",Primary,Secondary,Tertiary)
		HumanVals(150,325)
	elseif k == "k" and Combat == false and Mode ~= "Annihilation" then
		ModeSetup("Annihilation")
		MusicForGlitcher(4541179648,4,0,1.08)
		local Primary = Color3.fromRGB(0, 0, 0)
		local Secondary = Color3.fromRGB(155, 0, 0)
		local Tertiary = Color3.fromRGB(0, 0, 0)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("ANNAHALARIA","Everyone humiliates each other...","Antique",Primary,Secondary,Tertiary)
		HumanVals(50,625)
	elseif k == "m" and Mode == "Annihilation" and Combat == false and Mode ~= "Asastaria" then
		ModeSetup("Asastaria")
		MusicForGlitcher(1037245665,4,0,1.04)
		local Primary = Color3.fromRGB(255, 255, 255)
		local Secondary = Color3.fromRGB(160, 160, 170)
		local Tertiary = Color3.fromRGB(98, 98, 98)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Ice","Neon","Neon")
		RecolorAndRename("ASASTARIA","...DIVINITY IS NOT A TOY TO PLAY WITH...","Antique",Primary,Secondary,Tertiary)
		HumanVals(100,625)
	elseif k == "p" and Combat == false and Mode ~= "Arakasha" then
		ModeSetup("Arakasha")
		MusicForGlitcher(1747455288,4,0,1.08)
		local Primary = Color3.fromRGB(193, 193, 193)
		local Secondary = Color3.fromRGB(160, 140, 185)
		local Tertiary = Color3.fromRGB(207, 180, 218)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("ASZENDEKU","I ascend the right people to heaven.","Antique",Primary,Secondary,Tertiary)
		HumanVals(100,625)
	elseif k == "m" and Mode == "Arakasha" and Combat == false and Mode ~= "Woodaria" and Player.Name == "Dominiq9600" then
		ModeSetup("Woodaria")
		MusicForGlitcher(5317694079,4,0,1.06)
		local Primary = Color3.fromRGB(100,0,0)
		local Secondary = Color3.fromRGB(198, 31, 31)
		local Tertiary = Color3.fromRGB(220,130,70)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("WOODARIA","Everything is full of misery.","Garamond",Primary,Secondary,Tertiary)
		HumanVals(500,467)
	elseif k == "b" and Mode == "Technology" and Combat == false and Mode ~= "Nihil" then
		ModeSetup("Nihil")
		MusicForGlitcher(5249099148,4,65,1.015)
		local Primary = Color3.fromRGB(0, 33, 79)
		local Secondary = Color3.fromRGB(7, 3, 115)
		local Tertiary = Color3.fromRGB(0,0,0)
		Wow(Primary,Secondary,Tertiary)
		WingColor(Primary,Secondary,Tertiary,"Neon","Neon","Neon")
		RecolorAndRename("NIHILICARIA","Do i need to break the Stamina Script?..","SciFi",Primary,Secondary,Tertiary)
		HumanVals(70,270)
		-- End of Glitcher Modes.
	elseif k == "l" and Music.Playing == true then 
		Music.Playing = false Music.Volume = 0
	elseif k == "l" and Music.Playing == false then 
		Music.Playing = true Music.Volume = 10
	elseif k == "two" and ABIllBoard.Enabled == true then
		ABIllBoard.Enabled = false
	elseif k == "two" and ABIllBoard.Enabled == false then
		ABIllBoard.Enabled = true
	elseif k == "leftbracket" then
		local TheRecourses = script.OtherResources
		local Yas = TheRecourses.Gradient
		Yas.G1.Transparency = 0 
		Yas.G2.Transparency = .05
		Yas.G3.Transparency = .1
		Yas.G4.Transparency = .15 
		Yas.G5.Transparency = .2
		Yas.G6.Transparency = .25
		Yas.G7.Transparency = .35
		Yas.G8.Transparency = .45 
		Yas.G9.Transparency = .55 
		Yas.G10.Transparency = .65 
		Yas.G11.Transparency = .75 
		Yas.G12.Transparency = 1
--[[		RightEye.Transparency = 0
		LeftEye.Transparency = 0
		RightEyeGlance.Transparency = 0
		LeftEyeGlance.Transparency = 0
		RightEyeGlance2.Transparency = 0
		LeftEyeGlance2.Transparency = 0
		SecondaryRightEye.Transparency = 0
		SecondaryLeftEye.Transparency = 0]]
	elseif k == "rightbracket" then
		local TheRecourses = script.OtherResources
		local Yas = TheRecourses.Gradient
		Yas.G1.Transparency = 1
		Yas.G2.Transparency = 1
		Yas.G3.Transparency = 1
		Yas.G4.Transparency = 1 
		Yas.G5.Transparency = 1
		Yas.G6.Transparency = 1
		Yas.G7.Transparency = 1
		Yas.G8.Transparency = 1 
		Yas.G9.Transparency = 1 
		Yas.G10.Transparency = 1
		Yas.G11.Transparency = 1
		Yas.G12.Transparency = 1
--[[		RightEye.Transparency = 1
		LeftEye.Transparency = 1
		RightEyeGlance.Transparency = 1
		LeftEyeGlance.Transparency = 1
		RightEyeGlance2.Transparency = 1
		LeftEyeGlance2.Transparency = 1
		SecondaryRightEye.Transparency = 1
		SecondaryLeftEye.Transparency = 1]]
	end
end)
-- Kicking spree!
if Mode ~= "Ban" and Player.Name == "G_rgie" or Player.Name == "haydendavis2007" or Player.Name == "armananjan" or Player.Name == "wolf678o" or Player.Name == "ShyneoIsCute" or Player.Name == "senna_ly" then
	ModeSetup("Ban")
	MusicForGlitcher(6408396058,4,20,1)
	local Primary = Color3.fromRGB(255, 255, 255)
	local Secondary = Color3.fromRGB(255, 255, 255)
	local Tertiary = Color3.fromRGB(255, 255, 255)
	WingColor(Primary,Secondary,Tertiary,"Marble","Neon","Neon")
	RecolorAndRename("Ban!!!","Press the leave button please.","Antique",Primary,Secondary,Tertiary)
	HumanVals(100,625)
	swait(20)
	if Player.Name == "G_rgie" then
		Player:Kick("You are not allowed here, you're card of acception has been revoked and to top it all off, you are a Exploiter so i would recommend you NEVER COMMING BACK.")
	elseif Player.Name == "Boibrother" then
		Player:Kick("Sorry to say this but you are out, i would never wanna allow you in the game.")
	elseif Player.Name == "ShyneoIsCute" then
		Player:Kick("Get out of here, you don't deserve to be here.")
	elseif Player.Name == "senna_ly" then
		Player:Kick("Get out of here, and if you want to pleed then beat the case like you always do.")
	elseif Player.Name == "haydendavis2007" then
		Player:Kick("I don't need a racist person joining here. Get out of here with you're ignorance..")
	elseif Player.Name == "armananjan" then
		Player:Kick("You are a Idiot for thinking we will donate to you, you are always begging for robux and from that reason makes me angry. Think before you speak and get out..")
--[[	elseif Player.Name == "wolf678o" then
		Player:Kick("Wolf, you are just a childish, Selfish person from how i put it from what you have done. Please leave, the exit is right below the Text or Description.")
]]	end
end

spawn(function()
	while true do
		swait()
		sine = sine + change
	end
end)

script.Viz.Event:Connect(function(Player,PlayBackLoudness) Visualizer = PlayBackLoudness end)

local Spin = 0 local Yes = 0 local AreYouSerious = 0
-- Effects which works!
coroutine.resume(coroutine.create(function()
	while true do
		if Aura == true then
			if Mode == "Judgement" then
				swait(1)
				Yes = 10
				local Primary = Color3.fromRGB(0, 0, 0)
				local Secondary = Color3.fromRGB(117,0,0)
				local Tertiary = Color3.fromRGB(255,66,66)
				local Hmmm = root.CFrame*CFrame.new(math.random(-30,30),0,math.random(-30,30))*CFrame.Angles(math.rad(math.random(-40,40)),math.rad(math.random(-40,40)),math.rad(math.random(-40,40)))
				TweenEffect("Sphere",Torso.CFrame*CFrame.new(0 - 15 * math.cos(sine/50),-0 + 5 * math.cos(sine/30),0 + 15 * math.sin(sine/50)),Tertiary,Vector3.new(1,1,1),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},3,"Sine","Out",0,false)
				TweenEffect("Sphere",Torso.CFrame*CFrame.new(0 + 5 * math.cos(sine/55),-0 - 5 * math.cos(sine/45),0 - 5 * math.sin(sine/55)),Tertiary,Vector3.new(1,1,1),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},3,"Sine","Out",0,false)
				TweenEffect("Sphere",Hmmm*CFrame.new(0,-3,0),Secondary,Vector3.new(.5,.2,.2),0,"Neon",0,{Transparency = 1, CFrame = Hmmm*CFrame.new(0,20,0)},1,"Quad","Out",0,false)		
				TweenMesh("LightWind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-100,100),0),Secondary,Vector3.new(0,0,0),0,"Neon",0,{Size = Vector3.new(100,10,100),Color = Primary,Transparency = 1},.6,"Linear","In",0,false)	
			elseif Mode == "Autumn" then
				swait(5)
				local Primary = Color3.fromRGB(170, 85, 0)
				local Secondary = Color3.fromRGB(188, 155, 93)
				local Tertiary = Color3.fromRGB(255, 255, 255)
				local SphereGoesUp = root.CFrame*cf(random(-20,20),0,random(-20,20))
				TweenMesh("Leaf",SphereGoesUp*cf(0,25,0)*angles(0 + 1000000 * math.cos(sine/10),0 + 1000000 * math.cos(sine/10),0  + 1000000 * math.cos(sine/10)),Primary,Vector3.new(1, .5, 2),0,"Neon",0,{Transparency = 1, CFrame = SphereGoesUp*CFrame.new(0,-4,0)},10,"Linear","Out",0,false)
			elseif Mode == "Error" then
				swait(1)
				local CFrame1 = root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-180,180),0)
				local CFrame2 = root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-180,180),0)
				local CFrame3 = root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-180,180),0)
				TweenEffect("Sphere",CFrame1,PrimaryError,Vector3.new(5,0.01,5),0,"Neon",0,{Transparency = 1, Size = Vector3.new(200,0.01,0)},0.5,"Linear","Out",0,false)					
				TweenEffect("Sphere",CFrame2,SecondaryError,Vector3.new(5,0.01,5),0,"Neon",0,{Transparency = 1, Size = Vector3.new(200,0.01,0)},0.5,"Linear","Out",0,false)		
				TweenEffect("Sphere",CFrame3,TertiaryError,Vector3.new(5,0.01,5),0,"Neon",0,{Transparency = 1, Size = Vector3.new(200,0.01,0)},0.5,"Linear","Out",0,false)		
			elseif Mode == "Annihilation" then
				swait(.5)
				Yes = 20
				local Primary = Color3.fromRGB(139, 0, 0)
				local Secondary = Color3.fromRGB(0, 0, 0)
				local Feriaty = Color3.fromRGB(65, 65, 65)
				local Tertiary = Color3.fromRGB(172, 53, 53)
				local SphereGoesUp = root.CFrame*cf(random(-20,20),0,random(-20,20))
				local Okey = root.CFrame*cf(random(-25,25),random(-7.5,7.5),random(-25,25))
				local CFrame1 = root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-180,180),0)
				local CFrame2 = root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-180,180),0)
				local CFrame3 = root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.random(-180,180),0)
				TweenEffect("Block",Okey*cf(0 + 5 * math.cos(sine/15),35,0 + 5 * math.cos(sine/15))*CFrame.Angles(0,math.rad(Spin),0),Feriaty,Vector3.new(17.5,5,17.5),0,"Neon",.4,{Transparency = 1,Size = Vector3.new(14,2.5,14),CFrame = Okey*CFrame.new(0 + 5 * math.cos(sine/15),35,0 + 5 * math.cos(sine/15))},1,"Linear","Out",0,false)
				TweenEffect("Block",SphereGoesUp*cf(0,25,0),Primary,Vector3.new(.1,.5,.1),0,"Ice",0,{Transparency = 1, CFrame = root.CFrame*CFrame.new(0,-4,0)},.2,"Linear","Out",0,false)
				TweenEffect("Block",SphereGoesUp*cf(0,25,0),Tertiary,Vector3.new(.25,.5,.25),0,"Ice",0,{Transparency = 1, CFrame = root.CFrame*CFrame.new(0,-4,0)},.2,"Linear","Out",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Primary,Vector3.new(0,0,0),0,"Neon",.8,{Size = Vector3.new(100,10,100), Color = Color3.fromRGB(0, 0, 0), Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "Beauty" then
				swait(1)
				local Primary = Color3.fromRGB(255, 220, 110)
				local Secondary = Color3.fromRGB(253, 234, 141)
				local Tertiary = Color3.fromRGB(255, 255, 204)
				TweenEffect("Sphere",root.CFrame*CFrame.new(0 - 5 * math.cos(sine/15),-3,0 - 5 * math.sin(sine/15)),Primary,Vector3.new(1,0.1,1),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},1,"Linear","Out",0,false)
				TweenEffect("Sphere",root.CFrame*CFrame.new(0 + 10 * math.cos(sine/20),-3,0 + 10 * math.sin(sine/20)),Tertiary,Vector3.new(2,0.1,2),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},1,"Linear","Out",0,false)
				TweenEffect("Sphere",root.CFrame*CFrame.new(0 - 15 * math.cos(sine/30),-3,0 - 15 * math.sin(sine/30)),Secondary,Vector3.new(3,0.1,3),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},1,"Linear","Out",0,false)
				TweenEffect("Sphere",Torso.CFrame*CFrame.new(0 - 15 * math.cos(sine/30),-0 + 5 * math.cos(sine/20),0 + 15 * math.sin(sine/30)),Secondary,Vector3.new(1,1,1),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},2,"Sine","Out",0,false)
			elseif Mode == "Asastaria" then
				swait(1)
				local SphereGoesUp = root.CFrame*cf(random(-20,20),0,random(-20,20))
				local Primary = Color3.fromRGB(255, 255, 255)
				local Secondary = Color3.fromRGB(160, 160, 170)
				local Tertiary = Color3.fromRGB(98, 98, 98)
				TweenMesh("LightWind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Primary,Vector3.new(0,0,0),0,"Neon",0,{Size = Vector3.new(100,10,100), Color = Color3.fromRGB(0, 0, 0), Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "Asastaria" then
				swait(1)
				local Primary = Color3.fromRGB(255, 255, 255)
				local Secondary = Color3.fromRGB(160, 160, 170)
				local Tertiary = Color3.fromRGB(98, 98, 98)
				TweenMesh("LightWind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Primary,Vector3.new(0,0,0),0,"Neon",0,{Size = Vector3.new(100,10,100), Color = Color3.fromRGB(0, 0, 0), Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "Nihil" then
				swait(1)
				local Primary = Color3.fromRGB(0, 33, 79)
				local Secondary = Color3.fromRGB(7, 3, 115)
				local Tertiary = Color3.fromRGB(0,0,0)
				TweenMesh("LightWind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Primary,Vector3.new(0,0,0),0,"Neon",0,{Size = Vector3.new(100,.4,100), Color = Color3.fromRGB(0, 0, 0), Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "Distortion" then
				swait(1)
				local Primary = Color3.fromRGB(89, 34, 89)
				local Secondary = Color3.fromRGB(123, 47, 123)
				local Tertiary = Color3.fromRGB(170, 0, 170)
				TweenMesh("Wind",Torso.CFrame*CFrame.new(0,0,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),180),Primary,Vector3.new(0,10,0),0,"Neon",.8,{Size = Vector3.new(50,0,50), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
				TweenMesh("Sphere",Torso.CFrame*CFrame.new(0,0,0)*CFrame.Angles(0 + 100 * math.cos(sine/15),0 + 100 * math.cos(sine/15),0 + 100 * math.cos(sine/15)),Primary,Vector3.new(0,10,0),0,"Neon",.8,{Size = Vector3.new(50,0,50), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Secondary,Vector3.new(0,10,0),0,"Neon",.8,{Size = Vector3.new(100,10,100), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "Solstice" then
				swait(1)
				local Primary = Color3.fromRGB(253, 234, 141)
				local Secondary = Color3.fromRGB(213, 115, 61)
				local Tertiary = Color3.fromRGB(255, 255, 255)
				TweenMesh("LightWind",root.CFrame*CFrame.new(0,40,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),180),Primary,Vector3.new(0,10,0),0,"Neon",.8,{Size = Vector3.new(50,0,50), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Secondary,Vector3.new(50,5,50),0,"Neon",.8,{Size = Vector3.new(100,10,100), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
				TweenEffect("Sphere",root.CFrame*CFrame.new(0,40,0),Primary,Vector3.new(18, 18, 18),0,"Neon",0,{Transparency = 1,Size = Vector3.new(19,19,19)},.5,"Linear","In",0,false)
			elseif Mode == "Temporality" then
				swait(1)
				local Primary = Color3.fromRGB(0, 27, 83)
				local Secondary = Color3.fromRGB(130, 183, 239)
				local Tertiary = Color3.fromRGB(58, 97, 181)
				local ClockGoesUp = root.CFrame*cf(random(-25,25),random(-25,25),random(-25,25))
				TweenMesh("TemporClock",ClockGoesUp*cf(0,-4,0)*angles(math.rad(0 + 50 * math.cos(sine/20)),math.rad(0 + 50 * math.cos(sine/25)),0),Primary,Vector3.new(.099,1.6,1.6),0,"Neon",0,{Transparency = 1,CFrame = ClockGoesUp*CFrame.new(0,10,0)},1.35,"Linear","In",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Secondary,Vector3.new(10,5,10),0,"Neon",.8,{Size = Vector3.new(50,10,50), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "Amezsthrasphere" then
				swait(.5)
				Yes = 10
				local Primary = Color3.fromRGB(0, 0, 0)
				local Secondary = Color3.fromRGB(255, 102, 204)
				local Tertiary = Color3.fromRGB(255, 152, 220)
				local SphereGoesUp = root.CFrame*cf(random(-20,20),0,random(-20,20))
				local SphereGoesUp2 = root.CFrame*cf(random(-20,20),0,random(-20,20))
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Primary,Vector3.new(0,0,0),0,"Neon",0,{Size = Vector3.new(100,100,100), Color = Tertiary, Transparency = 1},.6,"Linear","In",0,false)
			elseif Mode == "TryTox" then
				swait(1)
				local Primary = Color3.fromRGB(0, 0, 255)
				local Secondary = Color3.fromRGB(0, 0, 0)
				local Tertiary = Color3.fromRGB(98, 37, 209)
				TweenEffect("Sphere",root.CFrame*cf(0,-3,0),Secondary,Vector3.new(50,.1,50),0,"Neon",1,{Transparency = 0},1,"Linear","InOut",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-100,100)),0),Tertiary,Vector3.new(150,10,150),0,"Neon",1,{Size = Vector3.new(30,10,30),Color = Secondary,Transparency = 0},1,"Linear","InOut",0,false)
--[[			elseif Mode == "Shinigami" then
				swait(1)
				local Primary = Color3.fromRGB(72, 0, 0)
				local Secondary = Color3.fromRGB(255, 0, 0)
				local Tertiary = Color3.fromRGB(255, 66, 66)
				local GoAround = Torso.CFrame*CFrame.new(random(-25,25),random(-25,25),random(-25,25))*CFrame.Angles(math.rad(math.random(-40,40)),math.rad(math.random(-40,40)),math.rad(math.random(-40,40)))
				TweenMesh("Leaf",GoAround*CFrame.new(0,10,0),Secondary,Vector3.new(.5,.5,.5),0,"Neon",0,{Transparency = 0, Color = Primary,CFrame = GoAround*CFrame.new(0 + 15 * math.cos(sine/30),0  + 15 * math.sin(sine/30),0 + 15 * math.sin(sine/30))},1,"Sine","In",0,false)
				TweenMesh("Leaf",GoAround*CFrame.new(0,10,0),Primary,Vector3.new(.5,.5,.5),0,"Neon",0,{Transparency = 0, Color = Secondary,CFrame = GoAround*CFrame.new(0 - 15 * math.cos(sine/30),0  - 15 * math.sin(sine/30),0 - 15 * math.sin(sine/30))},1,"Sine","In",0,false)
				TweenMesh("Slash",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,Spin,0),Primary,Vector3.new(0,0,0),0,"Neon",.8,{Size = Vector3.new(50,1,50),Color = Secondary,Transparency = 1},1,"Linear","In",0,false)
				TweenMesh("LightWind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,Spin,0),Primary,Vector3.new(0,0,0),0,"Neon",.8,{Size = Vector3.new(100,1,100),Color = Secondary,Transparency = 1},1,"Linear","In",0,false)
]]			elseif Mode == "SpaceTime" then
				swait(1)
				local Primary = Color3.fromRGB(0, 0, 0)
				local Secondary = Color3.fromRGB(100, 50, 210)
				local Tertiary = Color3.fromRGB(20, 50, 220)
				local Fourthiary = Color3.fromRGB(255, 255, 255)
				TweenEffect("Sphere",Torso.CFrame*CFrame.new(random(-40,40),random(-50,50),random(-40,40)),Fourthiary,Vector3.new(0,0,0),0,"Neon",0,{Transparency = 1, Size = Vector3.new(.5, .5, 0.5)},.5,"Sine","InOut",0,false)
				TweenMesh("3DStar",Torso.CFrame*CFrame.new(random(-40,40),random(-50,50),random(-40,40)),Fourthiary,Vector3.new(0,0,0),0,"Neon",0,{Transparency = 1, Size = Vector3.new(1, 1, 1)},.5,"Sine","InOut",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(Spin),0),Tertiary,Vector3.new(0,0,0),0,"Neon",.8,{Size = Vector3.new(50,10,50),Color = Primary,Transparency = 1},1,"Linear","In",0,false)
--[[			elseif Mode == "Excessive" then
				swait(1)
				local Primary = Color3.fromRGB(94, 0, 0)
				local Secondary = Color3.fromRGB(255, 0, 0)
				local Tertiary = Color3.new(0, 0, 0)
				TweenEffect("Sphere",root.CFrame*CFrame.new(0 + 20 * math.cos(sine/20),-3,0 + 20 * math.sin(sine/20)),Tertiary,Vector3.new(4,0.2,4),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},1,"Linear","In",0,false)	
				TweenEffect("Sphere",root.CFrame*CFrame.new(0 - 20 * math.cos(sine/20),-3,0 - 20 * math.sin(sine/20)),Secondary,Vector3.new(4,0.2,4),0,"Neon",0,{Size = Vector3.new(0,0,0),Color = Tertiary, Transparency = 1},1,"Linear","In",0,false)
				TweenMesh("Wind",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(Spin),0),Secondary,Vector3.new(40,20,40),0,"Neon",1,{Size = Vector3.new(0,0,0),Color = Tertiary,Transparency = .8},1,"Linear","InOut",0,false)
]]--[[		    	TweenMesh("Tornado",root.CFrame*CFrame.new(0 + 20 * math.cos(sine/20),0,0 + 20 * math.sin(sine/20))*CFrame.Angles(0,Spin,0),Tertiary,Vector3.new(15, 15, 15),0,"Neon",0,{Size = Vector3.new(0,0,0), Transparency = 1},1,"Linear","In",0,false)	
				TweenMesh("Tornado",root.CFrame*CFrame.new(0 - 20 * math.cos(sine/20),0,0 - 20 * math.sin(sine/20))*CFrame.Angles(0,Spin,0),Secondary,Vector3.new(15, 15, 15),0,"Neon",0,{Size = Vector3.new(0,0,0),Color = Tertiary, Transparency = 1},1,"Linear","In",0,false)]]
			elseif Mode == "Arakasha" then
				swait(1)
				local Primary = Color3.fromRGB(94, 0, 0)
				local Secondary = Color3.fromRGB(255, 0, 0)
				local Tertiary = Color3.new(0, 0, 0)
			elseif Mode == "Shinigami" then
				swait(1)
				local Primary = Color3.fromRGB(72, 0, 0)
				local Secondary = Color3.fromRGB(255, 0, 0)
				local Tertiary = Color3.fromRGB(255, 66, 66)

			else
				swait()	
			end
		else
			swait()	
		end	
	end
end))

local Anim="Idle"
local AuraDebounce = false

-- [[Animation Setup! :>]]
		--[[local Alpha = .1
			TweenAnimate(RootJoint,{C0=cf(0,0,0)*angles(math.rad(0),math.rad(30),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)]]
coroutine.resume(coroutine.create(function()
	while true do
	swait()
	local Clamp = math.clamp; local Vector = Vector3.new;
	local humanoid = C.Humanoid local rootpart = C.HumanoidRootPart
	local Walking = humanoid.MoveDirection.Magnitude>0
	local vt = Vector3.new
	local FwdDir = (Walking and humanoid.MoveDirection*rootpart.CFrame.LookVector or vt())
	local RigDir = (Walking and humanoid.MoveDirection*rootpart.CFrame.RightVector or vt())

	local Vec = {
		X=RigDir.X+RigDir.Z,
		Z=FwdDir.X+FwdDir.Z
	}
	local Divide = 1
	if(Vec.Z<0)then
		Divide=Clamp(-(1.25*Vec.Z),1,2)
	end
	Vec.Z = Vec.Z/Divide
	Vec.X = Vec.X/Divide
	local Torvel=(RootPart.Velocity*Vector(1,0,1)).magnitude
	local VelDerp=RootPart.Velocity.Y
	local hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector(0,1,0))).lookVector,4,Character)

	if RootPart.Velocity.y > 1 and hitfloor==nil then
		Anim="Jump"
		swait()
		local Alpha = .5
		TweenAnimate(RootJoint,{C0=cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
		TweenAnimate(LH,{C0=cf(-.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(RH,{C0=cf(.975,-.5,-.8)*angles(math.rad(-25),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(LW,{C0=cf(-1.2,.6,.6)*angles(math.rad(0),math.rad(25),math.rad(0))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(RW,{C0=cf(1.2,.6,.6)*angles(math.rad(0),math.rad(-25),math.rad(0))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-35*Vec.Z),math.rad(-15*Vec.X),math.rad(-25*Vec.X))},Alpha,'Back','Out',0,false,0)

	elseif RootPart.Velocity.Y < -1 and hitfloor==nil then 
		Anim="Fall"
		swait()
		local Alpha = .5
		TweenAnimate(RootJoint,{C0=cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
		TweenAnimate(LH,{C0=cf(-.975,-1,0)*angles(math.rad(-45),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(RH,{C0=cf(.975,-.5,-.8)*angles(math.rad(5),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(LW,{C0=cf(-1.4,.8,0)*angles(math.rad(0),math.rad(-15*Vec.X),math.rad(-55))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(RW,{C0=cf(1.4,.8,0)*angles(math.rad(0),math.rad(15*Vec.X),math.rad(55))},Alpha,'Back','Out',0,false,0)
		TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(35*Vec.Z),math.rad(-15*Vec.X),math.rad(-25*Vec.X))},Alpha,'Back','Out',0,false,0)

	elseif Torvel<1 and hitfloor~=nil then
		Anim="Idle"
		if Mode == "Excessive" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0,0 + .2 * math.cos(sine/35),0)*angles(math.rad(0),math.rad(-25),math.rad(0 - 5 * math.cos(sine/40)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.97 + .1 * math.cos(sine/40),-1 - .2 * math.cos(sine/35),0)*angles(math.rad(0 - 5 * math.cos(sine/40)),math.rad(45),math.rad(0 + 5 * math.cos(sine/40)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.977 + .1 * math.cos(sine/40),-.9 - .2 * math.cos(sine/35),-.1)*angles(math.rad(-23 - 1 * math.cos(sine/40)),math.rad(-35),math.rad(0 + 5 * math.cos(sine/40)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4 + .1 * math.cos(sine/35),-.9)*angles(math.rad(0),math.rad(135),math.rad(-145))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.1,.4 + .2 * math.cos(sine/35),.7)*angles(math.rad(0),math.rad(-25),math.rad(-45))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(0),math.rad(25 + 2 * math.cos(sine/25)),math.rad(23 + 2 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Judgement" then -- [[Administration Mode for my friends.]]
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * math.cos(sine/55),10 - 1 * math.cos(sine/45),0 + 1 * math.cos(sine/65))*angles(math.rad(0 - 6 * math.cos(sine/30)),math.rad(-50 - 20 * math.cos(sine/50)),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.6 + .2 * math.cos(sine/45),-.8)*angles(math.rad(-25),math.rad(15),math.rad(-7.5 - 5 * math.cos(sine/35)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1.1 + .2 * math.cos(sine/45),.1)*angles(math.rad(-5),math.rad(-10),math.rad(5 + 5 * math.cos(sine/35)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-.8,.8  - .1 * math.cos(sine/45),-.6)*angles(math.rad(129.1),math.rad(-4.5),math.rad(91.3))},Alpha,'Linear','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.95,.3 - .1 * math.cos(sine/45),-.6)*angles(math.rad(73.9),math.rad(2.1),math.rad(-82))},Alpha,'Linear','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(15),math.rad(0 - 6 * math.cos(sine/30)),math.rad(50 + 20 * math.cos(sine/50)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Amezsthrasphere" then -- My Administration Mode
			local Alpha = .5
			local Snap = math.random(1,45)
			if Snap == 1 then
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-15,23)),math.rad(math.random(-25,25)),math.rad(math.random(-35,35))),1)
			end
			TweenAnimate(RootJoint,{C0=cf(0 - 1 * math.cos(sine/45),10 - 1 * math.cos(sine/35),0 - 1 * math.cos(sine/50))*angles(math.rad(35),math.rad(15 + 10 * math.cos(sine/40)),math.rad(-25))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.955,-1 + .2 * math.cos(sine/25),.2)*angles(math.rad(-15 + 10 * math.cos(sine/35)),math.rad(25),math.rad(0 + 6 * math.cos(sine/25)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-.4  + .2 * math.cos(sine/25),-.9)*angles(math.rad(-40 + 35 * math.cos(sine/35)),math.rad(-35),math.rad(10 - 6 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4 + .2 * math.cos(sine/20),0)*angles(math.rad(-35 + 8 * math.cos(sine/25)),math.rad(0),math.rad(-35 + 5 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4 + .2 * math.cos(sine/20),0)*angles(math.rad(-25 + 2 * math.cos(sine/25)),math.rad(0),math.rad(25 + 5 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(45 + 6 * math.cos(sine/25)),math.rad(25),math.rad(-35 - 10 * math.cos(sine/40)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Nihil" then
			-- First ever Tweened Animation.
			local Alpha = .5
			local S1,S2,S3 = math.sin(sine/35),math.sin(sine/20),math.sin(sine/25)
			local RootJointCos1,RootJointCos2,RootJointCos3 = math.cos(sine/35),math.cos(sine/55),math.cos(sine/65)
			TweenAnimate(RootJoint,{C0=cf(0 + 2 * RootJointCos2,10 + 1 * RootJointCos1,0 + 2 * RootJointCos3)*angles(math.rad(0 + 5 * RootJointCos1),math.rad(-35 - 20 * RootJointCos2),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.2 + .2 * S3,-.8)*angles(math.rad(-5 + 5 * RootJointCos3),math.rad(5),math.rad(-5 + 5 * RootJointCos2))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.95,-1 + .1 * S3,.2)*angles(math.rad(0 - 5 * RootJointCos3),math.rad(-5),math.rad(5 - 5 * RootJointCos2))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.1,.2 + .3 * S3,.5)*angles(math.rad(0),math.rad(0),math.rad(50))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.1,.2 + .2 * S2,.5)*angles(math.rad(0),math.rad(0),math.rad(-50))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(20 + 5 * math.cos(sine/25)),math.rad(20),math.rad(35 + 20 * RootJointCos2))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Ban" then
			local Alpha = .1
			TweenAnimate(RootJoint,{C0=cf(0,0,0)*angles(math.rad(0),math.rad(30),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Temporality" then
			local Alpha = .5
			local S1,S2,S3 = math.sin(sine/25),math.sin(sine/30),math.sin(sine/35)
			local C1,C2,C3 = math.cos(sine/40),math.cos(sine/50),math.cos(sine/60)
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * C2,6 + 1 * S3,0 + 1 * C1)*angles(math.rad(0),math.rad(-50),math.rad(0 + 5 * S2))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.95,-.6 + .2 * S3,-1)*angles(math.rad(-45 + 5 * S3),math.rad(20),math.rad(-5 + 5 * S3))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.95,-1.1 + .1 * S3,-.1)*angles(math.rad(20 - 5 * S3),math.rad(-5),math.rad(5 - 5 * S3))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1,.1 - .1 * S2,-.75)*angles(math.rad(90),math.rad(40),math.rad(90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1,-.2 - .1 * S2,0)*angles(math.rad(180),math.rad(0),math.rad(145 + 10 * S2))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(20  + 10 * S3),math.rad(20),math.rad(55))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Heartbreak" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0,0 + .2 * math.cos(sine/25),0)*angles(math.rad(0),math.rad(-27 + 10 * math.cos(sine/40)),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1 - .2 * math.cos(sine/25),0)*angles(math.rad(0),math.rad(0 - 10 * math.cos(sine/40)),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1 - .2 * math.cos(sine/25),0)*angles(math.rad(-20),math.rad(-35 - 10 * math.cos(sine/40)),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.3,.5,.5)*angles(math.rad(0),math.rad(0),math.rad(40))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.1,.4 + .2 * math.cos(sine/24),.5)*angles(math.rad(0),math.rad(0),math.rad(-50))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(15 + 5 * math.cos(sine/25)),math.rad(0),math.rad(27 - 10 * math.cos(sine/40)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Depression" then
			local Alpha = 1
			TweenAnimate(RootJoint,{C0=cf(0,0 + .2 * math.cos(sine/35),0)*angles(math.rad(0 + 4 * math.cos(sine/25)),math.rad(5),math.rad(0 + 2 * math.cos(sine/30)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.9,-1 - .2 * math.cos(sine/35),-.4)*angles(math.rad(-28.2 - 4 * math.cos(sine/25)),math.rad(28.5),math.rad(-19.2 - 2 * math.cos(sine/30)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.9,-1 - .2 * math.cos(sine/35),-.6)*angles(math.rad(-0.22 - 4 * math.cos(sine/25)),math.rad(10.6),math.rad(9.7 - 2 * math.cos(sine/30)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.2 - .3 * math.cos(sine/35),.5)*angles(math.rad(0),math.rad(35),math.rad(0 - 2 * math.cos(sine/30)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.3 - .2 * math.cos(sine/35),-.6)*angles(math.rad(-10),math.rad(-145),math.rad(150))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(15 - 4 * math.cos(sine/25)),math.rad(-20.3),math.rad(-5.2))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Autumn" then
			local Alpha = 1
			TweenAnimate(RootJoint,{C0=cf(0 + 1.4 * math.cos(sine/40),10 + 1.4 * math.cos(sine/30),0 + 1.4 * math.cos(sine/50))*angles(math.rad(0 - 5 * math.cos(sine/30)),math.rad(45 - 5 * math.cos(sine/25)),math.rad(0 + 8 * math.cos(sine/30)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1,0)*angles(math.rad(30 - 8 * math.cos(sine/30)),math.rad(0),math.rad(-8 + 8 * math.cos(sine/30)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-.5,-.8)*angles(math.rad(-15 + 8 * math.cos(sine/30)),math.rad(0),math.rad(8 - 8 * math.cos(sine/30)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(-20 + 6* math.cos(sine/40)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.1,.4,.4)*angles(math.rad(0),math.rad(0),math.rad(-25))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(20 + 5 * math.cos(sine/30)),math.rad(0 - 8 * math.cos(sine/30)--[[20 - 15 * math.cos(sine/30)]]),math.rad(-45 + 5 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Woodaria" then
			local Alpha = 1
			TweenAnimate(RootJoint,{C0=cf(0,0 - .2 * math.cos(sine/40),0)*angles(math.rad(9.4 + 5 * math.cos(sine/45)),math.rad(35 + .5 * math.cos(sine/55)),math.rad(20.3))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.8,-.7 + .2 * math.cos(sine/40),-.6)*angles(math.rad(-30 - 10 * math.cos(sine/45)),math.rad(0),math.rad(-50 - .5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.955,-1.4 + .2 * math.cos(sine/40),.2)*angles(math.rad(-20 - 10 * math.cos(sine/45)),math.rad(-35),math.rad(-20 + .5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4,0)*angles(math.rad(-9.4 - 10 * math.cos(sine/40)),math.rad(0),math.rad(-20 + 10 * math.cos(sine/60)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.2,.2,.3)*angles(math.rad(-15.8 - 5 * math.cos(sine/40)),math.rad(0),math.rad(-36.6 - 10 * math.cos(sine/60)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-20.3),math.rad(10.4 + 15 * math.cos(sine/55)),math.rad(-35))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Solstice" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0,10 - 1 * math.cos(sine/25),0)*angles(math.rad(0),math.rad(0),math.rad(-40))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.5,-.5 + .3 * math.cos(sine/25),-.9)*angles(math.rad(-25),math.rad(0),math.rad(-50))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(40  + 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.1,.5 - .1 * math.cos(sine/27),.5)*angles(math.rad(0),math.rad(0),math.rad(50))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.8,.35 + .2 * math.cos(sine/24),-.75)*angles(math.rad(90),math.rad(0),math.rad(-90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(0 + 25 * math.cos(50)),math.rad(40),math.rad(0))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Shaitan" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0,0 - .2 * math.cos(sine/25),0)*angles(math.rad(-20),math.rad(0),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1.3 + .2 * math.cos(sine/25),-.5)*angles(math.rad(-30),math.rad(5),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1 + .2 * math.cos(sine/25),-.5)*angles(math.rad(15),math.rad(-5),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.1,.5 + .3 * math.cos(sine/25),.5)*angles(math.rad(0),math.rad(0),math.rad(50))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.8,.2 - .1 * math.cos(sine/25),-.85)*angles(math.rad(90),math.rad(0),math.rad(-90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-20 + 5 * math.cos(sine/25)),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "SpaceTime" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * math.cos(sine/35),10 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55))*angles(math.rad(0 + 15 * math.cos(sine/55)),math.rad(-45 + 5 * math.cos(sine/45)),math.rad(0 + 5 * math.cos(sine/35)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.3 + .2 * math.cos(sine/45),-.8)*angles(math.rad(5 + 15 * math.cos(sine/35)),math.rad(0 - 5 * math.cos(sine/45)),math.rad(-10 + 5 * math.cos(sine/55)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-.9 + .2 * math.cos(sine/45),0)*angles(math.rad(-25 + 15 * math.cos(sine/35)),math.rad(-10 + 5 * math.cos(sine/45)),math.rad(10.7 - 5 * math.cos(sine/55)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4 + .2 * math.cos(sine/45),-.5)*angles(math.rad(0 - 5 * math.cos(sine/35)),math.rad(-30),math.rad(-35 + 5 * math.cos(sine/55)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4 + .2 * math.cos(sine/45),.5)*angles(math.rad(0 + 5 * math.cos(sine/35)),math.rad(-50),math.rad(35 - 5 * math.cos(sine/55)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(5 + 15 * math.cos(sine/55)),math.rad(0 - 5 * math.cos(sine/35)),math.rad(45 - 5 * math.cos(sine/45)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Darkness" then
			local Alpha = .1
			TweenAnimate(RootJoint,{C0=cf(0,0,0)*angles(math.rad(0),math.rad(30),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4,0)*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(0),math.rad(0),math.rad(0))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Distortion" then
			local Alpha = .5
			local Snap = math.random(1,35)
			if Snap == 1 then
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(math.random(-15,23)),math.rad(math.random(-25,25)),math.rad(math.random(-35,35))),1)
			end
			TweenAnimate(RootJoint,{C0=cf(0 + 2 * math.cos(sine/80),10 + .5 * math.cos(sine/35),0 + 1 * math.cos(sine/60))*angles(math.rad(55.7 + 10 * math.cos(sine/55)),math.rad(-16.1),math.rad(150 + 10 * math.cos(sine/40)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.95,-.5 + .3 * math.cos(sine/80),-.8)*angles(math.rad(-25.7 + 10 * math.cos(sine/55)),math.rad(0),math.rad(-26 + 10 * math.cos(sine/40)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1 + .2 * math.cos(sine/80),0)*angles(math.rad(-7.5 + 13 * math.cos(sine/35)),math.rad(0),math.rad(5 + 10 * math.cos(sine/40)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-.8,.8  - .1 * math.cos(sine/45),-.6)*angles(math.rad(129.1),math.rad(-4.5),math.rad(91.3))},Alpha,'Linear','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.95,.3 - .1 * math.cos(sine/45),-.6)*angles(math.rad(73.9),math.rad(2.1),math.rad(-82))},Alpha,'Linear','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-34 + 25 * math.cos(sine/80)),math.rad(30 - 10 * math.cos(sine/40)),math.rad(16.1))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "TryTox" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * math.cos(sine/80),15 + 1 * math.cos(sine/35),0 + 1 * math.cos(sine/60))*angles(math.rad(-44.1),math.rad(-53),math.rad(-4.5 + 7 * math.cos(sine/35)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.8,-.4 + .2 * math.cos(sine/35),-.8)*angles(math.rad(0 + 3.5 * math.cos(sine/35)),math.rad(0),math.rad(-37 + 5 * math.cos(sine/35)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1 + .2 * math.cos(sine/35),-.8)*angles(math.rad(-47 + 3.5 * math.cos(sine/35)),math.rad(0),math.rad(7.5 - 7.5 * math.cos(sine/35)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-.9,.4 + .2 * math.cos(sine/35),-.7)*angles(math.rad(80 + 10 * math.cos(sine/35)),math.rad(0),math.rad(90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4 + .2 * math.cos(sine/35),0)*angles(math.rad(-35 + 10 * math.cos(sine/35)),math.rad(0),math.rad(10 + 10 * math.cos(sine/35)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-25 + 10 * math.cos(sine/35)),math.rad(35 +  5 * math.cos(sine/35)),math.rad(25))},Alpha,'Back','Out',0,false,0)
--[[			TweenAnimate(RootJoint,{C0=cf(.5 + 1 * math.cos(sine/40),8.5 + 1 * math.cos(sine/30),.5  - 1 * math.cos(sine/60))*angles(math.rad(11),math.rad(30),math.rad(9.77))*RootCF},Alpha,'Back','Out',0,false,0)
				TweenAnimate(LH,{C0=cf(-.9,-.6 + .3 * math.cos(sine/30),-.5)*angles(math.rad(-19),math.rad(48),math.rad(-8 - 5 * math.cos(sine/25)))*angles(math.rad(-19),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(RH,{C0=cf(.7,-1 + .2 * math.cos(sine/30),.4)*angles(math.rad(-40),math.rad(-63),math.rad(-20 + 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(LW,{C0=cf(-1.4,.4 + .3 * math.cos(sine/30),0)*angles(math.rad(0),math.rad(0),math.rad(-50))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(RW,{C0=cf(1,.2 + .3 * math.cos(sine/30),-.8)*angles(math.rad(90 + 15 * math.cos(sine/60)),math.rad(0),math.rad(-90))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-9.77),math.rad(-40),math.rad(-30))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(RootJoint,{C0=cf(0,6,0)*angles(math.rad(-11),math.rad(0.98),math..rad(48),math.rad(19))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(RH,{C0=cf(.85,-1,-.2)*angles(math.rad(-3),math.rad(-63),mathrad(-9.77))*RootCF},Alpha,'Back','Out',0,false,0)
				TweenAnimate(LH,{C0=cf(-.95,-.2,-.4)*angles(math.rad(8),math.rad(8))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(LW,{C0=cf(-1.4,-.1,0)*angles(math.rad(18),math.rad(-22),math.rad(-59))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(RW,{C0=cf(1.4,.4,0)*angles(math.rad(18),math.rad(22),math.rad(59))},Alpha,'Back','Out',0,false,0)
				TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(35),math.rad(-40),math.rad(0))},Alpha,'Back','Out',0,false,0)]]
		elseif Mode == "Beauty" then
			local Alpha = 1
			TweenAnimate(RootJoint,{C0=cf(.5 + 1 * math.cos(sine/60),10 + 1 * math.cos(sine/25),.7 + 1 * math.cos(sine/45))*angles(math.rad(0),math.rad(-30 + 15 * math.cos(sine/35)),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.875,-.8 + .3 * math.cos(sine/25),-.8)*angles(math.rad(-25 + 8 * math.cos(sine/80)),math.rad(0),math.rad(-5 - 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.85,-1 + .2 * math.cos(sine/25),.3)*angles(math.rad(-15 + 8 * math.cos(sine/80)),math.rad(-35),math.rad(5 + 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-.9,-.4 + .1 * math.cos(sine/25),-.7)*angles(math.rad(90),math.rad(45),math.rad(90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.9,-.4 + .1 * math.cos(sine/25),-.7)*angles(math.rad(90),math.rad(-45),math.rad(-90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(0 + 15 * math.cos(sine/65)),math.rad(0),math.rad(30 - 15 * math.cos(sine/35)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Technology" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(.5 + 1 * math.cos(sine/45),19 + 1 * math.cos(sine/50),.3 - 1 * math.cos(sine/60))*angles(math.rad(14 + 4 * math.cos(sine/50)),math.rad(5),math.rad(20 + 5 * math.cos(sine/45)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.7,-.4 + .3 * math.cos(sine/50),-.9)*angles(math.rad(0),math.rad(0),math.rad(-40 - 5 * math.cos(sine/50)))*angles(math.rad(7.5),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.9,-1 - .2 * math.cos(sine/50),.2)*angles(math.rad(-7.5),math.rad(-25),math.rad(-7))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.3 + .2 * math.cos(sine/50),.6)*angles(math.rad(-15),math.rad(35),math.rad(-25))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1,1 + .2 * math.cos(sine/50),-1)*angles(math.rad(160),math.rad(-90),math.rad(0 + 10 * math.cos(sine/50)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(30),math.rad(30 + 10 * math.cos(sine/35)),math.rad(0 + 6 * math.cos(sine/60)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Viz" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * math.cos(sine/45),6 + .5 * Visualizer/40 --[[+ 1 * math.cos(sine/35)]],0 + 1 * math.cos(sine/60))*angles(math.rad(0),math.rad(30 + 5 * math.cos(sine/25)),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1 + .2 * math.cos(sine/35),0)*angles(math.rad(-5),math.rad(0),math.rad(-10 - 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-.2 + .2 * math.cos(sine/35),-.8)*angles(math.rad(-15),math.rad(-14),math.rad(5 + 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.6 + .5 * math.cos(sine/35),-.5)*angles(math.rad(0),math.rad(-180),math.rad(-130))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4,-.2)*angles(math.rad(60 + 8 * Visualizer/40),math.rad(0),math.rad(35))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(30),math.rad(0),math.rad(-30 - 5 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Error" then
			local Alpha = 1.5
			local Snap = math.random(1,7)
			if Snap == 1 then
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),1)
				--[[					RootJoint.C0=clerp(RootJoint.C0,cf(math.random(-1,1),math.random(-1,1),math.random(-1,1]0,19,0)*angles(0,0,math.random(-5,5))*RootCF,1)]]	
			end
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * math.cos(sine/35),10 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/45))*angles(math.rad(7),math.rad(10 + 20 * math.cos(sine/40)),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1 + .2 * math.cos(sine/25),-.2)*angles(math.rad(-15 - 15 * math.cos(sine/35)),math.rad(-20),math.rad(-5 - 5 * math.cos(sine/35)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.85,-.6 + .2 * math.cos(sine/25),-1)*angles(math.rad(-30 + 15 * math.cos(sine/35)),math.rad(30),math.rad(15 + 5 * math.cos(sine/35)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.3,.3 + .2 * math.cos(sine/25),-.8)*angles(math.rad(-35),math.rad(140),math.rad(-135 - 5 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.6,.2 + .2 * math.cos(sine/25),-.7)*angles(math.rad(44.6),math.rad(2.6),math.rad(-84.5))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(33 - 7 * math.cos(sine/25)),math.rad(0),math.rad(-10 - 20 * math.cos(sine/40)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Annihilation" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(.9 + 1 * math.cos(sine/80),10 + 1 * math.cos(sine/35),.7 + 1 * math.cos(sine/60))*angles(math.rad(35),math.rad(20),math.rad(15))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.4,-.3 + .2 * math.cos(sine/25),-.4)*angles(math.rad(0),math.rad(0),math.rad(-40 - 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-.4 + .1 * math.cos(sine/25),-.5)*angles(math.rad(0),math.rad(-30),math.rad(15 + 7.5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.1,.5 + .1 * math.cos(sine/35),.5)*angles(math.rad(0),math.rad(0),math.rad(50 + 6 * math.cos(sine/26)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.1,.5 + .1 * math.cos(sine/35),.5)*angles(math.rad(0),math.rad(0),math.rad(-50 + 6 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(35),math.rad(-15),math.rad(20))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Asastaria" then -- Kill me! : >
			local Alpha = 1
			TweenAnimate(RootJoint,{C0=cf(.3 + 1.2 * math.cos(sine/35),10 - .5 * math.cos(sine/25),.4 + 1 * math.cos(sine/55))*angles(math.rad(0 - 6 * math.cos(sine/30)),math.rad(-50 - 20 * math.cos(sine/40)),math.rad(0))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.6 + .2 * math.cos(sine/25),-.8)*angles(math.rad(-25),math.rad(15),math.rad(-7.5 - 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1.1 + .2 * math.cos(sine/25),.1)*angles(math.rad(-7.5),math.rad(-10),math.rad(5 + 5 * math.cos(sine/25)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1,.4 + .2 * math.cos(sine/25),-.85)*angles(math.rad(180 + 5 * math.cos(sine/25)),math.rad(0),math.rad(90))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.1,.2 + .2 * math.cos(sine/25),.6)*angles(math.rad(0),math.rad(0),math.rad(-50 + 5 * math.cos(sine/25)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(15),math.rad(0 - 6 * math.cos(sine/30)),math.rad(50 + 20 * math.cos(sine/40)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Shinigami" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0.5 + 1 * math.cos(sine/60),8 + 1 * math.cos(sine/30),0.5 + 1 * math.cos(sine/50))*angles(math.rad(28),math.rad(-40 + 15 * math.cos(sine/45)),math.rad(21))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.7 + .2 * math.cos(sine/30),-.9)*angles(math.rad(-40),math.rad(10),math.rad(-23 - 5 * math.cos(sine/30)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1 + .2 * math.cos(sine/30),0)*angles(math.rad(-20),math.rad(0),math.rad(5 + 5 * math.cos(sine/30)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4 + .2 * math.cos(sine/30),.3)*angles(math.rad(-25),math.rad(0),math.rad(-1))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(.65,.6 + .2 * math.cos(sine/30),-1.2)*angles(math.rad(-10),math.rad(-135),math.rad(145))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(28),math.rad(40 - 15 * math.cos(sine/45)),math.rad(21 + 7.5 * math.cos(sine/50)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Arakasha" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(.4 + 1 * math.cos(sine/45),10 - 1 * math.cos(sine/30),.6 + 1 * math.cos(sine/50))*angles(math.rad(35 + 5 * math.cos(sine/50)),math.rad(25 - 15 * math.cos(sine/50)),math.rad(0 - 8.5 * math.cos(sine/40)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.9,-.875 + .2 * math.cos(sine/30),.1)*angles(math.rad(-15),math.rad(25),math.rad(-17.5 - 5 * math.cos(sine/30)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.955,-.6 + .3 * math.cos(sine/30),-.6)*angles(math.rad(-25),math.rad(-25),math.rad(15 + 7.5 * math.cos(sine/30)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4 + .4 * math.cos(sine/30),0)*angles(math.rad(-35),math.rad(0),math.rad(-25 - 10 * math.cos(sine/30)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4 + .4 * math.cos(sine/30),0)*angles(math.rad(-35),math.rad(0),math.rad(25 + 10 * math.cos(sine/30)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(40),math.rad(-10 + 20 * math.cos(sine/40)),math.rad(-25  +- 15 * math.cos(sine/50)))},Alpha,'Back','Out',0,false,0)
		elseif Mode == "Disarray" then
			local Alpha = .5
			TweenAnimate(RootJoint,{C0=cf(0 + 1 * math.cos(sine/50),6 + 2 * math.cos(sine/40),0 + 1 * math.cos(sine/30))*angles(math.rad(-40 + 10 * math.cos(sine/40)),math.rad(45 - 10 * math.cos(sine/30)),math.rad(0 + 20 * math.cos(sine/50)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.9,-1.3,.1)*angles(math.rad(-51 + 15 * math.cos(sine/40)),math.rad(0),math.rad(20 + 5 * math.cos(sine/40)))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-.4,-.8)*angles(math.rad(-20 + 5 * math.cos(sine/40)),math.rad(-5),math.rad(20 - 5 * math.cos(sine/40)))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1,.4 + .1 * math.cos(sine/35),-.9)*angles(math.rad(10 + 5 * math.cos(sine/40)),math.rad(140),math.rad(-150))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4,0)*angles(math.rad(50 - 10 * math.cos(sine/40)),math.rad(0),math.rad(20 - 20 * math.cos(sine/50)))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-40 + 10 * math.cos(sine/40)),math.rad(25 - 10 * math.cos(sine/50)),math.rad(-45 + 10 * math.cos(sine/30)))},Alpha,'Back','Out',0,false,0)
		end
	elseif Torvel>2 and Torvel<30 and hitfloor~=nil then
		if  Mode == "Autumn" then
			swait()
			local Alpha = .8
			local S1,S2,S3 = math.sin(sine/30),math.sin(sine/35),math.sin(sine/20)
			local C1,C2,C3 = math.cos(sine/25),math.cos(sine/15),math.cos(sine/10)
			TweenAnimate(RootJoint,{C0=cf(0,10 + 1.5 * math.cos(sine/30),0)*angles(math.rad(-30*Vec.Z),math.rad(26*Vec.X - root.RotVelocity.Y),math.rad(-25*Vec.X - root.RotVelocity.Y * 4.5 + 3 * math.cos(sine / 47)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.4,-.6)*angles(math.rad(0 + 15 * S3),math.rad(0),math.rad(-10))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1,0)*angles(math.rad(0 - 15 * S1),math.rad(0),math.rad(10))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.2,0)*angles(math.rad(0 + 12 * S1),math.rad(0),math.rad(-15))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.2,0)*angles(math.rad(0 + 12 * S2),math.rad(0),math.rad(15))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-30*Vec.Z),math.rad(26*Vec.X),math.rad(-25*Vec.X))},Alpha,'Back','Out',0,false,0)
		else
			Anim="Walk"
			swait()
			local Alpha = .5
			local S1,S2,S3 = math.sin(sine/5),math.sin(sine/7),math.sin(sine/14)
			local C1,C2,C3 = math.cos(sine/4),math.sin(sine/6.5),math.sin(sine/12.5)
			TweenAnimate(RootJoint,{C0=cf(0,0 + .1 * C2,0)*angles(math.rad(-5*Vec.Z),math.rad(-10*Vec.X-root.Velocity.Y - 10 * C3),math.rad(-7.5*Vec.X-root.Velocity.Y))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1.1 - .3 * math.cos(sine/12.5),0 + .3 * C3)*angles(math.rad(-Vec.Z*30 * C3),math.rad(0-(Vec.X)*10 + 10 * C3),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1.1 + .3 * math.cos(sine/12.5),0 - .3 * C3)*angles(math.rad(Vec.Z*30 * C3),math.rad(0-(Vec.X)*10 + 10 * C3),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4,0 + .2 * C3)*angles(math.rad(Vec.Z*30 * C3),math.rad(0-(Vec.X)*10 + 10 * C3),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4,0 - .2 * C3)*angles(math.rad(-Vec.Z*30 * C3),math.rad(0-(Vec.X)*10 + 10 * C3),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(20*Vec.Z),math.rad(-10*Vec.X),math.rad(-7.5*Vec.X + 7.5 * C3))},Alpha,'Back','Out',0,false,0)
		end
	elseif Torvel>=30 and hitfloor~=nil then
		Anim="Run"
		if Mode == "Shinigami" or Mode == "Autumn"  or Mode == "Viz" or Mode == "Error" or Mode == "Disarray" or Mode == "Arakasha" or Mode == "Nihil" or Mode == "Asastaria" or Mode == "SpaceTime" or Mode == "Amezsthrasphere" or Mode == "Solstice" or Mode == "TryTox" or Mode == "Technology" or Mode == "Annihilation" or Mode == "Judgement" or Mode == "Beauty" or Mode == "Temporality" or Mode == "Distortion" then
			swait()
			local Alpha = .5
			local S1,S2,S3 = math.sin(sine/30),math.sin(sine/35),math.sin(sine/20)
			local C1,C2,C3 = math.cos(sine/25),math.cos(sine/15),math.cos(sine/10)
			TweenAnimate(RootJoint,{C0=cf(0,10 + 1.5 * math.cos(sine/30),0)*angles(math.rad(-50*Vec.Z),math.rad(26*Vec.X - root.RotVelocity.Y),math.rad(-25*Vec.X - root.RotVelocity.Y * 4.5 + 3 * math.cos(sine / 47)))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-.4,-.6)*angles(math.rad(0 + 15 * S3),math.rad(0),math.rad(-10))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1,0)*angles(math.rad(0 - 15 * S1),math.rad(0),math.rad(10))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.2,0)*angles(math.rad(0 + 12 * S1),math.rad(0),math.rad(-15))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.2,0)*angles(math.rad(0 + 12 * S2),math.rad(0),math.rad(15))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(-40*Vec.Z),math.rad(26*Vec.X),math.rad(-25*Vec.X))},Alpha,'Back','Out',0,false,0)
		else
			swait()
			local Alpha = .5
			local S1,S2,S3 = math.sin(sine/7.5),math.sin(sine/10),math.sin(sine/4.5)
			TweenAnimate(RootJoint,{C0=cf(0,0 + .2 * S3,0)*angles(math.rad(-15*(Vec.Z)),math.rad(10*Vec.X - root.RotVelocity.Y  - 10 * S2),math.rad(-7.5*Vec.X - root.Velocity.Y))*RootCF},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LH,{C0=cf(-.975,-1.1 + .3 * S1,0 - .3 * S1)*angles(math.rad(Vec.Z*55 * S1),math.rad(0-(Vec.X)*10 + 10 * S1),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RH,{C0=cf(.975,-1.1 - .3 * S1,0 + .3 * S1)*angles(math.rad(-Vec.Z*55 * S1),math.rad(0-(Vec.X)*10 + 10 * S1),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(LW,{C0=cf(-1.4,.4 + .2 * S1,0 - .2 * S1)*angles(math.rad(-Vec.Z*55 * S1),math.rad(0-(Vec.X)*10 + 10 * S1),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(RW,{C0=cf(1.4,.4 - .2 * S1,0 + .2 * S1)*angles(math.rad(Vec.Z*55 * S1),math.rad(0-(Vec.X)*10 + 10 * S1),math.rad(0))},Alpha,'Back','Out',0,false,0)
			TweenAnimate(Torso.Neck,{C0=necko*angles(math.rad(15*Vec.Z),math.rad(7.5*Vec.X),math.rad(-10*Vec.X + 10 * S2))},Alpha,'Back','Out',0,false,0)
		end
	end
end
end))

task.spawn(function()
	local script = script.SomeElse.Effectments
	script.Enabled = true
	
	local Player = game.Players.LocalPlayer local Character = Player.Character repeat wait() until script.Name ~= "Effectments" local Effect

	local Effect
	if workspace:FindFirstChild("Effect") then
		Effect = workspace:FindFirstChild("Effect")
	else
		Effect = Instance.new("Folder",workspace)
		Effect.Name = "Effect"
	end
	function TweenEffect(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse)
		coroutine.resume(coroutine.create(function()
			local Part = Instance.new("Part",Effect)
			Part.CFrame = Position
			Part.Color = Color
			Part.Size = Size
			Part.Anchored = true
			Part.CanCollide = false
			Part.Transparency = Transparency
			Part.CastShadow = false
			if Material == nil then
				Part.Material = "Neon"
			else
				Part.Material = Material
			end
			if Shape == "Sphere" then
				local sphemesh = Instance.new("SpecialMesh",Part)
				sphemesh.MeshType = Enum.MeshType.Sphere
				sphemesh.Scale = Vector3.new(1,1,1)
			elseif Shape == "Cylinder" then
				local sphemesh = Instance.new("SpecialMesh",Part)
				sphemesh.MeshType = Enum.MeshType.Cylinder
				sphemesh.Scale = Vector3.new(1,1,1)
			end
			local tweenserv = game:GetService("TweenService")
			local tweeninf = TweenInfo.new(
				TweenLength,
				Enum.EasingStyle[TweenStyle],
				Enum.EasingDirection[TweenDirection],
				TweenRepeat,
				TweenReverse,
				0
			)
			local TweenProperty = Property
			local tween = tweenserv:Create(Part,tweeninf,TweenProperty)
			tween:Play()
			if TweenReverse == true then
				game.Debris:AddItem(Part,TweenLength*2)
			else
				game.Debris:AddItem(Part,TweenLength)
			end
		end))
	end
	function TweenMesh(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse)
		coroutine.resume(coroutine.create(function()
			local Part = script.SpecialEffect[Shape]:Clone()
			Part.Parent = Effect
			Part.Transparency = Transparency
			Part.CFrame = Position
			Part.Color = Color
			for i,v in pairs(Part:GetChildren()) do
				v.Color3 = Color
			end
			Part.Size = Size
			Part.Anchored = true
			Part.CanCollide = false

			if Material == nil then
				Part.Material = "Neon"
			else
				Part.Material = Material
			end
			local tweenserv = game:GetService("TweenService")
			local tweeninf = TweenInfo.new(
				TweenLength,
				Enum.EasingStyle[TweenStyle],
				Enum.EasingDirection[TweenDirection],
				TweenRepeat,
				TweenReverse,
				0
			)
			local tweenprop = Property
			local tween = tweenserv:Create(Part,tweeninf,tweenprop)
			tween:Play()
			if TweenReverse == true then
				game.Debris:AddItem(Part,TweenLength*2)
			else
				game.Debris:AddItem(Part,TweenLength)
			end
		end))
	end
	script.EffEvent.Event:Connect(function(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse,OhMyGod,Effect)
		if OhMyGod == "TweenEffect" then
			TweenEffect(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse,Effect)
		elseif OhMyGod == "TweenMesh" then
			TweenMesh(Shape,Position,Color,Size,Weld,Material,Transparency,Property,TweenLength,TweenStyle,TweenDirection,TweenRepeat,TweenReverse,Effect)
		end
	end)
end)

task.spawn(function()
	local script = game.Players.LocalPlayer.PlayerGui:WaitForChild(Player.Name .. "'s Wing")

	repeat wait() until script.lwing1.Value ~= nil and
		script.lwing2.Value ~= nil and 
		script.lwing3.Value ~= nil and 
		script.rwing1.Value ~= nil and 
		script.rwing2.Value ~= nil and 
		script.rwing3.Value ~= nil
	local CoreRotation = 0
	local WingRotation = 0
	local WingRotation2 = 0
	local WingRotation3 = 0
	local WingRotation4 = 0
	local WingRotation5 = 0
	local WingRotation6 = 0
	local rad = math.rad;
	local cos = math.cos;
	local sin = math.sin;
	local tan = math.tan; 
	local pi = math.pi;
	local cosh = math.cosh;
	local sinh = math.sinh;
	local random = math.random;
	local abs = math.abs;
	local ceil = math.ceil;
	local random = math.random;
	local LerpFactor, Alpha = .1,.1
	local ArtificialHeartbeat = Instance.new("BindableEvent", script)
	ArtificialHeartbeat.Name = "Heartbeat"

	script:WaitForChild("Heartbeat")

	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	local frame = 1/60
	ArtificialHeartbeat:Fire()
	spawn(function()
		game:GetService("RunService").Heartbeat:connect(function(s, p)
			tf = tf + s
			if tf >= frame then
				if allowframeloss then
					script.Heartbeat:Fire()
					lastframe = tick()
				else
					for i = 1, math.floor(tf / frame) do
						ArtificialHeartbeat:Fire()
					end
					lastframe = tick()
				end
				if tossremainder then
					tf = 0
				else
					tf = tf - frame * math.floor(tf / frame)
				end
			end
		end)
	end)
	function swait(num)
		if num == 0 or num == nil then
			ArtificialHeartbeat.Event:wait()
		else
			for i = 0, num do
				ArtificialHeartbeat.Event:wait()
			end
		end
	end
	function QuaternionFromCFrame(cf) 
		local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
		local trace = m00 + m11 + m22 
		if trace > 0 then 
			local s = math.sqrt(1 + trace) 
			local recip = 0.5/s 
			return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 
		else 
			local i = 0 
			if m11 > m00 then
				i = 1
			end
			if m22 > (i == 0 and m00 or m11) then 
				i = 2 
			end 
			if i == 0 then 
				local s = math.sqrt(m00-m11-m22+1) 
				local recip = 0.5/s 
				return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
			elseif i == 1 then 
				local s = math.sqrt(m11-m22-m00+1) 
				local recip = 0.5/s 
				return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip 
			elseif i == 2 then 
				local s = math.sqrt(m22-m00-m11+1) 
				local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip 
			end 
		end 
	end

	function QuaternionToCFrame(px, py, pz, x, y, z, w) 
		local xs, ys, zs = x + x, y + y, z + z 
		local wx, wy, wz = w*xs, w*ys, w*zs 
		local xx = x*xs 
		local xy = x*ys 
		local xz = x*zs 
		local yy = y*ys 
		local yz = y*zs 
		local zz = z*zs 
		return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
	end

	function QuaternionSlerp(a, b, t) 
		local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
		local startInterp, finishInterp; 
		if cosTheta >= 0.0001 then 
			if (1 - cosTheta) > 0.0001 then 
				local theta = math.acos(cosTheta) 
				local invSinTheta = 1/math.sin(theta) 
				startInterp = math.sin((1-t)*theta)*invSinTheta 
				finishInterp = math.sin(t*theta)*invSinTheta  
			else 
				startInterp = 1-t 
				finishInterp = t 
			end 
		else 
			if (1+cosTheta) > 0.0001 then 
				local theta = math.acos(-cosTheta) 
				local invSinTheta = 1/math.sin(theta) 
				startInterp = math.sin((t-1)*theta)*invSinTheta 
				finishInterp = math.sin(t*theta)*invSinTheta 
			else 
				startInterp = t-1 
				finishInterp = t 
			end 
		end 
		return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
	end


	function clerp(a,b,t) 
		local qa = {QuaternionFromCFrame(a)}
		local qb = {QuaternionFromCFrame(b)} 
		local ax, ay, az = a.x, a.y, a.z 
		local bx, by, bz = b.x, b.y, b.z
		local _t = 1-t
		return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
	end 
	local sine = 0
	local SineA = 0
	local SineB = 0
	local SineC = 0
	local Change = 1
	ArtificialHeartbeat.Event:Connect(function()
		sine = sine + Change 
	end) 
	swait(10)
	ArtificialHeartbeat.Event:Connect(function()
		SineA = SineA + Change 
	end) 
	swait(10)
	ArtificialHeartbeat.Event:Connect(function()
		SineB = SineB + Change 
	end) 
	swait(10)
	ArtificialHeartbeat.Event:Connect(function()
		SineC = SineC + Change 
	end) 
	ArtificialHeartbeat.Event:Connect(function()
		local Mode = script.ModeValue.Value
		local VisValue = script.VisValue.Value
		local lwing1weld = script.lwing1.Value
		local lwing2weld = script.lwing2.Value
		local lwing3weld = script.lwing3.Value
		local rwing1weld = script.rwing1.Value
		local rwing2weld = script.rwing2.Value
		local rwing3weld = script.rwing3.Value
		local coreweld = script.core.Value
		local winglerp = .5
		if Mode == "Excessive" or Mode == "Ban" or Mode == "Annihilation" or Mode == "Heartbreak" or Mode == "Solstice" or Mode == "Arakasha" or Mode == "Woodaria" then
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + 30 * math.cos(sine/40))),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(35 + 30 * math.cos(sine/40))),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-35 + 30 * math.cos(sine/40))),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 + 30 * math.cos(sine/40))),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(35 + 30 * math.cos(sine/40))),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-35 + 30 * math.cos(sine/40))),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 30 * math.cos(sine/40)),math.rad(0)),winglerp)
		elseif Mode == "Disarray" then
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + 30 * math.cos(sine/40))),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(25 + 30 * math.cos(sine/40))),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-25 + 30 * math.cos(sine/40))),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 + 30 * math.cos(sine/40))),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(25 + 30 * math.cos(sine/40))),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-25 + 30 * math.cos(sine/40))),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 30 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-4,0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 30 * math.cos(sine/40)),math.rad(0)),winglerp)
		elseif Mode == "Depression" then
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + 25 * math.cos(sine/40))),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(25 + 25 * math.cos(sine/40))),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-25 + 25 * math.cos(sine/40))),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 + 25 * math.cos(sine/40))),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(25 + 25 * math.cos(sine/40))),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-25 + 25 * math.cos(sine/40))),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-4,0 - 2 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 20 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-4,0 - 2 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 5 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-4,0 - 2 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 45 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-4,0 - 2 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 + 20 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-4,0 - 2 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 5 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-4,0 - 2 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 - 45 * math.cos(sine/40)),math.rad(0)),winglerp)
		elseif Mode == "Viz" then
			local Visualizer = VisValue/1
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/55),0 + 1 * math.cos(sine/65),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(5 + 7.5 * Visualizer/75)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(40 + 7.5 * Visualizer/75)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-30 + 7.5 * Visualizer/75)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(5 + 7.5 * Visualizer/75)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(40 + 7.5 * Visualizer/75)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-30 + 7.5 * Visualizer/75)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-4 --[[- 2.5 * Visualizer/100]],0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 --[[- 7.5 * Visualizer/100]]),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-4--[[- 2.5 * Visualizer/100]],0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 --[[+ 7.5 * Visualizer/100),math.rad(0)]]),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-4--[[ - 2.5 * Visualizer/100]],0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 --[[- 7.5 * Visualizer/100),math.rad(0)]]),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-4--[[ - 2.5 * Visualizer/100]],0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 --[[- 7.5 * Visualizer/100),math.rad(0)]]),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-4--[[ - 2.5 * Visualizer/100]],0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 --[[+ 7.5 * Visualizer/100),math.rad(0)]]),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-4--[[ - 2.5 * Visualizer/100]],0 + 1 * math.sin(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0 --[[+ 7.5 * Visualizer/100),math.rad(0)]]),math.rad(0)),winglerp)
		elseif Mode == "Nihil" then
			local Visualizer = VisValue/1
			WingRotation = WingRotation + Visualizer/45
			WingRotation2 = WingRotation2 - Visualizer/45
			CoreRotation = CoreRotation + Visualizer/45
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/62),0 + 1 * math.cos(sine/28),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 10 * math.cos(sine/28),0 + 10 * math.cos(sine/24),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 10 * math.cos(sine/28),0 + 10 * math.cos(sine/24),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(120 + WingRotation)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 10 * math.cos(sine/28),0 + 10 * math.cos(sine/24),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(240 + WingRotation)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 10 * math.cos(sine/23),0 + 10 * math.cos(sine/29),2)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 - WingRotation2)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 10 * math.cos(sine/23),0 + 10 * math.cos(sine/29),2)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(120 - WingRotation2)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 10 * math.cos(sine/23),0 + 10 * math.cos(sine/29),2)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(240 - WingRotation2)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-1 + 1 * math.cos(sine/62),1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-1 + 1 * math.cos(sine/62),1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-1 + 1 * math.cos(sine/62),1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-1 + 1 * math.cos(sine/62),1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-1 + 1 * math.cos(sine/62),1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-1 + 1 * math.cos(sine/62),1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		elseif Mode == "Temporality" then -- RobloxFan's Administration Mode
			WingRotation = WingRotation + 1
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0,-6 - 1 * math.cos(sine/65),0)*CFrame.Angles(math.rad(180),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,-5,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0 + WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,-5,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(120 + WingRotation)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,-5,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(240 + WingRotation)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,-5,0)*CFrame.Angles(math.rad(90),math.rad(180),math.rad(0 + WingRotation)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,-5,0)*CFrame.Angles(math.rad(90),math.rad(180),math.rad(120 + WingRotation)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,-5,0)*CFrame.Angles(math.rad(90),math.rad(180),math.rad(240 + WingRotation)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(0 - 13 * math.cos(sine/32),0 + 3 * math.cos(sine/32),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(0 - 13 * math.cos(sine/32),0 + 3 * math.cos(sine/32),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(0 - 13 * math.cos(sine/32),0 + 3 * math.cos(sine/32),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(0 - 13 * math.cos(sine/32),0 + 3 * math.cos(sine/32),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(0 - 13 * math.cos(sine/32),0 + 3 * math.cos(sine/32),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(0 - 13 * math.cos(sine/32),0 + 3 * math.cos(sine/32),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
--[[	elseif Mode == "Autumn" then
		WingRotation = WingRotation + 2.5
		CoreRotation = CoreRotation + 5
		coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
		lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(0 + WingRotation)),winglerp)
		lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(60 + WingRotation)),winglerp)
		lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(120 + WingRotation)),winglerp)
		rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(180 + WingRotation)),winglerp)
		rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(240 + WingRotation)),winglerp)
		rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(300 + WingRotation)),winglerp)
		lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-1 + 2 * math.cos(sine/40),2.5 - 5 * math.cos(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-1 + 2 * math.cos(sine/40),2.5 - 5 * math.cos(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-1 + 2 * math.cos(sine/40),2.5 - 5 * math.cos(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-1 + 2 * math.cos(sine/40),2.5 - 5 * math.cos(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-1 + 2 * math.cos(sine/40),2.5 - 5 * math.cos(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-1 + 2 * math.cos(sine/40),2.5 - 5 * math.cos(sine/40),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)]]
--[[	elseif Mode == "Autumn" then
		WingRotation = WingRotation + 1
		CoreRotation = CoreRotation + 5
		coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
		lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(0 + WingRotation)),winglerp)
		lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(60 + WingRotation)),winglerp)
		lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(120 + WingRotation)),winglerp)
		rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(180 + WingRotation)),winglerp)
		rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(240 + WingRotation)),winglerp)
		rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/45),0 + 1 * math.cos(sine/55),1.5)*CFrame.Angles(math.rad(0),math.rad(0 + 10 * math.cos(sine/60)),math.rad(300 + WingRotation)),winglerp)
		lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-2 + 2 * math.cos(sine/50),25  - 12.5 * math.cos(sine/50),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-2 + 2 * math.cos(sine/50),25  - 12.5 * math.cos(sine/50),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-2 + 2 * math.cos(sine/50),25  - 12.5 * math.cos(sine/50),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-2 + 2 * math.cos(sine/50),25  - 12.5 * math.cos(sine/50),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-2 + 2 * math.cos(sine/50),25  - 12.5 * math.cos(sine/50),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-2 + 2 * math.cos(sine/50),25 - 12.5 * math.cos(sine/50),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)]]
		elseif Mode == "Asastaria" or Mode == "Autumn" or Mode == "Outbreak" or Mode == "TryTox" or Mode == "Judgement" or Mode == "Beauty" or Mode == "Amezsthrasphere" then
			WingRotation = WingRotation + 4.5
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),2.5)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(120 + WingRotation)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(240 + WingRotation)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),2)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 + WingRotation)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),2)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(120 + WingRotation)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),2)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(240 + WingRotation)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		elseif Mode == "Distortion" then
			WingRotation = WingRotation + .5
			WingRotation2 = WingRotation2 + 1
			WingRotation3 = WingRotation3 + 1.5
			WingRotation4 = WingRotation4 + 2
			WingRotation5 = WingRotation5 + 2.5
			WingRotation6 = WingRotation6 + 3
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0,0,2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,0,3.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(20 + WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,0,4)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(25 + WingRotation2)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,0,1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(30 + WingRotation3)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,0,2)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(20 + WingRotation4)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,0,2.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(25 + WingRotation5)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,0,3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(30 + WingRotation6)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-3,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		elseif Mode == "Technology" then
			WingRotation = WingRotation + 2.5
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/25),0 + 1 * math.cos(sine/35),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,2,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,2,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(120 + WingRotation)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,2,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(240 + WingRotation)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,-2,0)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 + WingRotation)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,-2,0)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(120 + WingRotation)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,-2,0)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(240 + WingRotation)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-3 + 3 * math.cos(sine/45),0 - 25 * math.cos(sine/45),0 + 3 * math.cos(sine/45))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-3 + 3 * math.cos(sine/45),0 - 25 * math.cos(sine/45),0 + 3 * math.cos(sine/45))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-3 + 3 * math.cos(sine/45),0 - 25 * math.cos(sine/45),0 + 3 * math.cos(sine/45))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-3 - 3 * math.cos(sine/25),0 + 25 * math.cos(sine/25),0 + 3 * math.cos(sine/45))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-3 - 3 * math.cos(sine/25),0 + 25 * math.cos(sine/25),0 + 3 * math.cos(sine/45))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-3 - 3 * math.cos(sine/25),0 + 25 * math.cos(sine/25),0 + 3 * math.cos(sine/45))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		elseif Mode == "Shaitan" then
			WingRotation = WingRotation + 2.5
			CoreRotation = CoreRotation + 2.5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),2 )*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(25)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(155)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-25)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-90)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 1 * math.cos(sine/65),0 + 1 * math.cos(sine/65),1.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(-155)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(0 + 25 * math.cos(sine/65)),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(0 + 25 * math.cos(sine/65)),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(0 + 25 * math.cos(sine/65)),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(0 - 25 * math.cos(sine/65)),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(0 - 25 * math.cos(sine/65)),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(0 - 25 * math.cos(sine/65)),math.rad(0)),winglerp)
		elseif Mode == "" then
			WingRotation = WingRotation + 2.5
			CoreRotation = CoreRotation + 5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/60),-6 + 1 * math.cos(sine/65),0)*CFrame.Angles(math.rad(0),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,6 + 1 * math.cos(sine/40),0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(25 - WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,6 + 1 * math.cos(sine/40),0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(90 - WingRotation)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,6 + 1 * math.cos(sine/40),0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(155 - WingRotation)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,6 + 1 * math.cos(sine/40),0)*CFrame.Angles(math.rad(90),math.rad(180),math.rad(-25 + WingRotation)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,6 + 1 * math.cos(sine/40),0)*CFrame.Angles(math.rad(90),math.rad(180),math.rad(-90 + WingRotation)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,6 + 1 * math.cos(sine/40),0)*CFrame.Angles(math.rad(90),math.rad(180),math.rad(-155 + WingRotation)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(20 - 15 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(20 - 15 * math.cos(sine/40)),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(20 - 15 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(-20 + 15 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(-20 + 15 * math.cos(sine/40)),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-5 + 5 * math.cos(sine/25),0,0)*CFrame.Angles(math.rad(0),math.rad(-20 + 15 * math.cos(sine/40)),math.rad(0)),winglerp)
		elseif Mode == "SpaceTime" or Mode == "Shinigami" then
			WingRotation = WingRotation + 2
			CoreRotation = CoreRotation + 2.5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0 + WingRotation)),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(120 + WingRotation)),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(240 + WingRotation)),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0 + WingRotation)),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(120 + WingRotation)),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0 + 3 * math.cos(sine/35),0 + 3 * math.cos(sine/45),2.5)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(240 + WingRotation)),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-5 - 3 * math.cos(sine/25),0 + 15 * math.cos(sine/64),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-5 - 3 * math.cos(sine/25),0 + 15 * math.cos(sine/64),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-5 - 3 * math.cos(sine/25),0 + 15 * math.cos(sine/64),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-10 - 6 * math.cos(sine/25),0 + 30 * math.cos(sine/64),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-10 - 6 * math.cos(sine/25),0 + 30 * math.cos(sine/64),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-10 - 6 * math.cos(sine/25),0 + 30 * math.cos(sine/64),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),winglerp)
		elseif Mode == "Error" then
			WingRotation = WingRotation + 2
			CoreRotation = CoreRotation + 2.5
			coreweld.C0 = clerp(coreweld.C0,CFrame.new(0 + 1 * math.cos(sine/35),1.2 + 1 * math.cos(sine/45),2)*CFrame.Angles(math.rad(90),math.rad(0 + CoreRotation),math.rad(0)),winglerp)
			lwing1weld.C0 = clerp(lwing1weld.C0,CFrame.new(0,0,1)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(95+180 + 100 * math.cos(sine/5))),winglerp)
			lwing2weld.C0 = clerp(lwing2weld.C0,CFrame.new(0,0,1)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(35+180 + 100 * math.cos(sine/15))),winglerp)
			lwing3weld.C0 = clerp(lwing3weld.C0,CFrame.new(0,0,1)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(125+180 + 100 * math.cos(sine/12))),winglerp)
			rwing1weld.C0 = clerp(rwing1weld.C0,CFrame.new(0,0,1)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(95 - 100 * math.cos(sine/2))),winglerp)
			rwing2weld.C0 = clerp(rwing2weld.C0,CFrame.new(0,0,1)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(35 - 100 * math.cos(sine/9))),winglerp)
			rwing3weld.C0 = clerp(rwing3weld.C0,CFrame.new(0,0,1)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(125 - 100 * math.cos(sine/5.5))),winglerp)
			lwing1weld.C1 = clerp(lwing1weld.C1,CFrame.new(-1 + 2 * math.cos(sine/2),0,0)*CFrame.Angles(math.rad(0 + 20 * math.cos(5)),math.rad(0),math.rad(0)),winglerp)
			lwing2weld.C1 = clerp(lwing2weld.C1,CFrame.new(-1 + 2 * math.cos(sine/15),0,0)*CFrame.Angles(math.rad(0 + 20 * math.cos(2)),math.rad(0),math.rad(0)),winglerp)
			lwing3weld.C1 = clerp(lwing3weld.C1,CFrame.new(-1 + 2 * math.cos(sine/6),0,0)*CFrame.Angles(math.rad(0 + 20 * math.cos(8)),math.rad(0),math.rad(0)),winglerp)
			rwing1weld.C1 = clerp(rwing1weld.C1,CFrame.new(-1 + 2 * math.cos(sine/8),0,0)*CFrame.Angles(math.rad(0 + 20 * math.cos(15)),math.rad(0),math.rad(0)),winglerp)
			rwing2weld.C1 = clerp(rwing2weld.C1,CFrame.new(-1 + 2 * math.cos(sine/11),0,0)*CFrame.Angles(math.rad(0 + 20 * math.cos(4)),math.rad(0),math.rad(0)),winglerp)
			rwing3weld.C1 = clerp(rwing3weld.C1,CFrame.new(-1 + 2 * math.cos(sine/5),0,0)*CFrame.Angles(math.rad(0 + 20 * math.cos(7)),math.rad(0),math.rad(0)),winglerp)
		end
	end)
end)

task.spawn(function()
	local script = script.ModeFunction

	local Player = game:GetService('Players').LocalPlayer
	local Char = Player.Character
	local Event = Char:WaitForChild("UserInput_Event")
	local UIS = game:GetService("UserInputService")
	local Viz = script.Parent.Viz
	local Camera = game.Workspace.CurrentCamera
	local ModeEvent = script.Parent.Mode
	coroutine.resume(coroutine.create(function()
		while wait() do 
			Viz:Fire(Player, Player.PlayerGui.Song.PlaybackLoudness)
		end
	end))
	local Input = function(io,a)
		if a then return end
		local io = {KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState}
		Event:Fire(Player, io)
	end
	UIS.InputBegan:Connect(Input)
	UIS.InputEnded:Connect(Input)
	local Changed = false
	local Mouse = Player:GetMouse()
	local H,T = Mouse.Hit,Mouse.Target
	while wait(1/30) do
		if H~=Mouse.Hit or T~=Mouse.Target then
			Event:Fire(Player, {isMouse=true,Target=Mouse.Target,Hit=Mouse.Hit})
			H,T=Mouse.Hit,Mouse.Target
		end
	end
end)

local char = game.Players.LocalPlayer.Character

local wings = {}
for _, v in pairs(char:GetChildren()) do
    if v:IsA("Accessory") and v.Name == "Accessory (LSWingOne)" then
        table.insert(wings, v)
    end
end

if #wings >= 6 then
    for i = 1, 6 do
        wings[i].Handle.AccessoryWeld:Destroy()
    end
    char.swordhalo.Handle.AccessoryWeld:Destroy()

    local targets = {
        char.WongZ.rwing1.Handle,
        char.WongZ.rwing2.Handle,
        char.WongZ.rwing3.Handle,
        char.WongZ.lwing1.Handle,
        char.WongZ.lwing2.Handle,
        char.WongZ.lwing3.Handle,
    }
    for i = 1, 6 do
        AlignCharacter(wings[i].Handle, targets[i], Vector3.new(3.6, 0.1, 0), Vector3.new(0, -235, -5))
    end

    AlignCharacter(char.swordhalo.Handle, char.WongZ.Core.Handle, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))

    for index, asset in pairs(char.WongZ:GetDescendants()) do
        if asset:IsA("BasePart") then
            asset.Transparency = 1
        end
    end
end
