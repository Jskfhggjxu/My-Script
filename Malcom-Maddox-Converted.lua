function Gelatek()
-- Credits:
--[[
	Gelatek - Everything
	Emper - Optimization Tips
	Syndi/Mizt - Hat Renamer (to be changed with own one later)


]]
local Game=game
local RunService=Game:GetService("RunService")
local StartGui=Game:GetService("StarterGui")
local TestService=Game:GetService("TestService")
local Workspace=Game:GetService("Workspace")
local Players=Game:GetService("Players")
local PreSim=RunService.PreSimulation
local PostSim=RunService.PostSimulation
local CurrentCam=Workspace.CurrentCamera

local Speed=tick()
local Warn=warn
local Error=error

local Wait=task.wait
local Infinite=math.huge
local V3new=Vector3.new
local INew=Instance.new
local CFNew=CFrame.new
local CFAngles=CFrame.Angles
local MathRandom=math.random
local Insert=table.insert
local Clear=table.clear
local Type=type

local Global=(getgenv and getgenv()) or shared
local DisScripts=true
if not Global.GelatekHubConfig then Global.GelatekHubConfig={} end
local PermanentDeath=Global.GelatekHubConfig["Permanent Death"]  or true
local CollideFling=Global.GelatekHubConfig["Torso Fling"]  or true
local BulletEnabled=Global.GelatekHubConfig["Bullet Enabled"] or true
local KeepHairWelds=Global.GelatekHubConfig["Keep Hats On Head"] or true
local HeadlessPerma=Global.GelatekHubConfig["Headless On Perma"] or false
local DisableAnimations=Global.GelatekHubConfig["Disable Anims"] or true
local Collisions=Global.GelatekHubConfig["Enable Collisions"] or true
local AntiVoid=Global.GelatekHubConfig["Anti Void"] or false
if CollideFling and BulletEnabled then CollideFling=false end
if not Global.TableOfEvents then Global.TableOfEvents={} end

local Player=Players.LocalPlayer
local Character=Player.Character
if Character.Name == "GelatekReanimate" then Error("Reanimation Already Working") end
if (not Character:FindFirstChildOfClass("Humanoid")) or Character:FindFirstChildOfClass("Humanoid").Health == 0 then Error("Player Is Dead.") end

local PlayerDied=false
local IGNORETORSOCHECK="Torso"
local Is_NetworkOwner=isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
local HiddenProps=sethiddenproperty or function() end 

local SpawnPoint=Workspace:FindFirstChildOfClass("SpawnLocation",true) and Workspace:FindFirstChildOfClass("SpawnLocation",true) or CFrame.new(0,20,0)

-- [[ Events ]] --
local PostSimEvent
local PreSimEvent
local TorsoFlingEvent
local DeathEvent
local ResetEvent

local BulletInfo=nil
local HatData=nil

local CF0=CFNew(0,0,0)
local Velocity=V3new(0,-26,0)


Global.PartDisconnected=false
local Humanoid=Character:FindFirstChildWhichIsA("Humanoid")
if not Humanoid then return end
local RootPart=Character:FindFirstChild("HumanoidRootPart")
local R15=Humanoid.RigType.Name == "R15" and true or false
local Sin, Cos, Inf, Clamp, Clock=math.sin, math.cos, math.huge, math.clamp, os.clock
local FakeHats=INew("Folder"); do FakeHats.Name="FakeHats"; FakeHats.Parent=TestService end
Character.Archivable=true
Humanoid:ChangeState(16)


for Index, RagdollStuff in pairs(Character:GetDescendants()) do
	if RagdollStuff:IsA("BallSocketConstraint") or RagdollStuff:IsA("HingeConstraint") then
		RagdollStuff:Destroy()
	end
end


-- Mizt's Hat Renamer
local HatsNames={}
for Index, Accessory in pairs(Character:GetDescendants()) do
	if Accessory:IsA("Accessory") then
		if HatsNames[Accessory.Name] then
			if HatsNames[Accessory.Name] == "Unknown" then
				HatsNames[Accessory.Name]={}
			end
			Insert(HatsNames[Accessory.Name], Accessory)
		else
			HatsNames[Accessory.Name]="Unknown"
		end	
	end
end
for Index, Tables in pairs(HatsNames) do
	if Type(Tables) == "table" then
		local Number=1
		for Index2, Names in ipairs(Tables) do
			Names.Name=Names.Name .. Number
			Number=Number + 1
		end		
	end
end
Clear(HatsNames)

