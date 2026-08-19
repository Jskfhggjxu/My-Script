local ScriptURL = "https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Admin%20Noli%20-%20Limb%20Reanimation(1).lua"
local ScriptPath = "FEVerse/Scripts/Admin.luau"

if not isfolder("FEVerse") then makefolder("FEVerse") end
if not isfolder("FEVerse/Scripts") then makefolder("FEVerse/Scripts") end

print("Downloading script...")
local Ok, Data = pcall(game.HttpGet, game, ScriptURL)
if not Ok or type(Data) ~= "string" or #Data < 1000 then
	error("[AdminLoader] Download failed: " .. tostring(Ok and ("invalid data (" .. tostring(#Data) .. " bytes)") or Data))
end

writefile(ScriptPath, Data)
print(string.format("Downloaded %d bytes -> %s", #Data, ScriptPath))

local Func, Err = loadstring(readfile(ScriptPath))
if not Func then
	error("Failed to compile script: " .. tostring(Err))
end

print("Running script from disk...")
Func()
