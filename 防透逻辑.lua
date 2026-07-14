local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function applyPermanentTransparentShield()
    local playerGui = player:WaitForChild("PlayerGui", 20)
    if not playerGui then return end
    
    local realTouchGui = playerGui:WaitForChild("TouchGui", 20)
    if not realTouchGui then return end

    local existingAntiVal = realTouchGui:FindFirstChild("anti_re_exe")
    if existingAntiVal and existingAntiVal:IsA("StringValue") and existingAntiVal.Value == "1" then
        return 
    end

    local shieldGui = realTouchGui:Clone()
    
    local controlFrame = shieldGui:FindFirstChild("TouchControlFrame")
    if controlFrame then
        local jumpBtn = controlFrame:FindFirstChild("JumpButton")
        if jumpBtn then
            jumpBtn:Destroy()
        end
    end

    local antiVal = Instance.new("StringValue")
    antiVal.Name = "anti_re_exe"
    antiVal.Value = "1"
    antiVal.Parent = shieldGui

    realTouchGui:Destroy()
    shieldGui.Name = "TouchGui"
    shieldGui.ResetOnSpawn = false
    shieldGui.Parent = playerGui
end

applyPermanentTransparentShield()
