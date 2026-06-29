--========================================================
-- Bring Universal (Public Safe Edition)
--========================================================

if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.1)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- 1. 核心服务器环境验证（仅检测正确的服务器远程事件）
local serverEvent = ReplicatedStorage:FindFirstChild("01_server")
if not serverEvent then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "NOTE",
            Text = "Youre not on just a baseplate execute script!",
            Duration = 5
        })
    end)
    return -- 验证失败，直接拦截并终止后面所有逻辑
end

local lp = Players.LocalPlayer
local isProcessing = false
local originalPos = nil         

-- 工具选择全局变量
local SelectedToolName = nil 
local RefreshToolListFunc = nil

-- 统一专属服务器强制重置函数
local function ForceServerReset()
    pcall(function()
        if serverEvent then
            serverEvent:FireServer("cmd", "-re")
        end
    end)
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
                    if n:find("^"..name) or d:find("^"..name) then return a end
                end
            end
        end
    end
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

    -- 精准锁定本次要使用的工具实例
    local TargetToolInstance = nil
    if SelectedToolName then
        TargetToolInstance = (char:FindFirstChild(SelectedToolName) and char[SelectedToolName]:IsA("Tool") and char[SelectedToolName]) or 
                             (backpack and backpack:FindFirstChild(SelectedToolName) and backpack[SelectedToolName]:IsA("Tool") and backpack[SelectedToolName])
    end
    
    if not TargetToolInstance then
        TargetToolInstance = char:FindFirstChildOfClass("Tool") or (backpack and backpack:FindFirstChildOfClass("Tool"))
    end
    
    if not TargetToolInstance then return false end

    char.Archivable = true
    local Clone = char:Clone()
    task.wait(0.05)
    lp.Character = Clone
    lp.Character = char
    
    if hrp then hrp.AssemblyLinearVelocity = Vector3.new(0,0,0) end
    if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):Destroy() end
    task.wait(0.05)
    
    local Humanoid = Instance.new("Humanoid")
    Humanoid.Parent = char
    task.wait(0.05)
    
    TargetToolInstance.Grip = CFrame.new(0, 0, 0)
    TargetToolInstance.Parent = char 
    
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
        
        if not TargetToolInstance or not TargetToolInstance:IsDescendantOf(game) then break end
        if TargetToolInstance.Parent ~= char and TargetToolInstance.Parent ~= targetchar and TargetToolInstance.Parent ~= workspace then
            break 
        end

        if not hasInteracted and (os.clock() - startTime > 5.0) then
            break
        end

        if targetchar and targethead and hrp then
            if TargetToolInstance.Parent == targetchar and not hasInteracted then
                hasInteracted = true
                interactTime = os.clock()
            end

            if hasInteracted then
                -- 【纯净 BRING 模式】：持续 2 秒锁死在 originalPos
                if originalPos then
                    hrp.CFrame = originalPos
                    pcall(function()
                        targethead.CFrame = originalPos
                        targethead.AssemblyLinearVelocity = Vector3.new(0, 0, 0) 
                    end)
                end
                if os.clock() - interactTime > 2.0 then break end
            else
                -- HRP 经典逆向偏移秒抓算法
                hrp.CFrame = targethead.CFrame * CFrame.new(-1.4, 0, 0)
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        else
            break
        end
    until TargetToolInstance.Parent == workspace

    if noclipConn then noclipConn:Disconnect() end
    
    lp.Character = nil
    ForceServerReset()
    return true
end 

local function ExecuteSequence(targetName)
    if isProcessing then return end
    local char = lp.Character
    if not char or not char:FindFirstChildOfClass("Humanoid") then return end
    if char.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then return "NOT R6" end
    
    isProcessing = true
    local hrp = char:FindFirstChild("HumanoidRootPart")
    originalPos = hrp and hrp.CFrame or originalPos

    FlingUser(targetName)
    
    lp.CharacterAdded:Wait()
    task.wait(0.15) 
    
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and originalPos then
        lp.Character.HumanoidRootPart.CFrame = originalPos
    end
    
    if RefreshToolListFunc then RefreshToolListFunc() end
    isProcessing = false
    return "SUCCESS"
end

--========================================================
-- GUI 控制板
--========================================================
local uiName = "BringGuiUniversalPublic"
if CoreGui:FindFirstChild(uiName) then CoreGui[uiName]:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = uiName
ScreenGui.ResetOnSpawn = false

-- 主面板
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 125)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -62)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 2

