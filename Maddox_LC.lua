local args = {
	"cmd",
	"-gh 117311153426168,116940095199813,5593848751,5505301521,14763456943,2649326901"
}
game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
wait(2)
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/move script.lua"))()
end)
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/VirtualKeyboard.lua"))()
end)
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Cool-Reanimate.lua"))()
end)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer


local StarterGui = game:GetService("StarterGui")

-- Function to send a single combined notification
local function sendCombinedNotification()
    -- Format the message with a newline (\n) between the two texts
    local combinedText = "Hey! Tsuyiko was here!"
    
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Notification", -- You can change this to whatever title you want
            Text = combinedText,
            Duration = 5,           -- How many seconds it stays on screen
        })
    end)
end

-- Wait a moment for the game UI to load, then send it
task.wait(2)
sendCombinedNotification()


local RunService = game:GetService("RunService")
local Cos, Sin, Clock = math.cos, math.sin, os.clock

if not getgenv().Global then getgenv().Global = {} end

getgenv().Global.AlignPart = function(part0, part1, posOffset, rotOffset)
    if not part0 or not part1 then return end
    
    if part0:IsA("JointInstance") then part0 = part0.Parent end
    if part1:IsA("JointInstance") then part1 = part1.Parent end
    if not part0:IsA("BasePart") or not part1:IsA("BasePart") then return end

    part0:BreakJoints()
    part0.CanCollide = false
    part0.Massless = true
    
    posOffset = posOffset or Vector3.new()
    rotOffset = rotOffset or Vector3.new()
    local cfOffset = CFrame.new(posOffset) * CFrame.Angles(math.rad(rotOffset.X), math.rad(rotOffset.Y), math.rad(rotOffset.Z))
    
    local lastpos = part0.Position
    local rot = math.rad(0.05)
    
    local connection
    connection = RunService.Heartbeat:Connect(function(delta)
        if not part0 or not part0.Parent or not part1 or not part1.Parent then 
            connection:Disconnect()
            return 
        end
        
        part0.RotVelocity = part1.RotVelocity
        
        local newcf = part1.CFrame * cfOffset
        local vel = (newcf.Position - lastpos) / delta
        
        if vel.Magnitude < 0.1 then
            part0.Velocity = Vector3.new(0.1, 25.1, 0.1)
        else
            part0.Velocity = vel * Vector3.new(8, 0, 8) + Vector3.new(0.1, 25.1, 0.1)
        end
        
        rot = -rot
        newcf *= CFrame.Angles(0, 0, rot)
        
        lastpos = newcf.Position
        part0.CFrame = newcf
    end)
end


if game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck") then
	error("Script Running")
end
local getsynasset = getsynasset or getcustomasset or function() warn("no getcustomasset/getsynasset") end
local Events = Global.TableOfEvents

local LoadLibrary = game:GetObjects("rbxassetid://133372069228006")[1]

--Fixed
--LC By LuaQuack, Edit By MrMaddox32
--THIS SCRIPT IS NOT FOR LEAK
--No Trades
--Not Rare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    aa
--Discord: MrMaddox32#5426                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  skid
--fAaqREDijrhuYRGkhgrv
--Shield Function By HoneyDevx
--Shield Edit By MrMaddox32
--Don't Leak pls is not easy to make edits
--don't trade
--don't save in inventory
--bean LC is shit.

--updates:
--removed antikick key because is shit
--removed killall key
--removed shutdown key because missclick
--added Skid taunt
--added fly speed with walkspeed speed
--added new tp effect
--added old MLC mode
--this is ass
--nothing more lol
------------------

local script = game:GetObjects("rbxassetid://133372069228006")[1]

print("MrMaddox32 is not english")
local stopeverything = false
local MAINRUINCOLOR = Color3.fromRGB(0,0,0) -- Custom Color
local CurrentColor = Color3.fromRGB(0,0,0) -- Don't Change This
VT=Vector3.new
CF=CFrame.new
Animation_Speed=3
SIN=math.sin
ANGLES=CFrame.Angles
angles=CFrame.Angles
RAD=math.rad
COS=math.cos
MRANDOM=math.random
Cos=math.cos
Sin=math.sin
local inf = "inf"
local change = 1
local CHATFUNCTEXT = "Not USC | Maddox LC By MrMaddox32" -- THE VERSION LOL
print(CHATFUNCTEXT)
game:GetService("RunService").RenderStepped:Wait()

local function randomstring()
	local length = math.random(10,20)
	local array = {}
	for i = 1,length do
		array[i] = string.char(math.random(32,126))
	end
	return table.concat(array)
end
local HipVal = 3
local lplr = game:GetService("Players").LocalPlayer
local sine = 0
local walksine = 10
local walkc = 1
local sine2 = -10
local c2 = 2 / Animation_Speed
local LOOPx = 0
local USERNAME = lplr.Name
local creator = {1308783007,1710676584,1442214824,1615916525,1442218084,1673231425,1310685079,1087181414,984151503,1442167487,1587587028,1441994738,1129585258,1129586211,275036820,1087264812,1087241085,1318469264,1622394251,663322373,1664828681,930999813,1442217078,1442208195,1340979865,1444403544,1664860157,1442285617,1442213697,1442218738,1442229346,1442213021,1124518548,1129587486,873439757}
local peoplez = {1527159577,1588949918,115542329,1039485759,5692671904,4849301958,507004875,1532973409,561307703,1818239823,556191187,1840583733,905597056,263874560,30212718,16540295,236988943,503184974,121439200,321272852,342306771,285969486,1731267347,971145259,1850668236,117871633,1550034461,55630148,111290520,1505962447,335228723,825398259,1191576743,87867914,112192467,732341111,115130006}
local iscreator = false

local Player = game:GetService("Players"):FindFirstChild(USERNAME)
function swait(num)
if num==0 or num==nil then
game:service'RunService'.Stepped:wait(0)
else
for i=0,num do
game:service'RunService'.Stepped:wait(0)
end
end
end
 

local AnimSync = Instance.new("NumberValue")
AnimSync.Name = "AnimSync"
AnimSync.Value = 0

local taunt = Instance.new("StringValue")
taunt.Value = "None"

local Shield = Instance.new("BoolValue")
local songid = Instance.new("StringValue")
songid.Value = "rbxassetid://140695383804339"
local ballsize = Instance.new("NumberValue")
ballsize.Value = 25
local ballmaterial = Instance.new("StringValue")
ballmaterial.Value = "Neon"
local attack = false
local cannecksnap = true


local walkspeed = 50
local TauntRemote = Instance.new("BindableEvent")

local songvolume = Instance.new("NumberValue")
songvolume.Name = "SongVolume"
songvolume.Value = 10
local songpitch=Instance.new("NumberValue")
songpitch.Name = "SongPitch"
songpitch.Value = 1
local eeevol=songvolume.Value
if true then
	eeevol=songvolume.Value/2
end
local eeepitch  = songpitch.Value
local ISFLYING = false
songvolume:GetPropertyChangedSignal("Value"):Connect(function()
if stopeverything then wait(math.huge) end
	eeevol=songvolume.Value/2
end)
songpitch:GetPropertyChangedSignal("Value"):Connect(function()
if stopeverything then wait(math.huge) end
	eeepitch=songpitch.Value
end)
local antivoid = nil
local savedchar = script.dumi
savedchar.Parent = workspace
local Character = game.Players.LocalPlayer.Character
local eeeblock = Instance.new("Part")
local Humanoid = Character.Humanoid

local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Head = Character.Head
local Torso = Character.Torso
local RootPart = Character.HumanoidRootPart
local RootJoint = RootPart.RootJoint
local Neck = Torso["Neck"]
local RightShoulder = Torso["Right Shoulder"]
local LeftShoulder = Torso["Left Shoulder"]
local RightHip = Torso["Right Hip"]
local LeftHip = Torso["Left Hip"]
--
local hum = Character.Humanoid
local root = Character.HumanoidRootPart
local rootj = RootPart.RootJoint
local RW = Torso["Right Shoulder"]
local LW = Torso["Left Shoulder"]
local RH = Torso["Right Hip"]
local LH = Torso["Left Hip"]
--
local outerm = savedchar.Visualizer.Mesh
outerm.Parent = Character
local outerm2 = savedchar.Visualizer2.Mesh
outerm2.Parent = Character
local Effects = Instance.new("Folder",Character)
local BallFolder = Instance.new("Folder")
BallFolder.Parent = workspace.Terrain
BallFolder.Name = randomstring()
local HipValLock = false
local Parents = {"Workspace","SoundService","Chat","MarketplaceService","Players","StarterPlayer","LocalizationService","JointsService","FriendService","InsertService","Lighting","Teams","ReplicatedStorage","TestService","ProximityPromptService"}

TauntRemote.Event:connect(function(one, two)
taunt.Value = one
songid.Value = "rbxassetid://"..two
end)

local GUN = savedchar.MegaGunnModel
local GunJoint = GUN.Joint.Weld
local Hole = GUN.Hole
local Holetwo = GUN.Hole2
GUN.Parent = Character
GUN.Joint.Weld.Part0 = Character["Right Arm"]
local Hat = game.Players.LocalPlayer.Character:FindFirstChild('Accessory (VoidRPG)')
if Hat then
Global.AlignPart(Hat.Handle,GUN.Hole,Vector3.new(4.03, -0.3, -0.01),Vector3.new(0, 180 ,0))
end
local Hat = game.Players.LocalPlayer.Character:FindFirstChild('Accessory (VoidAlligatorJaw)')
if Hat then
Global.AlignPart(Hat.Handle,GUN.Hole2,Vector3.new(4.5, -0.12, -0.01),Vector3.new(0, 180 ,0))
end

Character.Animate:Destroy()
Character.Humanoid.Animator:Destroy()
local GUN2 = savedchar.gun
GUN2.Parent = Character

-- ==== Player-Visible Bullet (Sniper accessory trick, Uhhhhhh-LC style) ====
local BulletAccessory = Character:FindFirstChild("PartAccessory")
if not BulletAccessory then
	for _, acc in pairs(Character:GetChildren()) do
		if acc:IsA("Accessory") and (acc.Name:lower():find("bullet") or acc.Name:lower():find("tracer") or acc.Name:lower():find("part")) then
			BulletAccessory = acc
			break
		end
	end
end
local VisibleBullet = nil
if BulletAccessory and BulletAccessory:IsA("Accessory") and BulletAccessory.Handle then
	VisibleBullet = BulletAccessory.Handle
	for _, joint in pairs(Character:GetDescendants()) do
		if (joint:IsA("Weld") or joint:IsA("Motor6D") or joint:IsA("WeldConstraint") or joint:IsA("ManualWeld")) and (joint.Part0 == VisibleBullet or joint.Part1 == VisibleBullet) then
			joint:Destroy()
		end
	end
	VisibleBullet.Anchored = true
	VisibleBullet.CanCollide = false
	VisibleBullet.Massless = true
	VisibleBullet.CFrame = RootPart.CFrame * CFrame.new(0, -200, 0)
	print("VisibleBullet ready: "..BulletAccessory.Name)
else
	print("VisibleBullet: no accessory found - equip 'PartAccessory' to show your bullet to other players")
end
local bulletstate = {Vector3.zero, Vector3.zero, 0}
local function SetBulletState(hole, target)
	local dist = (target - hole).Magnitude
	bulletstate[1] = hole
	if dist > 256 then
		bulletstate[2] = hole + (target - hole).Unit * 256
	else
		bulletstate[2] = target
	end
	bulletstate[3] = os.clock()
end
local function HideVisibleBullet()
	if VisibleBullet then
		pcall(function()
			VisibleBullet.CFrame = RootPart.CFrame * CFrame.new(0, -200, 0)
		end)
	end
end
Humanoid.Died:Connect(function()
	pcall(function()
		if VisibleBullet then
			bulletstate[3] = 0
			VisibleBullet.Anchored = true
			VisibleBullet.CFrame = CFrame.new(0, -500, 0)
		end
	end)
end)


local alreadyfixing = false
local shieldblock = Instance.new("Part")
shieldblock.Color = CurrentColor
shieldblock.Name = "Garcello "..randomstring()
shieldblock.CanCollide = false
shieldblock.Anchored = true
shieldblock.Transparency = 0
shieldblock.CFrame = Torso.CFrame
shieldblock.Parent = nil
shieldblock.Shape = "Ball"
shieldblock.Size = Vector3.new(25+1*math.sin(sine/25),25+1*math.sin(sine/25),25+1*math.sin(sine/25))
shieldblock.Material = "ForceField"
local eeeblock = Instance.new("Part")
eeeblock.Name = randomstring()
eeeblock.CanCollide = false
eeeblock.Anchored = true
eeeblock.Transparency = 1
eeeblock.CFrame = Torso.CFrame
eeeblock.Parent = workspace
eeeblock.Shape = "Ball"
eeeblock.Size = Vector3.new(12,12,12)
local eee = Instance.new("Sound",eeeblock)
eee.Volume = eeevol
eee.Pitch = eeepitch
eee.SoundId = songid.Value
eee:Play()
eee.Name = randomstring()
eee.Looped = true
eee.TimePosition = 0
eee.DescendantAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
	if v:IsA("DistortionSoundEffect") then 
		return 
	end
	if v:IsA("SoundEffect") then
		v.Enabled = false
		v:GetPropertyChangedSignal("Enabled"):Connect(function()
if stopeverything then wait(math.huge) end
			if v.Enabled ~= false then
				v.Enabled = false
			end
		end)
	end
	game:GetService("Debris"):AddItem(v,.01)
