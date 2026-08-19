local UserConfig = {
    ["YeImTory"] = {
        Text = "Fe Admin Noli Modifier",
        TextColor = Color3.fromRGB(255, 215, 0),
        HighlightColor = Color3.fromRGB(255, 215, 0),
    },
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function applyEffects(player, character)

    if player == LocalPlayer then return end

    local config = UserConfig[player.Name]
    if not config then return end

    if character:FindFirstChild(":3_Tag") or character:FindFirstChild(":3_Highlight") then
        return
    end

    local hrp = character:WaitForChild("HumanoidRootPart", 5)
    if not hrp then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = ":3_Tag"
    billboard.AlwaysOnTop = true

    billboard.Size = UDim2.new(5, 0, 1.2, 0) 
    billboard.StudsOffset = Vector3.new(0, 3.8, 0)
    billboard.Adornee = hrp
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = config.Text
    textLabel.TextColor3 = config.TextColor
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard
    billboard.Parent = character

    local highlight = Instance.new("Highlight")
    highlight.Name = ":3_Highlight"
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.OutlineColor = config.HighlightColor
    highlight.OutlineTransparency = 0
    highlight.FillColor = config.HighlightColor
    highlight.FillTransparency = 0.85
    highlight.Adornee = character
    highlight.Parent = character
end

local function onPlayerAdded(player)

    if player == LocalPlayer then return end

    if UserConfig[player.Name] then
        player.CharacterAdded:Connect(function(character)
            applyEffects(player, character)
        end)

        if player.Character then
            applyEffects(player, player.Character)
        end
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)












local args = {
	"cmd",
	"-gh 138094177071382"
}
game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
wait(2)
local args = {
	"cmd",
	"-net"
}
game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
wait(2)




























local Directories = {
	Main = "FEVerse/",
	RBXMs = "FEVerse/RBXMs/",
	Sounds = "FEVerse/Sounds/",
	Songs = "FEVerse/Songs/",
	Scripts = "FEVerse/Scripts/",
}