local Figure=INew("Model"); do
	local Limbs={}
	local Attachments={}
	function CreateJoint(Name,Part0,Part1,C0,C1)
		local Joint=INew("Motor6D"); Joint.Name=Name
		Joint.Part0=Part0; Joint.Part1=Part1
		Joint.C0=C0; Joint.C1=C1
		Joint.Parent=Part0
	end
	for i=0,18 do
		local Attachment=INew("Attachment")
		Attachment.Axis,Attachment.SecondaryAxis=V3new(1,0,0), V3new(0,1,0)
		Insert(Attachments, Attachment)
	end
	for i=0,3 do
		local Limb=INew("Part")
		Limb.Size=V3new(1, 2, 1); Limb.CanCollide=false
		Limb.Parent=Figure
		Insert(Limbs, Limb)
	end
	Limbs[1].Name="Right Arm"; Limbs[2].Name="Left Arm"
	Limbs[3].Name="Right Leg"; Limbs[4].Name="Left Leg"
	local Head=INew("Part")
	Head.Size=V3new(2,1,1)
	Head.Locked=true; Head.CanCollide=false
	Head.Name="Head"
	Head.Parent=Figure
	local Torso=INew("Part")
	Torso.Size=V3new(2, 2, 1)
	Torso.Locked=true; Torso.CanCollide=false
	Torso.Name="Torso"
	Torso.Parent=Figure
	local Root=Torso:Clone()
	Root.Transparency=1
	Root.Name="HumanoidRootPart"
	Root.Parent=Figure
	CreateJoint("Neck", Torso, Head, CFNew(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("RootJoint", Root, Torso, CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("Right Shoulder", Torso, Limbs[1], CFNew(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Shoulder", Torso, Limbs[2], CFNew(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	CreateJoint("Right Hip", Torso, Limbs[3], CFNew(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Hip", Torso, Limbs[4], CFNew(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	local Humanoid=INew("Humanoid")
	Humanoid.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None
	Humanoid.Parent=Figure
	if not DisScripts then
	local Animator=INew("Animator", Humanoid)
	end
	local HumanoidDescription=INew("HumanoidDescription", Humanoid)
	local HeadMesh=INew("SpecialMesh")
	HeadMesh.Scale=V3new(1.25, 1.25, 1.25)
	HeadMesh.Parent=Head
	local Face=INew("Decal")
	Face.Name="face"
	Face.Texture="http://www.roblox.com/asset/?id=158044781"
	Face.Parent=Head
	local Animate=INew("LocalScript")
	Animate.Name="Animate"
	Animate.Parent=Figure
	local Health=INew("Script")
	Health.Name="Health"
	Health.Parent=Figure
	if DisScripts then
	  Animate.Enabled=false
	  Animate.Disabled=true
	  else 
	  Animate.Enabled=true
	  Animate.Disabled=false
	  end
	Attachments[1].Name="FaceCenterAttachment"; Attachments[1].Position=V3new(0, 0, 0)
	Attachments[2].Name="FaceFrontAttachment"; Attachments[2].Position=V3new(0, 0, -0.6)
	Attachments[3].Name="HairAttachment"; Attachments[3].Position=V3new(0, 0.6, 0)
	Attachments[4].Name="HatAttachment"; Attachments[4].Position=V3new(0, 0.6, 0)
	Attachments[5].Name="RootAttachment"; Attachments[5].Position=V3new(0, 0, 0)
	Attachments[6].Name="RightGripAttachment"; Attachments[6].Position=V3new(0, -1, 0)
	Attachments[7].Name="RightShoulderAttachment"; Attachments[7].Position=V3new(0, 1, 0)
	Attachments[8].Name="LeftGripAttachment"; Attachments[8].Position=V3new(0, -1, 0)
	Attachments[9].Name="LeftShoulderAttachment"; Attachments[9].Position=V3new(0, 1, 0)
	Attachments[10].Name="RightFootAttachment"; Attachments[10].Position=V3new(0, -1, 0)
	Attachments[11].Name="LeftFootAttachment"; Attachments[11].Position=V3new(0, -1, 0)
	Attachments[12].Name="BodyBackAttachment"; Attachments[12].Position=V3new(0, 0, 0.5)
	Attachments[13].Name="BodyFrontAttachment"; Attachments[13].Position=V3new(0, 0, -0.5)
	Attachments[14].Name="LeftCollarAttachment"; Attachments[14].Position=V3new(-1, 1, 0)
	Attachments[15].Name="NeckAttachment"; Attachments[15].Position=V3new(0, 1, 0)
	Attachments[16].Name="RightCollarAttachment"; Attachments[16].Position=V3new(1, 1, 0)
	Attachments[17].Name="WaistBackAttachment"; Attachments[17].Position=V3new(0, -1, 0.5)
	Attachments[18].Name="WaistCenterAttachment"; Attachments[18].Position=V3new(0, -1, 0)
	Attachments[19].Name="WaistFrontAttachment"; Attachments[19].Position=V3new(0, -1, -0.5)
	Attachments[1].Parent=Head; Attachments[2].Parent=Head; Attachments[3].Parent=Head Attachments[4].Parent=Head
	Attachments[5].Parent=Root
	Attachments[6].Parent=Limbs[1]; Attachments[7].Parent=Limbs[1]
	Attachments[8].Parent=Limbs[2]; Attachments[9].Parent=Limbs[2]
	Attachments[10].Parent=Limbs[3]; Attachments[11].Parent=Limbs[4]
	for i=0,7 do Attachments[12 + i].Parent=Torso end
	Figure.Name="GelatekReanimate"
	Figure.PrimaryPart=Head
	Figure.Archivable=true
	Figure.Parent=Workspace
	Figure:MoveTo(RootPart.Position)
end

local FigureHum=Figure:FindFirstChildWhichIsA("Humanoid")
Figure:MoveTo(Character.Head.Position + V3new(0, 2.5, 0))
for i,v in pairs(Figure:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") then
		v.Transparency=1
	end
end

local FigureDescendants=Figure:GetDescendants()
local CharacterChildren=Character:GetChildren()

function VoidEvent()
	if AntiVoid == true then
		Figure:MoveTo(SpawnPoint.Position)
	else
		if PostSimEvent then PostSimEvent:Disconnect() end
		if PreSimEvent then PreSimEvent:Disconnect() end
		if DeathEvent then DeathEvent:Disconnect() end
		if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
		if ResetEvent then ResetEvent:Disconnect() end
		if FakeHats then FakeHats:Destroy() end
		pcall(function()
			CurrentCam.FieldOfView=70
			Global.Stopped=true
			for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
			Character.Parent=Workspace
			Player.Character=Workspace[Character.Name]
			Humanoid:ChangeState(15)
			if Figure then Figure:Destroy() end
			if TestService:FindFirstChild("ScriptCheck") then
				TestService:FindFirstChild("ScriptCheck"):Destroy()
			end
			Wait(0.125)
			Global.RealChar=nil
			Global.Stopped=false
		end)
	end
end

		
for i,v in pairs(Character:GetDescendants()) do -- Disable Scripts / Accessories
	if v:IsA("BasePart") then
		v.RootPriority=127
		local ClaimInfo=INew("SelectionBox"); do
			ClaimInfo.Adornee=v
			ClaimInfo.Name="ClaimCheck"
			ClaimInfo.Transparency=1
			ClaimInfo.Parent=v
		end
	end
	
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
	
	if v:IsA("Script") then
		v.Disabled=true
	end
	
	if v:IsA("Accessory") then
		local FakeAccessory=v:Clone()
		local Handle=FakeAccessory:FindFirstChild("Handle")
		pcall(function() Handle:FindFirstChildWhichIsA("Weld"):Destroy() end)
		local Weld=INew("Weld"); do
			Weld.Name="AccessoryWeld"
			Weld.Part0=Handle
		end
		local Attachment=Handle:FindFirstChildOfClass("Attachment")
		if Attachment then
			Weld.C0=Attachment.CFrame
			Weld.C1=Figure:FindFirstChild(tostring(Attachment), true).CFrame
			Weld.Part1=Figure:FindFirstChild(tostring(Attachment), true).Parent
		else
			Weld.Part1=Figure:FindFirstChild("Head")
			Weld.C1=CFNew(0,Figure:FindFirstChild("Head").Size.Y / 2,0) * FakeAccessory.AttachmentPoint:Inverse()
		end
		Handle.CFrame=Weld.Part1.CFrame * Weld.C1 * Weld.C0:Inverse()
		Handle.Transparency=1
		Weld.Parent=Handle
		FakeAccessory.Parent=Figure
		local FakeAccessory2=FakeAccessory:Clone()
		FakeAccessory2.Parent=FakeHats
	end
end
for i, v in next, Humanoid:GetPlayingAnimationTracks() do
	v:Stop();
end

if BulletEnabled == true then
	if R15 == false then
		if PermanentDeath == true then
			Character:FindFirstChild("HumanoidRootPart").Name="Bullet"
			BulletInfo={Character:FindFirstChild("Bullet"), Figure:FindFirstChild("HumanoidRootPart"), CF0}
			HatData=nil
		else
			Character:FindFirstChild("Right Leg").Name="Bullet"
			BulletInfo={Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Right Leg"), CF0}
			if Character:FindFirstChild("Robloxclassicred") then
				HatData={Character:FindFirstChild("Robloxclassicred"), Figure:FindFirstChild("Right Leg"), CFAngles(math.rad(90),0,0)}
				Character:FindFirstChild("Robloxclassicred").Handle:FindFirstChild("Mesh"):Destroy()
			else HatData=nil end
		end
	else
		Character:FindFirstChild("LeftUpperArm").Name="Bullet"
		BulletInfo={Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)}
		if Character:FindFirstChild("SniperShoulderL") then
			HatData={Character:FindFirstChild("SniperShoulderL"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.5, 0)}
		else HatData=nil end
	end
	if HatData then
		HatData[1].Handle:BreakJoints()
	end
	
	local Bullet=Character:FindFirstChild("Bullet")
	local Highlight=INew("SelectionBox"); do
		local Extra 
		Highlight.Adornee=Bullet
		Highlight.Name="Highlight"
		Highlight.Color3=Color3.fromRGB(255, 0, 0)
		Highlight.Parent=Bullet
		Extra=PreSim:Connect(function()
			if not Figure and Figure.Parent then Extra:Disconnect() end
			if (not TestService:FindFirstChild("ScriptCheck")) or Figure:FindFirstChild("AnimPlayer") then
				Highlight.Transparency=1
			else
				Highlight.Transparency=0
			end
		end)
	end
end

-- Collide Fling
if CollideFling == true then
	if R15 == false then
		local Torso=Character:FindFirstChild("Torso")
		if PermanentDeath == true then
			IGNORETORSOCHECK="adfasdkogpasdfjopghsfdjofipsdjghsfopgjospadgjsaj"
			task.spawn(function()
				Wait(1)
				local BodyAngularVelocity=INew("BodyAngularVelocity")
				BodyAngularVelocity.MaxTorque=V3new(1,1,1) * Infinite
				BodyAngularVelocity.P=math.huge
				BodyAngularVelocity.AngularVelocity=V3new(1950,1950,1950)
				BodyAngularVelocity.Name="TorsoFlinger"
				BodyAngularVelocity.Parent=Character:FindFirstChild("HumanoidRootPart")
			end)
		else
			TorsoFlingEvent=PostSim:Connect(function()
				if FigureHum.MoveDirection.Magnitude < 0.1 then
					Torso.Velocity=Velocity
				elseif FigureHum.MoveDirection.Magnitude > 0.1 then
					Torso.Velocity=V3new(1250,1250,1250)+Velocity
				end
			end)
		end
	else
		local Torso=Character:FindFirstChild("UpperTorso")
		TorsoFlingEvent=PostSim:Connect(function()
			if FigureHum.MoveDirection.Magnitude < 0.1 then
				Torso.RotVelocity=V3new()
			elseif FigureHum.MoveDirection.Magnitude > 0.1 then
				Torso.RotVelocity=V3new(2500,2500,2500)
			end
		end)
	end
end

if not TestService:FindFirstChild("OwnershipBoost") then
	local Part=INew("Part")
	Part.Name="OwnershipBoost"
	Part.Parent=TestService
	PreSim:Connect(function()
		HiddenProps(Player, "MaximumSimulationRadius", 10e+5)
		HiddenProps(Player, "SimulationRadius", Player.MaximumSimulationRadius)
	end)
end
local FallHeight=Workspace.FallenPartsDestroyHeight
function MiniRandom() return "0." .. MathRandom(6, 8) .. MathRandom(1, 9) .. MathRandom(1, 9) end
PreSimEvent=PreSim:Connect(function() -- Noclip
	local AntiVoidOffset=Global.GelatekHubConfig["Anti Void Offset"] or 75
	if Figure.HumanoidRootPart.Position.Y <= FallHeight + AntiVoidOffset then VoidEvent() end
	for _,v in pairs(CharacterChildren) do
		if v:IsA("BasePart") then
			v.CanCollide=false
		end
	end
	
	if not Collisions then
		for _,v in pairs(FigureDescendants) do
			if v:IsA("BasePart") then
				v.CanCollide=false
			end
		end
	end
end)

for i,v in pairs(Character:GetDescendants()) do -- Break Joints
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
end

for i,v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		local Attachment=v.Handle:FindFirstChildWhichIsA("Attachment")
		if KeepHairWelds == true and Attachment.Name ~= "HatAttachment" and Attachment.Name ~= "FaceFrontAttachment" and Attachment.Name ~= "HairAttachment" and Attachment.Name ~= "FaceCenterAttachment" then
			v.Handle:BreakJoints()
		end
		if KeepHairWelds == false or PermanentDeath == true then -- Overwrites the check if perma is on
			v.Handle:BreakJoints()
		end
	end
end

function Align(Part0, Part1, Offset)
	local CFOffset=Offset or CF0
	local OwnerShip=Part0:FindFirstChild("ClaimCheck")
	if Is_NetworkOwner(Part0) == true then
		if OwnerShip then OwnerShip.Transparency=1 end
		if (CollideFling and Part0.Name ~= IGNORETORSOCHECK) or not CollideFling then 
			Part0.AssemblyLinearVelocity=V3new(MathRandom(-2,2), -30 - MiniRandom(), MathRandom(-2,2)) + FigureHum.MoveDirection * (Part0.Mass * 10)
		end
		if (CollideFling and Part0.Name ~= "HumanoidRootPart") or not CollideFling then Part0.RotVelocity=Part1.RotVelocity end
		Part0.CFrame=Part1.CFrame * CFOffset * CFNew(0.0085 * Cos(Clock() * 10), 0.0085 * Sin(Clock() * 10), 0)
	else
		if OwnerShip then OwnerShip.Transparency=0 end
	end
end

local Offsets;
if not R15 then 
	Offsets={
		["HumanoidRootPart"]={Figure:FindFirstChild("HumanoidRootPart"), CF0},
		["Torso"]={Figure:FindFirstChild("Torso"), CF0},
		["Right Arm"]={Figure:FindFirstChild("Right Arm"), CF0},
		["Left Arm"]={Figure:FindFirstChild("Left Arm"), CF0},
		["Right Leg"]={Figure:FindFirstChild("Right Leg"), CF0},
		["Left Leg"]={Figure:FindFirstChild("Left Leg"), CF0},
	}
else 
	Offsets={
		["UpperTorso"]={Figure:FindFirstChild("Torso"), CFNew(0, 0.194, 0)},
		["LowerTorso"]={Figure:FindFirstChild("Torso"), CFNew(0, -0.79, 0)},
		["HumanoidRootPart"]={Character:FindFirstChild("UpperTorso"), CF0},
		
		["RightUpperArm"]={Figure:FindFirstChild("Right Arm"), CFNew(0, 0.4085, 0)},
		["RightLowerArm"]={Figure:FindFirstChild("Right Arm"), CFNew(0, -0.184, 0)},
		["RightHand"]={Figure:FindFirstChild("Right Arm"), CFNew(0, -0.83, 0)},

		["LeftUpperArm"]={Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)},
		["LeftLowerArm"]={Figure:FindFirstChild("Left Arm"), CFNew(0, -0.184, 0)},
		["LeftHand"]={Figure:FindFirstChild("Left Arm"), CFNew(0, -0.83, 0)},

		["RightUpperLeg"]={Figure:FindFirstChild("Right Leg"), CFNew(0, 0.575, 0)},
		["RightLowerLeg"]={Figure:FindFirstChild("Right Leg"), CFNew(0, -0.199, 0)},
		["RightFoot"]={Figure:FindFirstChild("Right Leg"), CFNew(0, -0.849, 0)},

		["LeftUpperLeg"]={Figure:FindFirstChild("Left Leg"), CFNew(0, 0.575, 0)},
		["LeftLowerLeg"]={Figure:FindFirstChild("Left Leg"), CFNew(0, -0.199, 0)},
		["LeftFoot"]={Figure:FindFirstChild("Left Leg"), CFNew(0, -0.849, 0)}
	}
end

local PostSimEvent=PostSim:Connect(function()
	for i,v in pairs(Offsets) do -- Body Align [2]
		if Character:FindFirstChild(i) then
			Align(Character:FindFirstChild(i), v[1], v[2])
		end
	end
	for i,v in pairs(CharacterChildren) do
		if v:IsA("Accessory") then
			if (HatData and v.Name ~= HatData[1].Name) or not HatData then
				Align(v.Handle, Figure[v.Name].Handle)
			end
		end
	end
	if HatData then
		Align(HatData[1].Handle, HatData[2], HatData[3])
	end
	if BulletInfo then
		BulletInfo[1].Velocity=Velocity
		if Global.PartDisconnected == false then
			Align(BulletInfo[1], BulletInfo[2], BulletInfo[3])
		end
	end
end)

-- Permanent Death
if PermanentDeath then
	task.spawn(function()
		Wait(game:FindFirstChildWhichIsA("Players").RespawnTime + 0.5)
		if HeadlessPerma == true then
			Character:FindFirstChild("Head"):Remove()
		else
			Character:FindFirstChild("Head"):BreakJoints()
			Offsets["Head"]={Figure:FindFirstChild("Head"), CF0}
		end
	end)
end

-- Ending Process
Global.RealChar=Character	
Character.Parent=Figure
Player.Character=Figure
CurrentCam.CameraSubject=FigureHum
DeathEvent=FigureHum.Died:Connect(function()
	if PostSimEvent then PostSimEvent:Disconnect() end
	if PreSimEvent then PreSimEvent:Disconnect() end
	if DeathEvent then DeathEvent:Disconnect() end
	if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
	if ResetEvent then ResetEvent:Disconnect() end
	if FakeHats then FakeHats:Destroy() end
	for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
	pcall(function()
		CurrentCam.FieldOfView=70
		Global.Stopped=true
		Character.Parent=Workspace
		Player.Character=Workspace[Character.Name]
		Humanoid:ChangeState(15)
		if Figure then Figure:Destroy() end
		if TestService:FindFirstChild("ScriptCheck") then
			TestService:FindFirstChild("ScriptCheck"):Destroy()
		end
		Wait(0.125)
		Global.RealChar=nil
		Global.Stopped=false
	end)
end)

ResetEvent=Character:GetPropertyChangedSignal("Parent"):Connect(function(Parent)
	if Parent == nil then
		if PostSimEvent then PostSimEvent:Disconnect() end
		if PreSimEvent then PreSimEvent:Disconnect() end
		if DeathEvent then DeathEvent:Disconnect() end
		if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
		if ResetEvent then ResetEvent:Disconnect() end
		if FakeHats then FakeHats:Destroy() end
		for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
		pcall(function()
			if Figure then Figure:Destroy() end
			CurrentCam.FieldOfView=70
			Global.RealChar=nil
			Global.Stopped=true
			if TestService:FindFirstChild("ScriptCheck") then TestService:FindFirstChild("ScriptCheck"):Destroy() end
			Wait(0.125)
			Global.Stopped=false
		end)
	end
end)

Warn("Reanimated in " .. string.sub(tostring(tick()-Speed),1,string.find(tostring(tick()-Speed),".")+5))
if not DisableAnimations then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Addons/Animations.lua"))()
end

end

 
Gelatek()
wait(.5)
game.ReplicatedStorage["01_server"]:FireServer("cmd", "-net ")
wait(6)









--require(3747589551)()
-- nebula's ezconvert
--[[
PUT YOUR SCRIPTS BELOW HERE VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV	
]]
--[[<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><><><>
	

Malcom was the host of his own 1920's radio broadcast, "Malcom Maddox's Magical Extravaganza!". Despite being fairly wealthy for the time, he always dreamed of getting up and performing in front of a crowd. 
        
This is what he did. Well... He would have done this if a large bus wasn't driving at 50 miles over the speed limit, and into his unsuspecting face.

So, Malcom died.. Sort of. You see, people tend to stick around after they die if they have unfinished business. Malcom was no exception. After the shock of realizing that he was dead, he decided to go to his big show anyways. 

Unfortunately, people that are alive don't really see dead people walking around, so when the patrons of the theatre saw Malcom, they wet their pants and ran down the fire escape. 

After this incident, Malcom has hidden himself to the rest of the world, his mystical wonders hidden.. Until now.

		
<><><><><><><><><><><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>


			<>Controls<>
			
	Z: Disappearing Act <> Use your hat to warp to your mouse cursor.
		

	X: Hat Trick <> Pull three different things out of your hat. (Its randomized!)
	
	
	C: Draw a Card <> Draw a card that does one of five effects. (Its randomized!)
	
	
	V: lul
	
	
	T: Heads Off <> Tell your audience that they will be amazed!
	
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>]]--





warn("Malcom Maddox was created by SezHu.")

wait(1 / 40)
Effects = { }
local Player = game.Players.localPlayer
local Mouse = Player:GetMouse()
local Character = Player.Character
local Humanoid = Character.Humanoid
local Head = Character.Head
local RootPart = Character.HumanoidRootPart
local Torso = Character.Torso
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Camera = game.Workspace.CurrentCamera
local RootJoint = RootPart.RootJoint
local Equipped = false
local Attack = false
local Anim = 'Idle'
local Idle = 0

task.spawn(function()
--// Attach Accessories First :D
local c=game.Players.LocalPlayer.Character
local rad=math.rad
local ang=CFrame.Angles
local cf=CFrame.new
local hed=c["Accessory (HeadAccessory)"].Handle["AccessoryWeld"]
hed.Part1=Head
hed.C0=cf(0,0,-.5)*ang(0,rad(180),0)

local lla=c["Accessory (Left ArmAccessory)"].Handle["AccessoryWeld"]
lla.Part1=LeftArm
lla.C0=cf(0,0,.5)

local rla=c["Accessory (Right ArmAccessory)"].Handle["AccessoryWeld"]
rla.Part1=RightArm
rla.C0=cf(0,0,.5)

local llg=c["Accessory (LeftLeg1Accessory)"].Handle["AccessoryWeld"]
llg.Part1=LeftLeg
llg.C0=cf(0,0,.5)
local rlg=c["Accessory (RightLeg1Accessory)"].Handle["AccessoryWeld"]
rlg.Part1=RightLeg
rlg.C0=cf(0,0,.5)


for _,i in next,({
c["Accessory (HeadAccessory)"].Handle,
c["Accessory (HeadAccessory)"].Handle,
c["Accessory (Left ArmAccessory)"].Handle,
c["Accessory (Right ArmAccessory)"].Handle,
c["Accessory (LeftLeg1Accessory)"].Handle,
c["Accessory (RightLeg1Accessory)"].Handle,
}) do
i.ChildAdded:Connect(function(c)
if c:IsA("Weld") then
c:Destroy()
end
end)
end
wait(.1)
local t=c["Accessory (TorsoAccessory)"].Handle["AccessoryWeld"]
t.Part1=Torso
t.C0=cf(0,0,.5)

end)


local UIS = game:GetService("UserInputService")
local Combo = 1
local TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local Velocity = RootPart.Velocity.y
local Sine = 0
local Change = 1
local killcount = 1
local lasersize = 0
local charsize = 2
local CF = CFrame.new
local ANGLES = CFrame.Angles
local RAD = math.rad
local Neck = Torso["Neck"]
local silenced = false
Head.face:Destroy()
Head.Transparency = 1
if(not Humanoid:FindFirstChildOfClass'ForceField')then Instance.new("ForceField",Character).Visible = false end

local function soundbork(obj)
   if obj:IsA("Sound") and obj.Name ~= "aa" then
      obj.Looped = false
      obj.Pitch = 1
 	  obj.Volume = 0
      return
   end


   local children = obj:GetChildren()
   for i = 1, #children do
    soundbork(children[i])
   end
   return
end

maincol = Torso.Color
maincol2 = Torso.Color

local t = {}


local string = string
local math = math
local table = table
local error = error
local tonumber = tonumber
local tostring = tostring
local type = type
local setmetatable = setmetatable
local pairs = pairs
local ipairs = ipairs
local assert = assert


local StringBuilder = {
	buffer = {}
}

function StringBuilder:New()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.buffer = {}
	return o
end

function StringBuilder:Append(s)
	self.buffer[#self.buffer+1] = s
end

function StringBuilder:ToString()
	return table.concat(self.buffer)
end

local JsonWriter = {
	backslashes = {
		['\b'] = "\\b",
		['\t'] = "\\t",	
		['\n'] = "\\n", 
		['\f'] = "\\f",
		['\r'] = "\\r", 
		['"']  = "\\\"", 
		['\\'] = "\\\\", 
		['/']  = "\\/"
	}
}

function JsonWriter:New()
	local o = {}
	o.writer = StringBuilder:New()
	setmetatable(o, self)
	self.__index = self
	return o
end

function JsonWriter:Append(s)
	self.writer:Append(s)
end

function JsonWriter:ToString()
	return self.writer:ToString()
end

function JsonWriter:Write(o)
	local t = type(o)
	if t == "nil" then
		self:WriteNil()
	elseif t == "boolean" then
		self:WriteString(o)
	elseif t == "number" then
		self:WriteString(o)
	elseif t == "string" then
		self:ParseString(o)
	elseif t == "table" then
		self:WriteTable(o)
	elseif t == "function" then
		self:WriteFunction(o)
	elseif t == "thread" then
		self:WriteError(o)
	elseif t == "userdata" then
		self:WriteError(o)
	end
end

function JsonWriter:WriteNil()
	self:Append("null")
end

function JsonWriter:WriteString(o)
	self:Append(tostring(o))
end

function JsonWriter:ParseString(s)
	self:Append('"')
	self:Append(string.gsub(s, "[%z%c\\\"/]", function(n)
		local c = self.backslashes[n]
		if c then return c end
		return string.format("\\u%.4X", string.byte(n))
	end))
	self:Append('"')
end

function JsonWriter:IsArray(t)
	local count = 0
	local isindex = function(k) 
		if type(k) == "number" and k > 0 then
			if math.floor(k) == k then
				return true
			end
		end
		return false
	end
	for k,v in pairs(t) do
		if not isindex(k) then
			return false, '{', '}'
		else
			count = math.max(count, k)
		end
	end
	return true, '[', ']', count
end

function JsonWriter:WriteTable(t)
	local ba, st, et, n = self:IsArray(t)
	self:Append(st)	
	if ba then		
		for i = 1, n do
			self:Write(t[i])
			if i < n then
				self:Append(',')
			end
		end
	else
		local first = true;
		for k, v in pairs(t) do
			if not first then
				self:Append(',')
			end
			first = false;			
			self:ParseString(k)
			self:Append(':')
			self:Write(v)			
		end
	end
	self:Append(et)
end

function JsonWriter:WriteError(o)
	error(string.format(
		"Encoding of %s unsupported", 
		tostring(o)))
end

function JsonWriter:WriteFunction(o)
	if o == Null then 
		self:WriteNil()
	else
		self:WriteError(o)
	end
end

local StringReader = {
	s = "",
	i = 0
}

function StringReader:New(s)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.s = s or o.s
	return o	
end

function StringReader:Peek()
	local i = self.i + 1
	if i <= #self.s then
		return string.sub(self.s, i, i)
	end
	return nil
end

function StringReader:Next()
	self.i = self.i+1
	if self.i <= #self.s then
		return string.sub(self.s, self.i, self.i)
	end
	return nil
end

function StringReader:All()
	return self.s
end

local JsonReader = {
	escapes = {
		['t'] = '\t',
		['n'] = '\n',
		['f'] = '\f',
		['r'] = '\r',
		['b'] = '\b',
	}
}

function JsonReader:New(s)
	local o = {}
	o.reader = StringReader:New(s)
	setmetatable(o, self)
	self.__index = self
	return o;
end

function JsonReader:Read()
	self:SkipWhiteSpace()
	local peek = self:Peek()
	if peek == nil then
		error(string.format(
			"Nil string: '%s'", 
			self:All()))
	elseif peek == '{' then
		return self:ReadObject()
	elseif peek == '[' then
		return self:ReadArray()
	elseif peek == '"' then
		return self:ReadString()
	elseif string.find(peek, "[%+%-%d]") then
		return self:ReadNumber()
	elseif peek == 't' then
		return self:ReadTrue()
	elseif peek == 'f' then
		return self:ReadFalse()
	elseif peek == 'n' then
		return self:ReadNull()
	elseif peek == '/' then
		self:ReadComment()
		return self:Read()
	else
		return nil
	end
end
		
function JsonReader:ReadTrue()
	self:TestReservedWord{'t','r','u','e'}
	return true
end

function JsonReader:ReadFalse()
	self:TestReservedWord{'f','a','l','s','e'}
	return false
end

function JsonReader:ReadNull()
	self:TestReservedWord{'n','u','l','l'}
	return nil
end

function JsonReader:TestReservedWord(t)
	for i, v in ipairs(t) do
		if self:Next() ~= v then
			 error(string.format(
				"Error reading '%s': %s", 
				table.concat(t), 
				self:All()))
		end
	end
end

function JsonReader:ReadNumber()
local result = self:Next()
local peek = self:Peek()
while peek ~= nil and string.find(
		peek, 
		"[%+%-%d%.eE]") do
    result = result .. self:Next()
    peek = self:Peek()
	end
	result = tonumber(result)
	if result == nil then
	error(string.format(
			"Invalid number: '%s'", 
			result))
	else
		return result
	end
end

function JsonReader:ReadString()
	local result = ""
	assert(self:Next() == '"')
while self:Peek() ~= '"' do
		local ch = self:Next()
		if ch == '\\' then
			ch = self:Next()
			if self.escapes[ch] then
				ch = self.escapes[ch]
			end
		end
result = result .. ch
	end
assert(self:Next() == '"')
	local fromunicode = function(m)
		return string.char(tonumber(m, 16))
	end
	return string.gsub(
		result, 
		"u%x%x(%x%x)", 
		fromunicode)
end

function JsonReader:ReadComment()
assert(self:Next() == '/')
local second = self:Next()
if second == '/' then
    self:ReadSingleLineComment()
elseif second == '*' then
    self:ReadBlockComment()
else
    error(string.format(
		"Invalid comment: %s", 
		self:All()))
	end
end

function JsonReader:ReadBlockComment()
	local done = false
	while not done do
		local ch = self:Next()		
		if ch == '*' and self:Peek() == '/' then
			done = true
end
		if not done and 
			ch == '/' and 
			self:Peek() == "*" then
    error(string.format(
			"Invalid comment: %s, '/*' illegal.",  
			self:All()))
		end
	end
	self:Next()
end

function JsonReader:ReadSingleLineComment()
	local ch = self:Next()
	while ch ~= '\r' and ch ~= '\n' do
		ch = self:Next()
	end
end

function JsonReader:ReadArray()
	local result = {}
	assert(self:Next() == '[')
	local done = false
	if self:Peek() == ']' then
		done = true;
	end
	while not done do
		local item = self:Read()
		result[#result+1] = item
		self:SkipWhiteSpace()
		if self:Peek() == ']' then
			done = true
		end
		if not done then
			local ch = self:Next()
			if ch ~= ',' then
				error(string.format(
					"Invalid array: '%s' due to: '%s'", 
					self:All(), ch))
			end
		end
	end
	assert(']' == self:Next())
	return result
end

function JsonReader:ReadObject()
	local result = {}
	assert(self:Next() == '{')
	local done = false
	if self:Peek() == '}' then
		done = true
	end
	while not done do
		local key = self:Read()
		if type(key) ~= "string" then
			error(string.format(
				"Invalid non-string object key: %s", 
				key))
		end
		self:SkipWhiteSpace()
		local ch = self:Next()
		if ch ~= ':' then
			error(string.format(
				"Invalid object: '%s' due to: '%s'", 
				self:All(), 
				ch))
		end
		self:SkipWhiteSpace()
		local val = self:Read()
		result[key] = val
		self:SkipWhiteSpace()
		if self:Peek() == '}' then
			done = true
		end
		if not done then
			ch = self:Next()
	if ch ~= ',' then
				error(string.format(
					"Invalid array: '%s' near: '%s'", 
					self:All(), 
					ch))
			end
		end
	end
	assert(self:Next() == "}")
	return result
end

function JsonReader:SkipWhiteSpace()
	local p = self:Peek()
	while p ~= nil and string.find(p, "[%s/]") do
		if p == '/' then
			self:ReadComment()
		else
			self:Next()
		end
		p = self:Peek()
	end
end

function JsonReader:Peek()
	return self.reader:Peek()
end

function JsonReader:Next()
	return self.reader:Next()
end

function JsonReader:All()
	return self.reader:All()
end

function Encode(o)
	local writer = JsonWriter:New()
	writer:Write(o)
	return writer:ToString()
end

function Decode(s)
	local reader = JsonReader:New(s)
	return reader:Read()
end

function Null()
	return Null
end
-------------------- End JSON Parser ------------------------

t.DecodeJSON = function(jsonString)
	pcall(function() warn("RbxUtility.DecodeJSON is deprecated, please use Game:GetService('HttpService'):JSONDecode() instead.") end)

	if type(jsonString) == "string" then
		return Decode(jsonString)
	end
	print("RbxUtil.DecodeJSON expects string argument!")
	return nil
end

t.EncodeJSON = function(jsonTable)
	pcall(function() warn("RbxUtility.EncodeJSON is deprecated, please use Game:GetService('HttpService'):JSONEncode() instead.") end)
	return Encode(jsonTable)
end








------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--------------------------------------------Terrain Utilities Begin-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--makes a wedge at location x, y, z
--sets cell x, y, z to default material if parameter is provided, if not sets cell x, y, z to be whatever material it previously w
--returns true if made a wedge, false if the cell remains a block
t.MakeWedge = function(x, y, z, defaultmaterial)
	return game:GetService("Terrain"):AutoWedgeCell(x,y,z)
end

t.SelectTerrainRegion = function(regionToSelect, color, selectEmptyCells, selectionParent)
	local terrain = game:GetService("Workspace"):FindFirstChild("Terrain")
	if not terrain then return end

	assert(regionToSelect)
	assert(color)

	if not type(regionToSelect) == "Region3" then
		error("regionToSelect (first arg), should be of type Region3, but is type",type(regionToSelect))
	end
	if not type(color) == "BrickColor" then
		error("color (second arg), should be of type BrickColor, but is type",type(color))
	end

	-- frequently used terrain calls (speeds up call, no lookup necessary)
	local GetCell = terrain.GetCell
	local WorldToCellPreferSolid = terrain.WorldToCellPreferSolid
	local CellCenterToWorld = terrain.CellCenterToWorld
	local emptyMaterial = Enum.CellMaterial.Empty

	-- container for all adornments, passed back to user
	local selectionContainer = Instance.new("Model")
	selectionContainer.Name = "SelectionContainer"
	selectionContainer.Archivable = false
	if selectionParent then
		selectionContainer.Parent = selectionParent
	else
		selectionContainer.Parent = game:GetService("Workspace")
	end

	local updateSelection = nil -- function we return to allow user to update selection
	local currentKeepAliveTag = nil -- a tag that determines whether adorns should be destroyed
	local aliveCounter = 0 -- helper for currentKeepAliveTag
	local lastRegion = nil -- used to stop updates that do nothing
	local adornments = {} -- contains all adornments
	local reusableAdorns = {}

	local selectionPart = Instance.new("Part")
	selectionPart.Name = "SelectionPart"
	selectionPart.Transparency = 1
	selectionPart.Anchored = true
	selectionPart.Locked = true
	selectionPart.CanCollide = false
	selectionPart.Size = Vector3.new(4.2,4.2,4.2)

	local selectionBox = Instance.new("SelectionBox")

	-- srs translation from region3 to region3int16
	local function Region3ToRegion3int16(region3)
		local theLowVec = region3.CFrame.p - (region3.Size/2) + Vector3.new(2,2,2)
		local lowCell = WorldToCellPreferSolid(terrain,theLowVec)

		local theHighVec = region3.CFrame.p + (region3.Size/2) - Vector3.new(2,2,2)
		local highCell = WorldToCellPreferSolid(terrain, theHighVec)

		local highIntVec = Vector3int16.new(highCell.x,highCell.y,highCell.z)
		local lowIntVec = Vector3int16.new(lowCell.x,lowCell.y,lowCell.z)

		return Region3int16.new(lowIntVec,highIntVec)
	end

	-- helper function that creates the basis for a selection box
	function createAdornment(theColor)
		local selectionPartClone = nil
		local selectionBoxClone = nil

		if #reusableAdorns > 0 then
			selectionPartClone = reusableAdorns[1]["part"]
			selectionBoxClone = reusableAdorns[1]["box"]
			table.remove(reusableAdorns,1)

			selectionBoxClone.Visible = true
		else
			selectionPartClone = selectionPart:Clone()
			selectionPartClone.Archivable = false

			selectionBoxClone = selectionBox:Clone()
			selectionBoxClone.Archivable = false

			selectionBoxClone.Adornee = selectionPartClone
			selectionBoxClone.Parent = selectionContainer

			selectionBoxClone.Adornee = selectionPartClone

			selectionBoxClone.Parent = selectionContainer
		end
			
		if theColor then
			selectionBoxClone.Color = theColor
		end

		return selectionPartClone, selectionBoxClone
	end

	-- iterates through all current adornments and deletes any that don't have latest tag
	function cleanUpAdornments()
		for cellPos, adornTable in pairs(adornments) do

			if adornTable.KeepAlive ~= currentKeepAliveTag then -- old news, we should get rid of this
				adornTable.SelectionBox.Visible = false
				table.insert(reusableAdorns,{part = adornTable.SelectionPart, box = adornTable.SelectionBox})
				adornments[cellPos] = nil
			end
		end
	end

	-- helper function to update tag
	function incrementAliveCounter()
		aliveCounter = aliveCounter + 1
		if aliveCounter > 1000000 then
			aliveCounter = 0
		end
		return aliveCounter
	end

	-- finds full cells in region and adorns each cell with a box, with the argument color
	function adornFullCellsInRegion(region, color)
		local regionBegin = region.CFrame.p - (region.Size/2) + Vector3.new(2,2,2)
		local regionEnd = region.CFrame.p + (region.Size/2) - Vector3.new(2,2,2)

		local cellPosBegin = WorldToCellPreferSolid(terrain, regionBegin)
		local cellPosEnd = WorldToCellPreferSolid(terrain, regionEnd)

		currentKeepAliveTag = incrementAliveCounter()
		for y = cellPosBegin.y, cellPosEnd.y do
			for z = cellPosBegin.z, cellPosEnd.z do
				for x = cellPosBegin.x, cellPosEnd.x do
					local cellMaterial = GetCell(terrain, x, y, z)
					
					if cellMaterial ~= emptyMaterial then
						local cframePos = CellCenterToWorld(terrain, x, y, z)
						local cellPos = Vector3int16.new(x,y,z)

						local updated = false
						for cellPosAdorn, adornTable in pairs(adornments) do
							if cellPosAdorn == cellPos then
								adornTable.KeepAlive = currentKeepAliveTag
								if color then
									adornTable.SelectionBox.Color = color
								end
								updated = true
								break
							end 
						end

						if not updated then
							local selectionPart, selectionBox = createAdornment(color)
							selectionPart.Size = Vector3.new(4,4,4)
							selectionPart.CFrame = CFrame.new(cframePos)
							local adornTable = {SelectionPart = selectionPart, SelectionBox = selectionBox, KeepAlive = currentKeepAliveTag}
							adornments[cellPos] = adornTable
						end
					end
				end
			end
		end
		cleanUpAdornments()
	end


	------------------------------------- setup code ------------------------------
	lastRegion = regionToSelect

	if selectEmptyCells then -- use one big selection to represent the area selected
		local selectionPart, selectionBox = createAdornment(color)

		selectionPart.Size = regionToSelect.Size
		selectionPart.CFrame = regionToSelect.CFrame

		adornments.SelectionPart = selectionPart
		adornments.SelectionBox = selectionBox

		updateSelection = 
			function (newRegion, color)
				if newRegion and newRegion ~= lastRegion then
					lastRegion = newRegion
				 	selectionPart.Size = newRegion.Size
					selectionPart.CFrame = newRegion.CFrame
				end
				if color then
					selectionBox.Color = color
				end
			end
	else -- use individual cell adorns to represent the area selected
		adornFullCellsInRegion(regionToSelect, color)
		updateSelection = 
			function (newRegion, color)
				if newRegion and newRegion ~= lastRegion then
					lastRegion = newRegion
					adornFullCellsInRegion(newRegion, color)
				end
			end

	end

	local destroyFunc = function()
		updateSelection = nil
		if selectionContainer then selectionContainer:Destroy() end
		adornments = nil
	end

	return updateSelection, destroyFunc
end

-----------------------------Terrain Utilities End-----------------------------







------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Signal class begin------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--[[
A 'Signal' object identical to the internal RBXScriptSignal object in it's public API and semantics. This function 
can be used to create "custom events" for user-made code.
API:
Method :connect( function handler )
	Arguments:   The function to connect to.
	Returns:     A new connection object which can be used to disconnect the connection
	Description: Connects this signal to the function specified by |handler|. That is, when |fire( ... )| is called for
	     the signal the |handler| will be called with the arguments given to |fire( ... )|. Note, the functions
	     connected to a signal are called in NO PARTICULAR ORDER, so connecting one function after another does
	     NOT mean that the first will be called before the second as a result of a call to |fire|.

Method :disconnect()
	Arguments:   None
	Returns:     None
	Description: Disconnects all of the functions connected to this signal.

Method :fire( ... )
	Arguments:   Any arguments are accepted
	Returns:     None
	Description: Calls all of the currently connected functions with the given arguments.

Method :wait()
	Arguments:   None
	Returns:     The arguments given to fire
	Description: This call blocks until 
]]

function t.CreateSignal()
	local this = {}

	local mBindableEvent = Instance.new('BindableEvent')
	local mAllCns = {} --all connection objects returned by mBindableEvent::connect

	--main functions
	function this:connect(func)
		if self ~= this then error("connect must be called with `:`, not `.`", 2) end
		if type(func) ~= 'function' then
			error("Argument #1 of connect must be a function, got a "..type(func), 2)
		end
		local cn = mBindableEvent.Event:Connect(func)
		mAllCns[cn] = true
		local pubCn = {}
		function pubCn:disconnect()
			cn:Disconnect()
			mAllCns[cn] = nil
		end
		pubCn.Disconnect = pubCn.disconnect
		
		return pubCn
	end
	
	function this:disconnect()
		if self ~= this then error("disconnect must be called with `:`, not `.`", 2) end
		for cn, _ in pairs(mAllCns) do
			cn:Disconnect()
			mAllCns[cn] = nil
		end
	end
	
	function this:wait()
		if self ~= this then error("wait must be called with `:`, not `.`", 2) end
		return mBindableEvent.Event:Wait()
	end
	
	function this:fire(...)
		if self ~= this then error("fire must be called with `:`, not `.`", 2) end
		mBindableEvent:Fire(...)
	end
	
	this.Connect = this.connect
	this.Disconnect = this.disconnect
	this.Wait = this.wait
	this.Fire = this.fire

	return this
end

------------------------------------------------- Sigal class End ------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------Create Function Begins---------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--[[
A "Create" function for easy creation of Roblox instances. The function accepts a string which is the classname of
the object to be created. The function then returns another function which either accepts accepts no arguments, in 
which case it simply creates an object of the given type, or a table argument that may contain several types of data, 
in which case it mutates the object in varying ways depending on the nature of the aggregate data. These are the
type of data and what operation each will perform:
1) A string key mapping to some value:
      Key-Value pairs in this form will be treated as properties of the object, and will be assigned in NO PARTICULAR
      ORDER. If the order in which properties is assigned matter, then they must be assigned somewhere else than the
      |Create| call's body.

2) An integral key mapping to another Instance:
      Normal numeric keys mapping to Instances will be treated as children if the object being created, and will be
      parented to it. This allows nice recursive calls to Create to create a whole hierarchy of objects without a
      need for temporary variables to store references to those objects.

3) A key which is a value returned from Create.Event( eventname ), and a value which is a function function
      The Create.E( string ) function provides a limited way to connect to signals inside of a Create hierarchy 
      for those who really want such a functionality. The name of the event whose name is passed to 
      Create.E( string )

4) A key which is the Create function itself, and a value which is a function
      The function will be run with the argument of the object itself after all other initialization of the object is 
      done by create. This provides a way to do arbitrary things involving the object from withing the create 
      hierarchy. 
      Note: This function is called SYNCHRONOUSLY, that means that you should only so initialization in
      it, not stuff which requires waiting, as the Create call will block until it returns. While waiting in the 
      constructor callback function is possible, it is probably not a good design choice.
      Note: Since the constructor function is called after all other initialization, a Create block cannot have two 
      constructor functions, as it would not be possible to call both of them last, also, this would be unnecessary.


Some example usages:

A simple example which uses the Create function to create a model object and assign two of it's properties.
local model = Create'Model'{
    Name = 'A New model',
    Parent = game.Workspace,
}


An example where a larger hierarchy of object is made. After the call the hierarchy will look like this:
Model_Container
 |-ObjectValue
 |  |
 |  `-BoolValueChild
 `-IntValue

local model = Create'Model'{
    Name = 'Model_Container',
    Create'ObjectValue'{
Create'BoolValue'{
    Name = 'BoolValueChild',
},
    },
    Create'IntValue'{},
}


An example using the event syntax:

local part = Create'Part'{
    [Create.E'Touched'] = function(part)
print("I was touched by "..part.Name)
    end,	
}


An example using the general constructor syntax:

local model = Create'Part'{
    [Create] = function(this)
print("Constructor running!")
this.Name = GetGlobalFoosAndBars(this)
    end,
}


Note: It is also perfectly legal to save a reference to the function returned by a call Create, this will not cause
      any unexpected behavior. EG:
      local partCreatingFunction = Create'Part'
      local part = partCreatingFunction()
]]

--the Create function need to be created as a functor, not a function, in order to support the Create.E syntax, so it
--will be created in several steps rather than as a single function declaration.
local function Create_PrivImpl(objectType)
	if type(objectType) ~= 'string' then
		error("Argument of Create must be a string", 2)
	end
	--return the proxy function that gives us the nice Create'string'{data} syntax
	--The first function call is a function call using Lua's single-string-argument syntax
	--The second function call is using Lua's single-table-argument syntax
	--Both can be chained together for the nice effect.
	return function(dat)
		--default to nothing, to handle the no argument given case
		dat = dat or {}

		--make the object to mutate
		local obj = Instance.new(objectType)
		local parent = nil

		--stored constructor function to be called after other initialization
		local ctor = nil

		for k, v in pairs(dat) do
			--add property
			if type(k) == 'string' then
				if k == 'Parent' then
					-- Parent should always be set last, setting the Parent of a new object
					-- immediately makes performance worse for all subsequent property updates.
					parent = v
				else
					obj[k] = v
				end


			--add child
			elseif type(k) == 'number' then
				if type(v) ~= 'userdata' then
					error("Bad entry in Create body: Numeric keys must be paired with children, got a: "..type(v), 2)
				end
				v.Parent = obj


			--event connect
			elseif type(k) == 'table' and k.__eventname then
				if type(v) ~= 'function' then
					error("Bad entry in Create body: Key `[Create.E\'"..k.__eventname.."\']` must have a function value\
					       got: "..tostring(v), 2)
				end
				obj[k.__eventname]:connect(v)


			--define constructor function
			elseif k == t.Create then
				if type(v) ~= 'function' then
					error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \
					       got: "..tostring(v), 2)
				elseif ctor then
					--ctor already exists, only one allowed
					error("Bad entry in Create body: Only one constructor function is allowed", 2)
				end
				ctor = v


			else
				error("Bad entry ("..tostring(k).." => "..tostring(v)..") in Create body", 2)
			end
		end

		--apply constructor function if it exists
		if ctor then
			ctor(obj)
		end
		
		if parent then
			obj.Parent = parent
		end

		--return the completed object
		return obj
	end
end

--now, create the functor:
t.Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end})

--and create the "Event.E" syntax stub. Really it's just a stub to construct a table which our Create
--function can recognize as special.
t.Create.E = function(eventName)
	return {__eventname = eventName}
end

-------------------------------------------------Create function End----------------------------------------------------




------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Documentation Begin-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

t.Help = 
	function(funcNameOrFunc) 
		--input argument can be a string or a function.  Should return a description (of arguments and expected side effects)
		if funcNameOrFunc == "DecodeJSON" or funcNameOrFunc == t.DecodeJSON then
			return "Function DecodeJSON.  " ..
			       "Arguments: (string).  " .. 
			       "Side effect: returns a table with all parsed JSON values" 
		end
		if funcNameOrFunc == "EncodeJSON" or funcNameOrFunc == t.EncodeJSON then
			return "Function EncodeJSON.  " ..
			       "Arguments: (table).  " .. 
			       "Side effect: returns a string composed of argument table in JSON data format" 
		end  
		if funcNameOrFunc == "MakeWedge" or funcNameOrFunc == t.MakeWedge then
			return "Function MakeWedge. " ..
			       "Arguments: (x, y, z, [default material]). " ..
			       "Description: Makes a wedge at location x, y, z. Sets cell x, y, z to default material if "..
			       "parameter is provided, if not sets cell x, y, z to be whatever material it previously was. "..
			       "Returns true if made a wedge, false if the cell remains a block "
		end
		if funcNameOrFunc == "SelectTerrainRegion" or funcNameOrFunc == t.SelectTerrainRegion then
			return "Function SelectTerrainRegion. " ..
			       "Arguments: (regionToSelect, color, selectEmptyCells, selectionParent). " ..
			       "Description: Selects all terrain via a series of selection boxes within the regionToSelect " ..
			       "(this should be a region3 value). The selection box color is detemined by the color argument " ..
			       "(should be a brickcolor value). SelectionParent is the parent that the selection model gets placed to (optional)." ..
			       "SelectEmptyCells is bool, when true will select all cells in the " ..
			       "region, otherwise we only select non-empty cells. Returns a function that can update the selection," ..
			       "arguments to said function are a new region3 to select, and the adornment color (color arg is optional). " ..
			       "Also returns a second function that takes no arguments and destroys the selection"
		end
		if funcNameOrFunc == "CreateSignal" or funcNameOrFunc == t.CreateSignal then
			return "Function CreateSignal. "..
			       "Arguments: None. "..
			       "Returns: The newly created Signal object. This object is identical to the RBXScriptSignal class "..
			       "used for events in Objects, but is a Lua-side object so it can be used to create custom events in"..
			       "Lua code. "..
			       "Methods of the Signal object: :connect, :wait, :fire, :disconnect. "..
			       "For more info you can pass the method name to the Help function, or view the wiki page "..
			       "for this library. EG: Help('Signal:connect')."
		end
		if funcNameOrFunc == "Signal:connect" then
			return "Method Signal:connect. "..
			       "Arguments: (function handler). "..
			       "Return: A connection object which can be used to disconnect the connection to this handler. "..
			       "Description: Connectes a handler function to this Signal, so that when |fire| is called the "..
			       "handler function will be called with the arguments passed to |fire|."
		end
		if funcNameOrFunc == "Signal:wait" then
			return "Method Signal:wait. "..
			       "Arguments: None. "..
			       "Returns: The arguments passed to the next call to |fire|. "..
			       "Description: This call does not return until the next call to |fire| is made, at which point it "..
			       "will return the values which were passed as arguments to that |fire| call."
		end
		if funcNameOrFunc == "Signal:fire" then
			return "Method Signal:fire. "..
			       "Arguments: Any number of arguments of any type. "..
			       "Returns: None. "..
			       "Description: This call will invoke any connected handler functions, and notify any waiting code "..
			       "attached to this Signal to continue, with the arguments passed to this function. Note: The calls "..
			       "to handlers are made asynchronously, so this call will return immediately regardless of how long "..
			       "it takes the connected handler functions to complete."
		end
		if funcNameOrFunc == "Signal:disconnect" then
			return "Method Signal:disconnect. "..
			       "Arguments: None. "..
			       "Returns: None. "..
			       "Description: This call disconnects all handlers attacched to this function, note however, it "..
			       "does NOT make waiting code continue, as is the behavior of normal Roblox events. This method "..
			       "can also be called on the connection object which is returned from Signal:connect to only "..
			       "disconnect a single handler, as opposed to this method, which will disconnect all handlers."
		end
		if funcNameOrFunc == "Create" then
			return "Function Create. "..
			       "Arguments: A table containing information about how to construct a collection of objects. "..
			       "Returns: The constructed objects. "..
			       "Descrition: Create is a very powerfull function, whose description is too long to fit here, and "..
			       "is best described via example, please see the wiki page for a description of how to use it."
		end
	end
	
--------------------------------------------Documentation Ends----------------------------------------------------------






create=t.Create
Create=t.Create


Humanoid.WalkSpeed = 16
Humanoid.JumpPower = 50
--Humanoid.Animator.Parent = nil
--Character.Animate.Parent = nil

local newMotor = function(part0, part1, c0, c1)
	local w = Create('Motor'){
		Parent = part0,
		Part0 = part0,
		Part1 = part1,
		C0 = c0,
		C1 = c1,
	}
	return w
end


function clerp(a, b, t)
	return a:lerp(b, t)
end

RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local RW = newMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0)) 
local LW = newMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
local RH = newMotor(Torso, RightLeg, CFrame.new(.5, -2, 0), CFrame.new(0, 0, 0))
local LH = newMotor(Torso, LeftLeg, CFrame.new(-.5, -2, 0), CFrame.new(0, 0, 0))
RootJoint.C1 = CFrame.new(0, 0, 0)
RootJoint.C0 = CFrame.new(0, 0, 0)
Torso.Neck.C1 = CFrame.new(0, 0, 0)
Torso.Neck.C0 = CFrame.new(0, 1.5, 0)
local rarmc1 = RW.C1
local larmc1 = LW.C1
local rlegc1 = RH.C1
local llegc1 = LH.C1
local resetc1 = false
Humanoid.Parent = nil
RootPart.Size = RootPart.Size*charsize
Torso.Size = Torso.Size*charsize
RightArm.Size = RightArm.Size*charsize
RightLeg.Size = RightLeg.Size*charsize
LeftArm.Size = LeftArm.Size*charsize
LeftLeg.Size = LeftLeg.Size*charsize
Head.Size = Head.Size*charsize
RootJoint.Parent = RootPart
Neck.Parent = Torso
RW.Parent = Torso
LW.Parent = Torso
RH.Parent = Torso
LH.Parent = Torso
Humanoid.Parent = Character