end)
songid:GetPropertyChangedSignal("Value"):Connect(function()
if stopeverything then wait(math.huge) end
	eee.SoundId = songid.Value
	eee.TimePosition = 0
end)
local FT,FRA,FLA,FRL,FLL = Instance.new("SpecialMesh"),Instance.new("SpecialMesh"),Instance.new("SpecialMesh"),Instance.new("SpecialMesh"),Instance.new("SpecialMesh")
FT.MeshId,FT.Scale = "rbxasset://fonts/torso.mesh",Vector3.new(1,1,1)
FRA.MeshId,FRA.Scale = "rbxasset://fonts/rightarm.mesh",Vector3.new(1,1,1)
FLA.MeshId,FLA.Scale = "rbxasset://fonts/leftarm.mesh",Vector3.new(1,1,1)
FRL.MeshId,FRL.Scale = "rbxasset://fonts/rightleg.mesh",Vector3.new(1,1,1)
FLL.MeshId,FLL.Scale = "rbxasset://fonts/leftleg.mesh",Vector3.new(1,1,1)
function chatfunc(textt,glitchy)
	local text = string.gsub(string.gsub(textt,"â€‹",""),"%c","")
	if string.lower(text) == "/e g/r" then
	
		return
	end
	if string.sub(text,1,3) == "/e " or string.sub(text,1,3) == "/w " or string.sub(text,1,3) == "/c " then
		return
	end
	local chat = coroutine.wrap(function()
		local oldthing = eeeblock:FindFirstChild("TalkingBillBoard")
		if oldthing then
			oldthing:Destroy()
		end
		local sayingstuff = Instance.new("BillboardGui",eeeblock)
		sayingstuff.Size = UDim2.new(0,9999,2,0)
		sayingstuff.StudsOffset = Vector3.new(0,5,0)
		sayingstuff.Adornee = eeeblock
		sayingstuff.Name = "TalkingBillBoard"
		local sayingstuff2 = Instance.new("TextLabel",sayingstuff)
		sayingstuff2.BackgroundTransparency = 1
		sayingstuff2.BorderSizePixel = 0
		sayingstuff2.Text = ""
		sayingstuff2.Font = "Arcade"
		sayingstuff2.TextScaled = true
		sayingstuff2.TextStrokeTransparency = 0
		coroutine.resume(coroutine.create(function()
			while not stopeverything and sayingstuff2:IsDescendantOf(game) do
				local hBRUH,sBRUH,vBRUH = Color3.toHSV(GUN.NeonParts.Color)
				sayingstuff2.TextColor3 = Color3.fromHSV(hBRUH,sBRUH,vBRUH/2)
				swait()
			end
		end))
		sayingstuff2.TextStrokeColor3 = MAINRUINCOLOR
		sayingstuff2.Size = UDim2.new(1,0,1,0)
		local sayingstuff3 = Instance.new("TextLabel",sayingstuff)
		sayingstuff3.BackgroundTransparency = 1
		sayingstuff3.BorderSizePixel = 0
		sayingstuff3.Text = ""
		sayingstuff3.Font = "Arcade"
		sayingstuff3.TextScaled = true
		sayingstuff3.TextStrokeTransparency = 0
		coroutine.resume(coroutine.create(function()
			while not stopeverything and sayingstuff3:IsDescendantOf(game) do
				sayingstuff3.TextColor3 = GUN.NeonParts.Color
				swait()
			end
		end))
		sayingstuff3.TextStrokeColor3 = MAINRUINCOLOR
		sayingstuff3.Size = UDim2.new(1,0,1,0)
		coroutine.resume(coroutine.create(function()
			while not stopeverything and sayingstuff ~= nil do
				swait()
				if glitchy then
					local fonts = {"Antique","Arcade","Arial","ArialBold","Bodoni","Cartoon","Code","Fantasy","Garamond","Gotham","GothamBlack","GothamBold","GothamSemibold","Highway","SciFi","SourceSans","SourceSansBold","SourceSansItalic","SourceSansLight","SourceSansSemibold"}
					local randomfont = fonts[math.random(1,#fonts)]
					sayingstuff2.Font = randomfont
					sayingstuff3.Font = randomfont
				end
				sayingstuff2.Position = UDim2.new(0,math.random(-3,3),0,math.random(-3,3)) 
				sayingstuff3.Position = UDim2.new(0,math.random(-3,3),0,math.random(-3,3)) 
				sayingstuff3.Rotation = math.random(-1,1)	
				sayingstuff2.Rotation = math.random(-1,1)
			end
		end))
		for i = 1,string.len(text) do
			swait(2)
			sayingstuff2.Text = string.sub(text,1,i)
			sayingstuff3.Text = string.sub(text,1,i)
		end
		swait(120)
		for i = 1,50 do
			swait()
			sayingstuff2.TextStrokeTransparency = i/50
			sayingstuff2.TextTransparency = sayingstuff2.TextStrokeTransparency
			sayingstuff3.TextStrokeTransparency = sayingstuff2.TextStrokeTransparency
			sayingstuff3.TextTransparency = sayingstuff2.TextStrokeTransparency
		end
		sayingstuff:Destroy()
	end)
	chat()
end
local ROOTC0 = CFrame.new() * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local NECKC0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
--
local RootCF = CFrame.new() * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local necko = CFrame.new(0,1,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
--
local RIGHTSHOULDERC0 = CFrame.new(-.5,0,0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
local LEFTSHOULDERC0 = CFrame.new(.5,0,0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))
local BG = nil
local BV = nil
local soundfixing = false
local function shieldfixer()
	pcall(function()
		shieldblock:Destroy()
	end)
	local shieldblock = Instance.new("Part")
	shieldblock.Color = CurrentColor
	shieldblock.Name = "Garcello "..randomstring()
	shieldblock.CanCollide = false
	shieldblock.Anchored = true
	shieldblock.Transparency = 0
	shieldblock.CFrame = Torso.CFrame
	shieldblock.Parent = workspace
	shieldblock.Shape = "Ball"
	shieldblock.Size = Vector3.new(25+1*math.sin(sine/25),25+1*math.sin(sine/25),25+1*math.sin(sine/25))
	shieldblock.Material = "ForceField"
	shieldblock:ClearAllChildren()
end
local function soundfixer()
	soundfixing = true
	pcall(function()
		eeeblock:Destroy()
	end)
	pcall(function()
		eee:Destroy()
	end)
	eeeblock = Instance.new("Part")
	eeeblock.Name = randomstring()
	eeeblock.CanCollide = false
	eeeblock.Anchored = true
	eeeblock.Transparency = 1
	if not alreadyfixing then
		eeeblock.CFrame = Torso.CFrame
	end
	eeeblock.Parent = workspace
	eeeblock.Shape = "Ball"
	eeeblock.Size = Vector3.new(12,12,12)
	eee = Instance.new("Sound",eeeblock)
	eee.Volume = eeevol
	eee.Pitch = eeepitch
	eee.SoundId = songid.Value
	eee:Play()
	eee.Name = randomstring()
	eee.Looped = true
	eee.TimePosition = 0
	eee.DescendantAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
		if v:IsA("DistortionSoundEffect") then 
			return 
		end
		if v:IsA("SoundEffect") then
			v.Enabled = false
			v:GetPropertyChangedSignal("Enabled"):Connect(function()
if stopeverything then wait(math.huge) end
				if v.Enabled ~= false then
					v.Enabled = false
				end
			end)
		end
		game:GetService("Debris"):AddItem(v,.01)
	end)
	soundfixing = false
end
function KKAKAKKAKAAJFNBHREJIKDJFDJFNBHUEIJFHBJEJDHFJENBFHUEJDBFHUEJDFBHUDEJDFHDEJNDBFHUDEJHDFUEJHF()
	mdmg(Head.Position,5000)
end
if lplr.Name == USERNAME then
	local moveval = Instance.new("CFrameValue")
	moveval.Value = RootPart.CFrame
	coroutine.resume(coroutine.create(function()
		while not stopeverything do
			game:GetService("RunService").RenderStepped:Wait()
			local lookvec = workspace.CurrentCamera.CFrame.LookVector
			moveval.Value = RootPart.CFrame
			moveval.Value = CFrame.new(moveval.Value.p,Vector3.new(lookvec.X*9999,lookvec.Y,lookvec.Z*9999))
		end
	end))
	local WDown,ADown,SDown,DDown,SpaceDown = false,false,false,false,false
	game:GetService("UserInputService").InputBegan:Connect(function(k,processed)
		if stopeverything then
			wait(9e9)
		end
		if not processed then
			local k = k.KeyCode
			if k == Enum.KeyCode.W then
				WDown = true
			end
			if k == Enum.KeyCode.A then
				ADown = true
			end
			if k == Enum.KeyCode.S then
				SDown = true
			end
			if k == Enum.KeyCode.D then
				DDown = true
			end
		end
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(k)
		if stopeverything then
			wait(9e9)
		end
		local k = k.KeyCode
		if k == Enum.KeyCode.W then
			WDown = false
		end
		if k == Enum.KeyCode.A then
			ADown = false
		end
		if k == Enum.KeyCode.S then
			SDown = false
		end
		if k == Enum.KeyCode.D then
			DDown = false
		end
	end)
	local function MoveClone(X,Y,Z)
		if stopeverything then
			wait(9e9)
		end
		moveval.Value = moveval.Value * CFrame.new(-X,Y,-Z)
		Humanoid.WalkToPoint = moveval.Value.p
	end

	coroutine.resume(coroutine.create(function()
		while not stopeverything do
			game:GetService("RunService").RenderStepped:Wait()
			if WDown then
				MoveClone(0,0,1e4)
			end
			if ADown then
				MoveClone(1e4,0,0)
			end
			if SDown then
				MoveClone(0,0,-1e4)
			end
			if DDown then
				MoveClone(-1e4,0,0)
			end
			if not WDown and not ADown and not SDown and not DDown then
				Humanoid.WalkToPoint = RootPart.Position
			end
		end
	end))
end

function fly()

function weld(p0,p1,c0,c1,par)
	local w = Instance.new("Weld",p0 or par)
	w.Part0 = p0
	w.Part1 = p1
	w.C0 = c0 or CFrame.new()
	w.C1 = c1 or CFrame.new()
	return w
end
local motors = {}
function motor(p0,p1,c0,c1,des,vel,par)
	local w = Instance.new("Motor6D",p0 or par)
	w.Part0 = p0
	w.Part1 = p1
	w.C0 = c0 or CFrame.new()
	w.C1 = c1 or CFrame.new()
	w.MaxVelocity = tonumber(vel) or .05
	w.DesiredAngle = tonumber(des) or 0
	return w
end
function lerp(a,b,c)
	return a+(b-a)*c
end
function clerp(c1,c2,alBRUH)
	local al = .05
	local com1 = {c1.X,c1.Y,c1.Z,c1:toEulerAnglesXYZ()}
	local com2 = {c2.X,c2.Y,c2.Z,c2:toEulerAnglesXYZ()}
	for i,v in pairs(com1) do
		com1[i] = lerp(v,com2[i],al)
	end
	return CFrame.new(com1[1],com1[2],com1[3]) * CFrame.Angles(select(4,unpack(com1)))
end
function ccomplerp(c1,c2,alBRUH)
	local al = .05
	local com1 = {c1:components()}
	local com2 = {c2:components()}
	for i,v in pairs(com1) do
		com1[i] = lerp(v,com2[i],al)
	end
	return CFrame.new(unpack(com1))
end
local max = 0
local min = 0
function tickwave(time,length,offset)
	return .2*math.sin(sine/20)
end
function invcol(c)
	c = c.Color
	return BrickColor.new(MAINRUINCOLOR)
end
local oc = oc or function(...) return ... end
local mod = Instance.new("Folder",Character)
mod.Name = "Wings"
mod.ChildAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
	if v.Name == "Part" and not v:FindFirstChild("WingTrail") then
		swait()
		local top = Instance.new("Attachment")
		top.Name = "Top"
		top.Position = Vector3.new(0,v.Size.Y/2,0)
		top.Parent = v
		local bottom = Instance.new("Attachment")
		bottom.Name = "Bottom"
		bottom.Position = Vector3.new(0,-v.Size.Y/2,0)
		bottom.Parent = v
		local vtrail = Instance.new("Trail")
		vtrail.Name = "WingTrail"
		vtrail.Attachment0 = top
		vtrail.Attachment1 = bottom
		vtrail.Lifetime = .5
		vtrail.MinLength = 0
		vtrail.LightEmission = .5
		vtrail.LightInfluence = 5
		vtrail.Texture = ""
		vtrail.Color = ColorSequence.new(CurrentColor)
		vtrail.Transparency = NumberSequence.new(0,1)
		vtrail.Parent = v
		coroutine.resume(coroutine.create(function()
			while true do
				swait()
				vtrail.Color = ColorSequence.new(CurrentColor)
			end
		end))
	end
end)
local char = Character
local tor = Torso
local hum = Humanoid
local special = {
}
local topcolor = invcol(Character.Torso.BrickColor)
local feacolor = topcolor
local ptrans = 0
local pref = 0
local fire = false
local fmcol = Color3.new()
local fscol = Color3.new()
local part = Instance.new("Part")
part.FormFactor = "Custom"
part.Size = Vector3.new(.2,.2,.2)
part.TopSurface,part.BottomSurface = 0,0
part.CanCollide = false
part.BrickColor = topcolor
part.Transparency = 1
part.Reflectance = pref
part.Material = Enum.Material.Neon
local ef = Instance.new("Fire",fire and part or nil)
ef.Heat = 0
ef.Size = .15
ef.Color = fmcol or Color3.new()
ef.SecondaryColor = fscol or Color3.new()
part:BreakJoints()
function newpart()
	local clone = part:Clone()
	clone.Parent = mod
	clone:BreakJoints()
	return clone
end
local feath = newpart()
feath.BrickColor = feacolor
feath.Transparency = 0
Instance.new("SpecialMesh",feath).MeshType = "Brick"
function newfeather()
	local clone = feath:Clone()
	clone.Transparency = 0
	clone.Parent = mod
	clone:BreakJoints()
	return clone
end
local r1 = newpart()
r1.Size = Vector3.new(.3,1.5,.3)*1.2
local rm1 = motor(tor,r1,CFrame.new(.35,.6,.4) * CFrame.Angles(0,0,math.rad(-60)) * CFrame.Angles(math.rad(30),math.rad(-25),0),CFrame.new(0,-.8,0),.1)
local r2 = newpart()
r2.Size = Vector3.new(.4,1.5,.4)*1.2
local rm2 = motor(r1,r2,CFrame.new(0,.75,0) * CFrame.Angles(0,0,math.rad(50)) * CFrame.Angles(math.rad(-30),math.rad(15),0),CFrame.new(0,-.9,0),.1)
local r3 = newpart()
r3.Size = Vector3.new(.3,2,.3)*1.2
local rm3 = motor(r2,r3,CFrame.new(.1,.9,0) * CFrame.Angles(0,0,math.rad(-140)) * CFrame.Angles(math.rad(-3),0,0),CFrame.new(0,-1.1,0),.1)
local r4 = newpart()
r4.Size = Vector3.new(.25,1.2,.25)*1.2
local rm4 = motor(r3,r4,CFrame.new(0,1.1,0) * CFrame.Angles(0,0,math.rad(-10)) * CFrame.Angles(math.rad(-3),0,0),CFrame.new(0,-.6,0),.1)
local feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,3,.3)
weld(r4,feather,CFrame.new(-.1,-.3,0),CFrame.new(0,-1.5,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,2.3,.3)
weld(r4,feather,CFrame.new(.1,-.1,0) * CFrame.Angles(0,math.random()*.1,0),CFrame.new(0,-1.1,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.35,2.2,.25)
weld(r4,feather,CFrame.new(.1,-.3,0) * CFrame.Angles(0,math.random()*.1,math.rad(-10)),CFrame.new(0,-1.1,0))
local rf3 = {}
for i = 0,7 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2,.35)
	table.insert(rf3,motor(r3,feather,CFrame.new(.05,1-i*.285,0) * CFrame.Angles(0,math.random()*.1,math.rad(-25-i*2)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local rf2 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2-i*.08,.3)
	table.insert(rf2,motor(r2,feather,CFrame.new(.05,.75-i*.26,0) * CFrame.Angles(0,math.random()*.1,math.rad(-75-i*4)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local rf1 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.37,1.65-i*.06,.25)
	table.insert(rf1,motor(r1,feather,CFrame.new(.05,.63-i*.21,0) * CFrame.Angles(0,math.random()*.05,math.rad(-75)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local l1 = newpart()
l1.Size = Vector3.new(.3,1.5,.3)*1.2
local lm1 = motor(tor,l1,CFrame.new(-.35,.6,.4) * CFrame.Angles(0,0,math.rad(60)) * CFrame.Angles(math.rad(30),math.rad(25),0) * CFrame.Angles(0,-math.pi,0),CFrame.new(0,-.8,0) ,.1)
local l2 = newpart()
l2.Size = Vector3.new(.4,1.5,.4)*1.2
local lm2 = motor(l1,l2,CFrame.new(0,.75,0) * CFrame.Angles(0,0,math.rad(50)) * CFrame.Angles(math.rad(30),math.rad(-15),0),CFrame.new(0,-.9,0),.1)
local l3 = newpart()
l3.Size = Vector3.new(.3,2,.3)*1.2
local lm3 = motor(l2,l3,CFrame.new(.1,.9,0) * CFrame.Angles(0,0,math.rad(-140)) * CFrame.Angles(math.rad(3),0,0),CFrame.new(0,-1.1,0),.1)
local l4 = newpart()
l4.Size = Vector3.new(.25,1.2,.25)*1.2
local lm4 = motor(l3,l4,CFrame.new(0,1.1,0) * CFrame.Angles(0,0,math.rad(-10)) * CFrame.Angles(math.rad(3),0,0),CFrame.new(0,-.6,0),.1)
local feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,3,.3)
weld(l4,feather,CFrame.new(-.1,-.3,0),CFrame.new(0,-1.5,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,2.3,.3)
weld(l4,feather,CFrame.new(.1,-.1,0) * CFrame.Angles(0,math.random()*.1,0),CFrame.new(0,-1.1,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.35,2.2,.25)
weld(l4,feather,CFrame.new(.1,-.3,0) * CFrame.Angles(0,math.random()*.1,math.rad(-10)),CFrame.new(0,-1.1,0))
local lf3 = {}
for i = 0,7 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2,.35)
	table.insert(lf3,motor(l3,feather,CFrame.new(.05,1-i*.285,0) * CFrame.Angles(0,math.random()*.1,math.rad(-25-i*2)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local lf2 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2-i*.08,.3)
	table.insert(lf2,motor(l2,feather,CFrame.new(.05,.75-i*.26,0) * CFrame.Angles(0,math.random()*.1,math.rad(-75-i*4)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local lf1 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.37,1.65-i*.06,.25)
	table.insert(lf1,motor(l1,feather,CFrame.new(.05,.63-i*.21,0) * CFrame.Angles(0,math.random()*.05,math.rad(-75)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local rwing = {rm1,rm2,rm3,rm4}
local lwing = {lm1,lm2,lm3,lm4}
local oc0 = {}
for i,v in pairs(rwing) do
	oc0[v] = v.C0
end
for i,v in pairs(lwing) do
	oc0[v] = v.C0
end
function gotResized()
	if lastsize then
		if tor.Size == lastsize then return end
		local scaleVec = tor.Size/lastsize
		for i,v in pairs(oc0) do
			oc0[i] = v-v.p+scaleVec*v.p
		end
		lastsize = tor.Size
	end
	lastsize = tor.Size
end
tor:GetPropertyChangedSignal("Size"):Connect(function()
if stopeverything then wait(math.huge) end
	gotResized()
end)
gotResized()
local idle = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local outlow = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local outhigh = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local veryhigh = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local flap1 = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local divebomb = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
function setwings(tab,time)
	time = time or 10
	for i = 1,4 do
		rwing[i].DesiredAngle = tab[i]
		lwing[i].DesiredAngle = tab[i]
		rwing[i].MaxVelocity = math.abs(tab[i]-rwing[i].CurrentAngle)/time
		lwing[i].MaxVelocity = math.abs(tab[i]-lwing[i].CurrentAngle)/time
		local rcf = oc0[rwing[i]] * (tab[12+i] or CFrame.new())
		local lcf = oc0[lwing[i]] * (tab[12+i] or CFrame.new())
	end
	for i,v in pairs(rf1) do
		v.DesiredAngle = tab[9]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(lf1) do
		v.DesiredAngle = tab[9]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(rf2) do
		v.DesiredAngle = tab[10]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(lf2) do
		v.DesiredAngle = tab[10]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(rf3) do
		v.DesiredAngle = tab[11]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(lf3) do
		v.DesiredAngle = tab[11]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
end
setwings(outhigh,1)
flying = false
moving = false
for i,v in pairs(tor:GetChildren()) do
	if v.ClassName:lower():match("body") then
		v:Destroy()
	end
end
local ctor = tor:Clone()
ctor:ClearAllChildren()
ctor.Name = "cTorso"
ctor.Transparency = 1
ctor.CanCollide = false
ctor.FormFactor = "Custom"
ctor.Size = Vector3.new(.2,.2,.2)
ctor.Parent = mod
weld(tor,ctor)
local bg = Instance.new("BodyGyro",ctor)
bg.maxTorque = Vector3.new()
bg.P = 15000
bg.D = 1000
local bv = Instance.new("BodyVelocity",ctor)
bv.maxForce = Vector3.new()
bv.P = 15000
vel = Vector3.new()
cf = CFrame.new()
flspd = 0
keysdown = {}
keypressed = {}
ktime = {}
descendtimer = 0
jumptime = tick()
hum.Jumping:connect(function()
if stopeverything then wait(math.huge) end
	jumptime = tick()
end)
cam = workspace.CurrentCamera
function mid(a,b,c)
	return math.max(a,math.min(b,c or -a))
end
function bn(a)
	return a and 1 or 0
end
function gm(tar)
	local m = 0
	for i,v in pairs(tar:GetChildren()) do
		if v:IsA("BasePart") then
			m = m + v:GetMass()
		end
		m = m + gm(v)
	end
	return m
end
reqrotx = 0
local grav = 196.2
local con
alreadyfixing = false
while not stopeverything and not alreadyfixing do
local obvel = tor.CFrame:vectorToObjectSpace(tor.Velocity)
local sspd,uspd,fspd = obvel.X,obvel.Y,obvel.Z
flying = true
if flying then
	local lfldir = fldir
	fldir = cam.CoordinateFrame:vectorToWorldSpace(Vector3.new(bn(keysdown.d)-bn(keysdown.a),0,bn(keysdown.s)-bn(keysdown.w))).unit
	local lmoving = moving
	moving = fldir.Magnitude > .1
	if lmoving and not moving then
		idledir = lfldir*Vector3.new(1,0,1)
		descendtimer = tick()
	end
	local dbomb = fldir.Y < -.6 or (moving and keysdown["1"])
	if moving and keysdown["0"] and lmoving then
		fldir = (Vector3.new(lfldir.X,math.min(fldir.Y,lfldir.Y+.01)-.1,lfldir.Z)+(fldir*Vector3.new(1,0,1))*.05).unit
	end
	local down = tor.CFrame:vectorToWorldSpace(Vector3.new(0,-1,0))
local descending = (not moving and keysdown["q"] and not keysdown[" "])
cf = ccomplerp(cf,CFrame.new(tor.Position,tor.Position+(not moving and idledir or fldir)),keysdown["0"] and .02 or .07)
local gdown = not dbomb and cf.lookVector.Y < -.2 and tor.Velocity.unit.Y < .05
local rotvel = CFrame.new(Vector3.new(),tor.Velocity):toObjectSpace(CFrame.new(Vector3.new(),fldir)).lookVector
bg.cframe = cf * CFrame.Angles(not moving and -.1 or -math.pi/2+.2,moving and mid(-2.5,rotvel.X/1.5) + reqrotx or 0,0)
reqrotx = reqrotx - reqrotx/10
local ani = tickwave(1.5,1)
vel = moving and cf.lookVector*flspd or Vector3.new()
flspd = math.min(120,lerp(flspd,moving and (fldir.Y<0 and flspd+(-fldir.Y)*grav/60 or math.max(50,flspd-fldir.Y*grav/300)) or 60,.4))
setwings(moving and (gdown and outlow or dbomb and divebomb) or (descending and veryhigh or flap1),15)
for i=1,4 do
rwing[i].C0 = clerp(rwing[i].C0,oc0[rwing[i]] * (gdown and CFrame.new() or dbomb and CFrame.Angles(-.5+bn(i==3)*.4+bn(i==4)*.5,.1+bn(i==2)*.5-bn(i==3)*1.1,bn(i==3)*.1) or descending and CFrame.Angles(.3,0,0) or CFrame.Angles((i*.1+1.5)*ani,ani*-.5,1*ani)),descending and .8 or .2)
lwing[i].C0 = clerp(lwing[i].C0,oc0[lwing[i]] * (gdown and CFrame.new() or dbomb and CFrame.Angles(-(-.5+bn(i==3)*.4+bn(i==4)*.5),-(.1+bn(i==2)*.5-bn(i==3)*1.1),bn(i==3)*.1) or descending and CFrame.Angles(-.3,0,0) or CFrame.Angles(-(i*.1+1.5)*ani,ani*.5,1*ani)),descending and .8 or .2)
end
local hit,ray = workspace:FindPartOnRayWithIgnoreList(Ray.new(tor.Position,Vector3.new(0,-3.5+math.min(0,bv.velocity.y)/30,0)),{Character})
else
bg.maxTorque = Vector3.new()
bv.maxForce = Vector3.new()
local ani = tickwave(walking and .8 or 4.5,1)
setwings(idle,10)
local x,y,z = fspd/160,uspd/700,sspd/900
for i=1,4 do
rwing[i].C0 = clerp(rwing[i].C0,oc0[rwing[i]] * CFrame.Angles(ani*.1 + -mid(-.1,x),0 + -mid(-.1,y) + bn(i==2)*.6,ani*.02 + -mid(-.1,z)),.2)
lwing[i].C0 = clerp(lwing[i].C0,oc0[lwing[i]] * CFrame.Angles(ani*-.05 + mid(-.1,x),0 + mid(-.1,y) + -bn(i==2)*.6,ani*.02 + mid(-.1,z)),.2)
end
if keypressed[" "] and not flying and (tick()-jumptime > .05 and (tick()-jumptime < 3 or hum.Jump)) then
vel = Vector3.new(0,50,0)
bv.velocity = vel
idledir = cam.CoordinateFrame.lookVector*Vector3.new(1,0,1)
cf = tor.CFrame * CFrame.Angles(-.01,0,0)
bg.cframe = cf
flystart = tick()
flying = true
end
end
keypressed = {}
swait()
end
end
coroutine.resume(coroutine.create(function()
fly()
end))


local fixinggui = false
local gui = nil
local exitbutton = nil
local restartingscript = false


local Mouse = lplr:GetMouse()
Mouse.Button1Down:Connect(function()
end)
if lplr.Name == USERNAME then
	workspace.CurrentCamera.CameraSubject = Humanoid
	workspace.CurrentCamera.CameraType = "Custom"
	workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
if stopeverything then wait(math.huge) end
		if not alreadyfixing and workspace.CurrentCamera.CameraSubject ~= Humanoid then
			workspace.CurrentCamera.CameraSubject = Humanoid
		end
	end)
	workspace.ChildRemoved:Connect(function(v)
if stopeverything then wait(math.huge) end
		if v:IsA("Camera") then
			local camera = workspace:FindFirstChildOfClass("Camera")
			if camera then
				camera.CameraSubject = Humanoid
				camera.CameraType = "Custom"
				camera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
if stopeverything then wait(math.huge) end
					if not alreadyfixing and camera.CameraSubject ~= Humanoid then
						camera.CameraSubject = Humanoid
					end
				end)
			else
				local newcamerafound = false
				while not stopeverything and not newcamerafound do
					camera = workspace.ChildAdded:Wait()
					if camera:IsA("Camera") then
						newcamerafound = true
						camera.CameraSubject = Humanoid
						camera.CameraType = "Custom"
						camera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
if stopeverything then wait(math.huge) end
							if not alreadyfixing and camera.CameraSubject ~= Humanoid then
								camera.CameraSubject = Humanoid
							end
						end)
					end
				end
			end
		end
	end)
end
spawn(function()


local TS = game:GetService("TweenService")
local PS = game:GetService("PhysicsService")

--[[ArtificialHB = Instance.new("BindableEvent",script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = 1/60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:Connect(function(s,p)
if stopeverything then wait(math.huge) end
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1,math.floor(tf/frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf/frame)
		end
	end
end)]]--

end)
local Anim = "Idle"
local attacktype = 1
local delays = false
local play = true
local Torsovelocity = (RootPart.Velocity * Vector3.new(1,0,1)).Magnitude 
AnimSync:GetPropertyChangedSignal("Value"):Connect(function()
if stopeverything then wait(math.huge) end
	sine = AnimSync.Value
end)

local doe = 0
Humanoid.WalkSpeed = walkspeed
local rc0 = CFrame.new() * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local nc0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local rscp = CFrame.new(-.5,0,0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
local lscp = CFrame.new(.5,0,0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))

function QFCF(cf)
	local mx,my,mz,m00,m01,m02,m10,m11,m12,m20,m21,m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = .5/s
		return (m21 - m12) * recip,(m02 - m20) * recip,(m10 - m01) * recip,s * .5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = .5/s
			return .5 * s,(m10 + m01) * recip,(m20 + m02) * recip,(m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = .5/s
			return (m01 + m10) * recip,.5 * s,(m21 + m12) * recip,(m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = .5/s return (m02 + m20) * recip,(m12 + m21) * recip,.5 * s,(m10 - m01) * recip
		end
	end
end
 
function QTCF(px,py,pz,x,y,z,w)
	local xs,ys,zs = x + x,y + y,z + z
	local wx,wy,wz = w * xs,w * ys,w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px,py,pz,1 - (yy + zz),xy - wz,xz + wy,xy + wz,1 - (xx + zz),yz - wx,xz - wy,yz + wx,1 - (xx + yy))
end
 
function QS(a,b,t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp,finishInterp;
	if cosTheta >= .0001 then
		if (1 - cosTheta) > .0001 then
			local theta = math.acos(cosTheta)
			local invSinTheta = 1/math.sin(theta)
			startInterp = math.sin((1 - t) * theta) * invSinTheta
			finishInterp = math.sin(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > .0001 then
			local theta = math.acos(-cosTheta)
			local invSinTheta = 1/math.sin(theta)
			startInterp = math.sin((t - 1) * theta) * invSinTheta
			finishInterp = math.sin(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp,a[2] * startInterp + b[2] * finishInterp,a[3] * startInterp + b[3] * finishInterp,a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a,b,t)
	local qa = {QFCF(a)}
	local qb = {QFCF(b)}
	local ax,ay,az = a.x,a.y,a.z
	local bx,by,bz = b.x,b.y,b.z
	local _t = 1 - t
	return QTCF(_t * ax + t * bx,_t * ay + t * by,_t * az + t * bz,QS(qa,qb,t))
end

--[[ArtificialHB = Instance.new("BindableEvent",script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

frame = 1/30
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:Connect(function(s,p)
if stopeverything then wait(math.huge) end
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1,math.floor(tf/frame) do
				if not stopeverything then
					script.Heartbeat:Fire()
				end
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf/frame)
		end
	end
end)]]--

function CreateConnection(TYPE,PARENT,PART0,PART1,C0,C1)
if stopeverything then wait(math.huge) end
	local NEWWELD = Instance.new(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end	

function CreateMesh(MESH,PARENT,MESHTYPE,MESHID,TEXTUREID,SCALE,OFFSET)
	local NEWMESH = Instance.new(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" and tonumber(MESHID) ~= nil then
			NEWMESH.MeshId = "rbxassetid://"..MESHID
		elseif MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "rbxassetid://"..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or Vector3.new()
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR,PARENT,MATERIAL,REFLECTANCE,TRANSPARENCY,BRICKCOLOR,NAME,SIZE,ANCHOR)
	local NEWPART = Instance.new("Part")
	NEWPART.Massless = true
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.Color = BRICKCOLOR
	NEWPART.Name = randomstring()
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

function CreatePart2(FORMFACTOR,PARENT,MATERIAL,REFLECTANCE,TRANSPARENCY,BRICKCOLOR,NAME,SIZE,ANCHOR)
	local NEWPART = Instance.new("Part")
	NEWPART.Massless = true
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.Color = CurrentColor
	coroutine.resume(coroutine.create(function()
		while true do
			Swait()
			NEWPART.Color = CurrentColor
		end
	end))
	NEWPART.Name = randomstring()
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local S = Instance.new("Sound")
function CreateSound(ID,PARENT,VOLUME,PITCH,DOESLOOP) -- Fixed
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

local function weldBetween(a,b)
	local weldd = Instance.new("Weld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = b
	return weldd
end
function rayCast(Position,Direction,Range,Ignore)
	return workspace:FindPartOnRay(Ray.new(Position,Direction.unit * (Range or 999.999)),Ignore) 
end 		

function mdmg(centerofeffect,range)
	pcall(function()
		if lplr.Name == USERNAME then
		--	MainFolder.AreaDamageRemote:FireServer(centerofeffect,range)
		end
		for i,v in pairs(workspace:GetDescendants()) do
			if not v:IsDescendantOf(Character) and v:IsA("Humanoid") and v.RootPart and (v.RootPart.Position - centerofeffect).Magnitude <= range + v.RootPart.Size.Magnitude then
				local rootsize = v.RootPart.Size.X
				if rootsize < v.RootPart.Size.Y then
					rootsize  = v.RootPart.Size.Y
				end
				if rootsize < v.RootPart.Size.Z then
					rootsize = v.RootPart.Size.Z
				end
				DamageFling(v.Parent)
				for o = 1,25 do
					local hitm = script.SomeEffectIDK:Clone()
					hitm.Color = CurrentColor
					hitm.Trail.Color = ColorSequence.new(CurrentColor)
					hitm.CFrame = a.CFrame * CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))*CFrame.new(0,1,0)
					hitm.Parent = Effects
					hitm.Velocity = CFrame.new(hitm.Position,a.Position).LookVector*250
					hitm.Anchored = false
					game:GetService("TweenService"):Create(hitm,TweenInfo.new(1.33,Enum.EasingStyle.Linear),{Transparency = 1}):Play()
					coroutine.resume(coroutine.create(function()
						while true do
							Swait()
							hitm.Color = CurrentColor
							hitm.Trail.Color = ColorSequence.new(CurrentColor)
						end
					end))
					coroutine.resume(coroutine.create(function()
						local timepassed = 0
						local bruh = nil
						local function stopbruh()
							if bruh then
							
							end
						end
						bruh = game:GetService("RunService").RenderStepped:Connect(function(frame)
							timepassed = timepassed + frame
							if timepassed >= 1.33 or not hitm:IsDescendantOf(game) then
								
							else
								hitm.Trail.Transparency = NumberSequence.new(timepassed/1.33)
							end
						end)
					end))
					game:GetService("Debris"):AddItem(hitm,1.33)						
				end
			
				if v:IsDescendantOf(game) and v.Parent ~= workspace and v.Parent ~= workspace.Terrain then
				
					local maxparent = v
					repeat if stopeverything then wait(math.huge) end maxparent = maxparent.Parent until maxparent.Parent == workspace or maxparent.Parent == workspace.Terrain
					coroutine.resume(coroutine.create(function()
						local waitthing = tick()
						repeat if stopeverything then wait(math.huge) end
							game:GetService("RunService").RenderStepped:Wait()
						until tick()-waitthing >= 3
					
					end))
					if maxparent == lplr.Character then
						game:GetService("TweenService"):Create(workspace.CurrentCamera,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,1),{CFrame = CFrame.new(workspace.CurrentCamera.Focus.p,Head.Position)}):Play()
					end
					maxparent:Destroy()
				elseif v:IsDescendantOf(game) then
				
				end
			end
		end
	end)
end

function lcv2mg(centerofeffect,range)
	if lplr.Name == USERNAME then
	--	MainFolder.AreaDamageRemote:FireServer(centerofeffect,range)
	end
	pcall(function()
		for i=1,#Parents do
			for i,v in pairs(game:GetService(Parents[i]):GetDescendants()) do
				if not v:IsDescendantOf(Character) and v:IsA("BasePart") and v ~= eeeblock and v ~= shieldblock and (v.Position - centerofeffect).Magnitude <= range + v.Size.Magnitude then
					for g,h in pairs(v:GetDescendants()) do
						if h:IsA("Trail") then
							h.Attachment0 = nil
							h.Attachment1 = nil
						end 
					end
					v.CFrame = CFrame.new(-9999999,50,0)
					v:GetPropertyChangedSignal("CFrame"):Connect(function()
						if v.CFrame ~= CFrame.new(-9999999,50,0) then
							v.CFrame = CFrame.new(-9999999,50,0) 
						end
					end)
				end 
				if not v:IsDescendantOf(Character) and v:IsA("FlagStand") and v ~= eeeblock and v.Name ~= "Base" and (v.Position - centerofeffect).Magnitude <= range + v.Size.Magnitude then
					local w = v.CFrame
					for g,h in pairs(v:GetDescendants()) do
						if h:IsA("Trail") then
							h.Attachment0 = nil
							h.Attachment1 = nil
						end 
					end
					v.CFrame = CFrame.new(-9999999,50,0)
					v:GetPropertyChangedSignal("CFrame"):Connect(function()
						if v.CFrame ~= CFrame.new(-9999999,50,0) then
							v.CFrame = CFrame.new(-9999999,50,0) 
						end
					end)	
				end 
			end
		end
	end)
end

function Effect(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vector3.new(1,1,1))
	local ENDSIZE = (Table.Size2 or Vector3.new())
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or MAINRUINCOLOR)
	local hOK,sOK,vOK = Color3.toHSV(COLOR)
	local RAINBOWPART = false
	if sOK > .1 then
		RAINBOWPART = true
	end
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3,Effects,MATERIAL,0,TRANSPARENCY,MAINRUINCOLOR,"Effect",Vector3.new(1,1,1),true)
		if RAINBOWPART then
			coroutine.resume(coroutine.create(function()
				while not stopeverything and EFFECT:IsDescendantOf(game) do
					EFFECT.Color = GUN.NeonParts.Color
					swait()
				end
			end))
		end
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID,EFFECT,SOUNDVOLUME,SOUNDPITCH,false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"Sphere","","",SIZE,Vector3.new())
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Instance.new("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","20329976","",SIZE,Vector3.new(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","559831844","",Vector3.new(SIZE.X,SIZE.X,.1),Vector3.new())
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662586858","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662585058","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","168892432","",SIZE,Vector3.new())
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","4770583","",SIZE,Vector3.new())
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","9756362","",SIZE,Vector3.new())
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1,TIME+1 do
					swait()
					MSH.Scale = MSH.Scale - (Vector3.new((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1,TIME+1 do
					swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:Destroy()
			else
				repeat if stopeverything then wait(math.huge) end swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:Destroy()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:Destroy()
			else
				repeat if stopeverything then wait(math.huge) end swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:Destroy()
			end
		end
	end))
end

function Lightning(Part0,Part1,Timess,Offset,Color,Timer,sSize,eSize,Trans,Boomer,sBoomer,Trans2)
  local magz = (Part0 - Part1).Magnitude
	local Times = math.floor(math.clamp(magz/10,1,20))
  local curpos = Part0
  local trz = {
    -Offset,
    Offset
  }
  for i = 1,Times do
    local li = Instance.new("Part",Effects)
    li.Name = randomstring()
    li.TopSurface = 0
    li.Material = "Neon"
    li.BottomSurface = 0
    li.Anchored = true
    li.Locked = true
    li.Transparency = 0
    li.Color = Color
    li.formFactor = "Custom"
    li.CanCollide = false
    li.Size = Vector3.new(.1,.1,magz/Times)
    local Offzet = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)])
    local trolpos = CFrame.new(curpos,Part1) * CFrame.new(0,0,magz/Times).p + Offzet
    if Times == i then
      local magz2 = (curpos - Part1).Magnitude
      li.Size = Vector3.new(.1,.1,magz2)
      li.CFrame = CFrame.new(curpos,Part1) * CFrame.new(0,0,-magz2/2)
    else
      li.CFrame = CFrame.new(curpos,trolpos) * CFrame.new(0,0,magz/Times/2)
    end
    curpos = li.CFrame * CFrame.new(0,0,magz/Times/2).p
    li:Destroy()
	Effect({Time = Timer,EffectType = "Box",Size = Vector3.new(sSize,sSize,li.Size.Z),Size2 = Vector3.new(eSize,eSize,li.Size.Z),Transparency = Trans,Transparency2 = Trans2 or 1,CFrame = li.CFrame,MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = li.Color,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = Boomer,Boomerang = 0,SizeBoomerang = sBoomer})
	swait()
  end
end

function FireArc(Part,ToLocation,AmountOfTime,Height,DoesCourontine)
    if DoesCourontine == false then
        local Direction = CFrame.new(Part.Position,ToLocation)
        local Distance = (Part.Position - ToLocation).Magnitude
        for i = 1,AmountOfTime do
            swait()
            Part.CFrame = Direction*CFrame.new(0,(AmountOfTime/200)+((AmountOfTime/Height)-((i*2)/Height)),-Distance/AmountOfTime)
            Direction = Part.CFrame
        end
    elseif DoesCourontine == true then
        coroutine.resume(coroutine.create(function()
            local Direction = CFrame.new(Part.Position,ToLocation)
            local Distance = (Part.Position - ToLocation).Magnitude
            for i = 1,AmountOfTime do
                swait()
                Part.CFrame = Direction*CFrame.new(0,(AmountOfTime/200)+((AmountOfTime/Height)-((i*2)/Height)),-Distance/AmountOfTime)
                Direction = Part.CFrame
            end
        end))
    end
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = Instance.new("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = Instance.new("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = Instance.new("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

function AttackGyro()
chatfunc("Be Gone...",true)
	local GYRO = Instance.new("BodyGyro",RootPart)
	GYRO.D = 25
	GYRO.P = 20000
	GYRO.MaxTorque = Vector3.new(0,4000000,0)
	GYRO.CFrame = CFrame.new(RootPart.Position,Mouse.Hit.p)
	coroutine.resume(coroutine.create(function()
		repeat if stopeverything then wait(math.huge) end
			swait()
			GYRO.CFrame = CFrame.new(RootPart.Position,Mouse.Hit.p)
		until not attack
		GYRO:Destroy()
	end))
end
function CreatePartb(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = Instance.new("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BrickColor.new(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end
function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = Instance.new(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

godcatparts = Instance.new("Model", Character)
local Hue = 0
coroutine.resume(coroutine.create(function()
	while not stopeverything do
		for i = 0,1,(1/60) do
			swait()
			if not alreadyfixing then
				GUN.Base.Color = GUN.NeonParts.Color
				----------------------
				for i,v in pairs(savedchar.NeonParts:GetChildren()) do
					if v.Name == "1" then
						v.Color = MAINRUINCOLOR
					end
					if v.Name == "2" then
						v.Color = GUN.NeonParts.Color
						v.Light.Color = GUN.NeonParts.Color
						v.Light.Range = 2
						v.Light.Shadows = true
					end
				end
				GUN.ReColor.Color = GUN.NeonParts.Color
				----------------------
				if taunt.Value == "aEa" then
					local sesk=math.random(0,255)
					GUN.NeonParts.Color = Color3.new(sesk/255,sesk/355,0)
				elseif taunt.Value == "N4N" then
					GUN.NeonParts.Color = Color3.fromRGB(255,255,255) -- Lol
				elseif taunt.Value == "|" then
					GUN.NeonParts.Color = Color3.fromRGB(math.random(99,149),0,0) -- Lol
				elseif taunt.Value == "Insanity" then
					local z = math.random(0,255)
					GUN.NeonParts.Color = Color3.fromRGB(z,z,z)
				elseif taunt.Value == "uncolored" or taunt.Value == "None2" or taunt.Value == "mlc" then
					GUN.NeonParts.Color = Color3.new(math.min(1,eee.PlaybackLoudness/500),math.min(1,eee.PlaybackLoudness/500),math.min(1,eee.PlaybackLoudness/500))
				elseif taunt.Value == "Err0r" then
					GUN.NeonParts.Color = Color3.fromRGB(225,225,225,math.clamp(eee.PlaybackLoudness-0,0,0),0,0,0)
				elseif taunt.Value == "Err0r2" then
					GUN.NeonParts.Color = Color3.fromRGB(math.clamp(eee.PlaybackLoudness-191,0,255),math.clamp(eee.PlaybackLoudness-191,0,255),0)
				elseif taunt.Value == "FAST BOIII" or taunt.Value == "idkw" then
					GUN.NeonParts.Color = Color3.fromRGB(0,0,math.clamp(eee.PlaybackLoudness-191,0,255))
				elseif taunt.Value == "N0X" then
					GUN.NeonParts.Color = Color3.fromRGB(255,255,255)
				elseif taunt.Value == "idk" then
					GUN.NeonParts.Color = Color3.fromRGB(0,math.clamp(eee.PlaybackLoudness-191,0,255),math.clamp(eee.PlaybackLoudness-191,0,255))
				elseif taunt.Value == "error?" then
					GUN.NeonParts.Color = Color3.fromRGB(0,math.random(0,255),0)
				elseif taunt.Value == "Glitch" then
					GUN.NeonParts.Color = Color3.fromHSV(i,1,math.clamp((eee.PlaybackLoudness/200)-.5,0,1))
				elseif taunt.Value == "unholy" or taunt.Value == "Xâ”X" then
					GUN.NeonParts.Color = Color3.fromRGB(0+178*eee.PlaybackLoudness/100,0,0)
				elseif taunt.Value == "Banisher2" then
					GUN.NeonParts.Color = Color3.fromHSV(Hue/360,1,math.clamp(255,0,1))
				else
					GUN.NeonParts.Color = Color3.fromHSV(i,1,1)
				end
				GUN.Base.Color = MAINRUINCOLOR
				GUN.GunAdditions.Color = MAINRUINCOLOR
				GUN.NeonParts.Light.Color = GUN.NeonParts.Color
				GUN.NeonParts.Light.Brightness = 1
				if GUN.NeonParts.Transparency == 1 then
					GUN.NeonParts.Light.Enabled = true
				else
					GUN.NeonParts.Light.Enabled = true
				end 
			end
		end
	end
end))

chatfunc("Not USC! | Maddox LC By MrMaddox38 | Lightnign Cannon, by LuaQuack | Rekt them skidder!!!",true)

function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vector3.new(1,1,1))
	local ENDSIZE = (Table.Size2 or Vector3.new())
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or MAINRUINCOLOR)
	local hOK,sOK,vOK = Color3.toHSV(COLOR)
	local RAINBOWPART = false
	if sOK > .1 then
		RAINBOWPART = true
	end
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3,Effects,MATERIAL,0,TRANSPARENCY,MAINRUINCOLOR,"Effect",Vector3.new(1,1,1),true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID,EFFECT,SOUNDVOLUME,SOUNDPITCH,false)
		end
		EFFECT.Color = COLOR
		if RAINBOWPART then
			coroutine.resume(coroutine.create(function()
				while not stopeverything and EFFECT:IsDescendantOf(game) do
					EFFECT.Color = GUN.NeonParts.Color
					swait()
				end
			end))
		end
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"Sphere","","",SIZE,Vector3.new())
		elseif TYPE == "Block" then
			MSH = Instance.new("BlockMesh",EFFECT)
			MSH.Scale = Vector3.new(SIZE.X,SIZE.Y,SIZE.Z)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","20329976","",SIZE,Vector3.new(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","559831844","",Vector3.new(SIZE.X,SIZE.X,.1),Vector3.new())
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662586858","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662585058","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","1051557","",SIZE,Vector3.new())
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","4770583","",SIZE,Vector3.new())
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","9756362","",SIZE,Vector3.new())
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			EFFECT.CFrame = CFRAME
			for LOOP = 1,TIME+1 do
				swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = Vector3.new(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat if stopeverything then wait(math.huge) end swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat if stopeverything then wait(math.huge) end swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end
function GODCATEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or Color3.new(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BrickColor.new("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" then
			MSH = Instance.new("BlockMesh",EFFECT)
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				if TYPE == "Block" then
					EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				else
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end
function SpawnTrail(FROM,TO,BIG)
	local TRAIL = CreatePart(3, Effects, "Neon", 0, 0, "Really red", "Trail", VT(10,10,10))
	MakeForm(TRAIL,"Cyl")
	game:GetService("RunService").Heartbeat:Connect(function()
		TRAIL.Color = CurrentColor
	end)
	local DIST = (FROM - TO).Magnitude
	if BIG == true then
		TRAIL.Size = VT(0.5,DIST,0.5)
	else
		TRAIL.Size = VT(0.25,DIST,0.25)
	end
	TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function()
		for i = 1, 55 do
			Swait()
			TRAIL.Transparency = TRAIL.Transparency + 0.01
		end
		TRAIL:remove()
	end))
end
function Ka_Boom()
chatfunc("Die...Die...DIE!!!",true)
	attack = true
	walkspeed = 0
	local vbFired = false
	if VisibleBullet then
		coroutine.resume(coroutine.create(function()
			while VisibleBullet and not vbFired do
				local hole = Holetwo.Position
				SetBulletState(hole, hole)
				swait()
			end
		end))
	end
	coroutine.wrap(function()
		for i = 0,2 do
			swait(12)
			CreateSound(199145095,GUN.Joint,10,1)
		end
	end)()
	for i = 0,2,.1 do
		swait()
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	for i = 0,1.5,.1 do
		swait()
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	for i = 0,.5,.1 do
		swait()
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,-.2,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end		
	end
	local BEAM = CreatePart(3,Effects,"Neon",0,0,CurrentColor,"Beam",Vector3.new())
	local BEAM2 = CreatePart(3,Effects,"Neon",0,0,CurrentColor,"Beam",Vector3.new())
	MakeForm(BEAM,"Ball")
	MakeForm(BEAM2,"Ball")
	BEAM.CFrame = CFrame.new(RootPart.Position)
	BEAM2.CFrame = CFrame.new(RootPart.Position)
	local boooom = CreateSound(415700134,RootPart,10,1,false)
	boooom.EmitterSize = 100
	vbFired = true
	for i=1,140 do
		swait()
		if VisibleBullet then
			SetBulletState(Holetwo.Position, RootPart.Position + Vector3.new(0, 300, -50))
		end
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,-.2,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,-.2,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end
		BEAM.Size = BEAM.Size + Vector3.new(.7,8,.7)
		BEAM2.Size = BEAM2.Size + Vector3.new(2,2,2)
		BEAM.Color = GUN.NeonParts.Color
		BEAM2.Color = GUN.NeonParts.Color
		BEAM.CFrame = CFrame.new(RootPart.Position)
		BEAM2.CFrame = CFrame.new(RootPart.Position)
		Effect({EffectType = "Slash", Size = Vector3.new(0,0,0), Size2 = Vector3.new(5,.05,5), Transparency = 0, Transparency2 = 1, CFrame = BEAM.CFrame*CFrame.new(0,-1.3,0) * CFrame.Angles(math.rad(math.random(-90,90)), math.rad(math.random(-90,90)) ,math.rad(math.random(-90,90))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CurrentColor, SoundID = nil, SoundPitch = 1, SoundVolume = 0})
	end
	mdmg(RootPart.Position,BEAM2.Size.Y/2)
	Effect({TIME = 75,EffectType = "Sphere",Size = BEAM.Size,Size2 = Vector3.new(0,BEAM.Size.Y,0),Transparency = 0,Transparency2 = 0,CFrame = BEAM.CFrame,MoveToPos = nil,RotationX = 0,RotationY = 0,RotationZ = 0,Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil})
	Effect({TIME = 75,EffectType = "Sphere",Size = BEAM2.Size,Size2 = Vector3.new(),Transparency = 0,Transparency2 = .6,CFrame = BEAM2.CFrame,MoveToPos = nil,RotationX = 0,RotationY = 0,RotationZ = 0,Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil})
	for i,v in pairs(Effects:GetChildren()) do
		v.Color = MAINRUINCOLOR
		v:GetPropertyChangedSignal("Color"):Connect(function()
			if stopeverything then wait(math.huge) end
			v.Color = MAINRUINCOLOR
		end)
	end
	BEAM2:Destroy()
	BEAM:Destroy()
	attack = false
	walkspeed = 50
end

function attackone()
	attack = true
	walkspeed = 16
	AttackGyro()
	for i = 0,.5,.05 do
		swait()
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-30)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(30)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(30),math.rad(0),math.rad(0)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-30)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(30)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(30),math.rad(0),math.rad(0)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end
	end
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 642890855,SoundPitch = .81,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	for i = 0,2 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	local mousehit = Mouse.Hit
	local DISTANCE = (Holetwo.Position - mousehit.p).Magnitude
	local killbeam = CreatePart(3,Effects,"Neon",0,0,MAINRUINCOLOR,"Kill Beam",Vector3.new(1,DISTANCE,1))
	killbeam.CFrame = CFrame.new(Holetwo.Position,mousehit.p) * CFrame.new(0,0,-DISTANCE/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
	MakeForm(killbeam,"Cyl")
	coroutine.resume(coroutine.create(function()
		for i = 1,25 do
			swait()
			killbeam.Color = CurrentColor
			killbeam.Transparency = i/25
		end
		killbeam:Destroy()
	end))
	SetBulletState(Holetwo.Position, mousehit.p)
	for i = 1,4 do
		coroutine.resume(coroutine.create(function()
			Lightning(Holetwo.Position,mousehit.p,15,3.5,CurrentColor,25,0,1,0,true,55)
		end))
	end
	coroutine.resume(coroutine.create(function()
		Lightning(Holetwo.Position,mousehit.p,15,3.5,CurrentColor,25,0,1,0,true,55)
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = mousehit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 821439273,SoundPitch = .8,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = mousehit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		for i = 0,2 do
			for a = 0, 14 do
				EFFECT1(3,math.random(4,8),"Add",mousehit*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),3,3,3,0.03,GUN.NeonParts.Color,0)
			end
		end
		mdmg(mousehit.p,10)
	end))
	for i = 0,.5,.075 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(160),math.rad(-20),math.rad(60)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(60)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(160),math.rad(-20),math.rad(60)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	walkspeed = 50
	attack = false
end

function attackone2()
	attack = true
	walkspeed = 16
	AttackGyro()
	for i = 0,.5,.05 do
		swait()
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-30)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(30)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(30),math.rad(0),math.rad(0)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-30)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(30)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(30),math.rad(0),math.rad(0)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end
	end
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(1,1,1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 136523485,SoundPitch = 1,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(1,1,1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	local mousehit = Mouse.Hit
	local DISTANCE = (Holetwo.Position - mousehit.p).Magnitude
	SetBulletState(Holetwo.Position, mousehit.p)
	for i = 1,4 do
		coroutine.resume(coroutine.create(function()
			Lightning(Holetwo.Position,mousehit.p,.5,.5,CurrentColor,5,0,.3,0,true,55)
		end))
	end
	coroutine.resume(coroutine.create(function()
		Lightning(Holetwo.Position,mousehit.p,.5,.5,CurrentColor,5,0,.3,0,true,55)
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(1,1,1),Transparency = 0,Transparency2 = 1,CFrame = mousehit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 821439273,SoundPitch = .8,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(1,1,1),Transparency = 0,Transparency2 = 1,CFrame = mousehit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		mdmg(mousehit.p,10)
	end))
	for i = 0,.5,.075 do
		swait()
		if HipVal ~= 0 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),.7/3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1/3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(160),math.rad(-20),math.rad(60)) * rscp,1/3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1/3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(60)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(160),math.rad(-20),math.rad(60)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	walkspeed = 50
	attack = false
end

function attacktwo()
chatfunc("Maddox LC Thrown 46 minestraps",true)
	attack = true
	walkspeed = 0
	AttackGyro()
   local gBullet = CreatePart(3,Effects,"Neon",0,0,CurrentColor,"AbsoluteNoob",Vector3.new())
   MakeForm(gBullet,"Ball")
   gBullet.CFrame = LeftArm.CFrame*CFrame.new(0,-1.5,0)
	CreateSound(2785493,gBullet,10,.8)
	for i = 0,1.25,.025 do
		swait()
		Effect({Time = math.random(35,55),EffectType = "Sphere",Size = Vector3.new(.5,.5,.5),Size2 = Vector3.new(1,1,1),Transparency = 0,Transparency2 = 1,CFrame = LeftArm.CFrame*CFrame.new(0,-1.5,0),MoveToPos = LeftArm.CFrame*CFrame.new(0,-1.5,0)*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10)).p,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 50,SizeBoomerang = 50})
		gBullet.Size = gBullet.Size * 1.085
    	gBullet.CFrame = LeftArm.CFrame*CFrame.new(0,-1.5,0)
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-30)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(-5 - 3 * math.cos(sine/12)),math.rad(0),math.rad(30)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(135 + 8.5 * math.cos(sine/49)),math.rad(0),math.rad(25)) * RIGHTSHOULDERC0,.7/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5 + .1 * math.cos(sine/12),-0) * CFrame.Angles(math.rad(85 - 1.5 * math.cos(sine/12)),math.rad(0 - 6 * math.cos(sine/12)),math.rad(-30 - 6 * math.cos(sine/12))) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0 + 0.05 * math.cos(sine / 12)) * CFrame.Angles(math.rad(5),math.rad(0),math.rad(-30)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(-5 - 3 * math.cos(sine / 12)),math.rad(0),math.rad(30)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-62.5),math.rad(0 - 5 * math.cos(sine / 12)),math.rad(30)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5 + 0.1 * math.cos(sine / 12),-0) * CFrame.Angles(math.rad(85 - 1.5 * math.cos(sine / 12)),math.rad(0 - 6 * math.cos(sine / 12)),math.rad(-30 - 6 * math.cos(sine / 12))) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1 - 0.075 * math.cos(sine / 12),0) * CFrame.Angles(math.rad(5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1 - 0.075 * math.cos(sine / 12),0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	local bullets = {}
	for i = 1,math.random(27,41) do
		swait()
		local Bullet = CreatePart(3,Effects,"Neon",0,0,CurrentColor,"Shit.",Vector3.new(.6,.6,.6))
    	MakeForm(Bullet,"Ball")
		Bullet.CFrame = gBullet.CFrame
		Effect({Time = math.random(5,20),EffectType = "Sphere",Size = Vector3.new(3,3,3)*math.random(-3,2),Size2 = Vector3.new(6,6,6)*math.random(-3,2),Transparency = .4,Transparency2 = 1,CFrame = Bullet.CFrame,MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 25})
		table.insert(bullets,Bullet)
	end
	local oofing = false
	for b = 1,#bullets do
		swait()
		local part,pos = rayCast(LeftArm.CFrame*CFrame.new(0,-1.5,0).p,((Mouse.Hit.p+Vector3.new(math.random(-15,15),math.random(-7,7),math.random(-15,15))) - LeftArm.CFrame*CFrame.new(0,-1.5,0).p),500,Character)
		coroutine.resume(coroutine.create(function()
		FireArc(bullets[b],pos,math.random(17,31),math.random(9,15),false)
		Effect({Time = math.random(25,35),EffectType = "Sphere",Size = Vector3.new(.6,.6,.6),Size2 = Vector3.new(1.6,1.6,1.6),Transparency = 0,Transparency2 = 1,CFrame = bullets[b].CFrame,MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 25})
		swait(math.random(55,65))
		for i = 0,2 do
			Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = bullets[b].CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
			Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = bullets[b].CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		end
		for i = 0,10 do
		swait()
		bullets[b].Transparency = bullets[b].Transparency + .1
		end
		oofing = not oofing
		if oofing then
			mdmg(bullets[b].Position,10)
		end
		local EEEBRUHEEE = CreateSound(168513088,bullets[b],3.5,1.1,false)
		bullets[b].Transparency = 1
		EEEBRUHEEE.Ended:Connect(function()
if stopeverything then wait(math.huge) end
			bullets[b]:Destroy()
		end)
		end))
	end
	for i = 0,10 do
		swait()
		gBullet.Transparency = gBullet.Transparency + .1
	end
	gBullet:Destroy()
	walkspeed = 50
	attack = false
end

function hedshoot()
chatfunc("Pwned By MLC? stupid bastard",true)
	attack = true
	walkspeed = 16
	CreateSound(235097614,RootPart,6,1.5,false)
	for i = 0,.5,.05 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,0.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,0.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	for xd = 1,5 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.15,0,.15),Transparency = 0,Transparency2 = 1,CFrame = Torso.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.15,0,.15),Transparency = 0,Transparency2 = 1,CFrame = Torso.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(2,2,2),Size2 = Vector3.new(5,5,5),Transparency = 0,Transparency2 = 1,CFrame = RootPart.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 642890855,SoundPitch = .81,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(2,2,2),Size2 = Vector3.new(5,5,5),Transparency = 0,Transparency2 = 1,CFrame = RootPart.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = math.random(25,45),EffectType = "Sphere",Size = Vector3.new(2,100,2),Size2 = Vector3.new(6,100,6),Transparency = 0,Transparency2 = 1,CFrame = RootPart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),-50)*CFrame.Angles(math.rad(math.random(89,91)),math.rad(math.random(-1,1)),math.rad(math.random(-1,1))),MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 45})
	Effect({Time = math.random(25,45),EffectType = "Sphere",Size = Vector3.new(3,100,3),Size2 = Vector3.new(9,100,9),Transparency = 0,Transparency2 = 1,CFrame = RootPart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),-50)*CFrame.Angles(math.rad(math.random(89,91)),math.rad(math.random(-1,1)),math.rad(math.random(-1,1))),MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 45})
	mdmg(RootPart.Position,14)
	for i = 1,4 do
		RootPart.CFrame = RootPart.CFrame * CFrame.new(0,0,-25)
		mdmg(RootPart.Position,14)
		coroutine.resume(coroutine.create(function()
			Lightning(RootPart.CFrame*CFrame.new(math.random(-2.5,2.5),math.random(-5,5),math.random(-15,15)).p,RootPart.CFrame*CFrame.new(math.random(-2.5,2.5),math.random(-5,5),math.random(-15,15)).p,6,25,MAINRUINCOLOR,math.random(30,45),.5,1.5,0,true,60) 
		end))	
		coroutine.resume(coroutine.create(function()
			Lightning(RootPart.CFrame*CFrame.new(math.random(-2.5,2.5),math.random(-5,5),math.random(-15,15)).p,RootPart.CFrame*CFrame.new(math.random(-2.5,2.5),math.random(-5,5),math.random(-15,15)).p,6,25,CurrentColor,math.random(30,45),.5,1.5,0,true,60)
		end))
	end
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(2,2,2),Size2 = Vector3.new(5,5,5),Transparency = 0,Transparency2 = 1,CFrame = RootPart.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(2,2,2),Size2 = Vector3.new(5,5,5),Transparency = 0,Transparency2 = 1,CFrame = RootPart.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	for xd = 1,5 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.15,0,.15),Transparency = 0,Transparency2 = 1,CFrame = Torso.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.15,0,.15),Transparency = 0,Transparency2 = 1,CFrame = Torso.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	for i = 0,.5,.1 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-90)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-90)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
	end
	attack = false
	walkspeed = 50
