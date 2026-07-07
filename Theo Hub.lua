local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Theo hub",
   LoadingTitle = "Loading...",
   LoadingSubtitle = ":3 ♡",
   Theme = "Default",
   KeySystem = false,
})

local Tab_0 = Window:CreateTab("Scripts", 4483362458)

local Button_AxirianmadebyTheoSam481 = Tab_0:CreateButton({
   Name = "Axirian made by Theo & Sam",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Anarchy.txt.lua"))()
   end,
})

local Button_ToolDancemadebyTheo253 = Tab_0:CreateButton({
   Name = "Tool Dance made by Theo",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/ToolDance.lua"))()
   end,
})

local Button_MalcomMaddoxConvertedbyTheo105 = Tab_0:CreateButton({
   Name = "Malcom Maddox Converted by Theo",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Malcom-Maddox-Converted.lua"))()
   end,
})

local Tab_1 = Window:CreateTab("Other fun scripts", 4483362458)

local Button_LolitaglitchermadebyC00lCh4osModdedbyTory982 = Tab_1:CreateButton({
   Name = "Lolita glitcher made by C00l_Ch4os/Modded by Tory",
   Callback = function()
      local success = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/check-acc-cmds.lua"))()
      if success then
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/fe-Lolita-glitcher-Load.lua"))()
      else
          return
      end
   end,
})

local Label_betterFriendlyfornewscriptuser144 = Tab_1:CreateLabel("^ better Friendly for new script user ^")

local Button_OrbitToolHatmadebyTory488 = Tab_1:CreateButton({
   Name = "Orbit Tool/Hat made by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Orbit-Tool.lua"))()
   end,
})

local Button_ClintdancezzzmadebyClint652 = Tab_1:CreateButton({
   Name = "Clint dancezzz made by Clint",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/509clint/krystal-dance-V3-audios/refs/heads/main/ClintsDancezzz.lua"))()
   end,
})

local Tab_2 = Window:CreateTab("Hats", 4483362458)

local Button_AxirianHatsbyTory167 = Tab_2:CreateButton({
   Name = "Axirian Hats by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-so-useless-script-axirian-glitcher-hats-by-Tory-212402"))()
   end,
})

local Button_MalcomMaddoxConvertedHatsbyTheo224 = Tab_2:CreateButton({
   Name = "Malcom Maddox Converted Hats by Theo",
   Callback = function()
      local args = {
      	"cmd",
      	"-gh 121668589285446,80629770394501,127671621543010,76687571475377,120230112701079,105058659622112,12850191932"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
   end,
})

local Tab_3 = Window:CreateTab("Hub Creator", 4483362458)

local Label_HubbyTory995 = Tab_3:CreateLabel("Hub by Tory")

local Label_manyscriptmadebyTheo41 = Tab_3:CreateLabel("many script made by Theo")

Rayfield:LoadConfiguration()