--<><><><><><><><><><><><>--
	
	--Passive Effects--
		
--<><><><><><><><><><><><>--

spawn(function()
	while true do
		wait(.1)
if Anim == "Idle" or Anim == "Walk" then	
		local refpart = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, BrickColor.Random(), "Effect", Vector3.new(math.random(1,3)/6,math.random(1,3)/6,math.random(1,3)/6))
		refpart.Anchored = false
		refpart.CFrame = RootPart.CFrame * CFrame.new(math.random(-30,30),80,math.random(-30,30))
		refpart.CanCollide = false
											local GRAVITY_ACCELERATION = 3.05
									local bodyForce = Instance.new('BodyForce', refpart)
									bodyForce.Name = 'Antigravity'
									bodyForce.force = Vector3.new(0, refpart:GetMass() * GRAVITY_ACCELERATION, 0)
									local rl = Create("BodyAngularVelocity"){
									P = 300,
									maxTorque = Vector3.new(2, 2, 2),
									angularvelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5)),
									Parent = refpart,}						
		table.insert(Effects, {refpart,"Disappear",.003})
		game:GetService("Debris"):AddItem(refpart, 10)	
	end
end
end)


--<><><><><><><><><><><><>--
	
	--Tables and Songs--
		
--<><><><><><><><><><><><>--

