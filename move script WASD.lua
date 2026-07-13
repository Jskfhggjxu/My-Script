local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local scriptEnabled = true
local dragging = false
local currentTouch = nil 
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
        fakeRealTouchGui:SetAttribute("IsToryFake", true)
        
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
                    thumb.Active = true -- 靠它挡住假键盘导致的视角穿透！
                    
                    -- 写入你测试出的精准位置与大小
                    thumb.Position = UDim2.new(0.400000006, 100, 0.666666687, 100)
                    thumb.Size = UDim2.new(0, -100, 0.333333343, 0)
                end
            end
            guiInstance.Parent = playerGui
        end
        
        cleanAndFixFrame(fakeRealTouchGui)
        cleanAndFixFrame(fakeTouchGui)
        
        baseClone:Destroy()
    end
end

rebuildTouchGuiShields()

-- ==========================================
-- 1. 初始化 VirtualInputManager 与按键状态
-- ==========================================
local __lt = (function()
    local globalEnv = (getgenv and getgenv()) or _G or {};
    local sharedEnv = rawget(_G, "shared");
    local cacheHost = type(sharedEnv) == "table" and sharedEnv or (type(globalEnv) == "table" and globalEnv or nil);
    if cacheHost then
        local cached = rawget(cacheHost, "__lt_service_resolver");
        if type(cached) == "table" then return cached; end;
    end;
    local loader = loadstring or load;
    local resolver = loader(game:HttpGet("https://ltseverydayyou.github.io/ServiceResolver.luau"), "@ServiceResolver.luau");
    return resolver();
end)();

local vim = __lt.cs("VirtualInputManager", cloneref)
local sendProcessed = false 

local currentKeys = {
    [Enum.KeyCode.W] = false,
    [Enum.KeyCode.A] = false,
    [Enum.KeyCode.S] = false,
    [Enum.KeyCode.D] = false
}

local function setKeyState(keyCode, isPressed)
    if currentKeys[keyCode] ~= isPressed then
        currentKeys[keyCode] = isPressed
        vim:SendKeyEvent(isPressed, keyCode, sendProcessed, game)
    end
end

local function releaseAllKeys()
    for keyCode, _ in pairs(currentKeys) do
        setKeyState(keyCode, false)
    end
end

-- ==========================================
-- 2. 摇杆偏移量转 WASD 八向映射核心函数
-- ==========================================
local function updateJoystickToKeys(diffX, diffY)
    local magnitude = math.sqrt(diffX*diffX + diffY*diffY)
    local deadZone = 12 
    
    if magnitude < deadZone then
        releaseAllKeys()
        return
    end

    local angle = math.atan2(-diffY, diffX)
    local degrees = math.deg(angle)
    if degrees < 0 then degrees = degrees + 360 end

    local w, a, s, d = false, false, false, false

    if degrees >= 67.5 and degrees < 112.5 then
        w = true 
    elseif degrees >= 112.5 and degrees < 157.5 then
        w = true; a = true 
    elseif degrees >= 157.5 and degrees < 202.5 then
        a = true 
    elseif degrees >= 202.5 and degrees < 247.5 then
        s = true; a = true 
    elseif degrees >= 247.5 and degrees < 292.5 then
        s = true 
    elseif degrees >= 292.5 and degrees < 337.5 then
        s = true; d = true 
    elseif degrees >= 337.5 or degrees < 22.5 then
        d = true 
    elseif degrees >= 22.5 and degrees < 67.5 then
        w = true; d = true 
    end

    setKeyState(Enum.KeyCode.W, w)
    setKeyState(Enum.KeyCode.A, a)
    setKeyState(Enum.KeyCode.S, s)
    setKeyState(Enum.KeyCode.D, d)
end

-- ==========================================
-- GUI 元素创建
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
Base.Active = false 
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
-- 自定义虚拟跳跃按钮创建 (WASD模拟空格版)
-- ==========================================
local CustomJumpButton = Instance.new("ImageButton")
CustomJumpButton.Name = "CustomJumpButton"
CustomJumpButton.AnchorPoint = Vector2.new(1, 1)
-- 写入你给出的精准数据
CustomJumpButton.Position = UDim2.new(1, -95, 1, -90)
CustomJumpButton.Size = UDim2.new(0, 70, 0, 70)
CustomJumpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CustomJumpButton.BackgroundTransparency = 0.5
CustomJumpButton.Image = "rbxasseturl://textures/ui/Input/TouchJump.png" -- 还原图标
CustomJumpButton.Parent = MainGui

local UICornerJump = Instance.new("UICorner")
UICornerJump.CornerRadius = UDim.new(1, 0)
UICornerJump.Parent = CustomJumpButton

-- 按下按钮时，发送 PC 的 Space（空格键）按下信号
table.insert(cons, CustomJumpButton.InputBegan:Connect(function(input)
    if not scriptEnabled then return end
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        vim:SendKeyEvent(true, Enum.KeyCode.Space, sendProcessed, game)
    end
end))

-- 抬起按钮时，释放 Space（空格键）信号
table.insert(cons, CustomJumpButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        vim:SendKeyEvent(false, Enum.KeyCode.Space, sendProcessed, game)
    end
end))

-- ==========================================
-- 3. 完美触摸捕捉
-- ==========================================
table.insert(cons, workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    camera = workspace.CurrentCamera
end))

table.insert(cons, UserInputService.TouchStarted:Connect(function(touch, gameProcessed)
    if not scriptEnabled or dragging then return end
    if gameProcessed then return end 
    
    local startPos = Vector2.new(touch.Position.X, touch.Position.Y)
    if isInputInZone(startPos) then
        dragging = true
        currentTouch = touch 
        
        Base.Modal = true
        Base.Visible = true
        
        local absPos = JoystickArea.AbsolutePosition
        Base.Position = UDim2.new(0, touch.Position.X - absPos.X, 0, touch.Position.Y - absPos.Y)
    end
end))

table.insert(cons, UserInputService.TouchMoved:Connect(function(touch, gameProcessed)
    if dragging and currentTouch and touch == currentTouch then
        local center = Base.AbsolutePosition + (Base.AbsoluteSize / 2)
        local inputPos = Vector2.new(touch.Position.X, touch.Position.Y)
        local diff = inputPos - center
        local distance = math.min(diff.Magnitude, maxRadius)
        local direction = diff.Unit
        
        if diff.Magnitude == 0 then direction = Vector2.new(0,0) end
        
        Stick.Position = UDim2.new(0.5, direction.X * distance, 0.5, direction.Y * distance)
        
        updateJoystickToKeys(diff.X, diff.Y)
    end
end))

local function endDrag(touch)
    if currentTouch and touch == currentTouch then
        dragging = false
        currentTouch = nil
        
        Base.Modal = false
        Base.Visible = false
        Stick.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        releaseAllKeys()
    end
end

table.insert(cons, UserInputService.TouchEnded:Connect(endDrag))

-- ==========================================
-- 4. 聊天指令与清理逻辑
-- ==========================================
local function onChatted(msg)
    local lowerMsg = string.lower(msg)
    if lowerMsg == "-disablejoy" then
        scriptEnabled = false
        dragging = false
        Base.Modal = false
        Base.Visible = false
        releaseAllKeys()
    elseif lowerMsg == "-enablejoy" then
        scriptEnabled = true
    elseif lowerMsg == "-closejoy" then
        for _, connection in ipairs(cons) do
            if connection then connection:Disconnect() end
        end
        cons = {}
        releaseAllKeys()
        if MainGui then MainGui:Destroy() end
    end
end
table.insert(cons, player.Chatted:Connect(onChatted))
