if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "glitcher scripter";
	Text = "loading...";
	Icon = ""})
Duration = 0.5;

local UserConfig = {
    ["smetana_car"] = {
        Text = "Fe Revenge Claws Mader/Owner",
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
	"-gh 96075343330359 104108498290524 128578799784309"
}
game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
wait(2)
local args = {
	"cmd",
	"-gh 136404593344849 136404593344849 136404593344849 136404593344849 136404593344849 136404593344849 136404593344849 136404593344849 136404593344849 136404593344849 "
}

game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))

wait(2)
local args = {
	"cmd",
	"-net"
}
game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
wait(1)



local healthHide = false 
local reclaim = true 
local novoid = true 
local physp = nil 
local noclipAllParts = false 
local antiragdoll = true 
local newanimate = true 
local discharscripts = true 
local R15toR6 = true 
local hatcollide = true 
local humState16 = true 
local addtools = false 
local hedafterneck = true 
local simrad = 1000 
local loadtime = game:GetService("Players").RespawnTime + 0.5 
local method = 3 







local alignmode = 4 





local flingpart = "HumanoidRootPart" 






local lp = game:GetService("Players").LocalPlayer
local rs, ws, sg = game:GetService("RunService"), game:GetService("Workspace"), game:GetService("StarterGui")
local stepped, heartbeat, renderstepped = rs.Stepped, rs.Heartbeat, rs.RenderStepped
local twait, tdelay, rad, inf, abs, mclamp = task.wait, task.delay, math.rad, math.huge, math.abs, math.clamp
local cf, v3, angles = CFrame.new, Vector3.new, CFrame.Angles
local v3_0, cf_0 = v3(0, 0, 0), cf(0, 0, 0)

local c = lp.Character
if not (c and c.Parent) then
    return
end

c:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (c and c.Parent) then
        c = nil
    end
end)

local destroy = c.Destroy

local function gp(parent, name, className)
    if typeof(parent) == "Instance" then
        for i, v in pairs(parent:GetChildren()) do
            if (v.Name == name) and v:IsA(className) then
                return v
            end
        end
    end
    return nil
end

local v3_xz, v3_net = v3(8, 0, 8), v3(0.1, 25.1, 0.1)
local function getNetlessVelocity(realPartVelocity) 
    if realPartVelocity.Magnitude < 0.1 then return v3_net end
    return realPartVelocity * v3_xz + v3_net
end

if type(simrad) == "number" then
    local shp = getfenv().sethiddenproperty
    if shp then
        local con = nil
        con = heartbeat:Connect(function()
            if not c then return con:Disconnect() end
            shp(lp, "SimulationRadius", simrad)
        end)
    end
end

healthHide = healthHide and ((method == 0) or (method == 2) or (method == 3)) and gp(c, "Head", "BasePart")

local reclaim, lostpart = reclaim and c.PrimaryPart, nil

local v3_hide = v3(0, 3000, 0)
local function align(Part0, Part1)
    
    local att0 = Instance.new("Attachment")
    att0.Position, att0.Orientation, att0.Name = v3_0, v3_0, "att0_" .. Part0.Name
    local att1 = Instance.new("Attachment")
    att1.Position, att1.Orientation, att1.Name = v3_0, v3_0, "att1_" .. Part1.Name

    if alignmode == 4 then
    
        local hide = false
        if Part0 == healthHide then
            healthHide = false
            tdelay(0, function()
                while twait(2.9) and Part0 and c do
                    hide = #Part0:GetConnectedParts() == 1
                    twait(0.1)
                    hide = false
                end
            end)
        end
        
        local rot = rad(0.05)
        local con0, con1 = nil, nil
        con0 = stepped:Connect(function()
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            Part0.RotVelocity = Part1.RotVelocity
        end)
        local lastpos, vel = Part0.Position, Part0.Velocity
        con1 = heartbeat:Connect(function(delta)
            if not (Part0 and Part1 and att1) then return con0:Disconnect() and con1:Disconnect() end
            if (not Part0.Anchored) and (Part0.ReceiveAge == 0) then
                if lostpart == Part0 then
                    lostpart = nil
                end
                local newcf = Part1.CFrame * att1.CFrame
                local vel = (newcf.Position - lastpos) / delta
                Part0.Velocity = getNetlessVelocity(vel)
                if vel.Magnitude < 1 then
                    rot = -rot
                    newcf *= angles(0, 0, rot)
                end
                lastpos = newcf.Position
                if lostpart and (Part0 == reclaim) then
                    newcf = lostpart.CFrame
                elseif hide then
                    newcf += v3_hide
                end
                if novoid and (newcf.Y < ws.FallenPartsDestroyHeight + 0.1) then
                    newcf += v3(0, ws.FallenPartsDestroyHeight + 0.1 - newcf.Y, 0)
                end
                Part0.CFrame = newcf
            elseif (not Part0.Anchored) and (abs(Part0.Velocity.X) < 45) and (abs(Part0.Velocity.Y) < 25) and (abs(Part0.Velocity.Z) < 45) then
                lostpart = Part0
            end
        end)
    
    else
        
        Part0.CustomPhysicalProperties = physp
        if (alignmode == 1) or (alignmode == 2) then
            local ape = Instance.new("AlignPosition")
            ape.MaxForce, ape.MaxVelocity, ape.Responsiveness = inf, inf, inf
            ape.ReactionForceEnabled, ape.RigidityEnabled, ape.ApplyAtCenterOfMass = false, true, false
            ape.Attachment0, ape.Attachment1, ape.Name = att0, att1, "AlignPositionRtrue"
            ape.Parent = att0
        end
        
        if (alignmode == 2) or (alignmode == 3) then
            local apd = Instance.new("AlignPosition")
            apd.MaxForce, apd.MaxVelocity, apd.Responsiveness = inf, inf, inf
            apd.ReactionForceEnabled, apd.RigidityEnabled, apd.ApplyAtCenterOfMass = false, false, false
            apd.Attachment0, apd.Attachment1, apd.Name = att0, att1, "AlignPositionRfalse"
            apd.Parent = att0
        end
        
        local ao = Instance.new("AlignOrientation")
        ao.MaxAngularVelocity, ao.MaxTorque, ao.Responsiveness = inf, inf, inf
        ao.PrimaryAxisOnly, ao.ReactionTorqueEnabled, ao.RigidityEnabled = false, false, false
        ao.Attachment0, ao.Attachment1 = att0, att1
        ao.Parent = att0
        
        local con0, con1 = nil, nil
        local vel = Part0.Velocity
        con0 = renderstepped:Connect(function()
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            
        end)
        local lastpos = Part0.Position
        con1 = heartbeat:Connect(function(delta)
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            vel = Part0.Velocity
            Part0.Velocity = getNetlessVelocity((Part1.Position - lastpos) / delta)
            lastpos = Part1.Position
        end)
    
    end

    att0:GetPropertyChangedSignal("Parent"):Connect(function()
        Part0 = att0.Parent
        if not Part0:IsA("BasePart") then
            att0 = nil
            if lostpart == Part0 then
                lostpart = nil
            end
            Part0 = nil
        end
    end)
    att0.Parent = Part0
    
    att1:GetPropertyChangedSignal("Parent"):Connect(function()
        Part1 = att1.Parent
        if not Part1:IsA("BasePart") then
            att1 = nil
            Part1 = nil
        end
    end)
    att1.Parent = Part1
end

local function respawnrequest()
    local ccfr, c = ws.CurrentCamera.CFrame, lp.Character
    lp.Character = nil
    lp.Character = c
    local con = nil
    con = ws.CurrentCamera.Changed:Connect(function(prop)
        if (prop ~= "Parent") and (prop ~= "CFrame") then
            return
        end
        ws.CurrentCamera.CFrame = ccfr
        con:Disconnect()
    end)
end

local destroyhum = (method == 4) or (method == 5)
local breakjoints = (method == 0) or (method == 4)
local antirespawn = (method == 0) or (method == 2) or (method == 3)

hatcollide = hatcollide and (method == 0)

addtools = addtools and lp:FindFirstChildOfClass("Backpack")

if antiragdoll then
    antiragdoll = function(v)
        if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
            v.Parent = nil
        end
    end
    for i, v in pairs(c:GetDescendants()) do
        antiragdoll(v)
    end
    c.DescendantAdded:Connect(antiragdoll)
end

if antirespawn then
    respawnrequest()
end

if method == 0 then
    twait(loadtime)
    if not c then
        return
    end
end

if discharscripts then
    for i, v in pairs(c:GetDescendants()) do
        if v:IsA("LocalScript") then
            v.Disabled = true
        end
    end
elseif newanimate then
    local animate = gp(c, "Animate", "LocalScript")
    if animate and (not animate.Disabled) then
        animate.Disabled = true
    else
        newanimate = false
    end
end

if addtools then
    for i, v in pairs(addtools:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = c
        end
    end
end

pcall(function()
    settings().Physics.AllowSleep = false
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
end)

local OLDscripts = {}

for i, v in pairs(c:GetDescendants()) do
    if v.ClassName == "Script" then
        OLDscripts[v.Name] = true
    end
end

local scriptNames = {}

for i, v in pairs(c:GetDescendants()) do
    if v:IsA("BasePart") then
        local newName, exists = tostring(i), true
        while exists do
            exists = OLDscripts[newName]
            if exists then
                newName = newName .. "_"    
            end
        end
        table.insert(scriptNames, newName)
        Instance.new("Script", v).Name = newName
    end
end

local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
    for i, v in pairs(hum:GetPlayingAnimationTracks()) do
        v:Stop()
    end
end
c.Archivable = true
local cl = c:Clone()
if hum and humState16 then
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    if destroyhum then
        twait(1.6)
    end
end
if destroyhum then
    pcall(destroy, hum)
end

if not c then
    return
end

local head, torso, root = gp(c, "Head", "BasePart"), gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart"), gp(c, "HumanoidRootPart", "BasePart")
if hatcollide then
    pcall(destroy, torso)
    pcall(destroy, root)
    pcall(destroy, c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script"))
end

local model = Instance.new("Model", c)
model.Name = "MoonConvertRealChar"
model:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (model and model.Parent) then
        model = nil
    end
end)

for i, v in pairs(c:GetChildren()) do
    if v ~= model then
        if addtools and v:IsA("Tool") then
            for i1, v1 in pairs(v:GetDescendants()) do
                if v1 and v1.Parent and v1:IsA("BasePart") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity, bv.MaxForce, bv.P, bv.Name = v3_0, v3(1000, 1000, 1000), 1250, "bv_" .. v.Name
                    bv.Parent = v1
                end
            end
        end
        v.Parent = model
    end
end

if breakjoints then
    model:BreakJoints()
else
    if head and torso then
        for i, v in pairs(model:GetDescendants()) do
            if v:IsA("JointInstance") then
                local save = false
                if (v.Part0 == torso) and (v.Part1 == head) then
                    save = true
                end
                if (v.Part0 == head) and (v.Part1 == torso) then
                    save = true
                end
                if save then
                    if hedafterneck then
                        hedafterneck = v
                    end
                else
                    pcall(destroy, v)
                end
            end
        end
    end
    if method == 3 then
        task.delay(loadtime, pcall, model.BreakJoints, model)
    end
end

cl.Parent = ws
for i, v in pairs(cl:GetChildren()) do
    v.Parent = c
end
pcall(destroy, cl)

local uncollide, noclipcon = nil, nil
if noclipAllParts then
    uncollide = function()
        if c then
            for i, v in pairs(c:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        else
            noclipcon:Disconnect()
        end
    end
else
    uncollide = function()
        if model then
            for i, v in pairs(model:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        else
            noclipcon:Disconnect()
        end
    end
end
noclipcon = stepped:Connect(uncollide)
uncollide()

for i, scr in pairs(model:GetDescendants()) do
    if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
        local Part0 = scr.Parent
        if Part0:IsA("BasePart") then
            for i1, scr1 in pairs(c:GetDescendants()) do
                if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
                    local Part1 = scr1.Parent
                    if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
                        align(Part0, Part1)
                        pcall(destroy, scr)
                        pcall(destroy, scr1)
                        break
                    end
                end
            end
        end
    end
end

for i, v in pairs(c:GetDescendants()) do
    if v and v.Parent and (not v:IsDescendantOf(model)) then
        if v:IsA("Decal") then
            v.Transparency = 1
        elseif v:IsA("BasePart") then
            v.Transparency = 1
            v.Anchored = false
        elseif v:IsA("ForceField") then
            v.Visible = false
        elseif v:IsA("Sound") then
            v.Playing = false
        elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
end

if newanimate then
    local animate = gp(c, "Animate", "LocalScript")
    if animate then
        animate.Disabled = false
    end
end

if addtools then
    for i, v in pairs(c:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = addtools
        end
    end
end

local hum0, hum1 = model:FindFirstChildOfClass("Humanoid"), c:FindFirstChildOfClass("Humanoid")
if hum0 then
    hum0:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (hum0 and hum0.Parent) then
            hum0 = nil
        end
    end)
end
if hum1 then
    hum1:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (hum1 and hum1.Parent) then
            hum1 = nil
        end
    end)

    ws.CurrentCamera.CameraSubject = hum1
    local camSubCon = nil
    local function camSubFunc()
        camSubCon:Disconnect()
        if c and hum1 then
            ws.CurrentCamera.CameraSubject = hum1
        end
    end
    camSubCon = renderstepped:Connect(camSubFunc)
    if hum0 then
        hum0:GetPropertyChangedSignal("Jump"):Connect(function()
            if hum1 then
                hum1.Jump = hum0.Jump
            end
        end)
    else
        respawnrequest()
    end
end

local rb = Instance.new("BindableEvent", c)
rb.Event:Connect(function()
    pcall(destroy, rb)
    sg:SetCore("ResetButtonCallback", true)
    if destroyhum then
        if c then c:BreakJoints() end
        return
    end
    if model and hum0 and (hum0.Health > 0) then
        model:BreakJoints()
        hum0.Health = 0
    end
    if antirespawn then
        respawnrequest()
    end
end)
sg:SetCore("ResetButtonCallback", rb)

tdelay(0, function()
    while c do
        if hum0 and hum1 then
            hum1.Jump = hum0.Jump
        end
        wait()
    end
    sg:SetCore("ResetButtonCallback", true)
end)

R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
if R15toR6 then
    local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    if part then
        local cfr = part.CFrame
        local R6parts = { 
            head = {
                Name = "Head",
                Size = v3(2, 1, 1),
                R15 = {
                    Head = 0
                }
            },
            torso = {
                Name = "Torso",
                Size = v3(2, 2, 1),
                R15 = {
                    UpperTorso = 0.2,
                    LowerTorso = -0.8
                }
            },
            root = {
                Name = "HumanoidRootPart",
                Size = v3(2, 2, 1),
                R15 = {
                    HumanoidRootPart = 0
                }
            },
            leftArm = {
                Name = "Left Arm",
                Size = v3(1, 2, 1),
                R15 = {
                    LeftHand = -0.849,
                    LeftLowerArm = -0.174,
                    LeftUpperArm = 0.415
                }
            },
            rightArm = {
                Name = "Right Arm",
                Size = v3(1, 2, 1),
                R15 = {
                    RightHand = -0.849,
                    RightLowerArm = -0.174,
                    RightUpperArm = 0.415
                }
            },
            leftLeg = {
                Name = "Left Leg",
                Size = v3(1, 2, 1),
                R15 = {
                    LeftFoot = -0.85,
                    LeftLowerLeg = -0.29,
                    LeftUpperLeg = 0.49
                }
            },
            rightLeg = {
                Name = "Right Leg",
                Size = v3(1, 2, 1),
                R15 = {
                    RightFoot = -0.85,
                    RightLowerLeg = -0.29,
                    RightUpperLeg = 0.49
                }
            }
        }
        for i, v in pairs(c:GetChildren()) do
            if v:IsA("BasePart") then
                for i1, v1 in pairs(c:GetChildren()) do
                    if v1:IsA("Motor6D") then
                        v1.Part0 = nil
                    end
                end
            end
        end
        part.Archivable = true
        for i, v in pairs(R6parts) do
            local part = part:Clone()
            part:ClearAllChildren()
            part.Name, part.Size, part.CFrame, part.Anchored, part.Transparency, part.CanCollide = v.Name, v.Size, cfr, false, 1, false
            for i1, v1 in pairs(v.R15) do
                local R15part = gp(c, i1, "BasePart")
                local att = gp(R15part, "att1_" .. i1, "Attachment")
                if R15part then
                    local weld = Instance.new("Weld")
                    weld.Part0, weld.Part1, weld.C0, weld.C1, weld.Name = part, R15part, cf(0, v1, 0), cf_0, "Weld_" .. i1
                    weld.Parent = R15part
                    R15part.Massless, R15part.Name = true, "R15_" .. i1
                    R15part.Parent = part
                    if att then
                        att.Position = v3(0, v1, 0)
                        att.Parent = part
                    end
                end
            end
            part.Parent = c
            R6parts[i] = part
        end
        local R6joints = {
            neck = {
                Parent = R6parts.torso,
                Name = "Neck",
                Part0 = R6parts.torso,
                Part1 = R6parts.head,
                C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
            },
            rootJoint = {
                Parent = R6parts.root,
                Name = "RootJoint" ,
                Part0 = R6parts.root,
                Part1 = R6parts.torso,
                C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
            },
            rightShoulder = {
                Parent = R6parts.torso,
                Name = "Right Shoulder",
                Part0 = R6parts.torso,
                Part1 = R6parts.rightArm,
                C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            },
            leftShoulder = {
                Parent = R6parts.torso,
                Name = "Left Shoulder",
                Part0 = R6parts.torso,
                Part1 = R6parts.leftArm,
                C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            },
            rightHip = {
                Parent = R6parts.torso,
                Name = "Right Hip",
                Part0 = R6parts.torso,
                Part1 = R6parts.rightLeg,
                C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            },
            leftHip = {
                Parent = R6parts.torso,
                Name = "Left Hip" ,
                Part0 = R6parts.torso,
                Part1 = R6parts.leftLeg,
                C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            }
        }
        for i, v in pairs(R6joints) do
            local joint = Instance.new("Motor6D")
            for prop, val in pairs(v) do
                joint[prop] = val
            end
            R6joints[i] = joint
        end
        if hum1 then
            hum1.RigType, hum1.HipHeight = Enum.HumanoidRigType.R6, 0
        end
    end
end

local torso1 = torso
torso = gp(c, "Torso", "BasePart") or ((not R15toR6) and gp(c, torso.Name, "BasePart"))
if (typeof(hedafterneck) == "Instance") and head and torso and torso1 then
    local conNeck, conTorso, conTorso1 = nil, nil, nil
    local aligns = {}
    local function enableAligns()
        conNeck:Disconnect()
        conTorso:Disconnect()
        conTorso1:Disconnect()
        for i, v in pairs(aligns) do
            v.Enabled = true
        end
    end
    conNeck = hedafterneck.Changed:Connect(function(prop)
        if table.find({"Part0", "Part1", "Parent"}, prop) then
            enableAligns()
        end
    end)
    conTorso = torso:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
    conTorso1 = torso1:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
    for i, v in pairs(head:GetDescendants()) do
        if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
            i = tostring(i)
            aligns[i] = v
            v:GetPropertyChangedSignal("Parent"):Connect(function()
                aligns[i] = nil
            end)
            v.Enabled = false
        end
    end
end

local flingpart0 = gp(model, flingpart, "BasePart") or gp(gp(model, flingpart, "Accessory"), "Handle", "BasePart")
local flingpart1 = gp(c, flingpart, "BasePart") or gp(gp(c, flingpart, "Accessory"), "Handle", "BasePart")

local fling = function() end
if flingpart0 and flingpart1 then
    flingpart0:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (flingpart0 and flingpart0.Parent) then
            flingpart0 = nil
            fling = function() end
        end
    end)
    flingpart0.Archivable = true
    flingpart1:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (flingpart1 and flingpart1.Parent) then
            flingpart1 = nil
            fling = function() end
        end
    end)
    local att0 = gp(flingpart0, "att0_" .. flingpart0.Name, "Attachment")
    local att1 = gp(flingpart1, "att1_" .. flingpart1.Name, "Attachment")
    if att0 and att1 then
        att0:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (att0 and att0.Parent) then
                att0 = nil
                fling = function() end
            end
        end)
        att1:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (att1 and att1.Parent) then
                att1 = nil
                fling = function() end
            end
        end)
        local lastfling = nil
        local mouse = lp:GetMouse()
        fling = function(target, duration, rotVelocity)
            if typeof(target) == "Instance" then
                if target:IsA("BasePart") then
                    target = target.Position
                elseif target:IsA("Model") then
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                elseif target:IsA("Humanoid") then
                    target = target.Parent
                    if not (target and target:IsA("Model")) then
                        return
                    end
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                else
                    return
                end
            elseif typeof(target) == "CFrame" then
                target = target.Position
            elseif typeof(target) ~= "Vector3" then
                target = mouse.Hit
                if target then
                    target = target.Position
                else
                    return
                end
            end
            if target.Y < ws.FallenPartsDestroyHeight + 5 then
                target = v3(target.X, ws.FallenPartsDestroyHeight + 5, target.Z)
            end
            lastfling = target
            if type(duration) ~= "number" then
                duration = tonumber(duration) or 0.5
            end
            if typeof(rotVelocity) ~= "Vector3" then
                rotVelocity = v3(20000, 20000, 20000)
            end
            if not (target and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            flingpart0.Archivable = true
            local flingpart = flingpart0:Clone()
            flingpart.Transparency = 1
            flingpart.CanCollide = false
            flingpart.Name = "flingpart_" .. flingpart0.Name
            flingpart.Anchored = true
            flingpart.Velocity = v3_0
            flingpart.RotVelocity = v3_0
            flingpart.Position = target
            flingpart:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (flingpart and flingpart.Parent) then
                    flingpart = nil
                end
            end)
            flingpart.Parent = flingpart1
            if flingpart0.Transparency > 1 then
                flingpart0.Transparency = 1
            end
            att1.Parent = flingpart
            local con = nil
            local rotchg = v3(0, rotVelocity.Unit.Y * -1000, 0)
            con = heartbeat:Connect(function(delta)
                if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                    flingpart.Orientation += rotchg * delta
                    flingpart0.RotVelocity = rotVelocity
                else
                    con:Disconnect()
                end
            end)
            if alignmode ~= 4 then
                local con = nil
                con = renderstepped:Connect(function()
                    if flingpart0 and target then
                        flingpart0.RotVelocity = v3_0
                    else
                        con:Disconnect()
                    end
                end)
            end
            twait(duration)
            if lastfling ~= target then
                if flingpart then
                    if att1 and (att1.Parent == flingpart) then
                        att1.Parent = flingpart1
                    end
                    pcall(destroy, flingpart)
                end
                return
            end
            target = nil
            if not (flingpart and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            flingpart0.RotVelocity = v3_0
            att1.Parent = flingpart1
            pcall(destroy, flingpart)
        end
    end

    task.wait(loadtime)

    game:GetService('ReplicatedStorage'):WaitForChild('01_server'):FireServer('cmd', '-net ')
end

lp:GetMouse().Button1Down:Connect(fling) 






 








wait(0.1)

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "glitcher scripter";
	Text = "done hehe";
	Icon = ""})
