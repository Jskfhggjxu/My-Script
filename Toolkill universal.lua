local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local lp = Players.LocalPlayer
local isProcessing = false
local spamming = false          
local spamModeEnabled = false   
local originalPos = nil         
local spamStartPos = nil        






local function GetPlr(name)
    if not name or name == "" then return end
    
    name = name:lower():gsub("([%.%+%-%*%?%[%]%^%$%(%)%%])", "%%%1")
    for _, a in Players:GetPlayers() do
        if a ~= lp then
            local char = a.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                
                if hrp and hum and hum.Health > 1 then
                    local n = a.Name:lower()
                    local d = a.DisplayName:lower()
                    
                    if n:find("^"..name) or d:find("^"..name) then
                        return a
                    end
                end
            end
        end
    end
end


local function swait(num)
    if num == 0 or num == nil then
        RunService.Stepped:Wait()
    else
        for i = 0, num do
            RunService.Stepped:Wait()
        end
    end
end


local function oswait(seconds)
    if seconds == nil then seconds = 0 end
    local start = os.clock()
    repeat
        swait()
    until os.clock() >= start + seconds
end




local function FlingUser(targetName)
    local target = GetPlr(targetName) 
    if not target then return false end
    
    local targetchar = target.Character
    local targethead = targetchar and targetchar:WaitForChild("HumanoidRootPart", 5)
    if not targethead then return false end

    local char = lp.Character 
    if not char then return false end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local backpack = lp.Backpack
    local cf = CFrame.new
    local v3 = Vector3.new

    
    char.Archivable = true
    local Clone = char:Clone()
    oswait(.1)
    lp.Character = Clone
    lp.Character = char
    
    
    if hrp then hrp.AssemblyLinearVelocity = v3(0,0,0) end
    local oldHum = char:FindFirstChildOfClass("Humanoid")
    if oldHum then oldHum:Destroy() end
    oswait(.1)
    
    
    local Humanoid = Instance.new("Humanoid")
    Humanoid.Parent = char
    oswait(.2)
    
    
    local Tool = char:FindFirstChildOfClass("Tool") or (backpack and backpack:FindFirstChildOfClass("Tool"))
    if not Tool then return false end

    
    local Arm 
    if char:FindFirstChild("Right Arm") then 
        Arm = char['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
    else 
        Arm = char['RightHand'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
    end
    
    
    Tool.Grip = Arm:ToObjectSpace(targethead.CFrame):Inverse() 
    Tool.Parent = char 
    
    local lastPos = targethead.Position

    
    local noclipConn = RunService.Stepped:Connect(function()
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
            end
        end
    end)

    
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(0, 100000, 0)
    bv.Velocity = Vector3.new(0, 0, 0)
    if hrp then bv.Parent = hrp end

    
    repeat 
        oswait()
       if targetchar and targetchar:FindFirstChild("HumanoidRootPart") then
           local currentPos = targethead.Position
          local delta = currentPos - lastPos
          if hrp then
               
               hrp.CFrame = hrp.CFrame + Vector3.new(delta.X, delta.Y, delta.Z)
           end
            lastPos = currentPos
        end
    until not Tool or (Tool.Parent == workspace or Tool.Parent == targetchar)


    
    if noclipConn then noclipConn:Disconnect() end
    if bv then bv:Destroy() end
    
    
    if hrp then
        pcall(function()
            Tool.Grip = Arm:ToObjectSpace(targethead.CFrame * cf(0/0, 100000000, 0/0)):Inverse()  
        end)
    end
    
    
    oswait(.01)
    lp.Character = nil
    if Humanoid then Humanoid.Health = 0 end 
    return true
end 




local KillBtn

local function ExecuteSequence(targetName)
    if isProcessing then return end
    local char = lp.Character
    if not char or not char:FindFirstChildOfClass("Humanoid") then return end

    
    if char.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then return "NOT R6" end
    
    local hasTool = char:FindFirstChildOfClass("Tool") or (lp.Backpack and lp.Backpack:FindFirstChildOfClass("Tool"))
    if not hasTool then return "NO TOOL" end 

    isProcessing = true
    local hrp = char:FindFirstChild("HumanoidRootPart")
    
    originalPos = hrp and hrp.CFrame or originalPos

    
    local watchdogActive = true
    task.delay(8, function() 
        if watchdogActive and isProcessing then 
            
            if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
                lp.Character.Humanoid.Health = 0
            end
            isProcessing = false
            
            if KillBtn and not spamming then
                KillBtn.Text = "EXECUTE KILL"
                KillBtn.BackgroundColor3 = Color3.fromRGB(80, 20, 20)
            end
        end 
    end)

    
    FlingUser(targetName)
    
    
    lp.CharacterAdded:Wait()
    task.wait(0.1) 
    
    
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and originalPos then
        lp.Character.HumanoidRootPart.CFrame = originalPos
    end

    watchdogActive = false
    isProcessing = false
    return "SUCCESS"
end




local uiName = "VoidGuiUniversal"
if CoreGui:FindFirstChild(uiName) then CoreGui[uiName]:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = uiName
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 165)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -82)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 25)
TopBar.BackgroundColor3 = Color3.fromRGB(10, 14, 25)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Toolkill Gui Universal by Tory"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 25, 1, 0)
CloseBtn.Position = UDim2.new(1, -25, 0, 0)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Size = UDim2.new(0, 25, 1, 0)
MinBtn.Position = UDim2.new(1, -50, 0, 0)
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, 0, 1, -25)
ContentFrame.Position = UDim2.new(0, 0, 0, 25)
ContentFrame.BackgroundTransparency = 1

