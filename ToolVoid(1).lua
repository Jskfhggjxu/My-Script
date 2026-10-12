--[[
Main ToolVoid logic made by Theo(He's become a dumbass now...)
The beginning of everything is by Theo...

Credit:
- Theo - Main Logic
- Tory - Idea, Gui, Optimize
- AI guys - Code, Make Idea into reality

AI guys who've helped code:
- Gemini v3.6、v3.5 flash
- DeepSeek falsh 0731、v4 falsh、v4.1 flash

Thx for using script.
]]


if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.1)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--localplayer here sonion
local lp = Players.LocalPlayer
--4 mode "VOID/EXTREME/BRING/GIVE"
--[[
Void: make victim got in void destroyed
Extreme: make victim got very far place, it will mess up victim's client render 
Bring: make victim got teleport your character there
Give: Just give you choosed Tool
]]
local currentMode = "VOID"
local isProcessing = false
local originalPos = nil
local allowTeleportBack = false
local selectedToolName = nil
local switchedToR6 = false
--void destroy height
local OrgDestroyHeight = workspace.FallenPartsDestroyHeight or -500
local EXTREME_VOID_CFRAME = CFrame.new(9e9, 9999999, 9e9)

--just a baseplate cmd
local function FireServerCmd(...)
    return ReplicatedStorage:WaitForChild("01_server"):FireServer(...)
end
local function ForceServerReset()
    FireServerCmd("cmd", "-re")
end
local function RemoveHats()
    FireServerCmd("cmd", "-ch")
end
local function ChangeToR6()
    FireServerCmd("cmd", "-r6")
end
local function ChangeToR15()
    FireServerCmd("cmd", "-r15")
end

local function GetPlr(name)
    if not name or name == "" then return end
    name = name:lower():gsub("([%.%+%-%*%?%[%]%^%$%(%)%%])", "%%%1")
    for _, a in Players:GetPlayers() do
        if a ~= lp then
            local char = a.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local n, d = a.Name:lower(), a.DisplayName:lower()
                    if n:find("^" .. name) or d:find("^" .. name) then
                        return a
                    end
                end
            end
        end
    end
end

