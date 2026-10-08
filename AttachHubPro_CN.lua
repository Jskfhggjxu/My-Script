--[[
===================================================================
  ATTACH HUB · PRO   —   UI 完全重制版
  核心功能（跟随 / 附着 / 观战 / 预设）与原脚本保持一致
-------------------------------------------------------------------
  · 全新界面：深色玻璃质感 + 渐变 + 圆角 + 平滑动画
  · 自适应：PC 显示器 / 手机屏幕自动缩放适配
  · 最小化：把窗口折叠成标题栏（可再展开）
  · 关闭 X：销毁整个 UI，同时停止所有正在运行的功能行为
===================================================================
]]

local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local CoreGui          = (gethui and gethui()) or game:GetService("CoreGui")

-- 重复执行时不叠加：先清掉上一个同名 UI
do
    if _G.__AttachHubPro_Stop then pcall(_G.__AttachHubPro_Stop) _G.__AttachHubPro_Stop = nil end
    local prev = CoreGui:FindFirstChild("AttachHubPro")
    if prev then pcall(function() prev:Destroy() end) end
end

--=================================================================
-- 配色 / 字体
--=================================================================
local Theme = {
    Panel     = Color3.fromRGB(22, 24, 32),
    Surface   = Color3.fromRGB(32, 35, 45),
    SurfaceHi = Color3.fromRGB(46, 50, 64),
    Stroke    = Color3.fromRGB(60, 65, 84),
    Accent    = Color3.fromRGB(124, 108, 255),
    Accent2   = Color3.fromRGB(84, 196, 255),
    AccentDim = Color3.fromRGB(92, 80, 205),
    Green     = Color3.fromRGB(72, 214, 148),
    Amber     = Color3.fromRGB(255, 190, 92),
    Red       = Color3.fromRGB(255, 96, 112),
    Text      = Color3.fromRGB(238, 240, 248),
    Sub       = Color3.fromRGB(158, 164, 186),
    Dim       = Color3.fromRGB(108, 114, 138),
    Track     = Color3.fromRGB(26, 28, 38),
    White     = Color3.fromRGB(255, 255, 255),
}

local FONT_ASSET = "rbxassetid://12187365364"
local W = Enum.FontWeight

--=================================================================
-- 小工具
--=================================================================
local function New(class, props, children)
    local o = Instance.new(class)
    local parent
    if props then
        for k, v in next, props do
            if k == "Parent" then parent = v else o[k] = v end
        end
    end
    if children then
        for _, child in ipairs(children) do
            if child then child.Parent = o end
        end
    end
    if parent then o.Parent = parent end
    return o
end

local function Corner(o, radius)
    local r
    if radius == nil then r = UDim.new(0, 8)
    elseif type(radius) == "number" then r = UDim.new(0, radius)
    else r = radius end
    return New("UICorner", { CornerRadius = r, Parent = o })
end

local function Circle(o)
    return Corner(o, UDim.new(1, 0))
end

local function Stroke(o, color, thickness, transparency)
    return New("UIStroke", {
        Color = color or Theme.Stroke,
        Thickness = thickness or 1,
        Transparency = transparency or 0.45,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = o,
    })
end

local function Grad(o, c1, c2, rotation, transA, transB)
    local g = New("UIGradient", {
        Color = ColorSequence.new(c1 or Theme.Accent, c2 or Theme.Accent2),
        Rotation = rotation or 0,
        Parent = o,
    })
    if transA then
        g.Transparency = NumberSequence.new({
            NumberSequenceKeypoint(0, transA),
            NumberSequenceKeypoint(1, transB or transA),
        })
    end
    return g
end

local function Fnt(obj, weight, style)
    local ok = pcall(function()
        obj.FontFace = Font.new(FONT_ASSET, weight or W.Regular, style or Enum.FontStyle.Normal)
    end)
    if not ok then
        pcall(function()
            if weight == W.Bold or weight == W.ExtraBold or weight == W.Heavy then
                obj.Font = Enum.Font.GothamBold
            else
                obj.Font = Enum.Font.Gotham
            end
        end)
    end
    return obj
end

local function Tween(obj, time, props, style, dir)
    local t = TweenService:Create(
        obj,
        TweenInfo.new(time or 0.15, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out),
        props
    )
    t:Play()
    return t
end

-- 所有全局连接都登记在这里，关闭 UI 时统一断开
local Bindings = {}
local function Bind(signal, fn)
    local conn = signal:Connect(fn)
    table.insert(Bindings, conn)
    return conn
end

local function UnbindAll()
    for i = #Bindings, 1, -1 do
        pcall(function() Bindings[i]:Disconnect() end)
        Bindings[i] = nil
    end
end

-- 屏幕坐标下的边界限制：保证标题栏永远留在屏幕内
local function ScreenClamp(x, y, frame)
    local cam = workspace.CurrentCamera
    local vp = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
    local size = frame.AbsoluteSize
    local minX = -size.X + 90
    local maxX = vp.X - 90
    local minY = 0
    local maxY = math.max(vp.Y - 56, minY)
    return math.clamp(x, minX, maxX), math.clamp(y, minY, maxY)
end

-- 自校准拖拽：不依赖 UIScale 的具体行为，拖多少动多少
local function MakeDraggable(frame, handle, clampFn)
    handle = handle or frame
    local dragging, moved = false, false
    local dragStart, startOffset, startAbs, ratio = nil, nil, nil, nil

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            moved = false
            ratio = nil
            dragStart = input.Position
            startOffset = frame.Position
            startAbs = frame.AbsolutePosition
        end
    end)

    Bind(UserInputService.InputChanged, function(input)
        if not dragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement
            and input.UserInputType ~= Enum.UserInputType.Touch then return end

        local delta = input.Position - dragStart
        if not moved then
            if delta.Magnitude < 4 then return end
            moved = true
            -- 先用 1:1 试探一次，测出「偏移量 -> 屏幕像素」的真实换算比例
            frame.Position = UDim2.new(
                startOffset.X.Scale, startOffset.X.Offset + delta.X,
                startOffset.Y.Scale, startOffset.Y.Offset + delta.Y
            )
            local abs2 = frame.AbsolutePosition
            ratio = Vector2.new(
                delta.X ~= 0 and (abs2.X - startAbs.X) / delta.X or 1,
                delta.Y ~= 0 and (abs2.Y - startAbs.Y) / delta.Y or 1
            )
            if ratio.X == 0 then ratio = Vector2.new(1, ratio.Y) end
            if ratio.Y == 0 then ratio = Vector2.new(ratio.X, 1) end
        end

        local targetX, targetY = startAbs.X + delta.X, startAbs.Y + delta.Y
        if clampFn then targetX, targetY = clampFn(targetX, targetY, frame) end

        frame.Position = UDim2.new(
            startOffset.X.Scale, startOffset.X.Offset + (targetX - startAbs.X) / ratio.X,
            startOffset.Y.Scale, startOffset.Y.Offset + (targetY - startAbs.Y) / ratio.Y
        )
    end)

    Bind(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return function() return moved == true end
end

--=================================================================
-- 尺寸常量（基准尺寸，最终通过 UIScale 自适应）
--=================================================================
local BASE_W, BASE_H   = 566, 436
local HEADER_H         = 52
local FOOTER_H         = 30
local SIDEBAR_W        = 214
local BODY_H           = BASE_H - HEADER_H - FOOTER_H   -- 354
local PAGE_W           = BASE_W - SIDEBAR_W - 1 - 24    -- 327

local IsMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

local UI = {}

--=================================================================
-- 根节点
--=================================================================
UI.Root = New("ScreenGui", {
    Name = "AttachHubPro",
    Enabled = false, -- 构建完成前隐藏 / hidden until fully built
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    DisplayOrder = 999,
    Parent = CoreGui,
})

--=========================== 悬浮开关 ===========================--
do
    local toggle = New("TextButton", {
        Name = "Toggle",
        Position = UDim2.new(0, 20, 0, 20),
        Size = UDim2.new(0, 54, 0, 54),
        BackgroundColor3 = Theme.Accent,
        AutoButtonColor = false,
        Text = "",
        Parent = UI.Root,
    })
    Corner(toggle, 17)
    Grad(toggle, Theme.Accent, Theme.Accent2, 40)
    Stroke(toggle, Theme.White, 1, 0.78)

    local label = Fnt(New("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "AH",
        TextColor3 = Theme.White,
        TextScaled = true,
        Parent = toggle,
    }), W.ExtraBold)
    New("UIPadding", {
        Parent = label,
        PaddingTop = UDim.new(0, 13), PaddingBottom = UDim.new(0, 13),
        PaddingLeft = UDim.new(0, 11), PaddingRight = UDim.new(0, 11),
    })

    UI.Toggle = toggle
    UI.ToggleScale = New("UIScale", { Scale = 1, Parent = toggle })

    toggle.MouseEnter:Connect(function() Tween(UI.ToggleScale, 0.15, { Scale = 1.09 }) end)
    toggle.MouseLeave:Connect(function() Tween(UI.ToggleScale, 0.15, { Scale = 1 }) end)
