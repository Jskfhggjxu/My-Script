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
-- 天才核心：创建不灭的 FakeTouchGui 挡箭牌，拦截穿透
-- ==========================================
local function setupShieldGui()
    local playerGui = player:WaitForChild("PlayerGui", 10)
    if not playerGui then return end
    
    local touchGui = playerGui:WaitForChild("TouchGui", 10)
    if touchGui then
        -- 克隆它成为绝对挡箭牌
        local fakeTouchGui = playerGui:FindFirstChild("FakeTouchGui")
        if fakeTouchGui then fakeTouchGui:Destroy() end
        
        fakeTouchGui = touchGui:Clone()
        fakeTouchGui.Name = "FakeTouchGui"
        fakeTouchGui.ResetOnSpawn = false
        fakeTouchGui.DisplayOrder = 999 -- 刚好压在核心 UI 之下，但高于 3D 渲染视图
        
        -- 清理影子中的组件
        local fakeControl = fakeTouchGui:FindFirstChild("TouchControlFrame")
        if fakeControl then
            -- 移除影子跳跃键
            local fakeJump = fakeControl:FindFirstChild("JumpButton")
            if fakeJump then fakeJump:Destroy() end
            
            -- 让影子摇杆完全透明且铺满左下角，专门作为防视角的吸能海绵
            local fakeThumbstick = fakeControl:FindFirstChild("DynamicThumbstickFrame")
            if fakeThumbstick then
                fakeThumbstick.BackgroundTransparency = 1
                fakeThumbstick.Visible = true 
                fakeThumbstick.Active = true -- 核心所在：用它的 Active 挡住视角穿透！
                -- 确保它能完全罩住我们的自定义左侧操控区
                fakeThumbstick.Size = UDim2.new(0.4, 0, 0.6, 0)
                fakeThumbstick.Position = UDim2.new(0, 0, 0.4, 0)
            end
        end
        fakeTouchGui.Parent = playerGui
    end
end

-- 执行屏蔽盾挂载
setupShieldGui()

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
JoystickArea.Active = false -- 设为 false，防止其把聊天框点按功能卡死
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

table.insert(cons, workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    camera = workspace.CurrentCamera
end))

local function isInputInZone(pos)
    local absPos = JoystickArea.AbsolutePosition
    local absSize = JoystickArea.AbsoluteSize
    return pos.X >= absPos.X and pos.X <= (absPos.X + absSize.X)
       and pos.Y >= absPos.Y and pos.Y <= (absPos.Y + absSize.Y)
end

-- ==========================================
-- 3. 基于纯对象比对的丝滑触摸拦截
-- ==========================================
table.insert(cons, UserInputService.TouchStarted:Connect(function(touch, gameProcessed)
    if not scriptEnabled or dragging then return end
    if gameProcessed then return end -- 确保聊天框点击能被完美忽略
    
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
-- 4. 聊天指令与影子卸载清理逻辑
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
        local pGui = player:FindFirstChild("PlayerGui")
        if pGui and pGui:FindFirstChild("FakeTouchGui") then pGui.FakeTouchGui:Destroy() end
        if MainGui then MainGui:Destroy() end
    end
end
table.insert(cons, player.Chatted:Connect(onChatted))