Duration = 1;

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera


local gui = Instance.new("ScreenGui")
gui.Name = "FPSGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Name = "FPSCounter"
label.Size = UDim2.new(0, 120, 0, 40)
label.Position = UDim2.new(1, -130, 0, 10)
label.AnchorPoint = Vector2.new(1, 0)  
label.BackgroundTransparency = 1
label.Text = "FPS: 0"
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
label.TextStrokeTransparency = 0.5
label.TextScaled = true
label.Parent = gui

RunService.RenderStepped:Connect(function(deltaTime)
	local fps = math.floor(1 / deltaTime)
	label.Text = "FPS: " .. fps
end)


Player=game:GetService("Players").LocalPlayer
Character=Player.Character 
PlayerGui=Player.PlayerGui 
Backpack=Player.Backpack 
Torso=Character.Torso 
Head=Character.Head 
Humanoid=Character.Humanoid
m=Instance.new('Model',Character)
LeftArm=Character["Left Arm"] 
LeftLeg=Character["Left Leg"] 
RightArm=Character["Right Arm"] 
RightLeg=Character["Right Leg"] 
LS=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RS=Torso["Right Shoulder"] 
RH=Torso["Right Hip"] 
Face = Head.face
Neck=Torso.Neck
it=Instance.new
attacktype=1
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
cloaked=false
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=Character.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
attack = false 
attackdebounce = false 
deb=false
equipped=true
hand=false
MMouse=nil
combo=0
mana=0
trispeed=1
pathtrans=.7
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
player=nil 
cloak=false
lightcolor='White'

Humanoid.MaxHealth = 1000
Humanoid.Health = 1000



Humanoid.Changed:Connect(function(property)
	if property == "Health" and Humanoid.Health < 1000 then
		Humanoid.Health = 1000
	end
end)

local Color1= White


 
local fengui=it("GuiMain") 
fengui.Parent=Player.PlayerGui 
fengui.Name="WeaponGUI" 
local fenframe=it("Frame") 
fenframe.Parent=fengui
fenframe.BackgroundColor3=Color3.new(255,255,255) 
fenframe.BackgroundTransparency=1 
fenframe.BorderColor3=Color3.new(17,17,17) 
fenframe.Size=UDim2.new(0.0500000007, 0, 0.100000001, 0)
fenframe.Position=UDim2.new(0.4,0,0.1,0)
local fenbarmana1=it("TextLabel") 
fenbarmana1.Parent=fenframe 
fenbarmana1.Text=" " 
fenbarmana1.BackgroundTransparency=0 
fenbarmana1.BackgroundColor3=Color3.new(0,0,0) 
fenbarmana1.SizeConstraint="RelativeXY" 
fenbarmana1.TextXAlignment="Center" 
fenbarmana1.TextYAlignment="Center" 
fenbarmana1.Position=UDim2.new(0,0,0,0)
fenbarmana1.Size=UDim2.new(4,0,0.2,0)
local fenbarmana2=it("TextLabel") 
fenbarmana2.Parent=fenframe 
fenbarmana2.Text=" " 
fenbarmana2.BackgroundTransparency=0 
fenbarmana2.BackgroundColor3=Torso.Color
fenbarmana2.SizeConstraint="RelativeXY" 
fenbarmana2.TextXAlignment="Center" 
fenbarmana2.TextYAlignment="Center" 
fenbarmana2.Position=UDim2.new(0,0,0,0)
fenbarmana2.Size=UDim2.new(4*mana/100,0,0.2,0)
local fenbarmana3=it("TextLabel") 
fenbarmana3.Parent=fenframe 
fenbarmana3.Text=" " 
fenbarmana3.BackgroundTransparency=0 
fenbarmana3.BackgroundColor3=Color3.new(0,0,0)
fenbarmana3.SizeConstraint="RelativeXY" 
fenbarmana3.TextXAlignment="Center" 
fenbarmana3.TextYAlignment="Center" 
fenbarmana3.Position=UDim2.new(0,0,0,0)
fenbarmana3.Size=UDim2.new(0,0,0.2,0)
local fenbarmana4=it("TextLabel") 
fenbarmana4.Parent=fenframe 
fenbarmana4.Text="Energy("..mana..")"
fenbarmana4.BackgroundTransparency=1 
fenbarmana4.BackgroundColor3=Color3.new(0,0,0) 
fenbarmana4.SizeConstraint="RelativeXY" 
fenbarmana4.TextXAlignment="Center" 
fenbarmana4.TextYAlignment="Center" 
fenbarmana4.Position=UDim2.new(0,0,-0.3,0)
fenbarmana4.Size=UDim2.new(4,0,0.2,0)
fenbarmana4.FontSize="Size9"
fenbarmana4.TextStrokeTransparency=0
fenbarmana4.TextColor=BrickColor.new("White")

mouse=Player:GetMouse()

RSH, LSH=nil, nil 

RW, LW=Instance.new("Weld"), Instance.new("Weld") 
RW.Name="Right Shoulder" LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
TorsoColor=Torso.BrickColor
function NoOutline(Part)
Part.TopSurface,Part.BottomSurface,Part.LeftSurface,Part.RightSurface,Part.FrontSurface,Part.BackSurface = 10,10,10,10,10,10
end
player=Player 
ch=Character
RSH=ch.Torso["Right Shoulder"] 
LSH=ch.Torso["Left Shoulder"] 

RSH.Parent=nil 
LSH.Parent=nil 

RW.Name="Right Shoulder"
RW.Part0=ch.Torso 
RW.C0=cf(1.5, 0.5, 0) 
RW.C1=cf(0, 0.5, 0) 
RW.Part1=ch["Right Arm"] 
RW.Parent=ch.Torso 

LW.Name="Left Shoulder"
LW.Part0=ch.Torso 
LW.C0=cf(-1.5, 0.5, 0) 
LW.C1=cf(0, 0.5, 0) 
LW.Part1=ch["Left Arm"] 
LW.Parent=ch.Torso 

function part(formfactor,parent,reflectance,transparency,brickcolor,name,size)
local fp=it("Part")
fp.formFactor=formfactor 
fp.Parent=parent
fp.Reflectance=reflectance
fp.Transparency=transparency
fp.CanCollide=false 
fp.Locked=true
fp.BrickColor=brickcolor
fp.Name=name
fp.Size=size
fp.Position=Torso.Position 
NoOutline(fp)
fp.Material="Neon"
fp:BreakJoints()
return fp 
end 
 
function mesh(Mesh,part,meshtype,meshid,offset,scale)
local mesh=it(Mesh) 
mesh.Parent=part
if Mesh=="SpecialMesh" then
mesh.MeshType=meshtype
if meshid~="nil" then
mesh.MeshId="http://www.roblox.com/asset/?id="..meshid
end
end
mesh.Offset=offset
mesh.Scale=scale
return mesh
end
 
function weld(parent,part0,part1,c0)
local weld=it("Weld") 
weld.Parent=parent
weld.Part0=part0 
weld.Part1=part1 
weld.C0=c0
return weld
end
 
local Color1=White

local bodvel=Instance.new("BodyVelocity")
local bg=Instance.new("BodyGyro")

function swait(num)
if num==0 or num==nil then
game:service'RunService'.Stepped:wait(0)
else
for i=0,num do
game:service'RunService'.Stepped:wait(0)
end
end
end
 
 
so = function(id,par,vol,pit) 
coroutine.resume(coroutine.create(function()
local sou = Instance.new("Sound",par or workspace)
sou.Volume=vol
sou.Pitch=pit or 1
sou.SoundId=id
swait() 
sou:play() 
game:GetService("Debris"):AddItem(sou,6)
end))
end
 
function clerp(a,b,t) 
local qa = {QuaternionFromCFrame(a)}
local qb = {QuaternionFromCFrame(b)} 
local ax, ay, az = a.x, a.y, a.z 
local bx, by, bz = b.x, b.y, b.z
local _t = 1-t
return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
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

function rayCast(Pos, Dir, Max, Ignore)  
return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 

function SkullEffect(brickcolor,cframe,x1,y1,z1,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
local msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=4770583",vt(0,0,0),vt(x1,y1,z1))

game:GetService("Debris"):AddItem(prt,2)
CF=prt.CFrame
coroutine.resume(coroutine.create(function(Part,Mesh,TehCF) 
for i=0,1,0.2 do
wait()
Part.CFrame=CF*cf(0,0,-0.4)
end
for i=0,1,delay do
wait()

Mesh.Scale=Mesh.Scale
end
for i=0,1,0.1 do
wait()
Part.Transparency=i
end
Part.Parent=nil
end),prt,msh,CF)
end
 
function MagicBlock(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function MagicBlock2(brickcolor,cframe,Parent,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=false
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
local wld=weld(prt,prt,Parent,cframe)
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh,Weld) 
for i=0,1,delay do
wait()
Weld.C0=euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))*cframe

Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh,wld)
end
 
function MagicBlock3(brickcolor,cframe,Parent,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=false
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
local wld=weld(prt,prt,Parent,euler(0,0,0)*cf(0,0,0))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh,Weld) 
for i=0,1,delay do
wait()
Weld.C0=euler(i*20,0,0)

Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh,wld)
end
 
function MagicCircle2(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
local msh=mesh("CylinderMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
local prt2=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt2.Anchored=true
prt2.CFrame=cframe*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
local msh2=mesh("SpecialMesh",prt2,"Sphere","",vt(0,0,0),vt(0.5,0.5,0.5))
game:GetService("Debris"):AddItem(prt2,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,0.1 do
wait()
Part.CFrame=Part.CFrame*cf(0,0.5,0)
end
Part.Parent=nil
end),prt2,msh2)
end
for i=0,1,delay*2 do
wait()
Part.CFrame=Part.CFrame
Mesh.Scale=vt((x1+x3)-(x1+x3)*i,(y1+y3)-(y1+y3)*i,(z1+z3)-(z1+z3)*i)
end
Part.Parent=nil
end),prt,msh)
end

function MagicCircle(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
local msh=mesh("SpecialMesh",prt,"Sphere","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function MagicRing(brickcolor,cframe,x1,y1,z1,x2,y2,z2,x3,y3,z3)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe*euler(x2,y2,z2)

local msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=3270017",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,0.03 do
wait()
Part.CFrame=Part.CFrame
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function BreakEffect(brickcolor,cframe,x1,y1,z1)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
local msh=mesh("SpecialMesh",prt,"Sphere","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,CF,Numbb,randnumb) 
CF=Part.CFrame
Numbb=0
randnumb=math.random()/10
rand1=math.random()/10
for i=0,1,rand1 do
wait()
CF=CF*cf(0,math.random()/2,0)

Part.CFrame=CF*euler(Numbb,0,0)
Part.Transparency=i
Numbb=Numbb+randnumb
end
Part.Parent=nil
end),prt,CF,Numbb,randnumb)
end
 
function MagicWaveThing(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=1051557",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame*euler(0,0.7,0)
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function WaveEffect(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=20329976",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame*cf(0,y3/2,0)
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function StravEffect(brickcolor,cframe,x,y,z,x1,y1,z1,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe*cf(x,y,z)
msh=mesh("SpecialMesh",prt,"FileMesh","rbxassetid://168892363",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh,ex,why,zee) 
local num=math.random()
local num2=math.random(-3,2)+math.random()
local numm=0
for i=0,1,delay*2 do
swait()
Part.CFrame=cframe*euler(0,numm*num*10,0)*cf(ex,why,zee)*cf(-i*10,num2,0)
Part.Transparency=i
numm=numm+0.01
end
Part.Parent=nil
Mesh.Parent=nil
end),prt,msh,x,y,z)
end

Damagefunc=function(hit,minim,maxim,knockback,Type,Property,Delay,KnockbackType,decreaseblock)
        if hit.Parent==nil then
                return
        end
        h=hit.Parent:FindFirstChild("Humanoid")
        for _,v in pairs(hit.Parent:children()) do
        if v:IsA("Humanoid") then
        h=v
        end
        end
        if hit.Parent.Parent:FindFirstChild("Torso")~=nil then
        h=hit.Parent.Parent:FindFirstChild("Humanoid")
        end
        if hit.Parent.className=="Hat" then
        hit=hit.Parent.Parent:findFirstChild("Head")
        end
        if h~=nil and hit.Parent.Name~=Character.Name and hit.Parent:FindFirstChild("Torso")~=nil then
        if hit.Parent:findFirstChild("DebounceHit")~=nil then if hit.Parent.DebounceHit.Value==true then return end end
         



                        c=Instance.new("ObjectValue")
                        c.Name="creator"
                        c.Value=game:service("Players").LocalPlayer
                        c.Parent=h
                        game:GetService("Debris"):AddItem(c,.5)
                Damage=math.random(minim,maxim)

                blocked=false
                block=hit.Parent:findFirstChild("Block")
                if block~=nil then
                print(block.className)
                if block.className=="NumberValue" then
                if block.Value>0 then
                blocked=true
                if decreaseblock==nil then
                block.Value=block.Value-1
                end
                end
                end
                if block.className=="IntValue" then
                if block.Value>0 then
                blocked=true
                if decreaseblock~=nil then
                block.Value=block.Value-1
                end
                end
                end
                end
                if blocked==false then

               
                
                else
                
                
                end
                if Type=="Knockdown" then
                hum=hit.Parent.Humanoid
hum.PlatformStand=true
coroutine.resume(coroutine.create(function(HHumanoid)
swait(1)
HHumanoid.PlatformStand=false
end),hum)
                local angle=(hit.Position-(Property.Position+Vector3.new(0,0,0))).unit

local bodvol=Instance.new("BodyVelocity")
bodvol.velocity=angle*knockback
bodvol.P=5000
bodvol.maxForce=Vector3.new(8e+003, 8e+003, 8e+003)
bodvol.Parent=hit
rl=Instance.new("BodyAngularVelocity")
rl.P=3000
rl.maxTorque=Vector3.new(500000,500000,500000)*50000000000000
rl.angularvelocity=Vector3.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))
rl.Parent=hit
game:GetService("Debris"):AddItem(bodvol,.5)
game:GetService("Debris"):AddItem(rl,.5)
                elseif Type=="Normal" then
                vp=Instance.new("BodyVelocity")
                vp.P=500
                vp.maxForce=Vector3.new(math.huge,0,math.huge)

                if KnockbackType==1 then
                vp.velocity=Property.CFrame.lookVector*knockback+Property.Velocity/1.05
                elseif KnockbackType==2 then
                vp.velocity=Property.CFrame.lookVector*knockback
                end
                if knockback>0 then
                        vp.Parent=hit.Parent.Torso
                end
                game:GetService("Debris"):AddItem(vp,.5)
                elseif Type=="Up" then
                local bodyVelocity=Instance.new("BodyVelocity")
                bodyVelocity.velocity=vt(0,10,0)
                bodyVelocity.P=1000
                bodyVelocity.maxForce=Vector3.new(1e+009, 1e+009, 1e+009)
                bodyVelocity.Parent=hit
                game:GetService("Debris"):AddItem(bodyVelocity,1)
                rl=Instance.new("BodyAngularVelocity")
                rl.P=3000
                rl.maxTorque=Vector3.new(500000,500000,500000)*50000000000000
                rl.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))
                rl.Parent=hit
                game:GetService("Debris"):AddItem(rl,.5)
                elseif Type=="Snare" then
                bp=Instance.new("BodyPosition")
                bp.P=2000
                bp.D=100
                bp.maxForce=Vector3.new(math.huge,math.huge,math.huge)
                bp.position=hit.Parent.Torso.Position
                bp.Parent=hit.Parent.Torso
                game:GetService("Debris"):AddItem(bp,1)
                elseif Type=="Target" then
                if Targetting==false then
                ZTarget=hit.Parent.Torso
                coroutine.resume(coroutine.create(function(Part) 
                so("http://www.roblox.com/asset/?id=15666462",Part,1,1.5) 
                swait(5)
                so("http://www.roblox.com/asset/?id=15666462",Part,1,1.5) 
                end),ZTarget)
                TargHum=ZTarget.Parent:findFirstChild("Humanoid")
                targetgui=Instance.new("BillboardGui")
                targetgui.Parent=ZTarget
                targetgui.Size=UDim2.new(10,100,10,100)
                targ=Instance.new("ImageLabel")
                targ.Parent=targetgui
                targ.BackgroundTransparency=1
                targ.Image="rbxassetid://4834067"
                targ.Size=UDim2.new(1,0,1,0)
                cam.CameraType="Scriptable"
                cam.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)
                dir=Vector3.new(cam.CoordinateFrame.lookVector.x,0,cam.CoordinateFrame.lookVector.z)
                workspace.CurrentCamera.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)
                Targetting=true
                RocketTarget=ZTarget
                for i=1,Property do
                
                if Humanoid.Health>0 and Character.Parent~=nil and TargHum.Health>0 and TargHum.Parent~=nil and Targetting==true then
                swait()
                end
                
                cam.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)
                dir=Vector3.new(cam.CoordinateFrame.lookVector.x,0,cam.CoordinateFrame.lookVector.z)
                cam.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)*cf(0,5,10)*euler(-0.3,0,0)
                end
                Targetting=false
                RocketTarget=nil
                targetgui.Parent=nil
                cam.CameraType="Custom"
                end
                end
                        debounce=Instance.new("BoolValue")
                        debounce.Name="DebounceHit"
                        debounce.Parent=hit.Parent
                        debounce.Value=true
                        game:GetService("Debris"):AddItem(debounce,Delay)
                        c=Instance.new("ObjectValue")
                        c.Name="creator"
                        c.Value=Player
                        c.Parent=h
                        game:GetService("Debris"):AddItem(c,.5)
                CRIT=false
                hitDeb=true
                AttackPos=6
        end
end
 


    Player=game:GetService('Players').LocalPlayer
    Character=Player.Character
    Mouse=Player:GetMouse()
    m=Instance.new('Model',Character)


    local function weldBetween(a, b)
        local weldd = Instance.new("ManualWeld")
        weldd.Part0 = a
        weldd.Part1 = b
        weldd.C0 = CFrame.new()
        weldd.C1 = b.CFrame:inverse() * a.CFrame
        weldd.Parent = a
        return weldd
    end
    
    it=Instance.new
    
    function nooutline(part)
        part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
    end
    
    function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
        local fp=it("Part")
        fp.formFactor=formfactor
        fp.Parent=parent
        fp.Reflectance=reflectance
        fp.Transparency=transparency
        fp.CanCollide=false
        fp.Locked=true
        fp.BrickColor=BrickColor.new(tostring(brickcolor))
        fp.Name=name
        fp.Size=size
        fp.Position=Character.Torso.Position
        nooutline(fp)
        fp.Material=material
        fp:BreakJoints()
        return fp
    end
    
    function mesh(Mesh,part,meshtype,meshid,offset,scale)
        local mesh=it(Mesh)
        mesh.Parent=part
        if Mesh=="SpecialMesh" then
            mesh.MeshType=meshtype
            mesh.MeshId=meshid
        end
        mesh.Offset=offset
        mesh.Scale=scale
        return mesh
    end
    
    function weld(parent,part0,part1,c0,c1)
        local weld=it("Weld")
        weld.Parent=parent
        weld.Part0=part0
        weld.Part1=part1
        weld.C0=c0
        weld.C1=c1
        return weld
    end

local modelzorz=Instance.new("Model") 
modelzorz.Parent=Character 
modelzorz.Name="Claw1"
Handle=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,TorsoColor,"Handle",Vector3.new(1.20000005, 1.20000005, 1))
Handleweld=weld(m,Character["Torso"],Handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-6.74455023, 0.843135834, 3.31332064, 0.866820872, 0.000393055088, -0.498619556, 0.129048944, -0.966104209, 0.223582461, -0.481630623, -0.258152217, -0.837489963))
mesh("SpecialMesh",Handle,Enum.MeshType.Sphere,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))

Finger1L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger1L",Vector3.new(2.20000005, 1, 1))
Finger1Lweld=weld(m,Handle,Finger1L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.89693689, 0.0205960274, 1.83752108, 0.00084605813, 0.865680099, -0.500597, -0.999998748, 2.925843e-005, -0.00163948536, -0.00140464306, 0.500597715, 0.865678906))

Finger2L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger2L",Vector3.new(1, 0.400000006, 1))
Finger2Lweld=weld(m,Handle,Finger2L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0205993652, 3.97038841, -4.62090921, -0.999998689, 2.810359e-005, -0.00163501501, 0.00158691406, 0.25815019, -0.966103554, 0.0003949448, -0.966104805, -0.258149862))
mesh("SpecialMesh",Finger2L,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger3L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger3L",Vector3.new(2.20000005, 1, 1))
Finger3Lweld=weld(m,Handle,Finger3L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.18639517, -0.292996764, 3.91572571, -0.407002717, 0.123095758, -0.905094743, -0.483149111, -0.869928718, 0.098949343, -0.775187671, 0.477568328, 0.413536996))

