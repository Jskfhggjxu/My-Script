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
-- 【终极核心】完全重组 TouchGui 与防穿透矩阵
-- ==========================================
local function rebuildTouchGuiShields()
    local playerGui = player:WaitForChild("PlayerGui", 10)
    if not playerGui then return end
    
    -- 防呆拦截：如果已经处理过，说明是重复执行，直接跳过
    if playerGui:FindFirstChild("FakeTouchGui") and playerGui:FindFirstChild("TouchGui") and playerGui.TouchGui:GetAttribute("IsToryFake") then
        return
    end
    
    local realTouchGui = playerGui:WaitForChild("TouchGui", 10)
    if realTouchGui then
        -- 1. 复制原 TouchGui 为基础模板
        local baseClone = realTouchGui:Clone()
        
        -- 2. 彻底销毁原本的真 TouchGui
        realTouchGui:Destroy()
        
        -- 3. 构造全新的【假 TouchGui】塞回 PlayerGui
        local fakeRealTouchGui = baseClone:Clone()
        fakeRealTouchGui.Name = "TouchGui"
        fakeRealTouchGui.ResetOnSpawn = false
        fakeRealTouchGui:SetAttribute("IsToryFake", true) -- 打上假货标记
        
        -- 4. 构造【FakeTouchGui】
        local fakeTouchGui = baseClone:Clone()
        fakeTouchGui.Name = "FakeTouchGui"
        fakeTouchGui.ResetOnSpawn = false
        
        -- 清理两个 GUI，使其只剩下 TouchControlFrame -> DynamicThumbstickFrame
        local function cleanAndFixFrame(guiInstance)
            local controlFrame = guiInstance:FindFirstChild("TouchControlFrame")
            if controlFrame then
                -- 核心逻辑：删除所有无法工作的原装 JumpButton
                local jump = controlFrame:FindFirstChild("JumpButton")
                if jump then jump:Destroy() end
                
                local thumb = controlFrame:FindFirstChild("DynamicThumbstickFrame")
                if thumb then
                    thumb.BackgroundTransparency = 1
                    thumb.Visible = true
                    thumb.Active = true -- 极度关键：靠它挡住相机流
                    
                    -- 写入你测试出的精准位置与大小
                    thumb.Position = UDim2.new(0.400000006, 100, 0.666666687, 100)
                    thumb.Size = UDim2.new(0, -100, 0.333333343, 0)
                end
            end
            guiInstance.Parent = playerGui
        end
        
        cleanAndFixFrame(fakeRealTouchGui)
        cleanAndFixFrame(fakeTouchGui)
        
        baseClone:Destroy() -- 销毁模板
    end
end

rebuildTouchGuiShields()

-- ==========================================
-- 自定义移动 GUI 元素创建
-- ==========================================
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ToryMobileMoveGui"
MainGui.ResetOnSpawn = false
MainGui.DisplayOrder = 1000
MainGui.Parent = game:GetService("CoreGui")

local JoystickArea = Instance.new("Frame")
JoystickArea.Name = "JoystickArea"
JoystickArea.Position = UDim2.new(0, 0, 0.4, 0)
JoystickArea.Size = UDim2.new(0.4, 0, 0.6, 0)
JoystickArea.BackgroundTransparency = 1
JoystickArea.Active = false 
JoystickArea.Visible = true
JoystickArea.Parent = MainGui

local Base = Instance.new("ImageButton")
Base.Name = "Base"
Base.Size = UDim2.new(0, 100, 0, 100)
Base.AnchorPoint = Vector2.new(0.5, 0.5)
Base.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Base.BackgroundTransparency = 0.4
Base.Image = "" 
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
Stick.Active = false
Stick.Parent = Base

local UICornerStick = Instance.new("UICorner")
UICornerStick.CornerRadius = UDim.new(1, 0)
UICornerStick.Parent = Stick