local songs = { 
	1374520036,
	1034928566,
	228239848,
	257314417,
	176069112,
	608232329,
	}

local quotes = {
	"I will amaze you!",
	"Heads off to you!",
	"Step right up!",
	"Be amazed!",
	"The show must go on!",
    "Let the show begin!",
}

playlist = Instance.new("Sound", Torso)
playlist.SoundId = "rbxassetid://1234043017"
playlist.Volume = 3
playlist.TimePosition = 0
playlist.Name = "aa"
playlist:Play()

--<><><><><><><><><><><><>--
	
		--Clothes--
		
--<><><><><><><><><><><><>--

local top = Instance.new("Shirt")
top.ShirtTemplate = "rbxassetid://268316000"
top.Parent = Character
top.Name = "Cloth"
local bottom = Instance.new("Pants")
bottom.PantsTemplate = "rbxassetid://268949770"
bottom.Parent = Character
bottom.Name = "Cloth"

--<><><><><><><><><><><><>--
	
		--Name Tag--
		
--<><><><><><><><><><><><>--

--[[Humanoid.DisplayDistanceType = "None"
local naeeym2 = Instance.new("BillboardGui",Character)
naeeym2.AlwaysOnTop = false
naeeym2.Size = UDim2.new(5,35,2,15)
naeeym2.StudsOffset = Vector3.new(0,7,0)
naeeym2.MaxDistance = 75
naeeym2.Adornee = Character.Torso
naeeym2.Name = "Maddox the Swing Spirit"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = "Maddox"
tecks2.Font = "Cartoon"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(1,1,1)
tecks2.TextStrokeColor3 = Color3.new(0, 0, 0)
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2]]--

function PlayAnimationFromTable(table, speed, bool)
	RootJoint.C0 = clerp(RootJoint.C0, table[1], .5) 
	Neck.C0 = clerp(Neck.C0, table[2], .5) 
	RW.C0 = clerp(RW.C0, table[3], .5) 
	LW.C0 = clerp(LW.C0, table[4], .5) 
	RH.C0 = clerp(RH.C0, table[5], .5) 
	LH.C0 = clerp(LH.C0, table[6], .5) 
	if bool == true then
		if resetc1 == false then
			resetc1 = true
			RootJoint.C1 = RootJoint.C1
			Torso.Neck.C1 = Torso.Neck.C1
			RW.C1 = rarmc1
			LW.C1 = larmc1
			RH.C1 = rlegc1
			LH.C1 = llegc1
		end
	end
end

ArtificialHB = Create("BindableEvent"){
	Parent = script,
	Name = "Heartbeat",
}

script:WaitForChild("Heartbeat")

frame = 1 / 45
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
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

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

local m = Create("Model"){
	Parent = Character,
	Name = "WeaponModel"
}

local m2 = Create("Model"){
	Parent = Character,
	Name = "WeaponModel2"
}

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
	
CFuncs = {	
	Part = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			if Size == Vector3.new() then
				Part.Size = Vector3.new(0.2, 0.2, 0.2)
			else
				Part.Size = Size
			end
			return Part
		end;
	};
	
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};

	Weld = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	Sound = {
		Create = function(id, par, vol, pit) 
			local Sound = Create("Sound"){
				Volume = vol,
				Pitch = pit or 1,
				SoundId = "rbxassetid://" .. id,
				Parent = par or workspace,
                                Name = "aa"
			}
			Sound:play() 
			return Sound
		end;
	};
	
	Decal = {
		Create = function(Color, Texture, Transparency, Name, Parent)
			local Decal = Create("Decal"){
				Color3 = Color,
				Texture = "rbxassetid://" .. Texture,
				Transparency = Transparency,
				Name = Name,
				Parent = Parent,
			}
			return Decal
		end;
	};
	
	BillboardGui = {
		Create = function(Parent, Image, Position, Size)
			local BillPar = CFuncs.Part.Create(Parent, "SmoothPlastic", 0, 1, BrickColor.new("Black"), "BillboardGuiPart", Vector3.new(1, 1, 1))
			BillPar.CFrame = CFrame.new(Position)
			local Bill = Create("BillboardGui"){
				Parent = BillPar,
				Adornee = BillPar,
				Size = UDim2.new(1, 0, 1, 0),
				SizeOffset = Vector2.new(Size, Size),
			}
			local d = Create("ImageLabel", Bill){
				Parent = Bill,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Image = "rbxassetid://" .. Image,
			}
			return BillPar
		end
	};
	
	ParticleEmitter = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local Particle = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return Particle
		end;
	};
	
	CreateTemplate = {
		
	};
}



 
function RayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

FindNearestTorso = function(pos)
	local list = (game.Workspace:children())
	local torso = nil
	local dist = 1000
	local temp, human, temp2 = nil, nil, nil
	for x = 1, #list do
		temp2 = list[x]
		if temp2.className == "Model" and temp2.Name ~= Character.Name then
			temp = temp2:findFirstChild("Torso")
			human = temp2:findFirstChild("Humanoid")
			if temp ~= nil and human ~= nil and human.Health > 0 and (temp.Position - pos).magnitude < dist then
				local dohit = true
				if dohit == true then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso, dist
end

	Laser = function(brickcolor, reflect, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "Neon", reflect, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "Neon"
	local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 1, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh)
end




shoot = function(mouse, aoe , partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 1000
	local num = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = RayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude                                                            
			Laser(BrickColor.new(maincol), 0, CFrame.new((MainPos + pos)/2, pos) * CFrame.Angles(1.57, 0, 0), 5, mag * (speed / (speed / 2)), 20, 20, 0, 20, 0.8)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
                    Effects.Block.Create(BrickColor.new(maincol), refpart.CFrame, 10, 10, 10, 10, 10, 10, .1, 1)
					Effects.Break.Create(BrickColor.new(maincol), refpart.CFrame, 2, 10, 2)
					if hit ~= nil then
						MagnitudeDamage(refpart, aoe, 1.5 * multiply, 1.5 * multiply, 0, "Normal", "231917784", 0)
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end


	Laser2 = function(brickcolor, reflect, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "Neon", reflect, 0, brickcolor, "Effect", Vector3.new(0.5+lasersize, 0.5, 0.5+lasersize))
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "Neon"
	local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 1, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh)
end




shoot2 = function(mouse, aoe , partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 1000
	local num = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = RayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude                                                            
			Laser2(BrickColor.new(maincol), 0, CFrame.new((MainPos + pos)/2, pos) * CFrame.Angles(1.57, 0, 0), 5, mag * (speed / (speed / 2)), .8, .8, 0, .8, 0.8)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
                    Effects.Block.Create(BrickColor.new(maincol), refpart.CFrame, 1, 1, 1, 1+lasersize, 1+lasersize, 1+lasersize, .05, 1)
					if hit ~= nil then
						MagnitudeDamage(refpart, aoe, 1.5 * multiply, 1.5 * multiply, 0, "Normal", "231917784", 0)
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end




function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChildOfClass("Humanoid")
	for _, v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil then
			if hit.Parent.DebounceHit.Value == true then
				return
			end
		end
		local c = Create("ObjectValue"){
			Name = "creator",
			Value = game:service("Players").LocalPlayer,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
		if HitSound ~= nil and HitPitch ~= nil then
			CFuncs.Sound.Create(HitSound, hit, 1, HitPitch) 
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil then
			if block.className == "IntValue" then
				if block.Value > 0 then
					blocked = true
					block.Value = block.Value - 1
					print(block.Value)
				end
			end
		end
				if hit.Parent:FindFirstChildOfClass("Humanoid").MaxHealth > 100 and hit.Parent:FindFirstChildOfClass("Humanoid").Health > 0  then
				for i = 0, 1, 0.1 do
				Effects.Break.Create(BrickColor.new("White"), hit.CFrame, 1, 4, 1)
				end
				CFuncs.Sound.Create("402174682", Torso, 5, 1)
				ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 3, 0)), "Poof!", 5, BrickColor.new("White").Color, BrickColor.new("Really black").Color)
				for _,v in pairs(hit.Parent:children()) do
				if v:IsA("Part") then
				v.Transparency = 1
				end 
				end
				hit.Parent:BreakJoints()
		else
			h.Health = h.Health - Damage 
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, BrickColor.new("White").Color, BrickColor.new("Really black").Color)
		end
		if Type == "Seizure" then
			local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
			Effects.InnerSphere.Create(BrickColor.new("Eggplant"),  hit.Parent.Torso.CFrame, 100, 2, .01)
spawn(function()
for i = 1, 1000 do
swait()
local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
hum.MaxHealth = hum.MaxHealth - 10
hit.Parent.Torso.CFrame = hit.Parent.Torso.CFrame * CFrame.new(math.random(-1,1)/2,0,math.random(-1,1)/2)
end
end)
				elseif Type == "Paralyze" then
			local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
			coroutine.resume(coroutine.create(function(HHumanoid)
				CFuncs.Sound.Create("209545844", hit.Parent.Torso, 1, 1)
				CFuncs.Sound.Create("1143596511", hit.Parent.Torso, 1, 1)
				Effects.InnerSphere.Create(BrickColor.new("Gold"),  hit.Parent.Torso.CFrame, 100, 2, .01)
				local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(50, 50, 50)* 200000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
				}
				wait(.1)
				rl:Destroy()
				for i = 1, 500 do
				local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(50, 50, 50)* 20,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
				}
				hum.Health = hum.Health - .01 
						hum.PlatformStand = true
				for _,v in pairs(hit.Parent:children()) do
				if v:IsA("Part") then
				local oldcol = v.BrickColor
				v.BrickColor = BrickColor.new("New Yeller")
				wait(.1)
				v.BrickColor = oldcol
				end 
				end
					rl:Destroy()
				end

				HHumanoid.PlatformStand = false
			end), hum)		
					elseif Type == "Knockdown" then
			local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = (hit.Position - (Property.Position + Vector3.new(0, 0, 0))).unit
			local bodvol = Create("BodyVelocity"){
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodvol, .5)
			game:GetService("Debris"):AddItem(rl, .5)
				
		elseif Type == "Normal" then
			local vp = Create("BodyVelocity"){
				P = 500,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05,
			}
			

			
			
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end
			game:GetService("Debris"):AddItem(vp, .5)
			elseif Type == "Float" then
			local vp = Create("BodyVelocity"){
				P = 10,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05,
			}
			print(hit.Parent)
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end	
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
local TotalMass = 0
for _, part in pairs(hit.Parent:GetChildren()) do
     if part:IsA("Part") then
          TotalMass = TotalMass + part:GetMass()
     end