Finger4L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger4L",Vector3.new(2.20000005, 1, 1))
Finger4Lweld=weld(m,Handle,Finger4L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.62196398, -0.29297936, 1.11572647, -0.835932732, 0.424737811, -0.347583354, -0.483153641, -0.869926155, 0.0989501327, -0.260344028, 0.250651836, 0.932413459))

Finger5L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger5L",Vector3.new(2.20000005, 1, 1))
Finger5Lweld=weld(m,Handle,Finger5L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.55920649, -0.210347176, 1.642519, -0.865201712, -0.000320911407, -0.501423895, -2.98991799e-005, -0.999999881, 0.000691637397, -0.501424074, 0.000613339245, 0.865201592))

Finger6L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger6L",Vector3.new(2.20000005, 1, 1))
Finger6Lweld=weld(m,Handle,Finger6L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.931638, -0.0751047134, 4.50077248, -0.352038473, 0.176153034, -0.919260144, -0.86644727, -0.432817101, 0.248874903, -0.354031444, 0.884103954, 0.304995537))

Finger7L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger7L",Vector3.new(2.20000005, 1, 1))
Finger7Lweld=weld(m,Handle,Finger7L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.34771347, -0.763819337, 1.31078529, 0.484322906, -0.259408951, -0.835546851, 0.129806682, 0.965767562, -0.224595979, 0.865206063, 0.000317394733, 0.501416266))

Finger8L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger8L",Vector3.new(2.20000005, 1, 1))
Finger8Lweld=weld(m,Handle,Finger8L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.85524988, -0.0749192238, 1.7092638, -0.499263257, 0.749717236, -0.434350491, -0.866449237, -0.432811975, 0.248876765, -0.00140497088, 0.500597596, 0.865678906))

Finger9L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger9L",Vector3.new(2.20000005, 1, 1))
Finger9Lweld=weld(m,Handle,Finger9L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.76954031, -0.210381031, 4.2438035, -0.257231236, -0.00066010654, -0.966349661, -3.04505229e-005, -0.999999762, 0.000691249967, -0.966350019, 0.000207226723, 0.257231265))

Finger10L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger10L",Vector3.new(2.20000005, 1, 1))
Finger10Lweld=weld(m,Handle,Finger10L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.87043977, 0.020611763, 4.62094831, 0.00159165263, 0.258152187, -0.966103137, -0.999998748, 2.89455056e-005, -0.00163969398, -0.000395349402, 0.966104329, 0.258151829))

Finger11L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger11L",Vector3.new(1, 0.400000006, 1))
Finger11Lweld=weld(m,Handle,Finger11L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.292981744, 4.28636312, -3.9157095, -0.48314926, -0.869928479, 0.0989517197, -0.407004297, 0.123094313, -0.905094087, 0.775186777, -0.477569282, -0.413537562))
mesh("SpecialMesh",Finger11L,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger12L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger12L",Vector3.new(2.20000005, 1, 1))
Finger12Lweld=weld(m,Handle,Finger12L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.85442352, -0.763632059, 3.85966015, -0.269319534, -0.183654502, -0.945377231, 0.129806384, 0.96576786, -0.22459501, 0.954262853, -0.183203816, -0.236260682))

Finger13L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger13L",Vector3.new(1, 0.400000006, 1))
Finger13Lweld=weld(m,Handle,Finger13L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0751276016, 4.03159618, -4.50067854, -0.866445661, -0.432817698, 0.248879611, -0.352042913, 0.176151246, -0.919258773, 0.354030937, -0.884103894, -0.304995805))
mesh("SpecialMesh",Finger13L,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Gear=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Gear",Vector3.new(4.29999971, 4.30000019, 1))
Gearweld=weld(m,Handle,Gear,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0552597046, -0.0398271084, -0.0363032818, 0.999988854, -3.23429704e-005, 0.00164097548, 3.37436795e-005, 0.999994695, -0.000689953566, -0.00164103508, 0.000689953566, 0.999993086))
mesh("SpecialMesh",Gear,Enum.MeshType.FileMesh,"http://www.roblox.com/asset?id=156292343",Vector3.new(0, 0, 0),Vector3.new(5, 5, 15))

Finger14L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger14L",Vector3.new(1, 0.400000006, 1))
Finger14Lweld=weld(m,Handle,Finger14L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.210398674, 3.86948943, -4.24380398, -3.15159559e-005, -0.999999881, 0.00069090724, -0.257231474, -0.000659480691, -0.966349721, 0.966349959, -0.000208158046, -0.257231474))
mesh("SpecialMesh",Finger14L,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger15L=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger15L",Vector3.new(1, 0.400000006, 1))
Finger15Lweld=weld(m,Handle,Finger15L,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.763661504, 3.95439076, 3.85964441, -0.129806131, -0.965767682, 0.224596098, -0.269319892, -0.1836555, -0.945376873, 0.954262733, -0.183203891, -0.236260891))
mesh("SpecialMesh",Finger15L,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

game:GetService("Players").LocalPlayer.Character["Accessory (gears_back_red)"].Handle.att1_Handle.Parent = Handle
Handle.att1_Handle.Rotation = Vector3.new(0,0,0)
Handle.att1_Handle.Position = Vector3.new(-0,0,0)




local modelzorz2=Instance.new("Model") 
modelzorz2.Parent=Character 
modelzorz2.Name="Claw2"

Handle2=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,TorsoColor,"Handle",Vector3.new(1.20000005, 1.20000005, 1))
Handle2weld=weld(m,Character["Torso"],Handle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(6.65693045, 1.66835713, 2.9684639, 0.866025746, 0.129405379, 0.482963592, -3.67555799e-006, -0.965926409, 0.258817136, 0.499999553, -0.224144042, -0.836516559))
mesh("SpecialMesh",Handle2,Enum.MeshType.Sphere,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))

Finger1R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger1R",Vector3.new(2.20000005, 1, 1))
Finger1Rweld=weld(m,Handle2,Finger1R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.66774845, 0.445008755, 1.50737095, 0.749997497, 0.500002265, -0.433014721, -0.433012635, 0.866024196, 0.250004709, 0.500004232, -2.02655792e-006, 0.866023183))

Finger2R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger2R",Vector3.new(2.20000005, 1, 1))
Finger2Rweld=weld(m,Handle2,Finger2R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.70916891, 0.288796425, 1.12511444, 0.424947768, 0.836517453, -0.34591651, -0.870010257, 0.482961774, 0.0991482884, 0.250003695, 0.25881803, 0.933012009))

Finger3R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger3R",Vector3.new(2.20000005, 1, 1))
Finger3Rweld=weld(m,Handle2,Finger3R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.24143982, 0.288818121, 3.98402214, 0.123706907, 0.408494055, -0.904339194, -0.870007515, 0.482966691, 0.0991476029, 0.477266878, 0.774516642, 0.415139139))

Finger4R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger4R",Vector3.new(1, 0.400000006, 1))
Finger4Rweld=weld(m,Handle2,Finger4R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.288883209, 4.34139919, -3.98407936, -0.870006502, 0.482969046, 0.099145025, 0.123710275, 0.408492953, -0.904339135, -0.477267861, -0.774515808, -0.415139765))
mesh("SpecialMesh",Finger4R,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger5R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger5R",Vector3.new(1, 0.400000006, 1))
Finger5Rweld=weld(m,Handle2,Finger5R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.377311707, 3.81443644, -4.17874861, 1.43051147e-006, 1.00000012, 5.58793545e-006, 0.258813858, 5.02169132e-006, -0.965927303, -0.965927362, 2.82377005e-006, -0.258813858))
mesh("SpecialMesh",Finger5R,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger6R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger6R",Vector3.new(2.20000005, 1, 1))
Finger6Rweld=weld(m,Handle2,Finger6R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.11095357, 0.452475548, 3.33581829, 0.214266971, -0.258726388, -0.941886604, 0.124996454, -0.949091196, 0.289140463, -0.968744338, -0.179685742, -0.171018958))

Finger7R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger7R",Vector3.new(1, 0.400000006, 1))
Finger7Rweld=weld(m,Handle2,Finger7R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.445028067, 4.04179811, -4.22505188, -0.433007121, 0.86602807, 0.250001073, 0.176776409, 0.353552371, -0.918559194, -0.883886516, -0.353548348, -0.306183964))
mesh("SpecialMesh",Finger7R,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger8R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger8R",Vector3.new(2.20000005, 1, 1))
Finger8Rweld=weld(m,Handle2,Finger8R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.71447492, 0.377288342, 4.1787672, 0.258815825, 7.89761543e-007, -0.965926647, 2.11596489e-006, 1.00000012, 1.35600567e-006, 0.965926886, -2.41398811e-006, 0.258815885))

Finger9R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger9R",Vector3.new(1, 0.400000006, 1))
Finger9Rweld=weld(m,Handle2,Finger9R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.452456236, 4.21090841, 3.33576679, -0.124996543, 0.949091196, -0.289140046, 0.214267105, -0.25872606, -0.941886783, -0.968744338, -0.179685771, -0.171019137))
mesh("SpecialMesh",Finger9R,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger10R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger10R",Vector3.new(2.20000005, 1, 1))
Finger10Rweld=weld(m,Handle2,Finger10R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.94182658, 0.445016861, 4.22507095, 0.176774979, 0.353554398, -0.918558657, -0.433007926, 0.866026998, 0.250003278, 0.883886337, 0.353548825, 0.306183696))

Finger11R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Finger11R",Vector3.new(1, 0.400000006, 1))
Finger11Rweld=weld(m,Handle2,Finger11R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.256506443, 3.92671657, -4.59811449, -1.00000024, 2.62260437e-006, 1.4603138e-006, -7.4505806e-007, 0.258819073, -0.965925872, -2.89268792e-006, -0.965925932, -0.258819073))
mesh("SpecialMesh",Finger11R,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 2.92400002, 1.18400002))

Finger12R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger12R",Vector3.new(2.20000005, 1, 1))
Finger12Rweld=weld(m,Handle2,Finger12R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.4743073, 0.377253056, 1.63544273, 0.866023183, -4.61935997e-007, -0.500004172, 1.52736902e-006, 1.00000012, 1.65402889e-006, 0.500004232, -2.21282244e-006, 0.866023183))

Finger13R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger13R",Vector3.new(2.20000005, 1, 1))
Finger13Rweld=weld(m,Handle2,Finger13R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.15870619, 0.452619314, 0.758959055, -0.533491194, -0.310006529, -0.786945462, 0.124997422, -0.949090362, 0.289142251, -0.836518347, 0.0558886975, 0.545081377))

Finger14R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger14R",Vector3.new(2.20000005, 1, 1))
Finger14Rweld=weld(m,Handle2,Finger14R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.84976673, 0.256440639, 1.85214663, 6.2584877e-007, 0.866025329, -0.500000298, -1.00000024, 1.72108412e-006, 1.7285347e-006, 2.38418579e-006, 0.500000298, 0.866025329))

Gear2=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Gear2",Vector3.new(4.29999971, 4.30000019, 1))
Gear2weld=weld(m,Handle2,Gear2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.049841404, 0.049908638, 2.78949738e-005, 0.999990344, -5.01424074e-006, -1.49011612e-007, 5.28991222e-006, 0.999994934, 2.98023224e-008, 2.38418579e-007, -1.63912773e-007, 0.999994636))
mesh("SpecialMesh",Gear2,Enum.MeshType.FileMesh,"http://www.roblox.com/asset?id=156292343",Vector3.new(0, 0, 0),Vector3.new(5, 5, 15))

Finger15R=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Finger15R",Vector3.new(2.20000005, 1, 1))
Finger15Rweld=weld(m,Handle2,Finger15R,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.82676554, 0.256523609, 4.598104, -1.1920929e-006, 0.258818835, -0.965925872, -1.00000012, 1.46776438e-006, 1.63912773e-006, 1.83098018e-006, 0.965925872, 0.258818835))

game:GetService("Players").LocalPlayer.Character["Accessory (gears_back_neon_blue)"].Handle.att1_Handle.Parent = Handle2
Handle2.att1_Handle.Rotation = Vector3.new(0,0,0)
Handle2.att1_Handle.Position = Vector3.new(-0,0,0)



local modelzorz3=Instance.new("Model") 
modelzorz3.Parent=Character 
modelzorz3.Name="Eye"



handle=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Handle",Vector3.new(1.20000005, 1.20000005, 1.20000005))
handleweld=weld(m,Character["Torso"],handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.22326851, -3.5562191, -0.038143158, 0, 0, 1, 0, 1, 0, -1, 0, 0))
mesh("SpecialMesh",handle,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1, 3, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(1.20000005, 1.20000005, 1.20000005))
Partweld=weld(m,handle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 1.09672546e-005, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
mesh("SpecialMesh",Part,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1.102, 0.950000048, 1.16999996))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(1.20000005, 1.20000005, 1.20000005))
Partweld=weld(m,handle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 1.09672546e-005, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
mesh("SpecialMesh",Part,Enum.MeshType.FileMesh,"http://www.roblox.com/Asset/?id=9756362",Vector3.new(0, 0, 0),Vector3.new(1.102, 3, 0.863999963))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(3.79999995, 4, 1.39999998))
Partweld=weld(m,handle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0999984741, 0, -0.100000381, 0, -1, 0, 0, 0, 1, -1, -0, 0))
mesh("SpecialMesh",Part,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=3270017",Vector3.new(0, 0, 0),Vector3.new(4.77400017, 4.96199989, 4.73800039))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,TorsoColor,"Part",Vector3.new(3.79999995, 4, 1.39999998))
Partweld=weld(m,handle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0999984741, 0, -0.100000381, 0, -1, 0, 0, 0, 1, -1, -0, 0))
mesh("SpecialMesh",Part,Enum.MeshType.FileMesh,"http://www.roblox.com/asset/?id=3270017",Vector3.new(0, 0, 0),Vector3.new(4.4920001, 4.70400047, 4.73800039))
Wedge=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.600000024, 2.5999999, 0.599999964))
Wedgeweld=weld(m,handle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.100013733, -3.48671532, -1.09328079, 1, -2.52891718e-012, -6.81310423e-013, 2.53075664e-012, 0.866021812, 0.500005603, -6.74442273e-013, -0.500005603, 0.866021752))
Wedge=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.600000024, 2.5999999, 0.599999964))
Wedgeweld=weld(m,handle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.100009918, -3.09970522, 1.40989685, 1, 0, 0, 0, 1, 0, 0, 0, 1))
Wedge=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.600000024, 2.5999999, 0.599999964))
Wedgeweld=weld(m,handle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.100009918, -3.09970522, 1.39007568, -0.999999702, 0, 5.96046448e-008, 0, 1, 0, -5.96046448e-008, 0, -0.999999702))
Wedge=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.600000024, 2.5999999, 0.599999964))
Wedgeweld=weld(m,handle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.100013733, -3.61302567, 0.360752106, 1, -3.69486299e-012, 1.70532143e-012, 3.81851625e-012, 0.707111537, -0.707102001, 1.40679254e-012, 0.70710206, 0.707111537))