end
local stillraining = false
function painlessrain()
chatfunc("5 Free Painless rains comming now!",true)
	local vbFired = false
	if VisibleBullet then
		coroutine.resume(coroutine.create(function()
			while VisibleBullet and not vbFired do
				local hole = Holetwo.Position
				SetBulletState(hole, hole)
				swait()
			end
		end))
	end
	if stillraining then
		return
	else
		stillraining = true
	end
	attack = true
	walkspeed = 16
	coroutine.wrap(function()
		for i = 0,2 do
			swait(12)
			CreateSound(199145095,GUN.Joint,10,1)
		end
	end)()
	for i = 0,2,.1 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1 / 2)
		end	
		end
	for i = 0,1.5,.1 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
			else
				RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),1 / 3)
				Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1 / 3)
				RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
				GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1 / 2)
			end	
	end
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 642890855,SoundPitch = .81,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	for i = 0,.5,.1 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,-.2,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
			else
				RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
				Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * lscp,1 / 3)
				RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
				GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
			end		
		end
	local skypos = Holetwo.CFrame * CFrame.new(-400,0,0)
	local DISTANCE = (Holetwo.Position - skypos.p).Magnitude
	local killbeam = CreatePart(3,Effects,"Neon",0,0,MAINRUINCOLOR,"Kill Beam",Vector3.new(1,DISTANCE,1))
	killbeam.CFrame = CFrame.new(Holetwo.Position,skypos.p) * CFrame.new(0,0,-DISTANCE/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
	MakeForm(killbeam,"Cyl")
	coroutine.resume(coroutine.create(function()
		for i = 1,25 do
			swait()
			killbeam.Transparency = i/25
		end
		killbeam:Destroy()
	end))
	vbFired = true
	SetBulletState(Holetwo.Position, skypos.p)
	for i = 1,4 do
		coroutine.resume(coroutine.create(function()
			Lightning(Holetwo.Position,skypos.p,15,3.5,CurrentColor,25,0,1,0,true,55)
		end))
	end
	Lightning(Holetwo.Position,skypos.p,15,3.5,CurrentColor,25,0,1,0,true,55)
	for i = 0,2 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	for i = 0,.5,.1 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(-5),math.rad(-5),math.rad(0)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-5),math.rad(-5),math.rad(0)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
		end	
	attack = false
	walkspeed = 50
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = skypos,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 821439273,SoundPitch = .8,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = skypos,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	for i = 0,2 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = skypos*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = skypos*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	for i = 1,5 do
		local Sky = RootPart.CFrame*CFrame.new(0,500,0)
		local MoPos = Mouse.Hit.p
		SetBulletState(MoPos, Sky.p)
		local DISTANCE = (Sky.p - MoPos).Magnitude
		for i = 1,4 do
			coroutine.resume(coroutine.create(function()
				Lightning(Sky.p,MoPos,15,3.5,CurrentColor,25,0,1,0,true,55)
			end))
		end
		Lightning(Sky.p,MoPos,15,3.5,CurrentColor,25,0,1,0,true,55)
		local killbeam = CreatePart(3,Effects,"Neon",0,0,MAINRUINCOLOR,"Kill Beam",Vector3.new(1,DISTANCE,1))
		killbeam.CFrame = CFrame.new(Sky.p,MoPos) * CFrame.new(0,0,-DISTANCE/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
		MakeForm(killbeam,"Cyl")
		coroutine.resume(coroutine.create(function()
			for i = 1,25 do
				swait()
				killbeam.Transparency = i/25
			end
			killbeam:Destroy()
		end))
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = CFrame.new(MoPos),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = 821439273,SoundPitch = .8,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = CFrame.new(MoPos),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		for i = 0,2 do
			--Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = CFrame.new(MoPos)*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
			--Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = CFrame.new(MoPos)*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
			for a = 0, 14 do
				EFFECT1(3,math.random(4,8),"Add",CFrame.new(MoPos)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),3,3,3,0.03,GUN.NeonParts.Color,0)
			end
		end
		mdmg(MoPos,12)
	end
	stillraining = false