end
local ForceOfGravity = -200 * TotalMass
local floatybits = Instance.new("BodyForce", hit.Parent.Torso)
floatybits.force = Vector3.new(0, -ForceOfGravity, 0)
			local rl = Create("BodyAngularVelocity"){
				P = 500,
				maxTorque = Vector3.new(10, 10, 10),
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
			}					
game:GetService("Debris"):AddItem(rl, 20)
game:GetService("Debris"):AddItem(floatybits, 20)
game:GetService("Debris"):AddItem(vp, .5)

spawn(function()
	for i = 1, 70 do 
		wait(.2)
		Effects.Block.Create(BrickColor.new("White"), hit.Parent.Torso.CFrame * CFrame.new(math.random(-8,8),math.random(-8,8),math.random(-8,8))*CFrame.Angles(0,math.rad(90),0), .1, .1, .1, .1, 2, .1, .04, 2)
		end
	end)

		elseif Type == "Up" then
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, .5)
		elseif Type == "DarkUp" then
			coroutine.resume(coroutine.create(function()
				for i = 0, 1, 0.1 do
					swait()
					Effects.Block.Create(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, .08, 1)
				end
			end))
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Snare" then
			local bp = Create("BodyPosition"){
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Freeze" then
			local BodPos = Create("BodyPosition"){
				P = 50000,
				D = 1000,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			local BodGy = Create("BodyGyro") {
				maxTorque = Vector3.new(4e+005, 4e+005, 4e+005) * math.huge ,
				P = 20e+003,
				Parent = hit.Parent.Torso,
				CFrame = hit.Parent.Torso.CFrame,
			}
			CFuncs.Sound.Create("585135955", hit.Parent.Torso, 5, 1)
			Effects.Block.Create(BrickColor.new("Baby blue"), hit.Parent.Torso.CFrame, 3, 3, 3, 3, 5, 3, .02, 2)
			hit.Parent.Torso.Anchored = true
			coroutine.resume(coroutine.create(function(Part) 
				swait(1.5)
				Part.Anchored = false
			end), hit.Parent.Torso)
			game:GetService("Debris"):AddItem(BodPos, 3)
			game:GetService("Debris"):AddItem(BodGy, 3)
		end
		local debounce = Create("BoolValue"){
			Name = "DebounceHit",
			Parent = hit.Parent,
			Value = true,
		}
		if Delay > 0 then
		game:GetService("Debris"):AddItem(debounce, Delay)
		c = Create("ObjectValue"){
			Name = "creator",
			Value = Player,
			Parent = h,
		}
		end
		game:GetService("Debris"):AddItem(c, .5)
	end
end

function ShowDamage(Pos, Text, Time, Color, Color2)
	local Rate = (1 / 45)
	local Pos = (Pos or Vector3.new(0, 0, 0))
	local Text = (Text or "")
	local Time = (Time or 2)
	local Color = (Color or Color3.new(1, 0, 1))
	local Color2 = (Color2 or Color3.new(1, 0, 1))
	local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = false
	EffectPart.CFrame = CFrame.new(Pos)
	EffectPart.Velocity = EffectPart.CFrame.upVector * math.random(60,70)
	local sizebit = 5
	local BillboardGui = Create("BillboardGui"){
		Size = UDim2.new(sizebit, 0, sizebit, 0),
		Adornee = EffectPart,
		Parent = EffectPart,
	}
	local TextLabel = Create("TextLabel"){
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		Font = "Cartoon",
		TextColor3 = Color,
		TextStrokeColor3 = Color2,
		TextStrokeTransparency = 0,
		TextScaled = true,
		Parent = BillboardGui,
	}
	game.Debris:AddItem(EffectPart, (Time))
	EffectPart.Parent = game:GetService("Workspace")
	EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, 0, 0)
	delay(0, function()
		local Frames = (Time / Rate)
		wait(.5)
		EffectPart.Anchored = true
		wait(.5)
		for Frame = 1, Frames do
			wait(Rate)
			BillboardGui.Size = UDim2.new(sizebit, 0, sizebit, 0)
			local Percent = (Frame / Frames)
			TextLabel.TextTransparency = Percent
			sizebit = sizebit - .4
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end

function MagnitudeDamage(Part, Magnitude, MinimumDamage, MaximumDamage, KnockBack, Type, HitPitch)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChildOfClass("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= Magnitude and c.Name ~= Player.Name then 
					Damage(head, head, MinimumDamage, MaximumDamage, KnockBack, Type, RootPart, .1, HitPitch)
				end
			end
		end
	end
end

EffectModel = Create("Model"){
	Parent = Character,
	Name = "EffectModel",
}

Effects = {
	Block = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			if Type == 1 or Type == nil then
				table.insert(Effects, {
					prt,
					"Block1",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 2 then
				table.insert(Effects, {
					prt,
					"Block2",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			end
		end;
	};
	
	Cylinder = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.2, 0.2, 0.2))
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 2)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end;
	};
	
	Head = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Head", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end;
	};
	
	Sphere1 = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Glass", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end;
	};
	
	Sphere2 = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end;
	};
	
		InnerSphere = {
		Create = function(brickcolor, cframe, size, shrinkspeed, appspeed)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			prt.Transparency = 1
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(size, size, size))
			game:GetService("Debris"):AddItem(prt, 10)
			spawn(function()
				while true do
					if size ~= 0 then
					swait()
					msh.Scale =	Vector3.new(size, size, size)
					size = size - shrinkspeed or size - 1
					prt.Transparency = prt.Transparency - appspeed
					else prt:Destroy() break
					end
					end
				end)
		end;
	};

	Elect = {
		Create = function(cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, BrickColor.new(maincol), "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x, x), math.random(-y, y), math.random(-z, z))
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 2)
			local xval = math.random() / 2
			local yval = math.random() / 2
			local zval = math.random() / 2
			local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			table.insert(Effects, {
				prt,
				"Elec",
				0.1,
				x,
				y,
				z,
				xval,
				yval,
				zval
			})
		end;

	};
	
	Ring = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end;
	};


	Wave = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Glass", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end;
	};

	Break = {
		Create = function(brickcolor, cframe, x1, y1, z1)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			local num = math.random(10, 50) / 1000
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Shatter",
				num,
				prt.CFrame,
				math.random() - math.random(),
				0,
				math.random(50, 100) / 100
			})
		end;
	};
	
	Fire = {
		Create = function(brickcolor, cframe, x1, y1, z1, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Fire",
				delay,
				1,
				1,
				1,
				msh
			})
		end;
	};
	
	FireWave = {
		Create = function(brickcolor, cframe, x1, y1, z1)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 1, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			local d = Create("Decal"){
				Parent = prt,
				Texture = "rbxassetid://26356434",
				Face = "Top",
			}
			local d = Create("Decal"){
				Parent = prt,
				Texture = "rbxassetid://26356434",
				Face = "Bottom",
			}
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"FireWave",
				1,
				30,
				math.random(400, 600) / 100,
				msh
			})
		end;
	};
	
	Lightning = {
		Create = function(p0, p1, tym, ofs, col, th, tra, last)
			local magz = (p0 - p1).magnitude
			local curpos = p0
			local trz = {
				-ofs,
				ofs
			}
			for i = 1, tym do
				local li = CFuncs.Part.Create(EffectModel, "Neon", 0, tra or 0.4, col, "Ref", Vector3.new(th, th, magz / tym))
				local ofz = Vector3.new(trz[math.random(1, 2)], trz[math.random(1, 2)], trz[math.random(1, 2)])
				local trolpos = CFrame.new(curpos, p1) * CFrame.new(0, 0, magz / tym).p + ofz
				li.Material = "Neon"
				if tym == i then
					local magz2 = (curpos - p1).magnitude
					li.Size = Vector3.new(th, th, magz2)
					li.CFrame = CFrame.new(curpos, p1) * CFrame.new(0, 0, -magz2 / 2)
					table.insert(Effects, {
						li,
						"Disappear",
						last
					})
				else
					do
						do
							li.CFrame = CFrame.new(curpos, trolpos) * CFrame.new(0, 0, magz / tym / 2)
							curpos = li.CFrame * CFrame.new(0, 0, magz / tym / 2).p
							game.Debris:AddItem(li, 10)
							table.insert(Effects, {
								li,
								"Disappear",
								last
							})
						end
					end
				end
			end
		end
	};

	EffectTemplate = {

	};
}

Hat=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Medium stone grey","Hat",Vector3.new(2, 2, 2))
HatWeld=CFuncs.Weld.Create(m,Character["Head"],Hat,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0365142822, -0.719758511, 0.0314178467, -1.00000834, 4.61186464e-05, -2.77473146e-06, 4.86522331e-05, 1, 5.23036442e-06, 2.92961045e-06, 5.51708399e-06, -1))
meh=CFuncs.Mesh.Create("SpecialMesh",Hat,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=2711178",Vector3.new(0, 0, 0),Vector3.new(2, 2, 2))
meh.TextureId = "http://www.roblox.com/asset/?id=32935396"
Hat.Transparency=1
local t=Character["LargeTopHat"].Handle["AccessoryWeld"]
t.Part1=Hat
t.C0=CFrame.new()



for _,v in pairs(m2:children()) do
if v:IsA("Part") and v.Name == "pand" then
v.Transparency = 1
end 
end


--Start neccessary functions here

function Tween(obj,props,time,easing,direction,repeats,backwards)
    local info = TweenInfo.new(time or .5, easing or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out, repeats or 0, backwards or false)
    local tween = game:service'TweenService':Create(obj, info, props)
    
    tween:Play()
end

function Trace()
for _,v in next, Character:GetChildren() do
                if(v:IsA'Part') and v ~= RootPart then
                        local trace = Instance.new("Part")
                        trace.Parent = workspace
                        trace.Size = v.Size
                        trace.Material = Enum.Material.Neon
                        trace.Color = maincol
						trace.Transparency = .3
                        trace.Anchored = true
                        trace.CanCollide = false
                        trace.CFrame = v.CFrame
                        Tween(trace,{Transparency=1},.5)
							game:GetService("Debris"):AddItem(trace, 1)
                        	if v.Name == "Head" then
                            local mehs = Instance.new("CylinderMesh",trace)
                            mehs.Scale = Vector3.new(1.25,1.25,1.25)
                        end
                end
            end
			end


function ducks()
		for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0, 0, 1, 8.04662704e-07, -3.01003456e-06, 0, 0.965925872, 0.258819103, 3.11434269e-06, -0.258819133, 0.965925932) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0227765162, 2.36835814, -2.66195869, 1, 6.9886446e-06, 4.02331352e-06, -2.08616257e-06, -0.258818984, 0.965925932, 7.77840614e-06, -0.965925932, -0.258818954) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.02689314, 1.83810854, -1.15534818, 0, 0.342032284, 0.939688325, 0.965925872, -0.243209288, 0.0885244831, 0.258819103, 0.907669246, -0.330377817) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.95138168, 1.77444541, -1.29813623, 0.122574523, -0.49350512, -0.861062288, -0.961303234, -0.274721175, 0.0206083059, -0.246722341, 0.825215876, -0.508081853) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.00000215, -4.22291946, -0.0263157077, 1, -5.10364771e-07, 1.89244747e-06, 5.10364771e-07, 1.00000012, -2.98023224e-08, -1.92224979e-06, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.0000006, -3.81518364, -1.21633136, 1, 0, 3.11434269e-06, 8.04662704e-07, 0.965925872, -0.258819133, -3.01003456e-06, 0.258819103, 0.965925932) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	for i = 1, 2 do
		for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0, 0, 1, 8.04662704e-07, -3.01003456e-06, 0, 0.965925872, 0.258819103, 3.11434269e-06, -0.258819133, 0.965925932) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.266832203, 2.16833496, -3.91155529, 1, 0, 3.11434269e-06, 8.04662704e-07, 0.965925872, -0.258819133, -3.01003456e-06, 0.258819103, 0.965925932) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.06273198, 1.47406721, -1.53684735, 0, 0.707109213, 0.707104445, 0.965925872, -0.183012128, 0.18301338, 0.258819103, 0.683010459, -0.683015108) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.81047451, 1.47174859, -1.69800615, 0.056022916, -0.766043305, -0.640342951, -0.979530215, -0.166366309, 0.113326266, -0.193344265, 0.620886445, -0.759682953) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.00000215, -4.22291946, -0.0263157077, 1, -5.10364771e-07, 1.89244747e-06, 5.10364771e-07, 1.00000012, -2.98023224e-08, -1.92224979e-06, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.0000006, -3.81518364, -1.21633136, 1, 0, 3.11434269e-06, 8.04662704e-07, 0.965925872, -0.258819133, -3.01003456e-06, 0.258819103, 0.965925932) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		end
			for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0, 0, 1, 8.04662704e-07, -3.01003456e-06, 0, 0.965925872, 0.258819103, 3.11434269e-06, -0.258819133, 0.965925932) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.266833276, 0.933555186, -3.88168001, 1, 0, 3.11434269e-06, 8.04662704e-07, 0.965925872, -0.258819133, -3.01003456e-06, 0.258819103, 0.965925932) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.94570374, 1.23016787, -1.402282, -0.183013678, 0.683017731, 0.707101703, 0.98037976, 0.0732246935, 0.183013454, 0.0732241273, 0.726722121, -0.68301785) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.88480496, 1.2523725, -1.43212485, -0.144152611, -0.754439712, -0.640344262, -0.989212334, 0.0928238332, 0.113325842, -0.0260583311, 0.649772704, -0.759681821) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.00000215, -4.22291946, -0.0263157077, 1, -5.10364771e-07, 1.89244747e-06, 5.10364771e-07, 1.00000012, -2.98023224e-08, -1.92224979e-06, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.0000006, -3.81518364, -1.21633136, 1, 0, 3.11434269e-06, 8.04662704e-07, 0.965925872, -0.258819133, -3.01003456e-06, 0.258819103, 0.965925932) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	end
	CFuncs.Sound.Create("270620358", Hat, 3, 1)
			for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0, 0, 1, 8.04662704e-07, -3.01003456e-06, 0, 0.965925872, 0.258819103, 3.11434269e-06, -0.258819133, 0.965925932) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0227765162, 2.36835814, -2.66195869, 1, 6.9886446e-06, 4.02331352e-06, -2.08616257e-06, -0.258818984, 0.965925932, 7.77840614e-06, -0.965925932, -0.258818954) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.02689314, 1.83810854, -1.15534818, 0, 0.342032284, 0.939688325, 0.965925872, -0.243209288, 0.0885244831, 0.258819103, 0.907669246, -0.330377817) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.95138168, 1.77444541, -1.29813623, 0.122574523, -0.49350512, -0.861062288, -0.961303234, -0.274721175, 0.0206083059, -0.246722341, 0.825215876, -0.508081853) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.00000215, -4.22291946, -0.0263157077, 1, -5.10364771e-07, 1.89244747e-06, 5.10364771e-07, 1.00000012, -2.98023224e-08, -1.92224979e-06, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.0000006, -3.81518364, -1.21633136, 1, 0, 3.11434269e-06, 8.04662704e-07, 0.965925872, -0.258819133, -3.01003456e-06, 0.258819103, 0.965925932) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
			end