game:GetService("Players").LocalPlayer.Character["Accessory (doomwheel.001Accessory)"].Handle.att1_Handle.Parent = Part
Part.att1_Handle.Rotation = Vector3.new(-0,0,90)
Part.att1_Handle.Position = Vector3.new(0,0,0)
task.spawn(function()
	local CUBE_NAME    = "Accessory (LcGun2)"
	local PER_TIP      = 1
	local RANDOM_ORDER = true
	local OFFSET       = Vector3.new(0, 0, 0)
	local ROTATION     = Vector3.new(-90, 90, 0)
	local MAX_WAIT     = 10
	local plr  = game:GetService("Players").LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()


	local function hasMesh(p)
		for _, c in ipairs(p:GetChildren()) do
			if c:IsA("DataModelMesh") then return true end
		end
		return false
	end

	local function isFingertip(p)
		return p:IsA("BasePart")
			and string.find(string.lower(p.Name), "finger", 1, true) ~= nil
			and hasMesh(p)
	end

	local function collectTips()
		local list = {}
		for _, v in ipairs(char:GetDescendants()) do
			if isFingertip(v) then list[#list + 1] = v end
		end
		return list
	end

	local function collectCubes()
		local list = {}
		for _, v in ipairs(char:GetChildren()) do
			if v.Name == CUBE_NAME then
				local h   = v:FindFirstChild("Handle")
				local att = h and h:FindFirstChild("att1_Handle")
				if att then list[#list + 1] = att end
			end
		end
		return list
	end


	local t0    = os.clock()
	local tips  = collectTips()
	while #tips == 0 and (os.clock() - t0) < MAX_WAIT do
		task.wait(0.2)
		tips = collectTips()
	end

	local cubes = collectCubes()
	while #cubes < #tips * PER_TIP and (os.clock() - t0) < MAX_WAIT do
		task.wait(0.2)
		cubes = collectCubes()
	end

	if #tips == 0 or #cubes == 0 then
		return
	end

	if RANDOM_ORDER then
		for i = #cubes, 2, -1 do
			local j = math.random(i)
			cubes[i], cubes[j] = cubes[j], cubes[i]
		end
	end

	local idx, done = 0, 0
	for _, tip in ipairs(tips) do
		for k = 1, PER_TIP do
			idx = idx + 1
			local att = cubes[idx]
			if not att then break end
			att.Parent   = tip
			att.Rotation = ROTATION
			att.Position = OFFSET
			done = done + 1
		end
	end
end)







local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local function it(className, parent)
    local inst = Instance.new(className)
    inst.Parent = parent
    return inst
end

_G.Moosick = nil

local tracks = {
    {name = "veriant1.mp3",    label = "Variant 1 song"},
    {name = "chaos.mp3",       label = "Variant 2 song "},
    {name = "crystallized.mp3", label = "Variant 3 song"},
    {name = "metal crusher.mp3", label = "Variant 4 song"},
    {name = "revengeclaws.mp3",  label = "ORIGINAL SONG"},
}

local currentSound = nil

local function playTrack(fileName)
    if currentSound then
        currentSound:Stop()
        currentSound:Destroy()
        currentSound = nil
    end

    local success, err = pcall(function()
        local moosick = it("Sound", Character)
        moosick.SoundId = getcustomasset(fileName)
        moosick.Looped = true
        moosick.Pitch = 1
        moosick.Volume = 1
        moosick:Play()

        currentSound = moosick
        _G.Moosick = moosick
    end)

    if not success then
        warn("Ошибка воспроизведения: " .. tostring(err))
    end
end

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

do
    local MU_DESIGN_W  = 160
    local MU_DESIGN_H  = 230
    local MU_RATIO     = 0.14
    local MU_MUL       = 1.0
    local MU_MAX_H     = 260
    local MU_MIN_H     = 76
    local MU_TITLEBAR  = true

    local muCam = workspace.CurrentCamera
    local frame = Instance.new("Frame")
    frame.Name = "MusicPanel"
    frame.Parent = gui
    frame.AnchorPoint = Vector2.new(0, 0.5)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.35
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.new(1, 1, 1)

    local muTitle = Instance.new("TextButton")
    muTitle.Parent = frame
    muTitle.BackgroundColor3 = Color3.new(1, 1, 1)
    muTitle.BackgroundTransparency = 0.05
    muTitle.TextColor3 = Color3.new(0, 0, 0)
    muTitle.Font = Enum.Font.Code
    muTitle.TextScaled = true
    muTitle.Text = "MUSIC  [ - ]"
    muTitle.Visible = MU_TITLEBAR

    local muList = Instance.new("Frame")
    muList.Parent = frame
    muList.BackgroundTransparency = 1
    muList.BorderSizePixel = 0

    local muRows = {}
    for i, track in ipairs(tracks) do
        local btn = Instance.new("TextButton")
        btn.Parent = muList
        btn.BackgroundColor3 = Color3.new(1, 1, 1)
        btn.BackgroundTransparency = 0.1
        btn.TextColor3 = Color3.new(0, 0, 0)
        btn.Font = Enum.Font.Code
        btn.Text = track.label
        btn.TextWrapped = true
        btn.TextScaled = true
        btn.MouseButton1Click:Connect(function()
            playTrack(track.name)
        end)
        muRows[i] = btn
    end

    local muCollapsed = false

    local function muLayout()
        local vp    = muCam.ViewportSize
        local short = math.min(vp.X, vp.Y)
        local h     = math.clamp(short * MU_RATIO * MU_MUL, MU_MIN_H, MU_MAX_H)
        local s     = h / MU_DESIGN_H
        local w     = MU_DESIGN_W * s

        local titleH = MU_TITLEBAR and math.max(12, math.floor(20 * s)) or 0
        local pad    = math.max(2, math.floor(6 * s))
        local gap    = math.max(1, math.floor(4 * s))
        local n      = math.max(1, #muRows)
        local rowH   = math.floor((h - titleH - pad * (n + 1) - gap * (n - 1)) / n)
        rowH = math.max(9, rowH)

        frame.Size = UDim2.new(0, w, 0, muCollapsed and titleH or h)

        muTitle.Position = UDim2.new(0, 0, 0, 0)
        muTitle.Size     = UDim2.new(1, 0, 0, titleH)
        muList.Position  = UDim2.new(0, 0, 0, titleH)
        muList.Size      = UDim2.new(1, 0, 1, -titleH)

        for i, btn in ipairs(muRows) do
            btn.Size     = UDim2.new(1, -pad * 2, 0, rowH)
            btn.Position = UDim2.new(0, pad, 0, pad + (i - 1) * (rowH + gap))
        end
    end

    muLayout()
    muCam:GetPropertyChangedSignal("ViewportSize"):Connect(muLayout)
    task.delay(1, muLayout)
    task.delay(3, muLayout)

    if MU_TITLEBAR then
        muTitle.MouseButton1Click:Connect(function()
            muCollapsed = not muCollapsed
            muList.Visible = not muCollapsed
            muTitle.Text = muCollapsed and "MUSIC  [ + ]" or "MUSIC  [ - ]"
            muLayout()
        end)
    end
end

task.spawn(function()
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local Workspace = game:GetService("Workspace")

    -- ========================================
    -- КОНСТАНТЫ
    -- ========================================
    local BAR_COUNT = 24
    local RADIUS = 10
    local BAR_WIDTH = 0.3
    local BAR_DEPTH = 0.3
    local MIN_HEIGHT = 0.1
    local MAX_HEIGHT = 5
    local TWEEN_INFO = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
    local WHITE = Color3.fromRGB(255, 255, 255)
    local BLACK = Color3.fromRGB(10, 10, 10)
    local GROUND_OFFSET = -1.5

    local bwShades = {
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(220, 220, 220),
        Color3.fromRGB(180, 180, 180),
        Color3.fromRGB(140, 140, 140),
        Color3.fromRGB(100, 100, 100),
        Color3.fromRGB(60, 60, 60),
        Color3.fromRGB(30, 30, 30),
        Color3.fromRGB(10, 10, 10),
    }

    local function pickBW(offset)
        local idx = math.floor((tick() * 4 + (offset or 0)) % #bwShades) + 1
        return bwShades[idx]
    end

    -- ========================================
    -- ПАПКИ
    -- ========================================
    local visFolder = Instance.new("Folder")
    visFolder.Name = "Visualizer"
    visFolder.Parent = Workspace

    local fxFolder = Instance.new("Folder")
    fxFolder.Name = "GlitchFX"
    fxFolder.Parent = visFolder

    -- ========================================
    -- БАРЫ
    -- ========================================
    local bars = {}
    for i = 1, BAR_COUNT do
        local bar = Instance.new("Part")
        bar.Size = Vector3.new(BAR_WIDTH, MIN_HEIGHT, BAR_DEPTH)
        bar.Material = Enum.Material.Neon
        bar.Color = BLACK
        bar.Anchored = true
        bar.CanCollide = false
        bar.CanQuery = false
        bar.CanTouch = false
        bar.Name = tostring(i)
        bar.Parent = visFolder
        bars[i] = {
            part = bar,
            baseAngle = (i / BAR_COUNT) * math.pi * 2,
            smoothHeight = MIN_HEIGHT,
            lastAlpha = 0,
        }
    end

    -- ========================================
    -- КВАДРАТНЫЕ БЛОКИ (PixelBlock — пул 40)
    -- ========================================
    local cubePool = {}
    for i = 1, 40 do
        local cube = Instance.new("Part")
        cube.Size = Vector3.new(1, 1, 1)
        cube.Material = Enum.Material.Neon
        cube.Color = WHITE
        cube.Transparency = 1
        cube.Anchored = true
        cube.CanCollide = false
        cube.CanQuery = false
        cube.CanTouch = false
        cube.Parent = fxFolder

        local cubeMesh = Instance.new("SpecialMesh", cube)
        cubeMesh.MeshType = Enum.MeshType.Brick
        cubeMesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        cubePool[i] = {part = cube, mesh = cubeMesh, active = false}
    end

    local function spawnPixelBlock(pos, color, scale, endScale, duration, moveDir)
        for _, c in ipairs(cubePool) do
            if not c.active then
                c.active = true
                c.part.CFrame = CFrame.new(pos) * CFrame.Angles(
                    math.rad(math.random(-50, 50)),
                    math.rad(math.random(-50, 50)),
                    math.rad(math.random(-50, 50))
                )
                c.part.Color = color
                c.part.Transparency = 0
                c.mesh.Scale = scale

                local dir = moveDir or Vector3.new(
                    math.random(-100, 100) / 50,
                    math.random(-50, 100) / 50,
                    math.random(-100, 100) / 50
                )
                local endPos = pos + dir
                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

                TweenService:Create(c.part, tweenInfo, {
                    CFrame = CFrame.new(endPos) * CFrame.Angles(
                        math.rad(math.random(-180, 180)),
                        math.rad(math.random(-180, 180)),
                        math.rad(math.random(-180, 180))
                    )
                }):Play()
                TweenService:Create(c.mesh, tweenInfo, {Scale = endScale}):Play()
                TweenService:Create(c.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    c.active = false
                    c.part.Transparency = 1
                end)
                return
            end
        end
    end

    local function spawnMagicBlock(pos, color, startScale, endScale, duration)
        for _, c in ipairs(cubePool) do
            if not c.active then
                c.active = true
                c.part.CFrame = CFrame.new(pos) * CFrame.Angles(
                    math.rad(math.random(-50, 50)),
                    math.rad(math.random(-50, 50)),
                    math.rad(math.random(-50, 50))
                )
                c.part.Color = color
                c.part.Transparency = 0
                c.mesh.Scale = startScale

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                TweenService:Create(c.part, tweenInfo, {
                    CFrame = CFrame.new(pos) * CFrame.Angles(
                        math.rad(math.random(-180, 180)),
                        math.rad(math.random(-180, 180)),
                        math.rad(math.random(-180, 180))
                    )
                }):Play()
                TweenService:Create(c.mesh, tweenInfo, {Scale = endScale}):Play()
                TweenService:Create(c.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    c.active = false
                    c.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ЧЁРНЫЕ СТОЛБЫ-ПАЛОЧКИ ПОД НОГАМИ (пул 20)
    -- ========================================
    local pillarPool = {}
    for i = 1, 20 do
        local pillar = Instance.new("Part")
        pillar.Size = Vector3.new(1, 1, 1)
        pillar.Material = Enum.Material.Neon
        pillar.Color = BLACK
        pillar.Transparency = 1
        pillar.Anchored = true
        pillar.CanCollide = false
        pillar.CanQuery = false
        pillar.CanTouch = false
        pillar.Parent = fxFolder

        local pMesh = Instance.new("SpecialMesh", pillar)
        pMesh.MeshType = Enum.MeshType.Brick
        pMesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        pillarPool[i] = {part = pillar, mesh = pMesh, active = false}
    end

    local function spawnPillar(pos, color, width, height, duration)
        for _, p in ipairs(pillarPool) do
            if not p.active then
                p.active = true
                p.part.CFrame = CFrame.new(pos + Vector3.new(0, height / 2, 0))
                p.part.Color = color
                p.part.Transparency = 0
                p.mesh.Scale = Vector3.new(width, 0.01, width)

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TweenService:Create(p.mesh, tweenInfo, {Scale = Vector3.new(width, height, width)}):Play()
                TweenService:Create(p.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    p.active = false
                    p.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ВЕРТИКАЛЬНЫЕ ЛУЧИ (пул 10)
    -- ========================================
    local beamPool = {}
    for i = 1, 10 do
        local beam = Instance.new("Part")
        beam.Size = Vector3.new(1, 1, 1)
        beam.Material = Enum.Material.Neon
        beam.Color = WHITE
        beam.Transparency = 1
        beam.Anchored = true
        beam.CanCollide = false
        beam.CanQuery = false
        beam.CanTouch = false
        beam.Parent = fxFolder

        local beamMesh = Instance.new("SpecialMesh", beam)
        beamMesh.MeshType = Enum.MeshType.Sphere
        beamMesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        beamPool[i] = {part = beam, mesh = beamMesh, active = false}
    end

    local function spawnBeam(pos, color, width, height, duration)
        for _, b in ipairs(beamPool) do
            if not b.active then
                b.active = true
                b.part.CFrame = CFrame.new(pos + Vector3.new(0, height / 2, 0))
                b.part.Color = color
                b.part.Transparency = 0
                b.mesh.MeshType = Enum.MeshType.Brick
                b.mesh.Scale = Vector3.new(width, 0.01, width)

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TweenService:Create(b.mesh, tweenInfo, {Scale = Vector3.new(width, height, width)}):Play()
                TweenService:Create(b.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    b.active = false
                    b.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ПАРАЩИЕ РОМБЫ (пул 12)
    -- ========================================
    local diamondPool = {}
    for i = 1, 12 do
        local d = Instance.new("Part")
        d.Size = Vector3.new(1, 1, 1)
        d.Material = Enum.Material.Neon
        d.Color = WHITE
        d.Transparency = 1
        d.Anchored = true
        d.CanCollide = false
        d.CanQuery = false
        d.CanTouch = false
        d.Parent = fxFolder

        local dmesh = Instance.new("SpecialMesh", d)
        dmesh.MeshType = Enum.MeshType.Sphere
        dmesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        diamondPool[i] = {part = d, mesh = dmesh, active = false}
    end

    local function spawnDiamond(pos, color, duration)
        for _, d in ipairs(diamondPool) do
            if not d.active then
                d.active = true
                d.part.CFrame = CFrame.new(pos) * CFrame.Angles(0, 0, math.rad(45))
                d.part.Color = color
                d.part.Transparency = 0.1

                local startScale = 0.3 + math.random() * 0.3
                d.mesh.MeshType = Enum.MeshType.Brick
                d.mesh.Scale = Vector3.new(startScale, startScale, startScale)

                local rise = 4 + math.random() * 6
                local endPos = pos + Vector3.new(
                    math.random(-30, 30) / 30,
                    rise,
                    math.random(-30, 30) / 30
                )

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TweenService:Create(d.part, tweenInfo, {
                    CFrame = CFrame.new(endPos) * CFrame.Angles(
                        math.rad(math.random(-90, 90)),
                        math.rad(math.random(0, 360)),
                        math.rad(45 + math.random(-30, 30))
                    )
                }):Play()
                TweenService:Create(d.mesh, tweenInfo, {Scale = Vector3.new(0.05, 0.05, 0.05)}):Play()
                TweenService:Create(d.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    d.active = false
                    d.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ИСКРЫ — мелкие частицы, летящие вверх (пул 30)
    -- ========================================
    local sparkPool = {}
    for i = 1, 30 do
        local s = Instance.new("Part")
        s.Size = Vector3.new(1, 1, 1)
        s.Material = Enum.Material.Neon
        s.Color = WHITE
        s.Transparency = 1
        s.Anchored = true
        s.CanCollide = false
        s.CanQuery = false
        s.CanTouch = false
        s.Parent = fxFolder

        local smesh = Instance.new("SpecialMesh", s)
        smesh.MeshType = Enum.MeshType.Sphere
        smesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        sparkPool[i] = {part = s, mesh = smesh, active = false}
    end

    local function spawnSpark(pos, color, duration)
        for _, sp in ipairs(sparkPool) do
            if not sp.active then
                sp.active = true
                sp.part.CFrame = CFrame.new(pos)
                sp.part.Color = color
                sp.part.Transparency = 0

                local startScale = 0.05 + math.random() * 0.1
                sp.mesh.Scale = Vector3.new(startScale, startScale, startScale)

                local endPos = pos + Vector3.new(
                    math.random(-50, 50) / 30,
                    2 + math.random() * 5,
                    math.random(-50, 50) / 30
                )

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TweenService:Create(sp.part, tweenInfo, {CFrame = CFrame.new(endPos)}):Play()
                TweenService:Create(sp.mesh, tweenInfo, {Scale = Vector3.new(0.01, 0.01, 0.01)}):Play()
                TweenService:Create(sp.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    sp.active = false
                    sp.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ПОДНИМАЮЩИЕСЯ ТОЧКИ — мелкие сферы вверх (пул 25)
    -- ========================================
    local dotPool = {}
    for i = 1, 25 do
        local d = Instance.new("Part")
        d.Size = Vector3.new(1, 1, 1)
        d.Material = Enum.Material.Neon
        d.Color = WHITE
        d.Transparency = 1
        d.Anchored = true
        d.CanCollide = false
        d.CanQuery = false
        d.CanTouch = false
        d.Parent = fxFolder

        local dmesh = Instance.new("SpecialMesh", d)
        dmesh.MeshType = Enum.MeshType.Sphere
        dmesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        dotPool[i] = {part = d, mesh = dmesh, active = false}
    end

    local function spawnDot(pos, color, duration)
        for _, dt in ipairs(dotPool) do
            if not dt.active then
                dt.active = true
                dt.part.CFrame = CFrame.new(pos)
                dt.part.Color = color
                dt.part.Transparency = 0.2

                local startScale = 0.1 + math.random() * 0.15
                dt.mesh.Scale = Vector3.new(startScale, startScale, startScale)

                local endY = 3 + math.random() * 6
                local endPos = pos + Vector3.new(
                    math.random(-30, 30) / 40,
                    endY,
                    math.random(-30, 30) / 40
                )

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                TweenService:Create(dt.part, tweenInfo, {CFrame = CFrame.new(endPos)}):Play()
                TweenService:Create(dt.mesh, tweenInfo, {Scale = Vector3.new(0.02, 0.02, 0.02)}):Play()
                TweenService:Create(dt.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    dt.active = false
                    dt.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ГЛИТЧ-ТРЕЩИНЫ НА ЗЕМЛЕ (пул 6)
    -- ========================================
    local crackPool = {}
    for i = 1, 6 do
        local c = Instance.new("Part")
        c.Size = Vector3.new(1, 1, 1)
        c.Material = Enum.Material.Neon
        c.Color = WHITE
        c.Transparency = 1
        c.Anchored = true
        c.CanCollide = false
        c.CanQuery = false
        c.CanTouch = false
        c.Parent = fxFolder

        local cmesh = Instance.new("SpecialMesh", c)
        cmesh.MeshId = "rbxassetid://559831844"
        cmesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        crackPool[i] = {part = c, mesh = cmesh, active = false}
    end

    local function spawnCrack(pos, color, maxScale, duration)
        for _, c in ipairs(crackPool) do
            if not c.active then
                c.active = true
                c.part.CFrame = CFrame.new(pos) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
                c.part.Color = color
                c.part.Transparency = 0.2
                c.mesh.Scale = Vector3.new(0.01, 0.01, 0.01)

                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                TweenService:Create(c.mesh, tweenInfo, {
                    Scale = Vector3.new(maxScale, 0.05, maxScale * 0.3)
                }):Play()
                TweenService:Create(c.part, tweenInfo, {Transparency = 1}):Play()

                task.delay(duration, function()
                    c.active = false
                    c.part.Transparency = 1
                end)
                return
            end
        end
    end

    -- ========================================
    -- ТРЯСКА КАМЕРЫ
    -- ========================================
    local camera = workspace.CurrentCamera
    local shakeAmount = 0

    -- ========================================
    -- СОСТОЯНИЕ
    -- ========================================
    local totalRotation = 0
    local maxLoudness = 5
    local loudnessWorks = false
    local beatTimer = 0
    local lastBeatLoud = 0
    local cubeTimer = 0
    local magicTimer = 0
    local beamTimer = 0
    local diamondTimer = 0
    local crackTimer = 0
    local sparkTimer = 0
    local dotTimer = 0
    local pillarTimer = 0
    local pulseSine = 0

    local function getRoot()
        if Character and Character.Parent then
            return Character:FindFirstChild("HumanoidRootPart")
        end
        return nil
    end

    while not getRoot() do
        task.wait(0.3)
    end

    while not _G.Moosick do
        task.wait(0.3)
    end

    -- ========================================
    -- ОСНОВНОЙ ЦИКЛ
    -- ========================================
    local connection = RunService.Heartbeat:Connect(function(dt)
        local root = getRoot()
        if not root then return end

        local soundRef = _G.Moosick
        local rootPos = root.Position
        local groundPos = Vector3.new(rootPos.X, rootPos.Y + GROUND_OFFSET, rootPos.Z)

        -- Тряска камеры
        if shakeAmount > 0.01 then
            shakeAmount = shakeAmount * 0.85
            camera.CFrame = camera.CFrame * CFrame.new(
                math.random(-100, 100) / 100 * shakeAmount,
                math.random(-100, 100) / 100 * shakeAmount,
                math.random(-100, 100) / 100 * shakeAmount
            )
        else
            shakeAmount = 0
        end

        -- Нет музыки — всё гаснет
        if not soundRef or not soundRef.Parent or not soundRef.IsPlaying then
            for i = 1, #bars do
                local data = bars[i]
                data.smoothHeight = data.smoothHeight + (MIN_HEIGHT - data.smoothHeight) * 0.1
                local h = data.smoothHeight
                local bar = data.part
                bar.Size = Vector3.new(BAR_WIDTH, h, BAR_DEPTH)
                local angle = data.baseAngle + totalRotation
                bar.CFrame = CFrame.new(
                    rootPos + Vector3.new(
                        math.cos(angle) * RADIUS, h / 2 - 1.5, math.sin(angle) * RADIUS
                    )
                ) * CFrame.Angles(0, -angle, 0)
                TweenService:Create(bar, TWEEN_INFO, { Color = BLACK }):Play()
            end
            return
        end

        local loud = 0
        local rawLoud = soundRef.PlaybackLoudness
        if rawLoud > 0 then
            loudnessWorks = true
            loud = rawLoud
        end

        if not loudnessWorks then
            local pos = soundRef.TimePosition
            loud = (math.sin(pos * 6) + 1) / 2 * 4
                + (math.sin(pos * 3.7) + 1) / 2 * 3
                + (math.sin(pos * 11) + 1) / 2 * 2
        end

        if loud <= 0 then
            for i = 1, #bars do
                local data = bars[i]
                data.smoothHeight = data.smoothHeight + (MIN_HEIGHT - data.smoothHeight) * 0.1
                local h = data.smoothHeight
                local bar = data.part
                bar.Size = Vector3.new(BAR_WIDTH, h, BAR_DEPTH)
                local angle = data.baseAngle + totalRotation
                bar.CFrame = CFrame.new(
                    rootPos + Vector3.new(
                        math.cos(angle) * RADIUS, h / 2 - 1.5, math.sin(angle) * RADIUS
                    )
                ) * CFrame.Angles(0, -angle, 0)
                TweenService:Create(bar, TWEEN_INFO, { Color = BLACK }):Play()
            end
            return
        end

        if loud > maxLoudness then
            maxLoudness = loud
        end

        local loudNorm = math.clamp(loud / maxLoudness, 0, 1)
        totalRotation = totalRotation + dt * (0.05 + loudNorm * 1.2)
        pulseSine = pulseSine + dt
        local groundPulse = (math.sin(pulseSine * 4) + 1) / 2
        local pulseAlpha = math.max(groundPulse * loudNorm, loudNorm * 0.3)

        -- ========================================
        -- ЧЁРНЫЕ СТОЛБЫ-ПАЛОЧКИ (постоянная пульсация)
        -- ========================================
        pillarTimer = pillarTimer + dt
        if pillarTimer > (0.3 - loudNorm * 0.2) then
            pillarTimer = 0
            local angle = math.random() * math.pi * 2
            local dist = 1 + math.random() * 8
            local pPos = groundPos + Vector3.new(math.cos(angle) * dist, 0, math.sin(angle) * dist)
            local pWidth = 0.15 + math.random() * 0.2
            local pHeight = 2 + pulseAlpha * 6 + math.random() * 3
            spawnPillar(pPos, pickBW(math.random(0, 7)), pWidth, pHeight, 0.4 + math.random() * 0.3)
        end

        -- ========================================
        -- УДАРНЫЕ ЭФФЕКТЫ (на пиках)
        -- ========================================
        beatTimer = beatTimer + dt
        if loudNorm > 0.65 and loud > lastBeatLoud + 50 and beatTimer > 0.15 then
            beatTimer = 0
            lastBeatLoud = loud

            shakeAmount = loudNorm * 0.4

            -- Взрыв чёрных столбов
            local pillarCount = 5 + math.floor(loudNorm * 5)
            for p = 1, pillarCount do
                local angle = math.random() * math.pi * 2
                local dist = 1 + math.random() * 10
                local pPos = groundPos + Vector3.new(math.cos(angle) * dist, 0, math.sin(angle) * dist)
                local pWidth = 0.2 + math.random() * 0.3
                local pHeight = 5 + math.random() * 10
                spawnPillar(pPos, pickBW(p), pWidth, pHeight, 0.5 + math.random() * 0.5)
            end

            -- Трещины
            local crackCount = 2 + math.floor(loudNorm * 2)
            for c = 1, crackCount do
                local angle = math.random() * math.pi * 2
                local dist = 2 + math.random() * 6
                local cPos = groundPos + Vector3.new(math.cos(angle) * dist, 0, math.sin(angle) * dist)
                spawnCrack(cPos, pickBW(c), 3 + math.random() * 4, 0.5 + math.random() * 0.3)
            end

            -- Лучи
            local beamCount = 2 + math.floor(loudNorm * 2)
            for b = 1, beamCount do
                local angle = math.random() * math.pi * 2
                local dist = 3 + math.random() * 8
                local bPos = groundPos + Vector3.new(math.cos(angle) * dist, 0, math.sin(angle) * dist)
                spawnBeam(bPos, pickBW(b), 0.3 + math.random() * 0.3, 8 + math.random() * 6, 0.5 + math.random() * 0.3)
            end

            -- Квадраты PixelBlock
            local cubeCount = 4 + math.floor(loudNorm * 6)
            for c = 1, cubeCount do
                local angle = math.random() * math.pi * 2
                local dist = 2 + math.random() * 8
                local spawnPos = groundPos + Vector3.new(
                    math.cos(angle) * dist,
                    math.random(0, 30) / 10,
                    math.sin(angle) * dist
                )
                local moveDir = Vector3.new(
                    math.cos(angle) * (3 + math.random() * 5),
                    math.random(10, 60) / 20,
                    math.sin(angle) * (3 + math.random() * 5)
                )
                local startScale = Vector3.new(
                    0.3 + math.random() * 0.4,
                    0.3 + math.random() * 0.4,
                    0.3 + math.random() * 0.4
                )
                spawnPixelBlock(spawnPos, pickBW(c), startScale, startScale * (1.5 + math.random()), 0.5 + math.random() * 0.5, moveDir)
            end

            -- MagicBlock
            for m = 1, 3 do
                local angle = math.random() * math.pi * 2
                local dist = 1 + math.random() * 4
                local mPos = groundPos + Vector3.new(math.cos(angle) * dist, math.random(10, 40) / 10, math.sin(angle) * dist)
                spawnMagicBlock(mPos, pickBW(m), Vector3.new(0.5, 0.5, 0.5), Vector3.new(2 + math.random() * 2, 2 + math.random() * 2, 2 + math.random() * 2), 0.6 + math.random() * 0.4)
            end

            -- Ромбы
            for d = 1, 3 do
                local angle = math.random() * math.pi * 2
                local dist = 2 + math.random() * 6
                local dPos = groundPos + Vector3.new(math.cos(angle) * dist, 0.5, math.sin(angle) * dist)
                spawnDiamond(dPos, pickBW(d), 1 + math.random() * 0.5)
            end

            -- Взрыв искр
            local sparkCount = 8 + math.floor(loudNorm * 8)
            for s = 1, sparkCount do
                local angle = math.random() * math.pi * 2
                local dist = 1 + math.random() * 6
                local sPos = groundPos + Vector3.new(math.cos(angle) * dist, 0.5, math.sin(angle) * dist)
                spawnSpark(sPos, pickBW(s), 0.4 + math.random() * 0.4)
            end

            -- Взрыв точек
            local dotCount = 6 + math.floor(loudNorm * 6)
            for d = 1, dotCount do
                local angle = math.random() * math.pi * 2
                local dist = 1 + math.random() * 5
                local dPos = groundPos + Vector3.new(math.cos(angle) * dist, 0.5, math.sin(angle) * dist)
                spawnDot(dPos, pickBW(d), 0.6 + math.random() * 0.4)
            end
        end
        lastBeatLoud = lastBeatLoud * 0.95

        -- ========================================
        -- РАСПРЕДЕЛЕНИЕ ПО БАРАМ
        -- ========================================
        local mainNumber = math.floor(loudNorm * BAR_COUNT) + 1
        if mainNumber > BAR_COUNT then mainNumber = BAR_COUNT end
        if mainNumber < 1 then mainNumber = 1 end

        local toChange = {}
        toChange[mainNumber] = 1
        for i = 1, 4 do
            local below = mainNumber - i
            local above = mainNumber + i
            if below < 1 then below = BAR_COUNT - i + 1 end
            if above > BAR_COUNT then above = i end
            local alpha = (4 - i) / 4
            local interp = alpha ^ 2.5
            toChange[below] = interp
            toChange[above] = interp
        end

        -- ========================================
        -- ОБНОВЛЕНИЕ БАРОВ
        -- ========================================
        for i = 1, #bars do
            local data = bars[i]
            local bar = data.part
            local angle = data.baseAngle + totalRotation
            local alpha = toChange[i] or 0

            local targetHeight = MIN_HEIGHT + (MAX_HEIGHT - MIN_HEIGHT) * alpha
            data.smoothHeight = data.smoothHeight + (targetHeight - data.smoothHeight) * 0.25
            local height = data.smoothHeight

            local color = BLACK:Lerp(WHITE, alpha)
            if alpha > 0.6 and math.random() > 0.8 then
                color = pickBW(i)
            end

            local barPos = rootPos + Vector3.new(
                math.cos(angle) * RADIUS,
                height / 2 - 1.5,
                math.sin(angle) * RADIUS
            )

            bar.Size = Vector3.new(BAR_WIDTH, height, BAR_DEPTH)
            bar.CFrame = CFrame.new(barPos) * CFrame.Angles(0, -angle, 0)
            TweenService:Create(bar, TWEEN_INFO, { Color = color }):Play()
            data.lastAlpha = alpha
        end

        -- ========================================
        -- ПОСТОЯННЫЕ ЭФФЕКТЫ
        -- ========================================

        -- PixelBlock вокруг персонажа
        cubeTimer = cubeTimer + dt
        if cubeTimer > 0.08 and loudNorm > 0.3 then
            cubeTimer = 0
            local angle = math.random() * math.pi * 2
            local dist = 3 + math.random() * 6
            local spawnPos = groundPos + Vector3.new(math.cos(angle) * dist, math.random(0, 30) / 10, math.sin(angle) * dist)
            local moveDir = Vector3.new(
                math.cos(angle) * (2 + math.random() * 3),
                math.random(10, 40) / 20,
                math.sin(angle) * (2 + math.random() * 3)
            )
            local startScale = Vector3.new(0.2 + math.random() * 0.2, 0.2 + math.random() * 0.2, 0.2 + math.random() * 0.2)
            spawnPixelBlock(spawnPos, pickBW(math.random(0, 7)), startScale, startScale * (1.5 + math.random()), 0.4 + math.random() * 0.4, moveDir)
        end

        -- MagicBlock на пиковых барах
        magicTimer = magicTimer + dt
        if magicTimer > 0.12 and loudNorm > 0.4 then
            magicTimer = 0
            local highBars = {}
            for i = 1, #bars do
                if bars[i].lastAlpha > 0.5 then
                    table.insert(highBars, i)
                end
            end
            if #highBars > 0 then
                local idx = highBars[math.random(1, #highBars)]
                local data = bars[idx]
                local angle = data.baseAngle + totalRotation
                local height = data.smoothHeight
                local barPos = rootPos + Vector3.new(math.cos(angle) * RADIUS, height / 2 - 1.5, math.sin(angle) * RADIUS)
                spawnMagicBlock(barPos + Vector3.new(math.random(-20, 20) / 100, math.random(0, 50) / 100, math.random(-20, 20) / 100), pickBW(idx), Vector3.new(0.3, 0.3, 0.3), Vector3.new(1.5, 1.5, 1.5), 0.5)
            end
        end

        -- Ромбы
        diamondTimer = diamondTimer + dt
        if diamondTimer > 0.25 and loudNorm > 0.35 then
            diamondTimer = 0
            local angle = math.random() * math.pi * 2
            local dist = RADIUS * 0.5 + math.random() * RADIUS * 0.5
            local dPos = groundPos + Vector3.new(math.cos(angle) * dist, 0.5, math.sin(angle) * dist)
            spawnDiamond(dPos, pickBW(math.random(0, 7)), 1.2 + math.random() * 0.6)
        end

        -- Лучи
        beamTimer = beamTimer + dt
        if beamTimer > 0.3 and loudNorm > 0.4 then
            beamTimer = 0
            local angle = math.random() * math.pi * 2
            local dist = 4 + math.random() * 8
            local bPos = groundPos + Vector3.new(math.cos(angle) * dist, 0, math.sin(angle) * dist)
            spawnBeam(bPos, pickBW(math.random(0, 7)), 0.2 + math.random() * 0.2, 5 + math.random() * 4, 0.4 + math.random() * 0.3)
        end

        -- Трещины
        crackTimer = crackTimer + dt
        if crackTimer > 0.2 and loudNorm > 0.45 then
            crackTimer = 0
            local angle = math.random() * math.pi * 2
            local dist = 1 + math.random() * 5
            local cPos = groundPos + Vector3.new(math.cos(angle) * dist, 0, math.sin(angle) * dist)
            spawnCrack(cPos, pickBW(math.random(0, 7)), 2 + math.random() * 3, 0.4 + math.random() * 0.3)
        end

        -- Искры (постоянно на средних пиках)
        sparkTimer = sparkTimer + dt
        if sparkTimer > 0.1 and loudNorm > 0.25 then
            sparkTimer = 0
            for s = 1, 2 do
                local angle = math.random() * math.pi * 2
                local dist = 1 + math.random() * 8
                local sPos = groundPos + Vector3.new(math.cos(angle) * dist, 0.3, math.sin(angle) * dist)
                spawnSpark(sPos, pickBW(math.random(0, 7)), 0.3 + math.random() * 0.3)
            end
        end

        -- Поднимающиеся точки (постоянно)
        dotTimer = dotTimer + dt
        if dotTimer > 0.12 and loudNorm > 0.2 then
            dotTimer = 0
            local angle = math.random() * math.pi * 2
            local dist = 1 + math.random() * 10
            local dPos = groundPos + Vector3.new(math.cos(angle) * dist, 0.2, math.sin(angle) * dist)
            spawnDot(dPos, pickBW(math.random(0, 7)), 0.8 + math.random() * 0.6)
        end
    end)

    -- ========================================
    -- ОЧИСТКА
    -- ========================================
    local Humanoid = Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.Died:Connect(function()
            if connection then
                connection:Disconnect()
            end
            visFolder:Destroy()
        end)
    end

    script.Destroying:Connect(function()
        if connection then
            connection:Disconnect()
        end
        visFolder:Destroy()
    end)
end)






anim = Character:findFirstChild("Animate")
if anim then
anim:Destroy()
end

local particleemitter = Instance.new("ParticleEmitter", Handle)
particleemitter.VelocitySpread = 180
particleemitter.Lifetime = NumberRange.new(0.1)
particleemitter.Speed = NumberRange.new(2)
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 5.563)})
particleemitter.RotSpeed = NumberRange.new(-45, 45)
particleemitter.Rate = 100
particleemitter.Rotation = NumberRange.new(-45, 45)
particleemitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.701, 0), NumberSequenceKeypoint.new(1, 1)})
particleemitter.LightEmission = 0
particleemitter.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))

local particleemitter = Instance.new("ParticleEmitter", Handle2)
particleemitter.VelocitySpread = 180
particleemitter.Lifetime = NumberRange.new(0.1)
particleemitter.Speed = NumberRange.new(2)
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 5.563)})
particleemitter.RotSpeed = NumberRange.new(-45, 45)
particleemitter.Rate = 100
particleemitter.Rotation = NumberRange.new(-45, 45)
particleemitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.701, 0), NumberSequenceKeypoint.new(1, 1)})
particleemitter.LightEmission = 0
particleemitter.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))

