local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local scriptEnabled = true
local dragging = false
local touchInput = nil
local moveDir = Vector3.new(0, 0, 0)
local maxRadius = 50 
local cons = {} 

-- ==========================================
-- 纯粹的 UI 容器
-- ==========================================
local playerGui = player:WaitForChild("PlayerGui", 10)
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ToryMobileMoveGui"
MainGui.ResetOnSpawn = false 
MainGui.DisplayOrder = 10 
MainGui.Parent = playerGui

-- 摇杆区域（左下角）
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
Base.BackgroundTransparency = 0.4
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
Stick.Position = UDim2.new(0.5, 0, 0.5, 0)
Stick.Parent = Base

local UICornerStick = Instance.new("UICorner")
UICornerStick.CornerRadius = UDim.new(1, 0)
UICornerStick.Parent = Stick

-- 跳跃按钮（右下角）
local CustomJumpButton = Instance.new("ImageButton")
CustomJumpButton.Name = "CustomJumpButton"
CustomJumpButton.AnchorPoint = Vector2.new(1, 1)
CustomJumpButton.Position = UDim2.new(1, -40, 1, -40)
CustomJumpButton.Size = UDim2.new(0, 75, 0, 75)
CustomJumpButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CustomJumpButton.BackgroundTransparency = 0.4
CustomJumpButton.Image = "rbxassetid://14392437373"
CustomJumpButton.Parent = MainGui

local UICornerJump = Instance.new("UICorner")
UICornerJump.CornerRadius = UDim.new(1, 0)
UICornerJump.Parent = CustomJumpButton

-- ==========================================
-- 输入控制逻辑
-- ==========================================
local function doForceJump()
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.FloorMaterial ~= Enum.Material.Air then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

CustomJumpButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        CustomJumpButton.BackgroundTransparency = 0.15
        doForceJump()
    end
end)

CustomJumpButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        CustomJumpButton.BackgroundTransparency = 0.4
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not scriptEnabled then return end
    if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) and not dragging then
        local absPos = JoystickArea.AbsolutePosition
        local absSize = JoystickArea.AbsoluteSize
        if input.Position.X >= absPos.X and input.Position.X <= absPos.X + absSize.X and
           input.Position.Y >= absPos.Y and input.Position.Y <= absPos.Y + absSize.Y then
            
            dragging = true
            touchInput = input
            Base.Visible = true
            Base.Position = UDim2.new(0, input.Position.X - absPos.X, 0, input.Position.Y - absPos.Y)
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == touchInput and dragging then
        local center = Base.AbsolutePosition + (Base.AbsoluteSize / 2)
        local diff = Vector2.new(input.Position.X, input.Position.Y) - center
        local dist = math.min(diff.Magnitude, maxRadius)
        local dir = diff.Magnitude > 0 and diff.Unit or Vector2.new(0,0)
        Stick.Position = UDim2.new(0.5, dir.X * dist, 0.5, dir.Y * dist)
        moveDir = Vector3.new(dir.X, 0, dir.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input == touchInput then
        dragging = false
        touchInput = nil
        Base.Visible = false
        moveDir = Vector3.new(0, 0, 0)
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and player.Character and player.Character:FindFirstChild("Humanoid") and camera then
        local hum = player.Character.Humanoid
        if moveDir.Magnitude > 0 then
            local camLook = camera.CFrame.LookVector
            local fwd = Vector3.new(camLook.X, 0, camLook.Z).Unit
            local right = Vector3.new(camera.CFrame.RightVector.X, 0, camera.CFrame.RightVector.Z).Unit
            hum:Move((right * moveDir.X) + (fwd * -moveDir.Z), false)
        else
            hum:Move(Vector3.new(0,0,0), false)
        end
    end
end)