-- Main running function
local function mainRun(targetName)
    local target = GetPlr(targetName)
    if not target then return false end

    local targetchar = target.Character
    local targethrp = targetchar and targetchar:WaitForChild("HumanoidRootPart", 5)
    if not targethrp then return false end
    
    local char = lp.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local backpack = lp.Backpack
    if not char then return false end
    -- looking for tool
    local Tool = selectedToolName and
        (char:FindFirstChild(selectedToolName) or backpack:FindFirstChild(selectedToolName)) or
        (char:FindFirstChildOfClass("Tool") or backpack:FindFirstChildOfClass("Tool"))
    if not Tool then return "NO TOOL" end
    
    -- if Character is r15, change
    if char.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
        ChangeToR6()
        switchedToR6 = true
    end
    wait(.2)

    --remove hats
    RemoveHats()
    -- enabled antivoid need this
    local originalDestroyHeight = workspace.FallenPartsDestroyHeight
    -- if is Give mode, dont run clone HRP
    if currentMode == "GIVE" then
        if hrp then hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end
        if char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):Destroy()
        end
        task.wait(0.05)
        Instance.new("Humanoid").Parent = char

        Tool.Parent = char
        local handle = Tool:FindFirstChild("Handle")

        local giveStart = os.clock()
        while Tool.Parent == char and (os.clock() - giveStart) < 3 do
            task.wait()
            pcall(function()
                hrp.CFrame = targethrp.CFrame
                if handle then handle.CFrame = targethrp.CFrame end
            end)
        end
        workspace.FallenPartsDestroyHeight = originalDestroyHeight
        lp.Character = nil
        FireServerCmd("cmd", "-rs")
        ForceServerReset()
        return true
    end

    --this can make delete humanoid status control victim when pickup tool
    char.Archivable = true
    local Clone = char:Clone()
    task.wait(0.05)
    lp.Character = Clone
    task.wait(0.1)
    lp.Character = char
    task.wait(0.1)

    -- make in delete humanoid status
    if hrp then hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end
    if char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid"):Destroy()
    end
    task.wait(0.05)
    -- make can move in delete humanoid status
    local Humanoid = Instance.new("Humanoid")
    Humanoid.Parent = char
    task.wait(0.05)

    -- grip to zero and pickup tool
    Tool.Grip = CFrame.new(0, 0, 0)
    Tool.Parent = char
    local handle = Tool:FindFirstChild("Handle")

    -- No collisions
    local noclipConn = RunService.Stepped:Connect(function()
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)

    local hasInteracted = false
    local interactTime = 0
    local startTime = os.clock()

    repeat
        RunService.Stepped:Wait()

        if not Tool or not Tool:IsDescendantOf(game) then break end
        if Tool.Parent ~= char and Tool.Parent ~= targetchar and Tool.Parent ~= workspace then break end
        if not hasInteracted and (os.clock() - startTime > 5.0) then break end

        if targetchar and targethrp and hrp then
            -- if saw victim pickup tool than begin
            if Tool.Parent == targetchar and not hasInteracted then
                hasInteracted = true
                interactTime = os.clock()
                -- if is bring mode than wait sometime
                if currentMode == "BRING" then
                    task.wait(0.15)
                    break
                else
                    task.wait(0.02)
                end
            end
            -- start modes logic
            if hasInteracted then
                --Void mode
                if currentMode == "VOID" then
                   --make antivoid
                    workspace.FallenPartsDestroyHeight = 0/1/0
                    local targetVoidCFrame = CFrame.new(hrp.Position.X, (OrgDestroyHeight or originalDestroyHeight or -500) - 25, hrp.Position.Z)
                    hrp.CFrame = targetVoidCFrame
                    pcall(function()
                        targethrp.CFrame = targetVoidCFrame
                        targethrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end)
                    if os.clock() - interactTime > 1.5 then break end
                --Exterme mode
                elseif currentMode == "EXTREME" then
                    --antivoid
                    workspace.FallenPartsDestroyHeight = 0/1/0
                    hrp.CFrame = EXTREME_VOID_CFRAME
                    pcall(function()
                        targethrp.CFrame = EXTREME_VOID_CFRAME
                        targethrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end)
                    if os.clock() - interactTime > 2.0 then break end
                --bring mode
                elseif currentMode == "BRING" then
                    if originalPos then
                        -- teleport back
                        hrp.CFrame = originalPos
                        pcall(function()
                            targethrp.CFrame = originalPos
                            targethrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end)
                    end
                    if os.clock() - interactTime > 1.8 then break end
                end

            else
                -- edit victims hrp cframe to Tool handle
                if currentMode == "EXTREME" then
                    -- not using edit, use follow victim
                    pcall(function()
                        hrp.CFrame = targethrp.CFrame
                    end)
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                elseif currentMode == "VOID" then
                    workspace.FallenPartsDestroyHeight = 0/1/0
                    local preVoidCFrame = CFrame.new(originalPos.Position.X, (OrgDestroyHeight or originalDestroyHeight or -500) - 25, originalPos.Position.Z)
                    hrp.CFrame = preVoidCFrame
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    pcall(function()
                        targethrp.CFrame = handle.CFrame
                        targethrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end)
                else -- Bring
                    pcall(function()
                        targethrp.CFrame = handle.CFrame
                        targethrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end)
                    hrp.CFrame = originalPos
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                end
            end
        else
            break
        end
    until Tool.Parent == workspace

    -- end
    workspace.FallenPartsDestroyHeight = originalDestroyHeight
    if noclipConn then noclipConn:Disconnect() end

    -- mode end
    if currentMode == "BRING" then
        if hrp and originalPos then
            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            hrp.CFrame = originalPos
            pcall(function()
                targethrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                targethrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                targethrp.CFrame = originalPos
            end)
            task.wait(0.4)
        end
    else
        if hrp and originalPos then
            hrp.CFrame = originalPos
            RunService.Heartbeat:Wait()
        end
    end

    lp.Character = nil
    return true
end

-- Watchdog
local function WaitForCharacterAdded(timeout)
    local deadline = os.clock() + (timeout or 5)
    local fired = false
    local conn = lp.CharacterAdded:Connect(function() fired = true end)
    while os.clock() < deadline and not fired do
        task.wait(0.05)
    end
    conn:Disconnect()
    return fired
end

--back original place
local function TeleportBackAfterRespawn()
    if not allowTeleportBack or not originalPos then return end
    local targetPos = originalPos

    -- wait new Character, up to 5 sec
    local newChar = lp.Character
    local deadline = os.clock() + 3
    while not newChar and os.clock() < deadline do
        task.wait(0.05)
        newChar = lp.Character
    end
    if not newChar then return end

    task.wait(0.15)

    -- repeat teleport few times
    for _ = 1, 4 do
        local hrp = newChar:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = targetPos
            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
        task.wait(0.15)
    end
end