local particleemitter = Instance.new("ParticleEmitter", handle)
particleemitter.VelocitySpread = 180
particleemitter.Lifetime = NumberRange.new(0.1)
particleemitter.Speed = NumberRange.new(2)
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 7.563)})
particleemitter.RotSpeed = NumberRange.new(-45, 45)
particleemitter.Rate = 100
particleemitter.Rotation = NumberRange.new(-45, 45)
particleemitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.701, 0), NumberSequenceKeypoint.new(1, 1)})
particleemitter.LightEmission = 0.8
particleemitter.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))



particleemitter.Enabled = true

local Footsteps = it("Sound",Character.Torso)
Footsteps.SoundId = "rbxassetid://108058200985394"
Footsteps.Looped = true
Footsteps.Pitch = 1
Footsteps.Volume = 0.3

local Footsteps2 = it("Sound",Character.Torso)
Footsteps2.SoundId = "rbxassetid://108058200985394"
Footsteps2.Looped = true
Footsteps2.Pitch = 1
Footsteps2.Volume = 0.5

local cam = game.Workspace.CurrentCamera



for i,v in pairs(Head:children()) do
    if v:IsA("Sound") then
        v:Destroy()
    end
end

mouse.Button1Down:connect(function()
        if attack==false and attacktype==1 then
                attacktype=2
                attackone()
        elseif attack==false and attacktype==2 then
                attacktype=3
                attacktwo()
		elseif attack==false and attacktype==3 then
				attacktype=4
				attackthree()
		elseif attack==false and attacktype==4 then
				attacktype=1
				attackfour()
        end
end)

mouse.KeyDown:connect(function(k)
	k=k:lower()
	if k=='e' then
		if attack==false and mana>=0 then
			Push()
		end
		elseif k=='g' then
		if attack==false and mana>=0 then
			Twirl()
		end
		elseif k=='v' then
		if attack==false and mana>=0 then
			MagicJump()
		end
		elseif k=='q' then
		if attack==false then
		idle=1000
		end
		elseif k=='h' then
		if attack==false then
		mana=100
		end
		elseif k=='y' then
		if attack==false and mana>=0 then
			Shred()
		end
		elseif k=='f' then
		if attack==false and mana>=0 then
			Spin()
		end
		elseif k=='r' then
		if attack==false and mana>=20 then
			Clap()
		end
		elseif k=='t' then
		if attack==false then
			Hai()
		end
		elseif k=='p' then
		if attack==false then
			cabun()
		end
		elseif k=='0' then
		if attack==false then
			Humanoid.WalkSpeed=(56)
		end
		elseif k=='j' then
		if attack==false then
			Humanoid.Health = 100
			print("Congrats, you commited suicide.")
		end
	end
end)

function MagicCircle(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)




game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end

TrailDeb = false

function equipanim()
    attack=true
    Humanoid.WalkSpeed = 0
    if TrailDeb == false then
							TrailDeb = true
						end

						
coroutine.wrap(function()
local Old = handle.CFrame.p
while wait()do
if not TrailDeb then break end
local New = handle.CFrame.p
local Mag =(Old -New).magnitude
local Dis =(Old +New)/2
local Trail = Instance.new("Part",Character)













Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end

















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle2.CFrame.p
while wait()do
if not TrailDeb then break end

















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()


local kneePose = {
    Root = CFrame.new(0, -1.5, 0.2) * CFrame.Angles(-1.5708, 0, -3.1416),
    Neck = CFrame.new(0, 1, 0) * CFrame.Angles(-2.2689, 0, -3.1416),
    RW = CFrame.new(1, 0.5, 0) * CFrame.Angles(0, 0.6981, 0),
    LW = CFrame.new(-1, 0.5, 0) * CFrame.Angles(0, -0.6981, 0),
    RH = CFrame.new(1, -1, 0) * CFrame.Angles(-1.3963, 1.5708, 0),
    LH = CFrame.new(-1, 0, -0.5) * CFrame.Angles(0, -1.5708, 0),
}


for i = 0, 1, 0.015 do
    swait()
    local fallProgress = i * i
    RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 80 - 80 * fallProgress) * angles(math.rad(15 * i), math.rad(0), math.rad(0)), .4)
    Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(25 + 20 * i), math.rad(0), math.rad(0)), .4)
    handleweld.C0 = clerp(handleweld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.05)
    Handle2weld.C0 = clerp(Handle2weld.C0, cf(-1.5, 3, 0) * angles(math.rad(0), math.rad(180), math.rad(180)), 0.05)
    Handleweld.C0 = clerp(Handleweld.C0, cf(1.5, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.05)
    RW.C0 = clerp(RW.C0, cf(1.5, 0.5, 0) * angles(math.rad(10 + 40 * i), math.rad(0), math.rad(20 + 30 * i)), .4)
    LW.C0 = clerp(LW.C0, cf(-1.5, 0.5, 0) * angles(math.rad(10 + 40 * i), math.rad(0), math.rad(-20 - 30 * i)), .4)
    RH.C0 = clerp(RH.C0, cf(1, -1, 0) * euler(0, 1.57, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
    LH.C0 = clerp(LH.C0, cf(-1, -1, 0) * euler(0, -1.57, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
end


so("rbxassetid://124417676343735", Character, 1, 1)

for i = 0, 1, 0.03 do
    swait()
    RootJoint.C0 = clerp(RootJoint.C0, kneePose.Root, .5)
    Torso.Neck.C0 = clerp(Torso.Neck.C0, kneePose.Neck * CFrame.Angles(math.rad(25), 0, 0), .5)
    RW.C0 = clerp(RW.C0, kneePose.RW, .5)
    LW.C0 = clerp(LW.C0, kneePose.LW, .5)
    RH.C0 = clerp(RH.C0, kneePose.RH, .5)
    LH.C0 = clerp(LH.C0, kneePose.LH, .5)
    handleweld.C0 = clerp(handleweld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
    Handleweld.C0 = clerp(Handleweld.C0, cf(1.5, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
    Handle2weld.C0 = clerp(Handle2weld.C0, cf(-1.5, 3, 0) * angles(math.rad(0), math.rad(180), math.rad(180)), .2)
end

for i=0,1,0.03 do
    swait()
    RootJoint.C0=clerp(RootJoint.C0, kneePose.Root, .5)
    Torso.Neck.C0=clerp(Torso.Neck.C0, kneePose.Neck * CFrame.Angles(math.rad(25), 0, 0), .5)
    RW.C0=clerp(RW.C0, kneePose.RW, .5)
    LW.C0=clerp(LW.C0, kneePose.LW, .5)
    RH.C0=clerp(RH.C0, kneePose.RH, .5)
    LH.C0=clerp(LH.C0, kneePose.LH, .5)
    handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
    Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
    Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
end


so("rbxassetid://1413550336", Character, 1, 1)

for i=0,1,0.01 do
    swait()
    local sh = math.random(-5,5)
    local sh2 = math.random(-4,4)
    local tremorScale = i

    local headAngle = 25 - 115*i

    RootJoint.C0=clerp(RootJoint.C0, kneePose.Root * CFrame.Angles(math.rad(sh*tremorScale), 0, math.rad(sh2*tremorScale)), .3)
    Torso.Neck.C0=clerp(Torso.Neck.C0, kneePose.Neck * CFrame.Angles(math.rad(headAngle + sh*tremorScale), 0, math.rad(math.random(-15,15)*tremorScale)), .3)
    RW.C0=clerp(RW.C0, kneePose.RW * CFrame.Angles(math.rad(math.random(-8,8)*tremorScale), math.rad(math.random(-8,8)*tremorScale), math.rad(math.random(-8,8)*tremorScale)), .3)
    LW.C0=clerp(LW.C0, kneePose.LW * CFrame.Angles(math.rad(math.random(-8,8)*tremorScale), math.rad(math.random(-8,8)*tremorScale), math.rad(math.random(-8,8)*tremorScale)), .3)
    RH.C0=clerp(RH.C0, kneePose.RH, .2)
    LH.C0=clerp(LH.C0, kneePose.LH, .2)
    handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
    Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
    Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
end


for i=0,1,0.01 do
    swait()
    local sh = math.random(-6,6)
    local shY = math.random(-20,20)

    RootJoint.C0=clerp(RootJoint.C0, kneePose.Root * CFrame.Angles(math.rad(sh), 0, math.rad(shY)), .2)
    Torso.Neck.C0=clerp(Torso.Neck.C0, kneePose.Neck * CFrame.Angles(math.rad(-90 + sh), 0, math.rad(shY*0.3)), .2)
    RW.C0=clerp(RW.C0, kneePose.RW * CFrame.Angles(math.rad(math.random(-10,10)), math.rad(math.random(-10,10)), math.rad(math.random(-10,10))), .2)
    LW.C0=clerp(LW.C0, kneePose.LW * CFrame.Angles(math.rad(math.random(-10,10)), math.rad(math.random(-10,10)), math.rad(math.random(-10,10))), .2)
    RH.C0=clerp(RH.C0, kneePose.RH, .2)
    LH.C0=clerp(LH.C0, kneePose.LH, .2)
    handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
    Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
    Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
end

so("rbxassetid://847061203", Character, 1, 1)

attack=false
Humanoid.WalkSpeed = 30
if TrailDeb == true then
    TrailDeb = false
end
end



function attackone()
    attack=true
    if TrailDeb == false then
        TrailDeb = true
    end


						

coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end

















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()

    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(-5),math.rad(0),math.rad(-10)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(10)),.3)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(-3,1,2)*angles(math.rad(90),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1,0.5,-0.5)*euler(.5,1.8,1.5),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",Handle,1,.9) 
    for i=0,1,0.1 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(20)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(-4,1,-8)*angles(math.rad(-85),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,-0.5)*euler(80,1.8,1.5),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
    end
    
    attack=false
    
if TrailDeb == true then
						TrailDeb = false
end
end

function attacktwo()
    attack=true
if TrailDeb == false then
							TrailDeb = true
						end
						

coroutine.wrap(function()

while wait()do
if not TrailDeb then break end

















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()

    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,1,-5)*angles(math.rad(0),math.rad(0),math.rad(20)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(-30,0,-20),.3)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-2),math.rad(-25),math.rad(15)),.3)
    end
    so("http://www.roblox.com/asset/?id=159972627",Torso,1,1) 
    for i=0,1,0.1 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(20)),.3)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(10,1,-5)*angles(math.rad(0),math.rad(-80),math.rad(20)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*euler(-30,0,20),.3)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-2),math.rad(-25),math.rad(15)),.3)
    end
    
    attack=false
    
if TrailDeb == true then
						TrailDeb = false
end
end

function attackthree()
    attack=true
    if TrailDeb == false then
							TrailDeb = true
						end

						
coroutine.wrap(function()

while wait()do
if not TrailDeb then break end




 












Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()

    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(3,7,-1)*angles(math.rad(20),math.rad(0),math.rad(-120)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1,0.5,-0.5)*euler(0.5,-1.3,-0.1),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",Handle,1,1) 

    for i=0,1,0.05 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(0)),.3)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(2,4,-3)*angles(math.rad(120),math.rad(0),math.rad(-120)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,-0.5)*euler(2,-1.3,0.1),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
    end
    
    attack=false
    
if TrailDeb == true then
						TrailDeb = false
end
end

function attackfour()
    attack=true
if TrailDeb == false then
							TrailDeb = true
						end
						

coroutine.wrap(function()

while wait()do
if not TrailDeb then break end
 
















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end
 
















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()

    
    
    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1)*angles(math.rad(40),math.rad(0),math.rad(-40)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)  
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-40),math.rad(0),math.rad(40)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(70),math.rad(0),math.rad(-45)),.3)
       	RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		LH.C0=clerp(LH.C0,cf(-1,0.5,0)*euler(0,-1.57,0)*angles(math.rad(-10),math.rad(30),math.rad(-40)),.3)
    end
