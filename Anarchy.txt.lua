if not isfolder("Axirian Assets") then makefolder("Axirian Assets") end
if not isfolder("Axirian Assets/VFX") then makefolder("Axirian Assets/VFX") end

local baseUrl = "https://raw.githubusercontent.com/Jskfhggjxu/Axirian-glicher-Assets/main/"
local execScript = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Anarchy.lua"))()
end

local files = {
    VFX = {
        "Anarchus.lua", "Arithios.lua", "Axius.lua", "Censored.lua", "Cheastreal.lua",
        "Chromatic.lua", "Dimension.lua", "Fatal.lua", "FetLib.lua", "Gaia.lua",
        "HYPERINTERVENTION.lua", "Horion.lua", "Mayhem.lua", "Nebulabrasque.lua",
        "Nholriction.lua", "Pyroplex.lua", "Scourge.lua", "Tachyon.lua", "Torment.lua",
        "Vibrance.lua", "Zionithic.lua", "Lexapratic.lua"
    },
    Root = {
        "Aegisseeker.mp3", "Anomaly.mp3", "Censored.mp3", "Cheastreal.mp3", "Cheastreal1.mp3",
        "Dance On The Mars.mp3", "Dark Matter.mp3", "Deorc Decuple.mp3", "Dimension.mp3",
        "EQUINOX.mp3", "Epistula Noctis.mp3", "Gaia.mp3", "Hall.mp3", "Hyper Hexed Hero.mp3",
        "I Am Unbreakable.mp3", "Jvnko Still Loves You.mp3", "Lexapro Doesn't Work.mp3",
        "Lux.mp3", "MAKE A SCENE!.mp3", "Nhelv.mp3", "Pandemonium.mp3",
        "Rainshower.mp3", "Restless.mp3", "Robotic.mp3", "Scarlet Night.mp3", "Shriek.mp3",
        "Synthesis.mp3", "The Rain.mp3", "Tides.mp3", "Treasures.mp3", "Twisted.mp3",
        "massacre.mp3", "star.png"
    }
}

local missingFiles = {}

for _, fileName in ipairs(files.VFX) do
    local path = "Axirian Assets/VFX/" .. fileName
    if not isfile(path) then
        table.insert(missingFiles, {name = fileName, path = path})
    end
end

for _, fileName in ipairs(files.Root) do
    local path = "Axirian Assets/" .. fileName
    if not isfile(path) then
        table.insert(missingFiles, {name = fileName, path = path})
    end
end

if #missingFiles == 0 then
    execScript()
    return
end

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AxirianDownloader"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 180)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 60)
TitleLabel.Position = UDim2.new(0, 0, 0, 30)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Preloading..."
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 28
TitleLabel.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 40)
StatusLabel.Position = UDim2.new(0, 20, 0, 90)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Initializing..."
StatusLabel.TextColor3 = Color3.fromRGB(160, 170, 190)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.TextSize = 16
StatusLabel.TextWrapped = true
StatusLabel.Parent = MainFrame

task.spawn(function()
    for i, fileInfo in ipairs(missingFiles) do
        local fileUrl = baseUrl .. game:GetService("HttpService"):UrlEncode(fileInfo.name)
        StatusLabel.Text = string.format("Downloading (%d/%d): %s", i, #missingFiles, fileInfo.name)
        
        local success, content = pcall(function()
            return game:HttpGet(fileUrl)
        end)
        
        if success and content then
            writefile(fileInfo.path, content)
        else
            warn("Failed to download: " .. fileInfo.name)
        end
        task.wait(0.1)
    end
    
    StatusLabel.Text = "Done!"
    task.wait(0.5)
    ScreenGui:Destroy()
    execScript()
end)