-- ==========================================
-- 自定义物理跳跃按钮创建 (纯移动版)
-- ==========================================
local CustomJumpButton = Instance.new("ImageButton")
CustomJumpButton.Name = "CustomJumpButton"
CustomJumpButton.AnchorPoint = Vector2.new(1, 1)
-- 写入你给出的精准数据
CustomJumpButton.Position = UDim2.new(1, -95, 1, -90)
CustomJumpButton.Size = UDim2.new(0, 70, 0, 70)
CustomJumpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CustomJumpButton.BackgroundTransparency = 0.5
CustomJumpButton.Image = "rbxasseturl://textures/ui/Input/TouchJump.png" -- 还原官方跳跃圆图标
CustomJumpButton.Parent = MainGui

local UICornerJump = Instance.new("UICorner")
UICornerJump.CornerRadius = UDim.new(1, 0)
UICornerJump.Parent = CustomJumpButton

table.insert(cons, CustomJumpButton.InputBegan:Connect(function(input)
    if not scriptEnabled then return end
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Jump = true -- 写入纯移动端的物理跳跃触发
        end
    end
end))

-- ==========================================
-- 移动输入流拦截处理
-- ==========================================
table.insert(cons, workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    camera = workspace.CurrentCamera
end))

local function isInputInZone(pos)
    local absPos = JoystickArea.AbsolutePosition
    local absSize = JoystickArea.AbsoluteSize
    return pos.X >= absPos.X and pos.X <= (absPos.X + absSize.X)
       and pos.Y >= absPos.Y and pos.Y <= (absPos.Y + absSize.Y)
end

table.insert(cons, UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not scriptEnabled then return end
    if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) and not dragging then
        local inputPos = Vector2.new(input.Position.X, input.Position.Y)
        if isInputInZone(inputPos) then
            if gameProcessed then return end 
            dragging = true
            touchInput = input
            Base.Modal = true
            Base.Visible = true
            local absPos = JoystickArea.AbsolutePosition
            Base.Position = UDim2.new(0, input.Position.X - absPos.X, 0, input.Position.Y - absPos.Y)
        end
    end
end))

table.insert(cons, UserInputService.InputChanged:Connect(function(input)
    if input == touchInput and dragging then
        local center = Base.AbsolutePosition + (Base.AbsoluteSize / 2)
        local inputPos = Vector2.new(input.Position.X, input.Position.Y)
        local diff = inputPos - center
        local distance = math.min(diff.Magnitude, maxRadius)
        local direction = diff.Unit
        if diff.Magnitude == 0 then direction = Vector2.new(0,0) end
        Stick.Position = UDim2.new(0.5, direction.X * distance, 0.5, direction.Y * distance)
        moveDir = Vector3.new(direction.X, 0, direction.Y)
    end
end))

table.insert(cons, UserInputService.InputEnded:Connect(function(input)
    if input == touchInput then
        dragging = false
        touchInput = nil
        Base.Modal = false
        Base.Visible = false
        Stick.Position = UDim2.new(0.5, 0, 0.5, 0)
        moveDir = Vector3.new(0, 0, 0)
    end
end))

table.insert(cons, RunService.RenderStepped:Connect(function()
    if scriptEnabled and dragging and player.Character and player.Character:FindFirstChild("Humanoid") and camera then
        local humanoid = player.Character.Humanoid
        if moveDir.Magnitude > 0 then
            local cameraLook = camera.CFrame.LookVector
            local forward = Vector3.new(cameraLook.X, 0, cameraLook.Z).Unit
            local right = Vector3.new(camera.CFrame.RightVector.X, 0, camera.CFrame.RightVector.Z).Unit
            local relativeMoveVector = (right * moveDir.X) + (forward * -moveDir.Z)
            humanoid:Move(relativeMoveVector, false)
        else
            humanoid:Move(Vector3.new(0, 0, 0), false)
        end
    end
end))

local function onChatted(msg)
    local lowerMsg = string.lower(msg)
    if lowerMsg == "-disablejoy" then
        scriptEnabled = false
        dragging = false
        Base.Modal = false
        Base.Visible = false
        moveDir = Vector3.new(0, 0, 0)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:Move(Vector3.new(), false)
        end
    elseif lowerMsg == "-enablejoy" then
        scriptEnabled = true
    elseif lowerMsg == "-closejoy" then
        for _, connection in ipairs(cons) do
            if connection then connection:Disconnect() end
        end
        cons = {}
        if MainGui then MainGui:Destroy() end
    end
end
table.insert(cons, player.Chatted:Connect(onChatted))