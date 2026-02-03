-- 此脚本不是我的(github raw account)，请询问作者
local soundId = "rbxassetid://88457346646245"
local Workspace = game:GetService("Workspace")

-- 创建音效对象
local sound = Instance.new("Sound")
sound.SoundId = soundId
sound.Looped = false
sound.Volume = 0.5
sound.Parent = Workspace

-- 播放音效
sound:Play()

-- 音效结束后立即销毁
sound.Ended:Connect(function()
    sound:Destroy()
end)

task.delay(10, function()
    if sound and sound.Parent and not sound.IsPlaying then
        sound:Destroy()
    end
end)

-- ========== 迪脚本V2框架 ==========
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait()
    LocalPlayer = Players.LocalPlayer
end

-- ========== Blade Ball 脚本修复 ==========
print("迪脚本加载中...")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local BallsFolder = Workspace:WaitForChild("Balls", 9e9)
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local AbilityButtonPress = Remotes:WaitForChild("AbilityButtonPress")
local ParryButtonPress = Remotes:WaitForChild("ParryButtonPress")

-- Konfigurasi
getgenv().BladeBallConfig = {
    AutoParry = false,
    PingBased = true,
    PingBasedOffset = 0.05,
    BallSpeedCheck = true,
    ParryRangeMultiplier = 2,
}

local UseRage = false

local function onCharacterAdded(newCharacter)
    Character = newCharacter
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

local function VerifyBall(Ball)
    return typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(BallsFolder) and Ball:GetAttribute("realBall") == true
end

local function IsTheTarget()
    return Character and Character:FindFirstChild("Highlight")
end

local function FindBall()
    for _, v in pairs(BallsFolder:GetChildren()) do
        if v:GetAttribute("realBall") == true then
            return v
        end
    end
    return nil
end

local function getPing()
    local success, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
    end)
    return success and math.max(0.05, math.min(0.5, ping)) or 0.1
end

local function sendParryClick()    
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)        
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
end

local function isStationary()
    local humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.WalkSpeed == 0
end

local function Parry()
    pcall(function()
        local abilities = Character and Character:FindFirstChild("Abilities")
        if abilities and abilities:FindFirstChild("Raging Deflection") and abilities["Raging Deflection"].Enabled and UseRage then
            AbilityButtonPress:Fire()
            task.wait(0)
            if not isStationary() then
                sendParryClick()
            end
        else
            ParryButtonPress:Fire()
            sendParryClick()
        end
    end)
end

-- 修复自动格挡函数
local autoParryConnection = nil

local function startAutoParry()
    if autoParryConnection then
        autoParryConnection:Disconnect()
        autoParryConnection = nil
    end
    
    autoParryConnection = RunService.PreRender:Connect(function()
        if not BladeBallConfig.AutoParry or not Character or not Character.PrimaryPart then
            return
        end

        local Ball = FindBall()
        if not Ball or not Ball.Position then
            return
        end

        local BallPosition = Ball.Position
        local BallVelocity = Ball.AssemblyLinearVelocity.Magnitude
        local Distance = (BallPosition - Character.PrimaryPart.Position).Magnitude
        local ping = BladeBallConfig.PingBased and getPing() or 0
        local ping_threshold = math.clamp(ping / 10, 0.1, 0.2)  -- 修复范围计算
        local parryRange = (ping_threshold + BladeBallConfig.PingBasedOffset) + (BallVelocity / math.pi) * BladeBallConfig.ParryRangeMultiplier

        if BladeBallConfig.BallSpeedCheck and BallVelocity < 5 then
            return
        end

        if Distance <= parryRange and IsTheTarget() then
            Parry()
        end
    end)
end

local function equipAbility(abilityName)
    pcall(function()
        if ReplicatedStorage.Remotes.Store.RequestEquipAbility then
            ReplicatedStorage.Remotes.Store.RequestEquipAbility:InvokeServer(abilityName)
        end
    end)
end

-- ========== 设备检测 ==========
local function getDeviceType()
    local UserInputService = game:GetService("UserInputService")
    if UserInputService.TouchEnabled then
        if UserInputService.KeyboardEnabled then
            return "平板"
        else
            return "手机"
        end
    else
        return "电脑"
    end
end

local deviceType = getDeviceType()
local uiSize, uiPosition

if deviceType == "手机" then
    uiSize = UDim2.fromOffset(400, 240)
elseif deviceType == "平板" then
    uiSize = UDim2.fromOffset(450, 350)
else
    uiSize = UDim2.fromOffset(600, 500)
end
uiPosition = UDim2.new(0.5, 0, 0.5, 0)

WindUI.TransparencyValue = 0.15

WindUI:AddTheme({
    Name = "CyberBlue",
    Accent = "#18181b",
    Dialog = "#18181b",
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#000000",
    Background = "#0e0e10",
    Button = "#52525b",
    Icon = "#00f7ff"
})

WindUI:SetTheme("CyberBlue")