end
function SingularityBeam()
chatfunc("Maddox Lightning Cannon Uses a fucked up attack nowayyy!!!",true)
	attack = true
	cannecksnap = false
	walkspeed = 0
	AttackGyro()
	for i = 0,.5,.05 do
		swait()
		if HipVal ~= 0 then
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(sine/50),0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),.7/3)
		Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1/3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * rscp,1/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * lscp,1/3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.cos(sine/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(sine/37)),math.rad(0),math.rad(0)),.7/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 - 9 * math.cos(sine/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(sine/41)),math.rad(0),math.rad(0)),.7/3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
		else
			RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
			Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,0.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * rscp,1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,0.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * lscp,1 / 3)
			RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
			GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
		end	
		end
	local HoleDist = (Hole.Position - Holetwo.Position).Magnitude
	local chargebeam = CreatePart2(3,Effects,"Neon",0,0,MAINRUINCOLOR,"Charge Beam",Vector3.new(.25,HoleDist,.25),false)
	MakeForm(chargebeam,"Cyl")
	chargebeam.CFrame = CFrame.new(Hole.Position,Holetwo.Position) * CFrame.new(0,0,-HoleDist/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
	local chargeweld = weldBetween(GUN.Joint,chargebeam)
	local chargeball = CreatePart2(3,Effects,"Neon",0,0,MAINRUINCOLOR,"Charge Ball",Vector3.new(.5,.5,.5),false)
	chargeball.Shape = "Ball"
	chargeball.CFrame = Holetwo.CFrame
	weldBetween(Holetwo,chargeball)
	if VisibleBullet then
		coroutine.resume(coroutine.create(function()
			while VisibleBullet and chargeball and chargeball:IsDescendantOf(game) do
				local hole = Holetwo.Position
				SetBulletState(hole, hole)
				swait()
			end
		end))
	end
	CreateSound(342793847,Hole,10,1,false)
	local bigball = game:GetService("TweenService"):Create(chargeball,TweenInfo.new(3.86,Enum.EasingStyle.Linear),{Size = Vector3.new(2.5,2.5,2.5)})
	bigball:Play()
	bigball.Completed:Wait()
	chargebeam:Destroy()
	local KillDist = (Holetwo.Position - Mouse.Hit.p).Magnitude
	local killbeam = CreatePart2(3,Effects,"Neon",0,0,MAINRUINCOLOR,"Kill Beam",Vector3.new(2.5,KillDist,2.5))
	MakeForm(killbeam,"Cyl")
	killbeam.Touched:Connect(function(victim)
if stopeverything then wait(math.huge) end
		mdmg(victim.Position,5)
	end)
	CreateSound(138677306,Holetwo,10,1,false)
	CreateSound(415700134,Holetwo,10,1,false)
	CreateSound(3264923,Holetwo,10,1,false)
	-- [FIX] inline beam loop (the original used coroutines that never resumed, so the beam did not follow the mouse)
	local beamend = os.clock() + 3
	local isdoingathing = false
	local dmgthrot = 0
	while os.clock() < beamend and killbeam:IsDescendantOf(game) do
		isdoingathing = not isdoingathing
		KillDist = (Holetwo.Position - Mouse.Hit.p).Magnitude
		if lplr.Name == USERNAME then
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0,0,.1)
		end
		killbeam.Size = Vector3.new(2.5,KillDist,2.5)
		killbeam.CFrame = CFrame.new(Holetwo.Position,Mouse.Hit.p) * CFrame.new(0,0,-KillDist/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
		if VisibleBullet then
			SetBulletState(Holetwo.Position, Mouse.Hit.p)
		end
		if isdoingathing then
			coroutine.resume(coroutine.create(function()
				Lightning(Holetwo.Position,Mouse.Hit.p,15,3,CurrentColor,10,0,1,0,true,55)
			end))
			for a = 0, 14 do
				EFFECT1(3,math.random(4,8),"Add",Mouse.Hit*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),3,3,3,0.03,GUN.NeonParts.Color,0)
			end
			Effect({Time = 10,EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
			Effect({Time = 10,EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
			Effect({Time = 10,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
			Effect({Time = 10,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		end
		dmgthrot = dmgthrot + 1
		if dmgthrot >= 6 then
			dmgthrot = 0
			mdmg(Mouse.Hit.p,5)
		end
		swait()
	end
	chargeball:Destroy()
	killbeam:Destroy()
	walkspeed = 50
	attack = false
	cannecksnap = true
end
Mouse.Button1Down:Connect(function()
if stopeverything then wait(math.huge) end
	if not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus" and taunt.Value ~= "Banisher" and taunt.Value ~= "Banisher2") then
		attackone()
	end
	if not attack and (taunt.Value == "Banisher" or taunt.Value == "Banisher2") then
		attackone2()
	end
end)
local FLYING = false
function sFLY()
	if not ISFLYING then
		FLYING = false
	else
		local CONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
		local lCONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
		local SPEED = 0			
		local function FLY()
			FLYING = true
			BG = Instance.new('BodyGyro',RootPart)
			BV = Instance.new('BodyVelocity',RootPart)
			BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			BG.P = 1e4
			BG.CFrame = RootPart.CFrame
			BV.Velocity = Vector3.new()
			BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			coroutine.resume(coroutine.create(function()
				repeat if stopeverything then wait(math.huge) end
					game:GetService("RunService").RenderStepped:Wait()
					if not alreadyfixing then
						if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
							SPEED = 50
						elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
							SPEED = 0
						end
						if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
							BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R,(CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * .2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
							lCONTROL = {F = CONTROL.F,B = CONTROL.B,L = CONTROL.L,R = CONTROL.R}
						elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
							BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R,(lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * .2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						else
							BV.Velocity = Vector3.new()
						end
						BG.CFrame = workspace.CurrentCamera.CoordinateFrame
					end
				until not FLYING
				CONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
				lCONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
				SPEED = 0
				if not alreadyfixing then
					for i,v in pairs(RootPart:GetChildren()) do
						if v:IsA("BodyMover") then
							v:Destroy()
						end
					end
					RootPart.CFrame = CFrame.new(RootPart.Position)
				end
			end))
		end
		local IYMouse = Player:GetMouse()
		IYMouse.KeyDown:connect(function(KEY)
if stopeverything then wait(math.huge) end
			if KEY:lower() == 'w' then
				CONTROL.F = Humanoid.WalkSpeed*0.02
			elseif KEY:lower() == 's' then
				CONTROL.B = - Humanoid.WalkSpeed*0.02
			elseif KEY:lower() == 'a' then
				CONTROL.L = - Humanoid.WalkSpeed*0.02
			elseif KEY:lower() == 'd' then 
				CONTROL.R = Humanoid.WalkSpeed*0.02
	        elseif KEY:lower() == 'e' then
				CONTROL.Q = Humanoid.WalkSpeed*0.02
	        elseif KEY:lower() == 'q' then
				CONTROL.E = -Humanoid.WalkSpeed*0.02
			end
		end)
		IYMouse.KeyUp:connect(function(KEY)
if stopeverything then wait(math.huge) end
			if KEY:lower() == 'w' then
				CONTROL.F = 0
			elseif KEY:lower() == 's' then
				CONTROL.B = 0
			elseif KEY:lower() == 'a' then
				CONTROL.L = 0
			elseif KEY:lower() == 'd' then
	            CONTROL.R = 0
	        elseif KEY:lower() == 'e' then
	            CONTROL.Q = 0
	        elseif KEY:lower() == 'q' then
	            CONTROL.E = 0
			end
		end)
		FLY()
	end
end
function sphere(bonuspeed,type,pos,scale,value,color)
local type = type
local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.BrickColor = BrickColor.random()
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end

function sphere2(bonuspeed,type,pos,scale,value,value2,value3,color)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	local scaler2 = 1
	local scaler2b = 1
	local scaler2c = 1
	if type == "Add" then
		scaler2 = 1*value
		scaler2b = 1*value2
		scaler2c = 1*value3
	elseif type == "Divide" then
		scaler2 = 1/value
		scaler2b = 1/value2
		scaler2c = 1/value3
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
				scaler2b = scaler2b - .01*value/bonuspeed
				scaler2c = scaler2c - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
				scaler2b = scaler2b - .01/value*bonuspeed
				scaler2c = scaler2c - .01/value*bonuspeed
			end
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2b*bonuspeed,scaler2c*bonuspeed)
		end
		rng:Destroy()
	end))
end

function PixelBlockX(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Brick"
	rngm.Scale = Vector3.new(x1,y1,z1)
	local scaler2 = 1
	local speeder = FastSpeed/10
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.BrickColor = BrickColor.random()
			speeder = speeder - .01*FastSpeed*bonuspeed/10
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end

function PixelBlock(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
	local type = type
	local rng = Instance.new("Part", Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Brick"
	rngm.Scale = VT(x1,y1,z1)
	local scaler2 = 1
	local speeder = FastSpeed/10
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed
			end
			speeder = speeder - 0.01*FastSpeed*bonuspeed/10
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			--rng.Transparency = rng.Transparency + 0.01*bonuspeed
			rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end

function sphereMK(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = Vector3.new(x1,y1,z1)
	local scaler2 = 1
	local speeder = FastSpeed
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.BrickColor = BrickColor.random()
			speeder = speeder - .01*FastSpeed*bonuspeed
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,0)
		end
		rng:Destroy()
	end))
end

function slash(bonuspeed,rotspeed,rotatingop,typeofshape,type,typeoftrans,pos,scale,value,color)
	local type = type
	local rotenable = rotatingop
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	if typeoftrans == "In" then
		rng.Transparency = 1
	end
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "FileMesh"
	if typeofshape == "Normal" then
		rngm.MeshId = "rbxassetid://662586858"
	elseif typeofshape == "Round" then
		rngm.MeshId = "rbxassetid://662585058"
	end
	rngm.Scale = scale
	local scaler2 = 1/10
	if type == "Add" then
		scaler2 = 1*value/10
	elseif type == "Divide" then
		scaler2 = 1/value/10
	end
	local randomrot = math.random(1,2)
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed/10
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed/10
			end
			if rotenable == true then
				if randomrot == 1 then
					rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(rotspeed*bonuspeed/2),0)
				elseif randomrot == 2 then
					rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(-rotspeed*bonuspeed/2),0)
				end
			end
			if typeoftrans == "Out" then
				rng.Transparency = rng.Transparency + .01*bonuspeed
			elseif typeoftrans == "In" then
				rng.Transparency = rng.Transparency - .01*bonuspeed
			end
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed/10,0,scaler2*bonuspeed/10)
		end
		rng:Destroy()
	end))
end
function skid()
	CreateSound(4138167041,Head,10,math.random(0.96,1.055),false)
	chatfunc("Skid",true)
end


function EFFECT1(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.Color = GUN.NeonParts.Color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Brick"
	rngm.Scale = Vector3.new(x1,y1,z1)
	local scaler2 = 1
	local speeder = FastSpeed/10
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.Color = GUN.NeonParts.Color
			speeder = speeder - .01*FastSpeed*bonuspeed/10
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end
function OpenSH()
	if Shield.Value == false then
		Shield.Value = true
	elseif Shield.Value == true then
		Shield.Value = false
	end	
end

function TPEffect(pos)
	for xd = 1,5 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.15,0,.15),Transparency = 0,Transparency2 = 1,CFrame = pos*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = CurrentColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.15,0,.15),Transparency = 0,Transparency2 = 1,CFrame = pos*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MAINRUINCOLOR,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	for i = 0, 14 do
		EFFECT1(3,math.random(4,8),"Add",pos*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),3,3,3,0.03,GUN.NeonParts.Color,0)
	end
end
function Warp()
chatfunc("Hey stupid",true)
	TPEffect(Torso.CFrame)
	local ORIGIN = RootPart.Position
	local POS = RootPart.Position
	RootPart.CFrame = CF(Mouse.Hit.p+VT(0,3,0),VT(ORIGIN.X,Mouse.Hit.p.Y,ORIGIN.Z))
	CreateSound(1177785010, Torso, 10, 1, false)
	TPEffect(Torso.CFrame)
end
--[[function Switch()
chatfunc("Next Mode...",true)
	CreateSound(147722227, Torso, 4, 1.3, false)
	for m = 1,5 do
		Effect({Time = 10, EffectType = "Wave", Size = VT(500,0.11,500)*1, Size2 = VT(0,0.11,0), Transparency = 1, Transparency2 = 0, CFrame = Torso.CFrame*CFrame.Angles(math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-15,15), RotationZ = 0, Material = "Neon", Color = CurrentColor, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
	Effect({Time = 10, EffectType = "Sphere", Size = VT(0.5,0.5,0.5), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 0.5, CFrame = Torso.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CurrentColor, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
end]]
function balfolderclearlol()
	BallFolder:ClearAllChildren()
end
function spawnball()
	local Ball = Instance.new("Part")
	local Light = nil
	Ball.Shape = "Ball"
	Ball.Size = Vector3.new(ballsize.Value,ballsize.Value,ballsize.Value)
	Ball.Material = ballmaterial.Value
	Ball.Anchored = false
	Ball.Color = GUN.NeonParts.Color
	Ball.Position = Mouse.Hit.p
	Ball.Parent = BallFolder
	Ball.Name = randomstring()
	if Ball.Material == "ForceField" or Ball.Material == "Neon" then
		local Light = Instance.new("PointLight")
		Light.Brightness = 1
		Light.Color = GUN.NeonParts.Color
		Light.Range = 40*Ball.Size.Y
		Light.Shadows = true
		Light.Parent = Ball
		Light.Name = randomstring()
	end
	coroutine.resume(coroutine.create(function()
		while true do
			Swait()
			Ball.Shape = "Ball"
			Ball.Anchored = false
			Ball.Color = GUN.NeonParts.Color
			Ball.Parent = BallFolder
			if Ball.Material == "ForceField" or Ball.Material == "Neon" then
				Light.Brightness = 1
				Light.Color = GUN.NeonParts.Color
				Light.Range = 40*Ball.Size.Y
				Light.Shadows = true
				Light.Parent = Ball
			end
		end
	end))
end
local alreadydoneit = false
Mouse.KeyDown:Connect(function(k)
	if stopeverything then wait(math.huge) end
	k = k:lower()
	if k == "z" and not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus" and taunt.Value ~= "Banisher" and taunt.Value ~= "Banisher2") then	
		hedshoot()
	elseif k == "x" and not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus" and taunt.Value ~= "Banisher" and taunt.Value ~= "Banisher2") then
		SingularityBeam()
	elseif k == "c" and not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus" and taunt.Value ~= "Banisher" and taunt.Value ~= "Banisher2") then
		painlessrain()
	elseif k == "v" and not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus" and taunt.Value ~= "Banisher" and taunt.Value ~= "Banisher2") then
		attacktwo()
	elseif k == "b" and not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus" and taunt.Value ~= "Banisher" and taunt.Value ~= "Banisher2") then
		Ka_Boom()
	elseif k == "g" then
	
	
	elseif k == "h" and not attack then
		skid()
	elseif k == "r" and not attack then
	chatfunc("Silly lagged teleport by MrMaddox mf",true)
		Warp()
	elseif k == "n" and not attack then
		OpenSH()
	elseif k == "l" and not attack then
		balfolderclearlol()
	elseif k == "j" and not attack then
		spawnball()
	elseif k == "m" and not attack and (taunt.Value ~= "Fave" and taunt.Value ~= "Krump" and taunt.Value ~= "OOOOO" and taunt.Value ~= "Sus") then
	chatfunc("Next Mode",true)
		--Switch()
if songid.Value ~= "rbxassetid://140695383804339" and songid.Value ~= "rbxassetid://77812960390202" and songid.Value ~= "rbxassetid://134326240719101" and songid.Value ~= "rbxassetid://140736185536900" and songid.Value ~= "rbxassetid://80599260386256" and songid.Value ~= "rbxassetid://140730997974832" and songid.Value ~= "rbxassetid://79358322097704" and songid.Value ~= "rbxassetid://103167441970139" and songid.Value ~= "rbxassetid://120725906183950" and songid.Value ~= "rbxassetid://104499718700425" and songid.Value ~= "rbxassetid://76691294531609" and songid.Value ~= "rbxassetid://1838615431" and songid.Value ~= "rbxassetid://125649026648923" and songid.Value ~= "rbxassetid://79358322097704" and songid.Value ~= "rbxassetid://7171244184" and songid.Value ~= "rbxassetid://99744372463911" and songid.Value ~= "rbxassetid://77812960390202" and songid.Value ~= "rbxassetid://4550031738" and songid.Value ~= "rbxassetid://105298320904497" and songid.Value ~= "rbxassetid://140695383804339" and songid.Value ~= "rbxassetid://138083816965255" and songid.Value ~= "rbxassetid://8153102099" then
			TauntRemote:Fire("None",140695383804339)
		elseif songid.Value == "rbxassetid://140695383804339" then
			TauntRemote:Fire("None2",77812960390202)
		elseif songid.Value == "rbxassetid://77812960390202" then
			TauntRemote:Fire("idk",134326240719101)
		elseif songid.Value == "rbxassetid://134326240719101" then
			TauntRemote:Fire("N4N",140736185536900)
		elseif songid.Value == "rbxassetid://140736185536900" then
			TauntRemote:Fire("Insanity",80599260386256)
		elseif songid.Value == "rbxassetid://80599260386256" then
			TauntRemote:Fire("Err0r",140730997974832)
		elseif songid.Value == "rbxassetid://140730997974832" then
			TauntRemote:Fire("Err0r2",79358322097704)
		elseif songid.Value == "rbxassetid://79358322097704" then
			TauntRemote:Fire("FAST BOIII",103167441970139)
		elseif songid.Value == "rbxassetid://103167441970139" then
			TauntRemote:Fire("Glitch",120725906183950)
		elseif songid.Value == "rbxassetid://120725906183950" then
			TauntRemote:Fire("Pazolite",104499718700425)
		elseif songid.Value == "rbxassetid://104499718700425" then
			TauntRemote:Fire("aEa",76691294531609)
		elseif songid.Value == "rbxassetid://76691294531609" then
			TauntRemote:Fire("N0X",140533402917670)
		elseif songid.Value == "rbxassetid://140533402917670" then
			TauntRemote:Fire("lcv1",99744372463911)
		elseif songid.Value == "rbxassetid://99744372463911" then
			TauntRemote:Fire("mlc",140695383804339) --Exist
		elseif songid.Value == "rbxassetid://140695383804339" then
			TauntRemote:Fire("error?",140143991000026)
		elseif songid.Value == "rbxassetid://140143991000026" then
			TauntRemote:Fire("idkw",138083816965255)
		elseif songid.Value == "rbxassetid://138083816965255" then
			chatfunc("h3lp m3Ee3",true)
			TauntRemote:Fire("unholy",125649026648923)
		elseif songid.Value == "rbxassetid://125649026648923" then
			chatfunc("I've Lost My Color",true)
			TauntRemote:Fire("uncolored",79358322097704)
		elseif songid.Value == "rbxassetid://79358322097704" then
			TauntRemote:Fire("Xâ”X",77812960390202)
		elseif songid.Value == "rbxassetid://77812960390202" then
			TauntRemote:Fire("Banisher",105298320904497)
		end
	elseif k == "y" then
		if taunt.Value ~= "Fave" then
			TauntRemote:Fire("Fave",140729751777216)
		else
			TauntRemote:Fire("None",140695383804339)
		end
	elseif k == "t" then
		if taunt.Value ~= "Krump" then
			TauntRemote:Fire("Krump",125681358856886)
		else
			TauntRemote:Fire("None",140695383804339)
		end
	elseif k == "u" then
		if taunt.Value ~= "OOOOO" then
			TauntRemote:Fire("OOOOO",140599947125753)
		else
			TauntRemote:Fire("None",140695383804339)
		end
	elseif k == "p" then
		if taunt.Value ~= "Sus" then
			TauntRemote:Fire("Sus",90857122354032) -- i love this song
		else
			TauntRemote:Fire("None",140695383804339)
		end
	elseif k == "f" then
		ISFLYING = not ISFLYING
		if lplr.Name == USERNAME then
			sFLY()
		end
	elseif k == "k" then
		TauntRemote:Fire("KickMode")
	end
end)

local ActualVelocity = Vector3.new()


coroutine.wrap(function()
	while not stopeverything do
		swait()
		if doe < 360 then
			doe = doe + 2
		else
			doe = 0
		end
	end
end)()
antivoid = Instance.new("Part")
antivoid.Name = randomstring()
antivoid.Size = Vector3.new(400,10,400)
antivoid.Anchored = true
antivoid.Transparency = 1
antivoid.Position = Vector3.new(RootPart.Position.X,workspace.FallenPartsDestroyHeight+5,RootPart.Position.Z)
antivoid.Parent = workspace
coroutine.resume(coroutine.create(function()
	while not stopeverything do
		swait()
		if not alreadyfixing then
			if antivoid:IsDescendantOf(workspace) then
				antivoid.Position = Vector3.new(RootPart.Position.X,workspace.FallenPartsDestroyHeight+5,RootPart.Position.Z)
			else
				pcall(function()
					antivoid:Destroy()
				end)
				antivoid = Instance.new("Part")
				antivoid.Name = randomstring()
				antivoid.Size = Vector3.new(400,10,400)
				antivoid.Anchored = true
				antivoid.Transparency = 1
				antivoid.Position = Vector3.new(RootPart.Position.X,workspace.FallenPartsDestroyHeight+5,RootPart.Position.Z)
				antivoid.Parent = workspace
			end
		end
	end
end))
if lplr.Name == USERNAME then
	game:GetService("UserInputService").InputBegan:Connect(function()
if stopeverything then wait(math.huge) end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) and not alreadyfixing and game:GetService("UserInputService"):GetFocusedTextBox() == nil then 
			repeat if stopeverything then wait(math.huge) end 
				Humanoid.Jump = true 
				game:GetService("RunService").RenderStepped:Wait() 
				Humanoid.Jump = false 
				game:GetService("RunService").RenderStepped:Wait() 
			until not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space)
		end
	end)
end

function fly()

function weld(p0,p1,c0,c1,par)
	local w = Instance.new("Weld",p0 or par)
	w.Part0 = p0
	w.Part1 = p1
	w.C0 = c0 or CFrame.new()
	w.C1 = c1 or CFrame.new()
	return w
end
local motors = {}
function motor(p0,p1,c0,c1,des,vel,par)
	local w = Instance.new("Motor6D",p0 or par)
	w.Part0 = p0
	w.Part1 = p1
	w.C0 = c0 or CFrame.new()
	w.C1 = c1 or CFrame.new()
	w.MaxVelocity = tonumber(vel) or .05
	w.DesiredAngle = tonumber(des) or 0
	return w
end
function lerp(a,b,c)
	return a+(b-a)*c
end
function clerp(c1,c2,alBRUH)
	local al = .05
	local com1 = {c1.X,c1.Y,c1.Z,c1:toEulerAnglesXYZ()}
	local com2 = {c2.X,c2.Y,c2.Z,c2:toEulerAnglesXYZ()}
	for i,v in pairs(com1) do
		com1[i] = lerp(v,com2[i],al)
	end
	return CFrame.new(com1[1],com1[2],com1[3]) * CFrame.Angles(select(4,unpack(com1)))
end
function ccomplerp(c1,c2,alBRUH)
	local al = .05
	local com1 = {c1:components()}
	local com2 = {c2:components()}
	for i,v in pairs(com1) do
		com1[i] = lerp(v,com2[i],al)
	end
	return CFrame.new(unpack(com1))
end
function tickwave(time,length,offset)
	return .2*math.sin(sine/20)
end
function invcol(c)
	c = c.Color
	return BrickColor.new(MAINRUINCOLOR)
end
local oc = oc or function(...) return ... end
local mod = Instance.new("Folder",Character)
mod.Name = "Wings"
mod.ChildAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
	if v.Name == "Part" and not v:FindFirstChild("WingTrail") then
		swait()
		local top = Instance.new("Attachment")
		top.Name = "Top"
		top.Position = Vector3.new(0,v.Size.Y/2,0)
		top.Parent = v
		local bottom = Instance.new("Attachment")
		bottom.Name = "Bottom"
		bottom.Position = Vector3.new(0,-v.Size.Y/2,0)
		bottom.Parent = v
		local vtrail = Instance.new("Trail")
		vtrail.Name = "WingTrail"
		vtrail.Attachment0 = top
		vtrail.Attachment1 = bottom
		vtrail.Lifetime = .5
		vtrail.MinLength = 0
		vtrail.LightEmission = .5
		vtrail.LightInfluence = 5
		vtrail.Texture = ""
		vtrail.Color = ColorSequence.new(CurrentColor)
		vtrail.Transparency = NumberSequence.new(0,1)
		vtrail.Parent = v
		coroutine.resume(coroutine.create(function()
			while true do
				swait()
				vtrail.Color = ColorSequence.new(CurrentColor)
			end
		end))
	end
end)
local char = Character
local tor = Torso
local hum = Humanoid
local special = {
}
local topcolor = invcol(Character.Torso.BrickColor)
local feacolor = topcolor
local ptrans = 0
local pref = 0
local fire = false
local fmcol = Color3.new()
local fscol = Color3.new()
local part = Instance.new("Part")
part.FormFactor = "Custom"
part.Size = Vector3.new(.2,.2,.2)
part.TopSurface,part.BottomSurface = 0,0
part.CanCollide = false
part.BrickColor = topcolor
part.Transparency = 1
part.Reflectance = pref
part.Material = Enum.Material.Neon
local ef = Instance.new("Fire",fire and part or nil)
ef.Heat = 0
ef.Size = .15
ef.Color = fmcol or Color3.new()
ef.SecondaryColor = fscol or Color3.new()
part:BreakJoints()
function newpart()
	local clone = part:Clone()
	clone.Parent = mod
	clone:BreakJoints()
	return clone
end
local feath = newpart()
feath.BrickColor = feacolor
feath.Transparency = 0
Instance.new("SpecialMesh",feath).MeshType = "Brick"
function newfeather()
	local clone = feath:Clone()
	clone.Transparency = 0
	clone.Parent = mod
	clone:BreakJoints()
	return clone
end
local r1 = newpart()
r1.Size = Vector3.new(.3,1.5,.3)*1.2
local rm1 = motor(tor,r1,CFrame.new(.35,.6,.4) * CFrame.Angles(0,0,math.rad(-60)) * CFrame.Angles(math.rad(30),math.rad(-25),0),CFrame.new(0,-.8,0),.1)
local r2 = newpart()
r2.Size = Vector3.new(.4,1.5,.4)*1.2
local rm2 = motor(r1,r2,CFrame.new(0,.75,0) * CFrame.Angles(0,0,math.rad(50)) * CFrame.Angles(math.rad(-30),math.rad(15),0),CFrame.new(0,-.9,0),.1)
local r3 = newpart()
r3.Size = Vector3.new(.3,2,.3)*1.2
local rm3 = motor(r2,r3,CFrame.new(.1,.9,0) * CFrame.Angles(0,0,math.rad(-140)) * CFrame.Angles(math.rad(-3),0,0),CFrame.new(0,-1.1,0),.1)
local r4 = newpart()
r4.Size = Vector3.new(.25,1.2,.25)*1.2
local rm4 = motor(r3,r4,CFrame.new(0,1.1,0) * CFrame.Angles(0,0,math.rad(-10)) * CFrame.Angles(math.rad(-3),0,0),CFrame.new(0,-.6,0),.1)
local feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,3,.3)
weld(r4,feather,CFrame.new(-.1,-.3,0),CFrame.new(0,-1.5,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,2.3,.3)
weld(r4,feather,CFrame.new(.1,-.1,0) * CFrame.Angles(0,math.random()*.1,0),CFrame.new(0,-1.1,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.35,2.2,.25)
weld(r4,feather,CFrame.new(.1,-.3,0) * CFrame.Angles(0,math.random()*.1,math.rad(-10)),CFrame.new(0,-1.1,0))
local rf3 = {}
for i = 0,7 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2,.35)
	table.insert(rf3,motor(r3,feather,CFrame.new(.05,1-i*.285,0) * CFrame.Angles(0,math.random()*.1,math.rad(-25-i*2)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local rf2 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2-i*.08,.3)
	table.insert(rf2,motor(r2,feather,CFrame.new(.05,.75-i*.26,0) * CFrame.Angles(0,math.random()*.1,math.rad(-75-i*4)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local rf1 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.37,1.65-i*.06,.25)
	table.insert(rf1,motor(r1,feather,CFrame.new(.05,.63-i*.21,0) * CFrame.Angles(0,math.random()*.05,math.rad(-75)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local l1 = newpart()
l1.Size = Vector3.new(.3,1.5,.3)*1.2
local lm1 = motor(tor,l1,CFrame.new(-.35,.6,.4) * CFrame.Angles(0,0,math.rad(60)) * CFrame.Angles(math.rad(30),math.rad(25),0) * CFrame.Angles(0,-math.pi,0),CFrame.new(0,-.8,0) ,.1)
local l2 = newpart()
l2.Size = Vector3.new(.4,1.5,.4)*1.2
local lm2 = motor(l1,l2,CFrame.new(0,.75,0) * CFrame.Angles(0,0,math.rad(50)) * CFrame.Angles(math.rad(30),math.rad(-15),0),CFrame.new(0,-.9,0),.1)
local l3 = newpart()
l3.Size = Vector3.new(.3,2,.3)*1.2
local lm3 = motor(l2,l3,CFrame.new(.1,.9,0) * CFrame.Angles(0,0,math.rad(-140)) * CFrame.Angles(math.rad(3),0,0),CFrame.new(0,-1.1,0),.1)
local l4 = newpart()
l4.Size = Vector3.new(.25,1.2,.25)*1.2
local lm4 = motor(l3,l4,CFrame.new(0,1.1,0) * CFrame.Angles(0,0,math.rad(-10)) * CFrame.Angles(math.rad(3),0,0),CFrame.new(0,-.6,0),.1)
local feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,3,.3)
weld(l4,feather,CFrame.new(-.1,-.3,0),CFrame.new(0,-1.5,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.4,2.3,.3)
weld(l4,feather,CFrame.new(.1,-.1,0) * CFrame.Angles(0,math.random()*.1,0),CFrame.new(0,-1.1,0))
feather = newfeather()
feather.Mesh.Scale = Vector3.new(1,1,1)
feather.Size = Vector3.new(.35,2.2,.25)
weld(l4,feather,CFrame.new(.1,-.3,0) * CFrame.Angles(0,math.random()*.1,math.rad(-10)),CFrame.new(0,-1.1,0))
local lf3 = {}
for i = 0,7 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2,.35)
	table.insert(lf3,motor(l3,feather,CFrame.new(.05,1-i*.285,0) * CFrame.Angles(0,math.random()*.1,math.rad(-25-i*2)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local lf2 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.45,2.2-i*.08,.3)
	table.insert(lf2,motor(l2,feather,CFrame.new(.05,.75-i*.26,0) * CFrame.Angles(0,math.random()*.1,math.rad(-75-i*4)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local lf1 = {}
for i = 0,6 do
	feather = newfeather()
	feather.Mesh.Scale = Vector3.new(1,1,1)
	feather.Size = Vector3.new(.37,1.65-i*.06,.25)
	table.insert(lf1,motor(l1,feather,CFrame.new(.05,.63-i*.21,0) * CFrame.Angles(0,math.random()*.05,math.rad(-75)),CFrame.new(0,-feather.Size.Y/2,0)))
end
local rwing = {rm1,rm2,rm3,rm4}
local lwing = {lm1,lm2,lm3,lm4}
local oc0 = {}
for i,v in pairs(rwing) do
	oc0[v] = v.C0
end
for i,v in pairs(lwing) do
	oc0[v] = v.C0
end
function gotResized()
	if lastsize then
		if tor.Size == lastsize then return end
		local scaleVec = tor.Size/lastsize
		for i,v in pairs(oc0) do
			oc0[i] = v-v.p+scaleVec*v.p
		end
		lastsize = tor.Size
	end
	lastsize = tor.Size
end
tor:GetPropertyChangedSignal("Size"):Connect(function()
if stopeverything then wait(math.huge) end
	gotResized()
end)
gotResized()
local idle = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local outlow = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local outhigh = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local veryhigh = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local flap1 = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
local divebomb = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}
function setwings(tab,time)
	time = time or 10
	for i = 1,4 do
		rwing[i].DesiredAngle = tab[i]
		lwing[i].DesiredAngle = tab[i]
		rwing[i].MaxVelocity = math.abs(tab[i]-rwing[i].CurrentAngle)/time
		lwing[i].MaxVelocity = math.abs(tab[i]-lwing[i].CurrentAngle)/time
		local rcf = oc0[rwing[i]] * (tab[12+i] or CFrame.new())
		local lcf = oc0[lwing[i]] * (tab[12+i] or CFrame.new())
	end
	for i,v in pairs(rf1) do
		v.DesiredAngle = tab[9]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(lf1) do
		v.DesiredAngle = tab[9]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(rf2) do
		v.DesiredAngle = tab[10]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(lf2) do
		v.DesiredAngle = tab[10]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(rf3) do
		v.DesiredAngle = tab[11]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
	for i,v in pairs(lf3) do
		v.DesiredAngle = tab[11]
		v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time
	end
end
setwings(outhigh,1)
flying = false
moving = false
for i,v in pairs(tor:GetChildren()) do
	if v.ClassName:lower():match("body") then
		v:Destroy()
	end
end
local Hat = game.Players.LocalPlayer.Character:FindFirstChild('SoloWing')
if Hat then
Global.AlignPart(Hat.Handle,lm3,Vector3.new(-0.3, -0.5, 1),Vector3.new(0, 5, 20))
end
local Hat = game.Players.LocalPlayer.Character:FindFirstChild('SoloWing2')
if Hat then
Global.AlignPart(Hat.Handle,rm3,Vector3.new(0.3, 0.2, -1),Vector3.new(0, 200, -20))
end
local ctor = tor:Clone()
ctor:ClearAllChildren()
ctor.Name = "cTorso"
ctor.Transparency = 1
ctor.CanCollide = false
ctor.FormFactor = "Custom"
ctor.Size = Vector3.new(.2,.2,.2)
ctor.Parent = mod
weld(tor,ctor)
local bg = Instance.new("BodyGyro",ctor)
bg.maxTorque = Vector3.new()
bg.P = 15000
bg.D = 1000
local bv = Instance.new("BodyVelocity",ctor)
bv.maxForce = Vector3.new()
bv.P = 15000
vel = Vector3.new()
cf = CFrame.new()
flspd = 0
keysdown = {}
keypressed = {}
ktime = {}
descendtimer = 0
jumptime = tick()
hum.Jumping:connect(function()
if stopeverything then wait(math.huge) end
	jumptime = tick()
end)
cam = workspace.CurrentCamera
function mid(a,b,c)
	return math.max(a,math.min(b,c or -a))
end
function bn(a)
	return a and 1 or 0
end
function gm(tar)
	local m = 0
	for i,v in pairs(tar:GetChildren()) do
		if v:IsA("BasePart") then
			m = m + v:GetMass()
		end
		m = m + gm(v)
	end
	return m
end
reqrotx = 0
local grav = 196.2
local con
while not stopeverything and not alreadyfixing do
local obvel = tor.CFrame:vectorToObjectSpace(tor.Velocity)
local sspd,uspd,fspd = obvel.X,obvel.Y,obvel.Z
flying = true
if flying then
	local lfldir = fldir
	fldir = cam.CoordinateFrame:vectorToWorldSpace(Vector3.new(bn(keysdown.d)-bn(keysdown.a),0,bn(keysdown.s)-bn(keysdown.w))).unit
	local lmoving = moving
	moving = fldir.Magnitude > .1
	if lmoving and not moving then
		idledir = lfldir*Vector3.new(1,0,1)
		descendtimer = tick()
	end
	local dbomb = fldir.Y < -.6 or (moving and keysdown["1"])
	if moving and keysdown["0"] and lmoving then
		fldir = (Vector3.new(lfldir.X,math.min(fldir.Y,lfldir.Y+.01)-.1,lfldir.Z)+(fldir*Vector3.new(1,0,1))*.05).unit
	end
	local down = tor.CFrame:vectorToWorldSpace(Vector3.new(0,-1,0))
local descending = (not moving and keysdown["q"] and not keysdown[" "])
cf = ccomplerp(cf,CFrame.new(tor.Position,tor.Position+(not moving and idledir or fldir)),keysdown["0"] and .02 or .07)
local gdown = not dbomb and cf.lookVector.Y < -.2 and tor.Velocity.unit.Y < .05
local rotvel = CFrame.new(Vector3.new(),tor.Velocity):toObjectSpace(CFrame.new(Vector3.new(),fldir)).lookVector
bg.cframe = cf * CFrame.Angles(not moving and -.1 or -math.pi/2+.2,moving and mid(-2.5,rotvel.X/1.5) + reqrotx or 0,0)
reqrotx = reqrotx - reqrotx/10
local ani = tickwave(1.5,1)
vel = moving and cf.lookVector*flspd or Vector3.new()
flspd = math.min(120,lerp(flspd,moving and (fldir.Y<0 and flspd+(-fldir.Y)*grav/60 or math.max(50,flspd-fldir.Y*grav/300)) or 60,.4))
setwings(moving and (gdown and outlow or dbomb and divebomb) or (descending and veryhigh or flap1),15)
for i=1,4 do
rwing[i].C0 = clerp(rwing[i].C0,oc0[rwing[i]] * (gdown and CFrame.new() or dbomb and CFrame.Angles(-.5+bn(i==3)*.4+bn(i==4)*.5,.1+bn(i==2)*.5-bn(i==3)*1.1,bn(i==3)*.1) or descending and CFrame.Angles(.3,0,0) or CFrame.Angles((i*.1+1.5)*ani,ani*-.5,1*ani)),descending and .8 or .2)
lwing[i].C0 = clerp(lwing[i].C0,oc0[lwing[i]] * (gdown and CFrame.new() or dbomb and CFrame.Angles(-(-.5+bn(i==3)*.4+bn(i==4)*.5),-(.1+bn(i==2)*.5-bn(i==3)*1.1),bn(i==3)*.1) or descending and CFrame.Angles(-.3,0,0) or CFrame.Angles(-(i*.1+1.5)*ani,ani*.5,1*ani)),descending and .8 or .2)
end
local hit,ray = workspace:FindPartOnRayWithIgnoreList(Ray.new(tor.Position,Vector3.new(0,-3.5+math.min(0,bv.velocity.y)/30,0)),{Character})
else
bg.maxTorque = Vector3.new()
bv.maxForce = Vector3.new()
local ani = tickwave(walking and .8 or 4.5,1)
setwings(idle,10)
local x,y,z = fspd/160,uspd/700,sspd/900
for i=1,4 do
rwing[i].C0 = clerp(rwing[i].C0,oc0[rwing[i]] * CFrame.Angles(ani*.1 + -mid(-.1,x),0 + -mid(-.1,y) + bn(i==2)*.6,ani*.02 + -mid(-.1,z)),.2)
lwing[i].C0 = clerp(lwing[i].C0,oc0[lwing[i]] * CFrame.Angles(ani*-.05 + mid(-.1,x),0 + mid(-.1,y) + -bn(i==2)*.6,ani*.02 + mid(-.1,z)),.2)
end
if keypressed[" "] and not flying and (tick()-jumptime > .05 and (tick()-jumptime < 3 or hum.Jump)) then
vel = Vector3.new(0,50,0)
bv.velocity = vel
idledir = cam.CoordinateFrame.lookVector*Vector3.new(1,0,1)
cf = tor.CFrame * CFrame.Angles(-.01,0,0)
bg.cframe = cf
flystart = tick()
flying = true
end
end
keypressed = {}
swait()
end
end
coroutine.resume(coroutine.create(function()
fly()
end))
game:GetService("RunService").RenderStepped:Connect(function()
if stopeverything then wait(math.huge) end
	if not soundfixing then
		eeeblock.CFrame = Torso.CFrame
	end
	CurrentColor = GUN.NeonParts.Color
	shieldblock.CFrame = Torso.CFrame
	shieldblock.Size = Vector3.new(25+1*math.sin(sine/25),25+1*math.sin(sine/25),25+1*math.sin(sine/25))
	shieldblock.Color = CurrentColor
end)




RootPart.Anchored = false

while not stopeverything do
	if not alreadyfixing then
		if lplr.Name ~= USERNAME then
			antivoid.CanCollide = false
		end
	
		if not soundfixing then
			eeeblock.CFrame = Torso.CFrame
		
			if eee.Playing ~= true then
				eee.Playing = true
			end
			if eee.Looped ~= true then
				eee.Looped = true
			end
			if eee.EmitterSize ~= 50 then
				eee.EmitterSize = 50
			end
			if eee.MaxDistance ~= 100000 then
				eee.MaxDistance = 100000
			end
			if eee.PlayOnRemove ~= false then
				eee.PlayOnRemove = false
			end
		end
		local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
	Humanoid.HipHeight = 3
		Humanoid.PlatformStand = ISFLYING
		Humanoid.UseJumpPower = true
		Humanoid.JumpPower = 50
		Humanoid.WalkSpeed = walkspeed
	
		for i,v in pairs(Character:GetDescendants()) do
			if v:IsA("BasePart") then
				if not v:IsDescendantOf(Effects) and v ~= RootPart and v ~= VisibleBullet then
					v.Anchored = false
				elseif v == RootPart and lplr.Name == USERNAME then
					v.Anchored = false
				elseif v == RootPart and lplr.Name ~= USERNAME then
					v.Anchored = true
				end
			end
		end
	
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and v.Anchored == false and v.Position.Y < (workspace.FallenPartsDestroyHeight + 50) then
				local flot = Instance.new("BodyPosition")
				local spen = Instance.new("BodyGyro")
				local hu = math.huge
				flot.MaxForce = Vector3.new(hu,hu,hu)
				spen.MaxTorque = Vector3.new(hu,hu,hu)
				local spown = nil
				for o,b in pairs(workspace:GetDescendants()) do
					if not b:IsDescendantOf(Character) and b:IsA("SpawnLocation") then
						spown = b
					end
				end
				if spown then
					RootPart.CFrame = CFrame.new(spown.Position.X,spown.Position.Y+(spown.Size.Y/2)+6+Humanoid.HipHeight,spown.Position.Z)
				else
					local base = workspace:FindFirstChild("Base")
					if not base then
						base = workspace:FindFirstChild("Baseplate")
					end
					if base then
						RootPart.CFrame = CFrame.new(math.clamp(RootPart.Position.X,(-base.Size.X/2)+5,(base.Size.X/2)-5),base.Position.Y+(base.Size.Y/2)+6+Humanoid.HipHeight,math.clamp(RootPart.Position.Z,(-base.Size.X/2)+5,(base.Size.X/2)-5))
					else
						RootPart.CFrame = CFrame.new(math.clamp(RootPart.Position.X,-100,100),100,math.clamp(RootPart.Position.Z,-100,100))
					end
				end
				flot.Position = RootPart.Position
				flot.Parent = RootPart
				spen.CFrame = RootPart.CFrame
				spen.Parent = RootPart
				game:GetService("Debris"):AddItem(flot,1)
				game:GetService("Debris"):AddItem(spen,1)
			end
		end
		Torsovelocity = (ActualVelocity).Magnitude
		if lplr.Name == USERNAME then
			Torsovelocity = (RootPart.Velocity).Magnitude
		end 
		local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
		local TORSOVERTICALVELOCITY = RootPart.Velocity.y
		local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
		local sidevec = math.clamp((root.Velocity*root.CFrame.rightVector).X+(root.Velocity*root.CFrame.rightVector).Z,-hum.WalkSpeed,hum.WalkSpeed)
		local forwardvec =  math.clamp((root.Velocity*root.CFrame.lookVector).X+(root.Velocity*root.CFrame.lookVector).Z,-hum.WalkSpeed,hum.WalkSpeed)
		local sidevelocity = sidevec/hum.WalkSpeed
		local forwardvelocity = forwardvec/hum.WalkSpeed
		sine = sine + change
		walksine = walksine + walkc
		sine2 = sine2 + c2
		LOOPx = LOOPx + 5
		local sensitivity = 25
		if taunt.Value == "FAST BOIII" or taunt.Value == "OOOOO" or taunt.Value == "N4N" or taunt.Value == "N0X" or taunt.Value == "error?" or taunt.Value == "Sus" or taunt.Value == "unholy" or taunt.Value == "uncolored" or taunt.Value == "Xâ”X" or taunt.Value == "idk" or taunt.Value == "lcv1" or taunt.Value == "Banisher" or taunt.Value == "Banisher2" or taunt.Value == "mlc" or taunt.Value == "idkw" or taunt.Value == "|" then
			for i,v in pairs(Character.Wings:GetChildren()) do
				if v.Name == "Part" then
					v.Transparency = 1
					pcall(function()
						v.WingTrail.Enabled = false
					end)
				end
			end
		else
			for i,v in pairs(Character.Wings:GetChildren()) do
				if v.Name == "Part" then
					if v:FindFirstChildOfClass("SpecialMesh") then
						v.Transparency = 0
					end
					pcall(function()
						v.WingTrail.Enabled = true
					end)
				end
			end
		end
		local hit,pos = rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
		if taunt.Value == "None" or taunt.Value == "None2" then -- non
			change = 1
			--eeepitch = 1
			--eevol = 5
			sensitivity = 25
			if HipValLock == false then
				HipVal = 3
			end
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0 * CFrame.new(0,0,0),0.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-0.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),0.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(0.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-0.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			if attack == false then
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 + .5 * math.cos(sine/25))*CFrame.Angles(math.rad(0 - 1 * math.cos(sine/54*1.2)),math.rad(0 - 2 * math.cos(sine/54*1.5)),math.rad(-35)),1)
		Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(0 - 3 * math.cos(sine/54*1.2)),math.rad(0 - 4 * math.cos(sine/54*1.5)),math.rad(35)),1)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(75 + 8.5 * math.cos(sine/25)),math.rad(-20),math.rad(40)) * RIGHTSHOULDERC0,1)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(25 + 8.5 * math.cos(sine/25)),math.rad(0),math.rad(-25 - 5 * math.cos(sine/25))) * LEFTSHOULDERC0,1)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.7,0) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(180)),1)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 + .5 * math.cos(sine/25))*CFrame.Angles(math.rad(45),math.rad(0 - 2 * math.cos(sine/54*1.5)),math.rad(-30)),1)
				Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(-45 - 3 * math.cos(sine/54*1.2)),math.rad(0 - 4 * math.cos(sine/54*1.5)),math.rad(30)),1)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-45),math.rad(-2),math.rad(14)) * RIGHTSHOULDERC0,1)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-.5,.5,-.5) * CFrame.Angles(math.rad(89),math.rad(0),math.rad(89)) * LEFTSHOULDERC0,1)
				RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,0) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
				LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-.7) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
				GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 50
		elseif taunt.Value == "idk" then
			if HipValLock == false then
				HipVal = 3
			end
			--eeepitch = 1
			change = 1
			sensitivity = 25
			--eevol = 5
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if attack == false then
				if Torsovelocity < sensitivity/3.125 then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0*CFrame.new(0,0,0 - .5 * math.sin(sine/20))*CFrame.Angles(math.rad(-30.9-5*math.cos(sine/20)),0,0),.7/3)
				Neck.C0 = Clerp(Neck.C0,NECKC0*CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(35-2*math.cos(sine/20)),math.rad(0),math.rad(0)),0.7/3)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(15))* RIGHTSHOULDERC0, 1 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20 + 8.5 * math.cos(sine/20)),math.rad(0),math.rad(-25 - 5 * math.cos(sine/20))) * LEFTSHOULDERC0,0.7/3)
				RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(0 + 38 * math.cos(sine/20)),math.rad(80),math.rad(0))*CFrame.Angles(0,0,math.rad(15 - 25 * math.cos(sine/20))),0.7/3)
				LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-30.9 + 38 * math.cos(sine/20)),math.rad(-80),math.rad(0))*CFrame.Angles(0,0,math.rad(-15 + 25 * math.cos(sine/20))),0.7/3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-106.3+.9*math.sin(sine/32)),math.rad(0),math.rad(0)),1 / 2)
				elseif Torsovelocity >= sensitivity/3.125 then
					Anim = "Walk"
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0*CFrame.new(0,0,0 - .5 * math.sin(sine/12))*CFrame.Angles(math.rad(40-1*math.cos(sine/12)),0,0),.25)
					Neck.C0 = Clerp(Neck.C0,NECKC0*CFrame.new(0,-.25,0)*CFrame.Angles(math.rad(-40),0,0),.25)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.55, 0.5, 0.5) * CFrame.Angles(math.rad(250), math.rad(20), math.rad(-80))* RIGHTSHOULDERC0, 1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0)*CFrame.Angles(math.rad(-45),0,math.rad(-5-2*math.cos(sine/19)))*LEFTSHOULDERC0,.25)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-0.5,-0.5) * CFrame.Angles(math.rad(-5 + 9 * math.cos(sine/12)),math.rad(80),math.rad(0)),0.7/3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-9 + 9 * math.cos(sine/12)),math.rad(-80),math.rad(0)),0.7/3)
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 40
		elseif taunt.Value == "lcv1" then
			change = 1
			if HipValLock == false then
				HipVal = 0
			end
			Humanoid.HipHeight = 0
		
		
		if Torsovelocity < sensitivity then
				Anim = "Idle"
				if attack == false then
					RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0 + 0.05 * math.cos(sine / 12)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(0)),1 / 3)
					Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(-15 - 3 * math.cos(sine / 12)),math.rad(5),math.rad(0)),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5 + 0.1 * math.cos(sine / 12),0) * CFrame.Angles(math.rad(-53.75+1.75 * math.cos(sine / 12)),math.rad(0),math.rad(5)) * rscp,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5 + 0.1 * math.cos(sine / 12),-0) * CFrame.Angles(math.rad(15 - 1.5 * math.cos(sine / 12)),math.rad(0 - 6 * math.cos(sine / 12)),math.rad(0 - 6 * math.cos(sine / 12))) * lscp,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1.1 - 0.05 * math.cos(sine / 12),0) * CFrame.Angles(math.rad(15),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1.1 - 0.05 * math.cos(sine / 12),0) * CFrame.Angles(math.rad(10),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-106.3-.9*math.cos(sine/12)),math.rad(0),math.rad(0)),1 / 2)
				end
				elseif Torsovelocity >= sensitivity then
				Anim = "Walk"
				if attack == false then
					RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0 + 0.05 * math.cos(sine / 12)) * CFrame.Angles(math.rad(20),math.rad(0 + 2.5 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12))),1 / 3)
					Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(-20 - 3 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12))),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-60 - 5 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12)),math.rad(5 + 2.5 * math.cos(sine / 12))) * rscp,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0 - 0.2 * math.cos(sine / 12)) * CFrame.Angles(math.rad(20 - 45 * math.cos(sine / 12)),math.rad(0 - 10 * math.cos(sine / 12)),math.rad(0 + 2.5 * math.cos(sine / 12))) * lscp,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1 ,-1,0) * CFrame.Angles(math.rad(0),math.rad(85),math.rad(0)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-85),math.rad(0)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-93.75+7.25*math.cos(sine/12)),math.rad(0),math.rad(0)),1 / 2)
				end
			end
			GUN.Base.Transparency = 1
			GUN.GunAdditions.Transparency = 0
			GUN.NeonParts.Transparency = 0
			Humanoid.WalkSpeed = 10
		elseif taunt.Value == "mlc" then
			if HipValLock == false then
				HipVal = 3
			end
			--eeepitch = 1
			change = 1
			sensitivity = 25
			--eevol = 5
				RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
	
		
			if Torsovelocity < sensitivity then
				Anim = "Idle"
				if attack == false then
					RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0 + 0.05 * math.sin(sine / 32)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(0)),1 / 3)
					Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(-15 - 3 * math.cos(sine / 32)),math.rad(0),math.rad(0)),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5 + 0.1 * math.cos(sine / 32),0) * CFrame.Angles(math.rad(-53.75+1.75 * math.cos(sine / 32)),math.rad(0),math.rad(5)) * rscp,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5 + 0.1 * math.cos(sine / 32),-0) * CFrame.Angles(math.rad(15 - 1.5 * math.cos(sine / 32)),math.rad(0 - 6 * math.cos(sine / 32)),math.rad(0 - 6 * math.cos(sine / 32))) * lscp,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1.1 - 0.05 * math.sin(sine / 32),0) * CFrame.Angles(math.rad(15),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1.1 - 0.05 * math.sin(sine / 32),0) * CFrame.Angles(math.rad(10),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-106.3+.9*math.sin(sine/32)),math.rad(0),math.rad(0)),1 / 2)
				end
				elseif Torsovelocity >= sensitivity then
			
				if attack == false then
					RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0 + 0.05 * math.sin(sine / 12)) * CFrame.Angles(math.rad(15),math.rad(0 + 2.5 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12))),1 / 3)
					Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(-5 - 3 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12)),math.rad(0 - 2.5 * math.cos(sine / 12))),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(150),math.rad(0 - 2.5 * math.cos(sine / 12)),math.rad(5 + 2.5 * math.cos(sine / 12))) * rscp,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0 - 0.2 * math.cos(sine / 12)) * CFrame.Angles(math.rad(5 - 45 * math.cos(sine / 12)),math.rad(0 - 10 * math.cos(sine / 12)),math.rad(0 + 2.5 * math.cos(sine / 12))) * lscp,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1 ,-1,0) * CFrame.Angles(math.rad(0),math.rad(85),math.rad(0)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-85),math.rad(0)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
				end
			end
			GUN.Base.Transparency = 1
			GUN.GunAdditions.Transparency = 0
			GUN.NeonParts.Transparency = 0
			Humanoid.WalkSpeed = 10
		elseif taunt.Value == "N4N" then
			if HipValLock == false then
				HipVal = 3
			end
			--eeepitch = 1
			change = 1
			sensitivity = 25
			--eevol = 5
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,math.cos(sine/25),0-math.sin(sine/25))*CFrame.Angles(math.rad(5*math.sin(sine/25)),0,0),.25)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.Angles(math.rad(5*math.cos(sine/25)),0,0),.25)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0)*CFrame.Angles(math.rad(160),0,math.rad(15-5*math.sin(sine/25)))* RIGHTSHOULDERC0,.25)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0)*CFrame.Angles(0,0,math.rad(-15+5*math.sin(sine/25)))* LEFTSHOULDERC0,.25)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1-.1*math.sin(sine/25),-.01)*CFrame.Angles(0,math.rad(80),0),.25)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-.5-.25*math.sin(sine/25),-.51)*CFrame.Angles(math.rad(-10),math.rad(-80),0),.25)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				elseif Torsovelocity >= sensitivity then
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,math.cos(sine/25),0-math.sin(sine/25))*CFrame.Angles(math.rad(5*math.sin(sine/25)),0,math.rad(70)),.25)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.Angles(0,0,math.rad(-70))*CFrame.Angles(math.rad(5*math.cos(sine/25)),0,0),.25)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1,.5,-.25)*CFrame.Angles(0,math.rad(-10),math.rad(-90))* RIGHTSHOULDERC0,.25)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0)*CFrame.Angles(0,0,math.rad(-20+5*math.sin(sine/25)))* LEFTSHOULDERC0,.25)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1-.1*math.sin(sine/25),-.01)*CFrame.Angles(0,math.rad(80),0),.25)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-.5-.25*math.sin(sine/25),-.51)*CFrame.Angles(math.rad(-10),math.rad(-80),0),.25)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 50
		elseif taunt.Value == "Banisher2" then -- MrMaddox32's Anim
			if HipValLock == false then
				HipVal = 4
			end
			--eeepitch = 1
			change = 2 / Animation_Speed
			sensitivity = 25
			--eevol = 5
			WACKYEFFECT({Time = 12, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(0,0,0), Transparency = .5, Transparency2 = 1, CFrame = RightLeg.CFrame*CF(0,-1.45,0)*ANGLES(math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CurrentColor, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 12, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(0,0,0), Transparency = .5, Transparency2 = 1, CFrame = LeftLeg.CFrame*CF(0,-1.45,0)*ANGLES(math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CurrentColor, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 12, EffectType = "Block", Size = VT(3,3,3)/5, Size2 = VT(0,0,0), Transparency = .5, Transparency2 = 1, CFrame = GUN.Hole2.CFrame*CF(0,0,0)*ANGLES(math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999)),math.rad(MRANDOM(-9999,9999))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CurrentColor, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 1 * SIN(sine / 26)) * ANGLES(RAD(-25 - 2.5*COS(sine/26)), RAD(0), RAD(0)), 1 / 3)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25 - 1 * COS(sine / 26)), RAD(0), RAD(0)), 1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, .8) * ANGLES(RAD(-20), RAD(44), RAD(0))*ANGLES(0,0,RAD(-10)) * RIGHTSHOULDERC0, 1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-20), RAD(0), RAD(-12 + 4.10 * COS(sine / 26))) * LEFTSHOULDERC0, 1 / 3)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.5 - 0.02 * SIN(sine / 12), -0.5) * ANGLES(RAD(-5 - 2.5 * COS(sine / 26)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine / 12), -0.01) * ANGLES(RAD(5 - 2.5 * SIN(sine / 26)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / 3)	
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)), 1 / 3)
				elseif Torsovelocity >= sensitivity then
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 1 * SIN(sine / 26)) * ANGLES(RAD(50 - 2.5*SIN(sine/26)), RAD(0-RootPart.RotVelocity.y), RAD(0 - RootPart.RotVelocity.Y * 4.5 + 3 * COS(sine / 47))), 1 / 3)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-50 - 2.5 * SIN(sine / 26)), RAD(0-RootPart.RotVelocity.y), RAD(0 - RootPart.RotVelocity.Y)), 1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.3, 0) * ANGLES(RAD(-15), RAD(0), RAD(12 - 4.10 * SIN(sine / 26))) * RIGHTSHOULDERC0, 1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.3, 0) * ANGLES(RAD(-15), RAD(0), RAD(-12 + 4.10 * SIN(sine / 26))) * LEFTSHOULDERC0, 1 / 3)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.4 - 0.02 * SIN(sine / 26), -0.5) * ANGLES(RAD(-10 - 2.5 * SIN(sine / 26)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine / 26), -0.01) * ANGLES(RAD(-20 - 2.5 * SIN(sine / 26)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / 3)	
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)), 1 / 3)
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 200
		elseif taunt.Value == "N0X" then
			--eeepitch = 1
			--eevol = 5
			change = 1
			sensitivity = 10
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				if HipValLock == false then
					HipVal = 0
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,.05*math.cos(sine/12))*CFrame.Angles(math.rad(15),0,0),1 / 3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.Angles(math.rad(-15-3*math.cos(sine/12)),math.rad(5-5*math.sin(sine/12)),0),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5+0.1*math.cos(sine/12),0)*CFrame.Angles(math.rad(-53.75+1.75*math.cos(sine/12)),0,math.rad(5))* RIGHTSHOULDERC0,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5+.1*math.sin(sine/12),0)*CFrame.Angles(math.rad(15),0,math.rad(-5+5*math.cos(sine/12)))* LEFTSHOULDERC0,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1-.06*math.cos(sine/12),-.01)*CFrame.Angles(math.rad(10),math.rad(80),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1-.06*math.cos(sine/12),-.01)*CFrame.Angles(math.rad(20),math.rad(-80),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15)*CFrame.Angles(math.rad(-106.3-.9*math.cos(sine/12)),0,0),.25)
				elseif Torsovelocity >= sensitivity then
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,.125*math.sin(sine/12),0)*CFrame.Angles(math.rad(10-5*math.cos(sine/12)),math.rad(-10*math.cos(sine/12)),math.rad(-5*math.cos(sine/12))),.25)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.Angles(math.rad(10-5*math.cos(sine/12)),math.rad(10*math.cos(sine/12)),math.rad(5*math.cos(sine/12))),.25)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5+.2*math.sin(sine/12),-.25)*CFrame.Angles(math.rad(165-15*math.cos(sine/12)),math.rad(-10+5*math.sin(sine/12)),math.rad(10))* RIGHTSHOULDERC0,.25)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5-.15*math.cos(sine/12),.5*math.sin(sine/12))*CFrame.Angles(math.rad(-30*math.sin(sine/12)),math.rad(5*math.cos(sine/12)),0)* LEFTSHOULDERC0,.25)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.9-.2*math.cos(sine/12),.5*math.sin(sine/12))*CFrame.Angles(math.rad(-10-40*math.sin(sine/12)),math.rad(90+5*math.cos(sine/12)),math.rad(2.5*math.cos(sine/12))),.25)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-.9+.2*math.cos(sine/12),-.5*math.sin(sine/12))*CFrame.Angles(math.rad(-10+40*math.sin(sine/12)),math.rad(-90+5*math.cos(sine/12)),math.rad(2.5*math.cos(sine/12))),.25)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
			end
			Humanoid.WalkSpeed = 16
		elseif taunt.Value == "aEa" then
			--eeepitch = 1
			local ADD = Humanoid.WalkSpeed*2
			change = 2 / Animation_Speed
			sensitivity = 25
			if HipValLock == false then
				HipVal = 3
			end
			--eevol = 5
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+0.5*COS(sine / 15)) * ANGLES(RAD(0), RAD(0), RAD(0)), 5.15 / 9)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 - 0.1 * COS(sine / 5) + ((1) - 1)) * ANGLES(RAD(30 - 2.5 * SIN(sine / 12)), RAD(10 * COS(sine / 12)), RAD(0)), 5.15 / 9)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.55, 0.5, 0.5) * CFrame.Angles(math.rad(250), math.rad(20), math.rad(-80))* RIGHTSHOULDERC0, 1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.15 * COS(sine / 12), 0) * ANGLES(RAD(180 - 3.5 * SIN(sine / 12)), RAD(0 - 8.5 * SIN(sine / 12)), RAD(20 + 8.5 * SIN(sine / 12))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-.001*COS(sine / 7), -0.01) * ANGLES(RAD(-10-2.5*math.cos(sine/60)), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -.5-.001*math.cos(sine/7), -0.5) * ANGLES(RAD(-25-2.5*math.cos(sine/60)), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-120),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity then
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0,0+0.5*COS(sine / 15))*ANGLES(RAD(25+2.5*COS(sine / 12)),RAD(0-RootPart.RotVelocity.y),RAD(0 - RootPart.RotVelocity.Y * 4.5 + 3 * COS(sine / 47))), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 - 0.1 * COS(sine / 5) + ((1) - 1)) * ANGLES(RAD(-30 - 2.5 * SIN(sine / 12)), RAD(10 * COS(sine / 12)), RAD(0)), 5.15 / 9)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.55, 0.5, 0.5) * CFrame.Angles(math.rad(250), math.rad(20), math.rad(-80))* RIGHTSHOULDERC0, 1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.15 * COS(sine / 12), 0) * ANGLES(RAD(180 - 3.5 * SIN(sine / 12)), RAD(0 - 8.5 * SIN(sine / 12)), RAD(20 + 8.5 * SIN(sine / 12))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-.001*COS(sine / 7), -0.01) * ANGLES(RAD(-20-2.5*math.cos(sine/60)), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -.5-.001*math.cos(sine/7), -0.5) * ANGLES(RAD(-35-2.5*math.cos(sine/60)), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-120),math.rad(0),math.rad(0)),1/2)
				end
			end
			Humanoid.WalkSpeed = 45
			GUN.Base.Transparency = 1
			GUN.GunAdditions.Transparency = 0
			GUN.NeonParts.Transparency = 0
		elseif taunt.Value == "Insanity" then
			if HipValLock == false then
				HipVal = 3
			end
			--eeepitch = 1
			change = 1
			sensitivity = 25
			--eevol = 5
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if attack == false then
				if Torsovelocity < sensitivity/3.125 then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(20),math.rad(0),math.rad(0)),0.7/3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(20),math.rad(10*math.cos(sine/100)),math.rad(0)),1)
					if math.random(1,40) == 1 then
						Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(20+math.random(-20,20)),math.rad((10*math.cos(sine/100))+math.random(-20,20)),math.rad(math.random(-20,20))),1)
					end
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(170-4*math.sin(sine/50)),math.rad(0),math.rad(0)) * RIGHTSHOULDERC0,0.7/3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(20),math.rad(0),math.rad(-10-10*math.sin(sine/50))) * LEFTSHOULDERC0,0.7/3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,-0.01) * CFrame.Angles(math.rad(10),math.rad(80),math.rad(10+10*math.sin(sine/50))),1/3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-0.01) * CFrame.Angles(math.rad(20),math.rad(-80),math.rad(-10-10*math.sin(sine/50))),1/3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity/3.125 then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 - .5 * math.sin(sine/50)) * CFrame.Angles(math.rad(20),math.rad(0),math.rad(0)),0.7/3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-41.6-4*math.sin(sine/50)),math.rad(0),math.rad(0)) * RIGHTSHOULDERC0,0.7/3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(20),math.rad(0),math.rad(-10-10*math.sin(sine/50))) * LEFTSHOULDERC0,0.7/3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,-0.01) * CFrame.Angles(math.rad(-20),math.rad(80),math.rad(10+10*math.sin(sine/50))),1/3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-0.01) * CFrame.Angles(math.rad(-10),math.rad(-80),math.rad(-10-10*math.sin(sine/50))),1/3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = walkspeed/3.125
		elseif taunt.Value == "Banisher" then -- Pastel Shooter, Good Script.
			if HipValLock == false then
				HipVal = 0
			end
			--eeepitch = 1
			change = 2 / Animation_Speed
			sensitivity = 10
			--eevol = 5
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if attack == false then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity/3.125 then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , 00 + 0.2 * COS(sine / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(30), RAD(0), RAD(0 + 25 * COS(sine / 20))), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+ 0.35 * SIN(sine / 12), 0) * ANGLES(RAD(180), RAD(-15), RAD(0))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.35 * SIN(sine / 12), 0) * ANGLES(RAD(0), RAD(0), RAD(-10 + 15 * COS(sine / 12))) * ANGLES(RAD(0), RAD(15), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1- 0.2 * COS(sine / 12), 0) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1- 0.2 * COS(sine / 12) , 0) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity/3.125 then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,.125*math.sin(sine/12),0)*CFrame.Angles(math.rad(10-5*math.cos(sine/12)),math.rad(-10*math.cos(sine/12)),math.rad(-5*math.cos(sine/12))),.25)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.Angles(math.rad(10-5*math.cos(sine/12)),math.rad(10*math.cos(sine/12)),math.rad(5*math.cos(sine/12))),.25)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-40-10*math.cos(sine/12)),math.rad(-10+5*math.sin(sine/12)),math.rad(10))* RIGHTSHOULDERC0,.25)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5-.15*math.cos(sine/12),.5*math.sin(sine/12))*CFrame.Angles(math.rad(-30*math.sin(sine/12)),math.rad(5*math.cos(sine/12)),0)* LEFTSHOULDERC0,.25)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.9-.2*math.cos(sine/12),.5*math.sin(sine/12))*CFrame.Angles(math.rad(-10-40*math.sin(sine/12)),math.rad(90+5*math.cos(sine/12)),math.rad(2.5*math.cos(sine/12))),.25)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-.9+.2*math.cos(sine/12),-.5*math.sin(sine/12))*CFrame.Angles(math.rad(-10+40*math.sin(sine/12)),math.rad(-90+5*math.cos(sine/12)),math.rad(2.5*math.cos(sine/12))),.25)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
			end
			Humanoid.WalkSpeed = 16
		elseif taunt.Value == "idkw" then -- ok....
			if HipValLock == false then
				HipVal = 0
			end
			--eeepitch = 1
			change = 2 / Animation_Speed
			sensitivity = 10
			--eevol = 5
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if attack == false then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity/3.125 then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + .1 * COS(sine / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(30), RAD(0), RAD(0 + 25 * COS(sine / 20))), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.35 * SIN(sine / 12), 0) * ANGLES(RAD(0), RAD(0), RAD(10 - 5 * COS(sine / 12))) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-.95, 0.5, 0.3) * ANGLES(RAD(-20), RAD(0), RAD(35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - .1 * COS(sine / 12), 0) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - .1 * COS(sine / 12), 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity/3.125 then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 + .25*Cos(sine/63)+.92*Sin(sine/95), 0, 1 + 1 * SIN(sine / 53)) * ANGLES(RAD(70), RAD(0-RootPart.RotVelocity.y), RAD(0 - RootPart.RotVelocity.Y * 4.5 + 3 * COS(sine / 47))), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(sine / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12 - 4.10 * SIN(sine / 12))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12 + 4.10 * SIN(sine / 12))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.5 - 0.02 * SIN(sine / 12), -0.5) * ANGLES(RAD(-10 - 2.5 * SIN(sine / 21)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine / 12), -0.01) * ANGLES(RAD(-20 - 2.5 * SIN(sine / 51)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)	
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
				else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 16
		elseif taunt.Value == "unholy" then
			if cannecksnap == true then
			local snap = math.random(1,6)
			local snap2 = math.random(1,2)
			if snap == 1 then
				Neck.C0 = Clerp(Neck.C0,NECKC0*CF(0,0,0)*ANGLES(math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000))),1/Animation_Speed)
			end
			if snap2 == 1 then
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, -0.6) * ANGLES(math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, -0.6) * ANGLES(math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
				end
			end
			change = 2 / Animation_Speed
			--eeepitch = 1
			--eevol = 5
			sensitivity = 25
			if HipValLock == false then
				HipVal = 3
			end
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0 * CFrame.new(0,0,0),0.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-0.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),0.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(0.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-0.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			if attack == false then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 1 * SIN(sine / 26)) * ANGLES(RAD(25 - 2.5*SIN(sine/24)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(sine / 12*5)), RAD(0), RAD(math.random(-5,5))), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, -0.6) * ANGLES(RAD(165), RAD(0), RAD(-50)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, -0.6) * ANGLES(RAD(165), RAD(0), RAD(50)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.5 - 0.02 * SIN(sine / 12), -0.5) * ANGLES(RAD(-70 - 2.5 * SIN(sine / 32)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine / 12), -0.01) * ANGLES(RAD(-70 - 2.5 * SIN(sine / 16)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 1 * SIN(sine / 26)) * ANGLES(RAD(25 - 2.5*SIN(sine/24)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(math.random(-5,5))), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(10), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(10), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.5 - 0.02 * SIN(sine / 12), -0.5) * ANGLES(RAD(-70 - 2.5 * SIN(sine / 32)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine / 12), -0.01) * ANGLES(RAD(-70 - 2.5 * SIN(sine / 16)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				end
			else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 30
		elseif taunt.Value == "uncolored" then
			change = 2 / Animation_Speed
			--eeepitch = .75
			--eevol = 5
			sensitivity = 25
			if HipValLock == false then
				HipVal = 2
			end
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0 * CFrame.new(0,0,0),0.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-0.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),0.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(0.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-0.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			if attack == false then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					snap = math.random(1,6)
					if snap == 1 then
						Neck.C0 = Clerp(Neck.C0,NECKC0*CF(0,0,0+((1)-1))*ANGLES(math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000)),math.rad(math.random(-10000,10000))),1/Animation_Speed)
					end
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0,0+.5*COS(sine / 32))*ANGLES(RAD(-25 + 2*Cos(sine/42)),RAD(0),RAD(0)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-2.5+1*COS(sine / 12)), RAD(MRANDOM(-5,5)), RAD(0)), 1 / Animation_Speed) 
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-30), RAD(0), RAD(15 - 5.5 * COS(sine / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-30), RAD(0), RAD(-15 + 5.5 * COS(sine / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.2) * ANGLES(RAD(-30+2*Cos(sine/32)), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.2) * ANGLES(RAD(-30+2*Cos(sine/46)), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 + .25*Cos(sine/63)+.92*Sin(sine/95), 0, 1 + 1 * SIN(sine / 53)) * ANGLES(RAD(70), RAD(0-RootPart.RotVelocity.y), RAD(0 - RootPart.RotVelocity.Y * 4.5 + 3 * COS(sine / 47))), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(sine / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12 - 4.10 * SIN(sine / 12))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12 + 4.10 * SIN(sine / 12))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.5 - 0.02 * SIN(sine / 12), -0.5) * ANGLES(RAD(-10 - 2.5 * SIN(sine / 21)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine / 12), -0.01) * ANGLES(RAD(-20 - 2.5 * SIN(sine / 51)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)	
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				end
			else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 120
		elseif taunt.Value == "error?" then
			change = 2 / Animation_Speed
			--eeepitch = 1
			--eevol = 5
			if HipValLock == false then
				HipVal = 1
			end
			sensitivity = 25
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0 * CFrame.new(0,0,0),0.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-0.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),0.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(0.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-0.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			if attack == false then
				if math.random(1,3) == 1 then
					WACKYEFFECT({TIME = MRANDOM(15,25)*2, EffectType = "Sphere", Size = VT(3 + 2 * COS(sine2/4),3 + 2 * COS(sine2/4),3 + 2 * COS(sine2/4)), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = -11, CFrame = CF(RootPart.Position-VT(MRANDOM(-20,20),2,MRANDOM(-20,20))), MoveToPos = Torso.Position+VT(0,MRANDOM(45,145)/1.5,0), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(0,math.random(0,255),0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
					WACKYEFFECT({TIME = MRANDOM(0,22), EffectType = "Sphere", Size = VT(2 + 2 * COS(sine2/4),5 + 2 * COS(sine2/4),2 + 2 * COS(sine2/4)), Size2 = VT(-3,-6,-4), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1,0) * ANGLES(RAD(MRANDOM(-360,360)), RAD(MRANDOM(-360,360)), RAD(MRANDOM(-360,360))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-22,22), RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(0,math.random(0,255),0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					--WACKYEFFECT({Time = 2.5, EffectType = "Sphere", Size = VT(7+eee.PlaybackLoudness/25,0.55,7+eee.PlaybackLoudness/25), Size2 = VT(7+eee.PlaybackLoudness/25,0.55,7+eee.PlaybackLoudness/25), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromHSV(Hue/360,1,math.clamp(eee.PlaybackLoudness/950,0,1)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 + .5 * math.cos(sine/25))*CFrame.Angles(math.rad(0 - 1 * math.cos(sine/54*1.2)),math.rad(0 - 2 * math.cos(sine/54*1.5)),math.rad(-35)),1)
		Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(0 - 3 * math.cos(sine/54*1.2)),math.rad(0 - 4 * math.cos(sine/54*1.5)),math.rad(35)),1)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(75 + 8.5 * math.cos(sine/25)),math.rad(-40),math.rad(40)) * RIGHTSHOULDERC0,1)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(25 + 8.5 * math.cos(sine/25)),math.rad(0),math.rad(-25 - 5 * math.cos(sine/25))) * LEFTSHOULDERC0,1)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,-.5) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.7,0) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(180)),1)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					--WACKYEFFECT({Time = 2.5, EffectType = "Sphere", Size = VT(7+eee.PlaybackLoudness/25,0.55,7+eee.PlaybackLoudness/25), Size2 = VT(7+eee.PlaybackLoudness/25,0.55,7+eee.PlaybackLoudness/25), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromHSV(Hue/360,1,math.clamp(eee.PlaybackLoudness/950,0,1)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 + .25*Cos(sine2/63)+.92*Sin(sine2/95), 0, 0 + 1 * SIN(sine2 / 53)) * ANGLES(RAD(70), RAD(0-RootPart.RotVelocity.y), RAD(0 - RootPart.RotVelocity.Y * 4.5 + 3 * COS(sine2 / 47))), 0.15 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(sine2 / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12 - 4.10 * SIN(sine2 / 12))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12 + 4.10 * SIN(sine2 / 12))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -.5 - 0.02 * SIN(sine2 / 12), -0.5) * ANGLES(RAD(-10 - 2.5 * SIN(sine2 / 21)), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.02 * SIN(sine2 / 12), -0.01) * ANGLES(RAD(-20 - 2.5 * SIN(sine2 / 51)), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)	
					-----------------
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 + .5 * math.cos(sine/25))*CFrame.Angles(math.rad(45),math.rad(0 - 2 * math.cos(sine/54*1.5)),math.rad(-30)),1)
				Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(-45 - 3 * math.cos(sine/54*1.2)),math.rad(0 - 4 * math.cos(sine/54*1.5)),math.rad(30)),1)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-45),math.rad(-2),math.rad(14)) * RIGHTSHOULDERC0,1)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-.5,.5,-.5) * CFrame.Angles(math.rad(89),math.rad(0),math.rad(89)) * LEFTSHOULDERC0,1)
				RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-.5,0) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
				LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-.7) * CFrame.Angles(math.rad(-15 + 9 * math.sin(sine/25)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.sin(sine/25)),math.rad(0),math.rad(0)),1)
				GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
			else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			Humanoid.WalkSpeed = 70
		elseif taunt.Value == "Err0r" then
			if HipValLock == false then
			HipVal = 3
			end
			--eeepitch = 1
			change = 1
			--eevol = 5
			sensitivity = 25
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
		   Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
		   RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
		   LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
		   RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
		   LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					local headsnap = math.random(1,60);
					local headsnapping=false;
					if headsnap == 1 then
						Neck.C0 = Clerp(Neck.C0, NECKC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.random(500,500)), math.rad(math.random(500,500)), math.rad(math.random(500,500))), 1)headsnapping=true headsnapping=false
					end
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(sine / 12)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-0)), 1 / 3)
				   Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0, 0, 0 + ((1) - 1)) *CFrame.Angles(math.rad(20 - 2.5 * math.sin(sine / 12)), math.rad(0), math.rad(30 *math.cos(sine/12))), 1 / 3)
				   RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.55, 0.5, 0.5) * CFrame.Angles(math.rad(250), math.rad(20), math.rad(-80))* RIGHTSHOULDERC0, 1 / 3)
				   LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(20),math.rad(0),math.rad(-10-10*math.sin(sine/50))) * LEFTSHOULDERC0,0.7/3)
				   RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(sine / 12), -0.01) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-8), math.rad(0), math.rad(0)), 1 / 3)
				   LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(sine / 12), -0.01) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-8), math.rad(0), math.rad(0)), 1 / 3)
				   GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-106.3-.9*math.cos(sine/12)),math.rad(0),math.rad(0)),1 / 2)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					local headsnap = math.random(1,60);
					local headsnapping=false;
					if headsnap == 1 then
						Neck.C0 = Clerp(Neck.C0, NECKC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.random(500,500)), math.rad(math.random(500,500)), math.rad(math.random(500,500))), 1)headsnapping=true headsnapping=false
					end
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(10 - 2* math.sin(sine / 3)), math.rad(0), math.rad(0-5 * math.sin(sine / 6))),0.8)
				   RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.55, 0.5, 0.5) * CFrame.Angles(math.rad(250), math.rad(20), math.rad(-80))* RIGHTSHOULDERC0,1)
				   LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(-12)) * LEFTSHOULDERC0,0.8)
				   RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0, 0, -0.1+0.15* math.sin(sine / 3)) * CFrame.Angles(math.rad(15+3 * math.sin(sine / 3)), math.rad(0), math.rad(0+5 * math.sin(sine / 6))),0.8)
				   RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1 , -1, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-5 + 70 * math.sin(sine / 6))),0.8)
				   LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(5 + 70 * math.sin(sine / 6))),0.8)
				   GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			walkspeed = 50
		elseif taunt.Value == "Glitch" then
			if HipValLock == false then
			HipVal = 3
			end
			--eeepitch = 1
			--eevol = 5
			change = 1
			sensitivity = 25
			WACKYEFFECT({Time = 1, EffectType = "Block", Size =VT(1+eee.PlaybackLoudness/3000,1+eee.PlaybackLoudness/300,1+eee.PlaybackLoudness/300), Size2 = VT(1+eee.PlaybackLoudness/3000,1+eee.PlaybackLoudness/300,1+eee.PlaybackLoudness/300), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0+9*math.sin(sine/55),0+2*math.sin(sine/75),0+9*math.cos(sine/55))*CFrame.Angles(math.rad(-sine*1),math.rad(-sine*2),math.rad(-sine*3)), MoveToPos = nil, RotationX = nil, RotationY = 0, RotationZ = 0, Material = "Neon", Color = GUN.NeonParts.Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 1, EffectType = "Block", Size = VT(1+eee.PlaybackLoudness/3000,1+eee.PlaybackLoudness/300,1+eee.PlaybackLoudness/300), Size2 = VT(1+eee.PlaybackLoudness/3000,1+eee.PlaybackLoudness/300,1+eee.PlaybackLoudness/300), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0-9*math.sin(sine/55),0-2*math.sin(sine/75),0-9*math.cos(sine/55))*CFrame.Angles(math.rad(-sine*1),math.rad(-sine*2),math.rad(-sine*3)), MoveToPos = nil, RotationX = nil, RotationY = 0, RotationZ = 0, Material = "Neon", Color = GUN.NeonParts.Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0 * CFrame.new(0,0,0),0.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-0.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),0.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(0.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-0.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			if attack == false then
				if Torsovelocity < sensitivity/3.125 then
					Anim = "Idle"
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.65,-.15) * CFrame.Angles(math.rad(-190.3-.9*math.cos(sine/16)),math.rad(45),math.rad(0)),1 / 2)
						Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(2 + 6.0 * SIN(sine / 15)), RAD(0), RAD(-25)), 3 / Animation_Speed)
						RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0- 0.1 * COS(sine / 30), 0 + 0.1 * COS(sine / 15)) * ANGLES(RAD(0+ 5 * COS(sine / 30)), RAD(0), RAD(25)), 1 / Animation_Speed)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0+6.0 * COS(sine / 30)), RAD(0), RAD(12))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0+6.0 * COS(sine / 30)), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
						RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.1 * COS(sine / 15), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-6-2.5 * COS(sine / 30)), RAD(0), RAD(0+ 5 * COS(sine / 30))), 1 / Animation_Speed)
						LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.1 * COS(sine / 15), -0.01) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-6+2.5 * COS(sine / 30)), RAD(0), RAD(0- 5 * COS(sine / 30))), 1 / Animation_Speed)
				elseif Torsovelocity >= sensitivity/3.125 then
					Anim = "Walk"
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.65,-.15) * CFrame.Angles(math.rad(-190.3-.9*math.cos(sine/16)),math.rad(45),math.rad(0)),1 / 2)
						Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2* SIN(sine / 6)), RAD(0), RAD(0-1*COS(sine / 12))), 0.8 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-1+1* SIN(sine / 12)), RAD(20), RAD(12+2*SIN(sine / 12))) * RIGHTSHOULDERC0, 0.8 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0+25* SIN(sine / 12)), RAD(0), RAD(-12-5*COS(sine / 6))) * LEFTSHOULDERC0, 0.8 / 3)
						RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1+0.1* COS(sine / 6)) * ANGLES(RAD(5-1*math.cos(sine/12)), RAD(0+1*COS(sine / 12)), RAD(0-2*SIN(sine / 12))), 0.8 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0-0.07*SIN(sine/12)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(-5), RAD(-5 + 45 * SIN(sine / 12))), 0.8 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0+0.07*SIN(sine/12)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(5), RAD(5 + 45 * SIN(sine / 12))), 0.8 / 3)
				end
				local partnum = math.random(1,48)
				coroutine.resume(coroutine.create(function()
					local wingpart = Character.Wings:GetChildren()[partnum]
					wingpart.Color = GUN.NeonParts.Color
					swait()
					if not alreadyfixing then
						wingpart.Color = MAINRUINCOLOR
					end
				end))
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			walkspeed = 50
		elseif taunt.Value == "Xâ”X" then
			if HipValLock == false then
			HipVal = 2
			end
			--eeepitch = .8
			--eevol = 5
			change = 2 / Animation_Speed
			sensitivity = 25
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 6.5 * SIN(sine / 15)), RAD(10 * SIN(sine/32)), RAD(-10 + 5.5 * SIN(sine /15))), 3 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0 - 5.5 * SIN(sine/12)), RAD(5 * SIN(sine /12)), RAD(22 + 4.4 * SIN(sine /12))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0- 5.5 * SIN(sine /12)), RAD(5 * SIN(sine /12)), RAD(-22 + 4.4 * SIN(sine/12))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 1 * COS(sine / 39)) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.8 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(80+10* SIN(sine / 78)), RAD(0)) * ANGLES(RAD(-3+1* SIN(sine / 58)), RAD(0), RAD(2.5+8 * SIN(sine / 43))), 0.8 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5, -0.5) * ANGLES(RAD(0), RAD(-80-10* SIN(sine / 81)), RAD(0)) * ANGLES(RAD(-3+1* SIN(sine / 63)), RAD(0), RAD(0+15 * SIN(sine / 49))), 0.8 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif Torsovelocity >= sensitivity then
					RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.5 * COS(sine / 24)) * ANGLES(RAD(24), RAD(-5 * SIN(sine / 24)), RAD(0)), 0.4 / Animation_Speed*3)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-24), RAD(5 * SIN(sine / 24)), RAD(MRANDOM(-5.5,5.5))), 0.2)			
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.15 * COS(sine / 24), 0) * ANGLES(RAD(-45), RAD(0), RAD(14 + 6.5* SIN(sine / 24)))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.15 * COS(sine / 24), 0) * ANGLES(RAD(-45), RAD(0), RAD(-14 - 6.5 * SIN(sine / 24))) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.1 * COS(sine / 24), 0) * ANGLES(RAD(-25), RAD(78), RAD(0)) * ANGLES(RAD(-5 * SIN(sine / 24)), RAD(0), RAD(5)), 0.4 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.3 - 0.1 * COS(sine / 24), -0.5) * ANGLES(RAD(0), RAD(-78), RAD(0)) * ANGLES(RAD(-5 * SIN(sine / 24)), RAD(0), RAD(5)), 0.4 / Animation_Speed)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				end
			else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			walkspeed = 100
		elseif taunt.Value == "|" then -- ah yes, anims made by MrMaddox32
			if HipValLock == false then
				HipVal = 0
			end
			--eeepitch = .8
			--eevol = 5
			change = 2/Animation_Speed
			sensitivity = 10
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if RootPart.Velocity.y > 1 and hit == nil then 
					Anim = "Jump"
					if attack == false then
						RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
						Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(-25),math.rad(0),math.rad(0)),1 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(50),math.rad(0),math.rad(25 + 10 * math.cos(sine / 12))) * rscp,1 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(50),math.rad(0),math.rad(-25 - 10 * math.cos(sine / 12))) * lscp,1 / 3)
						RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-0.4,-0.6) * CFrame.Angles(math.rad(1),math.rad(90),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(sine / 6)),math.rad(0),math.rad(0)),1 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-85),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(sine / 6)),math.rad(0),math.rad(0)),1 / 3)
						GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
					end
				elseif RootPart.Velocity.y < -1 and hit == nil then 
					Anim = "Fall"
					if attack == false then
						RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(0)),1 / 3)
						Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(0)),1 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35 - 4 * math.cos(sine / 6)),math.rad(0),math.rad(45 + 10 * math.cos(sine / 12))) * rscp,1 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(35 - 4 * math.cos(sine / 6)),math.rad(0),math.rad(-45 - 10 * math.cos(sine / 12))) * lscp,1 / 3)
						RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-0.3,-0.7) * CFrame.Angles(math.rad(-25 + 5 * math.sin(sine / 12)),math.rad(90),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(sine / 6)),math.rad(0),math.rad(0)),1 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-0.8,-0.3) * CFrame.Angles(math.rad(-10),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(sine / 6)),math.rad(0),math.rad(0)),1 / 3)
						GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
					end
				elseif Torsovelocity < sensitivity then
					Anim = "Idle"
					if attack == false then
						if math.random(1,50)==1 then
							LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5+math.random(-5,5),0.5+math.random(-5,5),0+math.random(-5,5)) * CFrame.Angles(math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999))) * LEFTSHOULDERC0,0.7/3)
						end
						if math.random(1,50)==1 then
							Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0+math.random(-5,5),0+math.random(-5,5),0+math.random(-5,5)) * ANGLES(RAD(math.random(-99999,9999)), RAD(math.random(-99999,9999)), RAD(math.random(-99999,9999))), 0.2)			
						end
						if math.random(1,50)==1 then
							RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5+math.random(-5,5),0.5+math.random(-5,5),0+math.random(-5,5)) * CFrame.Angles(math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999))) * RIGHTSHOULDERC0,0.7/3)
						end
						RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0,0+.1*COS(sine / 12))*ANGLES(RAD(0),RAD(0),RAD(0)), 0.8 / Animation_Speed)
						Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 6.5 * SIN(sine / 15)), RAD(10 * SIN(sine/32)), RAD(-10 + 5.5 * SIN(sine /15))), 0.8 / Animation_Speed)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0 - 5.5 * SIN(sine/12)), RAD(5 * SIN(sine /12)), RAD(22 + 4.4 * SIN(sine /12))) * RIGHTSHOULDERC0, 0.8 / Animation_Speed)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0- 5.5 * SIN(sine /12)), RAD(5 * SIN(sine /12)), RAD(-22 + 4.4 * SIN(sine/12))) * LEFTSHOULDERC0, 0.8 / Animation_Speed)
						RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-.1*COS(sine / 12), -0.01) * ANGLES(RAD(0), RAD(80-5*math.sin(sine/12)), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.8 / Animation_Speed)
						LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-.1*COS(sine  / 12), -0.01) * ANGLES(RAD(0), RAD(-80 + 5*math.sin(sine/12)), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
						GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
					end
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					if attack == false then
						if math.random(1,50)==1 then
							LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5+math.random(-5,5),0.5+math.random(-5,5),0+math.random(-5,5)) * CFrame.Angles(math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999))) * LEFTSHOULDERC0,0.7/3)
						end
						if math.random(1,50)==1 then
							Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0+math.random(-5,5),0+math.random(-5,5),0+math.random(-5,5)) * ANGLES(RAD(math.random(-99999,9999)), RAD(math.random(-99999,9999)), RAD(math.random(-99999,9999))), 0.2)			
						end
						if math.random(1,50)==1 then
							RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5+math.random(-5,5),0.5+math.random(-5,5),0+math.random(-5,5)) * CFrame.Angles(math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999)),math.rad(math.random(-99999,9999))) * RIGHTSHOULDERC0,0.7/3)
						end
						Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2* SIN(sine / 6)), RAD(0), RAD(0)), 0.8 / Animation_Speed)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0-25* SIN(sine / 12)), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.8 / Animation_Speed)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0+25* SIN(sine / 12)), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.8 / Animation_Speed)
						RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1+0.1* COS(sine / 6)) * ANGLES(RAD(5-1*math.cos(sine/12)), RAD(0), RAD(0)), 0.8 / Animation_Speed)
						RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0-0.07*SIN(sine/12)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(-5), RAD(-5 + 45 * SIN(sine / 12))), 0.8 / Animation_Speed)
						LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0+0.07*SIN(sine/12)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(5), RAD(5 + 45 * SIN(sine / 12))), 0.8 / Animation_Speed)
						GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
					end
				end
			else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			walkspeed = 16
		elseif taunt.Value == "Err0r2" then
			if HipValLock == false then
				HipVal = 3
			end
			--eeepitch = 1
			change = 1
			--eevol = 5
			sensitivity = 25
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0 * CFrame.new(0,0,0),0.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-0.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),0.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(0.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-0.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			if attack == false then
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0, 0, 1.5 + 1 * math.cos(sine / 39)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)),0.8)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(15 - 2.5 * math.sin(sine / 12)), math.rad(math.random(-25,25)), math.rad(0)),0.15)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.sin(sine / 12), 0) * CFrame.Angles(math.rad(0 + 2 * math.cos(sine / 12)), math.rad(0), math.rad(15 + 3 * math.cos(sine / 12) - 3 *  math.sin(sine / 12))) *               CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) * RIGHTSHOULDERC0,1/2)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1,.75,.1) * CFrame.Angles(math.rad(-165),math.rad(0),math.rad(40)) * LEFTSHOULDERC0,.7/3)
					RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1 , -1, 0) * CFrame.Angles(math.rad(0), math.rad(80+10* math.sin(sine / 78)), math.rad(0)) * CFrame.Angles(math.rad(-3+1* math.sin(sine / 58)), math.rad(0), math.rad(2.5+8 * math.sin(sine / 43))),0.8)
					LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -0.5, -0.5) * CFrame.Angles(math.rad(0), math.rad(-80-10* math.sin(sine / 81)), math.rad(0)) * CFrame.Angles(math.rad(-3+1* math.sin(sine / 63)), math.rad(0), math.rad(0+15 * math.sin(sine / 49))),0.8)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-.65,-.15) * CFrame.Angles(math.rad(-190 + 7,10*math.cos(sine/16)),math.rad(45),math.rad(0)),3 / 3)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 - 0.15 * math.cos(sine / 47), -0.5, 0.5 + 0.1 * math.cos(sine / 28)) * CFrame.Angles(math.rad(70), math.rad(0 - RootPart.RotVelocity.Y), math.rad(0 - RootPart.RotVelocity.Y * 4.5 + 3 * math.cos(sine / 47))), .2 / 3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-45+math.random(-5,5)),math.rad(math.random(-13,5)),math.rad(math.random(-5,5))),1)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(-41.6-4*math.sin(sine/25)), math.rad(math.random(-0.25,3)), math.rad(math.random(0.25,3)))* RIGHTSHOULDERC0, .7 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-195),math.rad(0),math.rad(0)) * LEFTSHOULDERC0,0.75/3)
					RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1 , -0.5, -0.6) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(1.5), math.rad(0), math.rad(-20 - 5 * math.cos(sine / 34))), .2 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(1), math.rad(0), math.rad(20 + 2 * math.cos(sine / 38))), .2 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(10,5),math.rad(0)),1/2)
				end
				local partnum = math.random(1,48)
				coroutine.resume(coroutine.create(function()
					local wingpart = Character.Wings:GetChildren()[partnum]
					wingpart.Color = GUN.NeonParts.Color
					swait()
					if not alreadyfixing then
						wingpart.Color = MAINRUINCOLOR
					end
				end))
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
			walkspeed = 50
		elseif taunt.Value == "Pazolite" then
			if HipValLock == false then
				HipVal = 3
			end
			--eeepitch = 1
			change = 1
			--eevol = 5
			sensitivity = 25
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			if not attack then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 - .5 * math.sin(sine/9)) * CFrame.Angles(math.rad(-20),math.rad(0),math.rad(0)),.7/3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,-.05,0) * CFrame.Angles(math.rad(20),math.rad(0),math.rad(0)),.7/3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,.5,-.1) * CFrame.Angles(math.rad(45),math.rad(-45),math.rad(0)) * RIGHTSHOULDERC0,.7/3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1,.75,.1) * CFrame.Angles(math.rad(-165),math.rad(0),math.rad(40)) * LEFTSHOULDERC0,.7/3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-12.5),math.rad(90),math.rad(0)) * CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)),.7/3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(12.5),math.rad(-90),math.rad(0)) * CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)),.7/3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				elseif Torsovelocity >= sensitivity then
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0 - .5 * math.sin(sine/9)) * CFrame.Angles(math.rad(45),math.rad(0),math.rad(0)),.7/3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new(0,-.05,0) * CFrame.Angles(math.rad(-45),math.rad(0),math.rad(0)),.7/3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,-.1) * CFrame.Angles(math.rad(-45),math.rad(0),math.rad(0)) * RIGHTSHOULDERC0,.7/3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(135),math.rad(0),math.rad(0)) * LEFTSHOULDERC0,.7/3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,-.01) * CFrame.Angles(math.rad(-10),math.rad(80),math.rad(5+5*math.sin(sine/9))),1/2)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-.01) * CFrame.Angles(math.rad(0),math.rad(-80),math.rad(-5-5*math.sin(sine/9))),1/2)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
				local partnum = math.random(1,48)
				coroutine.resume(coroutine.create(function()
					local wingpart = Character.Wings:GetChildren()[partnum]
					wingpart.Color = GUN.NeonParts.Color
					swait()
					if not alreadyfixing then
						wingpart.Color = MAINRUINCOLOR
					end
				end))
			end
			walkspeed = 50
		elseif taunt.Value == "FAST BOIII" then
			change = 1
			if HipValLock == false then
				HipVal = 0
			end
			--eeepitch = 1
			--eevol = 5
			sensitivity = 25
			if not Character:FindFirstChild("WalkingWheel") and Anim == "Idle" and not attack then
				local ww = Instance.new("Model")
				ww.Name = "WalkingWheel"
				for i = 1,36 do
					local wwpart = Instance.new("Part")
					wwpart.Size = Vector3.new(2,.2,.56)
					wwpart.CFrame = Torso.CFrame * CFrame.Angles(math.rad(85+(10*i)),0,0) * CFrame.new(0,3.1,0)
					weldBetween(RootPart,wwpart)
					wwpart.Material = "Neon"
					if i <= 18 then
						wwpart.CanCollide = false
					end
					wwpart.Color = Color3.new()
					wwpart.Name = randomstring()
					wwpart.Parent = ww
				end
				ww.Parent = Character
				coroutine.resume(coroutine.create(function()
					repeat if stopeverything then wait(math.huge) end 
						for i,v in pairs(ww:GetChildren()) do 
							v.Color = GUN.NeonParts.Color 
						end 
						swait() 
					until attack or Anim ~= "Idle" or taunt.Value ~= "FAST BOIII"
					alreadyfixing = true
					ww:Destroy()
					alreadyfixing = false
				end))
			end
			local vAlUe = 100
			RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
			Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
			RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
			LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
			RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
			LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
			Humanoid.WalkSpeed = walkspeed*6
			if not attack then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if Torsovelocity < sensitivity then
					Anim = "Idle"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,.2) * CFrame.Angles(math.rad(-sine*6),math.rad(0),math.rad(0)),.25)
					Neck.C0 = Clerp(Neck.C0,NECKC0,.25)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0) * CFrame.Angles(math.rad(-75*math.sin(sine/5)),math.rad(0),math.rad(0)) * RIGHTSHOULDERC0,.25)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0) * CFrame.Angles(math.rad(75*math.sin(sine/5)),math.rad(0),math.rad(0)) * LEFTSHOULDERC0,.25)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,-.01) * CFrame.Angles(math.rad(75*math.sin(sine/5)),math.rad(90),math.rad(0)),.25)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-.01) * CFrame.Angles(math.rad(-75*math.sin(sine/5)),math.rad(-90),math.rad(0)),.25)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),.25)
				elseif Torsovelocity >= sensitivity then
					Anim = "Walk"
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-45),math.rad(0),math.rad(0)),.25/3)
					Neck.C0 = Clerp(Neck.C0,NECKC0 * CFrame.new() * CFrame.Angles(math.rad(-45),math.rad(0),math.rad(0)),.25/3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.6,.5) * CFrame.Angles(math.rad(-135),math.rad(0),math.rad(0)) * RIGHTSHOULDERC0,.75/3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.6,.5) * CFrame.Angles(math.rad(-135),math.rad(0),math.rad(0)) * LEFTSHOULDERC0,.75/3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,-.01) * CFrame.Angles(math.rad(180+-sine*vAlUe),math.rad(90),math.rad(0)),1)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-.01) * CFrame.Angles(math.rad(-sine*vAlUe),math.rad(-90),math.rad(0)),1)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
					GUN.Base.Transparency = 1
					GUN.GunAdditions.Transparency = 0
					GUN.NeonParts.Transparency = 0
				end
			else
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
			end
		else
			if not attack then
				GUN.Base.Transparency = 1
				GUN.GunAdditions.Transparency = 0
				GUN.NeonParts.Transparency = 0
				if HipValLock == false then
					HipVal = 0
				end
				if taunt.Value == "Fave" then
					change = 1
					--eeepitch = 1
					sensitivity = 0
					if HipValLock == false then
						HipVal = 0
					end
					RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0, 0, -5 + 0.08 * math.cos(sine / 12)) * CFrame.Angles(math.rad(5 + 3 * math.cos(sine / 12)) + math.rad(0 + 3 * math.sin(sine / 12)), math.rad(0), math.rad(0)), 0.7 / 3)
					Neck.C0 = Clerp(Neck.C0, nc0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(5 + -10 * math.cos(sine / 12)) + math.rad(0 + -10 * math.sin(sine / 12)), math.rad(0), math.rad(0)), 0.7 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.15 + 0.05 * math.cos(sine / 12), 0) * CFrame.Angles(math.rad(-25 + 6 * math.cos(sine / 12)) + math.rad(0 + 6 * math.sin(sine / 12)), math.rad(-15), math.rad(7)) * rscp, 0.7 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.15 + 0.05 * math.cos(sine / 12), 0) * CFrame.Angles(math.rad(-25 + 6 * math.cos(sine / 12)) + math.rad(0 + 6 * math.sin(sine / 12)), math.rad(15), math.rad(-7)) * lscp, 0.7 / 3)
					RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - 0.05 * math.cos(sine / 12), -0.2) * CFrame.Angles(math.rad(76 + 4 * math.cos(sine / 12)) + math.rad(0 + 4 * math.sin(sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-4), math.rad(-15), math.rad(0)), 0.7 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.65 - 0.05 * math.cos(sine / 12), -0.3) * CFrame.Angles(math.rad(87 + 4 * math.cos(sine / 12)) + math.rad(0 + 4 * math.sin(sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(17), math.rad(0)), 0.7 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(-30,-30,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1/2)
				elseif taunt.Value == "Krump" then
					change = 1
					--eeepitch = 1
					if HipValLock == false then
						HipVal = 0
					end
					RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new(0+1*math.sin(sine/3),0+1*math.cos(sine/3),-.75) * CFrame.Angles(math.rad(0),math.rad(-10),math.rad(0)),1)
					Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(),1)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,1,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)) * rscp,1)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,1,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-90)) * lscp,1)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1.5,-1,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(70)),1)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-.5,-1.25,-.25) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(10)),1)
					RightHip.C1 = Clerp(RightHip.C1,CFrame.new(),1)
					LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(),1)
					RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
					LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-20,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				elseif taunt.Value == "Sus" then
					VT=Vector3.new

					--Anim Fixer
					RootJoint.C1 = Clerp(RootJoint.C1,ROOTC0,.2/3)
					Neck.C1 = Clerp(Neck.C1,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180)),.2/3)
					RightHip.C1 = Clerp(RightHip.C1,CFrame.new(.5,1,0,-4.37113918e-08,0,1,0,1,0,-1,0,-4.37113918e-08),1)
					LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(-.5,1,0,-4.37113918e-08,-0,-1,0,1,-0,1,0,-4.37113918e-08),1)
					RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
					LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
					--End
					
					change = 1
					--eeepitch = 1
					if HipValLock == false then
						HipVal = 0
					end
					CF=CFrame.new
