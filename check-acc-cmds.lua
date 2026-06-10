local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer

local serverEvent = ReplicatedStorage:WaitForChild("01_server", 1)

if not serverEvent then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "NOTE",
            Text = "Youre not on Just a baseplate execute script!",
            Duration = 5
        })
    end)
    return false
end

local args = {"cmd", "-rs"}
serverEvent:FireServer(unpack(args))

local hasReset = false
local isChecked = false
local connection

connection = localPlayer.CharacterAdded:Connect(function(newCharacter)
    hasReset = true
    isChecked = true
    
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "NOTE",
            Text = "checked,Loading loader...",
            Duration = 5
        })
    end)

    if connection then
        connection:Disconnect()
        connection = nil
    end
end)

task.delay(0.5, function()
    if not hasReset then
        isChecked = true
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "NOTE",
                Text = "Your account cant use cmds!",
                Duration = 5
            })
        end)
        
        task.wait(0.1)
        
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "NOTE",
                Text = "Join game group to use script!\ngroup link copied!",
                Duration = 5
            })
        end)

        if connection then
            connection:Disconnect()
            connection = nil
        end
        setclipboard(https://www.roblox.com/communities/34901800/The-Local-Maze)
    end
end)

while not isChecked do
    task.wait()
end

return hasReset