-- 左侧工具菜单面板
local ToolMenuFrame = Instance.new("Frame", MainFrame)
ToolMenuFrame.Size = UDim2.new(0, 130, 1, 0)
ToolMenuFrame.Position = UDim2.new(0, -135, 0, 0)
ToolMenuFrame.BackgroundColor3 = Color3.fromRGB(12, 16, 28)
ToolMenuFrame.BorderSizePixel = 0
ToolMenuFrame.Visible = false
ToolMenuFrame.ZIndex = 2

local MenuTopBar = Instance.new("Frame", ToolMenuFrame)
MenuTopBar.Size = UDim2.new(1, 0, 0, 25)
MenuTopBar.BackgroundColor3 = Color3.fromRGB(8, 12, 20)
MenuTopBar.BorderSizePixel = 0
MenuTopBar.ZIndex = 2

local MenuTitle = Instance.new("TextLabel", MenuTopBar)
MenuTitle.Size = UDim2.new(1, 0, 1, 0)
MenuTitle.BackgroundTransparency = 1
MenuTitle.Text = "  Select Tool"
MenuTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
MenuTitle.Font = Enum.Font.Code
MenuTitle.TextSize = 12
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.ZIndex = 3

local ToolScroll = Instance.new("ScrollingFrame", ToolMenuFrame)
ToolScroll.Size = UDim2.new(1, -6, 1, -31)
ToolScroll.Position = UDim2.new(0, 3, 0, 28)
ToolScroll.BackgroundTransparency = 1
ToolScroll.BorderSizePixel = 0
ToolScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ToolScroll.ScrollBarThickness = 3
ToolScroll.ZIndex = 3

local ScrollLayout = Instance.new("UIListLayout", ToolScroll)
ScrollLayout.Padding = UDim.new(0, 3)
ScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 主面板顶栏
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 25)
TopBar.BackgroundColor3 = Color3.fromRGB(10, 14, 25)
TopBar.ZIndex = 2

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -85, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Bring Script Universal"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 25, 1, 0)
CloseBtn.Position = UDim2.new(1, -25, 0, 0)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.ZIndex = 3

local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Size = UDim2.new(0, 25, 1, 0)
MinBtn.Position = UDim2.new(1, -50, 0, 0)
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.ZIndex = 3

local PlusBtn = Instance.new("TextButton", TopBar)
PlusBtn.Size = UDim2.new(0, 25, 1, 0)
PlusBtn.Position = UDim2.new(1, -75, 0, 0)
PlusBtn.Text = "+"
PlusBtn.BackgroundColor3 = Color3.fromRGB(35, 75, 45)
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.ZIndex = 3

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, 0, 1, -25)
ContentFrame.Position = UDim2.new(0, 0, 0, 25)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ZIndex = 2

local TargetInput = Instance.new("TextBox", ContentFrame)
TargetInput.Size = UDim2.new(0.8, 0, 0, 30)
TargetInput.Position = UDim2.new(0.1, 0, 0, 15)
TargetInput.PlaceholderText = "Target Name"
TargetInput.BackgroundColor3 = Color3.fromRGB(25, 30, 50)
TargetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetInput.Text = ""
TargetInput.ZIndex = 3

local MainBtn = Instance.new("TextButton", ContentFrame)
MainBtn.Size = UDim2.new(0.8, 0, 0, 30)
MainBtn.Position = UDim2.new(0.1, 0, 0, 55)
MainBtn.BackgroundColor3 = Color3.fromRGB(35, 90, 35)
MainBtn.Text = "EXECUTE BRING"
MainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainBtn.Font = Enum.Font.Code
MainBtn.ZIndex = 3

--========================================================
-- 置顶说明书面板（确保覆盖在最前）
--========================================================
local InfoFrame = Instance.new("Frame", ScreenGui)
InfoFrame.Size = UDim2.new(0, 280, 0, 230)
InfoFrame.Position = UDim2.new(0.5, -140, 0.5, -180)
InfoFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
InfoFrame.BorderSizePixel = 0
InfoFrame.Active = true
InfoFrame.Draggable = true
InfoFrame.ZIndex = 10 

local InfoTopBar = Instance.new("Frame", InfoFrame)
InfoTopBar.Size = UDim2.new(1, 0, 0, 25)
InfoTopBar.BackgroundColor3 = Color3.fromRGB(12, 16, 28)
InfoTopBar.BorderSizePixel = 0
InfoTopBar.ZIndex = 10

