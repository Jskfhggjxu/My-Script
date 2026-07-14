pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/%E9%98%B2%E9%80%8F%E9%80%BB%E8%BE%91.lua"))()
end)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui", 10)
if _G.ToryJoystickRunning == true then
    return
end

_G.ToryJoystickRunning = true


local CURRENT_VERSION_TYPE = "HRP" -- choose move mode "WASD" or "HRP"
-- WASD use keyboard to move, HRP use forcing HRP to inject at speed
local scriptEnabled = true

local dragging = false
local touchInput = nil
local startPos = Vector2.new(0, 0)
local maxRadius = 50 
local showThreshold = 5

local activeKeys = {
    [Enum.KeyCode.W] = false,
    [Enum.KeyCode.S] = false,
    [Enum.KeyCode.A] = false,
    [Enum.KeyCode.D] = false,
}

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ToryMobileMoveGui"
MainGui.ResetOnSpawn = false 
MainGui.DisplayOrder = 10 
MainGui.Parent = playerGui

local JoystickArea = Instance.new("Frame")
JoystickArea.Name = "JoystickArea"
JoystickArea.Position = UDim2.new(0, 0, 0.4, 0)
JoystickArea.Size = UDim2.new(0.4, 0, 0.6, 0)
JoystickArea.BackgroundTransparency = 1
JoystickArea.Parent = MainGui

local Base = Instance.new("ImageButton")
Base.Name = "Base"
Base.Size = UDim2.new(0, 100, 0, 100)
Base.AnchorPoint = Vector2.new(0.5, 0.5)
Base.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Base.BackgroundTransparency = 1
Base.AutoButtonColor = false
Base.Visible = false
Base.Parent = JoystickArea

local UICornerBase = Instance.new("UICorner")
UICornerBase.CornerRadius = UDim.new(1, 0)
UICornerBase.Parent = Base

local Stick = Instance.new("Frame")
Stick.Name = "Stick"
Stick.Size = UDim2.new(0, 50, 0, 50)
Stick.AnchorPoint = Vector2.new(0.5, 0.5)
Stick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stick.BackgroundTransparency = 1
Stick.Position = UDim2.new(0.5, 0, 0.5, 0)
Stick.Parent = Base

local UICornerStick = Instance.new("UICorner")
UICornerStick.CornerRadius = UDim.new(1, 0)
UICornerStick.Parent = Stick

local CustomJumpButton = Instance.new("ImageButton")
CustomJumpButton.Name = "CustomJumpButton"
CustomJumpButton.AnchorPoint = Vector2.new(1, 1)
CustomJumpButton.Position = UDim2.new(1, -25, 1, -15)
CustomJumpButton.Size = UDim2.new(0, 75, 0, 75)
CustomJumpButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CustomJumpButton.BackgroundTransparency = 0.4
CustomJumpButton.Image = "rbxassetid://14392437373"
CustomJumpButton.Parent = MainGui

local UICornerJump = Instance.new("UICorner")
UICornerJump.CornerRadius = UDim.new(1, 0)
UICornerJump.Parent = CustomJumpButton

local function setJoystickVisible(visible)
    local targetBaseTrans = visible and 0.4 or 1
    local targetStickTrans = visible and 0 or 1
    if visible then Base.Visible = true end
    
    local tweenBase = TweenService:Create(Base, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = targetBaseTrans})
    local tweenStick = TweenService:Create(Stick, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = targetStickTrans})
    
    tweenBase:Play()
    tweenStick:Play()
    if not visible then
        local comp
        comp = tweenBase.Completed:Connect(function()
            if not dragging then Base.Visible = false end
            comp:Disconnect()
        end)
    end
end

-- ==========================================
-- 4. 驱动底层方法 (WASD 键位状态更新)
-- ==========================================
local function updateKeyState(key, shouldBePressed)
    if activeKeys[key] ~= shouldBePressed then
        activeKeys[key] = shouldBePressed
        VirtualInputManager:SendKeyEvent(shouldBePressed, key, false, game)
    end
end

local function releaseAllWASDKeys()
    for key, isPressed in pairs(activeKeys) do
        if isPressed then updateKeyState(key, false) end
    end
end

local function handleWASDMovement(dir)
    if dir.Magnitude == 0 then releaseAllWASDKeys() return end
    local degrees = math.deg(math.atan2(dir.Y, dir.X))
    local w, s, a, d = false, false, false, false

    if degrees >= -120 and degrees <= -60 then w = true
    elseif degrees >= 60 and degrees <= 120 then s = true
    elseif degrees >= -30 and degrees <= 30 then d = true
    elseif degrees >= 150 or degrees <= -150 then a = true
    elseif degrees > -60 and degrees < -30 then w = true; d = true
    elseif degrees > -150 and degrees < -120 then w = true; a = true
    elseif degrees > 30 and degrees < 60 then s = true; d = true
    elseif degrees > 120 and degrees < 150 then s = true; a = true
    end

    updateKeyState(Enum.KeyCode.W, w)
    updateKeyState(Enum.KeyCode.S, s)
    updateKeyState(Enum.KeyCode.A, a)
    updateKeyState(Enum.KeyCode.D, d)
