pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/%E9%98%B2%E9%80%8F%E9%80%BB%E8%BE%91.lua"))()
end)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer

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

local playerGui = player:WaitForChild("PlayerGui", 10)
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
    
    if visible then
        Base.Visible = true
    end
    
    local tweenBase = TweenService:Create(Base, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = targetBaseTrans})
    local tweenStick = TweenService:Create(Stick, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = targetStickTrans})
    
    tweenBase:Play()
    tweenStick:Play()
    
    if not visible then
        tweenBase.Completed:Connect(function()
            if not dragging then
                Base.Visible = false
            end
        end)
    end
end

local function doSpacebarJump(isKeyDown)
    VirtualInputManager:SendKeyEvent(isKeyDown, Enum.KeyCode.Space, false, game)
end

CustomJumpButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        CustomJumpButton.BackgroundTransparency = 0.15
        doSpacebarJump(true)
    end
end)

CustomJumpButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        CustomJumpButton.BackgroundTransparency = 0.4
        doSpacebarJump(false)
    end
end)

local function updateKeyState(key, shouldBePressed)
    if activeKeys[key] ~= shouldBePressed then
        activeKeys[key] = shouldBePressed
        VirtualInputManager:SendKeyEvent(shouldBePressed, key, false, game)
    end
end

local function releaseAllKeys()
    for key, isPressed in pairs(activeKeys) do
        if isPressed then
            updateKeyState(key, false)
        end
    end
end

local function updateMovementFromDirection(dir)
    if dir.Magnitude == 0 then
        releaseAllKeys()
        return
    end

    local angle = math.atan2(dir.Y, dir.X)
    local degrees = math.deg(angle)

    local w, s, a, d = false, false, false, false

    if degrees >= -120 and degrees <= -60 then
        w = true
    elseif degrees >= 60 and degrees <= 120 then
        s = true
    elseif degrees >= -30 and degrees <= 30 then
        d = true
    elseif degrees >= 150 or degrees <= -150 then
        a = true
    elseif degrees > -60 and degrees < -30 then
        w = true; d = true
    elseif degrees > -150 and degrees < -120 then
        w = true; a = true
    elseif degrees > 30 and degrees < 60 then
        s = true; d = true
    elseif degrees > 120 and degrees < 150 then
        s = true; a = true
    end

    updateKeyState(Enum.KeyCode.W, w)
    updateKeyState(Enum.KeyCode.S, s)
    updateKeyState(Enum.KeyCode.A, a)
    updateKeyState(Enum.KeyCode.D, d)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
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

UserInputService.InputChanged:Connect(function(input)
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
            updateMovementFromDirection(dir)
        else
            releaseAllKeys()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input == touchInput then
        dragging = false
        touchInput = nil
        setJoystickVisible(false)
        
        releaseAllKeys()
    end
end)