qwek = Instance.new("Sound", Torso)
qwek.SoundId = "rbxassetid://271006579"
qwek.Looped = true
qwek.Volume = 5
qwek.Pitch = .8
qwek:Play()
qwek2 = Instance.new("Sound", Torso)
qwek2.SoundId = "rbxassetid://271006579"
qwek2.Looped = true
qwek2.Volume = 5
qwek2.Pitch = 1
qwek2:Play()
qwek3 = Instance.new("Sound", Torso)
qwek3.SoundId = "rbxassetid://271006579"
qwek3.Looped = true
qwek3.Volume = 5
qwek3.Pitch = 1.3
qwek3:Play()
		for i = 0, 10, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0, 0, 1.00000095, 8.12113285e-07, -3.02493572e-06, 0, 0.965925872, 0.258819103, 3.11434269e-06, -0.258819371, 0.965926886) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.022777468, 5.66071653, -1.77978086, 1.00000095, 0, -1.31428242e-05, -3.39746475e-06, 0.965925872, -0.258819371, 1.26957893e-05, 0.258819103, 0.965926886) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.11248255, 3.06429124, -1.06128931, -0.16178672, 0.22040607, 0.961898208, -0.0629198849, -0.97505945, 0.212838948, 0.984818876, -0.0260875672, 0.171619475) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.96463084, 3.01722312, -1.42708611, -0.0698213056, -0.227341518, -0.971309781, -0.0906620771, -0.968209505, 0.233133003, -0.993432164, 0.104339033, 0.0469902605) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.00000072, -2.54767346, -0.749675632, 1.00000083, -7.37607479e-07, 2.01165676e-06, 5.58793545e-07, 0.996194899, 0.0871552527, -2.05636024e-06, -0.0871557891, 0.996195674) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.00000954, -3.15354609, -1.14733529, 1.00000095, 0, 3.11434269e-06, 8.12113285e-07, 0.965925872, -0.258819371, -3.02493572e-06, 0.258819103, 0.965926886) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		local duk=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Bright yellow","duk",Vector3.new(2, 2, 2))
		local moosh = CFuncs.Mesh.Create("SpecialMesh",duk,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=9419831",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
		duk.CFrame = Hat.CFrame
		duk.CanCollide = false
		duk.Velocity = Vector3.new(math.random(-20,20),math.random(-60,60),math.random(-20,20))
		duk.Name = "duk"
		table.insert(Effects, {duk,"Disappear",.01})
		game:GetService("Debris"):AddItem(duk, 3)
		moosh.TextureId = "http://www.roblox.com/asset/?id=9419827"
		Torso.Velocity=RootPart.CFrame.upVector*100
	local con = duk.Touched:connect(function(hit)
			if hit.Name ~= "Effect" and hit.Name ~= "pand" and hit ~= Character and hit.Name ~= "duk" and hit ~= m then
	MagnitudeDamage(duk, 5, 30, 30, 20, "Normal", " ", 1)
	Effects.Sphere2.Create(BrickColor.new("Gold"), duk.CFrame, 1, 1, 1, 2, 2, 2, .05)
	end
	end)	
end	
qwek3:Destroy()	
qwek2:Destroy()	
qwek:Destroy()			
end



function pocketpandora()
	Humanoid.AutoRotate = true
		local PocketPandora=CFuncs.Part.Create( workspace,Enum.Material.Plastic,0,1,"Medium stone grey","PocketPandora",Vector3.new(0.512000322, 0.652799785, 0.640000045))
local PocketPandoraWeld=CFuncs.Weld.Create( workspace,Character["Right Arm"],PocketPandora,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.24340057, 1.26152658, 0.0355987549, 4.68637081e-05, 1.00000417, -2.85994429e-06, 1, -4.81304887e-05, 5.30673697e-06, 5.45002649e-06, -2.93751145e-06, -1))
local pand=CFuncs.Part.Create(workspace,Enum.Material.Plastic,0,0,"Fossil","pand",Vector3.new(0.406399965, 0.419200003, 0.320000023))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0229816437, -0.655731201, 0.0416564941, -0.0293540079, -0.0772550181, -0.99657923, -0.392862946, 0.917665899, -0.0595659576, 0.919128418, 0.389770478, -0.0572878011))
CFuncs.Mesh.Create("SpecialMesh",pand,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=13520257",Vector3.new(0, 0, 0),Vector3.new(0.480000019, 0.480000019, 0.480000019))
local pand=CFuncs.Part.Create( workspace,Enum.Material.SmoothPlastic,0,1.400709148669e-08,"Lily white","pand",Vector3.new(0.448000014, 0.896000028, 0.448000014))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0497894287, 0.0101809502, -0.68927002, 0.995689869, 0.00945099909, 0.0922629908, 0.00786634162, 0.982604146, -0.185545981, -0.0924115852, 0.185471997, 0.978294551))
local pand=CFuncs.Part.Create( workspace,Enum.Material.SmoothPlastic,0,1.400709148669e-08,"Lily white","pand",Vector3.new(0.448000014, 0.896000028, 0.448000014))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.197641373, 0.841140389, 0.0983428955, -0.209358081, -0.0334330127, -0.977267385, 0.00387890753, 0.999379098, -0.0350204371, 0.977831423, -0.0111225415, -0.209098414))
local pand=CFuncs.Part.Create( workspace,Enum.Material.SmoothPlastic,0,1.400709148669e-08,"Lily white","pand",Vector3.new(0.448000014, 0.896000028, 0.448000014))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0201187134, 0.0265302658, -0.746673584, -0.997025669, -0.0285979901, -0.0715689808, -0.0345623419, 0.995905221, 0.0835369974, 0.0688869208, 0.0857621059, -0.993931353))
local pand=CFuncs.Part.Create( workspace,Enum.Material.SmoothPlastic,0,1.400709148669e-08,"Lily white","pand",Vector3.new(0.448000014, 0.896000028, 0.448000014))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.200737, 0.840947151, 0.107421875, 0.306881011, 0.0363619998, -0.951053023, -0.0217640139, 0.999276757, 0.0311830547, 0.951499104, 0.0111292461, 0.307450444))
local pand=CFuncs.Part.Create( workspace,Enum.Material.SmoothPlastic,0,1.400709148669e-08,"Lily white","pand",Vector3.new(0.896000028, 0.896000028, 0.448000014))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0183601379, -0.0494211912, -0.0223693848, 0.0508630089, -0.0429850034, -0.997780144, 0.0136630228, 0.999009788, -0.0423414856, 0.998612225, -0.0114790779, 0.0513999537))
local pand=CFuncs.Part.Create( workspace,Enum.Material.Fabric,0,1.400709148669e-08,"Institutional white","pand",Vector3.new(0.896000028, 0.448000014, 0.448000014))
local pandWeld=CFuncs.Weld.Create( workspace,PocketPandora,pand,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0183601379, -0.646469116, -0.240524292, 0.0508630089, -0.0429850034, -0.997780144, -0.392863095, 0.917666256, -0.0595603026, 0.918189287, 0.395020396, 0.0297880471))
CFuncs.Mesh.Create("SpecialMesh",pand,Enum.MeshType.Head,"",Vector3.new(0, 0, 0),Vector3.new(1.25, 1.25, 1.25))

		for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0911376029, 0.170700833, 0.332172483, 0.96592617, 0.0449431762, 0.254886121, 0, 0.984807849, -0.173647746, -0.25881812, 0.167730883, 0.951251686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.89245868, -2.29780269, -0.00377818942, 0.986237526, -0.0818925127, -0.14362888, -0.127979755, 0.17186299, -0.976772487, 0.104674846, 0.981711268, 0.159017161) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.24770093, 3.22394347, -1.96035659, 0.586824775, 0.492401212, 0.642789066, 0.718526661, -0.682659328, -0.133024901, 0.373304367, 0.539923429, -0.754404902) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.24579811, 0.162601873, -0.169526681, 0.980992317, 0.193930089, 0.00672267377, -0.193764612, 0.980845749, -0.0199200213, -0.0104569793, 0.0182387829, 0.999779046) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.1014533, -4.16344213, 0.406021297, 0.939692914, 0, -0.342019349, 0.0593908839, 0.984807849, 0.163175538, 0.336823404, -0.173647746, 0.925417066) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999989688, -4.16985464, 0.369654536, 0.906307459, 0, 0.422619224, -0.0733868629, 0.984807849, 0.157378227, -0.41619873, -0.173647746, 0.892538786) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		end
		CFuncs.Sound.Create("525166232", pand, 10, 1.1)
			for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0911376029, 0.170700833, 0.332172483, 0.96592617, 0.0449431762, 0.254886121, 0, 0.984807849, -0.173647746, -0.25881812, 0.167730883, 0.951251686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.89245868, -2.29780269, -0.00377818942, 0.986237526, -0.0818925127, -0.14362888, -0.127979755, 0.17186299, -0.976772487, 0.104674846, 0.981711268, 0.159017161) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80590749, 2.72466302, -1.93817627, 0.663057327, 0.747823834, 0.0333839096, 0.746770024, -0.657716274, -0.098711893, -0.0518619865, 0.0903817415, -0.994556129) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.24579811, 0.162601873, -0.169526681, 0.980992317, 0.193930089, 0.00672267377, -0.193764612, 0.980845749, -0.0199200213, -0.0104569793, 0.0182387829, 0.999779046) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.1014533, -4.16344213, 0.406021297, 0.939692914, 0, -0.342019349, 0.0593908839, 0.984807849, 0.163175538, 0.336823404, -0.173647746, 0.925417066) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999989688, -4.16985464, 0.369654536, 0.906307459, 0, 0.422619224, -0.0733868629, 0.984807849, 0.157378227, -0.41619873, -0.173647746, 0.892538786) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
			end
				for i = 0, 2, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0911456496, 0.170702159, 0.332171082, 0.999885321, -0.00137777999, -0.0150859356, 0.00628500246, 0.943831742, 0.330366731, 0.0137834102, -0.330423653, 0.943732202) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.75862074, -2.28645492, 0.346096963, 0.970100462, 0.236889541, -0.0528076962, -0.0789259449, 0.102158397, -0.991632223, -0.229512513, 0.966150701, 0.117800683) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.20707846, 0.285080135, 1.16387141, -0.00297607109, -0.107517615, 0.994198799, -0.783208609, 0.618401051, 0.0645325035, -0.621752024, -0.7784729, -0.0860491246) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.36487269, 0.161271498, 0.244712532, 0.975460768, 0.219438821, 0.0179737657, -0.219429642, 0.962213933, 0.161229551, 0.0180853903, -0.161217049, 0.986753345) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.851068258, -4.07387733, -0.701450467, 0.997281611, 0.0189382583, -0.0712103695, -0.0301716141, 0.986631095, -0.160152644, 0.067225337, 0.161865816, 0.984520435) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.25113344, -4.09032774, -0.91490078, 0.999885321, 0.00628500246, 0.0137834102, -0.00137777999, 0.943831742, -0.330423653, -0.0150859356, 0.330366731, 0.943732202) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
				end
				
					for i = 0, .1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0798431486, 0.233077481, 1.12295187, 0.999885499, -0.00873519853, -0.0123708993, 0.00628500246, 0.982565761, -0.18580927, 0.0137782991, 0.185710222, 0.982508063) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0265016034, 3.24111581, -0.318699658, 0.998973072, -0.0240464583, -0.0384024978, 0.0298348591, 0.98697418, 0.158088326, 0.0341008157, -0.159071684, 0.986678004) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.96458101, 0.895944357, -2.12482834, -0.0157348998, 0.106384002, 0.994200766, 0.999534369, 0.0276731253, 0.0128581598, -0.026144743, 0.993939996, -0.106769882) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.18996, 0.315425068, 0.578166604, 0.991264641, 0.131625995, -0.00832906365, -0.0797855482, 0.64874804, 0.756809294, 0.105019227, -0.749533653, 0.653582811) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.790542006, -3.90754509, -1.36502731, 0.998461664, 0.0502564199, 0.0234256238, -0.0362905487, 0.911728263, -0.409187764, -0.0419221073, 0.407708168, 0.912149489) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.24295056, -4.01071262, 1.00937235, 0.99988544, 0.00379677117, 0.0146613121, -0.00873538479, 0.935390234, 0.353509545, -0.0123718679, -0.353597105, 0.935316026) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
					end
						PocketPandoraWeld:Destroy()
	CFuncs.Sound.Create("160718677", pand, 5, 1)
for _,v in pairs(workspace:children()) do
if v:IsA("Part") and v.Name == "PocketPandora" then
v.Anchored = false
v.CanCollide = true
v.Parent = workspace
v.CFrame = RootPart.CFrame * CFrame.new(2,5,-5)
v.Velocity=RootPart.CFrame.lookVector*200
	local con = v.Touched:connect(function(hit)
			if hit.Name ~= "Effect" and hit.Name ~= "pand" and hit ~= Character and hit.Name ~= "refpart" then
	MagnitudeDamage(PocketPandora, 30, 100, 100, 50, "Normal", " ", 1)
	Effects.Sphere2.Create(BrickColor.new("Smoky grey"), v.CFrame, .5, 2, .5, 3, 5, 3, .03)
	Effects.Sphere2.Create(BrickColor.new(maincol), v.CFrame, .6, 3, .6, 4, 6, 4, .03)
	CFuncs.Sound.Create("206049428", pand, 10, 1)
	v:Destroy()
	end
	end)
end 
end
	
					for i = 0,5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0798431486, 0.233077481, 1.12295187, 0.999885499, -0.00873519853, -0.0123708993, 0.00628500246, 0.982565761, -0.18580927, 0.0137782991, 0.185710222, 0.982508063) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0265016034, 3.24111581, -0.318699658, 0.998973072, -0.0240464583, -0.0384024978, 0.0298348591, 0.98697418, 0.158088326, 0.0341008157, -0.159071684, 0.986678004) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.99794817, 2.31009698, -1.64348817, 0.0563318357, 0.0916124284, 0.994200289, 0.783475637, -0.621289551, 0.0128577966, 0.618864119, 0.778207421, -0.106774479) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.18996, 0.315425068, 0.578166604, 0.991264641, 0.131625995, -0.00832906365, -0.0797855482, 0.64874804, 0.756809294, 0.105019227, -0.749533653, 0.653582811) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.790542006, -3.90754509, -1.36502731, 0.998461664, 0.0502564199, 0.0234256238, -0.0362905487, 0.911728263, -0.409187764, -0.0419221073, 0.407708168, 0.912149489) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.24295056, -4.01071262, 1.00937235, 0.99988544, 0.00379677117, 0.0146613121, -0.00873538479, 0.935390234, 0.353509545, -0.0123718679, -0.353597105, 0.935316026) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
					end
		
end


function foryou()
	Humanoid.AutoRotate = true
		
	FHandle=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,1,"Institutional white","FHandle",Vector3.new(1, 2, 1))
FHandleWeld=CFuncs.Weld.Create(m2,Character["Right Arm"],FHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.18448639, 0.551091194, -0.163902283, -0.155436471, 0.983553827, -0.09203168, -0.987750709, -0.153451264, 0.0283052251, 0.0137170125, 0.0953044593, 0.995353699))
CFuncs.Mesh.Create("SpecialMesh",FHandle,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=1049194",Vector3.new(0, 0, 0),Vector3.new(1.79999995, 1.29999995, 1.89999998))
Plant=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,0,"Dusty Rose","Plant",Vector3.new(2, 0.400000006, 2))
PlantWeld=CFuncs.Weld.Create(m2,FHandle,Plant,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.308837891, 1.90258408, 0.500061035, 0.90631032, 0.422617525, -2.08616257e-07, -0.422617853, 0.906308651, -3.24845314e-06, -6.78002834e-07, 3.28943133e-06, 1.0000006))
CFuncs.Mesh.Create("SpecialMesh",Plant,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=16659363",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Plant=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,0,"Really red","Plant",Vector3.new(2, 0.400000006, 2))
PlantWeld=CFuncs.Weld.Create(m2,FHandle,Plant,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.325637817, 1.54702187, 0.131658554, -0.969451249, 0.0996286124, -0.224139586, 0.0717185959, 0.988995075, 0.129403844, 0.234565258, 0.109375738, -0.965927601))
CFuncs.Mesh.Create("SpecialMesh",Plant,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=16659363",Vector3.new(0, 0, 0),Vector3.new(1.5, 1.5, 1.5))
Test=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,0,"Earth green","Test",Vector3.new(1, 1.20000005, 1))
TestWeld=CFuncs.Weld.Create(m2,FHandle,Test,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.308868408, -1.30257416, 0.220046997, -0.906308413, -0.422617137, 5.06639481e-07, 0.422617078, -0.906308293, 3.25590372e-06, -9.31322575e-07, 3.16090882e-06, 1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Test,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=1091940",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 2, 0.200000003))
Test=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,0,"Earth green","Test",Vector3.new(1, 1.20000005, 1))
TestWeld=CFuncs.Weld.Create(m2,FHandle,Test,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.115341187, -0.744662762, -0.176582336, 0.969449461, -0.0996279493, -0.22414732, -0.0717145503, -0.988994002, 0.129413977, -0.234573573, -0.109385677, -0.965924442))
CFuncs.Mesh.Create("SpecialMesh",Test,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=1091940",Vector3.new(0, 0, 0),Vector3.new(0.5, 2.5, 0.5))
fire=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,1,"Medium stone grey","fire",Vector3.new(1.4400003, 2.17999935, 2.24999976))
fireWeld=CFuncs.Weld.Create(m2,FHandle,fire,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.8053484, 0.600914001, 0.173200607, 0.197724402, 0.974774659, -0.103535756, -0.972187221, 0.181474328, -0.148050904, -0.125527188, 0.129929408, 0.983545303))
Plant=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,0,"Salmon","Plant",Vector3.new(2, 0.400000006, 2))
PlantWeld=CFuncs.Weld.Create(m2,FHandle,Plant,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.391174316, 2.30257797, 7.2479248e-05, 0.90631187, 0.422617793, 7.4505806e-09, -0.42261827, 0.906309068, -3.21865082e-06, -4.84287739e-07, 3.37697566e-06, 1.00000107))
CFuncs.Mesh.Create("SpecialMesh",Plant,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=16659363",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Test=CFuncs.Part.Create(m2,Enum.Material.Plastic,0,0,"Earth green","Test",Vector3.new(1, 1.20000005, 1))
TestWeld=CFuncs.Weld.Create(m2,FHandle,Test,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.391143799, -1.70257568, 0.100059509, -0.906308413, -0.422617137, 5.06639481e-07, 0.422617078, -0.906308293, 3.25590372e-06, -9.31322575e-07, 3.16090882e-06, 1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Test,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=1091940",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 2, 0.200000003))	
	CFuncs.Sound.Create("1030472543", Torso, 10, 1)	
		for i = 0, 5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0911376029, 0.170700833, 0.332172483, 0.96592617, 0.0449431762, 0.254886121, 0, 0.984807849, -0.173647746, -0.25881812, 0.167730883, 0.951251686) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.89245868, -2.29780269, -0.00377818942, 0.986237526, -0.0818925127, -0.14362888, -0.127979755, 0.17186299, -0.976772487, 0.104674846, 0.981711268, 0.159017161) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.24770093, 3.22394347, -1.96035659, 0.586824775, 0.492401212, 0.642789066, 0.718526661, -0.682659328, -0.133024901, 0.373304367, 0.539923429, -0.754404902) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.24579811, 0.162601873, -0.169526681, 0.980992317, 0.193930089, 0.00672267377, -0.193764612, 0.980845749, -0.0199200213, -0.0104569793, 0.0182387829, 0.999779046) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.1014533, -4.16344213, 0.406021297, 0.939692914, 0, -0.342019349, 0.0593908839, 0.984807849, 0.163175538, 0.336823404, -0.173647746, 0.925417066) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999989688, -4.16985464, 0.369654536, 0.906307459, 0, 0.422619224, -0.0733868629, 0.984807849, 0.157378227, -0.41619873, -0.173647746, 0.892538786) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		end	
	for i = 0, 6, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.201527208, 0.339289248, -0.760077715, 0.965926766, -0.109380201, 0.23456727, 0, 0.906308293, 0.422617316, -0.258816212, -0.408217311, 0.875427306) * CFrame.new(0,  0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.63639927, -3.08259439, 2.20601225, 0.96412462, -0.126876891, -0.233165681, 0.137302473, -0.513392627, 0.847098649, -0.227182761, -0.848722875, -0.477553904) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.16202116, 2.08283663, -1.89966655, 0.0309411921, -0.0984340832, 0.994662583, 0.897010624, -0.436257124, -0.0710765198, 0.440924883, 0.894421995, 0.0747980848) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.02596211, -0.564618766, 0.844400108, 0.999514997, -0.0298547298, 0.00887096301, 0.0205256008, 0.845656037, 0.533333659, -0.0234243199, -0.532892823, 0.845858574) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.10143936, -4.27405882, -1.10186839, 0.939693689, 0, -0.342017531, -0.144542515, 0.906308293, -0.397130758, 0.3099733, 0.422617316, 0.851652145) * CFrame.new(0,  0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999990761, -4.25845289, -1.13533604, 0.906306744, 0, 0.422621042, 0.178606942, 0.906308293, -0.383020878, -0.383024931, 0.422617316, 0.821393192) * CFrame.new(0,  0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
		CFuncs.Sound.Create("490241055", fire, 10, 1)
local PE1 = Instance.new("ParticleEmitter",fire)
PE1.LightEmission = NumberSequence.new(0.2)
PE1.Size = NumberSequence.new(3)
PE1.Texture = "http://www.roblox.com/asset/?id=242461088"
PE1.Lifetime = NumberRange.new(.75)
PE1.Rate = 50.000
PE1.Transparency = NumberSequence.new(0.2)
PE1.LightEmission = NumberSequence.new(1)
PE1.Rotation = NumberRange.new(0)
PE1.Speed = NumberRange.new(.1)
PE1.RotSpeed = NumberRange.new(0)
PE1.ZOffset = .2
		for i = 0, 5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.201527208, 0.339289248, -0.760077715, 0.965926766, -0.109380201, 0.23456727, 0, 0.906308293, 0.422617316, -0.258816212, -0.408217311, 0.875427306) * CFrame.new(0,  0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.63639927, -3.08259439, 2.20601225, 0.96412462, -0.126876891, -0.233165681, 0.137302473, -0.513392627, 0.847098649, -0.227182761, -0.848722875, -0.477553904) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.16202116, 2.08283663, -1.89966655, 0.0309411921, -0.0984340832, 0.994662583, 0.897010624, -0.436257124, -0.0710765198, 0.440924883, 0.894421995, 0.0747980848) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.02596211, -0.564618766, 0.844400108, 0.999514997, -0.0298547298, 0.00887096301, 0.0205256008, 0.845656037, 0.533333659, -0.0234243199, -0.532892823, 0.845858574) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.10143936, -4.27405882, -1.10186839, 0.939693689, 0, -0.342017531, -0.144542515, 0.906308293, -0.397130758, 0.3099733, 0.422617316, 0.851652145) * CFrame.new(0,  0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999990761, -4.25845289, -1.13533604, 0.906306744, 0, 0.422621042, 0.178606942, 0.906308293, -0.383020878, -0.383024931, 0.422617316, 0.821393192) * CFrame.new(0,  0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
CFuncs.Sound.Create("172324194", Torso, 10, 1)
	for i = 0, 6, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.201516241, 0.339291096, -0.760076404, 0.97455883, -0.126014829, -0.185352385, 0.178607017, 0.936242044, 0.302573204, 0.135405973, -0.327980638, 0.934929967) * CFrame.new(0,  0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.55570674, -2.16993427, 3.6085391, 0.879511952, -0.473674715, -0.0457305014, -0.268807769, -0.573806643, 0.773620367, -0.392684817, -0.668115556, -0.631997108) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.06292558, 1.80838537, -3.22790933, 0.214386374, 0.288788915, 0.933080733, 0.927286148, -0.360320926, -0.101535536, 0.306886107, 0.887000561, -0.345037788) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.80201578, 0.225536764, 1.78792167, 0.999614537, -0.0117794126, 0.0251443088, -0.00699919462, 0.769420385, 0.638704658, -0.0268700868, -0.638634384, 0.769041181) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.532568038, -4.3854022, -1.08604121, 0.98265177, 0.178607017, 0.0499521792, -0.154120743, 0.936242044, -0.315749615, -0.103162408, 0.302573204, 0.947526813) * CFrame.new(0,  0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.38611662, -4.29509449, -0.232889488, 0.659518123, 0.178607017, 0.730161428, 0.114288926, 0.936242044, -0.332248539, -0.742949605, 0.302573204, 0.597055733) * CFrame.new(0,  0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .4, false)
	end
	FHandleWeld:Destroy()
		for _,v in pairs(m2:children()) do
	if v:IsA("Part") then
	v.Parent = workspace
	v.CanCollide = true
	v.Velocity=RootPart.CFrame.upVector*0
		table.insert(Effects, {v,"Disappear",.008})
		game:GetService("Debris"):AddItem(v, 5)