local playerName = LocalPlayer.Name
local displayName = LocalPlayer.DisplayName

WindUI:Notify({
    Title = "迪脚本通知",
    Content = "迪脚本v2加载完成",
    Duration = 2
})

local XiaoDi = WindUI:CreateWindow({
    Title = "迪脚本 v2 - Blade Ball",
    Icon = "rbxassetid://124019880670946",
    Author = "主作者：小迪",
    Folder = "迪脚本",
    Size = uiSize,
    Position = uiPosition,
    Theme = "CyberBlue",
    Background = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#1a1a1a"), Transparency = 0 },
        ["50"] = { Color = Color3.fromHex("#2c3e50"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#000000"), Transparency = 0 }
    }, { Rotation = 150 }),
    Transparent = true,
    HideSearchBar = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Username = playerName,
        DisplayName = displayName,
        UserId = LocalPlayer.UserId,
        ThumbnailType = "AvatarBust",
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "玩家:" .. LocalPlayer.Name,
                Duration = 3
            })
        end
    },
    SideBarWidth = deviceType == "手机" and 150 or 180,
    ScrollBarEnabled = true,
    CornerRadius = UDim.new(0, 14),
    DropShadow = true
})

XiaoDi:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "CyberBlue" and "Dark" or "CyberBlue")
    WindUI:Notify({
        Title = "提示",
        Content = "当前主题: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

XiaoDi:EditOpenButton({
    Title = "打开迪脚本v2",
    Icon = "rbxassetid://124019880670946",
})

XiaoDi:SetToggleKey(Enum.KeyCode.N)

-- ========== 功能区划分 ==========
local FengYu = {
    ScriptInfo = XiaoDi:Section({ Title = "脚本信息", Opened = false, Icon = "info"}),
    BladeBall = XiaoDi:Section({ Title = "Blade Ball功能", Opened = true, Icon = "zap"}),
    PlayerFunctions = XiaoDi:Section({ Title = "玩家功能", Opened = false, Icon = "users"})
}

local Feng = {
    ScriptInfo = FengYu.ScriptInfo:Tab({ Title = "公告", Icon = "info"}),
    PlayerInfo = FengYu.ScriptInfo:Tab({ Title = "玩家信息", Icon = "user"}),
    AuthorInfo = FengYu.ScriptInfo:Tab({ Title = "作者信息", Icon = "users"}),
    
    AutoParryTab = FengYu.BladeBall:Tab({ Title = "自动格挡", Icon = "shield"}),
    AbilitiesTab = FengYu.BladeBall:Tab({ Title = "技能装备", Icon = "sword"}),
    PlayerTab = FengYu.PlayerFunctions:Tab({ Title = "玩家设置", Icon = "settings"})
}

-- ========== 脚本信息区 ==========
Feng.ScriptInfo:Code({
    Code = [[
欢迎使用迪脚本v2 - Blade Ball专版
本脚本已优化修复所有功能
请安全使用，避免过度滥用
]],
})

Feng.PlayerInfo:Paragraph({
    Title = "玩家信息",
    Desc = "用户: " .. LocalPlayer.Name,
    Image = "user",
    ImageSize = 12
})

Feng.PlayerInfo:Paragraph({
    Title = "设备类型",
    Desc = "当前设备: " .. deviceType,
    Image = "gamepad",
    ImageSize = 12
})

Feng.AuthorInfo:Paragraph({
    Title = "主脚本作者",
    Desc = "小迪",
    Image = "rbxassetid://124019880670946",
    ImageSize = 50,
    Buttons = {
        {
            Title = "复制QQ号",
            Variant = "Primary",
            Callback = function()
                setclipboard("3954952871")
            end,
            Icon = "folder",
        },
        {
            Title = "复制QQ群",
            Variant = "Primary",
            Callback = function()
                setclipboard("908685870")
            end,
            Icon = "folder",
        },
    }
})

-- ========== Blade Ball 自动格挡功能区 ==========
Feng.AutoParryTab:Toggle({
    Title = "自动格挡",
    Value = false,
    Callback = function(value)
        BladeBallConfig.AutoParry = value
        if value then
            startAutoParry()
            WindUI:Notify({
                Title = "自动格挡已开启",
                Content = "自动格挡功能已启动",
                Duration = 2,
                Icon = "shield"
            })
        else
            if autoParryConnection then
                autoParryConnection:Disconnect()
                autoParryConnection = nil
            end
            WindUI:Notify({
                Title = "自动格挡已关闭",
                Content = "自动格挡功能已停止",
                Duration = 2,
                Icon = "shield"
            })
        end
    end
})

Feng.AutoParryTab:Toggle({
    Title = "使用狂暴格挡",
    Desc = "必须装备狂暴偏转技能",
    Value = false,
    Callback = function(value)
        UseRage = value
        WindUI:Notify({
            Title = "狂暴格挡",
            Content = value and "已启用狂暴格挡" or "已禁用狂暴格挡",
            Duration = 2,
            Icon = "zap"
        })
    end
})

Feng.AutoParryTab:Slider({
    Title = "格挡范围倍率",
    Desc = "设置格挡检测范围",
    Value = {
        Min = 0.5,
        Max = 3,
        Default = 2,
    },
    Callback = function(Value)
        BladeBallConfig.ParryRangeMultiplier = Value
    end
})

Feng.AutoParryTab:Toggle({
    Title = "基于延迟调整",
    Value = true,
    Callback = function(value)
        BladeBallConfig.PingBased = value
    end
})

Feng.AutoParryTab:Toggle({
    Title = "检查球速",
    Value = true,
    Callback = function(value)
        BladeBallConfig.BallSpeedCheck = value
    end
})

Feng.AutoParryTab:Divider()

Feng.AutoParryTab:Toggle({
    Title = "防AFK",
    Value = false,
    Callback = function(Value)
        if Value then
            LocalPlayer.Idled:Connect(function()
                local vu = game:GetService("VirtualUser")
                pcall(function()
                    vu:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                    task.wait(0.5)
                    vu:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                end)
            end)
            WindUI:Notify({
                Title = "防AFK已启用",
                Content = "将自动防止AFK",
                Duration = 2,
                Icon = "user"
            })
        end
    end
})

-- ========== 技能装备区 ==========
local abilitiesList = {
    {"短划线", "Dash"},
    {"磁场", "Magnetic Field"},
    {"隐身", "Invisibility"},
    {"平台", "Platform"},
    {"狂暴偏转", "Raging Deflection"},
    {"阴影步骤", "Shadow Step"},
    {"超级跳跃", "Super Jump"},
    {"心灵感应", "Telekinesis"},
    {"雷霆冲刺", "Thunder Dash"},
    {"狂喜", "Ecstasy"}
}

for _, ability in ipairs(abilitiesList) do
    Feng.AbilitiesTab:Button({
        Title = ability[1],
        Callback = function()
            equipAbility(ability[2])
            WindUI:Notify({
                Title = "技能装备",
                Content = "尝试装备技能: " .. ability[1],
                Duration = 2,
                Icon = "sword"
            })
        end
    })
end

Feng.AbilitiesTab:Divider()

Feng.AbilitiesTab:Button({
    Title = "装备全部技能",
    Callback = function()
        for _, ability in ipairs(abilitiesList) do
            equipAbility(ability[2])
            task.wait(0.1)
        end
        WindUI:Notify({
            Title = "技能装备完成",
            Content = "已尝试装备所有技能",
            Duration = 3,
            Icon = "check-circle"
        })
    end
})

-- ========== 玩家功能区 ==========
Feng.PlayerTab:Toggle({
    Title = "速度开关",
    Default = false,
    Callback = function(v)
        local speedConnection = nil
        if v then
            speedConnection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.WalkSpeed = 30
                end
            end)
            WindUI:Notify({
                Title = "速度已开启",
                Content = "移动速度已提升",
                Duration = 2,
                Icon = "zap"
            })
        elseif not v and speedConnection then
            speedConnection:Disconnect()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
            WindUI:Notify({
                Title = "速度已关闭",
                Content = "移动速度已恢复",
                Duration = 2,
                Icon = "zap"
            })
        end
    end
})

Feng.PlayerTab:Slider({
    Title = "速度设置",
    Desc = "滑动调整移动速度",
    Value = {
        Min = 16,
        Max = 100,
        Default = 30,
    },
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

Feng.PlayerTab:Toggle({
    Title = "无限跳",
    Default = false,
    Callback = function(Value)
        local jumpConn
        if Value then
            jumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
            WindUI:Notify({
                Title = "无限跳已开启",
                Content = "可以无限跳跃",
                Duration = 2,
                Icon = "wind"
            })
        else
            if jumpConn then
                jumpConn:Disconnect()
                jumpConn = nil
            end
            WindUI:Notify({
                Title = "无限跳已关闭",
                Content = "跳跃恢复正常",
                Duration = 2,
                Icon = "wind"
            })
        end
    end
})

Feng.PlayerTab:Divider()

Feng.PlayerTab:Button({
    Title = "显示延迟",
    Callback = function()
        local ping = getPing()
        WindUI:Notify({
            Title = "当前延迟",
            Content = string.format("延迟: %.0fms", ping * 1000),
            Duration = 3,
            Icon = "wifi"
        })
    end
})

-- 脚本加载完成提示
WindUI:Notify({
    Title = "迪脚本V2加载完成",
    Content = "Blade Ball功能已整合完毕",
    Duration = 3
})

-- 添加几个测试通知
WindUI:Notify({
    Title = "迪脚本",
    Content = "Blade Ball脚本已加载",
    Duration = 3,
    Icon = "alert-circle"
})

WindUI:Notify({
    Title = "使用提示",
    Content = "请在Blade Ball游戏中使用自动格挡功能",
    Duration = 3,
    Icon = "info"
})