if anim then
anim.Disabled=true
end
    so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.7) 

    for i=0,1,0.04 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*50
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(-5),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(3,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-3,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.2,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.2,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
        RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(0,-1.57,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
    end
    
    attack=false
    
    
if anim then
anim.Disabled=false
end
if TrailDeb == true then
						TrailDeb = false
end
end

function BlastEffect(brickcolor, cframe, x1, y1, z1, x2, y2, z2)
	
	
	
	coroutine.resume(coroutine.create(function() 
		for i = 0, 1, 0.05 do
			wait()
			prt.Transparency = i
			msh.Scale = msh.Scale + vt(x2, y2, z2)
		end
		prt.Parent = nil
	end))
end

function MagniDamage(Hit, Part, magni, mindam, maxdam, knock, Type)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= magni and c.Name ~= Player.Name then 
					
				end
			end
		end
	end
end

function MagicCircle(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = part(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", vt(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "Sphere", "", vt(0, 0, 0), vt(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 2)
	coroutine.resume(coroutine.create(function(Part, Mesh) 
		for i = 0, 1, delay do
			swait()
			Part.CFrame = Part.CFrame
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + vt(x3, y3, z3)
		end
		Part.Parent = nil
	end), prt, msh)
end

function MagicJump()
	if Anim == "Idle" or Anim == "Walk" or Anim == "Run" then
    attack=true
	mana=mana-25
	Humanoid.WalkSpeed = 0
	    for i=0,1,0.01 do
        swait()
    local speed = 0.25          
    local rad = math.rad
    local clamp = math.clamp

    
    local function ease(t)
        return t * t * (3 - 2 * t)
    end
    so("rbxassetid://847061203", Character, 1, 0.9)
    local rootOffset = cf(0, 0, -1.2)
    local rootRot = angles(rad(45), rad(0), rad(45))

    local neckRot = angles(rad(-15), rad(15), rad(-45))
    local neck2Rot = euler(0, 0, 0)

    local rwPos = cf(1.5, 0.5, 0)
    local rwRot = angles(rad(60), rad(0), rad(45))

    local lwPos = cf(-1.5, 0.5, 0)
    local lwRot = angles(rad(-15), rad(15), rad(-30))

    local rhBase = cf(0.5, -1.25, 0.75)
    local rhRot1 = angles(rad(0), rad(90), rad(0))
    local rhRot2 = angles(rad(15), rad(-60), rad(-15))

    local lhBase = cf(-1, 0.1, -0.8)
    local lhRot1 = angles(rad(0), rad(-90), rad(0))
    local lhRot2 = angles(rad(40), rad(0), rad(-30))

    local hwRot1 = angles(rad(0), rad(0), rad(45))
    local hwPos2 = cf(0, 0, -6)
    local hwRot2 = angles(rad(-15), rad(-60), rad(45))
    local h2wRot = angles(rad(0), rad(60), rad(45))

    
    local t = clamp(speed, 0, 1)
    local easedT = ease(t)

    RootJoint.C0 = clerp(RootJoint.C0, RootCF * rootOffset * rootRot, easedT)
    Neck.C0 = clerp(Neck.C0, necko * neckRot, easedT)
    Neck.C1 = clerp(Neck.C1, necko2 * neck2Rot, easedT)
    RW.C0 = clerp(RW.C0, rwPos * rwRot, easedT)
    LW.C0 = clerp(LW.C0, lwPos * lwRot, easedT)
    RH.C0 = clerp(RH.C0, rhBase * rhRot1 * rhRot2, easedT)
    LH.C0 = clerp(LH.C0, lhBase * lhRot1 * lhRot2, easedT)
    handleweld.C0 = clerp(handleweld.C0, cf(0, 0, 0) * hwRot1, easedT)
    Handleweld.C0 = clerp(Handleweld.C0, hwPos2 * hwRot2, easedT)
    Handle2weld.C0 = clerp(Handle2weld.C0, cf(0, 0, 0) * h2wRot, easedT)

Handle2weld.C0 = clerp(Handle2weld.C0, cf(0, 0, 0) * h2wRot, easedT)
    end
	Humanoid.Jump = true
	Torso.Velocity = vt(1000, 1500, 1000)
	Humanoid.WalkSpeed = 64
	so("http://www.roblox.com/asset/?id=199145497",Torso,1,0.8) 
	so("http://www.roblox.com/asset/?id=199145497",Torso,1,0.8) 
 	for i=0,1,0.05 do
	swait()
	Neck.C0=clerp(Neck.C0,necko*euler(0.5,0,0),.3)
	Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
	RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,5,10)*euler(0+8*i,0,0),.3)
    LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*euler(-30,0,20),.3)
    RW.C0=clerp(RW.C0,cf(1,0.5,-1)*euler(-30,0,-20),.3)
	RH.C0=clerp(RH.C0,cf(1,0,-1)*euler(-0.5,1.57,0)*euler(0,0,0),.2)
	LH.C0=clerp(LH.C0,cf(-1,0,-1)*euler(-0.5,-1.57,0)*euler(0,0,0),.2)
	handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0)),.2)
	Handleweld.C0=clerp(Handleweld.C0,cf(0,-5,0)*angles(math.rad(60),math.rad(60),math.rad(0)),.2)
	Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-5,0)*angles(math.rad(60),math.rad(-60),math.rad(0)),.2)
end
 	for i=0,1,0.02 do
	swait()
	Neck.C0=clerp(Neck.C0,necko*euler(0.3,0,0),.3)
	Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
	RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3.5)*euler(0,0,0),.3)
	RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(0.1,0,1),.3)
	RW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
	LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(0.1,0,-1),.3)
	LW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
	RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0.6,1.57,0)*euler(0,0,0),.2)
	LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(-0.8,-1.57,0)*euler(0,0,0),.2)
	handleweld.C0=clerp(handleweld.C0,cf(0,0,-1)*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
	Handleweld.C0=clerp(Handleweld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(-10),math.rad(0)),.2)
	Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(10),math.rad(0)),.2)
end
	Humanoid.WalkSpeed = 0
	swait(1)
	so("http://www.roblox.com/asset/?id=199145477",Torso,1,1)
	so("http://www.roblox.com/asset/?id=199145477",Torso,1,1)
	local hit,pos=rayCast(Torso.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,100,Character)
	if hit~=nil then
	swait(1)
	local ref=part(3,workspace,"SmoothPlastic",0,1,BrickColor.new("Really black"),"Effect",vt())
	ref.Anchored=true
	ref.CFrame=cf(pos)
	game:GetService("Debris"):AddItem(ref,3)
	for i=1,10 do
	local Col=BrickColor.new("Really black")
	local groundpart=part(3,Character,"SmoothPlastic",0,0,Col,"Ground",vt(math.random(50,200)/100,math.random(50,200)/100,math.random(50,200)/100))
	groundpart.Anchored=true
	groundpart.CanCollide=false
	groundpart.CFrame=cf(pos)*cf(math.random(-500,500)/100,0,math.random(-500,500)/100)*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
	local Col2=TorsoColor
	local groundpart2=part(3,Character,"SmoothPlastic",0,0,Col2,"Ground",vt(math.random(50,200)/100,math.random(50,200)/100,math.random(50,200)/100))
	groundpart2.Anchored=true
	groundpart2.CanCollide=false
	groundpart2.CFrame=cf(pos)*cf(math.random(-500,500)/100,0,math.random(-500,500)/100)*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
	game:GetService("Debris"):AddItem(groundpart,5)
	game:GetService("Debris"):AddItem(groundpart2,5)
	end
	BlastEffect(TorsoColor,cf(pos),1,1,1,1.4,1.4,1.4)
	BlastEffect(BrickColor.new("Really black"),cf(pos),.9,.9,.9,1.2,1.2,1.2)
	MagicCircle(BrickColor.new("Really black"),cf(pos),5,5,5,5,5,5,0.05)
	MagicCircle(TorsoColor,cf(pos),6,6,6,6,6,6,0.05)
 	for i=0,1,0.06 do
	swait()
	Neck.C0=clerp(Neck.C0,necko*angles(math.rad(-20),math.rad(0),math.rad(0)),.3)
	Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
	RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.5)*angles(math.rad(50),math.rad(0),math.rad(0)),.3)
	RW.C0=clerp(RW.C0,cf(1, 0.3, -.7)*angles(math.rad(50),math.rad(0),math.rad(-30)),.3)
	LW.C0=clerp(LW.C0,cf(-1, 0.3, -.7)*angles(math.rad(50),math.rad(0),math.rad(30)),.3)
	RH.C0=clerp(RH.C0,cf(1, -.5, -.5)*angles(math.rad(50),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
	LH.C0=clerp(LH.C0,cf(-1, -1, -.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
	handleweld.C0=clerp(handleweld.C0,cf(0,0,-1)*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
	Handleweld.C0=clerp(Handleweld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(-10),math.rad(0)),.2)
	Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(10),math.rad(0)),.2)
end
end
	swait(20)
	Humanoid.WalkSpeed = 30
    
    attack=false
end
end

function Spin()
    attack=true
mana=mana-40
if TrailDeb == false then
							TrailDeb = true
						end
						
coroutine.wrap(function()
local Old = Handle2.CFrame.p
while wait()do
if not TrailDeb then break end
 
















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()

while wait()do
if not TrailDeb then break end

















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
    so("rbxassetid://847061203", Character, 1, 0.9)
   
    
    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1)*angles(math.rad(40),math.rad(0),math.rad(-40)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)  
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-40),math.rad(0),math.rad(40)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(70),math.rad(0),math.rad(-45)),.3)
       	RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		LH.C0=clerp(LH.C0,cf(-1,0.5,0)*euler(0,-1.57,0)*angles(math.rad(-10),math.rad(30),math.rad(-40)),.3)
    end
if anim then
anim.Disabled=true
end
    so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.7) 
    so("http://www.roblox.com/asset/?id=159882584",Torso,1,1) 
    for i=0,1,0.04 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*50
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(-5),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(3,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-3,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.2,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.2,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
        RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(0,-1.57,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
    end
    
    attack=false
    
    
if anim then
anim.Disabled=false
end
if TrailDeb == true then
						TrailDeb = false
end
end



function Twirl()
mana=mana-50
    attack=true
if TrailDeb == false then
							TrailDeb = true
						end
						

coroutine.wrap(function()

while wait()do
if not TrailDeb then break end







 









Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end
 
















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
	Footsteps:Stop()
	Footsteps2:Stop()
    
    
    so("rbxassetid://847061203", Character, 1, 0.9)
    so("http://www.roblox.com/asset/?id=159882598",Torso,1,1)
    for i=0,1,0.1 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)  
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
if anim then
anim.Disabled=true
end
    so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1) 
    so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8) 
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1) 
    so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8) 
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1) 
    so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8) 
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1) 
    so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8) 
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    
Humanoid.WalkSpeed=30
    attack=false
    
    
if anim then
anim.Disabled=false
end
if TrailDeb == true then
						TrailDeb = false
end
end

function Shred()
    attack=true
    mana=mana-100000
if TrailDeb == false then
							TrailDeb = true
						end
						

coroutine.wrap(function()

while wait()do
if not TrailDeb then break end
 

















coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end
 

















coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
	Footsteps:Stop()
	Footsteps2:Stop()
    
    
    so("http://www.roblox.com/asset/?id=159882578",Torso,1,1) 
    so("rbxassetid://847061203", Character, 1, 0.9)
    for i=0,1,0.1 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)  
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
if anim then
anim.Disabled=true
end
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*20
        so("http://www.roblox.com/asset/?id=231917758",LeftArm,0.2,1.2) 
    	so("http://www.roblox.com/asset/?id=231917758",RightArm,0.2,1) 
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(0+40*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*40
        so("http://www.roblox.com/asset/?id=231917758",LeftArm,0.2,1.2) 
    	so("http://www.roblox.com/asset/?id=231917758",RightArm,0.2,1) 
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(41+80*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*60
        so("http://www.roblox.com/asset/?id=231917758",LeftArm,0.2,1.2) 
    	so("http://www.roblox.com/asset/?id=231917758",RightArm,0.2,1) 
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(82+120*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    so("http://www.roblox.com/asset/?id=159882625",Torso,1,1)
    so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
    so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
    so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
    so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
    for i=0,1,0.05 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(124+160*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    for i=0,1,0.005 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*100
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(168+4200*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2) 
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
    end
    
Humanoid.WalkSpeed=30
    attack=false
    
    
if anim then
anim.Disabled=false
end
if TrailDeb == true then
						TrailDeb = false
end
end

function Push()
    attack=true
    mana=mana-20
if TrailDeb == false then
							TrailDeb = true
						end
						

coroutine.wrap(function()
local Old = Handle2.CFrame.p
while wait()do
if not TrailDeb then break end

















Old = New
coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end


















coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
so("rbxassetid://847061203", Character, 1, 0.9)    
    
    for i=0,1,0.1 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(-5,0,-10)*angles(math.rad(20),math.rad(-20),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(5,0,-10)*angles(math.rad(20),math.rad(20),math.rad(0)),.2)  
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-20)),.3)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(20)),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",Handle2,1,.8) 
    so("http://www.roblox.com/asset/?id=231917758",Handle,1,1) 
    so("http://www.roblox.com/asset/?id=159882481",Torso,1,1) 
    for i=0,1,0.1 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(-4,0,-20)*angles(math.rad(20),math.rad(-20),math.rad(0)),.2)  
        Handle2weld.C0=clerp(Handle2weld.C0,cf(4,0,-20)*angles(math.rad(20),math.rad(20),math.rad(0)),.2)  
        RW.C0=clerp(RW.C0,cf(1,0.5,-1)*angles(math.rad(90),math.rad(0),math.rad(-20)),.3)
        LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*angles(math.rad(90),math.rad(0),math.rad(20)),.3)
    end
    
    attack=false
    
    
if TrailDeb == true then
						
end
end

function Clap()
    attack=true
    mana=mana-20
if TrailDeb == false then
							TrailDeb = true
						end
						

coroutine.wrap(function()
local Old = Handle2.CFrame.p
while wait()do
if not TrailDeb then break end
 

















coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
coroutine.wrap(function()
local Old = Handle.CFrame.p
while wait()do
if not TrailDeb then break end
 

















coroutine.wrap(function()
for i = 1,0,-0.1 do
wait()

end

end)()
coroutine.wrap(function()
for i = 1,10 do
wait()

end end)()end end)()
    
    so("rbxassetid://847061203", Character, 1, 0.6)
    
    so("http://www.roblox.com/asset/?id=159882584",Torso,1,0.9) 
    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,1,-5)*angles(math.rad(0),math.rad(-40),math.rad(20)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(5,1,-5)*angles(math.rad(0),math.rad(40),math.rad(-20)),.2)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(-30,0,-20),.3)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(-30,0,20),.3)
    end
    so("http://www.roblox.com/asset/?id=231917758",Handle2,1,.8) 
    so("http://www.roblox.com/asset/?id=231917758",Handle,1,1) 
    for i=0,1,0.08 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
        handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(4,1,-5)*angles(math.rad(0),math.rad(-43),math.rad(20)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(-4,1,-5)*angles(math.rad(0),math.rad(43),math.rad(-20)),.2)
        LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*euler(-30,0,20),.3)
        RW.C0=clerp(RW.C0,cf(1,0.5,-1)*euler(-30,0,-20),.3)
    end
    
    attack=false
    
    
if TrailDeb == true then
						TrailDeb = false
end
end
function Hai()
    attack = true
    Humanoid.WalkSpeed = 0

    local laughSound = Instance.new("Sound")
    laughSound.SoundId = "rbxassetid://4611186611"
    laughSound.Volume = 1
    laughSound.Parent = Torso
    laughSound:Play()

    local sine = 0
    local phase = "laugh"
    local timer = 0
    local animSpeed = 1.0
    local transitionAlpha = 0.06  -- мягкий lerp для переходов между фазами
    local normalAlpha = 0.1        -- обычный lerp внутри фазы
    local currentAlpha = transitionAlpha

    local laughConn
    laughConn = game:GetService("RunService").RenderStepped:Connect(function(dt)
        timer = timer + dt
        sine = sine + dt

        -- Плавное нарастание lerp после смены фазы
        if currentAlpha < normalAlpha then
            currentAlpha = math.min(currentAlpha + dt * 0.15, normalAlpha)
        end

        local prevPhase = phase

        if phase == "laugh" and timer >= 1 then
            phase = "talk"
            timer = 0
            currentAlpha = transitionAlpha
        elseif phase == "talk" and timer >= 4 then
            phase = "done"
        end

        if phase == "done" then
            laughConn:Disconnect()
            attack = false
            Humanoid.WalkSpeed = 16
            return
        end

        -- Плавный переход внутри talk (на 2 секунде)
        if phase == "talk" and math.abs(timer - 2) < 0.05 then
            currentAlpha = transitionAlpha
        end

        local s12 = sine * 5
        local s24 = sine * 2.5

        local pSwayX  = -0.04 * math.sin(s24)
        local pSwayY  = 0.04 * math.sin(s12)
        local pSwayZ  = 0.05 * math.cos(s12)
        local pRotX   = math.rad(-2.5 * math.sin(s12))
        local pRotY   = math.rad(-2.5 * math.sin(s24))
        local pShake  = 2.5 * math.sin(s12)
        local pShake24 = 2.5 * math.sin(s24)

        local alpha = currentAlpha / animSpeed
        local bodyRot
        local headRot

        if phase == "laugh" then
            local cosVal = math.cos(sine / 2)
            local sinVal = math.sin(sine / 2)
            local lift = (1 - cosVal) / 2
            local torsoLift = lift * 0.5

            bodyRot = angles(math.rad(-10) + pRotX, pRotY, math.rad(0))

            RootJoint.C0 = clerp(
                RootJoint.C0,
                RootCF * cf(pSwayX, pSwayY + torsoLift, -0.05 + 0.05 * cosVal + pSwayZ) * bodyRot,
                alpha
            )

            headRot = angles(math.rad(15 - 1 * math.sin(s12)), math.rad(0), math.rad(0))
            Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * cf(0, 0, 0) * headRot, alpha)

            RW.C0 = clerp(
                RW.C0,
                cf(1.5, 0.5 + 0.05 * sinVal + 0.04 * math.sin(s12), 0)
                    * angles(math.rad(35 + pShake), math.rad(pShake24), math.rad(-5 + pShake)),
                alpha
            )

            LW.C0 = clerp(
                LW.C0,
                cf(-1.5, 0.5 + 0.05 * sinVal - 0.04 * math.sin(s12), 0)
                    * angles(math.rad(-12 - pShake), math.rad(-pShake24), math.rad(5 - pShake)),
                alpha
            )

            RH.C0 = clerp(
                RH.C0,
                cf(1, -1 - 0.05 * cosVal + 0.06 * math.sin(s24) - 0.05 * math.cos(s12), -0.01)
                    * angles(math.rad(-2.5 * math.sin(s12)), math.rad(80), math.rad(0))
                    * angles(math.rad(-5 - 2 - 2.5 * math.sin(s24)), math.rad(0), math.rad(-20)),
                alpha
            )

            LH.C0 = clerp(
                LH.C0,
                cf(-1, -1 - 0.05 * cosVal - 0.05 * math.cos(s12), -0.01)
                    * angles(math.rad(0), math.rad(-80), math.rad(0))
                    * angles(math.rad(-5 - 8), math.rad(0), math.rad(20)),
                alpha
            )

        elseif phase == "talk" then
            if timer < 2 then
                bodyRot = angles(math.rad(-10) + pRotX, pRotY, math.rad(0))

                RootJoint.C0 = clerp(
                    RootJoint.C0,
                    RootCF * cf(pSwayX, pSwayY, -0.05 + pSwayZ) * bodyRot,
                    alpha
                )

                headRot = angles(math.rad(10 - 1 * math.sin(s12)), math.rad(0), math.rad(0))
                Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * cf(0, 0, 0) * headRot, alpha)

                RW.C0 = clerp(
                    RW.C0,
                    cf(1.5, 0.5 + 0.04 * math.sin(s12), 0.5)
                        * angles(math.rad(10), math.rad(0), math.rad(50 + pShake))
                        * angles(math.rad(0), math.rad(-90), math.rad(0)),
                    alpha
                )

                LW.C0 = clerp(
                    LW.C0,
                    cf(-1.5, 0.5 - 0.04 * math.sin(s12), 0.5)
                        * angles(math.rad(10), math.rad(0), math.rad(-50 - pShake))
                        * angles(math.rad(0), math.rad(90), math.rad(0)),
                    alpha
                )

                RH.C0 = clerp(
                    RH.C0,
                    cf(1, -1 + 0.06 * math.sin(s24) - 0.05 * math.cos(s12), -0.01)
                        * angles(math.rad(-2.5 * math.sin(s12)), math.rad(80), math.rad(0))
                        * angles(math.rad(-5 - 2 - 2.5 * math.sin(s24)), math.rad(0), math.rad(-20)),
                    alpha
                )

                LH.C0 = clerp(
                    LH.C0,
                    cf(-1, -1 - 0.05 * math.cos(s12), -0.01)
                        * angles(math.rad(0), math.rad(-80), math.rad(0))
                        * angles(math.rad(-5 - 8), math.rad(0), math.rad(20)),
                    alpha
                )
            else
                bodyRot = angles(math.rad(10) + pRotX, pRotY, math.rad(0))

                RootJoint.C0 = clerp(
                    RootJoint.C0,
                    RootCF * cf(pSwayX, pSwayY, -0.05 + pSwayZ) * bodyRot,
                    alpha
                )

                headRot = angles(math.rad(-10 - 1 * math.sin(s12)), math.rad(0), math.rad(0))
                Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * cf(0, 0, 0) * headRot, alpha)

                RW.C0 = clerp(
                    RW.C0,
                    cf(1.5, 0.5 + 0.04 * math.sin(s12), 0.5)
                        * angles(math.rad(10), math.rad(0), math.rad(50 + pShake))
                        * angles(math.rad(0), math.rad(-90), math.rad(0)),
                    alpha
                )

                LW.C0 = clerp(
                    LW.C0,
                    cf(-1.5, 0.5 - 0.04 * math.sin(s12), 0.5)
                        * angles(math.rad(10), math.rad(0), math.rad(-50 - pShake))
                        * angles(math.rad(0), math.rad(90), math.rad(0)),
                    alpha
                )

                RH.C0 = clerp(
                    RH.C0,
                    cf(1, -1 + 0.06 * math.sin(s24) - 0.05 * math.cos(s12), -0.01)
                        * angles(math.rad(-2.5 * math.sin(s12)), math.rad(80), math.rad(0))
                        * angles(math.rad(-5 - 2 - 2.5 * math.sin(s24)), math.rad(0), math.rad(20)),
                    alpha
                )

                LH.C0 = clerp(
                    LH.C0,
                    cf(-1, -1 - 0.05 * math.cos(s12), -0.01)
                        * angles(math.rad(0), math.rad(-80), math.rad(0))
                        * angles(math.rad(-5 - 8), math.rad(0), math.rad(-20)),
                    alpha
                )
            end
        end

        -- handleweld: lerp вместо жёсткой установки
        if headRot then
            handleweld.C0 = clerp(handleweld.C0, cf(0, 0, 0) * headRot, alpha)
        end

        -- Handleweld и Handle2weld: lerp вместо жёсткой установки
        if bodyRot then
            Handleweld.C0 = clerp(Handleweld.C0, cf(0, 0, 0) * bodyRot, alpha)
            Handle2weld.C0 = clerp(Handle2weld.C0, cf(0, 0, 0) * bodyRot, alpha)
        end
    end)
