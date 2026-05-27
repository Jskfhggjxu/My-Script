local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer

local serverEvent = ReplicatedStorage:WaitForChild("01_server", 1)

if not serverEvent then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "NOTE",
            Text = "YOU'RE NOT ON JUST A BASEPLATE EXECUTE SCRIPT!!!!111",
            Duration = 5
        })
    end)
    return false -- 没有找到事件，直接返回失败
end

-- 发送重置命令
local args = {"cmd", "-rs"}
serverEvent:FireServer(unpack(args))

local hasReset = false
local isChecked = false -- 用来标记是否检测完毕

local connection
connection = localPlayer.CharacterAdded:Connect(function(newCharacter)
    hasReset = true
    isChecked = true
    
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "NOTE",
            Text = "Your account can use cmds!",
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
                Text = "YOUR ACCOUNT CANT USE CMDS!!!!111 PLS CHOOSE YOUR ACCOUNT",
                Duration = 5
            })
        end)

        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end)

while not isChecked do
    task.wait()
end

return hasReset