end

--=========================== 面板 ===========================--
UI.Panel = New("Frame", {
    Name = "Panel",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0, BASE_W, 0, BASE_H),
    BackgroundTransparency = 1,
    Parent = UI.Root,
})
UI.Responsive = New("UIScale", { Scale = 1, Parent = UI.Panel })

UI.Window = New("Frame", {
    Name = "Window",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Theme.Panel,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Parent = UI.Panel,
})
UI.WinScale = New("UIScale", { Scale = 1, Parent = UI.Window })
Corner(UI.Window, 16)
do -- 顶部渐变描边，提升质感
    Stroke(UI.Window, Theme.Accent, 1, 0.55)
end

--=========================== 标题栏 ===========================--
UI.Header = New("Frame", {
    Name = "Header",
    Size = UDim2.new(1, 0, 0, HEADER_H),
    BackgroundColor3 = Theme.Panel,
    BorderSizePixel = 0,
    ZIndex = 3,
    Parent = UI.Window,
})
New("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Theme.Accent,
    BackgroundTransparency = 0.93,
    BorderSizePixel = 0,
    Parent = UI.Header,
})

do -- Logo
    local logo = New("Frame", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 14, 0.5, -15),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = UI.Header,
    })
    Corner(logo, 10)
    Grad(logo, Theme.Accent, Theme.Accent2, 35)
    local lt = Fnt(New("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Text = "A", TextColor3 = Theme.White, TextScaled = true, Parent = logo,
    }), W.ExtraBold)
    New("UIPadding", {
        Parent = lt, PaddingTop = UDim.new(0, 7), PaddingBottom = UDim.new(0, 7),
        PaddingLeft = UDim.new(0, 7), PaddingRight = UDim.new(0, 7),
    })
end

Fnt(New("TextLabel", {
    Text = "Attach Hub",
    Size = UDim2.new(0, 180, 0, 16),
    Position = UDim2.new(0, 52, 0.5, -16),
    BackgroundTransparency = 1,
    TextColor3 = Theme.Text,
    TextSize = 15,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = UI.Header,
}), W.Bold)

Fnt(New("TextLabel", {
    Text = "PRO · v2.0",
    Size = UDim2.new(0, 180, 0, 12),
    Position = UDim2.new(0, 52, 0.5, 2),
    BackgroundTransparency = 1,
    TextColor3 = Theme.Accent,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = UI.Header,
}), W.Medium)

do -- 标题栏按钮
    local function HeaderButton(glyph, xOffset, danger)
        local b = New("TextButton", {
            Size = UDim2.new(0, 28, 0, 28),
            Position = UDim2.new(1, xOffset, 0.5, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Theme.Surface,
            BackgroundTransparency = 0.35,
            Text = glyph,
            TextColor3 = Theme.Sub,
            TextSize = 15,
            AutoButtonColor = false,
            ZIndex = 2,
            Parent = UI.Header,
        })
        Corner(b, 9)
        Fnt(b, W.Bold)
        local hoverColor = danger and Theme.Red or Theme.Accent
        b.MouseEnter:Connect(function()
            Tween(b, 0.12, { BackgroundColor3 = hoverColor, BackgroundTransparency = 0.15, TextColor3 = Theme.White })
        end)
        b.MouseLeave:Connect(function()
            Tween(b, 0.15, { BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.35, TextColor3 = Theme.Sub })
        end)
        return b
    end

    UI.CloseBtn = HeaderButton("×", -14, true)
    UI.MinBtn   = HeaderButton("–", -48, false)
end

UI.Divider = New("Frame", {
    Size = UDim2.new(1, -24, 0, 1),
    Position = UDim2.new(0, 12, 1, -1),
    BackgroundColor3 = Theme.Stroke,
    BackgroundTransparency = 0.45,
    BorderSizePixel = 0,
    ZIndex = 3,
    Parent = UI.Header,
})

--=========================== 主体 ===========================--
UI.Body = New("Frame", {
    Name = "Body",
    Size = UDim2.new(1, 0, 1, -(HEADER_H + FOOTER_H)),
    Position = UDim2.new(0, 0, 0, HEADER_H),
    BackgroundTransparency = 1,
    ZIndex = 1,
    Parent = UI.Window,
})

--=========================== 左侧：玩家列表 ===========================--
UI.Sidebar = New("Frame", {
    Name = "Sidebar",
    Size = UDim2.new(0, SIDEBAR_W, 1, 0),
    BackgroundTransparency = 1,
    Parent = UI.Body,
})

New("Frame", { -- 竖分隔线
    Size = UDim2.new(0, 1, 1, 0),
    Position = UDim2.new(0, SIDEBAR_W, 0, 0),
    BackgroundColor3 = Theme.Stroke,
    BackgroundTransparency = 0.55,
    BorderSizePixel = 0,
    Parent = UI.Body,
})

do -- 搜索框
    local wrap = New("Frame", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.35,
        Parent = UI.Sidebar,
    })
    Corner(wrap, 9)
    local wrapStroke = Stroke(wrap, Theme.Stroke, 1, 0.55)

    UI.SearchBox = Fnt(New("TextBox", {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = "搜索玩家…",
        PlaceholderColor3 = Theme.Dim,
        TextColor3 = Theme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        Parent = wrap,
    }), W.Medium)

    UI.SearchBox.Focused:Connect(function()
        wrap.BackgroundColor3 = Theme.SurfaceHi
        wrapStroke.Transparency = 0.25
    end)
    UI.SearchBox.FocusLost:Connect(function()
        wrap.BackgroundColor3 = Theme.Surface
        wrapStroke.Transparency = 0.55
    end)
end

UI.PlayerList = New("ScrollingFrame", {
    Name = "PlayerList",
    Size = UDim2.new(1, -16, 0, 230),
    Position = UDim2.new(0, 8, 0, 46),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Stroke,
    ScrollBarImageTransparency = 0.25,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    Parent = UI.Sidebar,
})
New("UIListLayout", {
    Padding = UDim.new(0, 5),
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    SortOrder = Enum.SortOrder.LayoutOrder,
    Parent = UI.PlayerList,
})
New("UIPadding", {
    PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 6),
    Parent = UI.PlayerList,
})

do -- 底部目标卡片
    local card = New("Frame", {
        Size = UDim2.new(1, -16, 0, 62),
        Position = UDim2.new(0, 8, 0, 284),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.35,
        Parent = UI.Sidebar,
    })
    Corner(card, 11)
    local cardStroke = Stroke(card, Theme.Stroke, 1, 0.5)

    local ring = New("Frame", {
        Size = UDim2.new(0, 4, 1, -20),
        Position = UDim2.new(0, 0, 0.5, -((62 - 20) / 2)),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = card,
    })
    Corner(ring, 4)
    UI.TargetRing = ring

    UI.TargetAvatar = New("ImageLabel", {
        Size = UDim2.new(0, 38, 0, 38),
        Position = UDim2.new(0, 14, 0.5, -19),
        BackgroundColor3 = Theme.Track,
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        Parent = card,
    })
    Circle(UI.TargetAvatar)
    Stroke(UI.TargetAvatar, Theme.Stroke, 1, 0.3)

    UI.TargetName = Fnt(New("TextLabel", {
        Text = "未选择目标",
        Size = UDim2.new(1, -78, 0, 18),
        Position = UDim2.new(0, 62, 0, 13),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Text,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = card,
    }), W.Bold)

    UI.TargetUser = Fnt(New("TextLabel", {
        Text = "从上方列表选择玩家",
        Size = UDim2.new(1, -78, 0, 14),
        Position = UDim2.new(0, 62, 0, 33),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Sub,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = card,
    }), W.Regular)

    UI.TargetCard = card
    UI.TargetCardStroke = cardStroke
end

--=========================== 右侧：内容 ===========================--
UI.Content = New("Frame", {
    Name = "Content",
    Position = UDim2.new(0, SIDEBAR_W + 1, 0, 0),
    Size = UDim2.new(1, -(SIDEBAR_W + 1), 1, 0),
    BackgroundTransparency = 1,
    Parent = UI.Body,
})