local TargetInput = Instance.new("TextBox", ContentFrame)
TargetInput.Size = UDim2.new(0.8, 0, 0, 30)
TargetInput.Position = UDim2.new(0.1, 0, 0, 10)
TargetInput.PlaceholderText = "Target Name"
TargetInput.BackgroundColor3 = Color3.fromRGB(25, 30, 50)
TargetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetInput.Text = ""

local SpamToggleBtn = Instance.new("TextButton", ContentFrame)
SpamToggleBtn.Size = UDim2.new(0.8, 0, 0, 30)
SpamToggleBtn.Position = UDim2.new(0.1, 0, 0, 50)
SpamToggleBtn.Text = "SPAM MODE: OFF"

KillBtn = Instance.new("TextButton", ContentFrame)
KillBtn.Size = UDim2.new(0.8, 0, 0, 30)
KillBtn.Position = UDim2.new(0.1, 0, 0, 90)
KillBtn.BackgroundColor3 = Color3.fromRGB(80, 20, 20)
KillBtn.Text = "EXECUTE KILL"
KillBtn.TextColor3 = Color3.fromRGB(255, 255, 255)


local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    ContentFrame.Visible = not minimized
    if minimized then
        
        MainFrame:TweenSize(UDim2.new(0, 250, 0, 25), "Out", "Sine", 0.2, true)
    else
        
        MainFrame:TweenSize(UDim2.new(0, 250, 0, 165), "Out", "Sine", 0.2, true)
    end
end)




local function HandleKillRequest(targetName)
    if targetName == "" then return end
    
    
    if spamming then
        spamming = false
        KillBtn.Text = "STOPPING..."
        
        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
            lp.Character.Humanoid.Health = 0
        end
        task.spawn(function()
            lp.CharacterAdded:Wait()
            task.wait(0.1)
            
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and spamStartPos then
                lp.Character.HumanoidRootPart.CFrame = spamStartPos
            end
            KillBtn.Text = "EXECUTE KILL"
        end)
        return
    end

    if isProcessing then return end

    
    if spamModeEnabled then
        spamming = true
        KillBtn.Text = "STOP SPAMMING"
        local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        spamStartPos = root and root.CFrame or nil
        
        task.spawn(function()
            while spamming do
                local res = ExecuteSequence(targetName)
                
                if res == "NOT R6" or res == "NO TOOL" then
                    KillBtn.Text = res.."!"
                    task.wait(1.5)
                    break
                end
                task.wait(4) 
            end
            spamming = false
            KillBtn.Text = "EXECUTE KILL"
        end)
    else
        
        KillBtn.Text = "PROCESSING..."
        local res = ExecuteSequence(targetName)
        if res == "NOT R6" or res == "NO TOOL" then
            KillBtn.Text = res.."!"
            task.wait(1.5)
        end
        KillBtn.Text = "EXECUTE KILL"
    end
end






lp.Chatted:Connect(function(msg)
    local cmd = msg:lower()
    if cmd:sub(1, 6) == "-kill " then
        local t = msg:sub(7)
        TargetInput.Text = t
        task.spawn(HandleKillRequest, t)
    end
end)


KillBtn.MouseButton1Click:Connect(function() HandleKillRequest(TargetInput.Text) end)


SpamToggleBtn.MouseButton1Click:Connect(function()
    spamModeEnabled = not spamModeEnabled
    SpamToggleBtn.Text = spamModeEnabled and "SPAM MODE: ON" or "SPAM MODE: OFF"
    
    SpamToggleBtn.BackgroundColor3 = spamModeEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(50, 150, 50)
end)


CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)