end

local hrpMoveDirection = Vector3.new(0, 0, 0)
local renderConn
renderConn = RunService.RenderStepped:Connect(function()
    if not scriptEnabled or CURRENT_VERSION_TYPE ~= "HRP" then return end
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and hrpMoveDirection.Magnitude > 0 then
            humanoid:Move(hrpMoveDirection, true)
        end
    end
end)

local function doJumpAction(isPressed)
    if not scriptEnabled then return end
    if CURRENT_VERSION_TYPE == "WASD" then
        VirtualInputManager:SendKeyEvent(isPressed, Enum.KeyCode.Space, false, game)
    elseif CURRENT_VERSION_TYPE == "HRP" then
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid.Jump = isPressed end
        end
    end
end

local jumpBeganConn = CustomJumpButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        CustomJumpButton.BackgroundTransparency = 0.15
        doJumpAction(true)
    end
end)

local jumpEndedConn = CustomJumpButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        CustomJumpButton.BackgroundTransparency = 0.4
        doJumpAction(false)
    end
end)

local inputBeganConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not scriptEnabled then return end
    if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) and not dragging then
        local absPos = JoystickArea.AbsolutePosition
        local absSize = JoystickArea.AbsoluteSize
        if input.Position.X >= absPos.X and input.Position.X <= absPos.X + absSize.X and
           input.Position.Y >= absPos.Y and input.Position.Y <= absPos.Y + absSize.Y then
            if gameProcessed then return end
            
            dragging = true
            touchInput = input
            startPos = Vector2.new(input.Position.X, input.Position.Y)
            
            Base.Position = UDim2.new(0, input.Position.X - absPos.X, 0, input.Position.Y - absPos.Y)
            Stick.Position = UDim2.new(0.5, 0, 0.5, 0)
        end
    end
end)

local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
    if input == touchInput and dragging then
        local currentPos = Vector2.new(input.Position.X, input.Position.Y)
        local diff = currentPos - startPos
        
        if diff.Magnitude >= showThreshold and Base.BackgroundTransparency == 1 then
            setJoystickVisible(true)
        end
        
        local dist = math.min(diff.Magnitude, maxRadius)
        local dir = diff.Magnitude > 0 and diff.Unit or Vector2.new(0,0)
        Stick.Position = UDim2.new(0.5, dir.X * dist, 0.5, dir.Y * dist)
        
        if diff.Magnitude >= showThreshold then
            if CURRENT_VERSION_TYPE == "WASD" then
                handleWASDMovement(dir)
            elseif CURRENT_VERSION_TYPE == "HRP" then
                local weight = dist / maxRadius
                hrpMoveDirection = Vector3.new(dir.X * weight, 0, dir.Y * weight)
            end
        else
            if CURRENT_VERSION_TYPE == "WASD" then releaseAllWASDKeys() end
            hrpMoveDirection = Vector3.new(0, 0, 0)
        end
    end
end)

local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
    if input == touchInput then
        dragging = false
        touchInput = nil
        setJoystickVisible(false)
        
        if CURRENT_VERSION_TYPE == "WASD" then
            releaseAllWASDKeys()
        elseif CURRENT_VERSION_TYPE == "HRP" then
            hrpMoveDirection = Vector3.new(0, 0, 0)
        end
    end
end)

local chatConn
local function executeCommand(msg)
    local cmd = string.gsub(msg, "^%s*(.-)%s*$", "%1")
    
    if cmd == "-closejoy" then
        scriptEnabled = false
        dragging = false
        touchInput = nil
        releaseAllWASDKeys()
        hrpMoveDirection = Vector3.new(0, 0, 0)
        
        if renderConn then renderConn:Disconnect() end
        if jumpBeganConn then jumpBeganConn:Disconnect() end
        if jumpEndedConn then jumpEndedConn:Disconnect() end
        if inputBeganConn then inputBeganConn:Disconnect() end
        if inputChangedConn then inputChangedConn:Disconnect() end
        if inputEndedConn then inputEndedConn:Disconnect() end
        if chatConn then chatConn:Disconnect() end
        
        MainGui:Destroy()
        _G.ToryJoystickRunning = nil
        
    elseif cmd == "-tohrp" then
        if CURRENT_VERSION_TYPE ~= "HRP" then
            releaseAllWASDKeys()
            CURRENT_VERSION_TYPE = "HRP"
        end
        scriptEnabled = true
        MainGui.Enabled = true
        
    elseif cmd == "-tokey" then
        if CURRENT_VERSION_TYPE ~= "WASD" then
            hrpMoveDirection = Vector3.new(0, 0, 0)
            CURRENT_VERSION_TYPE = "WASD"
        end
        scriptEnabled = true
        MainGui.Enabled = true
    end
end

if player.ClassName == "Player" then
    chatConn = player.Chatted:Connect(executeCommand)
end