do -- 分段式标签栏
    local bar = New("Frame", {
        Size = UDim2.new(0, PAGE_W, 0, 30),
        Position = UDim2.new(0, 12, 0, 10),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.4,
        Parent = UI.Content,
    })
    Corner(bar, 10)

    local hl = New("Frame", {
        Size = UDim2.new(0.5, -4, 1, -8),
        Position = UDim2.new(0, 4, 0, 4),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = bar,
    })
    Corner(hl, 8)
    Grad(hl, Theme.Accent, Theme.Accent2, 25)
    UI.TabHighlight = hl

    local function Tab(text, half)
        local b = Fnt(New("TextButton", {
            Size = UDim2.new(0.5, -4, 1, 0),
            Position = UDim2.new(half, half == 0 and 4 or 0, 0, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = Theme.Sub,
            TextSize = 12,
            AutoButtonColor = false,
            Parent = bar,
        }), W.SemiBold)
        return b
    end

    UI.TabAttach  = Tab("附着", 0)
    UI.TabPresets = Tab("预设", 0.5)
end

local function MakePage()
    local page = New("ScrollingFrame", {
        Name = "Page",
        Size = UDim2.new(0, PAGE_W, 0, BODY_H - 46 - 8),
        Position = UDim2.new(0, 12, 0, 46),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Stroke,
        ScrollBarImageTransparency = 0.25,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = UI.Content,
    })
    New("UIListLayout", {
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = page,
    })
    New("UIPadding", {
        PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2),
        Parent = page,
    })
    return page
end

UI.PageAttach  = MakePage()
UI.PagePresets = MakePage()
UI.PagePresets.Visible = false

--=================================================================
-- 页面构建小部件
--=================================================================
local function Section(parent, title)
    local wrap = New("Frame", {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Parent = parent,
    })
    Fnt(New("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = string.upper(title),
        TextColor3 = Theme.Dim,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = wrap,
    }), W.SemiBold)
    New("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 1, -1),
        BackgroundColor3 = Theme.Stroke,
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        Parent = wrap,
    })
    return wrap
end