end




function cabun()
    if attack then return end
    attack = true

    local ran, err = pcall(function()

    Humanoid.WalkSpeed = 5

    -- ========================================
    -- СИСТЕМА МОЛНИЙ (Lightning Cannon)
    -- ========================================
    local lightningSegments = {}
    for i = 1, 200 do
        local seg = Instance.new("Part")
        seg.Size = Vector3.new(1, 1, 1)
        seg.Material = Enum.Material.Neon
        seg.BrickColor = BrickColor.new("White")
        seg.Color = Color3.new(1, 1, 1)
        seg.Transparency = 1
        seg.Anchored = true
        seg.CanCollide = false
        seg.Parent = workspace

        local smesh = Instance.new("SpecialMesh", seg)
        smesh.MeshType = Enum.MeshType.Brick
        smesh.Scale = Vector3.new(0.01, 0.01, 0.01)

        lightningSegments[i] = {part = seg, mesh = smesh, active = false}
    end

    local segIdx = 1
    local function getFreeSeg()
        for i = 1, #lightningSegments do
            segIdx = segIdx % #lightningSegments + 1
            if not lightningSegments[segIdx].active then
                return lightningSegments[segIdx]
            end
        end
        return nil
    end

    -- Создать один рваный разряд молнии
    local function spawnLightning(origin, direction, length, segments, thickness, duration)
        local segLen = length / segments
        local currentPos = origin
        local dir = direction.Unit

        for s = 1, segments do
            local seg = getFreeSeg()
            if not seg then break end

            -- Рандомное отклонение для рваного вида
            local jitter = segLen * 0.5
            local offset = Vector3.new(
                (math.random() - 0.5) * jitter,
                (math.random() - 0.5) * jitter,
                (math.random() - 0.5) * jitter
            )

            local nextPos = currentPos + dir * segLen + offset
            local midPos = (currentPos + nextPos) / 2
            local segVec = nextPos - currentPos
            local segDist = segVec.Magnitude
            if segDist < 0.01 then segDist = 0.01 end

            seg.active = true
            seg.part.Transparency = 0
            seg.part.Color = Color3.new(1, 1, 1)
            seg.mesh.MeshType = Enum.MeshType.Brick

            local w = thickness * (0.5 + math.random() * 0.8)
            seg.mesh.Scale = Vector3.new(w, segDist, w)
            seg.part.CFrame = CFrame.lookAt(midPos, nextPos)

            -- Затухание
            local fadeT = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            game:GetService("TweenService"):Create(seg.part, fadeT, {Transparency = 1}):Play()
            game:GetService("TweenService"):Create(seg.mesh, fadeT, {Scale = Vector3.new(w * 0.2, segDist, w * 0.2)}):Play()

            task.delay(duration + 0.05, function()
                seg.active = false
                seg.part.Transparency = 1
            end)

            -- Ответвление (30% шанс)
            if s > 1 and s < segments - 1 and math.random() < 0.3 then
                local branch = getFreeSeg()
                if branch then
                    local bDir = (dir + Vector3.new(
                        (math.random() - 0.5) * 2,
                        (math.random() - 0.5) * 1.5,
                        (math.random() - 0.5) * 2
                    )).Unit
                    local bLen = segLen * (1 + math.random() * 2)
                    local bEnd = currentPos + bDir * bLen
                    local bMid = (currentPos + bEnd) / 2
                    local bDist = (bEnd - currentPos).Magnitude
                    if bDist < 0.01 then bDist = 0.01 end

                    local bw = thickness * 0.4
                    branch.active = true
                    branch.part.Transparency = 0
                    branch.part.Color = Color3.new(1, 1, 1)
                    branch.mesh.MeshType = Enum.MeshType.Brick
                    branch.mesh.Scale = Vector3.new(bw, bDist, bw)
                    branch.part.CFrame = CFrame.lookAt(bMid, bEnd)

                    local bInfo = TweenInfo.new(duration * 0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    game:GetService("TweenService"):Create(branch.part, bInfo, {Transparency = 1}):Play()
                    game:GetService("TweenService"):Create(branch.mesh, bInfo, {Scale = Vector3.new(bw * 0.1, bDist, bw * 0.1)}):Play()

                    task.delay(duration * 0.7 + 0.05, function()
                        branch.active = false
                        branch.part.Transparency = 1
                    end)
                end
            end

            currentPos = nextPos
        end
    end

    -- Залп молний из сферы во все стороны (Lightning Cannon)
    local function lightningCannonBurst(pos, sphereRadius, boltCount, power)
        for b = 1, boltCount do
            local theta = math.random() * math.pi * 2
            local phi = math.acos(2 * math.random() - 1)
            local dir = Vector3.new(
                math.sin(phi) * math.cos(theta),
                math.cos(phi) * 0.7 + 0.1,
                math.sin(phi) * math.sin(theta)
            ).Unit

            local length = 15 + math.random() * 40 * power
            local segments = 6 + math.floor(math.random() * 10)
            local thickness = 0.08 + math.random() * 0.15
            local duration = 0.15 + math.random() * 0.25

            local startPos = pos + dir * sphereRadius
            spawnLightning(startPos, dir, length, segments, thickness, duration)
        end
    end

    -- Очистка сегментов
    local function cleanupLightning()
        for _, seg in ipairs(lightningSegments) do
            seg.active = false
            seg.part.Transparency = 1
        end
    end

    -- Поза: руки вверх, держат бомбу
    local function animUp()
        RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0) * angles(math.rad(-5), 0, 0), 0.3)
        Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(-25), 0, 0), 0.2)
        RH.C0 = clerp(RH.C0, cf(1, -1, 0) * angles(0, math.rad(70), 0), 0.3)
        LH.C0 = clerp(LH.C0, cf(-1, -1, 0) * angles(0, math.rad(-70), 0), 0.3)
        RW.C0 = clerp(RW.C0, cf(0.5, 0.5, -0.3) * angles(math.rad(-160), 0, math.rad(-30)), 0.3)
        LW.C0 = clerp(LW.C0, cf(-0.5, 0.5, -0.3) * angles(math.rad(-160), 0, math.rad(30)), 0.3)
    end

    -- Фаза 1: переход в позу (10 кадров)
    for i = 1, 10 do
        task.wait()
        animUp()
    end

    -- Фаза 2: создание шара
    local bomb = Instance.new("Part")
    bomb.Shape = Enum.PartType.Ball
    bomb.Size = Vector3.new(0.5, 0.5, 0.5)
    bomb.CFrame = RootPart.CFrame * cf(0, 4, 0)
    bomb.BrickColor = BrickColor.new("White")
    bomb.Material = Enum.Material.Neon
    bomb.Anchored = true
    bomb.CanCollide = false
    bomb.Parent = workspace

    local blight = Instance.new("PointLight", bomb)
    blight.Range = 5
    blight.Brightness = 3
    blight.Color = Color3.new(1, 1, 1)

    -- Внутреннее ядро сферы (ярче, пульсирует)
    local core = Instance.new("Part")
    core.Size = Vector3.new(0.3, 0.3, 0.3)
    core.Material = Enum.Material.Neon
    core.Color = Color3.new(1, 1, 1)
    core.Transparency = 0
    core.Anchored = true
    core.CanCollide = false
    core.Parent = workspace

    local coreMesh = Instance.new("SpecialMesh", core)
    coreMesh.MeshType = Enum.MeshType.Sphere
    coreMesh.Scale = Vector3.new(1, 1, 1)

    local coreLight = Instance.new("PointLight", core)
    coreLight.Range = 8
    coreLight.Brightness = 5
    coreLight.Color = Color3.new(1, 1, 1)

    -- Звук заряда бомбы
    local chargeSnd = Instance.new("Sound", RootPart)
    chargeSnd.SoundId = "rbxassetid://1370232812"
    chargeSnd.Volume = 2
    chargeSnd.Looped = true
    chargeSnd:Play()

    -- Электрический треск (дополнительный звук)
    local crackleSnd = Instance.new("Sound", RootPart)
    crackleSnd.SoundId = "rbxassetid://5142106195"
    crackleSnd.Volume = 1.5
    crackleSnd.Looped = true
    crackleSnd:Play()

    -- Рост ~12 секунд (250 кадров)
    local bscale = 0.5
    local lightningTimer = 0
    for i = 1, 250 do
        task.wait()

        -- Растёт медленно и плавно
        bscale = bscale + (40 - bscale) * 0.008
        bomb.Size = Vector3.new(bscale, bscale, bscale)
        bomb.CFrame = RootPart.CFrame * cf(0, 4 + bscale * 0.2, 0)

        -- Ядро пульсирует
        local corePulse = 0.3 + math.sin(i * 0.3) * 0.1 + bscale * 0.01
        core.Size = Vector3.new(corePulse, corePulse, corePulse)
        core.CFrame = bomb.CFrame
        coreLight.Range = 8 + bscale * 0.5
        coreLight.Brightness = 5 + math.sin(i * 0.5) * 3

        blight.Range = 5 + bscale * 1.5
        blight.Brightness = 3 + bscale * 0.08

        -- ========================================
        -- МОЛНИИ ВОКРУГ ШАРА (нарастают с ростом)
        -- ========================================
        lightningTimer = lightningTimer + 1
        local chargeProgress = bscale / 40
        local lightningInterval = math.max(3, math.floor(20 - chargeProgress * 17))

        if lightningTimer >= lightningInterval then
            lightningTimer = 0

            -- Количество молний растёт вместе со сферой
            local boltCount = 1 + math.floor(chargeProgress * 4)

            for b = 1, boltCount do
                local theta = math.random() * math.pi * 2
                local phi = math.acos(2 * math.random() - 1)
                local dir = Vector3.new(
                    math.sin(phi) * math.cos(theta),
                    math.cos(phi),
                    math.sin(phi) * math.sin(theta)
                ).Unit

                local startPos = bomb.Position + dir * bscale * 0.5
                local length = bscale * (0.3 + math.random() * 0.5)
                local segments = 3 + math.floor(math.random() * 4)
                local thickness = 0.05 + math.random() * 0.08 + chargeProgress * 0.05
                local duration = 0.1 + math.random() * 0.15

                spawnLightning(startPos, dir, length, segments, thickness, duration)
            end

            -- На высоких стадиях заряда — мощные длинные разряды
            if chargeProgress > 0.5 and math.random() < 0.3 then
                local theta = math.random() * math.pi * 2
                local phi = math.acos(2 * math.random() - 1)
                local dir = Vector3.new(
                    math.sin(phi) * math.cos(theta),
                    math.cos(phi) * 0.5 + 0.2,
                    math.sin(phi) * math.sin(theta)
                ).Unit

                local startPos = bomb.Position + dir * bscale * 0.5
                local length = 10 + math.random() * 20
                local segments = 8 + math.floor(math.random() * 6)
                local thickness = 0.1 + math.random() * 0.15
                spawnLightning(startPos, dir, length, segments, thickness, 0.2 + math.random() * 0.2)
            end
        end

        -- Кольца через coroutine (каждые 15 кадров)
        if i % 15 == 0 then
            coroutine.wrap(function()
                local ring = Instance.new("Part")
                ring.Anchored = true
                ring.CanCollide = false
                ring.Material = Enum.Material.Neon
                ring.BrickColor = BrickColor.new("White")
                ring.Transparency = 0
                ring.Size = Vector3.new(0.2, bscale, bscale)
                ring.CFrame = bomb.CFrame * angles(0, 0, math.rad(90))
                ring.Parent = workspace

                local rmsh = Instance.new("SpecialMesh", ring)
                rmsh.MeshType = Enum.MeshType.Sphere
                rmsh.Scale = Vector3.new(0.1, 1, 1)

                for j = 0, 1, 0.05 do
                    task.wait()
                    ring.Transparency = j
                    ring.Size = ring.Size + Vector3.new(0, 2, 2)
                    ring.CFrame = ring.CFrame * angles(0, math.rad(5), 0)
                end
                ring:Destroy()
            end)()
        end

        -- Тряска нарастает медленно
        local shk = (bscale / 40) * 1.5
        RootJoint.C0 = clerp(RootJoint.C0,
            RootCF * cf(math.random(-50, 50) / 100 * shk, 0, 0)
            * angles(math.rad(-5 + math.random(-2, 2) * shk * 0.3), 0, 0), 0.4)

        animUp()
    end

    -- Звук заряда плавно затухает перед криком
    coroutine.wrap(function()
        for i = 0, 1, 0.1 do
            task.wait()
            chargeSnd.Volume = 2 * (1 - i)
            crackleSnd.Volume = 1.5 * (1 - i)
        end
        chargeSnd:Stop()
        chargeSnd:Destroy()
        crackleSnd:Stop()
        crackleSnd:Destroy()
    end)()

    -- ========================================
    -- Фаза 3: крик с чёрно-белым текстом
    -- ========================================
    local txtPart = Instance.new("Part")
    txtPart.Anchored = true
    txtPart.CanCollide = false
    txtPart.Transparency = 1
    txtPart.Size = Vector3.new(0.1, 0.1, 0.1)
    txtPart.CFrame = RootPart.CFrame * cf(0, 2, -8)
    txtPart.Parent = workspace

    local bg = Instance.new("BillboardGui", txtPart)
    bg.Size = UDim2.new(0, 1000, 0, 250)
    bg.AlwaysOnTop = true

    local tl = Instance.new("TextLabel", bg)
    tl.BackgroundTransparency = 1
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.Font = Enum.Font.Fantasy
    tl.TextScaled = true
    tl.TextColor3 = Color3.new(0, 0, 0)
    tl.TextStrokeColor3 = Color3.new(1, 1, 1)
    tl.TextStrokeTransparency = 0
    tl.Text = ""

    local ssnd = Instance.new("Sound", RootPart)
    ssnd.SoundId = "rbxassetid://1404199780"
    ssnd.Volume = 3
    ssnd:Play()
    game:GetService("Debris"):AddItem(ssnd, 15)

    -- Текст появляется по буквам + молнии вокруг шара бушуют
    local full = "IM... THE REAL REVENGE CLAWS"
    for i = 1, #full do
        task.wait()
        tl.Text = string.sub(full, 1, i)
        local pls = math.sin(i * 0.8) * 3
        bomb.Size = Vector3.new(bscale + pls, bscale + pls, bscale + pls)
        RootJoint.C0 = RootJoint.C0 * cf(math.random(-15, 15) / 100, math.random(-15, 15) / 100, 0)
        blight.Brightness = blight.Brightness + 1

        -- Молнии вокруг шара во время крика
        for b = 1, 3 do
            local theta = math.random() * math.pi * 2
            local phi = math.acos(2 * math.random() - 1)
            local dir = Vector3.new(
                math.sin(phi) * math.cos(theta),
                math.cos(phi),
                math.sin(phi) * math.sin(theta)
            ).Unit
            local startPos = bomb.Position + dir * bscale * 0.5
            local length = bscale * (0.4 + math.random() * 0.6)
            spawnLightning(startPos, dir, length, 4 + math.floor(math.random() * 4), 0.1 + math.random() * 0.1, 0.15 + math.random() * 0.15)
        end

        -- Один мощный длинный разряд
        if math.random() < 0.4 then
            local theta = math.random() * math.pi * 2
            local phi = math.acos(2 * math.random() - 1)
            local dir = Vector3.new(
                math.sin(phi) * math.cos(theta),
                math.cos(phi) * 0.5,
                math.sin(phi) * math.sin(theta)
            ).Unit
            local startPos = bomb.Position + dir * bscale * 0.5
            spawnLightning(startPos, dir, 15 + math.random() * 25, 8 + math.floor(math.random() * 6), 0.12 + math.random() * 0.1, 0.25)
        end
    end

    -- Предвзрывный залп молний
    lightningCannonBurst(bomb.Position, bscale * 0.5, 15, 0.5)

    task.wait(0.3)

    -- Текст падает в стиле Star Glitcher
    coroutine.wrap(function()
        local startY = txtPart.Position.Y
        local fallY = startY
        local fallVel = 0
        local txtScale = 1
        local txtRot = 0

        for i = 1, 15 do
            task.wait()
            txtScale = txtScale + 0.03
            bg.Size = UDim2.new(0, 1000 * txtScale, 0, 250 * txtScale)
            txtPart.CFrame = txtPart.CFrame
                * cf(math.random(-30, 30) / 100, math.random(-10, 10) / 100, 0)
                * angles(0, 0, math.rad(math.random(-3, 3)))
        end

        for i = 1, 60 do
            task.wait()
            fallVel = fallVel + 0.15
            fallY = fallY - fallVel
            txtRot = txtRot + 0.5

            txtPart.Position = Vector3.new(txtPart.Position.X, fallY, txtPart.Position.Z)

            tl.TextTransparency = i / 60
            tl.TextStrokeTransparency = i / 60

            txtPart.CFrame = txtPart.CFrame
                * cf(math.random(-10, 10) / 200, 0, 0)
                * angles(0, 0, math.rad(math.random(-1, 1)))

            txtScale = txtScale - 0.003
            if txtScale > 0.1 then
                bg.Size = UDim2.new(0, 1000 * txtScale, 0, 250 * txtScale)
            end
        end

        txtPart:Destroy()
    end)()

    -- ========================================
    -- Фаза 4: бросок вниз
    -- ========================================
    Humanoid.WalkSpeed = 0

    local groundY = RootPart.Position.Y - 3
    local curY = bomb.Position.Y
    local dspd = 0

    -- Молнии летят вместе с шаром вниз
    for i = 1, 5 do
        task.wait()
        dspd = dspd + 15
        curY = curY - dspd
        if curY < groundY then curY = groundY end
        bomb.CFrame = CFrame.new(RootPart.Position.X, curY, RootPart.Position.Z)
        core.CFrame = bomb.CFrame
        bomb.Size = bomb.Size * 0.97

        -- Молнии летят вниз
        for b = 1, 4 do
            local dir = Vector3.new(
                (math.random() - 0.5) * 2,
                -1,
                (math.random() - 0.5) * 2
            ).Unit
            spawnLightning(bomb.Position, dir, 8 + math.random() * 6, 5 + math.floor(math.random() * 4), 0.1, 0.2)
        end

        RootJoint.C0 = clerp(RootJoint.C0, RootCF * angles(math.rad(25), 0, 0), 0.5)
        Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(20), 0, 0), 0.3)
        RW.C0 = clerp(RW.C0, cf(0.5, -1, -0.3) * angles(math.rad(80), 0, math.rad(-25)), 0.6)
        LW.C0 = clerp(LW.C0, cf(-0.5, -1, -0.3) * angles(math.rad(80), 0, math.rad(25)), 0.6)
    end

    -- ========================================
    -- ВЗРЫВ + LIGHTNING CANNON BURST
    -- ========================================
    local hitPos = Vector3.new(RootPart.Position.X, groundY, RootPart.Position.Z)
    bomb:Destroy()
    core:Destroy()

    local bsnd = Instance.new("Sound", workspace)
    bsnd.SoundId = "rbxassetid://12222242"
    bsnd.Volume = 5
    bsnd:Play()
    game:GetService("Debris"):AddItem(bsnd, 15)

    -- Звук электрического разряда
    local zapSnd = Instance.new("Sound", workspace)
    zapSnd.SoundId = "rbxassetid://919941001"
    zapSnd.Volume = 4
    zapSnd:Play()
    game:GetService("Debris"):AddItem(zapSnd, 10)

    -- Главная сфера взрыва
    local blast = Instance.new("Part")
    blast.Anchored = true
    blast.CanCollide = false
    blast.Material = Enum.Material.Neon
    blast.BrickColor = BrickColor.new("White")
    blast.Size = Vector3.new(1, 1, 1)
    blast.CFrame = CFrame.new(hitPos)
    blast.Parent = workspace

    local bmesh = Instance.new("SpecialMesh", blast)
    bmesh.MeshType = Enum.MeshType.Sphere
    bmesh.Scale = Vector3.new(1, 1, 1)

    local blite = Instance.new("PointLight", blast)
    blite.Range = 200
    blite.Brightness = 15
    blite.Color = Color3.new(1, 1, 1)

    -- ========================================
    -- LIGHTNING CANNON: МАССИВНЫЙ ЗАЛП МОЛНИЙ
    -- ========================================
    -- Волна 1: мгновенный залп 40 молний
    lightningCannonBurst(hitPos, 2, 40, 1.0)

    -- Волна 2: через 0.1 сек ещё 30 молний
    task.delay(0.1, function()
        lightningCannonBurst(hitPos, 5, 30, 0.8)
    end)

    -- Волна 3: через 0.2 сек ещё 20 молний
    task.delay(0.2, function()
        lightningCannonBurst(hitPos, 8, 20, 0.6)
    end)

    -- Кольца
    for r = 1, 5 do
        coroutine.wrap(function()
            local ring = Instance.new("Part")
            ring.Anchored = true
            ring.CanCollide = false
            ring.Material = Enum.Material.Neon
            ring.BrickColor = BrickColor.new("White")
            ring.Transparency = 0.1
            ring.Size = Vector3.new(0.3, 1, 1)
            ring.CFrame = CFrame.new(hitPos) * angles(0, 0, math.rad(90))
            ring.Parent = workspace

            for j = 0, 1, 0.03 do
                task.wait()
                local sz = j * 100 * (0.6 + r * 0.08)
                ring.Size = Vector3.new(0.3, sz, sz)
                ring.Transparency = j
                ring.CFrame = CFrame.new(hitPos) * angles(0, 0, math.rad(90))
                    * angles(math.rad(j * 20 * r), 0, 0)
            end
            ring:Destroy()
        end)()
    end

    -- Частицы
    local prt = Instance.new("ParticleEmitter", blast)
    prt.Texture = "rbxassetid://243660364"
    prt.Color = ColorSequence.new(Color3.new(1, 1, 1))
    prt.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 8),
        NumberSequenceKeypoint.new(0.5, 4),
        NumberSequenceKeypoint.new(1, 0)
    })
    prt.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    prt.Lifetime = NumberRange.new(1, 2.5)
    prt.Rate = 400
    prt.Speed = NumberRange.new(40, 100)
    prt.SpreadAngle = Vector2.new(360, 360)

    -- Взрыв: рост → затухание + продолжающиеся молнии (40 кадров)
    local bsize = 1
    for i = 1, 40 do
        task.wait()
        local prog = i / 40

        if prog < 0.1 then
            bsize = bsize + (100 - bsize) * 0.5
        else
            bsize = bsize + (20 - bsize) * 0.02
        end

        blast.Size = Vector3.new(bsize, bsize, bsize)
        blite.Range = 200 + bsize
        blite.Brightness = 15 * (1 - prog)
        blast.Transparency = prog * 0.8
        prt.Rate = 400 * (1 - prog)

        -- Молнии продолжают бить во время взрыва
        if i < 25 and i % 3 == 0 then
            local burstCount = 5 + math.floor((1 - prog) * 10)
            for b = 1, burstCount do
                local theta = math.random() * math.pi * 2
                local phi = math.acos(2 * math.random() - 1)
                local dir = Vector3.new(
                    math.sin(phi) * math.cos(theta),
                    math.cos(phi) * 0.6 + 0.1,
                    math.sin(phi) * math.sin(theta)
                ).Unit
                local startPos = hitPos + dir * bsize * 0.3
                local length = 10 + math.random() * 30 * (1 - prog)
                local segs = 6 + math.floor(math.random() * 8)
                local thick = 0.08 + math.random() * 0.12 * (1 - prog)
                spawnLightning(startPos, dir, length, segs, thick, 0.15 + math.random() * 0.2)
            end
        end

        local shk = (1 - prog) * 2.5
        RootJoint.C0 = clerp(RootJoint.C0,
            RootCF * cf(math.random(-100, 100) / 100 * shk, 0, 0)
            * angles(math.rad(math.random(-2, 2) * shk * 0.3), 0, 0), 0.3)

        Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(-15), 0, 0), 0.2)
        RW.C0 = clerp(RW.C0, cf(0.6, 0.2, 0) * angles(math.rad(-120), 0, math.rad(-20)), 0.2)
        LW.C0 = clerp(LW.C0, cf(-0.6, 0.2, 0) * angles(math.rad(-120), 0, math.rad(20)), 0.2)
    end

    -- Очистка
    prt.Enabled = false
    task.wait(0.5)
    blast:Destroy()
    cleanupLightning()

    -- Возврат
    for i = 1, 10 do
        task.wait()
        RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0) * angles(0, 0, 0), 0.3)
        Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(0, 0, 0), 0.2)
        RH.C0 = clerp(RH.C0, cf(1, -1, 0) * angles(0, math.rad(90), 0), 0.3)
        LH.C0 = clerp(LH.C0, cf(-1, -1, 0) * angles(0, math.rad(-90), 0), 0.3)
        RW.C0 = clerp(RW.C0, cf(0, 0, 0) * angles(0, 0, 0), 0.3)
        LW.C0 = clerp(LW.C0, cf(0, 0, 0) * angles(0, 0, 0), 0.3)
    end

    -- Финальная очистка сегментов
    for _, seg in ipairs(lightningSegments) do
        seg.part:Destroy()
    end

    end) -- конец pcall

    if not ran then
        warn("CABUN ERROR: " .. tostring(err))
    end

    Humanoid.WalkSpeed = 30
    attack = false