end
end		
	end
	


function topwat()
	Attack = true
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
	Humanoid.AutoRotate = false
	
	for i = 0, 8, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.00205035275, 0, -0.0156110032, 0.965925872, 0, 0.258819073, 0, 1, 0, -0.258819073, 0, 0.965925872) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.302975714, -0.0352788754, -2.58990121, 0.996195078, 0.0298128296, 0.0818930417, 0.0298129916, -0.999554753, 0.00122109544, 0.0818929821, 0.00122502726, -0.996640384) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.13866591, 2.04802728, -1.94127011, -0.439383566, 0.627507865, 0.642787695, 0.819152892, 0.573575318, -1.11085149e-06, -0.368687868, 0.526540875, -0.766044438) * CFrame.new(0, -.5, 0) * CFrame.Angles(RAD(0 + 5 * math.cos(Sine/2)), 0, 0), 
         CFrame.new(-2.42017388, 0.400777161, -2.11568689, 0.882900894, -0.469536036, 0.00468276255, 0.131853923, 0.238337904, -0.962190032, 0.450666815, 0.850135863, 0.272338927) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.10143924, -3.99999404, 0.0369313061, 0.939692557, 0, -0.342020273, 0, 1, 0, 0.342020273, 0, 0.939692557) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999986231, -3.99999404, 1.25169754e-06, 0.906307876, 0, 0.42261827, 0, 1, 0, -0.42261827, 0, 0.906307876) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
	end
	
	
	local x = math.random(1,3)
	if x == 1 then
	pocketpandora()	
	elseif x == 2 then
	ducks()	
	elseif x == 3 then
	foryou()
	end
		
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	Humanoid.AutoRotate = true
	Attack = false
end

function hatsoff()
	Attack = true
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
	CFuncs.Sound.Create("1578720743", Torso, 5, 1)
ShowDamage((Head.CFrame * CFrame.new(0, 0, (Head.Size.Z / 2)).p + Vector3.new(0, 5, 0)), quotes[math.random(#quotes)], 5, BrickColor.new(maincol).Color, BrickColor.new("Really black").Color)
	for i = 0, 8, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.115069248, -0, -0.214136839, 0.766046524, 0, -0.642790973, 0, 1, 0, 0.642790973, 0, 0.766046524) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-4.87525558, 0.797361493, -4.06305599, 0.866025567, -0.0435784385, -0.498097122, -0.0868260041, -0.994166732, -0.0639820844, -0.492403448, 0.0986578986, -0.864757538) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.4945271, 1.52527678, -1.38384485, 0.870185137, -0.374341398, 0.3203848, 0.179849938, -0.364053726, -0.9138484, 0.458728582, 0.852838457, -0.249468848) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.41207027, 1.04570305, -1.46108115, -0.88571322, 0.4565247, 0.084245488, 0.0838330537, -0.0211990401, 0.996254325, 0.456600636, 0.889458179, -0.0194955915) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.853903413, -4.00243044, 0.828555107, 0.98480767, 0.0868239999, -0.150384188, 0, 0.866026282, 0.499998599, 0.173648536, -0.492402464, 0.852869391) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.19523168, -4.00639772, -0.555792093, 0.904794216, -0.0996007398, 0.414037675, 0.0301539879, 0.984807849, 0.17100963, -0.42478025, -0.142243639, 0.894051731) * CFrame.new(0, 0 - .3 * math.cos(Sine/3.5), 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	end
		for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.115069248, -0, -0.214136839, 0.766046524, 0, -0.642790973, 0, 1, 0, 0.642790973, 0, 0.766046524) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.31292915, 5.66935062, 0.386707425, -0.0979517624, -0.866521716, -0.489434123, -0.98050642, -0.000144343387, 0.196486965, -0.170330837, 0.499139547, -0.849615812) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.4945271, 1.52527678, -1.38384485, 0.870185137, -0.374341398, 0.3203848, 0.179849938, -0.364053726, -0.9138484, 0.458728582, 0.852838457, -0.249468848) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.79443884, 2.43125439, -0.142938256, 0.312049747, -0.222866639, 0.92355597, -0.188317999, -0.967318416, -0.169798508, 0.931214929, -0.120936617, -0.343821317) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.853903413, -4.00243044, 0.828555107, 0.98480767, 0.0868239999, -0.150384188, 0, 0.866026282, 0.499998599, 0.173648536, -0.492402464, 0.852869391) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.19523168, -4.00639772, -0.555792093, 0.904794216, -0.0996007398, 0.414037675, 0.0301539879, 0.984807849, 0.17100963, -0.42478025, -0.142243639, 0.894051731) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
	end
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	Attack = false
end

	
		
function overthere()
	Attack = true
		local xy = 2
		local hitt = Mouse.hit
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
	CFuncs.Sound.Create("538558581", Hat, 5, 1)
	for i = 0, 5, 0.1 do
		swait()
		xy = xy + .15
		PlayAnimationFromTable({
         CFrame.new(0.0107159223, -2.71742606, 0.0607917309, 0.99988538, 0.009216398, 0.0120227486, -0.0151350051, 0.641702771, 0.766804099, -0.000647842884, -0.766898036, 0.641768754) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.28039515, 11.482439, 13.6262321, 0.99988538, -0.0151350051, -0.000647842884, 0.009216398, 0.641702771, -0.766898036, 0.0120227486, 0.766804099, 0.641768754) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.83838439, 2.67886591, 0.0802880749, -2.82153487e-05, 0.707110763, 0.707103014, -3.48687172e-06, -0.707103014, 0.707110524, 1.00000012, 1.75237656e-05, 2.24113464e-05) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.61722004, 2.37308216, -0.0369534679, 0.0996018648, -0.819160461, -0.564850211, 0.0309238136, -0.56485045, 0.82461369, -0.994546771, -0.0996004194, -0.0309286118) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.999969661, -3.48585701, -0.497745633, 1, 1.82539225e-05, 1.02139893e-06, -1.46329403e-05, 0.766044199, 0.642787874, 1.09598041e-05, -0.642788053, 0.766044199) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999921381, -3.45396709, -0.373242021, 1.00000024, -2.43186951e-05, -2.02894444e-06, 1.99228525e-05, 0.766044378, 0.642787635, -1.40666962e-05, -0.642787695, 0.766044438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
		meh.Scale = Vector3.new(xy, xy, xy)
	end
	CFuncs.Sound.Create("144507916", Torso, 5, 1)
	Effects.Wave.Create(BrickColor.new("White"), Hat.CFrame*CFrame.new(0,-20,0), 4, 1, 4, 4, 1, 4, .05)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0107159223, -2.71742606, 0.0607917309, 0.99988538, 0.009216398, 0.0120227486, -0.0151350051, 0.641702771, 0.766804099, -0.000647842884, -0.766898036, 0.641768754) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0671697259, 2.44198537, 2.82332158, 0.99988538, -0.0151350051, -0.000647842884, 0.009216398, 0.641702771, -0.766898036, 0.0120227486, 0.766804099, 0.641768754) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.83838439, 2.67886591, 0.0802880749, -2.82153487e-05, 0.707110763, 0.707103014, -3.48687172e-06, -0.707103014, 0.707110524, 1.00000012, 1.75237656e-05, 2.24113464e-05) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.61722004, 2.37308216, -0.0369534679, 0.0996018648, -0.819160461, -0.564850211, 0.0309238136, -0.56485045, 0.82461369, -0.994546771, -0.0996004194, -0.0309286118) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.999969661, -3.48585701, -0.497745633, 1, 1.82539225e-05, 1.02139893e-06, -1.46329403e-05, 0.766044199, 0.642787874, 1.09598041e-05, -0.642788053, 0.766044199) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999921381, -3.45396709, -0.373242021, 1.00000024, -2.43186951e-05, -2.02894444e-06, 1.99228525e-05, 0.766044378, 0.642787635, -1.40666962e-05, -0.642787695, 0.766044438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .5, false)
	end
		RootPart.CFrame = hitt * CFrame.new(0,6,0)
		for i = 0, 2, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0107159223, -2.71742606, 0.0607917309, 0.99988538, 0.009216398, 0.0120227486, -0.0151350051, 0.641702771, 0.766804099, -0.000647842884, -0.766898036, 0.641768754) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0671697259, 2.44198537, 2.82332158, 0.99988538, -0.0151350051, -0.000647842884, 0.009216398, 0.641702771, -0.766898036, 0.0120227486, 0.766804099, 0.641768754) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.83838439, 2.67886591, 0.0802880749, -2.82153487e-05, 0.707110763, 0.707103014, -3.48687172e-06, -0.707103014, 0.707110524, 1.00000012, 1.75237656e-05, 2.24113464e-05) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.61722004, 2.37308216, -0.0369534679, 0.0996018648, -0.819160461, -0.564850211, 0.0309238136, -0.56485045, 0.82461369, -0.994546771, -0.0996004194, -0.0309286118) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.999969661, -3.48585701, -0.497745633, 1, 1.82539225e-05, 1.02139893e-06, -1.46329403e-05, 0.766044199, 0.642787874, 1.09598041e-05, -0.642788053, 0.766044199) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.999921381, -3.45396709, -0.373242021, 1.00000024, -2.43186951e-05, -2.02894444e-06, 1.99228525e-05, 0.766044378, 0.642787635, -1.40666962e-05, -0.642787695, 0.766044438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
		for i = 0, 1.5, 0.1 do
		swait()
		xy = xy - .5
				PlayAnimationFromTable({
         CFrame.new(-0, -0, -0, 1.00000751, 0, 0, 0, 1, 0, 0, 0, 1.00000751) * CFrame.new(0,0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.09699351e-07, 3.07826781, -0.0930013061, 1.00000381, 4.02331352e-07, -2.29477882e-06, 0, 0.984807849, 0.173648134, 2.32458115e-06, -0.173648804, 0.984811544) * CFrame.new(0, 0 + .2 * math.cos(Sine/10), 0) * CFrame.Angles(RAD(0 + 2 * math.cos(Sine/4)), 0, 0), 
         CFrame.new(3.23488927, 0.217123732, -0.0756206512, 0.986215889, -0.164953321, -0.0135539025, 0.164731994, 0.986208379, -0.0160120502, 0.0160082281, 0.0135585759, 0.99978739) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, RAD(0 - 2 * math.cos(Sine/10))), 
         CFrame.new(-2.27295804, 2.68117332, -0.407379597, -0.142512456, -0.53919214, 0.830046415, 0.0714119896, -0.842015326, -0.534706116, 0.987221003, -0.0169270113, 0.158502445) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, RAD(0 + 2 * math.cos(Sine/10))), 
         CFrame.new(1.00000048, -3.99999428, 8.58306885e-06, 0.984811425, 0.0301538315, -0.171010852, 0, 0.984807849, 0.173648164, 0.173648983, -0.171010718, 0.969849944) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.19524455, -4.0063982, -0.555813253, 0.996198535, 0, 0.0871554539, 0, 1, 0, -0.0871554539, 0, 0.996198535) * CFrame.new(0, 0 - .3 * math.cos(Sine/3.5), 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
		meh.Scale = Vector3.new(xy, xy, xy)
		end
		meh.Scale = Vector3.new(2, 2, 2)
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	Attack = false
		end
	
	function card()
		Attack = true
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
		for i = 0, 5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0594676584, 0.0768035352, -0.0666813478, 0.884229183, 0.0283103138, 0.46619451, -0.046942994, 0.998493731, 0.0284016542, -0.464688241, -0.0469981395, 0.884226322) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.320109785, 3.63055658, -0.170195401, 0.694239378, -0.266091168, 0.668750525, 0.0364392735, 0.940953016, 0.336570561, -0.718821168, -0.209291756, 0.662942886) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.35686827, 0.22342144, -0.428599238, 0.968903899, -0.230326891, 0.090413481, 0.243740588, 0.9513551, -0.188451782, -0.0426098406, 0.204629123, 0.97791177) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.54222584, -0.211173713, 0.944933712, 0.922422528, -0.0570006818, 0.381952316, -0.034134835, 0.973141432, 0.227663115, -0.384670615, -0.223039463, 0.895702004) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.25511241, -4.02567768, 0.0611277819, 0.840364099, -0.046942994, -0.539985716, 0.0241064206, 0.998493731, -0.0492867082, 0.541486025, 0.0284016542, 0.840229928) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.907657266, -4.11040592, -0.53483367, 0.976054788, -0.046942994, 0.212399751, 0.0518967845, 0.998493731, -0.0178051461, -0.211244017, 0.0284016542, 0.977020741) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
		end	
		MysteryCard=CFuncs.Part.Create(workspace,Enum.Material.Plastic,0,0,"White","MysteryCard",Vector3.new(0.880001426, 0.0500000007, 1.42000163))
		MysteryCardWeld=CFuncs.Weld.Create(workspace,Character["Left Arm"],MysteryCard,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.019998312, -0.0606269836, -2.56632233, -1, -1.86971738e-06, 5.30659418e-06, -5.45002649e-06, 2.93751145e-06, -1, 3.13629062e-06, -1.00000417, -2.86020963e-06))
		local dec = Instance.new("Decal",MysteryCard)
dec.Texture = "rbxassetid://8644107"
dec.Face = "Bottom"
local e = math.random(1,4)
		if e == 1 then
	local dec2 = Instance.new("Decal",MysteryCard)
dec2.Texture = "rbxassetid://173448236"
dec2.Face = "Top"	
		elseif e == 2 then
	local dec2 = Instance.new("Decal",MysteryCard)