-- when finished, respawn
local function ExecuteSequence(targetName)
    if isProcessing then return end

    local char = lp.Character
    if not char or not char:FindFirstChildOfClass("Humanoid") then return "NO CHAR" end

    isProcessing = true
    local hrp = char:FindFirstChild("HumanoidRootPart")
    originalPos = hrp and hrp.CFrame or nil
    allowTeleportBack = true

    local successStatus = mainRun(targetName)

    if not successStatus or successStatus == "NO TOOL" then
        isProcessing = false
        originalPos = nil
        allowTeleportBack = false
        return (successStatus == "NO TOOL") and "NO TOOL" or "NOT FOUND"
    end

    -- respawn 3 times to prevent failure
    local respawned = false
    for _ = 1, 3 do
        lp.Character = nil
        ForceServerReset()
        if WaitForCharacterAdded(1.2) then
            respawned = true
            break
        end
    end

    TeleportBackAfterRespawn()
    if switchedToR6 then
        switchedToR6 = false
        ChangeToR15()
    end
    originalPos = nil
    allowTeleportBack = false
    isProcessing = false
    task.wait(0.15)
    return "SUCCESS"
end

-- note: its how running: ExecuteSequence -> TeleportBackAfterRespawn 

-- Gui (not by AI bro 🖕, I dont have time to let AI to make Gui code)
-- i like create gui in gui maker
local function BuildGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ToolVoidByTory"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    -- title
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Name = "ToolVoid"
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundColor3 = Color3.fromRGB(121, 109, 159)
    MainFrame.Size = UDim2.new(0.24862, 0, 0.08609, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame)
    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(140, 255, 191)
    local AspectRatio = Instance.new("UIAspectRatioConstraint", MainFrame)
    AspectRatio.AspectRatio = 6.92308

    -- close
    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Name = "Close"
    CloseBtn.BorderSizePixel = 0
    CloseBtn.TextSize = 25
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 61, 136)
    CloseBtn.FontFace = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    CloseBtn.Size = UDim2.new(0.14444, 0, 1, 0)
    CloseBtn.Position = UDim2.new(0.85556, 0, 0, 0)
    CloseBtn.Text = "X"
    Instance.new("UICorner", CloseBtn)

    -- minimize
    local MinimizeBtn = Instance.new("TextButton", MainFrame)
    MinimizeBtn.Name = "Minimize"
    MinimizeBtn.BorderSizePixel = 0
    MinimizeBtn.TextSize = 25
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(219, 255, 191)
    MinimizeBtn.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    MinimizeBtn.Size = UDim2.new(0.14444, 0, 1, 0)
    MinimizeBtn.Position = UDim2.new(0.71111, 0, 0, 0)
    MinimizeBtn.Text = "-"
    Instance.new("UICorner", MinimizeBtn)

    -- tool list button
    local ToolToggleBtn = Instance.new("TextButton", MainFrame)
    ToolToggleBtn.Name = "ToolToggle"
    ToolToggleBtn.BorderSizePixel = 0
    ToolToggleBtn.TextSize = 25
    ToolToggleBtn.BackgroundColor3 = Color3.fromRGB(120, 252, 255)
    ToolToggleBtn.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    ToolToggleBtn.Size = UDim2.new(0.14444, 0, 1, 0)
    ToolToggleBtn.Position = UDim2.new(0.56667, 0, 0, 0)
    ToolToggleBtn.Text = "+"
    Instance.new("UICorner", ToolToggleBtn)

    -- title text
    local TitleLabel = Instance.new("TextLabel", MainFrame)
    TitleLabel.Name = "title"
    TitleLabel.TextWrapped = true
    TitleLabel.BorderSizePixel = 0
    TitleLabel.TextSize = 13
    TitleLabel.BackgroundColor3 = Color3.fromRGB(121, 109, 159)
    TitleLabel.FontFace = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TitleLabel.Size = UDim2.new(0.5, 0, 1, 0)
    TitleLabel.Text = "By Tory"
    Instance.new("UICorner", TitleLabel)

    -- MainGui
    local MainGui = Instance.new("Frame", MainFrame)
    MainGui.Name = "MainGui"
    MainGui.BorderSizePixel = 0
    MainGui.BackgroundColor3 = Color3.fromRGB(168, 151, 221)
    MainGui.Size = UDim2.new(0.98889, 0, 5.69231, 0)
    MainGui.Position = UDim2.new(0.00344, 0, 1.07539, 0)
    MainGui.BackgroundTransparency = 0.15
    Instance.new("UICorner", MainGui)
    Instance.new("UIStroke", MainGui)

    -- just useless text
    local ShowMode = Instance.new("TextLabel", MainGui)
    ShowMode.Name = "ShowMode"
    ShowMode.BorderSizePixel = 0
    ShowMode.TextSize = 15
    ShowMode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ShowMode.BackgroundTransparency = 1
    ShowMode.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic)
    ShowMode.Size = UDim2.new(0.49438, 0, 0.24324, 0)
    ShowMode.Position = UDim2.new(0.02222, 0, 0.41892, 0)
    ShowMode.Text = "Current Mode:"
    -- show modes
    local ModeLabel = Instance.new("TextLabel", ShowMode)
    ModeLabel.Name = "Mode"
    ModeLabel.BorderSizePixel = 0
    ModeLabel.TextSize = 15
    ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
    ModeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ModeLabel.BackgroundTransparency = 1
    ModeLabel.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic)
    ModeLabel.Size = UDim2.new(0.61364, 0, 0.77778, 0)
    ModeLabel.Position = UDim2.new(0.90909, 0, 0.11111, 0)
    ModeLabel.Text = "VOID"

    -- Target textbox
    local ChoosePlayer = Instance.new("TextBox", MainGui)
    ChoosePlayer.Name = "ChoosePlayer"
    ChoosePlayer.BorderSizePixel = 0
    ChoosePlayer.TextWrapped = true
    ChoosePlayer.TextScaled = true
    ChoosePlayer.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
    ChoosePlayer.Size = UDim2.new(0.89888, 0, 0.24324, 0)
    ChoosePlayer.Position = UDim2.new(0.05556, 0, 0.24324, 0)
    ChoosePlayer.Text = ""
    ChoosePlayer.PlaceholderText = "Type user/display Name"
    ChoosePlayer.ClearTextOnFocus = true
    Instance.new("UICorner", ChoosePlayer)
    local InputStroke = Instance.new("UIStroke", ChoosePlayer)
    InputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    InputStroke.Color = Color3.fromRGB(245, 255, 135)

    -- Switch mode button
    local SwitchBtn = Instance.new("TextButton", MainGui)
    SwitchBtn.BorderSizePixel = 0
    SwitchBtn.BackgroundColor3 = Color3.fromRGB(234, 210, 255)
    SwitchBtn.Size = UDim2.new(0.33708, 0, 0.22973, 0)
    SwitchBtn.Position = UDim2.new(0.07778, 0, 0.62162, 0)
    SwitchBtn.Text = "Switch"
    Instance.new("UICorner", SwitchBtn)
    local SwitchStroke = Instance.new("UIStroke", SwitchBtn)
    SwitchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- press this let do it😏
    local StartBtn = Instance.new("TextButton", MainGui)
    StartBtn.Name = "Start"
    StartBtn.BorderSizePixel = 0
    StartBtn.BackgroundColor3 = Color3.fromRGB(234, 210, 255)
    StartBtn.Size = UDim2.new(0.33708, 0, 0.22973, 0)
    StartBtn.Position = UDim2.new(0.44444, 0, 0.62162, 0)
    StartBtn.Text = "Start"
    Instance.new("UICorner", StartBtn)
    local StartStroke = Instance.new("UIStroke", StartBtn)
    StartStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- tool list
    local ChooseTool = Instance.new("Frame", MainFrame)
    ChooseTool.Name = "ChooseTool"
    ChooseTool.BorderSizePixel = 0
    ChooseTool.BackgroundColor3 = Color3.fromRGB(168, 151, 221)
    ChooseTool.Size = UDim2.new(0.56667, 0, 6.92308, 0)
    ChooseTool.Position = UDim2.new(-0.62222, 0, -0.07692, 0)
    ChooseTool.BackgroundTransparency = 0.15
    ChooseTool.Visible = false
    Instance.new("UICorner", ChooseTool)
    Instance.new("UIStroke", ChooseTool)
    local ToolLayout = Instance.new("UIListLayout", ChooseTool)
    ToolLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ToolLayout.Padding = UDim.new(0, 4)
    local ToolPadding = Instance.new("UIPadding", ChooseTool)
    ToolPadding.PaddingTop = UDim.new(0, 6)
    ToolPadding.PaddingBottom = UDim.new(0, 6)
    ToolPadding.PaddingLeft = UDim.new(0, 6)
    ToolPadding.PaddingRight = UDim.new(0, 6)

    ScreenGui.Parent = CoreGui

    return ScreenGui, MainFrame, MainGui, ChooseTool, CloseBtn, MinimizeBtn, ToolToggleBtn,
           ModeLabel, ChoosePlayer, SwitchBtn, StartBtn