end





function Die()
    attack=true
Footsteps:Stop()
Footsteps2:Stop()
local Fire = it("Sound",Character.Torso)
Fire.SoundId = "rbxassetid://192104941"
Fire.Looped = true
Fire.Pitch = 1
Fire.Volume = 1
local Fire2 = it("Sound",Handle2)
Fire2.SoundId = "rbxassetid://192104941"
Fire2.Looped = true
Fire2.Pitch = 1
Fire2.Volume = 1
local Fire3 = it("Sound",Handle)
Fire3.SoundId = "rbxassetid://192104941"
Fire3.Looped = true
Fire3.Pitch = 1
Fire3.Volume = 1
local Fire4 = it("Sound",handle)
Fire4.SoundId = "rbxassetid://192104941"
Fire4.Looped = true
Fire4.Pitch = 1
Fire4.Volume = 1
local fire = Instance.new("ParticleEmitter", Character.Torso)
fire.Lifetime = NumberRange.new(0.5)
fire.Speed = NumberRange.new(1, 3)
fire.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.564, 2.521), NumberSequenceKeypoint.new(1, 3.534, 2.521)})
fire.Rate = 0
fire.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.627, 0.587), NumberSequenceKeypoint.new(1, 1)})
fire.LightEmission = 0.6
fire.Texture = "http://www.roblox.com/asset/?id=242911609"
fire.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0.666667, 0))
local fire2 = Instance.new("ParticleEmitter", Handle)
fire2.Lifetime = NumberRange.new(0.5)
fire2.Speed = NumberRange.new(1, 3)
fire2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 6.564, 5.521), NumberSequenceKeypoint.new(1, 6.534, 5.521)})
fire2.Rate = 0
fire2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.627, 0.587), NumberSequenceKeypoint.new(1, 1)})
fire2.LightEmission = 0.6
fire2.Texture = "http://www.roblox.com/asset/?id=242911609"
fire2.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0.666667, 0))
local fire3 = Instance.new("ParticleEmitter", Handle2)
fire3.Lifetime = NumberRange.new(0.5)
fire3.Speed = NumberRange.new(1, 3)
fire3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 6.564, 5.521), NumberSequenceKeypoint.new(1, 6.534, 5.521)})
fire3.Rate = 0
fire3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.627, 0.587), NumberSequenceKeypoint.new(1, 1)})
fire3.LightEmission = 0.6
fire3.Texture = "http://www.roblox.com/asset/?id=242911609"
fire3.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0.666667, 0))
local fire4 = Instance.new("ParticleEmitter", handle)
fire4.Lifetime = NumberRange.new(0.5)
fire4.Speed = NumberRange.new(1, 3)
fire4.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.564, 2.521), NumberSequenceKeypoint.new(1, 3.534, 2.521)})
fire4.Rate = 0
fire4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.627, 0.587), NumberSequenceKeypoint.new(1, 1)})
fire4.LightEmission = 0.6
fire4.Texture = "http://www.roblox.com/asset/?id=242911609"
fire4.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0.666667, 0))
    Humanoid.WalkSpeed = 0
    so("http://www.roblox.com/asset/?id=199149297",Head,1,1)
    so("http://www.roblox.com/asset/?id=209527203",Head,1,1)
    for i=0,1,0.08 do
        swait()
        Torso.Velocity=RootPart.CFrame.lookVector*-30
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,1,0)*angles(math.rad(-45),math.rad(0),math.rad(90)),.2)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(45)),.2)
        handleweld.C0=clerp(handleweld.C0,cf(0,5,0)*angles(math.rad(45),math.rad(0),math.rad(0)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(0,5,0)*angles(math.rad(45),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,5,0)*angles(math.rad(45),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(45)),.2)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-45)),.2)
        RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-10),math.rad(0),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-10),math.rad(0),math.rad(0)),.2)
    end
    for i=0,1,0.005 do
        swait()
        if moosick then moosick.Volume=1-2*i end
        if light then light.Range=15-10*i end
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,1,-2.5)*angles(math.rad(-90),math.rad(0),math.rad(180)),.2)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(90)),.4)
        handleweld.C0=clerp(handleweld.C0,cf(0,10,-5)*angles(math.rad(60),math.rad(30),math.rad(30)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(0,20,-5)*angles(math.rad(150),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,20,-5)*angles(math.rad(90),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(180),math.rad(0),math.rad(90)),.2)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.2)
       	RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
    end
if light then light.Range=0 end
    for i=0,1,0.01 do
        swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,1,-2.5)*angles(math.rad(-90),math.rad(0),math.rad(180)),.2)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(90)),.4)
        handleweld.C0=clerp(handleweld.C0,cf(0,10,-5)*angles(math.rad(60),math.rad(30),math.rad(30)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(0,20,-5)*angles(math.rad(150),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,20,-5)*angles(math.rad(90),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(180),math.rad(0),math.rad(90)),.2)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.2)
       	RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
    end
    so("http://www.roblox.com/asset/?id=209527175",Head,1,0.9)
    fire.Rate = 1000
    fire2.Rate = 1000
    fire3.Rate = 1000
    fire4.Rate = 1000
	Fire:Play()
	Fire2:Play()
	Fire3:Play()
	Fire4:Play()
    for i=0,1,0.005 do
        swait()
Character.Head.face.Transparency = 0+1*i
LeftArm.Transparency=0+1*i
RightArm.Transparency=0+1*i
LeftLeg.Transparency=0+1*i
RightLeg.Transparency=0+1*i
Head.Transparency=0+1*i
Torso.Transparency=0+1*i
for _,v in pairs(Character:children()) do
                if v:IsA("Hat") then
                        v.Handle.Transparency = 0+1*i
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,1,-2.5)*angles(math.rad(-90),math.rad(0),math.rad(180)),.2)
        Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(90)),.4)
        handleweld.C0=clerp(handleweld.C0,cf(0,10,-5)*angles(math.rad(60),math.rad(30),math.rad(30)),.2)
        Handleweld.C0=clerp(Handleweld.C0,cf(0,20,-5)*angles(math.rad(150),math.rad(0),math.rad(0)),.2)
        Handle2weld.C0=clerp(Handle2weld.C0,cf(0,20,-5)*angles(math.rad(90),math.rad(0),math.rad(0)),.2)
        RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(180),math.rad(0),math.rad(90)),.2)
        LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.2)
       	RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
    end
    end
    
end
Humanoid.Health = 0
end

equipanim()

local sine = 0
local change = 1
local val = 0

local mananum=0
while true do
swait()
sine = sine + change
local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude 
local velderp=RootPart.Velocity.y
hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
if equipped==true or equipped==false then
if Anim=="Idle" and attack==false then
idle=idle+1
else
idle=0
end
if Humanoid.Health <=20 then
if attack == false then
Humanoid.Health = math.huge
Die()
end
end
if idle>=1000 then
if attack==false then

end
end
if RootPart.Velocity.y > 1 and hitfloor==nil then 
Anim="Jump"
if attack==false then
Footsteps:Stop()
Footsteps2:Stop()
Neck.C0=clerp(Neck.C0,necko*euler(-0.2,0,0),.3)
Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(-.25,0,0.5),.3)
RW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(-.25,0,-0.5),.3)
LW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
RH.C0=clerp(RH.C0,cf(1,0,-.75)*euler(-0.5,1.57,0)*euler(0,0,0),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,-.3)*euler(-0.5,-1.57,0)*euler(0,0,0),.2)
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0)),.2)
Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(20),math.rad(0)),.2)
Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(-20),math.rad(0)),.2)
end
elseif RootPart.Velocity.y < -1 and hitfloor==nil then 
Anim="Fall"
if attack==false then
Footsteps:Stop()
Footsteps2:Stop()
Neck.C0=clerp(Neck.C0,necko*euler(0.3,0,0),.3)
Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*euler(0,0,0),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(0.1,0,1),.3)
RW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(0.1,0,-1),.3)
LW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0.6,1.57,0)*euler(0,0,0),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(-0.8,-1.57,0)*euler(0,0,0),.2)
handleweld.C0=clerp(handleweld.C0,cf(0,0,-1)*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
Handleweld.C0=clerp(Handleweld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(-10),math.rad(0)),.2)
Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(10),math.rad(0)),.2)
end
elseif torvel<1 and hitfloor~=nil then
Anim="Idle"
change=0.5
if idle>=1000 then
if attack==false then
Footsteps:Stop()
Footsteps2:Stop()
Humanoid.WalkSpeed=30
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,6-0.25*math.cos(sine/5))*angles(math.rad(0),math.rad(0),math.rad(10)),.1)
Neck.C0=clerp(Neck.C0,necko*angles(math.rad(5+2*math.cos(sine/5.5)),math.rad(-20-2*math.cos(sine/5.5)),math.rad(-9)),.1)
Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.1)
RW.C0=clerp(RW.C0,cf(1.2, 0.5, 0.1)*angles(math.rad(205),math.rad(0),math.rad(-25)),.5)
LW.C0=clerp(LW.C0,cf(-1.2, 0.5, 0.1)*angles(math.rad(205),math.rad(0),math.rad(25)),.5)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.225)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(10),math.rad(0),math.rad(0)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1.1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(15),math.rad(0),math.rad(24)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0,1.5+2.5*math.cos(sine/62*2),0)*angles(math.rad(90),math.rad(0),math.rad(60-180*math.cos(sine/50))),.3)
Handleweld.C0=clerp(Handleweld.C0,cf(0,-0.5-0.85*math.cos(sine/62*2),0)*angles(math.rad(0),math.rad(-0-180*2.5*math.cos(sine/62*2)),math.rad(0)),.4)
Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-0.5+0.85*math.cos(sine/48),0)*angles(math.rad(0),math.rad(-180-180*2.5*math.cos(sine/62*2)),math.rad(180)),.3)
end
else
if attack==false then
Footsteps:Stop()
Footsteps2:Stop()
Humanoid.WalkSpeed=30
local sine = tick() * 50

local sway = math.cos(sine / 18)
local handleSway1 = math.cos(sine / 20)
local handleSway2 = math.cos(sine / 16)
local handleSway3 = math.cos(sine / 18)


local armBob = 0.2 * math.cos(sine / 18)


RootJoint.C0 = clerp(RootJoint.C0, CFrame.new(0, 0, 0) * CFrame.fromEulerAnglesXYZ(-1.7453 + 0.06 * sway, 0.02 * sway, -3.1416), 0.28)


-- ===== Krystal Dance V2 Mouse Head Lock =====
local mouse = game.Players.LocalPlayer:GetMouse()
local Point = mouse.Hit.p
local Dist = (Head.CFrame.p - Point).Magnitude
local Diff = Head.CFrame.Y - Point.Y

if Dist < 0.1 then Dist = 0.1 end

local kPitch = math.tan(Diff / Dist) * 1
local kYaw = ((Head.CFrame.p - Point).Unit):Cross(Torso.CFrame.lookVector).Y * 1

local OrgnC0 = CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(-1.3963, 0.03, -3.1416)


Neck.C0 = clerp(Neck.C0, OrgnC0 * CFrame.Angles(kPitch, 0, kYaw), 0.1)
Neck.C1 = clerp(Neck.C1, necko2 * CFrame.fromEulerAnglesXYZ(0, 0, 0), 0.1)



RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.35 + armBob, 0) * CFrame.Angles(math.rad(-35), 0, math.rad(20)), 0.2)


LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.35 + armBob, 0) * CFrame.Angles(math.rad(-35), 0, math.rad(-20)), 0.2)


RH.C0 = clerp(RH.C0, CFrame.new(1, -1, -0.3) * CFrame.fromEulerAnglesXYZ(0, 1.2217, 0.3491), 0.26)


LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0.5) * CFrame.fromEulerAnglesXYZ(-0.3883, -1.1350, -0.0225), 0.26)

handleweld.C0 = clerp(handleweld.C0, CFrame.Angles(-kPitch, kYaw, 0), 0.24)


Handleweld.C0 = clerp(Handleweld.C0, CFrame.new(-1 * handleSway2, 0, -1 * handleSway2) * CFrame.Angles(math.rad(8 * handleSway2), 0, math.rad(-8 * handleSway2)), 0.24)


Handle2weld.C0 = clerp(Handle2weld.C0, CFrame.new(1 * handleSway3, 0, 1 * handleSway3) * CFrame.Angles(math.rad(-12 * handleSway3), 0, math.rad(-12 * handleSway3)), 0.24)


end
end
elseif torvel>2 and torvel<22 and hitfloor~=nil then
Anim="Walk"
if attack==false then
change=0.8




















RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+0.1*math.cos(sine/2.5))*angles(math.rad(10+1*math.cos(sine/2.5)),math.rad(0),math.rad(1-5*math.cos(sine/5))),.3)
Neck.C0=clerp(Neck.C0,necko*euler(0+0.075*math.cos(sine/2.5),0,0)*angles(math.rad(0),math.rad(0),math.rad(1+5*math.cos(sine/5))),.3)
Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
RW.C0=clerp(RW.C0,cf(1.4+0.25*math.cos(sine/5),0.5+0.25*math.cos(sine/5),-0.2+0.5*math.cos(sine/5))*angles(math.rad(20-60*math.cos(sine/5)),math.rad(0),math.rad(-4+30*math.cos(sine/5))),.3)
LW.C0=clerp(LW.C0,cf(-1.4+0.25*math.cos(sine/5),0.5-0.25*math.cos(sine/5),-0.2-0.5*math.cos(sine/5))*angles(math.rad(20+60*math.cos(sine/5)),math.rad(0),math.rad(4+30*math.cos(sine/5))),.3)
RH.C0=clerp(RH.C0,cf(1,-1-0.1*math.cos(sine/5),0-0.25*math.cos(sine/5))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0+50*math.cos(sine/5))),.3)
LH.C0=clerp(LH.C0,cf(-1,-1+0.1*math.cos(sine/5),0+0.25*math.cos(sine/5))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0+50*math.cos(sine/5))),.3)
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
Handleweld.C0=clerp(Handleweld.C0,cf(0-.5*math.cos(sine/30),0,0-.5*math.cos(sine/30))*angles(math.rad(0+1*math.cos(sine/30)),math.rad(-30),math.rad(0-1*math.cos(sine/30))),.2)
Handle2weld.C0=clerp(Handle2weld.C0,cf(0+.5*math.cos(sine/36),0,0+.5*math.cos(sine/36))*angles(math.rad(0-3*math.cos(sine/36)),math.rad(30),math.rad(0-3*math.cos(sine/36))),.2)
end
elseif torvel>=22 and hitfloor~=nil then
Anim="Run"
change=1
if attack==false then

local wsv = 5.5


local rootBob = -0.015 * math.cos(sine / (wsv / 2))
local rootTilt = 15 + 2 * math.cos(sine / 3)
RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, rootBob) * angles(math.rad(rootTilt), 0, 0), 0.25)

local neckOffset = -0.15 + 0.1 * math.cos(sine / 2.8)
Neck.C0 = clerp(Neck.C0, necko * euler(neckOffset, 0, 0), 0.25)
Neck.C1 = clerp(Neck.C1, necko2 * euler(0, 0, 0), 0.25)


RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.3) * angles(math.rad(-72 - 8 * math.sin(sine / 1.5)) + RootPart.RotVelocity.Y / -34, math.rad(0), math.rad(1 + 0 * math.cos(sine / 3)) - RootPart.RotVelocity.Y / 34), 0.25)

LW.C0 = clerp(LW.C0, cf(-1.5, 0.5, 0.3) * angles(math.rad(-72 - 8 * math.sin(sine / 1.5)) + RootPart.RotVelocity.Y / 34, math.rad(0), math.rad(-1 + 0 * math.cos(sine / 3)) + RootPart.RotVelocity.Y / -34), 0.25)


local rhY = -1 - 0.3 * math.sin(sine / wsv)
local rhZ = 0.2 - 0.3 * math.cos(sine / wsv)
local rhRot = -15 + 35 * math.cos(sine / wsv)
RH.C0 = clerp(RH.C0, cf(1, rhY, rhZ) * angles(0, math.rad(80), 0) * angles(math.rad(-2), 0, math.rad(rhRot)), 0.6)

local lhY = -1 + 0.3 * math.sin(sine / wsv)
local lhZ = 0.2 + 0.3 * math.cos(sine / wsv)
local lhRot = 15 + 35 * math.cos(sine / wsv)
LH.C0 = clerp(LH.C0, cf(-1, lhY, lhZ) * angles(0, math.rad(-80), 0) * angles(math.rad(-2), 0, math.rad(lhRot)), 0.6)


handleweld.C0 = clerp(handleweld.C0, cf(0, 0, 0), 0.18)

local h1X = -0.45 * math.cos(sine / 32)
local h1Z = -0.45 * math.cos(sine / 32)
local h1Rot = 0.8 * math.cos(sine / 32)
Handleweld.C0 = clerp(Handleweld.C0, cf(h1X, 0, h1Z) * angles(math.rad(h1Rot), math.rad(-60), math.rad(-h1Rot)), 0.18)

local h2X = 0.45 * math.cos(sine / 38)
local h2Z = 0.45 * math.cos(sine / 38)
local h2Rot = -2.5 * math.cos(sine / 38)
Handle2weld.C0 = clerp(Handle2weld.C0, cf(h2X, 0, h2Z) * angles(math.rad(h2Rot), math.rad(60), math.rad(-h2Rot)), 0.18)


end
end
end
fenbarmana2:TweenSize(UDim2.new(4*mana/10000000,0,0.2,0),nil,1,0.4,true)
fenbarmana4.Text="[Energy]                    <{[  "..mana.."  ]}>                    [Energy]"
if mana>=1000000 then
mana=1000000
else
if mananum<=8 then
mananum=mananum+10000000000
else
mananum=0
mana=mana+1000000
end
end
end