dec2.Texture = "rbxassetid://1167119856"
dec2.Face = "Top"
CFuncs.Sound.Create("976606790", Torso, 3, 1)	
		elseif e == 3 then
	local dec2 = Instance.new("Decal",MysteryCard)
dec2.Texture = "rbxassetid://342673258"
dec2.Face = "Top"
		elseif e == 100 then
	local dec2 = Instance.new("Decal",MysteryCard)
dec2.Texture = "rbxassetid://1403304829"
dec2.Face = "Top"
		elseif e == 4 then
	local dec2 = Instance.new("Decal",MysteryCard)
dec2.Texture = "rbxassetid://358190487"
dec2.Face = "Top"
end	
			for i = 0, .1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0594634786, 0.0768039674, -0.0666834489, 0.998862267, 0.0283112749, -0.0383773446, -0.0264539961, 0.998493731, 0.0480682589, 0.0396804214, -0.0469983406, 0.998106539) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.122908428, 3.62031841, -0.300296009, 0.993329167, -0.08360935, 0.0794143826, 0.0752441362, 0.991826117, 0.103050947, -0.0873812661, -0.096388042, 0.991500795) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.27946377, 0.196054846, -0.0853066146, 0.977669358, -0.20545657, 0.0441635996, 0.20282878, 0.977524698, 0.0574999899, -0.0549847484, -0.0472583175, 0.997368217) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-3.38164973, 1.88772869, -1.7773633, 0.870166838, 0.233024612, -0.434176862, -0.190451264, -0.653598666, -0.732487082, -0.454464883, 0.720075309, -0.524359882) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.11755061, -4.02567816, -0.574618757, 0.998519659, -0.0264539961, -0.0475273132, 0.0241073575, 0.998493731, -0.0492869914, 0.0487595648, 0.0480682589, 0.997653246) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.05345631, -4.11040878, -0.0093524158, 0.73966682, -0.0264539961, 0.672453284, 0.0518976487, 0.998493731, -0.0178046823, -0.670969307, 0.0480682589, 0.739925504) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
	end
	for i = 0, 5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0594634786, 0.0768039674, -0.0666834489, 0.998862267, 0.0283112749, -0.0383773446, -0.0264539961, 0.998493731, 0.0480682589, 0.0396804214, -0.0469983406, 0.998106539) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.122908428, 3.62031841, -0.300296009, 0.993329167, -0.08360935, 0.0794143826, 0.0752441362, 0.991826117, 0.103050947, -0.0873812661, -0.096388042, 0.991500795) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.27946377, 0.196054846, -0.0853066146, 0.977669358, -0.20545657, 0.0441635996, 0.20282878, 0.977524698, 0.0574999899, -0.0549847484, -0.0472583175, 0.997368217) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.93848646, 1.49346352, -2.41478252, 0.870159626, 0.0276981965, -0.491991103, -0.190459937, -0.901923239, -0.387633443, -0.454474866, 0.431007445, -0.779541671) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.11755061, -4.02567816, -0.574618757, 0.998519659, -0.0264539961, -0.0475273132, 0.0241073575, 0.998493731, -0.0492869914, 0.0487595648, 0.0480682589, 0.997653246) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.05345631, -4.11040878, -0.0093524158, 0.73966682, -0.0264539961, 0.672453284, 0.0518976487, 0.998493731, -0.0178046823, -0.670969307, 0.0480682589, 0.739925504) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	end	

		for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0594634525, 0.0768030137, -0.0666834041, 0.998862267, 0.0283112749, -0.0383773446, -0.0264539961, 0.998493731, 0.0480682589, 0.0396804214, -0.0469983406, 0.998106539) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.122923493, 3.62031841, -0.300292909, 0.993329167, -0.08360935, 0.0794143826, 0.0752441362, 0.991826117, 0.103050947, -0.0873812661, -0.096388042, 0.991500795) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.27946401, 0.196052969, -0.0853065252, 0.977669358, -0.20545657, 0.0441635996, 0.20282878, 0.977524698, 0.0574999899, -0.0549847484, -0.0472583175, 0.997368217) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.89293754, 1.45044494, -1.85970807, -0.996556878, -0.0150756445, 0.0815295279, 0.00878233463, -0.996992052, -0.0770052373, 0.0824451596, -0.0760240704, 0.993691742) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.11755061, -4.02567768, -0.574618697, 0.998519659, -0.0264539961, -0.0475273132, 0.0241073575, 0.998493731, -0.0492869914, 0.0487595648, 0.0480682589, 0.997653246) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.05346203, -4.11040878, -0.00934726, 0.73966682, -0.0264539961, 0.672453284, 0.0518976487, 0.998493731, -0.0178046823, -0.670969307, 0.0480682589, 0.739925504) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
		end
	if e == 1 then
	MagnitudeDamage(Torso, 70, 20, 20, 0, "Seizure", " ", 1)
	Effects.Sphere2.Create(BrickColor.new("Eggplant"), MysteryCard.CFrame, 1, 1, 1, 1, 1, 1, .01)
	Effects.InnerSphere.Create(BrickColor.new("Eggplant"), MysteryCard.CFrame, 100, 2, .01)
	CFuncs.Sound.Create("1751051242", Torso, 5, 1)
	elseif e == 2 then
	MagnitudeDamage(Torso, 70, 10, 10, 0, "Freeze", " ", 1)
	Effects.Sphere2.Create(BrickColor.new("Baby blue"), MysteryCard.CFrame, 2, 2, 2, 2, 2, 2, .01)
	Effects.Sphere1.Create(BrickColor.new("Baby blue"), MysteryCard.CFrame, 1, 1, 1, 1, 1, 1, .01)
	elseif e == 3 then
		CFuncs.Sound.Create("157506631", Torso, 5, 1)
		for i = 1,5 do
		Effects.InnerSphere.Create(BrickColor.new("Crimson"), MysteryCard.CFrame, 100, 2, .01)
		wait(.4)
		end
		wait(.8)
	MagnitudeDamage(Torso, 70, 500, 500, 500, "Normal", " ", 1)
	CFuncs.Sound.Create("1543847134", Torso, 5, 1)
	Effects.Sphere2.Create(BrickColor.new("Crimson"), MysteryCard.CFrame, 2, 2, 2, 13, 13, 13, .01)
	Effects.Sphere1.Create(BrickColor.new("Really red"), MysteryCard.CFrame, 1, 1, 1, 12, 12, 12, .01)
		elseif e == 100 then
	MagnitudeDamage(Torso, 70, 5, 5, 0, "Float", " ", 1)
	Effects.Sphere2.Create(BrickColor.new("White"), MysteryCard.CFrame, 1, 1, 1, 1, 1, 1, .01)
		elseif e == 4 then
	MagnitudeDamage(Torso, 70, 30, 30, 0, "Paralyze", " ", 1)
	Effects.Sphere2.Create(BrickColor.new("Gold"), MysteryCard.CFrame, 1, 1, 1, 8, 8, 8, .05)
	Effects.InnerSphere.Create(BrickColor.new("White"), MysteryCard.CFrame, 100, 2, .01)
	end	
	table.insert(Effects, {MysteryCard,"Disappear",.01})	
				for i = 0, 5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0594634525, 0.0768030137, -0.0666834041, 0.998862267, 0.0283112749, -0.0383773446, -0.0264539961, 0.998493731, 0.0480682589, 0.0396804214, -0.0469983406, 0.998106539) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.122923493, 3.62031841, -0.300292909, 0.993329167, -0.08360935, 0.0794143826, 0.0752441362, 0.991826117, 0.103050947, -0.0873812661, -0.096388042, 0.991500795) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(3.27946401, 0.196052969, -0.0853065252, 0.977669358, -0.20545657, 0.0441635996, 0.20282878, 0.977524698, 0.0574999899, -0.0549847484, -0.0472583175, 0.997368217) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.89293754, 1.45044494, -1.85970807, -0.996556878, -0.0150756445, 0.0815295279, 0.00878233463, -0.996992052, -0.0770052373, 0.0824451596, -0.0760240704, 0.993691742) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.11755061, -4.02567768, -0.574618697, 0.998519659, -0.0264539961, -0.0475273132, 0.0241073575, 0.998493731, -0.0492869914, 0.0487595648, 0.0480682589, 0.997653246) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.05346203, -4.11040878, -0.00934726, 0.73966682, -0.0264539961, 0.672453284, 0.0518976487, 0.998493731, -0.0178046823, -0.670969307, 0.0480682589, 0.739925504) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	end
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50	
		Attack = false
	MysteryCard:Destroy()
	MysteryCardWeld:Destroy()
	end


	 
	
function unanchor()
		g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
		end
	end
end
	

Mouse.KeyDown:connect(function(Key)
	Key = Key:lower()
			if Attack == false and Key == 'z' and Anim == "Idle" then
 			overthere()
			elseif Attack == false and Key == 'x' and Anim == "Idle" then
			topwat()
			elseif Attack == false and Key == 'c' then
 			card()
			elseif Attack == false and Key == 'v' then
 			print("too lazy to add this move lul")
			elseif Attack == false and Key == 't' and Anim == "Idle" then
			hatsoff()
end
end)





while true do
	swait()
        unanchor()
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Part") then
			v.Material = "SmoothPlastic"
		elseif v:IsA("Accessory") then
			v:WaitForChild("Handle").Material = "SmoothPlastic"
		end
	end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA'Model' then
			for _, c in pairs(v:GetChildren()) do
				if c:IsA'Part' then
					c.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
				end
			end
		end
	end
	TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
	Velocity = RootPart.Velocity.y
	Sine = os.clock()*50
	local hit, pos = RayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 7, Character)
	if RootPart.Velocity.y > 1 and hit == nil then 
		Anim = "Jump"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-0, -0, -0, 1.00000751, 0, 0, 0, 1, 0, 0, 0, 1.00000751) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-6.66721871e-06, 4.92021656, -0.417787671, 1.00000381, 4.02331352e-07, -2.29477882e-06, 0, 0.984807849, 0.173648134, 2.32458115e-06, -0.173648804, 0.984811544) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.04141426, 2.38522053, -0.261183709, 0.870933354, 0.490618378, 0.0278630257, 0.491302133, -0.868171513, -0.0700040013, -0.0101553798, 0.0746579692, -0.997161388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.27295709, 2.68117261, -0.407387137, -0.142512456, -0.53919214, 0.830046415, 0.0714119896, -0.842015326, -0.534706116, 0.987221003, -0.0169270113, 0.158502445) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.03295517, -2.92346931, -0.186930001, 0.984811425, 0.0301538315, -0.171010852, 0, 0.984807849, 0.173648164, 0.173648983, -0.171010718, 0.969849944) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.19524062, -3.79352093, -0.555811405, 1.00000381, 0, -1.78813934e-07, 0, 1, 0, 1.78813934e-07, 0, 1.00000381) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .04, false)
		end
	elseif RootPart.Velocity.y < -1 and hit == nil then 
		Anim = "Fall"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-0, -0, -0, 1.00000751, 0, 0, 0, 1, 0, 0, 0, 1.00000751) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, .05), 
         CFrame.new(-6.66721871e-06, 4.92021656, -0.417787671, 1.00000381, 4.02331352e-07, -2.29477882e-06, 0, 0.984807849, 0.173648134, 2.32458115e-06, -0.173648804, 0.984811544) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(2.04141426, 2.38522053, -0.261183709, 0.870933354, 0.490618378, 0.0278630257, 0.491302133, -0.868171513, -0.0700040013, -0.0101553798, 0.0746579692, -0.997161388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-2.27295709, 2.68117261, -0.407387137, -0.142512456, -0.53919214, 0.830046415, 0.0714119896, -0.842015326, -0.534706116, 0.987221003, -0.0169270113, 0.158502445) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.03295517, -2.92346931, -0.186930001, 0.984811425, 0.0301538315, -0.171010852, 0, 0.984807849, 0.173648164, 0.173648983, -0.171010718, 0.969849944) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.19524062, -3.79352093, -0.555811405, 1.00000381, 0, -1.78813934e-07, 0, 1, 0, 1.78813934e-07, 0, 1.00000381) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .04, false)
		end		
	elseif TorsoVelocity < 1 and hit ~= nil then
		Anim = "Idle"
		if Attack == false then
			Change = 1
				PlayAnimationFromTable({
         CFrame.new(-0, -0, -0, 1.00000751, 0, 0, 0, 1, 0, 0, 0, 1.00000751) * CFrame.new(0,0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, .02), 
         CFrame.new(2.09699351e-07, 3.07826781, -0.0930013061, 1.00000381, 4.02331352e-07, -2.29477882e-06, 0, 0.984807849, 0.173648134, 2.32458115e-06, -0.173648804, 0.984811544) * CFrame.new(0, 0 + .2 * math.cos(Sine/10), 0) * CFrame.Angles(RAD(0 + 5 * math.cos(Sine/10)), 0, 0), 
         CFrame.new(3.23488927, 0.217123732, -0.0756206512, 0.986215889, -0.164953321, -0.0135539025, 0.164731994, 0.986208379, -0.0160120502, 0.0160082281, 0.0135585759, 0.99978739) * CFrame.new(0, 0 + .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, RAD(0 - 2 * math.cos(Sine/10))), 
         CFrame.new(-2.27295804, 2.68117332, -0.407379597, -0.142512456, -0.53919214, 0.830046415, 0.0714119896, -0.842015326, -0.534706116, 0.987221003, -0.0169270113, 0.158502445) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, RAD(0 + 2 * math.cos(Sine/10))), 
         CFrame.new(1.00000048, -3.99999428, 8.58306885e-06, 0.984811425, 0.0301538315, -0.171010852, 0, 0.984807849, 0.173648164, 0.173648983, -0.171010718, 0.969849944) * CFrame.new(0, 0 - .1 * math.cos(Sine/10), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.19524455, -4.0063982, -0.555813253, 0.996198535, 0, 0.0871554539, 0, 1, 0, -0.0871554539, 0, 0.996198535) * CFrame.new(0, 0 - playlist.PlaybackLoudness/500 * math.cos(Sine/3.5), 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
		end
	elseif TorsoVelocity > 2 and hit ~= nil then
		Anim = "Walk"
            if Attack == false then
				PlayAnimationFromTable({
         CFrame.new(-0, -0, -0, 1.00000751, 0, 0, 0, 1, 0, 0, 0, 1.00000751) * CFrame.new(0, .1 + .2 * math.cos(Sine/8), 0) * CFrame.Angles(-.1, 0 - .02 * math.sin(Sine/8), 0 - .02 * math.sin(Sine/8)), 
         CFrame.new(2.09699351e-07, 3.07826781, -0.0930013061, 1.00000381, 4.02331352e-07, -2.29477882e-06, 0, 0.984807849, 0.173648134, 2.32458115e-06, -0.173648804, 0.984811544) * CFrame.new(0, .1 + .2 * math.cos(Sine/8), 0) * CFrame.Angles(RAD(0 + 2 * math.cos(Sine/4)), 0, 0), 
         CFrame.new(3.23488927, 0.217123732, -0.0756206512, 0.986215889, -0.164953321, -0.0135539025, 0.164731994, 0.986208379, -0.0160120502, 0.0160082281, 0.0135585759, 0.99978739) * CFrame.new(0, .1 + .2 * math.cos(Sine/8), 0) * CFrame.Angles(RAD(0 - 10 * math.cos(Sine/8)), 0, RAD(0 - 2 * math.cos(Sine/10))), 
         CFrame.new(-2.27295804, 2.68117332, -0.407379597, -0.142512456, -0.53919214, 0.830046415, 0.0714119896, -0.842015326, -0.534706116, 0.987221003, -0.0169270113, 0.158502445) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, RAD(0 + 2 * math.cos(Sine/10))), 
         CFrame.new(1.00000048, -3.99999428, 8.58306885e-06, 0.984811425, 0.0301538315, -0.171010852, 0, 0.984807849, 0.173648164, 0.173648983, -0.171010718, 0.969849944) * CFrame.new(0, .1 + .6 * math.cos(Sine/8), math.sin(Sine/-8)) * CFrame.Angles(.1 + .6 * math.sin(Sine/8), 0, 0), 
         CFrame.new(-1.19524455, -4.0063982, -0.555813253, 0.996198535, 0, 0.0871554539, 0, 1, 0, -0.0871554539, 0, 0.996198535) * CFrame.new(0, .1 - .6 * math.cos(Sine/8), math.sin(Sine/8)) * CFrame.Angles(.1 + .6 * math.sin(Sine/-8), 0, 0), 
		}, .1, false)																										--math.cos on the Y angle of the CFrame.new, math.sin on the Z angle of it, and math.sin on the X angle of the CFrame.angles
end
	end
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Ice" then
							if Thing[6] <= Thing[5] then
								Thing[6] = Thing[6] + .05
								Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, .4, 0)
							else
								Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							end
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block4" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.new(0, -Thing[7].Scale.Y, 0) * CFrame.fromEulerAnglesXYZ(3.14, 0, 0)
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2Fire" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							if Thing[1].Transparency >= .3 then
								Thing[1].BrickColor = BrickColor.new("Bright red")
							else
								Thing[1].BrickColor = BrickColor.new("Bright yellow")
							end
						elseif Thing[2] == "Cylinder" then
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, -.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							Mesh = Thing[10]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[1].CFrame = Thing[1].CFrame * Thing[11] * CFrame.new(0, 0, .2)
							Thing[1].Rotation = Vector3.new(0, 0, 0)
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
if playlist.IsPlaying == false then
playlist:Destroy()
playlist=Instance.new("Sound", Torso)
playlist.SoundId = "rbxassetid://" ..songs[math.random(#songs)]
playlist.Volume = 3
playlist.Looped = false
playlist.Name = "aa"
warn(playlist.SoundId)
playlist:Play()
end
playlist.Volume = 3
playlist.Looped = false
--soundbork(workspace)
   if true then
        Humanoid.MaxHealth = 1e100
        Humanoid.Health = 1e100
        Humanoid.Name = math.random()*100
    end
end

       