end


-- clear old gui
local playerGui = lp:WaitForChild("PlayerGui")
for _, name in ipairs({ "ToolVoidByTory", "ToolVoid" }) do
    local a = CoreGui:FindFirstChild(name)
    if a then a:Destroy() end
    local b = playerGui:FindFirstChild(name)
    if b then b:Destroy() end
end
local stray = playerGui:FindFirstChild("ScreenGui")
if stray then stray:Destroy() end

local ScreenGui, MainFrame, MainGui, ChooseTool, CloseBtn, MinimizeBtn, ToolToggleBtn,
      ModeLabel, ChoosePlayer, SwitchBtn, StartBtn = BuildGui()

-- modes color
local MODE_COLORS = {
    VOID    = Color3.fromRGB(190, 210, 255),
    EXTREME = Color3.fromRGB(255, 150, 190),
    BRING   = Color3.fromRGB(150, 255, 190),
    GIVE    = Color3.fromRGB(255, 210, 130),
}

local function UpdateModeUI()
    ModeLabel.Text = currentMode
    ModeLabel.TextColor3 = MODE_COLORS[currentMode] or Color3.new(1, 1, 1)
end
UpdateModeUI()

-- tool list logic
local toolListOpen = false
local function RefreshToolList()
    for _, child in ipairs(ChooseTool:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local found = {}
    local function scan(parent)
        if not parent then return end
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("Tool") and not found[obj.Name] then found[obj.Name] = true end
        end
    end
    scan(lp:FindFirstChild("Backpack"))
    scan(lp.Character)
    for tName, _ in pairs(found) do
        local tBtn = Instance.new("TextButton", ChooseTool)
        tBtn.Size = UDim2.new(1, 0, 0, 26)
        tBtn.BorderSizePixel = 0
        tBtn.TextSize = 14
        tBtn.TextScaled = true
        tBtn.Text = tName
        if selectedToolName == tName then
            tBtn.BackgroundColor3 = Color3.fromRGB(84, 168, 120)
        else
            tBtn.BackgroundColor3 = Color3.fromRGB(121, 109, 159)
        end
        tBtn.TextColor3 = Color3.new(1, 1, 1)
        local corner = Instance.new("UICorner", tBtn)
        corner.CornerRadius = UDim.new(0, 4)
        tBtn.MouseButton1Click:Connect(function()
            selectedToolName = (selectedToolName == tName) and nil or tName
            RefreshToolList()
        end)
    end
end

-- Refresh tool list
ToolToggleBtn.MouseButton1Click:Connect(function()
    toolListOpen = not toolListOpen
    if toolListOpen then
        RefreshToolList()
        ChooseTool.Visible = true
    else
        ChooseTool.Visible = false
    end
end)

-- close logic
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- minimize logic
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainGui.Visible = not minimized
    -- minimize tool list too
    if minimized and toolListOpen then
        toolListOpen = false
        ChooseTool.Visible = false
    end
end)