-- 滑条：返回 setValue(box值同步)
local function MakeSlider(parent, axis, minV, maxV)
    local row = New("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Parent = parent,
    })
    Corner(row, 9)

    Fnt(New("TextLabel", {
        Text = axis,
        Size = UDim2.new(0, 16, 1, 0),
        Position = UDim2.new(0, 9, 0, 0),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Sub,
        TextSize = 12,
        Parent = row,
    }), W.Bold)

    local track = New("TextButton", {
        Text = "",
        Size = UDim2.new(1, -92, 0, 4),
        Position = UDim2.new(0, 28, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Theme.Track,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Parent = row,
    })
    Corner(track, 4)

    local fill = New("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = track,
    })
    Corner(fill, 4)
    Grad(fill, Theme.Accent, Theme.Accent2, 0)

    local thumb = New("TextButton", {
        Text = "",
        Size = UDim2.new(0, 11, 0, 11),
        Position = UDim2.new(1, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Theme.White,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Parent = fill,
    })
    Circle(thumb)
    Stroke(thumb, Theme.Accent, 2, 0.5)

    local box = New("TextBox", {
        Size = UDim2.new(0, 50, 0, 20),
        Position = UDim2.new(1, -8, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        Text = "0",
        TextColor3 = Theme.Text,
        BackgroundColor3 = Theme.Track,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        TextSize = 11,
        ClearTextOnFocus = false,
        Parent = row,
    })
    Corner(box, 6)

    box.Focused:Connect(function() box.BackgroundColor3 = Theme.SurfaceHi end)
    box.FocusLost:Connect(function() box.BackgroundColor3 = Theme.Track end)

    local dragging = false

    local function Apply(input)
        local rel = (input.Position.X - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1)
        rel = math.clamp(rel, 0, 1)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        box.Text = string.format("%.2f", minV + rel * (maxV - minV))
    end

    local function Begin(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            Apply(input)
        end
    end

    track.InputBegan:Connect(Begin)
    thumb.InputBegan:Connect(Begin)

    local function Move(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
            Apply(input)
        end
    end

    track.InputChanged:Connect(Move)
    thumb.InputChanged:Connect(Move)
    Bind(UserInputService.InputChanged, Move)
    Bind(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return function(value)
        local v = math.clamp(tonumber(value) or 0, minV, maxV)
        fill.Size = UDim2.new((v - minV) / (maxV - minV), 0, 1, 0)
    end, box
end

local function TextInput(parent, placeholder)
    local box = Fnt(New("TextBox", {
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.4,
        Text = "",
        PlaceholderText = placeholder,
        PlaceholderColor3 = Theme.Dim,
        TextColor3 = Theme.Text,
        TextSize = 12,
        ClearTextOnFocus = false,
        TextXAlignment = Enum.TextXAlignment.Center,
        BorderSizePixel = 0,
        Parent = parent,
    }), W.Medium)
    Corner(box, 8)
    box.Focused:Connect(function() box.BackgroundColor3 = Theme.SurfaceHi end)
    box.FocusLost:Connect(function() box.BackgroundColor3 = Theme.Surface end)
    return box
end

-- 让同一父级下的元素严格按创建顺序排布（不依赖引擎的同值排序行为）
local function Sequence(page)
    local n = 0
    for _, child in ipairs(page:GetChildren()) do
        if child:IsA("GuiObject") then
            n = n + 1
            child.LayoutOrder = n
        end
    end
end

local OrderCounter = {}
local function NextOrder(container)
    OrderCounter[container] = (OrderCounter[container] or 0) + 1
    return OrderCounter[container]
end

local function ActionButton(parent, text, height)
    local b = Fnt(New("TextButton", {
        Size = UDim2.new(1, 0, 0, height or 26),
        BackgroundColor3 = Theme.Accent,
        BackgroundTransparency = 0.15,
        Text = text,
        TextColor3 = Theme.White,
        TextSize = 12,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Parent = parent,
    }), W.Bold)
    Corner(b, 8)
    local grad = Grad(b, Theme.Accent, Theme.Accent2, 20)
    b.MouseEnter:Connect(function()
        Tween(b, 0.15, { BackgroundTransparency = 0 })
    end)
    b.MouseLeave:Connect(function()
        Tween(b, 0.15, { BackgroundTransparency = 0.15 })
    end)
    b.MouseButton1Down:Connect(function()
        Tween(b, 0.08, { BackgroundTransparency = 0.25 })
    end)
    return b, grad
end

--=================================================================
-- 附着页内容
--=================================================================
local Sliders = {}

do
    local page = UI.PageAttach

    --=========================== 观战 / 附着 ===========================--
    do
        local row = New("Frame", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundTransparency = 1,
            Parent = page,
        })

        UI.ViewBtn = Fnt(New("TextButton", {
            Size = UDim2.new(0.42, -3, 1, 0),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundColor3 = Theme.Surface,
            BackgroundTransparency = 0.35,
            Text = "观战 View",
            TextColor3 = Theme.Text,
            TextSize = 12,
            TextTruncate = Enum.TextTruncate.AtEnd,
            AutoButtonColor = false,
            BorderSizePixel = 0,
            Parent = row,
        }), W.SemiBold)
        Corner(UI.ViewBtn, 9)
        UI.ViewStroke = Stroke(UI.ViewBtn, Theme.Stroke, 1, 0.7)

        UI.AttachBtn = Fnt(New("TextButton", {
            Size = UDim2.new(0.58, -3, 1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = Theme.Accent,
            BackgroundTransparency = 0.15,
            Text = "附着 Attach",
            TextColor3 = Theme.White,
            TextSize = 12,
            TextTruncate = Enum.TextTruncate.AtEnd,
            AutoButtonColor = false,
            BorderSizePixel = 0,
            Parent = row,
        }), W.Bold)
        Corner(UI.AttachBtn, 9)
        UI.AttachGrad = Grad(UI.AttachBtn, Theme.Accent, Theme.Accent2, 20)
    end

    Section(page, "偏移 Offset")

    Sliders.PosX, Sliders.PosXBox = MakeSlider(page, "X", -10, 10)
    Sliders.PosY, Sliders.PosYBox = MakeSlider(page, "Y", -10, 10)
    Sliders.PosZ, Sliders.PosZBox = MakeSlider(page, "Z", -10, 10)

    Section(page, "旋转 Rotation")

    Sliders.AngX, Sliders.AngXBox = MakeSlider(page, "X", -360, 360)
    Sliders.AngY, Sliders.AngYBox = MakeSlider(page, "Y", -360, 360)
    Sliders.AngZ, Sliders.AngZBox = MakeSlider(page, "Z", -360, 360)

    UI.ResetBtn = Fnt(New("TextButton", {
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.4,
        Text = "重置偏移 Reset Offsets",
        TextColor3 = Theme.Sub,
        TextSize = 12,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Parent = page,
    }), W.SemiBold)
    Corner(UI.ResetBtn, 8)
    UI.ResetBtn.MouseEnter:Connect(function()
        Tween(UI.ResetBtn, 0.13, { BackgroundColor3 = Theme.SurfaceHi, BackgroundTransparency = 0.2, TextColor3 = Theme.Text })
    end)
    UI.ResetBtn.MouseLeave:Connect(function()
        Tween(UI.ResetBtn, 0.15, { BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.4, TextColor3 = Theme.Sub })
    end)

    Section(page, "目标部位 Target Part")

    do -- 当前部位徽章
        local badge = New("Frame", {
            Size = UDim2.new(1, 0, 0, 26),
            BackgroundColor3 = Theme.Accent,
            BackgroundTransparency = 0.65,
            Parent = page,
        })
        Corner(badge, 8)
        Stroke(badge, Theme.Accent, 1, 0.5)
        UI.PartBadge = badge
        UI.PartLabel = Fnt(New("TextLabel", {
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = "HumanoidRootPart",
            TextColor3 = Theme.Text,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = badge,
        }), W.SemiBold)
    end

    UI.PartSearch = TextInput(page, "搜索部位…")
    UI.PartSearch.TextXAlignment = Enum.TextXAlignment.Left
    New("UIPadding", { Parent = UI.PartSearch, PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) })

    UI.PartList = New("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.Track,
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        Parent = page,
    })
    Corner(UI.PartList, 9)
    New("UIListLayout", {
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = UI.PartList,
    })
    New("UIPadding", {
        PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4),
        Parent = UI.PartList,
    })
end

--=================================================================
-- 预设页内容
--=================================================================
do
    local page = UI.PagePresets

    Section(page, "预设 Presets")

    UI.PresetGrid = New("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = page,
    })
    New("UIGridLayout", {
        CellSize = UDim2.new(0, 103, 0, 30),
        CellPadding = UDim2.new(0, 6, 0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = UI.PresetGrid,
    })

    Section(page, "创建预设 Create Preset")

    UI.PresetName = TextInput(page, "预设名称")
    UI.PresetAnim = TextInput(page, "Animation ID（可选）")
    do
        local addBtn = ActionButton(page, "把当前状态存为预设", 28)
        UI.PresetAdd = addBtn
    end

    Fnt(New("TextLabel", {
        Text = "保存后写入 AttachHub_CustomPresets.txt，可直接编辑该文件。",
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Dim,
        TextSize = 10,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = page,
    }), W.Regular)
end

--=================================================================
-- 底部状态栏
--=================================================================
UI.Footer = New("Frame", {
    Name = "Footer",
    Size = UDim2.new(1, 0, 0, FOOTER_H),
    Position = UDim2.new(0, 0, 1, -FOOTER_H),
    BackgroundColor3 = Theme.Panel,
    BorderSizePixel = 0,
    ZIndex = 2,
    Parent = UI.Window,
})

UI.StatusStrip = New("Frame", {
    Size = UDim2.new(1, 0, 0, 2),
    BackgroundColor3 = Theme.Track,
    BorderSizePixel = 0,
    Parent = UI.Footer,
})
UI.StatusFill = New("Frame", {
    Size = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = Theme.Accent,
    BorderSizePixel = 0,
    Parent = UI.StatusStrip,
})
Grad(UI.StatusFill, Theme.Accent, Theme.Accent2, 0)

UI.StatusDot = New("Frame", {
    Size = UDim2.new(0, 7, 0, 7),
    Position = UDim2.new(0, 15, 0.5, -3.5),
    BackgroundColor3 = Theme.Dim,
    BorderSizePixel = 0,
    Parent = UI.Footer,
})
Circle(UI.StatusDot)

UI.StatusLabel = Fnt(New("TextLabel", {
    Text = "空闲 Idle",
    Size = UDim2.new(1, -46, 1, 0),
    Position = UDim2.new(0, 29, 0, 0),
    BackgroundTransparency = 1,
    TextColor3 = Theme.Sub,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = UI.Footer,
}), W.Medium)

--=================================================================
-- 状态 / 逻辑（与原脚本一致）
--=================================================================
local Player = Players.LocalPlayer
local TargetPlayer, LastPlayer = false, false
local SpectateDB, AttachDB = false, false
local PosX, PosY, PosZ, AngX, AngY, AngZ = 0, 0, 0, 0, 0, 0
local TargetPartName = "HumanoidRootPart"
local LivePlayers = {}
local TargetRespawnConnection = nil
local ActiveDummy = nil
local FallenPartsBackup = workspace.FallenPartsDestroyHeight
local Minimized = false
local IsOpen = true
local Closed = false

local PartFallbacks = {
    ["UpperTorso"]    = {"Torso"},
    ["LowerTorso"]    = {"Torso"},
    ["LeftUpperArm"]  = {"Left Arm"},
    ["LeftLowerArm"]  = {"Left Arm"},
    ["LeftHand"]      = {"Left Arm"},
    ["RightUpperArm"] = {"Right Arm"},
    ["RightLowerArm"] = {"Right Arm"},
    ["RightHand"]     = {"Right Arm"},
    ["LeftUpperLeg"]  = {"Left Leg"},
    ["LeftLowerLeg"]  = {"Left Leg"},
    ["LeftFoot"]      = {"Left Leg"},
    ["RightUpperLeg"] = {"Right Leg"},
    ["RightLowerLeg"] = {"Right Leg"},
    ["RightFoot"]     = {"Right Leg"},
    ["Torso"]         = {"UpperTorso", "LowerTorso"},
    ["Left Arm"]      = {"LeftUpperArm", "LeftLowerArm", "LeftHand"},
    ["Right Arm"]     = {"RightUpperArm", "RightLowerArm", "RightHand"},
    ["Left Leg"]      = {"LeftUpperLeg", "LeftLowerLeg", "LeftFoot"},
    ["Right Leg"]     = {"RightUpperLeg", "RightLowerLeg", "RightFoot"},
}

local function ResolvePartName(character, preferredName)
    if not character then return preferredName end
    if character:FindFirstChild(preferredName) then return preferredName end
    local fallbacks = PartFallbacks[preferredName]
    if fallbacks then
        for _, alt in next, fallbacks do
            if character:FindFirstChild(alt) then return alt end
        end
    end
    return preferredName
end

local function GetTargetPart(character, targetName)
    if not character then return nil end

    local exactMatch = character:FindFirstChild(targetName)
    if exactMatch then return exactMatch end

    local baseName, indexStr = targetName:match("^(.-)_(%d+)$")
    if baseName and tonumber(indexStr) then
        local targetIndex = tonumber(indexStr)
        local currentIdx = 0
        for _, obj in next, character:GetDescendants() do
            if obj:IsA("BasePart") and obj.Name == baseName then
                currentIdx = currentIdx + 1
                if currentIdx == targetIndex then
                    return obj
                end
            end
        end
    end

    local resolvedName = ResolvePartName(character, targetName)
    return character:FindFirstChild(resolvedName) or character:FindFirstChild("HumanoidRootPart")
end

local function hidprot(instance, property, value)
    if sethiddenproperty then
        sethiddenproperty(instance, property, value)
        return
    end
    if not setscriptable then
        return warn("Neither sethiddenproperty nor setscriptable exist in this environment.")
    end
    local success, err = pcall(function()
        setscriptable(instance, property, true)
        instance[property] = value
        setscriptable(instance, property, false)
    end)
    if not success then warn("Failed to set property: " .. tostring(err)) end
end

local function GetPlayers(Name)
    local ReturnedPlayers = {}
    if type(Name) ~= "string" then return false end
    Name = Name:lower()
    for _, x in next, Players:GetPlayers() do
        if x ~= Player then
            local MatchedName = "^" .. Name
            local Username = x.Name:lower()
            local DisplayNameL = x.DisplayName:lower()
            if Username:match(MatchedName) or DisplayNameL:match(MatchedName) then
                ReturnedPlayers[x] = true
            end
        end
    end
    return ReturnedPlayers
end

local function SetStatus(text, color)
    UI.StatusLabel.Text = text
    UI.StatusDot.BackgroundColor3 = color or Theme.Accent
    UI.StatusFill.Size = UDim2.new(1, 0, 1, 0)
    task.delay(0.35, function()
        if Closed then return end
        Tween(UI.StatusFill, 0.45, { Size = UDim2.new(0, 0, 1, 0) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    end)
end

--=========================== 目标玩家 ===========================--
local PopulatePartList        -- 前置声明
local TriggerReanchor         -- 前置声明
local StopPresetAnim          -- 前置声明
local ReturnValues            -- 前置声明
local RefreshActionButtons    -- 前置声明

local function SetTargetPart(name, silent)
    if not name or name == "" then return end
    local changed = (TargetPartName ~= name)
    TargetPartName = name
    UI.PartLabel.Text = name
    if not silent then PopulatePartList(UI.PartSearch.Text) end
    if changed then TriggerReanchor() end
end

local AddPlayer, RemovePlayer

local function SelectPlayer(plr, thumb, item)
    local TargetChanged = (TargetPlayer ~= plr)
    TargetPlayer = plr
    LastPlayer = plr

    for _, entry in next, LivePlayers do
        entry.style(false)
    end
    item.style(true)

    UI.TargetAvatar.Image = thumb
    UI.TargetAvatar.BackgroundTransparency = 0
    UI.TargetName.Text = plr.DisplayName
    UI.TargetUser.Text = "@" .. plr.Name
    UI.TargetCard.BackgroundTransparency = 0.25
    UI.TargetCardStroke.Transparency = 0.25

    SetStatus("目标 Target: " .. plr.DisplayName, Theme.Green)

    if TargetRespawnConnection then
        TargetRespawnConnection:Disconnect()
        TargetRespawnConnection = nil
    end
    TargetRespawnConnection = plr.CharacterAdded:Connect(function()
        if AttachDB then TriggerReanchor() end
        task.wait(0.5)
        if Closed then return end
        PopulatePartList(UI.PartSearch.Text)
    end)

    if TargetChanged then TriggerReanchor() end
    PopulatePartList(UI.PartSearch.Text)
end

AddPlayer = function(NewPlayer)
    if LastPlayer and NewPlayer.Name == LastPlayer.Name then TargetPlayer = NewPlayer end
    if LivePlayers[NewPlayer] then return end

    local Thumb = Players:GetUserThumbnailAsync(NewPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

    local item = New("TextButton", {
        Size = UDim2.new(1, -8, 0, 48),
        LayoutOrder = NextOrder(UI.PlayerList),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.4,
        AutoButtonColor = false,
        Text = "",
        Parent = UI.PlayerList,
    })
    Corner(item, 11)
    local itemStroke = Stroke(item, Theme.Stroke, 1, 0.75)

    local bar = New("Frame", {
        Size = UDim2.new(0, 3, 0, 22),
        Position = UDim2.new(0, 0, 0.5, -11),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Visible = false,
        Parent = item,
    })
    Corner(bar, 4)

    local avatar = New("ImageLabel", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(0, 10, 0.5, -16),
        BackgroundColor3 = Theme.Track,
        BackgroundTransparency = 0.3,
        Image = Thumb,
        BorderSizePixel = 0,
        Parent = item,
    })
    Circle(avatar)

    local name = Fnt(New("TextLabel", {
        Text = NewPlayer.DisplayName,
        Size = UDim2.new(1, -52, 0, 16),
        Position = UDim2.new(0, 50, 0, 8),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = item,
    }), W.Bold)

    local uname = Fnt(New("TextLabel", {
        Text = "@" .. NewPlayer.Name,
        Size = UDim2.new(1, -52, 0, 12),
        Position = UDim2.new(0, 50, 0, 25),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Sub,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = item,
    }), W.Regular)

    local selected = false
    local function style(isSelected)
        selected = isSelected
        item.BackgroundColor3 = isSelected and Theme.SurfaceHi or Theme.Surface
        item.BackgroundTransparency = isSelected and 0.15 or 0.4
        itemStroke.Transparency = isSelected and 0.55 or 0.8
        bar.Visible = isSelected
        name.TextColor3 = Theme.Text
        uname.TextColor3 = isSelected and Theme.Accent or Theme.Sub
    end

    item.MouseEnter:Connect(function()
        if selected then return end
        Tween(item, 0.12, { BackgroundColor3 = Theme.SurfaceHi, BackgroundTransparency = 0.3 })
    end)
    item.MouseLeave:Connect(function()
        if selected then return end
        Tween(item, 0.14, { BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.4 })
    end)
    item.MouseButton1Click:Connect(function()
        SelectPlayer(NewPlayer, Thumb, { style = style })
    end)

    LivePlayers[NewPlayer] = { item = item, style = style }
end

RemovePlayer = function(PlayerToRemove)
    if PlayerToRemove == TargetPlayer then
        TargetPlayer = false
        if TargetRespawnConnection then
            TargetRespawnConnection:Disconnect()
            TargetRespawnConnection = nil
        end
        UI.TargetAvatar.Image = ""
        UI.TargetAvatar.BackgroundTransparency = 0.35
        UI.TargetName.Text = "未选择目标"
        UI.TargetUser.Text = "从上方列表选择玩家"
        UI.TargetCard.BackgroundTransparency = 0.35
        UI.TargetCardStroke.Transparency = 0.5
        SetStatus("目标已离开游戏", Theme.Amber)
    end
    local entry = LivePlayers[PlayerToRemove]
    if entry then
        entry.item:Destroy()
        LivePlayers[PlayerToRemove] = nil
    end
end

--=========================== 部位列表 ===========================--
local LivePartButtons = {}

PopulatePartList = function(filterText)
    for _, btn in next, LivePartButtons do
        btn:Destroy()
    end
    LivePartButtons = {}

    local parts = {}

    if TargetPlayer and TargetPlayer.Character then
        local nameCounts, nameIndex = {}, {}

        for _, obj in next, TargetPlayer.Character:GetDescendants() do
            if obj:IsA("BasePart") then
                nameCounts[obj.Name] = (nameCounts[obj.Name] or 0) + 1
            end
        end

        for _, obj in next, TargetPlayer.Character:GetDescendants() do
            if obj:IsA("BasePart") then
                local pName = obj.Name
                if nameCounts[pName] > 1 then
                    nameIndex[pName] = (nameIndex[pName] or 0) + 1
                    table.insert(parts, pName .. "_" .. nameIndex[pName])
                else
                    if not nameIndex[pName] then
                        nameIndex[pName] = 1
                        table.insert(parts, pName)
                    end
                end
            end
        end
    else
        parts = {
            "HumanoidRootPart", "Head",
            "UpperTorso", "LowerTorso",
            "LeftUpperArm", "LeftLowerArm", "LeftHand",
            "RightUpperArm", "RightLowerArm", "RightHand",
            "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
            "RightUpperLeg", "RightLowerLeg", "RightFoot",
            "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg",
        }
    end
    table.sort(parts)

    local filter = (filterText or ""):lower()
    for _, partName in next, parts do
        if filter == "" or string.find(string.lower(partName), filter, 1, true) then
            local isSelected = (partName == TargetPartName)
            local btn = Fnt(New("TextButton", {
                Size = UDim2.new(1, 0, 0, 24),
                LayoutOrder = NextOrder(UI.PartList),
                BackgroundColor3 = isSelected and Theme.Accent or Theme.Surface,
                BackgroundTransparency = isSelected and 0.55 or 0.45,
                Text = partName,
                TextColor3 = isSelected and Theme.White or Theme.Sub,
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutoButtonColor = false,
                BorderSizePixel = 0,
                Parent = UI.PartList,
            }), isSelected and W.Bold or W.Regular)
            Corner(btn, 6)
            New("UIPadding", {
                Parent = btn,
                PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8),
            })

            btn.MouseEnter:Connect(function()
                if partName ~= TargetPartName then
                    Tween(btn, 0.1, { BackgroundColor3 = Theme.SurfaceHi, TextColor3 = Theme.Text })
                end
            end)
            btn.MouseLeave:Connect(function()
                if partName ~= TargetPartName then
                    Tween(btn, 0.12, { BackgroundColor3 = Theme.Surface, TextColor3 = Theme.Sub })
                end
            end)
            btn.MouseButton1Click:Connect(function()
                SetTargetPart(partName)
                SetStatus("部位 Part: " .. partName, Theme.Accent)
            end)

            table.insert(LivePartButtons, btn)
        end
    end
end

--=========================== 偏移同步 ===========================--
local OnSliderSync = nil

ReturnValues = function()
    local p = function(t) return tonumber(t) or 0 end
    local oldPosX, oldPosY, oldPosZ = PosX, PosY, PosZ
    local oldAngX, oldAngY, oldAngZ = AngX, AngY, AngZ

    PosX, PosY, PosZ = p(Sliders.PosXBox.Text), p(Sliders.PosYBox.Text), p(Sliders.PosZBox.Text)
    AngX, AngY, AngZ = p(Sliders.AngXBox.Text), p(Sliders.AngYBox.Text), p(Sliders.AngZBox.Text)

    if OnSliderSync then OnSliderSync() end

    if oldPosX ~= PosX or oldPosY ~= PosY or oldPosZ ~= PosZ
        or oldAngX ~= AngX or oldAngY ~= AngY or oldAngZ ~= AngZ then
        TriggerReanchor()
    end
end

local function AcceptDigitsOnly(...)
    for _, x in next, {...} do
        x:GetPropertyChangedSignal("Text"):Connect(function()
            x.Text = x.Text:match("^%-?%d*%.?%d*") or ""
            ReturnValues()
        end)
    end
end

AcceptDigitsOnly(
    Sliders.PosXBox, Sliders.PosYBox, Sliders.PosZBox,
    Sliders.AngXBox, Sliders.AngYBox, Sliders.AngZBox,
    UI.PresetAnim
)

local function SyncSliders()
    Sliders.PosX(Sliders.PosXBox.Text)
    Sliders.PosY(Sliders.PosYBox.Text)
    Sliders.PosZ(Sliders.PosZBox.Text)
    Sliders.AngX(Sliders.AngXBox.Text)
    Sliders.AngY(Sliders.AngYBox.Text)
    Sliders.AngZ(Sliders.AngZBox.Text)
end
OnSliderSync = SyncSliders

for _, box in next, {
    Sliders.PosXBox, Sliders.PosYBox, Sliders.PosZBox,
    Sliders.AngXBox, Sliders.AngYBox, Sliders.AngZBox,
} do
    box.FocusLost:Connect(SyncSliders)
end

--=========================== 重新锚定 ===========================--
TriggerReanchor = function()
    if not AttachDB then return end
    task.spawn(function()
        local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if Root then
            Root.Anchored = false
            task.wait(0.1)
            if Closed then return end
            Root.Anchored = true
        end
    end)
end

--=========================== 预设动画 ===========================--
local CurrentPresetAnim = nil

StopPresetAnim = function()
    if CurrentPresetAnim then
        pcall(function() CurrentPresetAnim:Stop() end)
        pcall(function() CurrentPresetAnim:Destroy() end)
        CurrentPresetAnim = nil
    end
end

local function PlayPresetAnim(animId, animPos)
    StopPresetAnim()
    local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return end
    local animObj = Instance.new("Animation")
    animObj.AnimationId = "rbxassetid://" .. tostring(animId)
    local track = animator:LoadAnimation(animObj)
    track.Priority = Enum.AnimationPriority.Action3
    track:Play()
    track:AdjustSpeed(0)
    track.TimePosition = animPos or 0
    CurrentPresetAnim = track
    animObj:Destroy()
end

local function SetPreset(px, py, pz, ax, ay, az, partName, animId, animSpeed)
    StopPresetAnim()
    Sliders.PosXBox.Text = tostring(px)
    Sliders.PosYBox.Text = tostring(py)
    Sliders.PosZBox.Text = tostring(pz)
    Sliders.AngXBox.Text = tostring(ax)
    Sliders.AngYBox.Text = tostring(ay)
    Sliders.AngZBox.Text = tostring(az)

    if partName then
        SetTargetPart(ResolvePartName(TargetPlayer and TargetPlayer.Character or nil, partName), false)
    end

    ReturnValues()

    if animId and tonumber(animId) then
        PlayPresetAnim(animId, animSpeed or 0)
    end
    SetStatus("已应用预设 Preset applied", Theme.Green)
end

local function CreatePreset(Name, px, py, pz, ax, ay, az, partName, animId, animSpeed)
    local b = Fnt(New("TextButton", {
        Text = Name,
        Size = UDim2.new(0, 103, 0, 30),
        LayoutOrder = NextOrder(UI.PresetGrid),
        BackgroundColor3 = Theme.Surface,
        BackgroundTransparency = 0.4,
        TextColor3 = Theme.Text,
        TextSize = 11,
        TextTruncate = Enum.TextTruncate.AtEnd,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Parent = UI.PresetGrid,
    }), W.SemiBold)
    Corner(b, 8)
    local s = Stroke(b, Theme.Stroke, 1, 0.8)
    b.MouseEnter:Connect(function()
        Tween(b, 0.13, { BackgroundColor3 = Theme.SurfaceHi, BackgroundTransparency = 0.2, TextColor3 = Theme.White })
        s.Transparency = 0.5
    end)
    b.MouseLeave:Connect(function()
        Tween(b, 0.15, { BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.4, TextColor3 = Theme.Text })
        s.Transparency = 0.8
    end)
    b.MouseButton1Click:Connect(function()
        SetPreset(px, py, pz, ax, ay, az, partName, animId, animSpeed)
    end)
end

--=========================== 预设存取 ===========================--
local PresetFileName = "AttachHub_CustomPresets.txt"
local CustomSavedPresets = {}

local function SerializePresets(presets)
    local lines = {}
    table.insert(lines, "# Attach Hub - Custom Presets")
    table.insert(lines, "# Edit freely. Each preset starts with '== PRESET ==' and each line below it is 'Label: value'.")
    table.insert(lines, "")
    for _, preset in ipairs(presets) do
        table.insert(lines, "== PRESET ==")
        table.insert(lines, "Name: " .. tostring(preset.Name))
        table.insert(lines, string.format("Position: %s, %s, %s", tostring(preset.PosX), tostring(preset.PosY), tostring(preset.PosZ)))
        table.insert(lines, string.format("Rotation: %s, %s, %s", tostring(preset.AngX), tostring(preset.AngY), tostring(preset.AngZ)))
        table.insert(lines, "Part: " .. tostring(preset.PartName))
        table.insert(lines, "AnimationId: " .. (preset.AnimId and tostring(preset.AnimId) or "(none)"))
        table.insert(lines, "AnimationSpeed: " .. tostring(preset.AnimSpeed or 0))
        table.insert(lines, "")
    end
    return table.concat(lines, "\n")
end

local function DeserializePresets(text)
    local presets = {}
    local current = nil

    local function commitCurrent()
        if current and current.Name then
            table.insert(presets, current)
        end
    end

    for line in text:gmatch("[^\r\n]+") do
        local trimmed = line:match("^%s*(.-)%s*$")
        if trimmed == "" or trimmed:sub(1, 1) == "#" then
            -- 注释 / 空行，跳过
        elseif trimmed == "== PRESET ==" then
            commitCurrent()
            current = { PosX = 0, PosY = 0, PosZ = 0, AngX = 0, AngY = 0, AngZ = 0, PartName = "HumanoidRootPart", AnimSpeed = 0 }
        elseif current then
            local label, value = trimmed:match("^(%a+):%s*(.-)%s*$")
            if label == "Name" then
                current.Name = value
            elseif label == "Part" then
                current.PartName = value
            elseif label == "Position" then
                local x, y, z = value:match("^(.-),%s*(.-),%s*(.-)$")
                current.PosX = tonumber(x) or 0
                current.PosY = tonumber(y) or 0
                current.PosZ = tonumber(z) or 0
            elseif label == "Rotation" then
                local x, y, z = value:match("^(.-),%s*(.-),%s*(.-)$")
                current.AngX = tonumber(x) or 0
                current.AngY = tonumber(y) or 0
                current.AngZ = tonumber(z) or 0
            elseif label == "AnimationId" then
                current.AnimId = tonumber(value)
            elseif label == "AnimationSpeed" then
                current.AnimSpeed = tonumber(value) or 0
            end
        end
    end
    commitCurrent()
    return presets
end

local function SaveCustomPresets()
    if not writefile then
        warn("writefile is missing, cannot save presets")
        return
    end
    local success, err = pcall(function()
        writefile(PresetFileName, SerializePresets(CustomSavedPresets))
    end)
    if not success then warn("Failed to write preset file:", err) end
end

local function LoadCustomPresets()
    if not (readfile and isfile) then
        warn("readfile/isfile are missing, cannot load presets")
        return
    end
    if not isfile(PresetFileName) then return end

    local success, data = pcall(function()
        return DeserializePresets(readfile(PresetFileName))
    end)
    if success and type(data) == "table" then
        CustomSavedPresets = data
        for _, preset in ipairs(CustomSavedPresets) do
            CreatePreset(
                preset.Name, preset.PosX, preset.PosY, preset.PosZ,
                preset.AngX, preset.AngY, preset.AngZ,
                preset.PartName, preset.AnimId, preset.AnimSpeed
            )
        end
    else
        warn("Failed to read preset file or file is corrupted.")
    end
end

CreatePreset("Head Sit", 0, 2.5, 1.8, 0, 0, 0, "Head", 179224234, 0)
CreatePreset("Sword", 0, -1.2, -1, -90, 90, 0, "RightLowerArm")
CreatePreset("Sit", 0, -1.2, -1, -90, 0, 0, "LowerTorso", 179224234, 0)
CreatePreset("Skydive", 0, -2, 0, 90, 0, 0, "HumanoidRootPart")

LoadCustomPresets()

--=================================================================
-- 观战 / 附着
--=================================================================
local function Spectate()
    SpectateDB = not SpectateDB
    if SpectateDB then
        SetStatus("正在观战 " .. (TargetPlayer and TargetPlayer.DisplayName or "?"), Theme.Accent2)
        task.spawn(function()
            while SpectateDB do
                local cam = workspace.CurrentCamera
                if TargetPlayer and TargetPlayer.Character and cam then
                    cam.CameraSubject = TargetPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                end
                task.wait()
            end
        end)
    else
        SetStatus("已停止观战", Theme.Accent)
        local cam = workspace.CurrentCamera
        local hum = Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
        if cam and hum then cam.CameraSubject = hum end
    end
    RefreshActionButtons()
end

local function AttachFunc()
    AttachDB = not AttachDB

    if AttachDB then
        SetStatus("已附着 " .. (TargetPlayer and TargetPlayer.DisplayName or "?"), Theme.Green)

        task.spawn(function()
            task.wait(0.1)
            if not AttachDB or Closed then return end
            local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if Root then Root.Anchored = true end
        end)

        local Char = Player.Character
        local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
        if Char and Hum then
            local success, desc = pcall(function() return Hum:GetAppliedDescription() end)
            if not success or not desc then
                desc = Instance.new("HumanoidDescription")
            end

            ActiveDummy = Players:CreateHumanoidModelFromDescription(desc, Hum.RigType)

            for _, part in pairs(ActiveDummy:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    part.Massless = true
                    part.Anchored = false
                end
            end

            local dummyRoot = ActiveDummy:FindFirstChild("HumanoidRootPart") or ActiveDummy.PrimaryPart
            if dummyRoot then dummyRoot.Anchored = true end

            ActiveDummy.Parent = workspace
            local cam = workspace.CurrentCamera
            if cam then cam.CameraSubject = ActiveDummy:FindFirstChildOfClass("Humanoid") end

            task.spawn(function()
                local dummyHum = ActiveDummy and ActiveDummy:FindFirstChildOfClass("Humanoid")
                local dummyAnimator = dummyHum and (dummyHum:FindFirstChildOfClass("Animator") or Instance.new("Animator", dummyHum))
                local activeTracks = {}

                while AttachDB and ActiveDummy and ActiveDummy.Parent do
                    if Hum and Hum.Parent and dummyAnimator then
                        for _, track in pairs(Hum:GetPlayingAnimationTracks()) do
                            if not activeTracks[track.Animation.AnimationId] then
                                local newAnim = Instance.new("Animation")
                                newAnim.AnimationId = track.Animation.AnimationId
                                local dummyTrack = dummyAnimator:LoadAnimation(newAnim)
                                dummyTrack:Play()
                                activeTracks[track.Animation.AnimationId] = { real = track, dummy = dummyTrack }
                            end
                        end

                        for id, pair in pairs(activeTracks) do
                            if pair.real.IsPlaying then
                                pcall(function()
                                    pair.dummy.TimePosition = pair.real.TimePosition
                                    pair.dummy:AdjustWeight(pair.real.WeightTarget, 0)
                                    pair.dummy:AdjustSpeed(pair.real.Speed)
                                end)
                            else
                                pair.dummy:Stop()
                                activeTracks[id] = nil
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end

        task.spawn(function()
            while AttachDB do
                if TargetPlayer and TargetPlayer.Character then
                    local RootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                    local TPart = GetTargetPart(TargetPlayer.Character, TargetPartName)

                    if RootPart and TPart then
                        TPart.Velocity = Vector3.zero
                        TPart.RotVelocity = Vector3.zero
                        local hum = Player.Character:FindFirstChildOfClass("Humanoid")
                        if hum then hum:ChangeState(Enum.HumanoidStateType.None) end
                        hidprot(RootPart, "PhysicsRepRootPart", TPart)

                        local localOffset = CFrame.new(PosX, PosY, PosZ) * CFrame.Angles(math.rad(AngX), math.rad(AngY), math.rad(AngZ))

                        if ActiveDummy and ActiveDummy:FindFirstChild("HumanoidRootPart") then
                            ActiveDummy.HumanoidRootPart.CFrame = TPart.CFrame * localOffset
                        end

                        local invTargetRotation = TPart.CFrame.Rotation:Inverse()
                        local counterWorldPos = invTargetRotation * (TPart.CFrame.Rotation * Vector3.new(PosX, PosY, PosZ))
                        local counterWorldRot = invTargetRotation * (TPart.CFrame.Rotation * CFrame.Angles(math.rad(AngX), math.rad(AngY), math.rad(AngZ)))

                        RootPart.CFrame = CFrame.new(counterWorldPos) * counterWorldRot

                        RootPart.RotVelocity = Vector3.zero
                        RootPart.Velocity = Vector3.zero
                    end
                end
                task.wait()
            end
        end)

        RefreshActionButtons()

    else
        SetStatus("已脱离 Detached", Theme.Amber)
        StopPresetAnim()

        local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if Root then
            Root.Anchored = false
            pcall(function() hidprot(Root, "PhysicsRepRootPart", nil) end)

            if ActiveDummy and ActiveDummy:FindFirstChild("HumanoidRootPart") then
                Root.CFrame = ActiveDummy.HumanoidRootPart.CFrame
            end
        end

        if ActiveDummy then
            ActiveDummy:Destroy()
            ActiveDummy = nil
        end

        local cam = workspace.CurrentCamera
        local hum = Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
        if cam and hum then cam.CameraSubject = hum end
    end

    RefreshActionButtons()
end

--=================================================================
-- 打开 / 关闭 / 最小化
--=================================================================
local function SetOpen(open)
    if Closed then return end
    IsOpen = open
    if open then
        UI.Window.Visible = true
        UI.WinScale.Scale = 0.94
        UI.Panel.Position = UDim2.new(0.5, 0, 0.5, 12)
        Tween(UI.WinScale, 0.24, { Scale = 1 }, Enum.EasingStyle.Quint)
        Tween(UI.Panel, 0.26, { Position = UDim2.new(0.5, 0, 0.5, 0) }, Enum.EasingStyle.Quint)
    else
        Tween(UI.WinScale, 0.16, { Scale = 0.94 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        Tween(UI.Panel, 0.18, { Position = UDim2.new(0.5, 0, 0.5, 12) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        task.delay(0.18, function()
            if not IsOpen and not Closed then UI.Window.Visible = false end
        end)
    end
end

-- 探测「Position 偏移单位 -> 屏幕像素」的真实比例（不同版本 UIScale 行为不同）
local function PerOffsetUnit(sample)
    local p = UI.Window.Position
    local before = UI.Window.AbsolutePosition.Y
    UI.Window.Position = UDim2.new(p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset + sample)
    local after = UI.Window.AbsolutePosition.Y
    UI.Window.Position = p
    return (after - before) / sample
end

local function SetMinimized(min)
    if Closed or Minimized == min then return end

    local currentH = UI.Window.AbsoluteSize.Y
    local scaleFactor
    if Minimized then
        scaleFactor = currentH / HEADER_H
    else
        scaleFactor = currentH / BASE_H
    end
    if not scaleFactor or scaleFactor ~= scaleFactor or scaleFactor <= 0 then scaleFactor = 1 end

    Minimized = min

    local perUnit = PerOffsetUnit(100)
    local shiftPixels = (BASE_H - HEADER_H) * scaleFactor * 0.5
    local shiftUnits = 0
    if perUnit and math.abs(perUnit) > 0.0001 then
        shiftUnits = shiftPixels / perUnit
    end

    local p = UI.Window.Position
    local targetY = min and (p.Y.Offset - shiftUnits) or (p.Y.Offset + shiftUnits)

    Tween(UI.Window, 0.28, {
        Size = min and UDim2.new(1, 0, 0, HEADER_H) or UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(p.X.Scale, p.X.Offset, p.Y.Scale, targetY),
    }, Enum.EasingStyle.Quint, min and Enum.EasingDirection.In or Enum.EasingDirection.Out)

    UI.MinBtn.Text = min and "+" or "–"
    UI.Divider.Visible = not min
    SetStatus(min and "已最小化——点击 + 展开" or "已还原", Theme.Dim)
end

-- 自适应缩放
local function ComputeScale()
    local cam = workspace.CurrentCamera
    local vp = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
    local s
    if IsMobile then
        -- 手机上尽量撑满宽度，同时限制高度占比
        s = math.min(vp.X * 0.86 / BASE_W, vp.Y * 0.64 / BASE_H)
    else
        s = math.min((vp.X - 60) / BASE_W, (vp.Y - 110) / BASE_H)
    end
    if IsMobile then
        s = math.clamp(s, 0.55, 2.6)
    else
        s = math.clamp(s, 0.55, 1.08)
    end
    -- 硬上限：无论公式算出什么，窗口都必须完整放得下
    local limit = math.min((vp.X - 40) / BASE_W, (vp.Y - 40) / BASE_H)
    return math.min(s, limit)
end

local function ApplyScale()
    local s = ComputeScale()
    UI.Responsive.Scale = s
    local ts = math.clamp(s, 0.75, 1.75)
    UI.Toggle.Size = UDim2.new(0, math.floor(54 * ts + 0.5), 0, math.floor(54 * ts + 0.5))
end

--=================================================================
-- 事件绑定
--=================================================================
-- 关闭：销毁 UI + 停止所有行为
local function Cleanup()
    if Closed then return end
    Closed = true
    _G.__AttachHubPro_Stop = nil

    AttachDB = false
    SpectateDB = false

    pcall(StopPresetAnim)

    if TargetRespawnConnection then
        pcall(function() TargetRespawnConnection:Disconnect() end)
        TargetRespawnConnection = nil
    end

    local char = Player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        pcall(function()
            root.Anchored = false
            root.Velocity = Vector3.zero
            root.RotVelocity = Vector3.zero
        end)
        pcall(function() hidprot(root, "PhysicsRepRootPart", nil) end)
    end

    if ActiveDummy then
        pcall(function() ActiveDummy:Destroy() end)
        ActiveDummy = nil
    end

    local cam = workspace.CurrentCamera
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    if cam and hum then pcall(function() cam.CameraSubject = hum end) end

    pcall(function() workspace.FallenPartsDestroyHeight = FallenPartsBackup end)

    UnbindAll()
    pcall(function() UI.Root:Destroy() end)
end

_G.__AttachHubPro_Stop = Cleanup
UI.CloseBtn.MouseButton1Click:Connect(Cleanup)
UI.MinBtn.MouseButton1Click:Connect(function() SetMinimized(not Minimized) end)

local toggleDragged = MakeDraggable(UI.Toggle, UI.Toggle, ScreenClamp)
UI.Toggle.MouseButton1Click:Connect(function()
    if toggleDragged() then return end
    SetOpen(not IsOpen)
end)

MakeDraggable(UI.Window, UI.Header, ScreenClamp)

-- 标签切换
local function ShowTab(which)
    local attachActive = (which == "attach")
    UI.PageAttach.Visible = attachActive
    UI.PagePresets.Visible = not attachActive
    UI.TabAttach.TextColor3 = attachActive and Theme.White or Theme.Sub
    UI.TabPresets.TextColor3 = attachActive and Theme.Sub or Theme.White
    Tween(UI.TabHighlight, 0.22, {
        Position = attachActive and UDim2.new(0, 4, 0, 4) or UDim2.new(0.5, 0, 0, 4),
    }, Enum.EasingStyle.Quint)
end

UI.TabAttach.MouseButton1Click:Connect(function() ShowTab("attach") end)
UI.TabPresets.MouseButton1Click:Connect(function() ShowTab("presets") end)

-- 观战 / 附着按钮状态同步
RefreshActionButtons = function()
    if SpectateDB then
        UI.ViewBtn.Text = "取消观战"
        UI.ViewBtn.BackgroundColor3 = Theme.Accent2
        UI.ViewBtn.BackgroundTransparency = 0.2
        UI.ViewBtn.TextColor3 = Theme.White
        UI.ViewStroke.Transparency = 0.5
    else
        UI.ViewBtn.Text = "观战 View"
        UI.ViewBtn.BackgroundColor3 = Theme.Surface
        UI.ViewBtn.BackgroundTransparency = 0.35
        UI.ViewBtn.TextColor3 = Theme.Text
        UI.ViewStroke.Transparency = 0.7
    end

    if AttachDB then
        UI.AttachBtn.Text = "取消附着"
        UI.AttachGrad.Color = ColorSequence.new(Theme.Red, Color3.fromRGB(255, 150, 120))
        UI.AttachBtn.BackgroundTransparency = 0.15
    else
        UI.AttachBtn.Text = "附着 Attach"
        UI.AttachGrad.Color = ColorSequence.new(Theme.Accent, Theme.Accent2)
        UI.AttachBtn.BackgroundTransparency = 0.15
    end
end

UI.ViewBtn.MouseEnter:Connect(function() Tween(UI.ViewBtn, 0.12, { BackgroundTransparency = 0.1 }) end)
UI.ViewBtn.MouseLeave:Connect(function() RefreshActionButtons() end)
UI.AttachBtn.MouseEnter:Connect(function() Tween(UI.AttachBtn, 0.12, { BackgroundTransparency = 0 }) end)
UI.AttachBtn.MouseLeave:Connect(function() RefreshActionButtons() end)

UI.ViewBtn.MouseButton1Click:Connect(Spectate)
UI.AttachBtn.MouseButton1Click:Connect(AttachFunc)

-- 玩家搜索 / 列表
UI.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local Res = GetPlayers(UI.SearchBox.Text)
    for plr, entry in next, LivePlayers do
        entry.item.Visible = (UI.SearchBox.Text == "" or Res[plr])
    end
end)

Bind(Players.PlayerAdded, function(plr) task.spawn(AddPlayer, plr) end)
Bind(Players.PlayerRemoving, RemovePlayer)
for _, x in next, Players:GetPlayers() do
    if x ~= Player then task.spawn(AddPlayer, x) end
end

-- 部位搜索
UI.PartSearch:GetPropertyChangedSignal("Text"):Connect(function()
    PopulatePartList(UI.PartSearch.Text)
end)

-- 重置偏移
UI.ResetBtn.MouseButton1Click:Connect(function()
    Sliders.PosXBox.Text = "0"
    Sliders.PosYBox.Text = "0"
    Sliders.PosZBox.Text = "0"
    Sliders.AngXBox.Text = "0"
    Sliders.AngYBox.Text = "0"
    Sliders.AngZBox.Text = "0"
    ReturnValues()
    SetStatus("偏移已重置", Theme.Accent)
end)

-- 添加自定义预设
UI.PresetAdd.MouseButton1Click:Connect(function()
    local pName = UI.PresetName.Text ~= "" and UI.PresetName.Text or "Custom"
    local aId = UI.PresetAnim.Text ~= "" and tonumber(UI.PresetAnim.Text) or nil

    table.insert(CustomSavedPresets, {
        Name = pName,
        PosX = PosX, PosY = PosY, PosZ = PosZ,
        AngX = AngX, AngY = AngY, AngZ = AngZ,
        PartName = TargetPartName,
        AnimId = aId,
        AnimSpeed = 0,
    })

    SaveCustomPresets()
    CreatePreset(pName, PosX, PosY, PosZ, AngX, AngY, AngZ, TargetPartName, aId, 0)

    UI.PresetName.Text = ""
    UI.PresetAnim.Text = ""
    SetStatus("预设已保存到文件", Theme.Green)
end)

-- 视口尺寸变化 -> 重新适配
local lastViewport
Bind(RunService.Heartbeat, function()
    local cam = workspace.CurrentCamera
    if not cam then return end
    local vp = cam.ViewportSize
    if vp ~= lastViewport then
        lastViewport = vp
        ApplyScale()
    end
end)

--=================================================================
-- 初始化
--=================================================================
UI.Root.Enabled = true
ApplyScale()
SetOpen(true)
ShowTab("attach")
Sequence(UI.PageAttach)
Sequence(UI.PagePresets)
PopulatePartList("")
task.defer(function()
    pcall(function() UI.PageAttach.CanvasPosition = Vector2.new(0, 0) end)
end)
SetStatus("就绪 Ready", Theme.Green)

workspace.FallenPartsDestroyHeight = 0 / 0