Animation_Speed=3
SIN=math.sin
ANGLES=CFrame.Angles
angles=CFrame.Angles
RAD=math.rad
COS=math.cos
MRANDOM=math.random
Cos=math.cos
Sin=math.sin
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(-0.25 * COS(LOOPx / 50), 0, -0.5 - 0.5 * COS(LOOPx / 25)) * ANGLES(RAD(0), RAD(0), RAD(45 * SIN(LOOPx / 50))) * ANGLES(RAD(45 + 22.5 * COS(LOOPx / 25)), RAD(0), RAD(0)), 2 / 3)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-45 - 22.5 * COS(LOOPx / 25)), RAD(0), RAD(-45 * SIN(LOOPx / 50))), 2 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5, 0) * ANGLES(RAD(175+65 * SIN(LOOPx / 25)), RAD(0), RAD(-45 * SIN(LOOPx / 12.5))) * CF(0,-0.5,0) * RIGHTSHOULDERC0, 1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5, 0) * ANGLES(RAD(175+65 * SIN(LOOPx / 25)), RAD(0), RAD(45 * SIN(LOOPx / 12.5))) * CF(0,-0.5,0) * LEFTSHOULDERC0, 1 / 3)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.5 + 0.5 * COS(LOOPx / 25), -0.5 - 0.5 * COS(LOOPx / 25)) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.5 * COS(LOOPx / 25), -0.5 - 0.5 * COS(LOOPx / 25)) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(300,0,300) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				elseif taunt.Value == "OOOOO" then
					if HipValLock == false then
						HipVal = 0
					end
					change = 1
					--eeepitch = 1
					sensitivity = 25
					if not eee:FindFirstChildOfClass("DistortionSoundEffect") then
						local dse = Instance.new("DistortionSoundEffect")
						dse.Priority = 2147483647
						dse.Level = .99
						dse.Name = randomstring()
						dse.Parent = eee
						coroutine.resume(coroutine.create(function()
							repeat swait() until not dse:IsDescendantOf(game) or taunt.Value ~= "OOOOO"
							if not soundfixing then
								soundfixing = true
								dse:Destroy()
								soundfixing = false
							end
						end))
					end
					RootJoint.C0 = Clerp(RootJoint.C0,rc0*CFrame.new(math.random(-1,1)/2,math.random(-1,1)/2,math.random(-1,1)/2)*CFrame.Angles(math.rad(math.random(-45,45)),math.rad(math.random(-45,45)),0),1)
					Neck.C0 = Clerp(Neck.C0,nc0,1)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(2,0,0) * rscp * CFrame.Angles(math.rad(-90),0,0),1)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-2,0,0) * lscp * CFrame.Angles(math.rad(-90),0,0),1)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(.5,-2,0),1)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-.5,-2,0),1)
					RightHip.C1 = Clerp(RightHip.C1,CFrame.new(),1)
					LeftHip.C1 = Clerp(LeftHip.C1,CFrame.new(),1)
					RightShoulder.C1 = Clerp(RightShoulder.C1,CFrame.new(-.5,.5,0,0,0,1,0,1,-0,-1,0,0),1)
					LeftShoulder.C1 = Clerp(LeftShoulder.C1,CFrame.new(.5,.499975681,0,0,0,-1,0,1,0,1,0,0),1)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-1,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1)
				end
			end
		end
	end
	if shieldblock == nil and Shield.Value == true then
		shieldfixer()
	end
	if taunt.Value ~= "Banisher" or taunt.Value ~= "Banisher2" then
		Hole = GUN.Hole
		Holetwo = GUN.Hole2
	else
		Hole = GUN2.Hole
		Holetwo = GUN2.Hole
	end
	shieldblock.Transparency = 0
	shieldblock.Name = "Garcello "..randomstring()
	shieldblock.Shape = "Ball"
	shieldblock.Locked = true
	shieldblock.Massless = false
	shieldblock.CanCollide = false
	shieldblock.Archivable = true
	shieldblock.Material = "ForceField"
	shieldblock.Reflectance = 0
	shieldblock.Anchored = true
	shieldblock.CastShadow = false
	shieldblock:ClearAllChildren()
	eeeblock.Transparency = "inf"
	if Shield.Value == true then
		shieldblock.Parent = workspace
		mdmg(shieldblock.Position,10+0.05*math.sin(sine/25))
	end
	if Shield.Value == false then
		shieldblock.Parent = nil
	end	
	if not BallFolder then
		BallFolder = Instance.new("Folder")
		BallFolder.Parent = workspace.Terrain
		BallFolder.Name = randomstring()
	end
	-- Player-Visible Bullet update (flicker between muzzle and target, Uhhhhhh LC style)
	if VisibleBullet then
		if bulletstate[3] < os.clock() - 0.5 then
			VisibleBullet.CFrame = RootPart.CFrame * CFrame.new(0, -200, 0)
		else
			local pos = math.floor(os.clock() / 0.05) % 2
			if pos == 0 then
				VisibleBullet.CFrame = CFrame.Angles(math.random() * math.pi * 2, math.random() * math.pi * 2, math.random() * math.pi * 2) + bulletstate[1]
			else
				VisibleBullet.CFrame = CFrame.Angles(math.random() * math.pi * 2, math.random() * math.pi * 2, math.random() * math.pi * 2) + bulletstate[2]
			end
		end
	end
	Hue = Hue + 1
	if (Hue>360) then Hue = 0 end

	swait()
	end