local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Theo hub",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Sam was here <3",
   Theme = "Default",
   KeySystem = false,
})

local Tab_0 = Window:CreateTab("Scripts", 4483362458)

local Button_AxirianglitchermadebyTheoSam750 = Tab_0:CreateButton({
   Name = "Axirian glitcher made by Theo & Sam",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Anarchy.txt.lua"))()
   end,
})

local Button_ToolDancemadebyTheo903 = Tab_0:CreateButton({
   Name = "Tool Dance made by Theo",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/ToolDance.lua"))()
   end,
})

local Button_MalcomMaddoxConvertedbyTheo531 = Tab_0:CreateButton({
   Name = "Malcom Maddox Converted by Theo",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Malcom-Maddox-Converted.lua"))()
   end,
})

local Button_AxirianglitcheroldversionmadebyTheolaggyandnotmanythings545 = Tab_0:CreateButton({
   Name = "Axirian glitcher old version made by Theo(laggy and not many things)",
   Callback = function()
      if not getgenv().replicatesignal then
          getgenv().replicatesignal = function(signal)
          end
      end
      
      local Players = game:GetService("Players")
      local LocalPlayer = Players.LocalPlayer
      
      local playerMt = getrawmetatable(game)
      local oldIndex = playerMt.__index
      local oldNewIndex = playerMt.__newindex
      
      setreadonly(playerMt, false)
      
      playerMt.__index = newcclosure(function(self, key)
      
          if self == LocalPlayer and key == "ConnectDiedSignalBackend" then
              return setmetatable({}, {
                  __index = function() return function() end end,
                  __call = function() end
              })
          end
          return oldIndex(self, key)
      end)
      
      setreadonly(playerMt, true)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/VirtualKeyboard.lua"))()
      
      local angles=CFrame.fromEulerAngles 
      local Global=(getgenv and getgenv()) or shared
      Global.Config={
      ["Permadeath"]=true,
      -- Self explanatory(Replicatesignal)
      ["SmoothCamera"]=false, 
      -- Self explanatory
      ["PreloadAnimation"]=false,
      -- Set this to true if your executor supports Replicatesignal(most support)
      ["Refit"]=true, 
      -- Refit if Hats Fall Off(uses Replicatesignal)
      ["Breakjoints"]=3,
      --1 - Breakjoint+Health(most support)
      --2 - Health Or Breakjoint
      --3 - Breakjoints
      --4 - ServerBreakJoints
      ["RespawnTp"]=1, 
      --0 stay at spawn
      --1 - random tp close
      --2 - behind char
      --3 - hidebody(no need to set to 3, script automatically hides it)
      ["Placeholder"]=false, 
      -- If you wanna display the missing parts
      
      
      --// Custom Rigs
      ["UseCustomRigs"]=false,
      -- Basically, you add your own rigs so the glitcher can support it, pretty cool right?
      ["CRigs"]={
        ["LArm"]={
          --//Follow this pattern 
         -- {AccName="ACTUALCCESSORYNAME" ,Angles=angles(X,Y,Z)} 
         {
           AccName="Accessory (LArmNoob)",Angles=angles(0,0,80.05)
         },
        },
        ["RArm"]={
          --//Follow this pattern 
         -- {AccName="ACTUALCCESSORYNAME" ,Angles=angles(X,Y,Z)} 
          {
           AccName="Accessory (RArmNoob)",Angles=angles(0,0,80.05)
         },
        },
        ["LLeg"]={
          --//Follow this pattern 
         -- {AccName="ACTUALCCESSORYNAME" ,Angles=angles(X,Y,Z)} 
          {
           AccName="Accessory (LLegNoob)",Angles=angles(0,0,80.09)
         },
        },
        ["RLeg"]={
          --//Follow this pattern 
         -- {AccName="ACTUALCCESSORYNAME" ,Angles=angles(X,Y,Z)} 
         {
           AccName="Accessory (RLegNoob)",Angles=angles(0,0,80.09)
         },
        },
        ["Torso"]={
          --//Follow this pattern 
         -- {AccName="ACTUALCCESSORYNAME" ,Angles=angles(X,Y,Z)} 
        {
           AccName="Accessory (TorsoNoob)",Angles=angles(0,0,0)
         },
        },
      
      },
      }
      
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/74f5d16c193b05bb.lua"))()
   end,
})

local Tab_1 = Window:CreateTab("Other fun scripts", 4483362458)

local Button_LolitaglitchermadebyC00lCh4osModdedbyTory509 = Tab_1:CreateButton({
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

local Label_betterFriendlyfornewscriptuser35 = Tab_1:CreateLabel("^ better Friendly for new script user ^")

local Button_OrbitToolHatmadebyTory572 = Tab_1:CreateButton({
   Name = "Orbit Tool/Hat made by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Orbit-Tool.lua"))()
   end,
})

local Button_ClintdancezzzmadebyClint281 = Tab_1:CreateButton({
   Name = "Clint dancezzz made by Clint",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/509clint/krystal-dance-V3-audios/refs/heads/main/ClintsDancezzz.lua"))()
   end,
})

local Button_FeThevillainfixedbyTory33 = Tab_1:CreateButton({
   Name = "Fe The villain fixed by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/The-Villain-Loader"))()
   end,
})

local Button_FeNeptunianVremakemadebyTory281 = Tab_1:CreateButton({
   Name = "Fe Neptunian V remake made by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/Neptunian%20Tory%20remake%20(1).lua"))()
   end,
})

local Button_AutoPermdeathmadebyTory902 = Tab_1:CreateButton({
   Name = "Auto Permdeath made by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Jskfhggjxu/My-Script/refs/heads/main/auto-pd.lua"))()
   end,
})

local Label_whatworkingAutopermdeaththanifyourcharacterrespawn797 = Tab_1:CreateLabel("^ what working? Auto permdeath than if your character respawn ^")

local Tab_2 = Window:CreateTab("Hats", 4483362458)

local Button_AxirianHatsbyTory959 = Tab_2:CreateButton({
   Name = "Axirian Hats by Tory",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-so-useless-script-axirian-glitcher-hats-by-Tory-212402"))()
   end,
})

local Button_MalcomMaddoxConvertedHatsbyTheo477 = Tab_2:CreateButton({
   Name = "Malcom Maddox Converted Hats by Theo",
   Callback = function()
      local args = {
      	"cmd",
      	"-gh 121668589285446,80629770394501,127671621543010,76687571475377,120230112701079,105058659622112,12850191932"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
   end,
})

local Button_OldaxirianHatsbyTheo714 = Tab_2:CreateButton({
   Name = "Old axirian Hats by Theo",
   Callback = function()
      local args = {
      	"cmd",
      	"-gh 91118300743511,88245158514202,77645930521012,129918670841083,5316479641,5316539421,5268602207,5316549755,12723002425,82942681251131,140395948277978,102599402682100,90960046381276,128948172708607"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("01_server"):FireServer(unpack(args))
   end,
})

local Tab_3 = Window:CreateTab("Hub Creator", 4483362458)

local Label_HubbyTory310 = Tab_3:CreateLabel("Hub by Tory")

local Label_manyscriptmadebyTheo646 = Tab_3:CreateLabel("many script made by Theo")

Rayfield:LoadConfiguration()