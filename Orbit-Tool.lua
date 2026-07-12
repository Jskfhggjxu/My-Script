local UserConfig = {
    ["YeImTory"] = {
        Text = "Orbit Tool/Hat builder",
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

-- Orbit Tool System V4.4
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

if getgenv().OrbitToolsy == true then return end
getgenv().OrbitToolsy = true

local plr = Players.LocalPlayer
local chr = plr.Character
local hrp = chr and chr:WaitForChild("HumanoidRootPart")
local bp = plr:WaitForChild("Backpack")

local handles = {}
local orbitParts = {}
local movers = {}
local connections = {}
local toolNames = {}
local lastResyncTime = {}

getgenv().OrbitAccBlacklist = getgenv().OrbitAccBlacklist or {}

local offset = 8
local speed = 1
local mode = 1
local rot = 0
local toolRotSpeed = 1
local lerpSpeed = 1

local targetHRP = hrp
local targetMonitor = nil

local SETTINGS = { VelocityY = 220.290009, SimulationRadius = 2147483647 }
local lastHRPPos = nil
local hrpVel = Vector3.zero
local RESYNC_COOLDOWN = 2

local toolsEnabled = true

local function waitForHRP()
    while not hrp or not hrp.Parent do
        hrp = chr and chr:FindFirstChild("HumanoidRootPart")
        if not hrp then task.wait() end
    end
end

function setupOrbitingItem(item, handle)
    if not handle or not handle.Parent then return end
    if table.find(handles, handle) then
        cleanupTool(handle)
        task.wait()
    end

    waitForHRP()

    if item:IsA("Accessory") then
        handle.Massless = true
        handle.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        handle.CanCollide = false
        handle:BreakJoints()
        for _, w in ipairs(handle:GetChildren()) do
            if w:IsA("Weld") or w:IsA("Motor6D") then
                w:Destroy()
            end
        end
        handle.AssemblyLinearVelocity = Vector3.zero
        handle.AssemblyAngularVelocity = Vector3.zero
    end

    if item:IsA("Tool") then
        local rightArm = chr:FindFirstChild("Right Arm") or chr:FindFirstChild("RightHand")
        if rightArm then
            local grip = rightArm:FindFirstChild("RightGrip")
            if grip then grip:Destroy() end
        end
        if item.Parent ~= chr then
            item.Parent = chr
        end
    end

    connections[handle] = item.AncestryChanged:Connect(function(_, parent)
        if parent ~= chr then cleanupTool(handle) end
    end)

    table.insert(handles, handle)
    table.insert(toolNames, item.Name)
    local index = #handles
    lastResyncTime[handle] = 0

    local p = Instance.new("Part", workspace)
    p.Name = "OrbitReference_" .. item.Name
    p.Anchored = true
    p.CanCollide = false
    p.Transparency = 1
    p.Size = Vector3.new(0.2, 0.2, 0.2)
    p.Position = hrp.Position
    orbitParts[index] = p

    local av = Instance.new("BodyAngularVelocity", handle)
    av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    av.P = 1250

    local ap = Instance.new("AlignPosition", handle)
    ap.MaxForce = math.huge
    ap.MaxVelocity = math.huge
    ap.Responsiveness = 200
    ap.Enabled = true
    ap.Attachment0 = Instance.new("Attachment", handle)
    ap.Attachment1 = Instance.new("Attachment", p)

    movers[handle] = { align = ap, angular = av }
    handle.CFrame = p.CFrame

    task.defer(function()
        if handle and handle.Parent then handle.CFrame = p.CFrame end
        task.wait(0.05)
        if handle and handle.Parent then handle.CFrame = p.CFrame end
    end)
end

function setupTool(v)
    if not toolsEnabled then return end
    local h = v:FindFirstChild("Handle")
    if h then setupOrbitingItem(v, h) end
end

function setupAccessory(v)
    if getgenv().OrbitAccBlacklist[v.Name] then
        return 
    end
    local h = v:FindFirstChild("Handle")
    if h then setupOrbitingItem(v, h) end
end

function cleanupTool(h)
    local index = table.find(handles, h)
    if index then
        lastResyncTime[h] = nil
        if orbitParts[index] then orbitParts[index]:Destroy() end
        if movers[h] then
            if movers[h].align then movers[h].align:Destroy() end
            if movers[h].angular then movers[h].angular:Destroy() end
            movers[h] = nil
        end
        if connections[h] then
            connections[h]:Disconnect()
            connections[h] = nil
        end
        table.remove(orbitParts, index)
        table.remove(handles, index)
        table.remove(toolNames, index)
    end
end

function removeAllTools()
    for i = #handles, 1, -1 do
        local h = handles[i]
        local parent = h and h.Parent
        if parent and parent:IsA("Tool") then
            cleanupTool(h)
        end
    end
end

function addAllExistingTools()
    if not toolsEnabled then return end
    for _, v in ipairs(chr:GetChildren()) do
        if v:IsA("Tool") then setupTool(v) end
    end
end

local function setupTargetMonitor(targetRoot)
    if targetMonitor then targetMonitor:Disconnect(); targetMonitor = nil end
    if not targetRoot then return end
    local targetChar = targetRoot.Parent
    if targetChar and targetChar:IsA("Model") then
        targetMonitor = targetChar.AncestryChanged:Connect(function()
            if not targetChar.Parent or targetChar.Parent ~= workspace then
                targetHRP = hrp
                if targetMonitor then targetMonitor:Disconnect() end
                targetMonitor = nil
            end
        end)
    end
end

local function createButtonGUI()
    if getgenv().OrbitUI then getgenv().OrbitUI:Destroy() end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FeOrbitUI"
    screenGui.ResetOnSpawn = false
    pcall(function() screenGui.Parent = CoreGui end)
    if not screenGui.Parent then screenGui.Parent = plr:WaitForChild("PlayerGui") end
    getgenv().OrbitUI = screenGui

    local BASE_WIDTH = 210
    local ROW_HEIGHT = 28
    local PADDING_X = 8
    local PADDING_Y = 6
    local TITLEBAR_HEIGHT = 24
    local minimized = false
    local guiVisible = true

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    mainFrame.BackgroundTransparency = 0.65
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.ClipsDescendants = true
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 6)

    local titleBar = Instance.new("Frame", mainFrame)
    titleBar.Size = UDim2.new(1, 0, 0, TITLEBAR_HEIGHT)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BackgroundTransparency = 0.5
    titleBar.BorderSizePixel = 0
    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 6)

    local title = Instance.new("TextLabel", titleBar)
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Position = UDim2.new(0, 8, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Orbit Ctrl V4.4"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13

    local blMenu = Instance.new("Frame", screenGui)
    blMenu.Size = UDim2.new(0, 280, 0, 350)
    blMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
    blMenu.AnchorPoint = Vector2.new(0.5, 0.5)
    blMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    blMenu.BackgroundTransparency = 0.1
    blMenu.BorderSizePixel = 0
    blMenu.Visible = false
    blMenu.Active = true
    blMenu.Draggable = true
    Instance.new("UICorner", blMenu).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", blMenu).Color = Color3.fromRGB(60, 60, 60)

    local blTitleBar = Instance.new("Frame", blMenu)
    blTitleBar.Size = UDim2.new(1, 0, 0, 30)
    blTitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    blTitleBar.BorderSizePixel = 0
    Instance.new("UICorner", blTitleBar).CornerRadius = UDim.new(0, 8)

    local blTitle = Instance.new("TextLabel", blTitleBar)
    blTitle.Size = UDim2.new(1, -40, 1, 0)
    blTitle.Position = UDim2.new(0, 12, 0, 0)
    blTitle.BackgroundTransparency = 1
    blTitle.Text = "Accs blacklist"
    blTitle.TextColor3 = Color3.new(1, 1, 1)
    blTitle.Font = Enum.Font.GothamBold
    blTitle.TextSize = 13
    blTitle.TextXAlignment = Enum.TextXAlignment.Left

    local blCloseBtn = Instance.new("TextButton", blTitleBar)
    blCloseBtn.Size = UDim2.new(0, 22, 0, 22)
    blCloseBtn.Position = UDim2.new(1, -26, 0.5, -11)
    blCloseBtn.Text = "✕"
    blCloseBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
    blCloseBtn.TextColor3 = Color3.new(1, 1, 1)
    blCloseBtn.Font = Enum.Font.GothamBold
    blCloseBtn.TextSize = 11
    Instance.new("UICorner", blCloseBtn).CornerRadius = UDim.new(0, 4)
    blCloseBtn.MouseButton1Click:Connect(function() blMenu.Visible = false end)

    local blScroll = Instance.new("ScrollingFrame", blMenu)
    blScroll.Size = UDim2.new(1, -16, 1, -42)
    blScroll.Position = UDim2.new(0, 8, 0, 36)
    blScroll.BackgroundTransparency = 1
    blScroll.BorderSizePixel = 0
    blScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    blScroll.ScrollBarThickness = 4

    local blLayout = Instance.new("UIListLayout", blScroll)
    blLayout.Padding = UDim.new(0, 4)
    blLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function refreshBlacklistMenu()
        for _, child in ipairs(blScroll:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end
        
        if not chr then return end
        
        for _, child in ipairs(chr:GetChildren()) do
            if child:IsA("Accessory") then
                local accName = child.Name
                
                local itemRow = Instance.new("Frame", blScroll)
                itemRow.Size = UDim2.new(1, -4, 0, 32)
                itemRow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                itemRow.BorderSizePixel = 0
                Instance.new("UICorner", itemRow).CornerRadius = UDim.new(0, 4)

                local nameLabel = Instance.new("TextLabel", itemRow)
                nameLabel.Size = UDim2.new(1, -70, 1, 0)
                nameLabel.Position = UDim2.new(0, 8, 0, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = accName
                nameLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
                nameLabel.Font = Enum.Font.Gotham
                nameLabel.TextSize = 11
                nameLabel.TextXAlignment = Enum.TextXAlignment.Left
                nameLabel.ClipsDescendants = true

                local statusBtn = Instance.new("TextButton", itemRow)
                statusBtn.Size = UDim2.new(0, 55, 0, 22)
                statusBtn.Position = UDim2.new(1, -60, 0.5, -11)
                statusBtn.Font = Enum.Font.GothamBold
                statusBtn.TextSize = 10
                Instance.new("UICorner", statusBtn).CornerRadius = UDim.new(0, 4)

                local function updateBtnStyle()
                    if getgenv().OrbitAccBlacklist[accName] then
                        statusBtn.Text = "blacked"
                        statusBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
                        statusBtn.TextColor3 = Color3.new(1, 1, 1)
                    else
                        statusBtn.Text = "Normally"
                        statusBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
                        statusBtn.TextColor3 = Color3.new(1, 1, 1)
                    end
                end

                updateBtnStyle()

                statusBtn.MouseButton1Click:Connect(function()
                    if getgenv().OrbitAccBlacklist[accName] then
                        getgenv().OrbitAccBlacklist[accName] = nil
                    else
                        getgenv().OrbitAccBlacklist[accName] = true
                    end
                    updateBtnStyle()
                end)
            end
        end
        blScroll.CanvasSize = UDim2.new(0, 0, 0, blLayout.AbsoluteContentSize.Y + 10)
    end

    local minimizeBtn = Instance.new("TextButton", titleBar)
    minimizeBtn.Size = UDim2.new(0, 20, 0, 20)
    minimizeBtn.Position = UDim2.new(1, -46, 0.5, -10)
    minimizeBtn.Text = "−"
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    minimizeBtn.TextColor3 = Color3.new(1,1,1)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.TextSize = 16
    Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 4)
    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        minimizeBtn.Text = minimized and "＋" or "−"
        content.Visible = not minimized
        mainFrame.Size = UDim2.new(0, BASE_WIDTH, 0, minimized and TITLEBAR_HEIGHT or (TITLEBAR_HEIGHT + contentRequiredHeight))
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    end)

    local closeBtn = Instance.new("TextButton", titleBar)
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -24, 0.5, -10)
    closeBtn.Text = "✕"
    closeBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 12
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)
    closeBtn.MouseButton1Click:Connect(function()
        guiVisible = false
        mainFrame.Visible = false
        blMenu.Visible = false
    end)

    local content = Instance.new("Frame", mainFrame)
    content.Name = "Content"
    content.Position = UDim2.new(0, 0, 0, TITLEBAR_HEIGHT)
    content.Size = UDim2.new(1, 0, 1, -TITLEBAR_HEIGHT)
    content.BackgroundTransparency = 1

    local yPos = 2

    local function addInputRow(label, getFunc, setFunc, step, minValue, allowNegative)
        local row = Instance.new("Frame", content)
        row.Size = UDim2.new(1, -2*PADDING_X, 0, ROW_HEIGHT)
        row.Position = UDim2.new(0, PADDING_X, 0, yPos)
        row.BackgroundTransparency = 1

        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(0, 55, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local btnMinus = Instance.new("TextButton", row)
        btnMinus.Size = UDim2.new(0, 22, 0, 20)
        btnMinus.Position = UDim2.new(0, 58, 0.5, -10)
        btnMinus.Text = "−"
        btnMinus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btnMinus.TextColor3 = Color3.new(1,1,1)
        btnMinus.Font = Enum.Font.GothamBold
        btnMinus.TextSize = 14
        Instance.new("UICorner", btnMinus).CornerRadius = UDim.new(0,4)

        local valueBox = Instance.new("TextBox", row)
        valueBox.Size = UDim2.new(0, 70, 0, 20)
        valueBox.Position = UDim2.new(0, 83, 0.5, -10)
        valueBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        valueBox.TextColor3 = Color3.new(1,1,1)
        valueBox.Font = Enum.Font.Code
        valueBox.TextSize = 11
        valueBox.Text = tostring(getFunc())
        Instance.new("UICorner", valueBox).CornerRadius = UDim.new(0,4)

        local btnPlus = Instance.new("TextButton", row)
        btnPlus.Size = UDim2.new(0, 22, 0, 20)
        btnPlus.Position = UDim2.new(0, 156, 0.5, -10)
        btnPlus.Text = "+"
        btnPlus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btnPlus.TextColor3 = Color3.new(1,1,1)
        btnPlus.Font = Enum.Font.GothamBold
        btnPlus.TextSize = 14
        Instance.new("UICorner", btnPlus).CornerRadius = UDim.new(0,4)

        local function updateValue(newVal)
            if minValue and newVal < minValue then newVal = minValue end
            if not allowNegative and newVal < 0 then newVal = 0 end
            setFunc(newVal)
            valueBox.Text = tostring(newVal)
        end

        btnMinus.MouseButton1Click:Connect(function() updateValue(getFunc() - step) end)
        btnPlus.MouseButton1Click:Connect(function() updateValue(getFunc() + step) end)
        valueBox.FocusLost:Connect(function()
            local num = tonumber(valueBox.Text)
            if num ~= nil then updateValue(num) else valueBox.Text = tostring(getFunc()) end
        end)

        yPos = yPos + ROW_HEIGHT
    end

    addInputRow("Distance", function() return offset end, function(v) offset = v end, 1, 1, true)
    addInputRow("Orbit speed", function() return speed end, function(v) speed = v end, 0.5, nil, true)
    addInputRow("Spin speed", function() return toolRotSpeed end, function(v) toolRotSpeed = v end, 0.5, nil, true)
    addInputRow("Smoothness", function() return lerpSpeed end, function(v) lerpSpeed = v end, 0.5, 0.1, true)

    local modeRow = Instance.new("Frame", content)
    modeRow.Size = UDim2.new(1, -2*PADDING_X, 0, ROW_HEIGHT)
    modeRow.Position = UDim2.new(0, PADDING_X, 0, yPos)
    modeRow.BackgroundTransparency = 1

    local modeLbl = Instance.new("TextLabel", modeRow)
    modeLbl.Size = UDim2.new(0, 55, 1, 0)
    modeLbl.BackgroundTransparency = 1
    modeLbl.Text = "Modes"
    modeLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    modeLbl.Font = Enum.Font.Gotham
    modeLbl.TextSize = 11
    modeLbl.TextXAlignment = Enum.TextXAlignment.Left

    local modeMinus = Instance.new("TextButton", modeRow)
    modeMinus.Size = UDim2.new(0, 22, 0, 20)
    modeMinus.Position = UDim2.new(0, 58, 0.5, -10)
    modeMinus.Text = "−"
    modeMinus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    modeMinus.TextColor3 = Color3.new(1,1,1)
    modeMinus.Font = Enum.Font.GothamBold
    modeMinus.TextSize = 14
    Instance.new("UICorner", modeMinus).CornerRadius = UDim.new(0,4)

    local modeBox = Instance.new("TextBox", modeRow)
    modeBox.Size = UDim2.new(0, 70, 0, 20)
    modeBox.Position = UDim2.new(0, 83, 0.5, -10)
    modeBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    modeBox.TextColor3 = Color3.new(1,1,1)
    modeBox.Font = Enum.Font.Code
    modeBox.TextSize = 11
    modeBox.Text = tostring(mode)
    Instance.new("UICorner", modeBox).CornerRadius = UDim.new(0,4)

    local modePlus = Instance.new("TextButton", modeRow)
    modePlus.Size = UDim2.new(0, 22, 0, 20)
    modePlus.Position = UDim2.new(0, 156, 0.5, -10)
    modePlus.Text = "+"
    modePlus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    modePlus.TextColor3 = Color3.new(1,1,1)
    modePlus.Font = Enum.Font.GothamBold
    modePlus.TextSize = 14
    Instance.new("UICorner", modePlus).CornerRadius = UDim.new(0,4)

    local function updateMode(newVal)
        mode = newVal
        modeBox.Text = tostring(mode)
    end

    modeMinus.MouseButton1Click:Connect(function() updateMode(mode - 1) end)
    modePlus.MouseButton1Click:Connect(function() updateMode(mode + 1) end)
    modeBox.FocusLost:Connect(function()
        local num = tonumber(modeBox.Text)
        if num ~= nil then updateMode(num) else modeBox.Text = tostring(mode) end
    end)

    yPos = yPos + ROW_HEIGHT

    local targetRow = Instance.new("Frame", content)
    targetRow.Size = UDim2.new(1, -2*PADDING_X, 0, ROW_HEIGHT)
    targetRow.Position = UDim2.new(0, PADDING_X, 0, yPos)
    targetRow.BackgroundTransparency = 1

    local targetInput = Instance.new("TextBox", targetRow)
    targetInput.Size = UDim2.new(0, 90, 0, 20)
    targetInput.Position = UDim2.new(0, 0, 0.5, -10)
    targetInput.BackgroundColor3 = Color3.fromRGB(40,40,40)
    targetInput.TextColor3 = Color3.new(1,1,1)
    targetInput.PlaceholderText = "display/user name"
    targetInput.PlaceholderColor3 = Color3.fromRGB(150,150,150)
    targetInput.Font = Enum.Font.Code
    targetInput.TextSize = 11
    targetInput.Text = ""
    Instance.new("UICorner", targetInput).CornerRadius = UDim.new(0,4)

    local btnLock = Instance.new("TextButton", targetRow)
    btnLock.Size = UDim2.new(0, 40, 0, 20)
    btnLock.Position = UDim2.new(0, 94, 0.5, -10)
    btnLock.Text = "lock plr"
    btnLock.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
    btnLock.TextColor3 = Color3.new(0,0,0)
    btnLock.Font = Enum.Font.GothamBold
    btnLock.TextSize = 10
    Instance.new("UICorner", btnLock).CornerRadius = UDim.new(0,4)

    local btnSelf = Instance.new("TextButton", targetRow)
    btnSelf.Size = UDim2.new(0, 40, 0, 20)
    btnSelf.Position = UDim2.new(0, 138, 0.5, -10)
    btnSelf.Text = "lock self"
    btnSelf.BackgroundColor3 = Color3.fromRGB(80,80,80)
    btnSelf.TextColor3 = Color3.new(1,1,1)
    btnSelf.Font = Enum.Font.Gotham
    btnSelf.TextSize = 10
    Instance.new("UICorner", btnSelf).CornerRadius = UDim.new(0,4)

    btnLock.MouseButton1Click:Connect(function()
        local name = targetInput.Text
        if name == "" then return end
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():find(name:lower(), 1, true) or (p.DisplayName and p.DisplayName:lower():find(name:lower(), 1, true)) then
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    targetHRP = p.Character.HumanoidRootPart
                    setupTargetMonitor(targetHRP)
                    return
                end
            end
        end
    end)
    btnSelf.MouseButton1Click:Connect(function()
        targetHRP = hrp
        if targetMonitor then targetMonitor:Disconnect(); targetMonitor = nil end
    end)

    yPos = yPos + ROW_HEIGHT

    local row1 = Instance.new("Frame", content)
    row1.Size = UDim2.new(1, -2*PADDING_X, 0, 28)
    row1.Position = UDim2.new(0, PADDING_X, 0, yPos)
    row1.BackgroundTransparency = 1

    local btnToolsToggle = Instance.new("TextButton", row1)
    btnToolsToggle.Size = UDim2.new(0, 60, 1, 0)
    btnToolsToggle.Text = toolsEnabled and "use tool:on" or "use tool:off"
    btnToolsToggle.BackgroundColor3 = toolsEnabled and Color3.fromRGB(0, 130, 80) or Color3.fromRGB(130, 50, 50)
    btnToolsToggle.TextColor3 = Color3.new(1,1,1)
    btnToolsToggle.Font = Enum.Font.GothamBold
    btnToolsToggle.TextSize = 10
    Instance.new("UICorner", btnToolsToggle).CornerRadius = UDim.new(0,4)
    btnToolsToggle.MouseButton1Click:Connect(function()
        toolsEnabled = not toolsEnabled
        btnToolsToggle.Text = toolsEnabled and "use tool:on" or "use tool:off"
        btnToolsToggle.BackgroundColor3 = toolsEnabled and Color3.fromRGB(0, 130, 80) or Color3.fromRGB(130, 50, 50)
        if not toolsEnabled then removeAllTools() else addAllExistingTools() end
    end)

    local btnEquipAll = Instance.new("TextButton", row1)
    btnEquipAll.Position = UDim2.new(0, 65, 0, 0)
    btnEquipAll.Size = UDim2.new(0, 50, 1, 0)
    btnEquipAll.Text = "equip tools"
    btnEquipAll.BackgroundColor3 = Color3.fromRGB(0, 130, 80)
    btnEquipAll.TextColor3 = Color3.new(1,1,1)
    btnEquipAll.Font = Enum.Font.GothamBold
    btnEquipAll.TextSize = 11
    Instance.new("UICorner", btnEquipAll).CornerRadius = UDim.new(0,4)
    btnEquipAll.MouseButton1Click:Connect(function()
        for _, tool in ipairs(plr.Backpack:GetChildren()) do
            if tool:IsA("Tool") then tool.Parent = chr end
        end
    end)

    local btnUnequipAll = Instance.new("TextButton", row1)
    btnUnequipAll.Position = UDim2.new(0, 120, 0, 0)
    btnUnequipAll.Size = UDim2.new(0, 50, 1, 0)
    btnUnequipAll.Text = "unequip tools"
    btnUnequipAll.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    btnUnequipAll.TextColor3 = Color3.new(1,1,1)
    btnUnequipAll.Font = Enum.Font.GothamBold
    btnUnequipAll.TextSize = 11
    Instance.new("UICorner", btnUnequipAll).CornerRadius = UDim.new(0,4)
    btnUnequipAll.MouseButton1Click:Connect(function()
        for _, tool in ipairs(chr:GetChildren()) do
            if tool:IsA("Tool") then tool.Parent = plr.Backpack end
        end
    end)

    yPos = yPos + 32

    local row2 = Instance.new("Frame", content)
    row2.Size = UDim2.new(1, -2*PADDING_X, 0, 28)
    row2.Position = UDim2.new(0, PADDING_X, 0, yPos)
    row2.BackgroundTransparency = 1

    local btnCaptureAccessories = Instance.new("TextButton", row2)
    btnCaptureAccessories.Size = UDim2.new(0, 62, 1, 0)
    btnCaptureAccessories.Text = "use Accs"
    btnCaptureAccessories.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
    btnCaptureAccessories.TextColor3 = Color3.new(1,1,1)
    btnCaptureAccessories.Font = Enum.Font.GothamBold
    btnCaptureAccessories.TextSize = 10
    Instance.new("UICorner", btnCaptureAccessories).CornerRadius = UDim.new(0,4)
    btnCaptureAccessories.MouseButton1Click:Connect(function()
        task.wait(0.2)
        waitForHRP()
        for _, child in ipairs(chr:GetChildren()) do
            if child:IsA("Accessory") and child:FindFirstChild("Handle") then
                local h = child.Handle
                if table.find(handles, h) then
                    cleanupTool(h)
                    task.wait()
                end
                setupAccessory(child)
            end
        end
        btnCaptureAccessories.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
        task.delay(0.5, function()
            if btnCaptureAccessories then btnCaptureAccessories.BackgroundColor3 = Color3.fromRGB(100, 100, 200) end
        end)
    end)

    local btnBlacklistToggle = Instance.new("TextButton", row2)
    btnBlacklistToggle.Position = UDim2.new(0, 66, 0, 0)
    btnBlacklistToggle.Size = UDim2.new(0, 72, 1, 0)
    btnBlacklistToggle.Text = "Accs blacklist"
    btnBlacklistToggle.BackgroundColor3 = Color3.fromRGB(140, 90, 20)
    btnBlacklistToggle.TextColor3 = Color3.new(1,1,1)
    btnBlacklistToggle.Font = Enum.Font.GothamBold
    btnBlacklistToggle.TextSize = 10
    Instance.new("UICorner", btnBlacklistToggle).CornerRadius = UDim.new(0,4)
    btnBlacklistToggle.MouseButton1Click:Connect(function()
        blMenu.Visible = not blMenu.Visible
        if blMenu.Visible then
            refreshBlacklistMenu()
        end
    end)

    local stopConfirm = false
    local btnStop = Instance.new("TextButton", row2)
    btnStop.Position = UDim2.new(1, -50, 0, 0)
    btnStop.Size = UDim2.new(0, 50, 1, 0)
    btnStop.Text = "stop"
    btnStop.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    btnStop.TextColor3 = Color3.new(1,1,1)
    btnStop.Font = Enum.Font.GothamBold
    btnStop.TextSize = 11
    Instance.new("UICorner", btnStop).CornerRadius = UDim.new(0,4)
    btnStop.MouseButton1Click:Connect(function()
        if not stopConfirm then
            stopConfirm = true
            btnStop.Text = "sure?"
            task.delay(2, function()
                if btnStop and btnStop.Parent then
                    stopConfirm = false
                    btnStop.Text = "stop"
                end
            end)
        else
            getgenv().OrbitToolsy = false
            if chr:FindFirstChild("Humanoid") then chr.Humanoid.Health = 0 end
            screenGui:Destroy()
        end
    end)

    yPos = yPos + 34
    contentRequiredHeight = yPos + PADDING_Y
    mainFrame.Size = UDim2.new(0, BASE_WIDTH, 0, TITLEBAR_HEIGHT + contentRequiredHeight)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

    local toggleBall = Instance.new("ImageButton", screenGui)
    toggleBall.Name = "ToggleBall"
    toggleBall.Size = UDim2.new(0, 42, 0, 42)
    toggleBall.Position = UDim2.new(1, -57, 1, -57)
    toggleBall.BackgroundTransparency = 1
    toggleBall.Image = "rbxassetid://0"
    toggleBall.ImageTransparency = 0.65
    toggleBall.Active = true
    Instance.new("UICorner", toggleBall).CornerRadius = UDim.new(1, 0)
    local ballStroke = Instance.new("UIStroke", toggleBall)
    ballStroke.Color = Color3.fromRGB(255, 255, 255)
    ballStroke.Transparency = 0.4
    ballStroke.Thickness = 1.5

    local ballLabel = Instance.new("TextLabel", toggleBall)
    ballLabel.Size = UDim2.new(1, 0, 1, 0)
    ballLabel.BackgroundTransparency = 1
    ballLabel.Text = "X"
    ballLabel.TextColor3 = Color3.new(1,1,1)
    ballLabel.Font = Enum.Font.GothamBold
    ballLabel.TextSize = 18

    toggleBall.MouseButton1Click:Connect(function()
        guiVisible = not guiVisible
        mainFrame.Visible = guiVisible
        if not guiVisible then blMenu.Visible = false end
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            guiVisible = not guiVisible
            mainFrame.Visible = guiVisible
            if not guiVisible then blMenu.Visible = false end
        end
    end)
end

local function handleCharacter(character)
    local function destroyGrip()
        for _, obj in ipairs(character:GetDescendants()) do
            if obj:IsA("Motor6D") and obj.Name == "RightGrip" then obj:Destroy() end
        end
    end
    destroyGrip()
    character.DescendantAdded:Connect(function(obj)
        if obj:IsA("Motor6D") and obj.Name == "RightGrip" then obj:Destroy() end
    end)
end
if plr.Character then handleCharacter(plr.Character) end

local toolAddedConnection = nil
local function bindToolAdded()
    if toolAddedConnection then toolAddedConnection:Disconnect() end
    toolAddedConnection = chr.ChildAdded:Connect(function(c)
        task.wait()
        if c:IsA("Tool") and toolsEnabled then setupTool(c) end
    end)
end
bindToolAdded()

if toolsEnabled then
    for _, v in ipairs(chr:GetChildren()) do
        if v:IsA("Tool") then setupTool(v) end
    end
end

RunService.RenderStepped:Connect(function(dt)
    if not getgenv().OrbitToolsy then return end
    if not targetHRP or not targetHRP.Parent then
        targetHRP = hrp
        if targetMonitor then targetMonitor:Disconnect(); targetMonitor = nil end
    end

    rot = rot + speed
    local time = os.clock()
    local numTools = #orbitParts
    if numTools == 0 then return end

    for i, p in ipairs(orbitParts) do
        if p and p.Parent then
            local angle = math.rad(rot + (360 / numTools) * i)
            local targetCFrame

            if mode == 0 then
                local fixedAngle = math.rad((i - 1) * (360 / numTools))
                targetCFrame = targetHRP.CFrame * CFrame.Angles(0, fixedAngle, 0) * CFrame.new(offset, 0, 0)
            elseif mode == 1 then
                targetCFrame = targetHRP.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(offset, 0, 0)
            elseif mode == 2 then
                targetCFrame = targetHRP.CFrame * CFrame.new(math.cos(angle) * offset, math.sin(time * 2 + i) * 2, math.sin(angle) * offset)
            elseif mode == 3 then
                targetCFrame = targetHRP.CFrame * CFrame.Angles(angle, angle, 0) * CFrame.new(offset, 0, 0)
            elseif mode == 4 then
                targetCFrame = CFrame.new(targetHRP.Position) * CFrame.Angles(0, angle, 0) * CFrame.new(offset, 0, 0)
            elseif mode == 5 then
                targetCFrame = targetHRP.CFrame * CFrame.new(math.cos(angle) * offset, math.sin(angle) * offset, math.sin(angle) * offset)
            elseif mode == 6 then
                targetCFrame = targetHRP.CFrame * CFrame.Angles(angle, 0, angle) * CFrame.new(offset, 0, 0)
            else
                local subType = mode % 8
                local safeSpeed = time * (1 + (mode % 5) / 10)
                if subType == 0 then
                    local petalCount = (mode % 5) + 3
                    local wave = math.sin(angle * petalCount + safeSpeed)
                    local currentOffset = offset + (wave * (offset / 3))
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(currentOffset, 0, 0)
                elseif subType == 1 then
                    local tiltX = math.rad((mode * 15) % 360) + (time * 0.5)
                    local tiltZ = math.rad((mode * 45) % 360)
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(tiltX, angle, tiltZ) * CFrame.new(offset, 0, 0)
                elseif subType == 2 then
                    local height = math.sin(angle + (time * 2)) * (offset * 0.8)
                    local twist = math.cos(safeSpeed + (i/2)) * 2
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(offset + twist, height, 0)
                elseif subType == 3 then
                    local noiseX = math.sin(angle * ((mode % 3) + 1))
                    local noiseY = math.cos(angle * ((mode % 2) + 1))
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(angle, 0, angle) * CFrame.new(offset * noiseX, offset * noiseY, 0)
                elseif subType == 4 then
                    local fig8X = math.cos(angle) * offset
                    local fig8Z = math.sin(angle * 2) * offset
                    targetCFrame = targetHRP.CFrame * CFrame.new(fig8X, 0, fig8Z)
                elseif subType == 5 then
                    local spikeFreq = (mode % 4) + 3
                    local height = math.abs(math.sin(angle * spikeFreq)) * (offset * 0.8)
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(offset, height - (offset/2), 0)
                elseif subType == 6 then
                    local band = (i % 3)
                    local tiltAngle = math.rad(60 * band)
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(tiltAngle, angle, 0) * CFrame.new(offset, 0, 0)
                elseif subType == 7 then
                    local pulse = math.sin(safeSpeed * 2) * (offset * 0.4)
                    targetCFrame = targetHRP.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(offset + pulse, 0, 0)
                end

                if mode > 20 then
                    local slowWobble = math.rad(math.sin(time) * 15)
                    targetCFrame = targetCFrame * CFrame.Angles(slowWobble, 0, slowWobble)
                end
            end

            local alpha = 1 - math.exp(-lerpSpeed * dt)
            p.CFrame = p.CFrame:Lerp(targetCFrame, alpha)

            local h = handles[i]
            if h and movers[h] then
                local spinVar = (mode % 30)
                movers[h].angular.AngularVelocity = Vector3.new(0, toolRotSpeed * (10 + spinVar), 0)
            end
        end
    end

    if sethiddenproperty then
        pcall(function() sethiddenproperty(plr, "SimulationRadius", math.huge) end)
    end
end)

if hrp then lastHRPPos = hrp.Position end

RunService.Stepped:Connect(function()
    pcall(function() settings().Physics.AllowSleep = false end)
    plr.SimulationRadius = SETTINGS.SimulationRadius
end)

RunService.PostSimulation:Connect(function(dt)
    if not targetHRP or not targetHRP.Parent then return end
    local currentTime = os.clock()
    local currentPos = hrp.Position
    if dt > 0 then hrpVel = (currentPos - lastHRPPos) / dt end
    lastHRPPos = currentPos
    local predictedHRPPos = currentPos + hrpVel * 0.1
    local antiSleep = Vector3.new(0, math.sin(currentTime * 15) * 0.0015, 0)
    local gravityAxis = SETTINGS.VelocityY + math.sin(currentTime)
    for _, h in ipairs(handles) do
        if h and h:IsA("BasePart") then
            local dir = predictedHRPPos - h.Position
            local xz = Vector3.new(dir.X, 0, dir.Z)
            local velXZ = Vector3.zero
            if xz.Magnitude > 0 then velXZ = xz.Unit * xz.Magnitude * 2 end
            h.AssemblyLinearVelocity = Vector3.new(velXZ.X, gravityAxis, velXZ.Z)
            h.AssemblyAngularVelocity = Vector3.new(0, math.huge, math.huge)
            h.CFrame = h.CFrame + antiSleep
        end
    end
end)

local MAX_ORBIT_DISTANCE = 8
task.spawn(function()
    while getgenv().OrbitToolsy do
        task.wait(0.1)
        local now = os.clock()
        for i = #handles, 1, -1 do
            local h = handles[i]
            local orbitPart = orbitParts[i]
            if h and h.Parent and orbitPart then
                if (h.Position - orbitPart.Position).Magnitude > MAX_ORBIT_DISTANCE then
                    local lastTime = lastResyncTime[h] or 0
                    if now - lastTime >= RESYNC_COOLDOWN then
                        local item = h.Parent
                        if item:IsA("Tool") and item.Parent == chr then
                            cleanupTool(h)
                            setupTool(item)
                            lastResyncTime[h] = now
                        elseif item:IsA("Accessory") and item.Parent == chr then
                            item.Parent = nil
                            task.wait()
                            item.Parent = chr
                            lastResyncTime[h] = now
                        end
                    end
                end
            end
        end
    end
end)

local currentCharAddedConn = nil
plr.CharacterAdded:Connect(function(c)
    if currentCharAddedConn then currentCharAddedConn:Disconnect() end

    c:WaitForChild("HumanoidRootPart")
    task.wait(0.1)

    chr = c
    hrp = c.HumanoidRootPart
    bp = plr:WaitForChild("Backpack")

    for _, p in ipairs(orbitParts) do p:Destroy() end
    for _, h in ipairs(handles) do
        if connections[h] then connections[h]:Disconnect() end
        if movers[h] and movers[h].align then movers[h].align:Destroy() end
        if movers[h] and movers[h].angular then movers[h].angular:Destroy() end
    end
    table.clear(handles)
    table.clear(orbitParts)
    table.clear(movers)
    table.clear(connections)
    table.clear(toolNames)
    table.clear(lastResyncTime)

    targetHRP = hrp
    if targetMonitor then targetMonitor:Disconnect(); targetMonitor = nil end
    lastHRPPos = hrp.Position

    handleCharacter(c)

    if toolAddedConnection then toolAddedConnection:Disconnect() end
    toolAddedConnection = chr.ChildAdded:Connect(function(child)
        task.wait()
        if child:IsA("Tool") and toolsEnabled then setupTool(child) end
    end)

    if toolsEnabled then
        for _, v in ipairs(c:GetChildren()) do
            if v:IsA("Tool") then setupTool(v) end
        end
    end
end)

createButtonGUI()