local InfoTitle = Instance.new("TextLabel", InfoTopBar)
InfoTitle.Size = UDim2.new(1, -30, 1, 0)
InfoTitle.Position = UDim2.new(0, 8, 0, 0)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "Instructions"
InfoTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
InfoTitle.Font = Enum.Font.Code
InfoTitle.TextSize = 13
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.ZIndex = 11

local InfoCloseBtn = Instance.new("TextButton", InfoTopBar)
InfoCloseBtn.Size = UDim2.new(0, 25, 1, 0)
InfoCloseBtn.Position = UDim2.new(1, -25, 0, 0)
InfoCloseBtn.Text = "X"
InfoCloseBtn.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
InfoCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoCloseBtn.Font = Enum.Font.Code
InfoCloseBtn.ZIndex = 11

local InfoScroll = Instance.new("ScrollingFrame", InfoFrame)
InfoScroll.Size = UDim2.new(1, -16, 1, -35)
InfoScroll.Position = UDim2.new(0, 8, 0, 30)
InfoScroll.BackgroundTransparency = 1
InfoScroll.BorderSizePixel = 0
InfoScroll.CanvasSize = UDim2.new(0, 0, 0, 240)
InfoScroll.ScrollBarThickness = 4
InfoScroll.ZIndex = 10

local InfoText = Instance.new("TextLabel", InfoScroll)
InfoText.Size = UDim2.new(1, 0, 1, 0)
InfoText.BackgroundTransparency = 1
InfoText.TextColor3 = Color3.fromRGB(240, 240, 240)
InfoText.Font = Enum.Font.Code
InfoText.TextSize = 12
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.RichText = true
InfoText.ZIndex = 11

InfoText.Text = [[thx using bring script, Instructions:
1. Must need R6
2. Must need tool
3. dont use script if you reanimating

How to solve these problems?
1. Say -r6 in chat bar
2. Buy tools in topbar buttons shop
<font size="10" color="rgb(150,150,150)">  # AFK every 10 minutes to get 8 coins</font>
3. Deanimate]]

InfoCloseBtn.MouseButton1Click:Connect(function() InfoFrame:Destroy() end)

--========================================================
-- 侧边工具栏列表动态渲染
--========================================================
RefreshToolListFunc = function()
    for _, item in ipairs(ToolScroll:GetChildren()) do
        if item:IsA("TextButton") then item:Destroy() end
    end
    
    local foundTools = {}
    local function scan(parent)
        if not parent then return end
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("Tool") and not foundTools[obj.Name] then
                foundTools[obj.Name] = true
            end
        end
    end
    
    scan(lp:FindFirstChild("Backpack"))
    scan(lp.Character)
    
    local count = 0
    for tName, _ in pairs(foundTools) do
        count = count + 1
        local tBtn = Instance.new("TextButton", ToolScroll)
        tBtn.Size = UDim2.new(1, 0, 0, 22)
        tBtn.Font = Enum.Font.Code
        tBtn.TextSize = 11
        tBtn.Text = tName
        tBtn.ZIndex = 4
        
        if SelectedToolName == tName then
            tBtn.BackgroundColor3 = Color3.fromRGB(35, 90, 45)
            tBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            tBtn.BackgroundColor3 = Color3.fromRGB(22, 27, 42)
            tBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        
        tBtn.MouseButton1Click:Connect(function()
            if SelectedToolName == tName then
                SelectedToolName = nil
            else
                SelectedToolName = tName
            end
            RefreshToolListFunc()
        end)
    end
    ToolScroll.CanvasSize = UDim2.new(0, 0, 0, count * 25)
end

--========================================================
-- UI 面板控制事件
--========================================================
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    ContentFrame.Visible = not minimized
    ToolMenuFrame.Visible = false
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 250, 0, 25), "Out", "Sine", 0.2, true)
    else
        MainFrame:TweenSize(UDim2.new(0, 250, 0, 125), "Out", "Sine", 0.2, true)
    end
end)

PlusBtn.MouseButton1Click:Connect(function()
    if minimized then return end
    ToolMenuFrame.Visible = not ToolMenuFrame.Visible
    if ToolMenuFrame.Visible then
        RefreshToolListFunc()
    end
end)

local function HandleRequest(targetName)
    if targetName == "" or isProcessing then return end
    MainBtn.Text = "PROCESSING..."
    local res = ExecuteSequence(targetName)
    if res == "NOT R6" or res == "NO TOOL" then
        MainBtn.Text = res.."!"
        task.wait(1.5)
    end
    MainBtn.Text = "EXECUTE BRING"
end

MainBtn.MouseButton1Click:Connect(function() HandleRequest(TargetInput.Text) end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