-- Switch modes logic
SwitchBtn.MouseButton1Click:Connect(function()
    if currentMode == "VOID" then
        currentMode = "EXTREME"
    elseif currentMode == "EXTREME" then
        currentMode = "BRING"
    elseif currentMode == "BRING" then
        currentMode = "GIVE"
    else
        currentMode = "VOID"
    end
    UpdateModeUI()
end)

-- start button logic
local function SetStartText(text, hold)
    StartBtn.Text = text
    if hold then
        task.delay(hold, function()
            if StartBtn and StartBtn.Parent then StartBtn.Text = "Start" end
        end)
    end
end

local function Run(targetName)
    if isProcessing then return end
    SetStartText("checking")
    local res = ExecuteSequence(targetName)

    if res == "NOT FOUND" then
        SetStartText("Where?", 1.2)
    elseif res == "NO TOOL" then
        SetStartText("No tool", 1.2)
    elseif res == "NO CHAR" then
        SetStartText("Pls re char", 1.2)
    else
        SetStartText("Done😎", 0.4)
        RefreshToolList()
    end
end

StartBtn.MouseButton1Click:Connect(function()
    if isProcessing then return end
    local name = ChoosePlayer.Text
    if name == "" then
        SetStartText("TYPE NAME!", 1)
        return
    end
    Run(name)
end)

ChoosePlayer.FocusLost:Connect(function(enterPressed)
    if enterPressed and ChoosePlayer.Text ~= "" and not isProcessing then
        Run(ChoosePlayer.Text)
    end
end)