local function GetScript(FileName, URL)
	if not isfolder(Directories.Scripts) then makefolder(Directories.Scripts) end
	local Path = Directories.Scripts .. FileName
	local Ok, Data = pcall(game.HttpGet, game, URL)
	if not Ok or type(Data) ~= "string" or #Data < 100 then
		error("Failed to download " .. FileName .. " (" .. tostring(Ok and "invalid data" or Data) .. ") from " .. URL)
	end
	writefile(Path, Data)
	print("Downloaded " .. FileName .. " (" .. #Data .. " bytes)")
	local Func, Err = loadstring(readfile(Path))
	if not Func then
		error("Failed to compile " .. FileName .. ": " .. tostring(Err))
	end
	return Func
end

local FEManager = GetScript("FEManager.lua", "https://gist.githubusercontent.com/MelonsStuff/a003ea305dd302eab1f8d372daed38b4/raw/9db59962b28555fd699a7c29891efb85d45677ab/gistfile1.txt")()
for i, v in pairs(Directories) do FEManager.EnsureFolder(v) end
task.spawn(function()
	FEManager.DownloadFile(Directories.Sounds, "Chase.mp3", "https://raw.githubusercontent.com/MelonsStuff/FEVerse/refs/heads/main/Sounds/Admin/Chase.MP3")
	FEManager.DownloadFile(Directories.Sounds, "Ambience.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Ambience.mp3")
	FEManager.DownloadFile(Directories.Sounds, "Execution.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Execution.mp3")
	FEManager.DownloadFile(Directories.Sounds, "NovaExplode.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/NovaExplode.mp3")
	FEManager.DownloadFile(Directories.Sounds, "NovaThrow.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/NovaThrow.mp3")
	FEManager.DownloadFile(Directories.Sounds, "ObservantStart.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/ObservantStart.mp3")
	FEManager.DownloadFile(Directories.Sounds, "ObservantCancel.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/ObservantCancel.mp3")
	FEManager.DownloadFile(Directories.Sounds, "ObservantTeleport.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/ObservantTeleport.mp3")
	FEManager.DownloadFile(Directories.Sounds, "Stab.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Stab.mp3")
	FEManager.DownloadFile(Directories.Sounds, "Stun.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Stun.mp3")
	FEManager.DownloadFile(Directories.Sounds, "VoidRushStart.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/VoidRushStart.mp3")
	FEManager.DownloadFile(Directories.Sounds, "VoidRushCharge.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/VoidRushCharge.mp3")
	FEManager.DownloadFile(Directories.Sounds, "VoidRushSlam.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/VoidRushSlam.mp3")
end)

local IntroKeyframes = GetScript("AdminIntroKeyframes.lua", "https://gist.githubusercontent.com/MelonsStuff/d1eab70e7877e0769f42e6c4d89fc6f4/raw/e2c4a9a2af52d8f8426aacfc54435372dd8cc587/AdminIntroKeyframes.lua")().Keyframes
local OutroKeyframes = GetScript("AdminOutroKeyframes.lua", "https://gist.githubusercontent.com/MelonsStuff/c4a31886c3099a91fe6a0b33d17045bc/raw/017c725d5cd8c84a5ee404e4b30e8477aae36c05/AdminOutroKeyframes.lua")().Keyframes

local Reanimate_Settings = {
	Frequency = 6, 
	Amplification = 6, 
	FrontOffset = 2.5, 
}

local Settings = {
	Fling = true;
	Earrape = false;
	CameraEffects = true;
	InfiniteJump = false;
	Spin = false;
	Music = true;
	
	
}


local StartTime = tick()
local Game = game
local RunService = Game:GetService("RunService")
local TestService = Game:GetService("TestService")
local Workspace = Game:GetService("Workspace")
local Players = Game:GetService("Players")
local UserInputService = Game:GetService("UserInputService")
local TweenService = Game:GetService("TweenService")
local Debris = Game:GetService("Debris")
local PreSim = RunService.PreSimulation
local PostSim = RunService.PostSimulation
local Heartbeat = RunService.Heartbeat
local CurrentCam = Workspace.CurrentCamera

local Wait = task.wait
local Spawn = task.spawn
local Infinite = math.huge
local V3new = Vector3.new
local INew = Instance.new
local CFNew = CFrame.new
local CFAngles = CFrame.Angles
local MathRandom = math.random
local Rad = math.rad
local Insert = table.insert
local Clear = table.clear

local FPS = setfpscap(60)


local Global = (getgenv and getgenv()) or shared
if not Global.GelatekHubConfig then Global.GelatekHubConfig = {} end
local Config = Global.GelatekHubConfig
local PermanentDeath = Config["Permanent Death"] ~= false
local KeepHairWelds = Config["Keep Hats On Head"] or false
local HeadlessPerma = Config["Headless On Perma"] or false
local Collisions = Config["Enable Collisions"] or false
local AntiVoid = Config["Anti Void"] or false
if not Global.TableOfEvents then Global.TableOfEvents = {} end


local Events = {}
local function Connect(Signal, Func)
	local Connection = Signal:Connect(Func)
	Insert(Events, Connection)
	return Connection
end
local function CleanupAll()
	for i = #Events, 1, -1 do
		pcall(function() Events[i]:Disconnect() end)
	end
	Clear(Events)
	for i = #Global.TableOfEvents, 1, -1 do
		pcall(function() Global.TableOfEvents[i]:Disconnect() end)
	end
	Clear(Global.TableOfEvents)
end


local Player = Players.LocalPlayer
local RealChar = Player.Character 
if not RealChar then
	error("Character not found.")
end
if RealChar.Name == "non" or RealChar.Name == "GelatekReanimate" then
	error("Reanimation Already Working")
end
local RealHumanoid = RealChar:FindFirstChildOfClass("Humanoid")
if not RealHumanoid or RealHumanoid.Health == 0 then error("Player Is Dead.") end
local RealRootPart = RealChar:FindFirstChild("HumanoidRootPart")
local R15 = RealHumanoid.RigType.Name == "R15" and true or false

local Is_NetworkOwner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
local HiddenProps = sethiddenproperty or function() end
local SpawnPoint = Workspace:FindFirstChildOfClass("SpawnLocation", true) or CFNew(0, 20, 0)

local FakeHats = INew("Folder")
FakeHats.Name = "FakeHats"
FakeHats.Parent = TestService

RealChar.Archivable = true
RealHumanoid:ChangeState(16) 

pcall(function() 
	local function KillScript(Name)
		local Child = RealChar:FindFirstChild(Name)
		if Child then Child:Destroy() end
	end
	KillScript("Local Ragdoll")
	KillScript("State Handler")
	KillScript("Controls")
	KillScript("FirstPerson")
	KillScript("FakeAdmin")
	for _, RagdollStuff in pairs(RealChar:GetDescendants()) do
		if RagdollStuff:IsA("BallSocketConstraint") or RagdollStuff:IsA("HingeConstraint") then
			RagdollStuff:Destroy()
		end
	end
end)


local HatsNames = {}
for _, Accessory in pairs(RealChar:GetDescendants()) do
	if Accessory:IsA("Accessory") then
		if HatsNames[Accessory.Name] then
			if HatsNames[Accessory.Name] == "Unknown" then
				HatsNames[Accessory.Name] = {}
			end
			Insert(HatsNames[Accessory.Name], Accessory)
		else
			HatsNames[Accessory.Name] = "Unknown"
		end
	end
end
for _, Tables in pairs(HatsNames) do
	if type(Tables) == "table" then
		local Number = 1
		for _, Names in ipairs(Tables) do
			Names.Name = Names.Name .. Number
			Number = Number + 1
		end
	end
end
Clear(HatsNames)


local Figure = INew("Model")
do
	local Limbs = {}
	local Attachments = {}
	local function CreateJoint(Name, Part0, Part1, C0, C1)
		local Joint = INew("Motor6D")
		Joint.Name = Name
		Joint.Part0 = Part0
		Joint.Part1 = Part1
		Joint.C0 = C0
		Joint.C1 = C1
		Joint.Parent = Part0
	end
	for i = 0, 18 do
		local Attachment = INew("Attachment")
		Attachment.Axis = V3new(1, 0, 0)
		Attachment.SecondaryAxis = V3new(0, 1, 0)
		Insert(Attachments, Attachment)
	end
	for i = 0, 3 do
		local Limb = INew("Part")
		Limb.Size = V3new(1, 2, 1)
		Limb.CanCollide = false
		Limb.Parent = Figure
		Insert(Limbs, Limb)
	end
	Limbs[1].Name = "Right Arm"
	Limbs[2].Name = "Left Arm"
	Limbs[3].Name = "Right Leg"
	Limbs[4].Name = "Left Leg"
	local Head = INew("Part")
	Head.Size = V3new(2, 1, 1)
	Head.Locked = true
	Head.CanCollide = false
	Head.Name = "Head"
	Head.Parent = Figure
	local Torso = INew("Part")
	Torso.Size = V3new(2, 2, 1)
	Torso.Locked = true
	Torso.CanCollide = false
	Torso.Name = "Torso"
	Torso.Parent = Figure
	local Root = Torso:Clone()
	Root.Transparency = 1
	Root.Name = "HumanoidRootPart"
	Root.Parent = Figure
	CreateJoint("Neck", Torso, Head, CFNew(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("RootJoint", Root, Torso, CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("Right Shoulder", Torso, Limbs[1], CFNew(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Shoulder", Torso, Limbs[2], CFNew(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	CreateJoint("Right Hip", Torso, Limbs[3], CFNew(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Hip", Torso, Limbs[4], CFNew(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	local FigureHumanoid = INew("Humanoid")
	FigureHumanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	FigureHumanoid.Parent = Figure
	INew("Animator", FigureHumanoid)
	INew("HumanoidDescription", FigureHumanoid)
	local HeadMesh = INew("SpecialMesh")
	HeadMesh.Scale = V3new(1.25, 1.25, 1.25)
	HeadMesh.Parent = Head
	local Face = INew("Decal")
	Face.Name = "face"
	Face.Texture = "http://www.roblox.com/asset/?id=158044781"
	Face.Parent = Head
	local Animate = INew("LocalScript")
	Animate.Name = "Animate"
	Animate.Parent = Figure
	local HealthScript = INew("Script")
	HealthScript.Name = "Health"
	HealthScript.Parent = Figure
	Attachments[1].Name = "FaceCenterAttachment"; Attachments[1].Position = V3new(0, 0, 0)
	Attachments[2].Name = "FaceFrontAttachment"; Attachments[2].Position = V3new(0, 0, -0.6)
	Attachments[3].Name = "HairAttachment"; Attachments[3].Position = V3new(0, 0.6, 0)
	Attachments[4].Name = "HatAttachment"; Attachments[4].Position = V3new(0, 0.6, 0)
	Attachments[5].Name = "RootAttachment"; Attachments[5].Position = V3new(0, 0, 0)
	Attachments[6].Name = "RightGripAttachment"; Attachments[6].Position = V3new(0, -1, 0)
	Attachments[7].Name = "RightShoulderAttachment"; Attachments[7].Position = V3new(0, 1, 0)
	Attachments[8].Name = "LeftGripAttachment"; Attachments[8].Position = V3new(0, -1, 0)
	Attachments[9].Name = "LeftShoulderAttachment"; Attachments[9].Position = V3new(0, 1, 0)
	Attachments[10].Name = "RightFootAttachment"; Attachments[10].Position = V3new(0, -1, 0)
	Attachments[11].Name = "LeftFootAttachment"; Attachments[11].Position = V3new(0, -1, 0)
	Attachments[12].Name = "BodyBackAttachment"; Attachments[12].Position = V3new(0, 0, 0.5)
	Attachments[13].Name = "BodyFrontAttachment"; Attachments[13].Position = V3new(0, 0, -0.5)
	Attachments[14].Name = "LeftCollarAttachment"; Attachments[14].Position = V3new(-1, 1, 0)
	Attachments[15].Name = "NeckAttachment"; Attachments[15].Position = V3new(0, 1, 0)
	Attachments[16].Name = "RightCollarAttachment"; Attachments[16].Position = V3new(1, 1, 0)
	Attachments[17].Name = "WaistBackAttachment"; Attachments[17].Position = V3new(0, -1, 0.5)
	Attachments[18].Name = "WaistCenterAttachment"; Attachments[18].Position = V3new(0, -1, 0)
	Attachments[19].Name = "WaistFrontAttachment"; Attachments[19].Position = V3new(0, -1, -0.5)
	Attachments[1].Parent = Head; Attachments[2].Parent = Head; Attachments[3].Parent = Head; Attachments[4].Parent = Head
	Attachments[5].Parent = Root
	Attachments[6].Parent = Limbs[1]; Attachments[7].Parent = Limbs[1]
	Attachments[8].Parent = Limbs[2]; Attachments[9].Parent = Limbs[2]
	Attachments[10].Parent = Limbs[3]; Attachments[11].Parent = Limbs[4]
	for i = 0, 7 do Attachments[12 + i].Parent = Torso end
	Figure.Name = "non"
	Figure.PrimaryPart = Head
	Figure.Archivable = true
	Figure.Parent = Workspace
	Figure:MoveTo(RealRootPart.Position)
end


local FigureHum = Figure:FindFirstChildWhichIsA("Humanoid")
local AnimateScript = Figure:FindFirstChild("Animate")
if AnimateScript then AnimateScript:Destroy() end
local FigureAnimator = FigureHum:FindFirstChildOfClass("Animator")
if FigureAnimator then FigureAnimator:Destroy() end

Figure:MoveTo(RealChar.Head.Position + V3new(0, 2.5, 0))
for _, v in pairs(Figure:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") then
		v.Transparency = 1
	end
end

local FigureDescendants = Figure:GetDescendants()
local CharacterChildren = RealChar:GetChildren()





local ReanimateVoidstarPart
do
	local Part = INew("Part")
	Part.Name = "Reanimate_Voidstar"
	Part.Massless = true
	Part.CanCollide = false
	Part.Transparency = 1
	Part.Size = V3new(0.1, 0.1, 0.1)
	Part.Anchored = false
	Part.Parent = Figure
	ReanimateVoidstarPart = Part
end



local WeaponAccessories = {
	{ Name = "Reanimate_Voidstar", MeshId = "124450938319006", TextureId = "116140049379017", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "114491662662773", TextureId = "116639272672519", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "75226925425816", TextureId = "114653511721119", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "111761423287127", TextureId = "104436009988593", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "18427706530", TextureId = "18427706831", Offset = CFAngles(Rad(-90), 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "93839976189892", TextureId = "87530318962700", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "133225911736441", TextureId = "93962139150200", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "118568444522464", TextureId = "79834113476615", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "105852387370635", TextureId = "77723769921327", Offset = CFAngles(0, 0, 0) },
	{ Name = "Reanimate_Voidstar", MeshId = "2309330801", TextureId = "2309333814", Offset = CFAngles(0, 0, 0) },
}

local WeaponAccessoryMap = {} 

local function GetMeshId(Part)
	if Part:IsA("MeshPart") then
		return Part.MeshId, Part.TextureID
	end
	local SpecialMesh = Part:FindFirstChildOfClass("SpecialMesh")
	if SpecialMesh then
		return SpecialMesh.MeshId, SpecialMesh.TextureId
	end
end

local function GetWeaponMap(Accessory)
	local Handle = Accessory:FindFirstChild("Handle")
	if not Handle then return end
	local MeshId, TextureId = GetMeshId(Handle)
	if not MeshId then return end
	for _, Table in ipairs(WeaponAccessories) do
		if TextureId and string.find(MeshId, Table.MeshId) and string.find(TextureId, Table.TextureId) then
			return { Part = Figure:FindFirstChild(Table.Name), Offset = Table.Offset }
		end
	end
end



local function SetupAccessory(Accessory)
	local Handle = Accessory:FindFirstChild("Handle")
	if not Handle then return end
	local FakeAccessory = Accessory:Clone()
	local FakeHandle = FakeAccessory:FindFirstChild("Handle")
	pcall(function()
		local Weld = FakeHandle:FindFirstChildWhichIsA("Weld")
		if Weld then Weld:Destroy() end
	end)
	local Weld = INew("Weld")
	Weld.Name = "AccessoryWeld"
	Weld.Part0 = FakeHandle
	local Attachment = FakeHandle:FindFirstChildOfClass("Attachment")
	if Attachment then
		Weld.C0 = Attachment.CFrame
		local FigureAttach = Figure:FindFirstChild(tostring(Attachment), true)
		if FigureAttach then
			Weld.C1 = FigureAttach.CFrame
			Weld.Part1 = FigureAttach.Parent
		else
			Weld.Part1 = Figure:FindFirstChild("Head")
			Weld.C1 = CFNew(0, Figure:FindFirstChild("Head").Size.Y / 2, 0) * FakeAccessory.AttachmentPoint:Inverse()
		end
	else
		Weld.Part1 = Figure:FindFirstChild("Head")
		Weld.C1 = CFNew(0, Figure:FindFirstChild("Head").Size.Y / 2, 0) * FakeAccessory.AttachmentPoint:Inverse()
	end
	FakeHandle.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:Inverse()
	FakeHandle.Transparency = 1
	Weld.Parent = FakeHandle
	FakeAccessory.Parent = Figure
	local FakeAccessory2 = FakeAccessory:Clone()
	FakeAccessory2.Parent = FakeHats
	local RealAttachment = Handle:FindFirstChildWhichIsA("Attachment")
	local IsHairType = RealAttachment and (RealAttachment.Name == "HatAttachment" or RealAttachment.Name == "FaceFrontAttachment" or RealAttachment.Name == "HairAttachment" or RealAttachment.Name == "FaceCenterAttachment")
	if not (KeepHairWelds and IsHairType) then
		Handle:BreakJoints()
	end
	WeaponAccessoryMap[Accessory] = GetWeaponMap(Accessory)
end


for _, v in pairs(RealChar:GetDescendants()) do
	if v:IsA("BasePart") then
		v.RootPriority = 127
		local ClaimInfo = INew("SelectionBox")
		ClaimInfo.Adornee = v
		ClaimInfo.Name = "ClaimCheck"
		ClaimInfo.Transparency = 1
		ClaimInfo.Parent = v
	end
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
	if v:IsA("Script") then
		v.Disabled = true
	end
	if v:IsA("Accessory") then
		SetupAccessory(v)
	end
end
for _, v in next, RealHumanoid:GetPlayingAnimationTracks() do
	v:Stop()
end

Connect(RealChar.DescendantAdded, function(Descendant)
	if Descendant:IsA("Accessory") then
		SetupAccessory(Descendant)
	end
end)


if not TestService:FindFirstChild("OwnershipBoost") then
	local Part = INew("Part")
	Part.Name = "OwnershipBoost"
	Part.Parent = TestService
	Connect(PreSim, function()
		HiddenProps(Player, "MaximumSimulationRadius", 10e+5)
		HiddenProps(Player, "SimulationRadius", Player.MaximumSimulationRadius)
	end)
end

local FallHeight = Workspace.FallenPartsDestroyHeight
local function MiniRandom() return "0." .. MathRandom(6, 8) .. MathRandom(1, 9) .. MathRandom(1, 9) end
local Velocity = V3new(0, -26, 0)
local CF0 = CFNew(0, 0, 0)
local Flinging = false 

local function StopReanimation()
	CleanupAll()
	pcall(function()
		if game.CoreGui:FindFirstChild("MobileUI") then
			game.CoreGui:FindFirstChild("MobileUI"):Destroy()
		end
		if game.CoreGui:FindFirstChild("MainGUI") then
			game.CoreGui:FindFirstChild("MainGUI"):Destroy()
		end
		CurrentCam.FieldOfView = 80
		Global.Stopped = true
		RealChar.Parent = Workspace
		Player.Character = RealChar
		RealHumanoid:ChangeState(15)
		if FakeHats then FakeHats:Destroy() end
		if Figure then Figure:Destroy() end
		Wait(0.125)
		Global.RealChar = nil
		Global.Stopped = false
	end)
end

local function VoidEvent()
	if AntiVoid == true then
		Figure:MoveTo(SpawnPoint.Position)
	else
		StopReanimation()
	end
end


Connect(PreSim, function()
	local AntiVoidOffset = Config["Anti Void Offset"] or 75
	if Figure.HumanoidRootPart.Position.Y <= FallHeight + AntiVoidOffset then VoidEvent() end
	Velocity = V3new(MathRandom(-1, 1), -26 - MiniRandom(), MathRandom(-1, 1)) + FigureHum.MoveDirection * 135
	for _, v in pairs(CharacterChildren) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
	if not Collisions then
		for _, v in pairs(FigureDescendants) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)


for _, v in pairs(RealChar:GetDescendants()) do
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
end

local function Align(Part0, Part1, Offset)
	local CFOffset = Offset or CF0
	local OwnerShip = Part0:FindFirstChild("ClaimCheck")
	if Is_NetworkOwner(Part0) == true then
		if OwnerShip then OwnerShip.Transparency = 1 end
		if not (Flinging and Part0.Name == "HumanoidRootPart") then
			Part0.AssemblyLinearVelocity = Velocity
		end
		Part0.RotVelocity = Part1.RotVelocity
		if not (Flinging and Part0.Name == "HumanoidRootPart") then
			Part0.CFrame = Part1.CFrame * CFOffset
		end
	else
		if OwnerShip then OwnerShip.Transparency = 0 end
	end
end

local Offsets
if not R15 then
	Offsets = {
		["HumanoidRootPart"] = { Figure:FindFirstChild("HumanoidRootPart"), CF0 },
		["Torso"] = { Figure:FindFirstChild("Torso"), CF0 },
		["Right Arm"] = { Figure:FindFirstChild("Right Arm"), CF0 },
		["Left Arm"] = { Figure:FindFirstChild("Left Arm"), CF0 },
		["Right Leg"] = { Figure:FindFirstChild("Right Leg"), CF0 },
		["Left Leg"] = { Figure:FindFirstChild("Left Leg"), CF0 },
	}
else
	Offsets = {
		["UpperTorso"] = { Figure:FindFirstChild("Torso"), CFNew(0, 0.194, 0) },
		["LowerTorso"] = { Figure:FindFirstChild("Torso"), CFNew(0, -0.79, 0) },
		["HumanoidRootPart"] = { RealChar:FindFirstChild("UpperTorso"), CF0 },
		["RightUpperArm"] = { Figure:FindFirstChild("Right Arm"), CFNew(0, 0.4085, 0) },
		["RightLowerArm"] = { Figure:FindFirstChild("Right Arm"), CFNew(0, -0.184, 0) },
		["RightHand"] = { Figure:FindFirstChild("Right Arm"), CFNew(0, -0.83, 0) },
		["LeftUpperArm"] = { Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0) },
		["LeftLowerArm"] = { Figure:FindFirstChild("Left Arm"), CFNew(0, -0.184, 0) },
		["LeftHand"] = { Figure:FindFirstChild("Left Arm"), CFNew(0, -0.83, 0) },
		["RightUpperLeg"] = { Figure:FindFirstChild("Right Leg"), CFNew(0, 0.575, 0) },
		["RightLowerLeg"] = { Figure:FindFirstChild("Right Leg"), CFNew(0, -0.199, 0) },
		["RightFoot"] = { Figure:FindFirstChild("Right Leg"), CFNew(0, -0.849, 0) },
		["LeftUpperLeg"] = { Figure:FindFirstChild("Left Leg"), CFNew(0, 0.575, 0) },
		["LeftLowerLeg"] = { Figure:FindFirstChild("Left Leg"), CFNew(0, -0.199, 0) },
		["LeftFoot"] = { Figure:FindFirstChild("Left Leg"), CFNew(0, -0.849, 0) },
	}
end

Connect(PostSim, function()
	for i, v in pairs(Offsets) do
		if RealChar:FindFirstChild(i) then
			Align(RealChar:FindFirstChild(i), v[1], v[2])
		end
	end
	for _, v in pairs(RealChar:GetChildren()) do
		if v:IsA("Accessory") then
			local WMap = WeaponAccessoryMap[v]
			if WMap then
				Align(v.Handle, WMap.Part, WMap.Offset)
			else
				local Fake = Figure:FindFirstChild(v.Name)
				if Fake then
					local FakeHandle = Fake:FindFirstChild("Handle")
					if FakeHandle then
						Align(v.Handle, FakeHandle)
					end
				end
			end
		end
	end
end)


if PermanentDeath then
	Spawn(function()
		Wait(Players.RespawnTime + 0.5)
		local Head = RealChar:FindFirstChild("Head")
		if Head then
			if HeadlessPerma == true then
				Head:Remove()
			else
				Head:BreakJoints()
				Offsets["Head"] = { Figure:FindFirstChild("Head"), CF0 }
			end
		end
	end)
end


Global.RealChar = RealChar
RealChar.Parent = Figure
Player.Character = Figure
CurrentCam.CameraSubject = FigureHum

Connect(FigureHum.Died, function()
	StopReanimation()
end)

Connect(RealChar:GetPropertyChangedSignal("Parent"), function()
	if RealChar.Parent == nil then
		StopReanimation()
	end
end)








local AnimatorModule = {}
local Blend = 0.35 


local GetEasing = (function()
	local PI = math.pi
	local HalfPI = PI / 2
	local TwoPI = PI * 2
	local function ELinear(A) return A end
	local function EInQuad(A) return A * A end
	local function EOutQuad(A) return A * (2 - A) end
	local function EInOutQuad(A) if A < 0.5 then return 2 * A * A else return 1 - (-2 * A + 2) ^ 2 / 2 end end
	local function EInCubic(A) return A ^ 3 end
	local function EOutCubic(A) return 1 - (1 - A) ^ 3 end
	local function EInOutCubic(A) if A < 0.5 then return 4 * A ^ 3 else return 1 - (-2 * A + 2) ^ 3 / 2 end end
	local function EInQuart(A) return A ^ 4 end
	local function EOutQuart(A) return 1 - (1 - A) ^ 4 end
	local function EInOutQuart(A) if A < 0.5 then return 8 * A ^ 4 else return 1 - (-2 * A + 2) ^ 4 / 2 end end
	local function EInQuint(A) return A ^ 5 end
	local function EOutQuint(A) return 1 - (1 - A) ^ 5 end
	local function EInOutQuint(A) if A < 0.5 then return 16 * A ^ 5 else return 1 - (-2 * A + 2) ^ 5 / 2 end end
	local function EInSine(A) return 1 - math.cos(A * HalfPI) end
	local function EOutSine(A) return math.sin(A * HalfPI) end
	local function EInOutSine(A) return -(math.cos(PI * A) - 1) / 2 end
	local function EInExpo(A) if A == 0 then return 0 else return 2 ^ (10 * A - 10) end end
	local function EOutExpo(A) if A == 1 then return 1 else return 1 - 2 ^ (-10 * A) end end
	local function EInOutExpo(A) if A == 0 then return 0 elseif A == 1 then return 1 elseif A < 0.5 then return 2 ^ (20 * A - 10) / 2 else return (2 - 2 ^ (-20 * A + 10)) / 2 end end
	local function EInCirc(A) return 1 - math.sqrt(1 - A ^ 2) end
	local function EOutCirc(A) return math.sqrt(1 - (A - 1) ^ 2) end
	local function EInOutCirc(A) if A < 0.5 then return (1 - math.sqrt(1 - (2 * A) ^ 2)) / 2 else return (math.sqrt(1 - (-2 * A + 2) ^ 2) + 1) / 2 end end
	local function EInBack(A) local C1 = 1.70158 local C3 = C1 + 1 return C3 * A ^ 3 - C1 * A ^ 2 end
	local function EOutBack(A) local C1 = 1.70158 local C3 = C1 + 1 return 1 + C3 * (A - 1) ^ 3 + C1 * (A - 1) ^ 2 end
	local function EInOutBack(A) local C1 = 1.70158 local C2 = C1 * 1.525 if A < 0.5 then return (2 * A) ^ 2 * ((C2 + 1) * 2 * A - C2) / 2 else return ((2 * A - 2) ^ 2 * ((C2 + 1) * (A * 2 - 2) + C2) + 2) / 2 end end
	local function EInElastic(A) local C4 = TwoPI / 3 if A == 0 then return 0 elseif A == 1 then return 1 else return -(2 ^ (10 * A - 10)) * math.sin((A * 10 - 10.75) * C4) end end
	local function EOutElastic(A) local C4 = TwoPI / 3 if A == 0 then return 0 elseif A == 1 then return 1 else return 2 ^ (-10 * A) * math.sin((A * 10 - 0.75) * C4) + 1 end end
	local function EInOutElastic(A) local C5 = TwoPI / 4.5 if A == 0 then return 0 elseif A == 1 then return 1 elseif A < 0.5 then return -(2 ^ (20 * A - 10)) * math.sin((20 * A - 11.125) * C5) / 2 else return 2 ^ (-20 * A + 10) * math.sin((20 * A - 11.125) * C5) / 2 + 1 end end
	local function EOutBounce(A) local N1 = 7.5625 local D1 = 2.75 if A < 1 / D1 then return N1 * A * A elseif A < 2 / D1 then A = A - 1.5 / D1 return N1 * A * A + 0.75 elseif A < 2.5 / D1 then A = A - 2.25 / D1 return N1 * A * A + 0.9375 else A = A - 2.625 / D1 return N1 * A * A + 0.984375 end end
	local function EInBounce(A) return 1 - EOutBounce(1 - A) end
	local function EInOutBounce(A) if A < 0.5 then return (1 - EOutBounce(1 - 2 * A)) / 2 else return (1 + EOutBounce(2 * A - 1)) / 2 end end
	local EasingFunctions = {
		Linear = { ELinear, ELinear, ELinear },
		Sine = { EInSine, EOutSine, EInOutSine },
		Quad = { EInQuad, EOutQuad, EInOutQuad },
		Cubic = { EInCubic, EOutCubic, EInOutCubic },
		Quart = { EInQuart, EOutQuart, EInOutQuart },
		Quint = { EInQuint, EOutQuint, EInOutQuint },
		Expo = { EInExpo, EOutExpo, EInOutExpo },
		Circ = { EInCirc, EOutCirc, EInOutCirc },
		Back = { EInBack, EOutBack, EInOutBack },
		Elastic = { EInElastic, EOutElastic, EInOutElastic },
		Bounce = { EInBounce, EOutBounce, EInOutBounce },
	}
	local function GetEasing(StyleName, DirectionName)
		local Funcs = EasingFunctions[StyleName]
		if not Funcs then return ELinear end
		if DirectionName == "In" then return Funcs[1] end
		if DirectionName == "Out" then return Funcs[2] end
		return Funcs[3]
	end
	return GetEasing
end)()
local GetAnimDefaults = function()
	return {
		["Voidstar"] = CFrame.new(0, 0, -0.5), 
		["Neck"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["RootJoint"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["Right Shoulder"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Shoulder"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		["Right Hip"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Hip"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		["Head"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["Torso"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["Right Arm"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Arm"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		["Right Leg"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Leg"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	}
end
function AnimatorModule:LoadAnimation(Rig, KeyframeSequence)
	local Sequence = KeyframeSequence
	local RigHumanoid = Rig:FindFirstChildOfClass("Humanoid")
	if RigHumanoid.RigType ~= Enum.HumanoidRigType.R6 then
		return error("Rig Humanoid is not R6!")
	end
	local Joints = {
		["Voidstar"] = Rig.HumanoidRootPart:FindFirstChild("Voidstar"),
		["Head"] = Rig.Torso["Neck"],
		["Torso"] = Rig.HumanoidRootPart:FindFirstChild("RootJoint") or Rig.HumanoidRootPart:FindFirstChild("Root Joint"),
		["Left Arm"] = Rig.Torso["Left Shoulder"],
		["Right Arm"] = Rig.Torso["Right Shoulder"],
		["Left Leg"] = Rig.Torso["Left Hip"],
		["Right Leg"] = Rig.Torso["Right Hip"],
	}
	local Class = {}
	Class.Speed = 1
	Class.KeepLast = 0
	local Keyframes = Sequence:GetKeyframes()
	table.sort(Keyframes, function(a, b) return a.Time < b.Time end)
	Class.Length = Keyframes[#Keyframes] and Keyframes[#Keyframes].Time or 0
	local AnimDefaults = GetAnimDefaults()
	local PoseData = {}
	for K = 1, #Keyframes do
		local Poses = {}
		for _, Pose in ipairs(Keyframes[K]:GetDescendants()) do
			if Joints[Pose.Name] then
				Poses[Pose.Name] = {
					Target = AnimDefaults[Pose.Name] * Pose.CFrame,
					Style = Pose.EasingStyle,
					Direction = Pose.EasingDirection,
				}
			end
		end
		PoseData[K] = Poses
	end
	for _, v in ipairs(Sequence:GetDescendants()) do
		if v:IsA("IntValue") or v:IsA("StringValue") or v:IsA("Folder") then
			v:Destroy()
		elseif v:IsA("Pose") and not Rig:FindFirstChild(v.Name, true) then
			v:Destroy()
		end
	end
	Class.Stopped = true
	Class.IsPlaying = false
	Class.TimePosition = 0
	Class.Looped = Sequence.Loop
	local Completion = Instance.new("BindableEvent")
	local Reached = Instance.new("BindableEvent")
	Class.Completed = Completion.Event
	Class.KeyframeReached = Reached.Event
	local Connection = nil
	local LastKeyframe = 0
	local KeepLastHeld = 0
	local function ApplyFrame()
		local T = Class.TimePosition
		if not Keyframes[1] then return end
		local K = 1
		for i = #Keyframes, 1, -1 do
			if Keyframes[i].Time <= T then
				K = i
				break
			end
		end
		local K1 = Keyframes[K]
		local K2 = Keyframes[K + 1]
		local P1 = PoseData[K] or {}
		local P2 = K2 and PoseData[K + 1] or {}
		local Alpha = 0
		if K2 then
			local Denom = K2.Time - K1.Time
			if Denom > 0 then
				Alpha = math.clamp((T - K1.Time) / Denom, 0, 1)
			end
		end
		for JointName, J1 in pairs(P1) do
			local Joint = Joints[JointName]
			if Joint then
				local Target = J1.Target
				local J2 = P2[JointName]
				if J2 and Alpha > 0 then
					local StyleName = J1.Style and J1.Style.Name or "Linear"
					local DirectionName = J1.Direction and J1.Direction.Name or "InOut"
					local Eased = GetEasing(StyleName, DirectionName)(Alpha)
					Target = J1.Target:Lerp(J2.Target, Eased)
				end
				Joint.C0 = Target
			end
		end
		for JointName, J2 in pairs(P2) do
			if not P1[JointName] then
				local Joint = Joints[JointName]
				if Joint then Joint.C0 = J2.Target end
			end
		end
		if K ~= LastKeyframe and K1 then
			LastKeyframe = K
			Reached:Fire(K1.Name)
		end
	end
	local function OnStepped(_, DeltaTime)
		if Class.Stopped or not Class.IsPlaying then
			if Connection then Connection:Disconnect() Connection = nil end
			return
		end
		if RigHumanoid.Health <= 0 then
			Class.Stopped = true
			Class.IsPlaying = false
			if Connection then Connection:Disconnect() Connection = nil end
			return
		end
		Class.TimePosition = Class.TimePosition + DeltaTime * Class.Speed
		if Class.TimePosition >= Class.Length and Class.Length > 0 then
			if Class.Looped then
				Class.TimePosition = Class.TimePosition % Class.Length
				LastKeyframe = 0
				Completion:Fire()
			else
				Class.TimePosition = Class.Length
				ApplyFrame()
				if KeepLastHeld >= Class.KeepLast then
					Class.IsPlaying = false
					Class.Stopped = true
					if Connection then Connection:Disconnect() Connection = nil end
					Completion:Fire()
					return
				else
					KeepLastHeld = KeepLastHeld + DeltaTime
					return
				end
			end
		end
		ApplyFrame()
	end
	function Class:Play(Speed)
		if Speed and Speed < 0 then Speed = math.abs(Speed) end
		Class.Speed = math.clamp(Speed or 180, 1, 180)
		Class.Stopped = false
		Class.IsPlaying = true
		Class.TimePosition = 0
		LastKeyframe = 0
		KeepLastHeld = 0
		if Connection then Connection:Disconnect() Connection = nil end
		task.spawn(function()
			Connection = game:GetService("RunService").Stepped:Connect(OnStepped)
			ApplyFrame()
		end)
	end
	function Class:Stop()
		Class.Stopped = true
		Class.IsPlaying = false
		if Connection then Connection:Disconnect() Connection = nil end
	end
	function Class:AdjustSpeed(Speed)
		if Speed < 0 then Speed = math.abs(Speed) end
		Class.Speed = math.clamp(Speed or Class.Speed, 1, 180)
	end
	return Class
end








local RbxmxPath = Directories.RBXMs .. "Admin.rbxmx"
local RbxmxLink = "https://drive.usercontent.google.com/download?id=1sYex5UmZvaFkQrc6P8AW5cWyX1a3RGoQ&export=download"

local function RbxmxValid(Content)
	if type(Content) ~= "string" or #Content < 1000 then return false end
	local Head = string.sub(Content, 1, 200)
	local Tail = string.sub(Content, -200)
	return (string.find(Head, "<?xml") == 1 or string.find(Head, "<roblox") ~= nil)
		and string.find(Tail, "</roblox>") ~= nil
end
local function TryGetRbxmx()
	local Ok, Content = pcall(readfile, RbxmxPath)
	if Ok and RbxmxValid(Content) then
		return Content
	end
	return nil
end


local DLGui = Instance.new("ScreenGui")
DLGui.Name = "AdminNoliLoader"
DLGui.ResetOnSpawn = false
DLGui.Parent = game:GetService("CoreGui")
local DLFrame = Instance.new("Frame")
DLFrame.Size = UDim2.new(0, 420, 0, 170)
DLFrame.Position = UDim2.new(0.5, -210, 0.5, -85)
DLFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
DLFrame.BorderSizePixel = 0
DLFrame.Parent = DLGui
local DLCorner = Instance.new("UICorner")
DLCorner.CornerRadius = UDim.new(0, 8)
DLCorner.Parent = DLFrame
local DLTitle = Instance.new("TextLabel")
DLTitle.Size = UDim2.new(1, 0, 0, 50)
DLTitle.Position = UDim2.new(0, 0, 0, 12)
DLTitle.BackgroundTransparency = 1
DLTitle.Text = "Admin Noli - Loading Assets"
DLTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
DLTitle.Font = Enum.Font.SourceSansBold
DLTitle.TextSize = 26
DLTitle.Parent = DLFrame
local DLStatus = Instance.new("TextLabel")
DLStatus.Size = UDim2.new(1, -40, 0, 60)
DLStatus.Position = UDim2.new(0, 20, 0, 75)
DLStatus.BackgroundTransparency = 1
DLStatus.Text = "Initializing..."
DLStatus.TextColor3 = Color3.fromRGB(160, 170, 190)
DLStatus.Font = Enum.Font.SourceSans
DLStatus.TextSize = 15
DLStatus.TextWrapped = true
DLStatus.Parent = DLFrame
local function SetStatus(Text)
	DLStatus.Text = Text
end


if isfile(RbxmxPath) and not TryGetRbxmx() then
	SetStatus("Cached Admin.rbxmx is invalid, re-downloading...")
	pcall(delfile, RbxmxPath)
end

local DownloadStart = os.clock()
local TimerRunning = true
task.spawn(function() 
	while TimerRunning and DLGui and DLGui.Parent do
		task.wait(0.1)
		if TimerRunning and DLGui and DLGui.Parent then
			SetStatus(string.format("Downloading Admin.rbxmx (~42 MB)... %.1fs elapsed", os.clock() - DownloadStart))
		end
	end
end)

local Success, DownloadedBytes = false, 0
if isfile(RbxmxPath) and TryGetRbxmx() then
	Success = true
	SetStatus("Admin.rbxmx is already cached.")
else
	for Attempt = 1, 3 do
		SetStatus(string.format("Downloading Admin.rbxmx (~42 MB)... [attempt %d/3]", Attempt))
		local Ok, Data = pcall(game.HttpGet, game, RbxmxLink)
		if Ok and RbxmxValid(Data) then
			writefile(RbxmxPath, Data)
			DownloadedBytes = #Data
			Success = true
			break
		end
		local Reason = Ok and "incomplete data" or "request failed"
		SetStatus(string.format("Download failed: %s. Retrying (%d/3)...", Reason, Attempt))
		task.wait(1)
	end
end
TimerRunning = false

if Success then
	if DownloadedBytes > 0 then
		SetStatus(string.format("Downloaded %.1f MB in %.1fs", DownloadedBytes / 1048576, os.clock() - DownloadStart))
	else
		SetStatus("Admin.rbxmx is ready.")
	end
	task.wait(0.8)
else
	SetStatus("Download failed. Place Admin.rbxmx manually at: " .. RbxmxPath)
	task.wait(4)
	warn("Admin.rbxmx download failed. Manually place the file at " .. RbxmxPath)
end

if DLGui then DLGui:Destroy() end

if not Success then
	error("Admin.rbxmx could not be downloaded.")
end

local script = Game:GetObjects(getcustomasset(Directories.RBXMs .. "Admin.rbxmx"))[1]

local Character = Figure 
local Humanoid = Character:WaitForChild("Humanoid")
local Head = Character:WaitForChild("Head")
local Torso = Character:WaitForChild("Torso")
local LeftArm, RightArm = Character:WaitForChild("Left Arm"), Character:WaitForChild("Right Arm")
local LeftLeg, RightLeg = Character:WaitForChild("Left Leg"), Character:WaitForChild("Right Leg")
local RootPart = Character:WaitForChild("HumanoidRootPart")
pcall(function()
	Character:FindFirstChild("Animate"):Destroy()
	Humanoid:FindFirstChild("Animator"):Destroy()
end)


local Idle, Walking, Running, Enraged = false, false, false, false
local Debounce, Shift, CanHitbox = false, false, false
local MeleeHit = false
local HitboxConnection
local ObservantActive = false
local WarningConnection = nil
local TeleportingPart, WarningPart


local Mouse = Player:GetMouse()
local SetWalkSpeed = function(Speed) Humanoid.WalkSpeed = Speed end
local SetRootPartAnchor = function(Bool) RootPart.Anchored = Bool end

task.spawn(function()
	local ShitlockController = Player.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
	ShitlockController:FindFirstChild("BoundKeys").Value = "LeftControl, RightControl"
end)


local Animations = script:WaitForChild("Animations")
local Objects = script:WaitForChild("Objects")

local Camera = workspace.CurrentCamera

local PlaySound = function(Audio)
	local Sound = Instance.new("Sound", RootPart)
	Sound.SoundId = "rbxassetid://" .. Audio
	Sound.Volume = 1
	if Settings.Earrape then
		Sound.Volume = 10
		Instance.new("DistortionSoundEffect", Sound)
	end
	Sound.PlayOnRemove = true
	Sound:Destroy()
end

local PlaySoundFromDisk = function(Audio)
	local Sound = Instance.new("Sound", RootPart)
	Sound.SoundId = getcustomasset(Directories.Sounds .. Audio)
	Sound.Volume = 1
	if Settings.Earrape then
		Sound.Volume = 10
		Instance.new("DistortionSoundEffect", Sound)
	end
	Sound.PlayOnRemove = true
	Sound:Destroy()
end

local Theme = nil
pcall(function()
	Theme = Instance.new("Sound", RootPart)
	Theme.SoundId = getcustomasset(Directories.Sounds .. "Chase.mp3")
	Theme.Volume = 1
	Theme.Looped = true
	Theme:Play()
end)

local Ambience = nil
pcall(function()
	Ambience = Instance.new("Sound", RootPart)
	Ambience.SoundId = getcustomasset(Directories.Sounds .. "Ambience.mp3")
	Ambience.Volume = 0.5
	Ambience.Looped = true
	Ambience:Play()
end)

local Voidstar = Objects:WaitForChild("Voidstar"):Clone()
Voidstar.Parent = Character
local VoidstarWeld = Instance.new("Weld")
VoidstarWeld.Name = "Voidstar"
VoidstarWeld.Parent = RootPart
VoidstarWeld.Part0 = RootPart
VoidstarWeld.Part1 = Voidstar
VoidstarWeld.C0 = CFrame.new(0, -0.1, 0)
VoidstarWeld.C1 = CFrame.new(0, -0.1, 0)


local function SetTransparency(Model, Value)
	if Model:IsA("BasePart") then Model.Transparency = Value end
	for _, v in pairs(Model:GetDescendants()) do
		if v:IsA("BasePart") then v.Transparency = Value end
	end
end
local HasVoidstarAcc = false
for _, WMap in pairs(WeaponAccessoryMap) do
	if WMap and WMap.Part and WMap.Part.Name == "Reanimate_Voidstar" then
		HasVoidstarAcc = true
	end
end
SetTransparency(Voidstar, HasVoidstarAcc and 1 or 0)

local ReanimateVS = Character:FindFirstChild("Reanimate_Voidstar")



local ReanimateVSW = Instance.new("Weld")
ReanimateVSW.Name = "VSW"
ReanimateVSW.Parent = ReanimateVS
ReanimateVSW.Part0 = Voidstar
ReanimateVSW.Part1 = ReanimateVS

local TeleportingPartTemplate = Objects:FindFirstChild("GeneratorIncoming"):Clone()
local WarningPartTemplate = Objects:FindFirstChild("GeneratorWarning"):Clone()
WarningPartTemplate.Anchored = true
WarningPartTemplate.CanCollide = false
TeleportingPartTemplate.Anchored = true
TeleportingPartTemplate.CanCollide = false

local FlashHitHighlight = function(Target)
	if not Target or not Target:IsA("Model") then return end
	if Target:FindFirstChild("HitHighlight") then return end
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "HitHighlight"
	Highlight.Adornee = Target
	Highlight.FillColor = Color3.fromRGB(255, 60, 60)
	Highlight.OutlineColor = Color3.fromRGB(145, 0, 0)
	Highlight.FillTransparency = 1
	Highlight.OutlineTransparency = 1
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = Target
	local FlashIn = TweenService:Create(Highlight, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { FillTransparency = 0.3, OutlineTransparency = 0 })
	local FadeOut = TweenService:Create(Highlight, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { FillTransparency = 1, OutlineTransparency = 1 })
	FlashIn:Play()
	FlashIn.Completed:Once(function() FadeOut:Play() end)
	FadeOut.Completed:Once(function() Highlight:Destroy() end)
end


local FlingVelocity = V3new(16384, 16384, 16384)
local Targets = {}
local DefaultFlingOptions = {
	HatFling = false,
	Highlight = false,
	PredictionFling = true,
	Timeout = 0.25,
	ToolFling = false,
}

local Fling = function(Target, Options)
	if not Target then return end
	if Target:IsA("Humanoid") then
		Target = Target.Parent
		if not Target then return end 
	end
	if Target:IsA("Model") then
		Target = Target:FindFirstChild("HumanoidRootPart") or Target:FindFirstChildOfClass("BasePart")
		if not Target then return end 
	end
	if not Target then return end
	if not table.find(Targets, Target) and Target:IsA("BasePart") and not Target.Anchored and not Target:IsDescendantOf(Character) then
		local Model = Target:FindFirstAncestorOfClass("Model")
		if Model and Model:FindFirstChildOfClass("Humanoid") then
			Target = Model:FindFirstChild("HumanoidRootPart") or Target
		else
			Model = Target
		end
		Insert(Targets, Target)
		Spawn(function()
			local RealRoot = RealChar:FindFirstChild("HumanoidRootPart")
			local FirstPosition = Target.Position
			local LastPosition = FirstPosition
			local Timeout = os.clock() + (Options.Timeout or 1)
			if RealRoot then
				Flinging = true
				pcall(function()
					while Target and Target:IsDescendantOf(Workspace) and os.clock() < Timeout do
						local DeltaTime = Wait()
						local Position = Target.Position
						if (Position - FirstPosition).Magnitude > 100 then
							break
						end
						local Offset = V3new()
						if Options.PredictionFling then
							local BaseOffset = (Position - LastPosition) / DeltaTime * 0.13
							local Frequency = Reanimate_Settings.Frequency
							local Amplification = Reanimate_Settings.Amplification
							local TimeNow = tick()
							local TargetFace = Target.CFrame.LookVector
							local Oscillation = math.sin(TimeNow * math.pi * 2 * Frequency) * Amplification
							local OscillatedOffset = TargetFace * Oscillation
							local FrontFaceOffset = TargetFace * Reanimate_Settings.FrontOffset
							Offset = BaseOffset + OscillatedOffset + FrontFaceOffset
						end
						RealRoot.AssemblyAngularVelocity = FlingVelocity
						RealRoot.AssemblyLinearVelocity = FlingVelocity
						RealRoot.CFrame = CFrame.new(Target.Position + Offset) * CFrame.Angles(0, Target.Orientation.Y, 0)
						LastPosition = Position
					end
				end)
				Flinging = false
				pcall(function()
					RealRoot.AssemblyAngularVelocity = V3new()
					RealRoot.AssemblyLinearVelocity = V3new()
				end)
			end
			Targets[table.find(Targets, Target)] = nil
		end)
	end
end


local PlayAnim = function(Rig, Animation, AnimSpeed)
	if not AnimatorModule[Rig] then
		AnimatorModule[Rig] = {}
	end
	if not AnimatorModule[Rig][Animation.Name] then
		AnimatorModule[Rig][Animation.Name] = AnimatorModule:LoadAnimation(Rig, Animation)
	end
	for Name, Track in pairs(AnimatorModule[Rig]) do
		if Name ~= Animation.Name then
			Track:Stop()
		end
	end
	local AnimInstance = AnimatorModule[Rig][Animation.Name]
	if not AnimInstance.IsPlaying then
		AnimInstance:Play(AnimSpeed or 1)
	end
	return AnimInstance
end

local StopAnim = function(Rig, Anim)
	if not AnimatorModule[Rig] then
		AnimatorModule[Rig] = {}
	end
	if not AnimatorModule[Rig][Anim.Name] then
		AnimatorModule[Rig][Anim.Name] = AnimatorModule:LoadAnimation(Rig, Anim)
	end
	AnimatorModule[Rig][Anim.Name]:Stop()
end

local RestoreMovement = function()
	if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
		Idle = true
		Walking = false
		Running = false
		PlayAnim(Character, Animations.Idle, 1)
	elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
		Idle = false
		Walking = true
		Running = false
		PlayAnim(Character, Animations.Walk, 1)
	end
end


local EnableHitbox = function()
	if HitboxConnection then
		HitboxConnection:Disconnect()
		HitboxConnection = nil
	end
	HitboxConnection = Voidstar.Touched:Connect(function(Hit)
		if not CanHitbox then return end
		if Hit:IsDescendantOf(Character) then return end
		local Target = Hit:FindFirstAncestorOfClass("Model")
		local TargetHumanoid = Target and Target:FindFirstChildOfClass("Humanoid")
		if TargetHumanoid then
			PlaySound(3417831369)
			if Settings.Fling then
				Fling(Target, DefaultFlingOptions)
			end
			FlashHitHighlight(Target)
			HitboxConnection:Disconnect()
			HitboxConnection = nil
		end
	end)
end




local IntroCameraAnimation = function()
	if not Settings.CameraEffects then return end
	local StartTime = tick()
	Camera.CameraType = Enum.CameraType.Scriptable
	local Index = 1
	local Connection
	Connection = RunService.RenderStepped:Connect(function()
		if Index >= #IntroKeyframes then Connection:Disconnect() Camera.CameraType = Enum.CameraType.Custom return end
		local CurrentTime = tick() - StartTime
		local KF1 = IntroKeyframes[Index]
		local KF2 = IntroKeyframes[Index + 1]
		local DeltaTime = KF2.Time - KF1.Time
		local Alpha = DeltaTime == 0 and 1 or math.clamp((CurrentTime - KF1.Time) / DeltaTime, 0, 1)
		local CF1 = KF1.CFrames.MainCFrame
		local CF2 = KF2.CFrames.MainCFrame
		local OffsetCFrame = CF1:Lerp(CF2, Alpha)
		Camera.CFrame = RootPart.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * OffsetCFrame
		if CurrentTime >= KF2.Time then
			Index = Index + 1
		end
	end)
end

local OutroCameraAnimation = function()
	if not Settings.CameraEffects then return end
	local StartTime = tick()
	Camera.CameraType = Enum.CameraType.Scriptable
	local Index = 1
	local Connection
	Connection = RunService.RenderStepped:Connect(function()
		if Index >= #OutroKeyframes then Connection:Disconnect() Camera.CameraType = Enum.CameraType.Custom return end
		local CurrentTime = tick() - StartTime
		local KF1 = OutroKeyframes[Index]
		local KF2 = OutroKeyframes[Index + 1]
		local DeltaTime = KF2.Time - KF1.Time
		local Alpha = DeltaTime == 0 and 1 or math.clamp((CurrentTime - KF1.Time) / DeltaTime, 0, 1)
		local CF1 = KF1.CFrames.MainCFrame
		local CF2 = KF2.CFrames.MainCFrame
		local OffsetCFrame = CF1:Lerp(CF2, Alpha)
		Camera.CFrame = RootPart.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * OffsetCFrame
		if CurrentTime >= KF2.Time then
			Index = Index + 1
		end
	end)
end


local Intro = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
	local IntroAnimation = PlayAnim(Character, Animations.Introduction_KillerRig, 1)
	IntroCameraAnimation()
	PlaySound(124667791992796)
	IntroAnimation.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	Camera.CameraType = Enum.CameraType.Custom
	RestoreMovement()
end

local Outro = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
	local OutroAnimation = PlayAnim(Character, Animations.Victory_KillerRig, 1)
	OutroCameraAnimation()
	PlaySound(125557917165272)
	OutroAnimation.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	Camera.CameraType = Enum.CameraType.Custom
	RestoreMovement()
end

local Stun = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
	PlaySoundFromDisk("Stun.mp3")
	PlaySound(92316384695634)
	PlaySound(17837549788)
	local StunStart = PlayAnim(Character, Animations.Stunned_Start, 1)
	StunStart.Completed:Wait()
	local StunnedLoop = PlayAnim(Character, Animations.Stunned_Loop, 1)
	StunnedLoop.Completed:Wait(5)
	local StunnedEnd = PlayAnim(Character, Animations.Stunned_End, 1)
	StunnedEnd.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	RestoreMovement()
end

local Execute = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
	PlaySound(104206188941961)
	PlaySoundFromDisk("Execution.mp3")
	local KillerAnimation = PlayAnim(Character, Animations.Execution_KillerRig, 0, 1.2)
	KillerAnimation.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	RestoreMovement()
end

local Stab = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	CanHitbox = true
	EnableHitbox()
	local StabAnimation = PlayAnim(Character, Animations.Stab, 1)
	PlaySoundFromDisk("Stab.mp3")
	StabAnimation.Completed:Wait()
	Debounce = false
	CanHitbox = false
	RestoreMovement()
end

local Void_Rush = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	local Damaged = false
	SetRootPartAnchor(false)
	local StartAnim = PlayAnim(Character, Animations.VoidRush_StartDashInit, 0, 1)
	PlaySoundFromDisk("VoidRushStart.mp3")
	StartAnim.Completed:Wait()
	SetRootPartAnchor(false)
	local LoopAnim = PlayAnim(Character, Animations.VoidRush_LoopDashInit, 0, 1)
	local RushVelocity = Instance.new("BodyVelocity")
	RushVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
	RushVelocity.Parent = RootPart
	local VelocityUpdate
	VelocityUpdate = RunService.Heartbeat:Connect(function()
		RushVelocity.Velocity = RootPart.CFrame.LookVector * 45
	end)
	local TouchedConnection
	TouchedConnection = RootPart.Touched:Connect(function(Hit)
		if Hit:IsDescendantOf(Character) then return end
		local Hum = Hit.Parent:FindFirstChildOfClass("Humanoid")
		if Hum and not Damaged then
			Damaged = true
			RushVelocity:Destroy()
			VelocityUpdate:Disconnect()
			TouchedConnection:Disconnect()
			SetRootPartAnchor(true)
			PlaySound(117069245824496)
			local FirstHitAnimation = PlayAnim(Character, Animations.VoidRush_WeakHit, 0, 1)
			FirstHitAnimation.Completed:Wait()
			SetRootPartAnchor(false)
			local LoopAnimation = PlayAnim(Character, Animations.VoidRush_LoopDashInit, 0, 1)
			local SecondRushVelocity = Instance.new("BodyVelocity")
			SecondRushVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			SecondRushVelocity.Parent = RootPart
			local SecondVelocityUpdate
			SecondVelocityUpdate = RunService.Heartbeat:Connect(function()
				SecondRushVelocity.Velocity = RootPart.CFrame.LookVector * 45 * 1.2
			end)
			local SecondHit = false
			local SecondTouched
			local VoidRush2Sound = Instance.new("Sound", RootPart)
			VoidRush2Sound.SoundId = "rbxassetid://110418348779758"
			VoidRush2Sound:Play()
			SecondTouched = RootPart.Touched:Connect(function(Hit2)
				if Hit2:IsDescendantOf(Character) then return end
				local Target = Hit2:FindFirstAncestorOfClass("Model")
				local Hum2 = Target:FindFirstChildOfClass("Humanoid")
				if Hum2 and not SecondHit then
					SecondHit = true
					VoidRush2Sound:Stop()
					VoidRush2Sound:Destroy()
					SecondTouched:Disconnect()
					SecondVelocityUpdate:Disconnect()
					SecondRushVelocity:Destroy()
					SetRootPartAnchor(true)
					PlaySoundFromDisk("VoidRushSlam.mp3")
					FlashHitHighlight(Target)
					local SlamAnimation = PlayAnim(Character, Animations.VoidRush_KillerRig, 0, 1.2)
					SlamAnimation.Completed:Wait()
					if Settings.Fling then
						Fling(Target, DefaultFlingOptions)
					end
					Debounce = false
					SetRootPartAnchor(false)
					RestoreMovement()
				end
			end)
			task.delay(1, function()
				if not SecondHit then
					if SecondTouched.Connected then SecondTouched:Disconnect() end
					SecondVelocityUpdate:Disconnect()
					SecondRushVelocity:Destroy()
					SetRootPartAnchor(true)
					PlaySound(85216662975005)
					VoidRush2Sound:Stop()
					VoidRush2Sound:Destroy()
					local MissAnimation = PlayAnim(Character, Animations.VoidRush_EndDash, 0, 1)
					MissAnimation.Completed:Wait()
					Debounce = false
					SetRootPartAnchor(false)
					RestoreMovement()
				end
			end)
		end
	end)
	task.delay(0.35 + 1, function()
		if Damaged then return end
		if TouchedConnection.Connected then TouchedConnection:Disconnect() end
		VelocityUpdate:Disconnect()
		RushVelocity:Destroy()
		SetRootPartAnchor(true)
		PlaySound(71208557852255)
		local MissAnimation = PlayAnim(Character, Animations.VoidRush_EndDash, 0, 1)
		MissAnimation.Completed:Wait()
		Debounce = false
		SetRootPartAnchor(false)
		RestoreMovement()
	end)
end

local Observant = function()
	if Debounce then return end
	if ObservantActive then
		if WarningConnection then
			WarningConnection:Disconnect()
			WarningConnection = nil
		end
		if WarningPart then
			WarningPart:Destroy()
			WarningPart = nil
		end
		PlaySoundFromDisk("ObservantCancel.mp3")
		SetRootPartAnchor(false)
		ObservantActive = false
		Debounce = false
		RestoreMovement()
		return
	end
	Debounce = true
	ObservantActive = true
	PlaySoundFromDisk("ObservantStart.mp3")
	local ObservantStart = PlayAnim(Character, Animations.ObservantStart, 1)
	SetRootPartAnchor(true)
	local StartConn
	StartConn = ObservantStart.Completed:Connect(function()
		if not ObservantActive then
			StartConn:Disconnect()
			Debounce = false
			return
		end
		local ObservantLoop = PlayAnim(Character, Animations.ObservantLoop, 1)
		SetRootPartAnchor(true)
		WarningPart = WarningPartTemplate:Clone()
		WarningPart.Parent = workspace
		WarningConnection = RunService.RenderStepped:Connect(function()
			if ObservantActive and Mouse.Hit then
				WarningPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 1.745, 0))
			end
		end)
		Debounce = false
		StartConn:Disconnect()
	end)
end

local ObservantTeleport = function()
	if not ObservantActive then return end
	if Debounce then return end
	Debounce = true
	if WarningConnection then
		WarningConnection:Disconnect()
		WarningConnection = nil
	end
	if WarningPart then
		WarningPart:Destroy()
		WarningPart = nil
	end
	local ObservantTeleport = PlayAnim(Character, Animations.ObservantTeleport, 1)
	PlaySoundFromDisk("ObservantTeleport.mp3")
	local ObservantEvent
	local MousePosition = Mouse.Hit.Position
	TeleportingPart = TeleportingPartTemplate:Clone()
	TeleportingPart.CFrame = CFrame.new(MousePosition + Vector3.new(0, 1.745, 0))
	TeleportingPart.Parent = workspace
	PlaySound(99944767357389)
	ObservantEvent = ObservantTeleport.KeyframeReached:Connect(function(Keyframe)
		if Keyframe == "Teleport" then
			if Mouse.Hit then
				RootPart.CFrame = CFrame.new(MousePosition + Vector3.new(0, 3, 0))
			end
			ObservantEvent:Disconnect()
		end
	end)
	ObservantTeleport.Completed:Wait()
	if TeleportingPart then
		TeleportingPart:Destroy()
		TeleportingPart = nil
	end
	ObservantActive = false
	Debounce = false
	SetRootPartAnchor(false)
	RestoreMovement()
end

local NovaShoot = function()
	if Debounce then return end
	if ObservantActive then return end
	Debounce = true
	local Damaged, Thrown = false, false
	local Projectile, ProjectileVelocity, Touched
	local ThrowConnection
	local NovaShootAnimation = PlayAnim(Character, Animations.NovaThrow, 1)
	PlaySoundFromDisk("NovaThrow.mp3")
	ThrowConnection = NovaShootAnimation.KeyframeReached:Connect(function(Keyframe)
		if Keyframe == "Thrown" and not Thrown then
			Thrown = true
			Projectile = Voidstar:Clone()
			Projectile.Anchored = false
			Projectile.CanCollide = false
			Projectile.CFrame = CFrame.new(RootPart.Position + RootPart.CFrame.LookVector * 5, Mouse.Hit.Position)
			Projectile.Parent = workspace
			ProjectileVelocity = Instance.new("BodyVelocity")
			ProjectileVelocity.Velocity = (Mouse.Hit.Position - Projectile.Position).Unit * 100
			ProjectileVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			ProjectileVelocity.Parent = Projectile
			Debris:AddItem(Projectile, 3)
			Debris:AddItem(ProjectileVelocity, 3)
			Touched = Projectile.Touched:Connect(function(Hit)
				if Damaged then return end
				if Hit:IsDescendantOf(Character) then return end
				local Target = Hit:FindFirstAncestorOfClass("Model")
				if Hit == Projectile then return end
				local HitHumanoid = Hit.Parent:FindFirstChildOfClass("Humanoid")
				if not HitHumanoid then return end
				Damaged = true
				FlashHitHighlight(Target)
				if Settings.Fling then
					Fling(Target, DefaultFlingOptions)
				end
				if ProjectileVelocity then ProjectileVelocity:Destroy() end
				if Projectile then Projectile:Destroy() end
				if Touched then Touched:Disconnect() end
				PlaySoundFromDisk("NovaExplode.mp3")
			end)
		end
	end)
	NovaShootAnimation.Completed:Wait()
	if ThrowConnection and ThrowConnection.Connected then
		ThrowConnection:Disconnect()
	end
	if Touched and Touched.Connected then
		Touched:Disconnect()
	end
	local NovaStart = PlayAnim(Character, Animations.NovaStart, 1)
	NovaStart.Completed:Wait()
	Debounce = false
	RestoreMovement()
end


local KeyDown = Connect(UserInputService.InputBegan, function(Key, GPE)
	if GPE then return end
	if Key.KeyCode == Enum.KeyCode.One then
		Stun()
	end
	if Key.KeyCode == Enum.KeyCode.Two then
		Intro()
	end
	if Key.KeyCode == Enum.KeyCode.Three then
		Outro()
	end
	if Key.KeyCode == Enum.KeyCode.Q then
		Void_Rush()
	end
	if Key.KeyCode == Enum.KeyCode.E then
		NovaShoot()
	end
	if Key.KeyCode == Enum.KeyCode.R then
		Observant()
	end
	if Key.KeyCode == Enum.KeyCode.Z then
		Execute()
	end
	if Key.UserInputType == Enum.UserInputType.MouseButton1 then
		if ObservantActive then
			ObservantTeleport()
		elseif not Debounce then
			Stab()
		end
	end
	if Key.UserInputType == Enum.UserInputType.Touch then
		if ObservantActive then
			ObservantTeleport()
		end
	end
	if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
		if Debounce then return end
		Shift = true
		local Tween = TweenService:Create(Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { FieldOfView = 90 })
		Tween:Play()
	end
end)

local KeyUp = Connect(UserInputService.InputEnded, function(Key)
	if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
		Shift = false
		local Tween = TweenService:Create(Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { FieldOfView = 80 })
		Tween:Play()
	end
end)


local GUI = script:WaitForChild("UIs").MobileUI
GUI.Parent = game:GetService("CoreGui")

local UpdateUI = function()
	local LastInput = UserInputService:GetLastInputType()
	if LastInput == Enum.UserInputType.Touch then
		GUI.Enabled = true
	else
		GUI.Enabled = false
	end
end

UpdateUI()

GUI.AbilitiesUI["Stab"].MouseButton1Down:connect(function() Stab() end)
GUI.AbilitiesUI["Nova"].MouseButton1Down:connect(function() NovaShoot() end)
GUI.AbilitiesUI["Observant"].MouseButton1Down:connect(function() Observant() end)
GUI.AbilitiesUI["Void Rush"].MouseButton1Down:connect(function() Void_Rush() end)
GUI.AbilitiesUI["Sprint"].MouseButton1Down:connect(function() Shift = not Shift end)
GUI.AbilitiesUI["Intro"].MouseButton1Down:connect(function() Intro() end)
GUI.AbilitiesUI["Outro"].MouseButton1Down:connect(function() Outro() end)
GUI.AbilitiesUI["Execute"].MouseButton1Down:connect(function() Execute() end)
GUI.AbilitiesUI["Stun"].MouseButton1Down:connect(function() Stun() end)

Connect(UserInputService.LastInputTypeChanged, UpdateUI)


local MainGUI = script.UIs:WaitForChild("MainGUI")
MainGUI.Parent = game:GetService("CoreGui")

local SettingsFrame = MainGUI:WaitForChild("SettingsFrame")
local SettingsHolder = SettingsFrame:WaitForChild("SettingsHolder")

local SetupToggle = function(Setting)
	local Object = SettingsHolder:FindFirstChild(Setting)
	if not Object then return end
	local Button = Object:FindFirstChildWhichIsA("TextButton")
	if not Button then return end
	Button.BackgroundColor3 = Settings[Setting] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
	Button.MouseButton1Click:Connect(function()
		Settings[Setting] = not Settings[Setting]
		Button.BackgroundColor3 = Settings[Setting] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
	end)
end

for i, v in pairs(Settings) do
	local Object = SettingsHolder:FindFirstChild(i)
	if Object then
		if Object:FindFirstChild("Button") then
			SetupToggle(i)
		end
	end
end

local FloatingButton = MainGUI:WaitForChild("FloatingButton")
FloatingButton.Draggable = true
FloatingButton.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = not SettingsFrame.Visible
end)

Connect(UserInputService.JumpRequest, function()
	if Settings.InfiniteJump and Humanoid then
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

SettingsHolder.TPToNearestSpawn.Button.MouseButton1Click:Connect(function()
	local RootPart = Character:FindFirstChild("HumanoidRootPart")
	local GetClosestSpawn = function()
		local ClosestSpawn, ClosestDistance = nil, math.huge
		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("SpawnLocation") then
				local Distance = (RootPart.Position - v.Position).Magnitude
				if Distance < ClosestDistance then
					ClosestSpawn = v
					ClosestDistance = Distance
				end
			end
		end
		return ClosestSpawn
	end
	local Spawn = GetClosestSpawn()
	if Spawn then
		RootPart.CFrame = Spawn.CFrame + Vector3.new(0, 5, 0)
	else
		print("No spawn or a spawn is somehow (??? how tf) too far")
	end
end)


local RunServiceConnection = Connect(Heartbeat, function(dt)
	Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp((RootPart.CFrame * CFrame.new(0, 1.5, 0)):PointToObjectSpace(Head.Position), math.clamp(8 * 60 * 60, 0, 1))
	if Theme then
		if Settings.Music then
			Theme.Playing = true
		else
			Theme.Playing = false
		end
	end
	if Settings.Spin and Character.PrimaryPart then
		Character:SetPrimaryPartCFrame(Character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
	end
	if Debounce then
		StopAnim(Character, Animations.Idle)
		StopAnim(Character, Animations.Walk)
		StopAnim(Character, Animations.Sprint)
	end
	if not Debounce then
		if Shift then
			SetWalkSpeed(24)
		else
			SetWalkSpeed(15)
		end
	end
	local HitFloor, HitPosition = workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character)
	local TorsoVelocity = (RootPart.Velocity).Magnitude
	local TorsoVerticalVelocity = RootPart.Velocity.Y
	if TorsoVelocity < 1 and HitFloor ~= nil and Debounce == false then
		if Idle == false then
			Idle = true
			PlayAnim(Character, Animations.Idle, 1)
		end
		Walking = false
		Running = false
		StopAnim(Character, Animations.Sprint)
		StopAnim(Character, Animations.Walk)
	elseif TorsoVelocity > 1 and HitFloor ~= nil and Debounce == false and Shift == true then
		if Running == false then
			Running = true
			PlayAnim(Character, Animations.Sprint, 1)
		end
		Idle = false
		Walking = false
		StopAnim(Character, Animations.Walk)
		StopAnim(Character, Animations.Idle)
	elseif TorsoVelocity > 1 and HitFloor ~= nil and Debounce == false then
		if Walking == false then
			Walking = true
			PlayAnim(Character, Animations.Walk, 1)
		end
		Idle = false
		Running = false
		StopAnim(Character, Animations.Sprint)
		StopAnim(Character, Animations.Idle)
	end
end)

local LoaderUI = GetScript("IntroAndDetector.luau", "https://gist.githubusercontent.com/MelonsStuff/adc8fbb119234b04744907ff26a407f8/raw/6d501829e2d6f376f57ed3777b4915ad609981cf/IntroAndDetector.luau")()