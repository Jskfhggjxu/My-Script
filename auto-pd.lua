local player = game.Players.LocalPlayer
local coreLogicEnabled = false
local lastSpawnTime = tick()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoSpawnPD_Gui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Draggable = true
mainFrame.Active = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -60, 0, 35)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.Text = "Auto spawn -pd"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 2.5)
closeBtn.Text = "×"
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -70, 0, 2.5)
miniBtn.Text = "-"
miniBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 80)
miniBtn.TextColor3 = Color3.new(1, 1, 1)
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = 20
miniBtn.Parent = mainFrame

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 6)
miniCorner.Parent = miniBtn

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 210, 0, 45)
toggleBtn.Position = UDim2.new(0.5, -105, 0.6, -10)
toggleBtn.Text = "Permdeath on next spawn"
toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 35, 70)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamSemibold
toggleBtn.TextSize = 16
toggleBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = toggleBtn

local function executeRemote(cmd)
    local args = {"cmd", cmd}
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("01_server", 5)
    if remote then
        remote:FireServer(unpack(args))
    end
end

local function runNetworkLogic()
    local RunService = game:GetService("RunService")
    if not getgenv().Network then
        getgenv().Network = {
            BaseParts = {};
            Velocity = Vector3.new(0, 999, 0);
        }
    end
    local hats = {}
    if player.Character then
        for _, h in pairs(player.Character:GetChildren()) do
            if h:IsA("Accessory") then
                local hd = h.Handle
                if hd:FindFirstChild("AccessoryWeld") then
                    hd.AccessoryWeld:Destroy()
                end
                table.insert(getgenv().Network.BaseParts, hd)
                table.insert(hats, hd)
            end
        end
    end
    getgenv().Network["PartOwnership"] = getgenv().Network["PartOwnership"] or {}
    if not getgenv().Network["PartOwnership"]["Enabled"] then
        getgenv().Network["PartOwnership"]["Enabled"] = true
        getgenv().Network["PartOwnership"]["Connection"] = RunService.Heartbeat:Connect(function()
            sethiddenproperty(player, "SimulationRadius", 1/0)
            for _, Part in pairs(getgenv().Network.BaseParts) do
                if Part:IsDescendantOf(workspace) then
                    coroutine.wrap(function()
                        Part.Velocity = getgenv().Network.Velocity + Vector3.new(0, math.cos(tick() * 10) / 100, 0)
                    end)()
                end
            end
        end)
    end
end

player.CharacterAdded:Connect(function()
    lastSpawnTime = tick()
    if coreLogicEnabled then
        executeRemote("-pd")
    end
end)

task.spawn(function()
    while task.wait(1) do
        if coreLogicEnabled and tick() - lastSpawnTime > 4 then
            toggleBtn.Text = "Already Permdeath! touch again back to Instant respawn"
        end
    end
end)

toggleBtn.MouseButton1Click:Connect(function()
    if toggleBtn.Text == "Already Permdeath! touch again back to Instant respawn" then
        executeRemote("-re")
        toggleBtn.Text = "back to Instant respawning..."
        lastSpawnTime = tick()
        return
    end

    coreLogicEnabled = not coreLogicEnabled
    if coreLogicEnabled then
        toggleBtn.Text = "Waiting respawn and pd..."
        toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 100, 60)
        lastSpawnTime = tick()
        runNetworkLogic()
        executeRemote("-pd")
    else
        toggleBtn.Text = "Permdeath on next spawn"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 35, 70)
    end
end)

local isMinimized = false
miniBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        mainFrame:TweenSize(UDim2.new(0, 250, 0, 35), "Out", "Quad", 0.2, true)
        toggleBtn.Visible = false
    else
        mainFrame:TweenSize(UDim2.new(0, 250, 0, 150), "Out", "Quad", 0.2, true)
        task.wait(0.2)
        toggleBtn.Visible = true
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    coreLogicEnabled = false
    if getgenv().Network and getgenv().Network["PartOwnership"] and getgenv().Network["PartOwnership"]["Connection"] then
        getgenv().Network["PartOwnership"]["Connection"]:Disconnect()
        getgenv().Network["PartOwnership"]["Enabled"] = false
    end
    screenGui:Destroy()
end)
