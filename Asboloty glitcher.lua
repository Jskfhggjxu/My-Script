--[[

Asboloty made by Theo himself
nothing skidded or taken 
some.modes belong to SGR cedits goes to them
who the fuck uses white hats script, he doesnt care about his members(you), he only cares abiur money hes getring from all of his scripts

some ideas are from SGZR too! (Star Glitcher Zorium Reawakened)
credits goes to them

Visual Effects made by me ofc some of them aee like rework but my own version


]]

--//Options
local Global=(getgenv and getgenv()) or shared
if not Global.Config then Global.Config={} end
--local HTarget=Global.Config["CameraFocus"]  -- Actual Accessory name
local INTROANIM=Global.Config["Intro"]  or false--set it to true if want an intro animation
local SmoothCamera=Global.Config["SmoothCamera"] or false
local LEGACY=false-- set this to true if you the old anims on some modes
local Falling=false
local Jumping=false
local DEBUG=false -- only sole purpose is to debug audio timeposition and print out the current time position once pressed
local TORSO=Global.Config["Torso"] or nil
local UsePlayerBody=Global.Config["UsePlayerBody"] or false
local Sitting=Global.Config["Sit"] or false
local Hatdrop=Global.Config["Hatdrop"] or false
local Preload= false
local Brekjoints=Global.Config["Breakjoints"] or 1
local SpawnTp=Global.Config["RespawnTp"] or 1
local FakePerma= true
local Placeholder=Global.Config["Placeholder"] or false
local Refit=Global.Config["Refit"] or true
local UseCustomRigs=Global.Config["UseCustomRigs"] or false
local Version="1.75 - Last Beta"
local Name="Axirian"
local Updates="Animation Reworking and UI updates".."\n".."Version: "..Version
local Place=game.placeId
if Place ~= 17574618959 and Place ~= 88308889239232 and Place~=123974602339071 then
UsePlayerBody=false
Hatdrop=false
end
if UsePlayerBody then 
Hatdrop=false
end
function notify(text,dur)
local Notify=game:GetService("StarterGui")
Notify:SetCore("SendNotification",{
Title=Name;
Duration=.5 or dur,
Text=text})
end



local Modes={
  {Name="Iviriza",WingAnim="Iviriza",MusicTitle="Tides",Music="Tides",HHeight=0,Author="Cepheid",ActualName="Avaritia"},
  {Name="NULLVOID",WingAnim="NULLVOID",MusicTitle=" Aegleseeker | Over The Horizon",Music="Aegleseeker",HHeight=5,Author="Silentroom & Frums",ActualName="Cosmioplex"},
  {Name="Mayhem",WingAnim="Mayhem",MusicTitle="Shriek",Music="Shriek",HHeight=0,Author="D-Mode-D",ActualName="Mayhem"},
  {Name="Gaia",WingAnim="Gaia",MusicTitle="Gaia",Music="Gaia",HHeight=10,Author="Cepheid",ActualName="Geoplex"},
  {Name="Chromatic",WingAnim="Chromatic",MusicTitle="Synthesis",Music="Synthesis",HHeight=0,Author="tn-sh",ActualName="Synth"},
--  {Name="Overseer",WingAnim="Overseer",MusicTitle="Dutonic - Vani, The Blood Cleric ",Music="Blood Cleric",HHeight=4},
  {Name="Layers",WingAnim="Layers",MusicTitle="LAYERS",Music="EQUINOX",HHeight=0,Author="KORAII",ActualName="Equilibriatic"},
  {Name="Scourge",WingAnim="Scourge",MusicTitle=" Am Unbreakable",Music="I Am Unbreakable",HHeight=0,Author="Niklas Johansson",ActualName="Glorywrath"},
  {Name="Anarchus",WingAnim="Anarchus",MusicTitle="Treasures Within The Abomination",Music="Treasures",HHeight=0,Author="Dm Dokuro",ActualName="Lavirathor"},
  {Name="Vibrance",WingAnim="Vibrance",MusicTitle="Dance On The Mars",Music="Dance On The Mars",HHeight=0,Author="Camellia",ActualName="Vibrasium"},
  {Name="Censored",WingAnim="Censored",MusicTitle="CENSORED!!!",Music="Censored",HHeight=8,Author="t+pazolite",ActualName="Censored!!!"},
  {Name="Noxesium",WingAnim="Noxesium",MusicTitle="Deorc Decuple",Music="Deorc Decuple",HHeight=0,Author="Niklas Johansson",ActualName="Enexorsium"},
--  {Name="Vanguard",WingAnim="Vanguard",MusicTitle="Dutonic - Dragonlord Keldar",Music="Dragonlord",HHeight=3},
  {Name="Aegleseeker",WingAnim="Aegleseeker",MusicTitle="Aegleseeker | Afterworld",Music="Aegleseeker1",HHeight=10,Author="Silentroom"},
  {Name="Nholiviction",WingAnim="Nholiviction",MusicTitle="Nhelv ",Music="Nhelv",HHeight=10,Author="Silentroom",ActualName="Nhelv"},
  {Name="Pyroplex",WingAnim="Pyroplex",MusicTitle="Dark Matter Suite ",Music="Dark Matter",HHeight=0,Author="OneFin",ActualName="Quitenplex"},
  {Name="Fatal",WingAnim="Fatal",MusicTitle="Hall ",Music="Hall",HHeight=10,Author="Frums",ActualName="Exortrix"},
  {Name="Cascade",WingAnim="Cascade",MusicTitle="Twisted Drop Party",Music="Twisted",HHeight=8,Author="t+pazolite & Getty",ActualName="Casiocade"},
  {Name="Sentinel",WingAnim="Sentinel",MusicTitle="Robotic Dance",Music="Robotic",HHeight=0,Author="Vermair",ActualName="Sentinel"},
  {Name="Cheatreal",WingAnim="Cheatreal",MusicTitle="Cheatreal",Music="Cheatreal",HHeight=10,Author="t+pazolite",ActualName="Desvertion"},
  {Name="Nebulabrasque",WingAnim="Nebulabrasque",MusicTitle="Anomaly",Music="Anomaly",HHeight=2.5,Author="NightHawk22",ActualName="Nebularisque"},
  {Name="Imperial",WingAnim="Imperial",MusicTitle="Sciophobia",Music="Sciophobia",HHeight=5,Author="Johannes Bornlöf",ActualName="Revernix"},
  {Name="Dimension",WingAnim="Dimension",MusicTitle="Dimension",Music="Dimension",HHeight=10,Author="Creo",ActualName="Enterdiverse"},
  {Name="Tachyon",WingAnim="Tachyon",MusicTitle="Lux",Music="Lux",HHeight=5,Author="Nhato",ActualName="Trachyn"},
  {Name="Serenity",WingAnim="Serenity",MusicTitle="Scarlet Night",Music="Scarlet Night",HHeight=0,Author="Fractal Dreamers",ActualName="Serenity"},
  {Name="Torment",WingAnim="Torment",MusicTitle="explicit massacre over the body of a dead god",Music="massacre",HHeight=0,Author="End Of The World",ActualName="Afrodebiator"},
  {Name="Pandemonium",WingAnim="Pandemonium",MusicTitle="Pandemonium",Music="Pandemonium",HHeight=0,Author="t+pazolite & Laur",ActualName="Avarthus"},
  {Name="Lexapriatic",WingAnim="Lexapriatic",MusicTitle="Lexapro Doesn't Work",Music="Lexapro Doesn't Work",HHeight=12,Author="Cythoni",ActualName="Arius"},
  {Name="Restless",WingAnim="Restless",MusicTitle="Restless",Music="Restless",HHeight=0,Author="Creo",ActualName="Restless"},
  {Name="HYPERINTERVENTIC",WingAnim="HYPERINTERVENTIC",MusicTitle="Cheatreal #TPZREMAKE",Music="Cheatreal1",HHeight=10,Author="t+pazolite",ActualName="Hyperwork"},
  {Name="Parallax",WingAnim="Parallax",MusicTitle="Panorama",Music="Panorama",HHeight=0,Author="Artcore",ActualName="Parallax"},
  {Name="Horion",WingAnim="Horion",MusicTitle="Hyper Hexed Hero",Music="Hyper Hexed Hero",HHeight=7,Author="Kobaryo",ActualName="Horiozin"},
  {Name="Zionihilic",WingAnim="Zionihilic",MusicTitle="MAKE A SCENE!",Music="MAKE A SCENE!",HHeight=10,Author="Z∅MB",ActualName="Zion"},
  {Name="Axius",WingAnim="Axius",MusicTitle="Jvnko Still Loves You",Music="Jvnko Still Loves You",HHeight=7,Author="Sewerslvt",ActualName="Axirian"},
}






--// Soke Random Utilities
local RejectCharacterDeletionsDisabled = false
pcall(function()
local rcd, _ = gethiddenproperty(workspace, "RejectCharacterDeletions")
if rcd.Name == "Disabled" then
RejectCharacterDeletionsDisabled = true
end
end)
local IsRespawning=false
local function Respawn()
if IsRespawning then return end
if RejectCharacterDeletionsDisabled then
if not IsRespawning then IsRespawning=true end
local old = game.Players.LocalPlayer.Character
for _,v in old:GetChildren() do
if v:IsA("Accoutrement") then continue end
v:Destroy()
end
--[[for _,v in old:GetChildren() do
if v:IsA("Accessory") then
sethiddenproperty(v,"BackendAccoutrementState",2)
end
end]]
local new = Instance.new("Model", workspace)
--HatReanimator.DontFireCharAddOnThisChar = new
local Part=Instance.new("Part",old)
Part.Transparency=.5
Part.Anchored=true
Part.CanCollide=false
Part.Size=Vector3.new(2,.5,1)
Part.Name="Respawn :3"
pcall(function()
Part.Position=Workspace["MainScript"]["FakeChar"]["Floor"].Position+Vector3.new(0,0,0)
end)
game.Players.LocalPlayer.Character = new
task.wait()
--HatReanimator.DontFireCharAddOnThisChar = old
game.Players.LocalPlayer.Character = old
task.wait()
new:Destroy()
IsRespawning=false
if replicatesignal then
--replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
else 
IsRespawning=false
warn("no replicatesignal, cant respawn!")
end
else
if replicatesignal then
--replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
IsRespawning=false
else 
warn("no replicatesignal, cant respawn!")
IsRespawning=false
end
end
end
function swait(num)
if num==0 or num==nil then
game:service'RunService'.Stepped:wait(0)
else
for i=0,num do
game:service'RunService'.Stepped:wait(0)
end
end
end
local function oswait(seconds)
if seconds==nil then seconds=0 end
local start = os.clock()
repeat
swait()
until os.clock() >= start + seconds
end

local oldfds=Workspace.FallenPartsDestroyHeight



function IdkPD()
local p = game.Players.LocalPlayer
local c = p.Character 
 --Fake Character 
local m = Instance.new("Model",c) 
m.Name = "Fake Character"
--m.Transparency=1
local t = Instance.new("Part",m) 
t.Name = "Torso"
t.Position = c.HumanoidRootPart.Position+Vector3.new(0,10e10,0)
t.Anchored = true
t.Transparency = 1
local h = Instance.new("Part",m) 
h.Name = "Head"
h.Position = c.HumanoidRootPart.Position+Vector3.new(0,10e10,0)
h.Transparency = 1
local hum = Instance.new("Humanoid",m) 
p.Character = m
oswait(game.Players.RespawnTime+.1)
p.Character = c 
--makingfake=false

end




local TotalOfHats={}
for _,a in game.Players.LocalPlayer.Character:GetChildren() do 
if a:IsA("Accessory") then 
--local f=a:Clone()
table.insert(TotalOfHats,a)
end
end
local TotalOfBaseParts={}
for _,a in game.Players.LocalPlayer.Character:GetChildren() do 
if a:IsA("BasePart") then 
--local f=a:Clone()
table.insert(TotalOfBaseParts,a)
end
end
print("Character Has "..#TotalOfHats.." Hats")
print("Character Has "..#TotalOfBaseParts-1 .." BaseParts")

local IsHatDropped=false
local makingfake=false
local preloading=false

function rayCast(Pos, Dir, Max, Ignore)
return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 

function OldHatDrop(v)
if IsHatDropped then return end
IsHatDropped=true
oswait(game.Players.LocalPlayer:GetNetworkPing()) 

local RunService = game:GetService("RunService")  
local Players = game:GetService("Players")  
local Workspace = game:GetService("Workspace")  
local Char = v
local rootpart=Char["HumanoidRootPart"]
local hitfloor
--oswait(game.Players.LocalPlayer:GetNetworkPing()) 
repeat 
--print(hitfloor)
hitfloor=rayCast(rootpart.Position,(CFrame.new(rootpart.Position,rootpart.Position - Vector3.new(0,3.5,0))).lookVector,4,Char)
oswait(.1) 
until hitfloor~=nil -- poscheck

local CharsHats={}
for _,a in game.Players.LocalPlayer.Character:GetChildren() do 
if a:IsA("Accessory") then 
--local f=a:Clone()
table.insert(CharsHats,a)
end
end

if #CharsHats < #TotalOfHats then
--notify("Character Has "..#CharsHats.."Hats \n Total Of Hats Needed "..#TotalOfHats.."\n Which Leaves "..#TotalOfHats - #CharsHats.." Unused")
print("Character Has "..#CharsHats.." Hats \n Total Of Hats Needed "..#TotalOfHats.."\n Which Leaves "..#TotalOfHats - #CharsHats.." Unused")
repeat 
table.clear(CharsHats)
oswait(.1)
for _,a in game.Players.LocalPlayer.Character:GetChildren() do 
if a:IsA("Accessory") then 
--local f=a:Clone()
table.insert(CharsHats,a)
end
end
print("Character Has "..#CharsHats.." Hats\n Total Of Hats Needed "..#TotalOfHats)

until #CharsHats >= #TotalOfHats
print("Character Has "..#CharsHats.." Hats \n Total Of Hats Needed "..#TotalOfHats)
table.clear(CharsHats)
end

if FakePerma then
local p = game.Players.LocalPlayer
local c = p.Character
makingfake=true
 --Fake Character 
local m = Instance.new("Model",c) 
m.Name = "Fake Character"
--m.Transparency=1
local t = Instance.new("Part",m) 
t.Name = "Torso"
t.Position = c.HumanoidRootPart.Position+Vector3.new(0,100,0)
t.Anchored = true
t.Transparency = 1
local h = Instance.new("Part",m) 
h.Name = "Head"
h.Anchored=true
h.Position = c.HumanoidRootPart.Position+Vector3.new(0,100,0)
h.Transparency = 1
local hum = Instance.new("Humanoid",m) 
p.Character = m
oswait(.1)
p.Character = c 
makingfake=false

else 
makingfake=false
oswait(game.Players.LocalPlayer:GetNetworkPing()) -- Add smol delay becoz why not
end
local Part=Instance.new("Part",Char)
Part.Transparency=.5
Part.Anchored=true
Part.CanCollide=false
Part.Size=Vector3.new(2,.5,1)
Part.Name="Part :3"
local VG=Instance.new("Part",Char)
VG.Transparency=1
VG.Anchored=true
VG.CanCollide=false
VG.Size=Vector3.new(2048,.5,2048)
VG.Name="Part :3"
VG.Position=Vector3.new(0,-50,0)
local h=Char["HumanoidRootPart"]
local fcm=Char["Fake Character"]
if Workspace:FindFirstChild("MainScript") then 
Char.Parent=Workspace["MainScript"]["FakeChar"]
Part.Position=Workspace["MainScript"]["FakeChar"]["Floor"].Position+Vector3.new(math.random(-5,5),-0,math.random(-5,5))
h.Anchored=true
oswait(.1)
h.Position=Part.Position*Vector3.new(math.random(-5,5),-30,math.random(-5,5))
--h.CanCollide=false
h.AssemblyLinearVelocity=Vector3.new()
h.AssemblyAngularVelocity=Vector3.new(0,0,0)
else
Part.Position=h.Position
h.Position=h.Position+Vector3.new(math.random(-5,5),-0,math.random(-5,5))
end





local Hats = {}
local BP = {}
for _, v in ipairs(Char:GetChildren()) do 
if v:IsA("BasePart") and v.Name~=Part.Name then
table.insert(BP, v)
end
end
for _, v in ipairs(Char:GetDescendants()) do 
if v:IsA("Accessory") then
pcall(function()
if v.Handle:FindFirstChild("AccessoryWeld") then
v.Handle.AccessoryWeld:Destroy()
end
end)
table.insert(Hats, v)
end
end
local TRS = Char:WaitForChild("Torso") or Char:WaitForChild("UpperTorso")
local RT=Char:WaitForChild("HumanoidRootPart")
local sine=os.clock()

task.spawn(function()
repeat
local root=char["HumanoidRootPart"]
local trs=char["Torso"]
trs:Destroy()
root:Destroy()
pcall(function()
local trs=char["UpperTorso"]
trs:Destroy()
end)
for _, v in ipairs(Char:GetDescendants()) do 
if v:IsA("Accessory") then
pcall(function()
if v.Handle:FindFirstChild("AccessoryWeld") then
v.Handle.AccessoryWeld:Destroy()
end
end)
--table.insert(Hats, v)
end
end
oswait(.1)
until not IsHatDropped
end)
oswait(.1)
task.spawn(function()
con=RunService.Heartbeat:Connect(function()
pcall(function()
if Char:FindFirstChild("Torso") then 
Char["Torso"]:Destroy()
else 
Char["UpperTorso"]:Destroy()
end
Char:FindFirstChild("HumanoidRootPart"):Destroy()
end)
pcall(function()
for _, c in ipairs(BP) do
if not c then continue end
c.Anchored=false
c.AssemblyAngularVelocity=Vector3.new()
c.AssemblyLinearVelocity=Vector3.new(0,30,0)
for _, a in a:GetChildren() do
if a:IsA("Weld") or a:IsA("Motor6D") then
a:Destroy()
end
end
end 
end)
pcall(function()
for _, v in ipairs(Hats) do
if not v then continue end
for _,a in v:GetDescendants() do 
if a:IsA("Weld") then 
a:Destroy()
end
end
end
for _, v in ipairs(Hats) do
if not v or v.Handle then continue end
sethiddenproperty(v,"BackendAccoutrementState",2)
if Workspace:FindFirstChild("MainScript") then 
Part.Position=Workspace["MainScript"]["FakeChar"]["Floor"].Position+Vector3.new(math.random(-5,5),0,math.random(-5,5))
else 
Part.Position=Char["HumanoidRootPart"].Position*Vector3.new(0,5,0)
end
--v.Handle.Position=Part.Position*Vector3.new(0,0,5)
local sine15=sine*15
local sin=math.sin 
local v3=Vector3.new
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
v.Handle.AssemblyAngularVelocity=idlerv
v.Handle.AssemblyLinearVelocity=v3(30,0,0)
end

end)
end)


pcall(function()
for _, v in ipairs(BP) do
if not v then continue end
v.Anchored=false
v.Transparency=.5
for _, a in v:GetChildren() do 
if a:IsA("Weld") or a:IsA("Motor6D") then
if not a then continue end
a:Destroy()
end
end
end 
end)

oswait(.5)
con:Disconnect()
for _, v in ipairs(Hats) do
v.Handle.Anchored=false
end
con:Disconnect()
Part:Destroy()
repeat oswait(.1)
pcall(function()
if Char:FindFirstChild("Torso") then 
Char["Torso"]:Destroy()
else 
Char["UpperTorso"]:Destroy()
end
Char:FindFirstChild("HumanoidRootPart"):Destroy()
end)
pcall(function()
for _, v in ipairs(BP) do
if not v then continue end
v.Transparency=.5
--v.CanCollide=false
v.Position=v.Position*Vector3.new(0,-10,0)
for _, a in v:GetChildren() do 
if a:IsA("Weld") or a:IsA("Motor6D") then
if not a then continue end
a:Destroy()
end
end
end 
end)
until IsHatDropped
end)
--table.clear(BP)
--table.clear(Hats)
IsHatDropped=false
end








function HatDrop(v)
if IsHatDropped then return end
IsHatDropped=true
pcall(function()
oswait(game.Players.LocalPlayer:GetNetworkPing()) 
local CharsHats={}
local CharsBaseParts={}
for _,a in v:GetChildren() do 
if a:IsA("Accessory") then 
--local f=a:Clone()
table.insert(CharsHats,a)
end
end
for _,a in v:GetChildren() do 
if a:IsA("BasePart") then 
--local f=a:Clone()
table.insert(CharsBaseParts,a)
end
end
if #CharsHats < #TotalOfHats then
print("Character Has "..#CharsHats.." Hats \n Total Of Hats Needed "..#TotalOfHats.."\n Which Leaves "..#TotalOfHats - #CharsHats.." Unused")
repeat 
table.clear(CharsHats)
oswait(.1)
for _,a in game.Players.LocalPlayer.Character:GetChildren() do 
if a:IsA("Accessory") then 
--local f=a:Clone()
table.insert(CharsHats,a)
end
end
print("Character Now Has "..#CharsHats.." Hats\n Total Of Hats Needed "..#TotalOfHats)

until #CharsHats >= #TotalOfHats
print("Character Has "..#CharsHats.." Hats \n Total Of Hats Needed "..#TotalOfHats)
table.clear(CharsHats)
end


  
local RunService = game:GetService("RunService")  
local Players = game:GetService("Players")  
--print(Players.RespawnTime)
local Workspace = game:GetService("Workspace")  
local Char =v
--local Humanoid = Char:WaitForChild("Humanoid")  
local RT = Char:FindFirstChild("HumanoidRootPart")
--local TRS = Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
local rootpart=RT
local hitfloor
local timeout=1
repeat 
timeout+=1
hitfloor=rayCast(rootpart.Position,(CFrame.new(rootpart.Position,rootpart.Position - Vector3.new(0,3.5,0))).lookVector,4,Char)
oswait(.1) 
until hitfloor~=nil or timeout>=30


if FakePerma then
local p = game.Players.LocalPlayer
local c = p.Character
makingfake=true
 --Fake Character 
local m = Instance.new("Model",c) 
m.Name = "Fake Character"
--m.Transparency=1
local t = Instance.new("Part",m) 
t.Name = "Torso"
t.Position = c.HumanoidRootPart.Position+Vector3.new(0,0,0)
t.Anchored = false
t.Transparency = 1
local h = Instance.new("Part",m) 
h.Name = "Head"
h.Anchored=false
h.Position = c.HumanoidRootPart.Position+Vector3.new(0,0,0)
h.Transparency = 1
local hum = Instance.new("Humanoid",m) 
p.Character = m
oswait(.1)
p.Character = c 
oswait(Players.RespawnTime+.1)
makingfake=false
--p.Character = m
else 
makingfake=false
oswait(game.Players.LocalPlayer:GetNetworkPing()) -- Add smol delay becoz why not
end
repeat oswait(.5) until not makingfake
j=Char.DescendantAdded:Connect(function(a)
if a:IsA("Weld") then 
oswait(.1)
a:Destroy()
end
end)

local Hats = {}
local BP = {}
for _, v in ipairs(Char:GetDescendants()) do 
if v:IsA("Accessory") then
table.insert(Hats, v)
end
end
for _, v in ipairs(Char:GetChildren()) do 
if v:IsA("BasePart") then
v.Transparency=0
table.insert(BP, v)
end
end



local Part=Instance.new("Part",Char)
Part.Transparency=.5
Part.Anchored=true
Part.CanCollide=false
Part.Size=Vector3.new(2,.5,1)
Part.Name="Part :3"
local VG=Instance.new("Part",Char)
VG.Transparency=1
VG.Anchored=true
VG.CanCollide=false
VG.Size=Vector3.new(2048,.5,2048)
VG.Name="Part :3"
VG.Position=Vector3.new(0,-200,0)
local h=RT


h.Position=h.Position+Vector3.new(0,-30,0)
--h.Anchored=true

local fps=0 
local elapsed=0 
local framecount=0
local Welds={}
local sine=os.clock()
con=RunService.Heartbeat:Connect(function(dt)
pcall(function()
h.AssemblyLinearVelocity=Vector3.new()
h.AssemblyAngularVelocity=Vector3.new(0,0,0)
end)
local sine15=sine*15
local sin=math.sin 
local v3=Vector3.new
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))


framecount+=1
elapsed=dt
if elapsed>=1 then 
fps=math.round(framecount/elapsed)
framecount=0 
elapsed=0
for _, v in next,Hats do
if not v or v.Handle then continue end
for _,a in v:GetDescendants() do 
if a:IsA("Weld") then 
table.insert(Welds,a)
end
end

v.Handle.Anchored=true
v.Handle.AssemblyAngularVelocity=idlerv
if fps>=50 then
v.Handle.AssemblyLinearVelocity=v3(0,30,0)
elseif fps<=30 then
v.Handle.AssemblyLinearVelocity=v3(0,30.01,0)
end
end


end
end)

--[[if not FakePerma then
--oswait(Players.RespawnTime+.1)
for _,v in Char:GetChildren() do
if v:IsA("Accoutrement") or v:IsA("Model") or v:IsA("Humanoid") or v:IsA("Shirt") or v:IsA("Pants") and not UsePlayerBody and IsHatDropped then continue end
--v:Destry()
end
end]]
IsHatDropped=false
for _, v in ipairs(Hats) do
v.Handle.Anchored=false
v.Handle.CanCollide=false
if sethiddenproperty then
sethiddenproperty(v, "BackendAccoutrementState", 0)
elseif setscriptable then
setscriptable(v, "BacekndAccoutrementState", true)
v.BackendAccoutrementState = 0
end
end
pcall(function()
local root=Char["HumanoidRootPart"]
local trs=nil
if Char:FindFirstChild("Torso") then 
trs=Char["Torso"]
elseif Char:FindFirstChild("UpperTorso") then 
trs=Cgar["UpperTorso"]
end
trs:Destroy()
root:Destroy()
local trs=Char["UpperTorso"]
--trs:Destroy()
end)
oswait(.1)
for _,v in next,BP do 
if not v then continue end
for _,a in v:GetDescendants() do 
if a:IsA("Weld") or a:IsA("Motor6D") then 
if not a then continue end
table.insert(Welds,a)
end
end
v:Destroy()
end
for _,a in next,Welds do 
a:Destroy()
end


Part:Destroy()
task.spawn(function()
if FakePerma then
oswait(.1)
else
oswait(Players.RespawnTime+.1)
end
con:Disconnect()
j:Disconnect()
end)


end)
end

--// Get The ID
function Normalize(id)
if not id then return "" end
id=tostring(id)

local num=id:match("(%d+)")
return num or ""
end

function GetIds(acc)
if not acc or not acc:IsA("Accessory") then return nil end

local handle=acc:FindFirstChild("Handle")
if not handle then return nil end

-- MeshPart accessory
if handle:IsA("MeshPart") then
local meshId=Normalize(handle.MeshId)
local texId =Normalize(handle.TextureID)
return meshId, texId
end

local sm=handle:FindFirstChildOfClass("SpecialMesh")
if sm then
local meshId=Normalize(sm.MeshId)
local texId =Normalize(sm.TextureId)
return meshId, texId
end

return nil
end











































































local plrgui=gethui()

local Interface = {};
local hui=gethui()
if hui:FindFirstChild(Name.."Interface") then 
hui[Name.."Interface"]:Destroy()
end
Interface["Main_Interface_1"] = Instance.new("ScreenGui", hui);
Interface["Main_Interface_1"]["IgnoreGuiInset"] = true;
Interface["Main_Interface_1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
Interface["Main_Interface_1"]["ClipToDeviceSafeArea"] = false;
Interface["Main_Interface_1"]["Name"] = Name.."Interface";
Interface["Main_Interface_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

local function clik()
	local s = Instance.new("Sound") 
	s["SoundId"] = "rbxassetid://87152549167464"
	s["Parent"] = Interface["Main_Interface_1"]
	s["Volume"] = 1.2
	s["TimePosition"] = 0.1
	s:Play()
	s.Ended:Connect(function()
  s:Destroy()
 end)
end
Interface["ToggleGui_2"] = Instance.new("TextButton", Interface["Main_Interface_1"]);
Interface["ToggleGui_2"]["BorderSizePixel"] = 0;
Interface["ToggleGui_2"]["TextSize"] = 14;
Interface["ToggleGui_2"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["ToggleGui_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["ToggleGui_2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["ToggleGui_2"]["Size"] = UDim2.new(0, 50, 0, 50);
Interface["ToggleGui_2"]["Text"] = Name;
Interface["ToggleGui_2"]["Name"] = [[ToggleGui]];
Interface["ToggleGui_2"]["Visible"] = false;
Interface["ToggleGui_2"]["Position"] = UDim2.new(0, 56, 0, 64);


Interface["UIStroke_3"] = Instance.new("UIStroke", Interface["ToggleGui_2"]);
Interface["UIStroke_3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_3"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_3"]["Thickness"] = 2;
Interface["UIStroke_3"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_4"] = Instance.new("UIGradient", Interface["UIStroke_3"]);
Interface["UIGradient_4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Main_Frame_5"] = Instance.new("Frame", Interface["Main_Interface_1"]);
Interface["Main_Frame_5"]["Active"] = true;
Interface["Main_Frame_5"]["BorderSizePixel"] = 0;
Interface["Main_Frame_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Main_Frame_5"]["ClipsDescendants"] = true;
Interface["Main_Frame_5"]["Size"] = UDim2.new(0, 724, 0, 498);
Interface["Main_Frame_5"]["Position"] = UDim2.new(0, 126, 0, -20);
Interface["Main_Frame_5"]["Name"] = [[Main_Frame]];
Interface["Main_Frame_5"]["BackgroundTransparency"] = 1;


Interface["UIAspectRatioConstraint_6"] = Instance.new("UIAspectRatioConstraint", Interface["Main_Frame_5"]);
Interface["UIAspectRatioConstraint_6"]["DominantAxis"] = Enum.DominantAxis.Height;
Interface["UIAspectRatioConstraint_6"]["AspectRatio"] = 1.45;


Interface["Main_7"] = Instance.new("Frame", Interface["Main_Frame_5"]);
Interface["Main_7"]["BorderSizePixel"] = 0;
Interface["Main_7"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Interface["Main_7"]["Size"] = UDim2.new(0, 646, 0, 432);
Interface["Main_7"]["Position"] = UDim2.new(0, 40, 0, 30);
Interface["Main_7"]["Name"] = [[Main]];
Interface["Main_7"]["BackgroundTransparency"] = 0.5;


Interface["Tab_8"] = Instance.new("TextButton", Interface["Main_7"]);
Interface["Tab_8"]["BorderSizePixel"] = 0;
Interface["Tab_8"]["TextSize"] = 12;
Interface["Tab_8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Tab_8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Tab_8"]["BackgroundTransparency"] = 1;
Interface["Tab_8"]["Size"] = UDim2.new(0, 20, 0, 20);
Interface["Tab_8"]["Text"] = [[+]];
Interface["Tab_8"]["Name"] = [[Tab]];
Interface["Tab_8"]["Position"] = UDim2.new(0, 500, 0, 5);


Interface["UICorner_9"] = Instance.new("UICorner", Interface["Tab_8"]);
Interface["UICorner_9"]["CornerRadius"] = UDim.new(0, 6);


Interface["Glitcher Title_a"] = Instance.new("TextLabel", Interface["Main_7"]);
Interface["Glitcher Title_a"]["BorderSizePixel"] = 0;
Interface["Glitcher Title_a"]["TextSize"] = 24;
Interface["Glitcher Title_a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Glitcher Title_a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Glitcher Title_a"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["Glitcher Title_a"]["BackgroundTransparency"] = 1;
Interface["Glitcher Title_a"]["Size"] = UDim2.new(0, 328, 0, 20);
Interface["Glitcher Title_a"]["Text"] = Name..[[ Glitcher]];
Interface["Glitcher Title_a"]["Name"] = [[Glitcher Title]];
Interface["Glitcher Title_a"]["Position"] = UDim2.new(0, 174, 0, 4);


Interface["Close_b"] = Instance.new("TextButton", Interface["Main_7"]);
Interface["Close_b"]["BorderSizePixel"] = 0;
Interface["Close_b"]["TextSize"] = 12;
Interface["Close_b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Close_b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Close_b"]["ZIndex"] = 2;
Interface["Close_b"]["BackgroundTransparency"] = 1;
Interface["Close_b"]["Size"] = UDim2.new(0, 20, 0, 20);
Interface["Close_b"]["Text"] = [[x]];
Interface["Close_b"]["Name"] = [[Close]];
Interface["Close_b"]["Position"] = UDim2.new(0, 600, 0, 5);


Interface["UICorner_c"] = Instance.new("UICorner", Interface["Close_b"]);
Interface["UICorner_c"]["CornerRadius"] = UDim.new(0, 6);


Interface["Minimize_d"] = Instance.new("TextButton", Interface["Main_7"]);
Interface["Minimize_d"]["BorderSizePixel"] = 0;
Interface["Minimize_d"]["TextSize"] = 12;
Interface["Minimize_d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Minimize_d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Minimize_d"]["ZIndex"] = 2;
Interface["Minimize_d"]["BackgroundTransparency"] = 1;
Interface["Minimize_d"]["Size"] = UDim2.new(0, 20, 0, 20);
Interface["Minimize_d"]["Text"] = [[-]];
Interface["Minimize_d"]["Name"] = [[Minimize]];
Interface["Minimize_d"]["Position"] = UDim2.new(0, 550, 0, 5);


Interface["UICorner_e"] = Instance.new("UICorner", Interface["Minimize_d"]);
Interface["UICorner_e"]["CornerRadius"] = UDim.new(0, 6);


Interface["SubMain_f"] = Instance.new("Frame", Interface["Main_7"]);
Interface["SubMain_f"]["BorderSizePixel"] = 0;
Interface["SubMain_f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["SubMain_f"]["ClipsDescendants"] = true;
Interface["SubMain_f"]["Size"] = UDim2.new(0, 644, 0, 400);
Interface["SubMain_f"]["Position"] = UDim2.new(0, 0, 0, 30);
Interface["SubMain_f"]["Name"] = [[SubMain]];
Interface["SubMain_f"]["BackgroundTransparency"] = 1;


Interface["Visualize_10"] = Instance.new("Frame", Interface["SubMain_f"]);
Interface["Visualize_10"]["BorderSizePixel"] = 0;
Interface["Visualize_10"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Visualize_10"]["Size"] = UDim2.new(0, 350, 0, 130);
Interface["Visualize_10"]["Position"] = UDim2.new(0, 292, 0, 266);
Interface["Visualize_10"]["Name"] = [[Visualize]];
Interface["Visualize_10"]["ClipsDescendants"] = true;


Interface["Current Time_11"] = Instance.new("TextLabel", Interface["Visualize_10"]);
Interface["Current Time_11"]["BorderSizePixel"] = 0;
Interface["Current Time_11"]["TextSize"] = 12;
Interface["Current Time_11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Interface["Current Time_11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Current Time_11"]["FontFace"] = Font.new([[rbxasset://fonts/families/HighwayGothic.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Current Time_11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Current Time_11"]["BackgroundTransparency"] = 1;
Interface["Current Time_11"]["Size"] = UDim2.new(0, 280, 0, 18);
Interface["Current Time_11"]["Text"] = [[0:00 / 0:00]];
Interface["Current Time_11"]["Name"] = [[Current Time]];
Interface["Current Time_11"]["Position"] = UDim2.new(0, 2, 0, 4);


Interface["Current Music_12"] = Instance.new("TextLabel", Interface["Visualize_10"]);
Interface["Current Music_12"]["BorderSizePixel"] = 0;
Interface["Current Music_12"]["TextSize"] = 12;
Interface["Current Music_12"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Interface["Current Music_12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Current Music_12"]["FontFace"] = Font.new([[rbxasset://fonts/families/HighwayGothic.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Current Music_12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Current Music_12"]["BackgroundTransparency"] = 1;
Interface["Current Music_12"]["Size"] = UDim2.new(0, 280, 0, 18);
Interface["Current Music_12"]["Text"] = [[Music Playing: None!]];
Interface["Current Music_12"]["Name"] = [[Current Music]];
Interface["Current Music_12"]["Position"] = UDim2.new(0, 2, 0, 20);


Interface["UIStroke_13"] = Instance.new("UIStroke", Interface["Visualize_10"]);
Interface["UIStroke_13"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_13"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_13"]["Thickness"] = 2;
Interface["UIStroke_13"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_14"] = Instance.new("UIGradient", Interface["UIStroke_13"]);
Interface["UIGradient_14"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Update_Frame_15"] = Instance.new("Frame", Interface["SubMain_f"]);
Interface["Update_Frame_15"]["BorderSizePixel"] = 0;
Interface["Update_Frame_15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Update_Frame_15"]["Size"] = UDim2.new(0, 194, 0, 76);
Interface["Update_Frame_15"]["Position"] = UDim2.new(0, 444, 0, 134);
Interface["Update_Frame_15"]["Name"] = [[Update_Frame]];
Interface["Update_Frame_15"]["BackgroundTransparency"] = 1;


Interface["Shadow_16"] = Instance.new("ImageLabel", Interface["Update_Frame_15"]);
Interface["Shadow_16"]["ZIndex"] = -1;
Interface["Shadow_16"]["BorderSizePixel"] = 0;
Interface["Shadow_16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Shadow_16"]["ImageTransparency"] = 0.2;
-- Interface["Shadow_16"]["ImageContent"] = ;
Interface["Shadow_16"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Shadow_16"]["Image"] = [[rbxassetid://8774493213]];
Interface["Shadow_16"]["Size"] = UDim2.new(0, 216, 0, 84);
Interface["Shadow_16"]["BackgroundTransparency"] = 1;
Interface["Shadow_16"]["Name"] = [[Shadow]];
Interface["Shadow_16"]["Position"] = UDim2.new(0, -12, 0, -4);


Interface["TextLabel_17"] = Instance.new("TextLabel", Interface["Update_Frame_15"]);
Interface["TextLabel_17"]["BorderSizePixel"] = 0;
Interface["TextLabel_17"]["TextSize"] = 12;
Interface["TextLabel_17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Interface["TextLabel_17"]["TextYAlignment"] = Enum.TextYAlignment.Top;
Interface["TextLabel_17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["TextLabel_17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["TextLabel_17"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["TextLabel_17"]["BackgroundTransparency"] = 1;
Interface["TextLabel_17"]["Size"] = UDim2.new(0, 174, 0, 140);
Interface["TextLabel_17"]["Text"] =Updates
Interface["TextLabel_17"]["Position"] = UDim2.new(0, 14, 0, 10);
Interface["TextLabel_17"]["TextWrapped"] = true;


Interface["UIStroke_18"] = Instance.new("UIStroke", Interface["Update_Frame_15"]);
Interface["UIStroke_18"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_18"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_18"]["Thickness"] = 2;
Interface["UIStroke_18"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_19"] = Instance.new("UIGradient", Interface["UIStroke_18"]);
Interface["UIGradient_19"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Run_1a"] = Instance.new("TextButton", Interface["SubMain_f"]);
Interface["Run_1a"]["BorderSizePixel"] = 0;
Interface["Run_1a"]["TextSize"] = 24;
Interface["Run_1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Run_1a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Run_1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Run_1a"]["Size"] = UDim2.new(0, 136, 0, 44);
Interface["Run_1a"]["Text"] = [[Run]];
Interface["Run_1a"]["Name"] = [[Run]];
Interface["Run_1a"]["Position"] = UDim2.new(0, 362, 0, 216);


Interface["UIStroke_1b"] = Instance.new("UIStroke", Interface["Run_1a"]);
Interface["UIStroke_1b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_1b"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_1b"]["Thickness"] = 2;
Interface["UIStroke_1b"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_1c"] = Instance.new("UIGradient", Interface["UIStroke_1b"]);
Interface["UIGradient_1c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["UIThings_1d"] = Instance.new("LocalScript", Interface["SubMain_f"]);
Interface["UIThings_1d"]["Name"] = [[UIThings]];


Interface["Stop_1e"] = Instance.new("TextButton", Interface["SubMain_f"]);
Interface["Stop_1e"]["BorderSizePixel"] = 0;
Interface["Stop_1e"]["TextSize"] = 24;
Interface["Stop_1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Stop_1e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Stop_1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Stop_1e"]["Size"] = UDim2.new(0, 136, 0, 44);
Interface["Stop_1e"]["Text"] = [[Stop]];
Interface["Stop_1e"]["Name"] = [[Stop]];
Interface["Stop_1e"]["Position"] = UDim2.new(0, 504, 0, 216);


Interface["UIStroke_1f"] = Instance.new("UIStroke", Interface["Stop_1e"]);
Interface["UIStroke_1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_1f"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_1f"]["Thickness"] = 2;
Interface["UIStroke_1f"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_20"] = Instance.new("UIGradient", Interface["UIStroke_1f"]);
Interface["UIGradient_20"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["PreviewImage_21"] = Instance.new("ImageLabel", Interface["SubMain_f"]);
Interface["PreviewImage_21"]["BorderSizePixel"] = 0;
Interface["PreviewImage_21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["PreviewImage_21"]["Size"] = UDim2.new(0, 644, 0, 106);
Interface["PreviewImage_21"]["BackgroundTransparency"] = 1;
Interface["PreviewImage_21"]["Name"] = [[PreviewImage]];
Interface["PreviewImage_21"]["Position"] = UDim2.new(0, 0, 0, 4);
Interface["PreviewImage_21"]["ScaleType"] = [[Crop]];

Interface["UIStroke_22"] = Instance.new("UIStroke", Interface["PreviewImage_21"]);
Interface["UIStroke_22"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_22"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_22"]["Thickness"] = 2;
Interface["UIStroke_22"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_23"] = Instance.new("UIGradient", Interface["UIStroke_22"]);
Interface["UIGradient_23"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["UIStroke_24"] = Instance.new("UIStroke", Interface["Main_7"]);
Interface["UIStroke_24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_24"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_24"]["Thickness"] = 2;
Interface["UIStroke_24"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_25"] = Instance.new("UIGradient", Interface["UIStroke_24"]);
Interface["UIGradient_25"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Credits_26"] = Instance.new("Frame", Interface["Main_7"]);
Interface["Credits_26"]["BorderSizePixel"] = 0;
Interface["Credits_26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Credits_26"]["ClipsDescendants"] = true;
Interface["Credits_26"]["Size"] = UDim2.new(0, 0, 0, 400);
Interface["Credits_26"]["Position"] = UDim2.new(0, 640, 0, 30);
Interface["Credits_26"]["Name"] = [[Credits]];
Interface["Credits_26"]["BackgroundTransparency"] = 1;


Interface["Owner_27"] = Instance.new("ImageLabel", Interface["Credits_26"]);
Interface["Owner_27"]["BorderSizePixel"] = 0;
Interface["Owner_27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Owner_27"]["Size"] = UDim2.new(0, 74, 0, 74);
Interface["Owner_27"]["BackgroundTransparency"] = 1;
Interface["Owner_27"]["Name"] = [[Owner]];
Interface["Owner_27"]["Position"] = UDim2.new(0, 16, 0, 56);


Interface["UIStroke_28"] = Instance.new("UIStroke", Interface["Owner_27"]);
Interface["UIStroke_28"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_28"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_28"]["Thickness"] = 2;
Interface["UIStroke_28"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_29"] = Instance.new("UIGradient", Interface["UIStroke_28"]);
Interface["UIGradient_29"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["OwnerName_2a"] = Instance.new("TextLabel", Interface["Credits_26"]);
Interface["OwnerName_2a"]["BorderSizePixel"] = 0;
Interface["OwnerName_2a"]["TextSize"] = 18;
Interface["OwnerName_2a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Interface["OwnerName_2a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["OwnerName_2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["OwnerName_2a"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["OwnerName_2a"]["Size"] = UDim2.new(0, 56, 0, 42);
Interface["OwnerName_2a"]["Text"] = [[Theo]];
Interface["OwnerName_2a"]["Name"] = [[OwnerName]];
Interface["OwnerName_2a"]["Position"] = UDim2.new(0, 16, 0, 8);


Interface["UIStroke_2b"] = Instance.new("UIStroke", Interface["OwnerName_2a"]);
Interface["UIStroke_2b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_2b"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_2b"]["Thickness"] = 2;
Interface["UIStroke_2b"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_2c"] = Instance.new("UIGradient", Interface["UIStroke_2b"]);
Interface["UIGradient_2c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["OwnerDesc_2d"] = Instance.new("TextLabel", Interface["Credits_26"]);
Interface["OwnerDesc_2d"]["BorderSizePixel"] = 0;
Interface["OwnerDesc_2d"]["TextSize"] = 18;
Interface["OwnerDesc_2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Interface["OwnerDesc_2d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["OwnerDesc_2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["OwnerDesc_2d"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["OwnerDesc_2d"]["Size"] = UDim2.new(0, 122, 0, 42);
Interface["OwnerDesc_2d"]["Text"] = [[-The One / Dev]];
Interface["OwnerDesc_2d"]["Name"] = [[OwnerDesc]];
Interface["OwnerDesc_2d"]["Position"] = UDim2.new(0, 96, 0, 68);


Interface["UIStroke_2e"] = Instance.new("UIStroke", Interface["OwnerDesc_2d"]);
Interface["UIStroke_2e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_2e"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_2e"]["Thickness"] = 2;
Interface["UIStroke_2e"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_2f"] = Instance.new("UIGradient", Interface["UIStroke_2e"]);
Interface["UIGradient_2f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Title_30"] = Instance.new("TextLabel", Interface["Credits_26"]);
Interface["Title_30"]["BorderSizePixel"] = 0;
Interface["Title_30"]["TextSize"] = 24;
Interface["Title_30"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Title_30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Title_30"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["Title_30"]["Size"] = UDim2.new(0, 122, 0, 42);
Interface["Title_30"]["Text"] = [[Credits]];
Interface["Title_30"]["Name"] = [[Title]];
Interface["Title_30"]["Position"] = UDim2.new(0, 272, 0, 6);


Interface["UIStroke_31"] = Instance.new("UIStroke", Interface["Title_30"]);
Interface["UIStroke_31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_31"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_31"]["Thickness"] = 2;
Interface["UIStroke_31"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_32"] = Instance.new("UIGradient", Interface["UIStroke_31"]);
Interface["UIGradient_32"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Shadow_33"] = Instance.new("ImageLabel", Interface["Main_7"]);
Interface["Shadow_33"]["ZIndex"] = -1;
Interface["Shadow_33"]["BorderSizePixel"] = 0;
Interface["Shadow_33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Shadow_33"]["ImageTransparency"] = 0.2;
-- Interface["Shadow_33"]["ImageContent"] = ;
Interface["Shadow_33"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Shadow_33"]["Image"] = [[rbxassetid://8774493213]];
Interface["Shadow_33"]["Size"] = UDim2.new(0, 732, 0, 504);
Interface["Shadow_33"]["BackgroundTransparency"] = 1;
Interface["Shadow_33"]["Name"] = [[Shadow]];
Interface["Shadow_33"]["Position"] = UDim2.new(0, -46, 0, -34);


Interface["Frame_34"] = Instance.new("Frame", Interface["Main_7"]);
Interface["Frame_34"]["BorderSizePixel"] = 0;
Interface["Frame_34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Frame_34"]["ClipsDescendants"] = true;
Interface["Frame_34"]["Size"] = UDim2.new(0, 196, 0, 130);
Interface["Frame_34"]["Position"] = UDim2.new(0, 2, 0, 298);
Interface["Frame_34"]["BackgroundTransparency"] = 1;


Interface["Shadow_35"] = Instance.new("ImageLabel", Interface["Frame_34"]);
Interface["Shadow_35"]["ZIndex"] = -1;
Interface["Shadow_35"]["BorderSizePixel"] = 0;
Interface["Shadow_35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Shadow_35"]["ImageTransparency"] = 0.2;
-- Interface["Shadow_35"]["ImageContent"] = ;
Interface["Shadow_35"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Shadow_35"]["Image"] = [[rbxassetid://8774493213]];
Interface["Shadow_35"]["Size"] = UDim2.new(0, 232, 0, 162);
Interface["Shadow_35"]["BackgroundTransparency"] = 1;
Interface["Shadow_35"]["Name"] = [[Shadow]];
Interface["Shadow_35"]["Position"] = UDim2.new(0, -16, 0, -20);


Interface["CanvasGroup_36"] = Instance.new("CanvasGroup", Interface["Frame_34"]);
Interface["CanvasGroup_36"]["BorderSizePixel"] = 0;
Interface["CanvasGroup_36"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["CanvasGroup_36"]["AutomaticSize"] = Enum.AutomaticSize.X;
Interface["CanvasGroup_36"]["Size"] = UDim2.new(0, 196, 0, 88);
Interface["CanvasGroup_36"]["Position"] = UDim2.new(0, 0, 0, 500);
Interface["CanvasGroup_36"]["BackgroundTransparency"] = 0.5;


Interface["Tab_37"] = Instance.new("TextLabel", Interface["CanvasGroup_36"]);
Interface["Tab_37"]["BorderSizePixel"] = 0;
Interface["Tab_37"]["TextSize"] = 24;
Interface["Tab_37"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Tab_37"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Tab_37"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
Interface["Tab_37"]["Size"] = UDim2.new(0, 196, 0, 28);
Interface["Tab_37"]["Text"] = [[Tab]];
Interface["Tab_37"]["Name"] = [[Tab]];


Interface["UIStroke_38"] = Instance.new("UIStroke", Interface["Tab_37"]);
Interface["UIStroke_38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_38"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_38"]["Thickness"] = 2;
Interface["UIStroke_38"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_39"] = Instance.new("UIGradient", Interface["UIStroke_38"]);
Interface["UIGradient_39"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["Shadow_3a"] = Instance.new("ImageLabel", Interface["CanvasGroup_36"]);
Interface["Shadow_3a"]["ZIndex"] = -1;
Interface["Shadow_3a"]["BorderSizePixel"] = 0;
Interface["Shadow_3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Shadow_3a"]["ImageTransparency"] = 0.2;
-- Interface["Shadow_3a"]["ImageContent"] = ;
Interface["Shadow_3a"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Shadow_3a"]["Image"] = [[rbxassetid://8774493213]];
Interface["Shadow_3a"]["Size"] = UDim2.new(0, 200, 0, 288);
Interface["Shadow_3a"]["BackgroundTransparency"] = 1;
Interface["Shadow_3a"]["Name"] = [[Shadow]];
Interface["Shadow_3a"]["Position"] = UDim2.new(0, -4, 0, 0);


Interface["ScrollingFrame_3b"] = Instance.new("ScrollingFrame", Interface["CanvasGroup_36"]);
Interface["ScrollingFrame_3b"]["BorderSizePixel"] = 0;
Interface["ScrollingFrame_3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Interface["ScrollingFrame_3b"]["Size"] = UDim2.new(0, 194, 0, 244);
Interface["ScrollingFrame_3b"]["Position"] = UDim2.new(0, 0, 0, 30);
Interface["ScrollingFrame_3b"]["ScrollBarThickness"] = 0;
Interface["ScrollingFrame_3b"]["BackgroundTransparency"] = 1;


Interface["UIPadding_3c"] = Instance.new("UIPadding", Interface["ScrollingFrame_3b"]);
Interface["UIPadding_3c"]["PaddingTop"] = UDim.new(0, 10);
Interface["UIPadding_3c"]["PaddingLeft"] = UDim.new(0, 20);


Interface["UIGridLayout_3d"] = Instance.new("UIGridLayout", Interface["ScrollingFrame_3b"]);
Interface["UIGridLayout_3d"]["CellSize"] = UDim2.new(0, 150, 0, 50);


Interface["Credits_3e"] = Instance.new("TextButton", Interface["ScrollingFrame_3b"]);
Interface["Credits_3e"]["BorderSizePixel"] = 0;
Interface["Credits_3e"]["TextSize"] = 24;
Interface["Credits_3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Interface["Credits_3e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
Interface["Credits_3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Interface["Credits_3e"]["Size"] = UDim2.new(0, 136, 0, 44);
Interface["Credits_3e"]["Text"] = [[Credits]];
Interface["Credits_3e"]["Name"] = [[Credits]];
Interface["Credits_3e"]["Position"] = UDim2.new(0, 6, 0, 382);


Interface["UIStroke_3f"] = Instance.new("UIStroke", Interface["Credits_3e"]);
Interface["UIStroke_3f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_3f"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_3f"]["Thickness"] = 2;
Interface["UIStroke_3f"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_40"] = Instance.new("UIGradient", Interface["UIStroke_3f"]);
Interface["UIGradient_40"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["UIStroke_41"] = Instance.new("UIStroke", Interface["CanvasGroup_36"]);
Interface["UIStroke_41"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_41"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_41"]["Thickness"] = 2;
Interface["UIStroke_41"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_42"] = Instance.new("UIGradient", Interface["UIStroke_41"]);
Interface["UIGradient_42"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


Interface["UIStroke_43"] = Instance.new("UIStroke", Interface["Frame_34"]);
Interface["UIStroke_43"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Interface["UIStroke_43"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
Interface["UIStroke_43"]["Thickness"] = 2;
Interface["UIStroke_43"]["Color"] = Color3.fromRGB(255, 255, 255);


Interface["UIGradient_44"] = Instance.new("UIGradient", Interface["UIStroke_43"]);
Interface["UIGradient_44"]["Rotation"] = 20;
Interface["UIGradient_44"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};




local RunScript=Interface["Run_1a"]
local StopRunningScript=Interface["Stop_1e"]

local uis=game.UserInputService
--mainframe.Draggable=true

if isfolder and not isfolder(Name.." Assets") then 
makefolder(Name.." Assets")
end
local Images=Name.." Assets/Images"
if isfolder and not isfolder(Images) then
  makefolder(Images)
end
--// Variables
local osclock=os.clock
local tspawn=task.spawn
local twait=task.wait
local schar=string.char
local ssub=string.sub
local sfind=string.find
local supper=string.upper
local mrandom=math.random
local sin=math.sin
local cos=math.cos
local rad=math.rad
local abs=math.abs
local tan=math.tan
local min=math.min
local clamp=math.clamp
local tinsert=table.insert
local tclear=table.clear
local tclone=table.clone
local tfind=table.find
local random=function(a,b) 
return mrandom(a*1000,b*1000)/1000
end
local vmagnitude=vector.magnitude --faster than indexing with Magnitude
local vnormalize=vector.normalize --faster than indexing with Unit

--the script doesnt have to read global varaibles every time to get them
--why not have them saved in local varaibles for faster access times
local next=next
local pcall=pcall
local xpcall=xpcall
local type=type
local typeof=typeof
local game=game
local replicatesignal=replicatesignal

local i=Instance.new 
local v2=Vector2.new 
local v3=Vector3.new
local c3=Color3.new 
local cf=CFrame.new
local cfl=CFrame.lookAt
local angles=CFrame.fromEulerAngles --faster than .Angles
local u2=UDim2.new 
local e=Enum 
local rp=RaycastParams.new 
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 

local sine=osclock()
local deltaTime=0
local v3_0=v3()
local v3_101=v3(1,0,1)
local v3_010=v3(0,1,0)
local cf_0=cf()
local v3_xz=v3_101*10
local v3_xzL=v3_101*250.1
local v3_net=v3_010*25.01
local pdloadedtime=nil

local enumMD=e.MouseBehavior.Default

--not "local function rs" to not assign debug names
local rs=function()
local s=""
for i=1,mrandom(8,15) do
if mrandom(2)==2 then
s=s..schar(mrandom(65,90))
else
s=s..schar(mrandom(97,122))
end
end
return s
end

--it runs even faster if u call __index and __newindex metamethods directly
local getMetamethodFromErrorStack=function(userdata,f,test)
local ret=nil
xpcall(f,function()
ret=debug.info(2,"f")
end,userdata,nil,0)
if (type(ret)~="function") or not test(ret) then
return f
end
return ret
end
local insSet=getMetamethodFromErrorStack(game,function(a,b,c) a[b]=c end,function(f) local a=i("Folder") local b=rs() f(a,"Name",b) return a.Name==b end)
local insGet=getMetamethodFromErrorStack(game,function(a,b) return a[b] end,function(f) local a=i("Folder") local b=rs() a.Name=b return f(a,"Name")==b end)
local cfGet=getMetamethodFromErrorStack(cf_0,function(a,b) return a[b] end,function(f) return f(cf(1,2,3),"Position")==v3(1,2,3) end)
local cfMul=getMetamethodFromErrorStack(cf_0,function(a,b) return a*b end,function(f) return angles(1,2,3)*angles(1,2,3)==f(angles(1,2,3),angles(1,2,3)) end)
local cfAdd=getMetamethodFromErrorStack(cf_0,function(a,b) return a+b end,function(f) return cf(1,2,3)+v3(1,2,3)==f(cf(1,2,3),v3(1,2,3)) end)
local v3Get=getMetamethodFromErrorStack(v3_0,function(a,b) return a[b] end,function(f) return v3(1,2,3).Unit==f(v3(1,2,3),"Unit") end)
local v2Get=getMetamethodFromErrorStack(v2(),function(a,b) return a[b] end,function(f) return f(v2(1,2),"Y")==2 end)
--multiplying and adding vector3 is faster if you use the * and + operators
--its faster to multiply X and Y of vector2 than to multiply vector2 and then get X and Y from it

--no need to index instances every time to call their functions
local Clone=insGet(game,"Clone")
local ClearAllChildren=insGet(game,"ClearAllChildren")
local Destroy=insGet(game,"Destroy")
local IsA=insGet(game,"IsA")
local FindFirstChildOfClass=insGet(game,"FindFirstChildOfClass")
local FindFirstChild=insGet(game,"FindFirstChild")
local FindFirstChildWhichIsA=insGet(game,"FindFirstChildWhichIsA")
local GetChildren=insGet(game,"GetChildren")
local IsDescendantOf=insGet(game,"IsDescendantOf")
local QueryDescendants=insGet(game,"QueryDescendants")
local GetPropertyChangedSignal=insGet(game,"GetPropertyChangedSignal")

--findfirstchildofclass faster than getservice
local plrs=FindFirstChildOfClass(game,"Players")
local rus=FindFirstChildOfClass(game,"RunService")
local ws=FindFirstChildOfClass(game,"Workspace")
local uis=FindFirstChildOfClass(game,"UserInputService")
local gs=FindFirstChildOfClass(game,"GuiService")
local sg=FindFirstChildOfClass(game,"StarterGui")
local lp=insGet(plrs,"LocalPlayer")
local pg=FindFirstChildOfClass(lp,"PlayerGui")
local mouse=insGet(lp,"GetMouse")(lp)
--local cdsb=insGet(lp,"ConnectDiedSignalBackend")
local rst=insGet(plrs,"RespawnTime")+0.07 --1/15
local preanimation=insGet(rus,"PreAnimation")
local heartbeat=insGet(rus,"Heartbeat")
local renderstepped=insGet(rus,"RenderStepped")
local PostSimulation=insGet(rus,"PostSimulation")
local PreSimulation=insGet(rus,"PreSimulation")
local GetPlayers=insGet(plrs,"GetPlayers")
local SetCoreGuiEnabled=insGet(sg,"SetCoreGuiEnabled")
local GetCoreGuiEnabled=insGet(sg,"GetCoreGuiEnabled")
local Raycast=insGet(ws,"Raycast")
local Connect=heartbeat.Connect
local Disconnect=Connect(GetPropertyChangedSignal(game,"CreatorId"),type).Disconnect
local Wait=heartbeat.Wait
local GetMouseLocation=insGet(uis,"GetMouseLocation")
local GetFocusedTextBox=insGet(uis,"GetFocusedTextBox")
local GetMouseDelta=insGet(uis,"GetMouseDelta")
local IsMouseButtonPressed=insGet(uis,"IsMouseButtonPressed")
local IsKeyDown=insGet(uis,"IsKeyDown")

local Inverse=cfGet(cf_0,"Inverse")
local Lerp=cfGet(cf_0,"Lerp")
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new 
local nr=NumberRange.new 
local u2scale=UDim2.fromScale
local u2offset=UDim2.fromOffset
local RigsTable={}
local VLerp=v3_0.Lerp
local ULerp=u2().Lerp
local CLerp=c3().Lerp

function BuildRig(accName, limbName, C0)
local char=game.Players.LocalPlayer.Character
if not char then return nil end

local acc=char:FindFirstChild(accName)
if not acc then return nil end

local meshId, texId=GetIds(acc)
if not meshId or not texId then
warn("Failed to extract mesh/texture from:", accName)
return nil
end

return {
meshid  =meshId,
textureid=texId,
C0  =C0 or cf_0,
Name=limbName
}
end


local RigsContainer=Global.Config["CRigs"]
if UseCustomRigs then
local char=game.Players.LocalPlayer.Character
do 
local Left_Arm=nil
local Get_Left_Arm=nil
for _,la in next,RigsContainer.LArm do
if char:FindFirstChild(la.AccName) then 
Get_Left_Arm=char[la.AccName].Name
Left_Arm=BuildRig(Get_Left_Arm,"Left Arm",la.Angles)
end 
end

local Get_Right_Arm=nil
local Right_Arm=nil
for _,ra in next,RigsContainer.RArm do
if char:FindFirstChild(ra.AccName) then 
Get_Right_Arm=char[ra.AccName].Name
print(Get_Right_Arm)
Right_Arm=BuildRig(Get_Right_Arm,"Right Arm",ra.Angles)
end 
end

local Get_Left_Leg=nil
local Left_Leg=nil
for _,ll in next,RigsContainer.LLeg do
if char:FindFirstChild(ll.AccName) then 
Get_Left_Leg=char[ll.AccName].Name
print(Get_Left_Leg)
Left_Leg=BuildRig(Get_Left_Leg,"Left Leg",ll.Angles)
end 
end

local Get_Right_Leg=nil
local Right_Leg=nil
for _,rl in next,RigsContainer.RLeg do
if char:FindFirstChild(rl.AccName) then 
Get_Right_Leg=char[rl.AccName].Name
print(Get_Right_Leg)
Right_Leg=BuildRig(Get_Right_Leg,"Right Leg",rl.Angles)
end 
end

local Get_Torso=nil
local Torso=nil
for _,t in next,RigsContainer.Torso do
if char:FindFirstChild(t.AccName) then 
Get_Torso=char[t.AccName].Name
print(Get_Torso)
Torso=BuildRig(Get_Torso,"Torso",t.Angles)
end 
end

for _,v in ipairs({Right_Leg,Left_Leg,Right_Arm,Left_Arm,Torso}) do
tinsert(RigsTable,v)
end
end




end


local accessorylimbs={
{ meshid="110684113028749",textureid="70661572547971",C0=angles(0,0,0),Name="Torso" },
{ meshid="104613079991268",textureid="83269599235494",C0=angles(0,0,0),Name="Torso" },
{ meshid="125405780718494",textureid="136752500636691",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm" },
{ meshid="125405780718494",textureid="136752500636691",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm" },
{ meshid="125405780718494",textureid="136752500636691",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg" },
{ meshid="125405780718494",textureid="136752500636691",C0=angles(0,0,1.5707963267948966),Name="Right Leg" },
{ meshid="96333112188696",textureid="18807356481",C0=angles(0,0,0),Name="Left Arm" },
{ meshid="96130316788066",textureid="18807356481",C0=angles(0,0,0),Name="Right Arm" },




{meshid="11263221350",textureid="11263219250",C0=angles(0,0,0),Name="Left Arm"},

{meshid="11159370334",textureid="11159284657",C0=angles(0,0,0),Name="Right Arm"},


--// Noob Rigs 

{meshid="137702817952968",textureid="135650240593878",C0=angles(0,0,80.05),Name="Left Arm"},
{meshid="137702817952968",textureid="135650240593878",C0=angles(0,0,80.05),Name="Right Arm"},
{meshid="137702817952968",textureid="73798034827573",C0=angles(0,0,80.09),Name="Left Leg"},
{meshid="137702817952968",textureid="73798034827573",C0=angles(0,0,80.09),Name="Right Leg"},
{meshid="126825022897778",textureid="125975972015302",C0=angles(0,0,0),Name="Torso"},

--// White Rigs 

{
meshid="139733645770094",textureid="130809869695496",C0=angles(0,0,80.09),Name="Left Arm"
},
{
meshid="90736849096372",textureid="79186624401216",C0=angles(0,0,80.09),Name="Right Arm"
},
{
meshid="99608462237958",textureid="130809869695496",C0=angles(0,0,80.09),Name="Left Leg"
},
{
meshid="105141400603933",textureid="71060417496309",C0=angles(0,0,80.09),Name="Right Leg"
},


{
meshid="126825022897778",textureid="130689541138804",C0=angles(0,0,0),Name="Torso"
},
{
meshid="100128920324073",textureid="133680105074740",C0=angles(rad(-75),rad(15),rad(-20)),Name="Right Leg"
},
{
meshid="130309145260656",textureid="82390202293774",C0=angles(rad(-75),rad(-15),rad(20)),Name="Left Arm"
},
{
meshid="130309145260656",textureid="93374633946646",C0=angles(rad(-75),rad(-15),rad(20)),Name="Left Leg"
},
{
meshid="100128920324073",textureid="97155254696037",C0=angles(rad(-75),rad(15),rad(-20)),Name="Right Arm"
},
{ meshid = "18919712035", Name = "Torso", C0 = CFrame.identity, textureid = "18430134193" },--95290698984301









{meshid="14255522247",textureid="",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
{meshid="14255522247",textureid="",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

{meshid="12344207333",textureid="",C0=angles(2,0,0),Name="Left Arm"},
{meshid="12344206657",textureid="",C0=angles(2,0,0),Name="Right Arm"},

{meshid="13831073174",textureid="",C0=cfMul(cf(0.017,0,-0.23),angles(-1.4835298641951802,-0.15707963267948966,2.199114857512855)),Name="Left Arm"},
{meshid="13839903766",textureid="",C0=cfMul(cf(0,-0.62,-0.01),angles(1.6580627893946132,0.15707963267948966,-2.199114857512855)),Name="Right Arm"},

{meshid="11159370334",textureid="11159285454",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
{meshid="12652772399",textureid="12652775021",C0=cf(0,-0.125,0),Name="Right Leg"},

{meshid="14768684979",textureid="",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
{meshid="14768684979",textureid="",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},

{meshid="14768666349",textureid="",C0=cf_0,Name="Torso"},
{meshid="14241018198",textureid="",C0=cf_0,Name="Torso"},
{meshid="13421774668",textureid="",C0=cf_0,Name="Torso"},

{meshid="4324138105",textureid="4324138210",C0=cfMul(angles(-1.6144295580947547,1.5707963267948966,0),cf(-0.125,0.3,0)),Name="Left Arm"},
{meshid="4154474745",textureid="4154474807",C0=cfMul(angles(1.5271630954950384,-1.5707963267948966,0),cf(-0.125,-0.3,0)),Name="Left Arm"},
{meshid="3030546036",textureid="3650191503",C0=cfMul(angles(1.5271630954950384,1.5707963267948966,0),cf(0.125,-0.3,0)),Name="Right Arm"},
{meshid="3030546036",textureid="3443321249",C0=cfMul(angles(-1.6144295580947547,-1.5707963267948966,0),cf(0.125,0.3,0)),Name="Right Arm"},
{meshid="3030546036",textureid="3360974849",C0=cfMul(angles(1.5271630954950384,1.5707963267948966,0),cf(-0.125,-0.35,0)),Name="Left Leg"},
{meshid="3030546036",textureid="3360978739",C0=cfMul(angles(-1.6144295580947547,-1.5707963267948966,0),cf(-0.125,0.3,0)),Name="Left Leg"},
{meshid="3030546036",textureid="3033898741",C0=cfMul(angles(1.5271630954950384,-1.5707963267948966,0),cf(0.125,-0.35,0)),Name="Right Leg"},
{meshid="3030546036",textureid="3409604993",C0=cfMul(angles(-1.6144295580947547,1.5707963267948966,0),cf(0.125,0.3,0)),Name="Right Leg"},
{meshid="4324138105",textureid="4391374782",C0=cfMul(angles(-1.6144295580947547,1.5707963267948966,0),cf(0.125,0.3,0)),Name="Right Arm"},
{meshid="4324138105",textureid="4391374782",C0=cfMul(angles(-1.6144295580947547,1.5707963267948966,0),cf(0.125,0.3,0)),Name="Right Arm"},
{meshid="4819720316",textureid="4819722776",C0=angles(0,0,0.2617993877991494),Name="Torso"},


{meshid="117287001096396",textureid="",C0=cf_0,Name="Left Arm"},
{meshid="117287001096396",textureid="",C0=cf_0,Name="Right Arm"},

{meshid="90736849096372",textureid="",C0=angles(0,0,1.5707963267948966),Name="Left Arm"},
{meshid="105141400603933",textureid="",C0=angles(0,0,1.5707963267948966),Name="Right Arm"},

{meshid="11263221350",textureid="11263219250",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
{meshid="11159370334",textureid="11159284657",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

{meshid="14255522247",textureid="",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
{meshid="14255522247",textureid="",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

{meshid="17374767929",textureid="",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
{meshid="17374767929",textureid="",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

{meshid="12344207333",textureid="",C0=angles(2,0,0),Name="Left Arm"},
{meshid="12344206657",textureid="",C0=angles(2,0,0),Name="Right Arm"},

{meshid="13831073174",textureid="",C0=cf(0.017,0,-0.23)*angles(-1.4835298641951802,-0.15707963267948966,2.199114857512855),Name="Left Arm"},
{meshid="13839903766",textureid="",C0=cf(0,-0.62,-0.01)*angles(1.6580627893946132,0.15707963267948966,-2.199114857512855),Name="Right Arm"},

{meshid="121304376791439",textureid="",C0=cf_0,Name="Left Leg"},
{meshid="121304376791439",textureid="",C0=cf_0,Name="Right Leg"},

{meshid="11159370334",textureid="11159285454",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
{meshid="12652772399",textureid="12652775021",C0=cf(0,-0.125,0),Name="Right Leg"},

{meshid="14768684979",textureid="",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
{meshid="14768684979",textureid="",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},

{meshid="17387586286",textureid="",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
{meshid="17387586286",textureid="",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Leg"},

{meshid="14768666349",textureid="",C0=cf_0,Name="Torso"},
{meshid="14241018198",textureid="",C0=cf_0,Name="Torso"},
{meshid="13421774668",textureid="",C0=cf_0,Name="Torso"},
{meshid="110684113028749",textureid="",C0=cf_0,Name="Torso"},
{meshid="127552124837034",textureid="",C0=angles(0,0,1.5707963267948966),Name="Torso"},

{meshid="4324138105",textureid="4324138210",C0=angles(-1.6144295580947547,1.5707963267948966,0)*cf(-0.125,0.3,0),Name="Left Arm"},
{meshid="4154474745",textureid="4154474807",C0=angles(1.5271630954950384,-1.5707963267948966,0)*cf(-0.125,-0.3,0),Name="Left Arm"},
{meshid="3030546036",textureid="3650191503",C0=angles(1.5271630954950384,1.5707963267948966,0)*cf(0.125,-0.3,0),Name="Right Arm"},
{meshid="3030546036",textureid="3443321249",C0=angles(-1.6144295580947547,-1.5707963267948966,0)*cf(0.125,0.3,0),Name="Right Arm"},
{meshid="3030546036",textureid="3360974849",C0=angles(1.5271630954950384,1.5707963267948966,0)*cf(-0.125,-0.35,0),Name="Left Leg"},
{meshid="3030546036",textureid="3360978739",C0=angles(-1.6144295580947547,-1.5707963267948966,0)*cf(-0.125,0.3,0),Name="Left Leg"},
{meshid="3030546036",textureid="3033898741",C0=angles(1.5271630954950384,-1.5707963267948966,0)*cf(0.125,-0.35,0),Name="Right Leg"},
{meshid="3030546036",textureid="3409604993",C0=angles(-1.6144295580947547,1.5707963267948966,0)*cf(0.125,0.3,0),Name="Right Leg"},
{meshid="4819720316",textureid="4819722776",C0=angles(0,0,0.2617993877991494),Name="Torso"},
}




for _,v in ipairs(RigsTable) do
tinsert(accessorylimbs, v)
end






local timeQueryDescendants=function(p,s,t)
t=osclock()+t
local refresh=true
local con=Connect(insGet(p,"DescendantAdded"),function()
refresh=true
end)
local res=nil
repeat
if refresh then
res=QueryDescendants(p,s)
if next(res) then
--not using break to have one less jump opcode
Disconnect(con)
return res
end
refresh=false
end
Wait(preanimation)
until (osclock()>t)
Disconnect(con)
return res
end


local function gp(p,n,cl)
for i,v in next,GetChildren(p) do
if IsA(v,cl) and (insGet(v,"Name")==n) then
return v
end
end
return nil
end
local timegp=function(p,n,c,t)
t=osclock()+t
while t>osclock() do
for i,v in next,GetChildren(p) do
if IsA(v,c) and (insGet(v,"Name")==n) then
return v
end
end
Wait(preanimation)
end
return nil
end
local makeplaceholder=function(v)
if not insGet(v,"Archivable") then
insSet(v,"Archivable",true)
end
v=Clone(v)
for i,v in next,GetChildren(v) do
if IsA(v,"SpecialMesh") then
insSet(v,"Name",rs())
ClearAllChildren(v)
else
Destroy(v)
end
end
insSet(v,"Name",rs())
insSet(v,"Anchored",true)
insSet(v,"CanCollide",false)
insSet(v,"Transparency",0.25)
return v
end
local ondes=function(d)
if IsA(d,"GuiObject") then
local thisEntered=false
local thisAdded=false
local con0=Connect(insGet(d,"MouseEnter"),function()
thisEntered=true
if (not thisAdded) and insGet(d,"Active") then
activeEntered=activeEntered + 1
thisAdded=true
end
end)
local con1=Connect(insGet(d,"MouseLeave"),function()
thisEntered=false
if thisAdded then
activeEntered=activeEntered - 1
thisAdded=false
end
end)
local con2=Connect(GetPropertyChangedSignal(d,"Active"),function()
if thisEntered then
if thisAdded and not insGet(d,"Active") then
activeEntered=activeEntered - 1
thisAdded=false
elseif insGet(d,"Active") and not thisAdded then
activeEntered=activeEntered + 1
thisAdded=true
end
end
end)
local con3=nil
con3=Connect(insGet(d,"AncestryChanged"),function()
if not IsDescendantOf(d,window) then
if thisAdded then
activeEntered=activeEntered - 1
end
Disconnect(con0)
Disconnect(con1)
Disconnect(con2)
Disconnect(con3)
end
end)
end
end
local bindable=i("BindableEvent")
insSet(bindable,"Name",rs())
local c=nil
local cons={}
local onrespawn=nil
local flingtable={}
local rootparts={}
local charcons={}
local onnewcamera=nil
local cframes={}
local stopreanimate=function() 
if c then
c=nil
if permadeath then
--replicatesignal(cdsb)
end
for i,v in next,cframes do
local p=i.v
if p then
Destroy(p)
end
end
tclear(cframes)
for i,v in next,flingtable do
if v then --it could be false
Destroy(v)
end
end
tclear(flingtable)
for i,v in next,charcons do
Disconnect(v)
end
tclear(charcons)
for i,v in next,cons do
Disconnect(v)
end
tclear(cons)
insSet(uis,"MouseBehavior",enumMD)
onnewcamera()
return true
end
return false
end
local function emptyfunction() end
local pdloadedtime=nil
local allowshiftlock=true
local ctrltp=false
local placeholders=Placeholder
local clickfling=false
local highlightflingtargets=false
local discharscripts=false
local flingchangestate=3
local permadeath=FakePerma
local respawntp=SpawnTp
--0 stay at spawn
--1 - mrandom tp close
--2 - behind char
--3 - hidebody
local breakjointsmethod=Breakjoints
--1 - Breakjoint+Health
--2 - Health Or Breakjoint
--3 - Breakjoints
--4 - ServerBreakJoints
local simrad=true 
local hidedeatheffect=true
local refit=Refit
local raycastparams
local reanimate=function()
--[[
FDless reanimate by MyWorld
optimize the optimized
]]

local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them
local speedlimit = 7500 --makes your parts move slower if the magnitude of their velocity is higher than this
local retVelTime = 0.71 --time that claimed parts have velocity to reclaim in case u lose them
local walkSpeed = 16 --your walkspeed (can be changed at runtime)
local jumpPower = 50 --your jump power (can be changed at runtime)
local gravity = 196.2 --how fast the characters velocity decreases while falling (can be changed at runtime)
local ctrlclicktp = ctrltp --makes you teleport where u point ur mouse cursor at when click and hold ctrl down
local clickfling = clickfling --makes you fling the person you clicked when its available to do so
local flingvel = v3(15000,16000,15000) --the rotation velocity that ur character will have while flinging

if stopreanimate() then return end
c=insGet(lp,"Character")
if not (c and IsDescendantOf(c,ws)) then return end

local rootpart=FindFirstChild(c,"HumanoidRootPart") or FindFirstChild(c,"Torso") or FindFirstChild(c,"UpperTorso") or timegp(c,"HumanoidRootPart","BasePart",0.5) or FindFirstChildWhichIsA(c,"BasePart")
if not rootpart then return end

local cam=nil
--theres a way to have ws.currentcamera nil on heartbeat and still have the game run normally
local refcam=function()
local newcam=insGet(ws,"CurrentCamera")
while not newcam do
Wait(GetPropertyChangedSignal(ws,"CurrentCamera"))
newcam=insGet(ws,"CurrentCamera")
end
cam=newcam
end
refcam()
local camcfOff=cf_0
local camcf=insGet(cam,"CFrame")
local enumCamS=e.CameraType.Scriptable
local camt=insGet(cam,"CameraType")
local camcon0=nil
local camcon1=nil
local camcon2=nil
 onnewcamera=function()
refcam()
if camcon0 then 
Disconnect(camcon0)
Disconnect(camcon1)
camcon0=nil
end
if not c then 
if insGet(cam,"CameraType")==enumCamS then
insSet(cam,"CameraType",camt)
end
return Disconnect(camcon2) 
end
camcon0=Connect(GetPropertyChangedSignal(cam,"CFrame"),function()
if insGet(cam,"CFrame")~=cfMul(camcf,camcfOff) then
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
end
end)
camcon1=Connect(GetPropertyChangedSignal(cam,"CameraType"),function()
if insGet(cam,"CameraType")~=enumCamS then
insSet(cam,"CameraType",enumCamS)
end
end)
if insGet(cam,"CameraType")~=enumCamS then
insSet(cam,"CameraType",enumCamS)
end
if insGet(cam,"CFrame")~=cfMul(camcf,camcfOff) then
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
end
end
camcon2=Connect(GetPropertyChangedSignal(ws,"CurrentCamera"),onnewcamera)
if not SmoothCamera then onnewcamera() end

local velYdelta=insGet(ws,"Gravity")*0.025
Connect(GetPropertyChangedSignal(ws,"Gravity"),function()
velYdelta=insGet(ws,"Gravity")*0.025
end)

local fpdh=insGet(ws,"FallenPartsDestroyHeight")
novoid=novoid and (fpdh+1)

local Yvel=0
local cfr=insGet(rootpart,"CFrame")
local pos=cfGet(cfr,"Position")
cfr=cfl(pos,pos+cfGet(cfr,"LookVector")*v3_101)
local primarypart=nil
local shiftlock=false
local firstperson=false
local xzvel=v3_0
local v3_0150=v3_010*1.5
local camcfLV=cfGet(camcf,"LookVector")
local camrot=cfl(v3_0,camcfLV)
local camrotX,camrotY=camrot:ToEulerAnglesYXZ()
local camcfRV=cfGet(camrot,"RightVector")
local cammag=-vmagnitude((cfGet(camcf,"Position")-(pos+v3_0150)))

local R6parts={ 
head={Name="Head"},
torso={Name="Torso"},
root={Name="HumanoidRootPart"},
leftArm={Name="Left Arm"},
rightArm={Name="Right Arm"},
leftLeg={Name="Left Leg"},
rightLeg={Name="Right Leg"}
}
rootpart=R6parts.root
for i,v in next,R6parts do
cframes[v]=cfr
end
local joints={
{
Name="Neck",
Part0=R6parts.torso,Part1=R6parts.head,
C0=cf(0,1,0,-1,0,0,0,0,1,0,1,-0),
C1=cf(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
},
{
Name="RootJoint",
Part0=rootpart,Part1=R6parts.torso,
C0=cf(0,0,0,-1,0,0,0,0,1,0,1,-0),
C1=cf(0,0,0,-1,0,0,0,0,1,0,1,-0)
},
{
Name="Right Shoulder",
Part0=R6parts.torso,Part1=R6parts.rightArm,
C0=cf(1,0.5,0,0,0,1,0,1,-0,-1,0,0),
C1=cf(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
},
{
Name="Left Shoulder",
Part0=R6parts.torso,Part1=R6parts.leftArm,
C0=cf(-1,0.5,0,0,0,-1,0,1,0,1,0,0),
C1=cf(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
},
{
Name="Right Hip",
Part0=R6parts.torso,Part1=R6parts.rightLeg,
C0=cf(1,-1,0,0,0,1,0,1,-0,-1,0,0),
C1=cf(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
},
{
Name="Left Hip",
Part0=R6parts.torso,Part1=R6parts.leftLeg,
C0=cf(-1,-1,0,0,0,-1,0,1,0,1,0,0),
C1=cf(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
}
}

local refreshedjoints={}
local refreshjointsI=nil
refreshjointsI=function(part)
refreshedjoints[part]=true
for i,v in next,joints do
local part0=v.Part0
local part1=v.Part1
if part1 and (part0==part) then
cframes[part1]=cfMul(cframes[part],cfMul(v.C0,Inverse(v.C1)))
if not refreshedjoints[part1] then
refreshjointsI(part1)
end
elseif part0 and (part1==part) then
cframes[part0]=cfMul(cframes[part],cfMul(v.C1,Inverse(v.C0)))
if not refreshedjoints[part0] then
refreshjointsI(part0)
end
end
end
end
refreshjointsI(rootpart)
tclear(refreshedjoints)

local attachments={
RightShoulderAttachment={R6parts.rightArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
RightGripAttachment={R6parts.rightArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
LeftFootAttachment={R6parts.leftLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
LeftShoulderAttachment={R6parts.leftArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
LeftGripAttachment={R6parts.leftArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
RootAttachment={rootpart,cf(0,0,0,1,0,0,0,1,0,0,0,1)},
RightFootAttachment={R6parts.rightLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
NeckAttachment={R6parts.torso,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
BodyFrontAttachment={R6parts.torso,cf(0,0,-0.5,1,0,0,0,1,0,0,0,1)},
BodyBackAttachment={R6parts.torso,cf(0,0,0.5,1,0,0,0,1,0,0,0,1)},
LeftCollarAttachment={R6parts.torso,cf(-1,1,0,1,0,0,0,1,0,0,0,1)},
RightCollarAttachment={R6parts.torso,cf(1,1,0,1,0,0,0,1,0,0,0,1)},
WaistFrontAttachment={R6parts.torso,cf(0,-1,-0.5,1,0,0,0,1,0,0,0,1)},
WaistCenterAttachment={R6parts.torso,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
WaistBackAttachment={R6parts.torso,cf(0,-1,0.5,1,0,0,0,1,0,0,0,1)},
HairAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
HatAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
FaceFrontAttachment={R6parts.head,cf(0,0,-0.6,1,0,0,0,1,0,0,0,1)},
FaceCenterAttachment={R6parts.head,cf(0,0,0,1,0,0,0,1,0,0,0,1)}
}

local getPart=function(name,blacklist)
if blacklist then
for i,v in next,cframes do
if (i.Name==name) and not tfind(blacklist,i) then
return i
end
end
else
for i,v in next,cframes do
if i.Name==name then
return i
end
end
end
return nil
end

local getJoint=function(name)
for i,v in next,joints do
if v.Name==name then
return v
end
end
return {C0=cf_0,C1=cf_0}
end

local getPartFromMesh=function(m,t,blacklist)
if blacklist then
for v,_ in next,cframes do
if v.m and (not tfind(blacklist,v)) and sfind(v.m,m) and sfind(v.t,t) then
return v
end
end
else
for v,_ in next,cframes do
if v.m and sfind(v.m,m) and sfind(v.t,t) then
return v
end
end
end
local p={m=m,t=t}
cframes[p]=cfr
local j={C0=cf_0,C1=cf_0,Part0=p}
p.j=j
return p
end

local getPartJoint=function(p)
if cframes[p] then
local j=p.j
if j then
return j
end
for i,v in next,joints do
if v.Part0==p then
return v
end
end
for i,v in next,joints do
if v.Part1==p then
return v
end
end
end
return nil
end

local getAccWeldFromMesh=function(m,t)
return getPartJoint(getPartFromMesh(m,t))
end

 raycastparams=rp()
raycastparams.FilterType=e.RaycastFilterType.Exclude
raycastparams.RespectCanCollide=true
local rayfilter={}
local characters={}
local refreshrayfilter=function()
tclear(rayfilter)
for i,v in next,characters do
tinsert(rayfilter,v)
end
raycastparams.FilterDescendantsInstances=rayfilter
end
local rootparts={}
for i,v in next,accessorylimbs do
v.p=getPart(v.Name)
end
local makePartCons=function(p,t)
if (t.p==p) and insGet(p,"Anchored") then
--t.p=nil
end
local con0=Connect(GetPropertyChangedSignal(p,"Anchored"),function()
if insGet(p,"Anchored") then
if t.p==p then
--t.c=nil
--t.p=nil
end
elseif not t.p then
t.p=p
end
end)
local con1=nil
con1=Connect(insGet(p,"AncestryChanged"),function()
if not IsDescendantOf(p,ws) then
Disconnect(con0)
Disconnect(con1)
if t.p==p then
t.p=nil
end
if refit and c then
--[[tspawn(function()
local char=lp.Character
for _,t in char:GetChildren() do 
if t:IsA("Accessory") then 
--accessoriesthataretracked[t]=true
tspawn(function()
pcall(function()
local f=t.Handle
local hd=f
local sine=os.clock()
repeat
local sine15=sine*15
local sin=math.sin 
local v3=Vector3.new
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
hd.AssemblyAngularVelocity=idlerv
--hd.AssemblyLinearVelocity=v3(0,0,0)
hd.CFrame=hd.CFrame+cf(0,.1,0)
Respawn()
oswait(.1)
until IsHatDropped
end)
end)
end
end
end)]]
end
end
end)
end
local ondes=function(v)
if IsA(v,"Attachment") then
local v1=attachments[insGet(v,"Name")]
if v1 then
local p=insGet(v,"Parent")
if insGet(p,"Parent")~=c then
local meshid=nil
local textureid=nil
if IsA(p,"MeshPart") then
meshid=insGet(p,"MeshId")
textureid=insGet(p,"TextureID")
elseif IsA(p,"BasePart") then
local sm=FindFirstChildOfClass(p,"SpecialMesh")
if sm then
meshid=insGet(sm,"MeshId")
textureid=insGet(sm,"TextureId")
else
return
end
else
return
end
for i,_ in next,cframes do
if (meshid==i.m) and (textureid==i.t) then
local p1=i.p
if p1 then
if p1==p then
return
end
else
i.p=p
makePartCons(p,i)
return
end
else
local j=i.j
if j and sfind(meshid,i.m) and sfind(textureid,i.t) then
i.m=meshid
i.t=textureid
i.l=insGet(p,"Position")
i.p=p
makePartCons(p,i)
i.j=nil
i.Name=insGet(p,"Name")
j.C0=insGet(v,"CFrame")
j.C1=v1[2]
j.Part1=v1[1]
tinsert(joints,j)
return
end
end
end
for i,l in next,accessorylimbs do
if l.p and sfind(meshid,l.meshid) and sfind(textureid,l.textureid) then
local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
makePartCons(p,t)
if placeholders then
t.v=makeplaceholder(p)
t.b=false
end
cframes[t]=insGet(p,"CFrame")
tinsert(joints,{Part0=t,Part1=l.p,C0=l.C0,C1=cf_0})
l.p=nil
return
end
end
local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
makePartCons(p,t)
if placeholders then
t.v=makeplaceholder(p)
t.b=false
end
cframes[t]=insGet(p,"CFrame")
tinsert(joints,{Part0=t,Part1=v1[1],C0=insGet(v,"CFrame"),C1=v1[2]})
end
end
end
end
local hhOff=3
local hhOff1=3.01
local setHipHeight=function(n)
hhOff=n+3
hhOff1=n+3.01
end
local simradv=0
local enumH=e.CoreGuiType.Health
local onplayer=function(v)
simradv=simradv+1000
local islp=v==lp
local lastc=nil
local oncharacter=function()

local newc=insGet(v,"Character")
if newc and (newc~=lastc) then
lastc=newc
characters[v]=newc
refreshrayfilter()
if islp then
if discharscripts then
Connect(insGet(newc,"DescendantAdded"),discharscripts)
for i,v in next,QueryDescendants(newc,"Script") do
insSet(v,"Disabled",true)
end
end

local hrp=timeQueryDescendants(newc,">BasePart#HumanoidRootPart",10)[1]

if not (hrp and c and IsDescendantOf(newc,ws)) then return end
c=newc
local fi,fv=next(flingtable)
if fi then
if permadeath and not pdloadedtime then
--IdkPD()
pdloadedtime=osclock()+rst
end
if flingchangestate==3 then
local hum=FindFirstChildOfClass(c,"Humanoid")
if hum then
insGet(hum,"ChangeState")(hum,e.HumanoidStateType.Physics)
insGet(hum,"SetStateEnabled")(hum,e.HumanoidStateType.Seated,false)
end
elseif flingchangestate==1 then
local hum=FindFirstChildOfClass(c,"Humanoid")
if hum then
insGet(hum,"ChangeState")(hum,e.HumanoidStateType.Physics)
end
elseif flingchangestate==2 then
local hum=FindFirstChildOfClass(c,"Humanoid")
if hum then
insGet(hum,"SetStateEnabled")(hum,e.HumanoidStateType.Seated,false)
end
end
for i,v in next,tclone(flingtable) do
if not c then
return
end
local startpos=insGet(i,"Position")
local stoptime=sine+3
while true do
oswait(.1) 
if sine>stoptime then
break
end
if insGet(i,"Anchored") or not IsDescendantOf(i,ws) then
break
end
if vmagnitude(startpos-insGet(i,"Position"))>200 then
break
end
local tcf=cfAdd(insGet(i,"CFrame"),insGet(i,"AssemblyLinearVelocity")*(sin(sine*15)+1))
if novoid and (cfGet(tcf,"Y")<novoid) then
tcf=cfAdd(tcf,v3(0,-150,0)*(novoid-cfGet(tcf,"Y")))
end
insSet(hrp,"CFrame",tcf)
insSet(hrp,"AssemblyLinearVelocity",insGet(i,"AssemblyLinearVelocity")*v3_101*75)
insSet(hrp,"AssemblyAngularVelocity",flingvel)
end
if v then
Destroy(v)
end
flingtable[i]=nil
end
insSet(hrp,"AssemblyLinearVelocity",v3_0)
insSet(hrp,"AssemblyAngularVelocity",v3_0)
insSet(hrp,"CFrame",cfr)
end
if not Hatdrop then
if respawntp==0 then
--swait()
elseif respawntp==1 then
local startpos=pos+v3(mrandom(-10,10),-200+hhOff1,mrandom(-10,10))
local dir=nil
local poscheck=true
while poscheck do
poscheck=false
for i,v in next,rootparts do
local diff=(startpos-insGet(v,"Position"))*v3(1,-30+hhOff1,1)
if vmagnitude(diff)<10 then
poscheck=true
dir=dir or (vnormalize(diff)*3)
startpos=startpos+dir
end
end
local diff=(startpos-pos)*v3_101
if vmagnitude(diff)<10 then
poscheck=true
dir=dir or (vnormalize(diff)*3)
startpos=startpos+dir
end
end
startpos=cfAdd(cfGet(cfr,"Rotation"),startpos)
insSet(hrp,"AssemblyLinearVelocity",v3_net)
insSet(hrp,"AssemblyAngularVelocity",v3_0)
insSet(hrp,"CFrame",startpos)
oswait(.1)
elseif respawntp==2 then
insSet(hrp,"CFrame",cfr*cf(random(-10,10),-30+hhOff1,random(-10,10)))
insSet(hrp,"AssemblyLinearVelocity",v3_0)
insSet(hrp,"AssemblyAngularVelocity",v3_0)
oswait(.1)
elseif respawntp==3 then
local t=osclock()+0.25
if pdloadedtime and pdloadedtime>t then
t=pdloadedtime
end
local startcf=cfr*cf(random(-10,10),-30+hhOff1,random(-10,10))
while true do
oswait(.1)
insSet(hrp,"CFrame",startcf)
insSet(hrp,"AssemblyLinearVelocity",v3_0)
insSet(hrp,"AssemblyAngularVelocity",v3_0)
if osclock()>t then
break
end
end
insSet(hrp,"CFrame",startcf)
insSet(hrp,"AssemblyLinearVelocity",v3_0)
insSet(hrp,"AssemblyAngularVelocity",v3_0)
end
end
if newc~=c then
return
end
primarypart=insGet(newc,"PrimaryPart") or hrp
if hidedeatheffect and GetCoreGuiEnabled(sg,enumH) then
SetCoreGuiEnabled(sg,enumH,false)
end
if pdloadedtime then
if (osclock()<pdloadedtime) then
twait(pdloadedtime-osclock())
end
pdloadedtime=nil
end 
--if FakePerma and not Hatdrop then IdkPD() end
if Hatdrop then
HatDrop(newc)
else
if breakjointsmethod==4 then
local h=FindFirstChildOfClass(newc,"Humanoid")
if h then
replicatesignal(insGet(h,"ServerBreakJoints"))
else
insGet(newc,"BreakJoints")(newc)
end
elseif breakjointsmethod==1 then
local h=FindFirstChildOfClass(newc,"Humanoid")
if h then
insSet(h,"Health",0)
end
elseif breakjointsmethod==2 then
local h=FindFirstChildOfClass(newc,"Humanoid")
if h then
insSet(h,"Health",0)
else
insGet(newc,"BreakJoints")(newc)
end
else
insGet(newc,"BreakJoints")(newc)
end
end
cons.ondes=Connect(insGet(newc,"DescendantAdded"),ondes)
for i,v in next,QueryDescendants(newc,"Attachment") do
ondes(v)
end
else
local hrp=FindFirstChild(newc,"HumanoidRootPart") or timegp(newc,"HumanoidRootPart","BasePart",10)
if hrp and IsDescendantOf(newc,ws) then
rootparts[v]=hrp
end
end
end
end
charcons[v]=Connect(GetPropertyChangedSignal(v,"Character"),oncharacter)
oncharacter()
end
tinsert(cons,Connect(insGet(plrs,"PlayerRemoving"),function(v)
simradv=simradv-1000
local charcon=charcons[v]
if charcon then
Disconnect(charcon)
end
characters[v]=nil
rootparts[v]=nil
end))
for i,v in next,GetPlayers(plrs) do simradv=simradv+1000 if v~=lp then tspawn(onplayer,v) end end
tinsert(cons,Connect(insGet(plrs,"PlayerAdded"),onplayer))
onplayer(lp)
local setsimrad=emptyfunction
if simrad then
setsimrad=function()
if pcall(insSet,lp,"SimulationRadius",simradv) then
setsimrad=function()
insSet(lp,"SimulationRadius",simradv)
end
else
setsimrad=emptyfunction
end
end
end

local mradN05=-0.008726646259971648
local pi2=math.pi/2-0.0001
local npi2=-pi2
local KeyCode=e.KeyCode
local enumYXZ=e.RotationOrder.YXZ
local enumMB2=e.UserInputType.MouseButton2
local enumMLCP=e.MouseBehavior.LockCurrentPosition
local enumMLC=(insGet(uis,"TouchEnabled") and enumMLCP) or e.MouseBehavior.LockCenter 
local enumMW=e.UserInputType.MouseWheel
local enumMM=e.UserInputType.MouseMovement

local mouseBehavior=insGet(uis,"MouseBehavior")
tinsert(cons,Connect(GetPropertyChangedSignal(uis,"MouseBehavior"),function()
if insGet(uis,"MouseBehavior")~=mouseBehavior then
insSet(uis,"MouseBehavior",mouseBehavior)
end
end))

local mode="default"
local defaultmode={}
local modes={default=defaultmode}

local lerpsIdle=emptyfunction
local lerpsWalk=emptyfunction
local lerpsJump=emptyfunction
local lerpsFall=emptyfunction

local addmode=function(key,mode)
if (type(key)~="string") or (type(mode)~="table") then
return
end
for i,v in next,mode do
if type(v)~="function" then
mode[i]=nil
end
end
if key=="default" then
defaultmode=mode
modes.default=mode
lerpsIdle=mode.idle or emptyfunction
lerpsWalk=mode.walk or emptyfunction
lerpsJump=mode.jump or emptyfunction
lerpsFall=mode.fall or emptyfunction
if mode.modeEntered then
mode.modeEntered()
end
elseif #key==1 then
key=KeyCode[supper(ssub(key,1,1))]
modes[key]=mode
end
end

local keyW=KeyCode.W
local Wpressed=IsKeyDown(uis,keyW)
local keyA=KeyCode.A
local Apressed=IsKeyDown(uis,keyA)
local keyS=KeyCode.S
local Spressed=IsKeyDown(uis,keyS)
local keyD=KeyCode.D
local Dpressed=IsKeyDown(uis,keyD)
local keySpace=KeyCode.Space
local jumpingInput=IsKeyDown(uis,keySpace)

local FWmovement=0
local RTmovement=0
local isWalking=false
local refreshKeyboardMovement=function()
if Wpressed then if Spressed then if Dpressed then if Apressed then isWalking=false else FWmovement=0 RTmovement=1 isWalking=true end else if Apressed then FWmovement=0 RTmovement=-1 isWalking=true else isWalking=false end end else FWmovement=1 if Dpressed then if Apressed then RTmovement=0 else RTmovement=1 end else if Apressed then RTmovement=-1 else RTmovement=0 end end isWalking=true end else if Spressed then FWmovement=-1 if Dpressed then if Apressed then RTmovement=0 else RTmovement=1 end else if Apressed then RTmovement=-1 else RTmovement=0 end end isWalking=true else if Dpressed then if Apressed then isWalking=false else FWmovement=0 RTmovement=1 isWalking=true end else if Apressed then FWmovement=0 RTmovement=-1 isWalking=true else isWalking=false end end end end
end
refreshKeyboardMovement()

local keyShift=KeyCode.LeftShift
tinsert(cons,Connect(insGet(uis,"InputBegan"),function(a)
if insGet(gs,"MenuIsOpen") or GetFocusedTextBox(uis) then
return
end
a=insGet(a,"KeyCode")
if a==keyW then
Wpressed=true
refreshKeyboardMovement()
elseif a==keyA then
Apressed=true
refreshKeyboardMovement()
elseif a==keyS then
Spressed=true
refreshKeyboardMovement()
elseif a==keyD then
Dpressed=true
refreshKeyboardMovement()
elseif a==keySpace then
jumpingInput=true
elseif a==keyShift then
shiftlock=allowshiftlock and not shiftlock
elseif modes[a] then
local modeLeft=modes[mode].modeLeft
if modeLeft then
modeLeft()
end
if mode==a then
mode="default"
else
mode=a
end
local modet=modes[mode]
lerpsIdle=modet.idle or defaultmode.idle or emptyfunction
lerpsWalk=modet.walk or defaultmode.walk or emptyfunction
lerpsJump=modet.jump or defaultmode.jump or emptyfunction
lerpsFall=modet.fall or defaultmode.fall or emptyfunction
if modes[mode].modeEntered then
modes[mode].modeEntered()
end
end
end))
tinsert(cons,Connect(insGet(uis,"InputEnded"),function(a)
a=insGet(a,"KeyCode")
if a==keyW then
Wpressed=false
refreshKeyboardMovement()
elseif a==keyA then
Apressed=false
refreshKeyboardMovement()
elseif a==keyS then
Spressed=false
refreshKeyboardMovement()
elseif a==keyD then
Dpressed=false
refreshKeyboardMovement()
elseif a==keySpace then
jumpingInput=false
end
end))

local thumbstickEndX=0
local thumbstickStartY=0

local thumbstickSizeMultiplier=0

local jumpStartX=0
local jumpStartY=0
local jumpEndX=0
local jumpEndY=0

local thumbstickInputObject=nil
local jumpInputObject=nil
local cameraRotateInputObject=nil
local cameraZoomInputObject=nil

local thumbstickTouchStart=v3_0
local cameraZoomInputMagnitude=0

tinsert(cons,Connect(insGet(uis,"TouchStarted"),function(inputObject)
if insGet(gs,"MenuIsOpen") or GetFocusedTextBox(uis) then
return
end

local touchPos=insGet(inputObject,"Position")
local touchX=v3Get(touchPos,"X")
local touchY=v3Get(touchPos,"Y")

if (not thumbstickInputObject) and touchX<thumbstickEndX and touchY>thumbstickStartY then
thumbstickInputObject=inputObject
thumbstickTouchStart=insGet(inputObject,"Position")
isWalking=false
elseif (not jumpInputObject) and touchY>jumpStartY and touchX>jumpStartX and touchX<jumpEndX and touchY<jumpEndY then
jumpInputObject=inputObject
jumpingInput=true
elseif not cameraRotateInputObject then
cameraRotateInputObject=inputObject
else
cameraZoomInputObject=inputObject
cameraZoomInputMagnitude=vmagnitude(insGet(cameraRotateInputObject,"Position")-insGet(cameraZoomInputObject,"Position"))
end
end))
tinsert(cons,Connect(insGet(uis,"TouchMoved"),function(inputObject)
local touchPos=insGet(inputObject,"Position")
local touchX=v3Get(touchPos,"X")
local touchY=v3Get(touchPos,"Y")
if inputObject==thumbstickInputObject then
local direction=insGet(inputObject,"Position")-thumbstickTouchStart
local directionMag=vmagnitude(direction)/thumbstickSizeMultiplier
if directionMag>0.05 then
isWalking=true
direction=vnormalize(direction)*min(1,(directionMag-0.05)/0.95) 
FWmovement=-v3Get(direction,"Y")
RTmovement=v3Get(direction,"X")
else
isWalking=false
end
elseif inputObject==jumpInputObject then
jumpingInput=touchY>jumpStartY and touchX>jumpStartX and touchX<jumpEndX and touchY<jumpEndY
else
if cameraZoomInputObject then
local newMagnitude=vmagnitude(insGet(cameraRotateInputObject,"Position")-insGet(cameraZoomInputObject,"Position"))
cammag=cammag+(newMagnitude-cameraZoomInputMagnitude)*0.04*(0.75-cammag/4)
cameraZoomInputMagnitude=newMagnitude
if cammag<0 then
firstperson=false
else
cammag=0
firstperson=true
end
elseif inputObject==cameraRotateInputObject then
local rotation=GetMouseDelta(uis)
camrotX=clamp(v2Get(rotation,"Y")*mradN05+camrotX,npi2,pi2)
camrotY=v2Get(rotation,"X")*mradN05+camrotY
camrot=angles(camrotX,camrotY,0,enumYXZ)
camcfLV=cfGet(camrot,"LookVector")
camcfRV=cfGet(camrot,"RightVector")
end
end
end))
tinsert(cons,Connect(insGet(uis,"TouchEnded"),function(inputObject)
if inputObject==thumbstickInputObject then
thumbstickInputObject=nil
isWalking=false
elseif inputObject==jumpInputObject then
jumpInputObject=nil
jumpingInput=false
elseif inputObject==cameraRotateInputObject then
cameraRotateInputObject=nil
cameraZoomInputObject=nil
elseif inputObject==cameraZoomInputObject then
cameraZoomInputObject=nil
end
end))

local refreshTouchRegions=function()
local sX=insGet(mouse,"ViewSizeX")
local sY=insGet(mouse,"ViewSizeY")
local isSmallScreen=min(sX,sY)<=500

sY=sY+insGet(gs,"TopbarInset").Height

thumbstickEndX=sX*0.4
thumbstickStartY=(sY+0)*0.333

if isSmallScreen then
thumbstickSizeMultiplier=35
jumpStartX=sX-95
jumpStartY=sY-90
jumpEndX=jumpStartX+70
jumpEndY=jumpStartY+70
else
thumbstickSizeMultiplier=60
jumpStartX=sX-170
jumpStartY=sY-210
jumpEndX=jumpStartX+120
jumpEndY=jumpStartY+120
end
end
tinsert(cons,Connect(GetPropertyChangedSignal(mouse,"ViewSizeX"),refreshTouchRegions))
tinsert(cons,Connect(GetPropertyChangedSignal(mouse,"ViewSizeY"),refreshTouchRegions))
tinsert(cons,Connect(GetPropertyChangedSignal(gs,"TopbarInset"),refreshTouchRegions))
refreshTouchRegions()

local mouseCameraMove=false
tinsert(cons,Connect(insGet(uis,"InputChanged"),function(a,b)
if b then return end
local inputType=insGet(a,"UserInputType")
if mouseCameraMove and inputType==enumMM then
local rotation=GetMouseDelta(uis)
camrotX=clamp(v2Get(rotation,"Y")*mradN05+camrotX,npi2,pi2)
camrotY=v2Get(rotation,"X")*mradN05+camrotY
camrot=angles(camrotX,camrotY,0,enumYXZ)
camcfLV=cfGet(camrot,"LookVector")
camcfRV=cfGet(camrot,"RightVector")
elseif inputType==enumMW then
cammag=cammag+v3Get(insGet(a,"Position"),"Z")*(0.75-cammag/4)
if cammag<0 then
firstperson=false
else
cammag=0
firstperson=true
end
end
end))

local predictionfling=function(target)
if typeof(target)~="Instance" then 
target=insGet(mouse,"Target")
if not target then
return false
end
end
if not IsDescendantOf(target,ws) then
return false
end
if IsA(target,"BasePart") or IsA(target,"Humanoid") then 
target=insGet(target,"Parent") 
if IsA(target,"Accessory") then
target=insGet(target,"Parent")
end
end
if (not IsA(target,"Model")) or (target==c) then
return false
end
local targetpart=QueryDescendants(target,">BasePart#HumanoidRootPart")[1] or QueryDescendants(target,">BasePart#Torso")[1] or QueryDescendants(target,">BasePart#UpperTorso")[1]
if (not targetpart) or (flingtable[targetpart]~=nil) then
return false
end
if permadeath then
--replicatesignal(cdsb)
end
if highlightflingtargets then
local h=i("Highlight")
insSet(h,"Name",rs())
insSet(h,"Adornee",target)
insSet(h,"OutlineColor",c3(1,0,0))
insSet(h,"Parent",i10)
flingtable[targetpart]=h
else
flingtable[targetpart]=false
end
return true
end

if ctrlclicktp then
ctrlclicktp=KeyCode.LeftControl
local tpoff=v3_010*3
if clickfling then
tinsert(cons,Connect(insGet(mouse,"Button1Down"),function()
if insGet(mouse,"Target") then
if IsKeyDown(uis,ctrlclicktp) then
pos=cfGet(insGet(mouse,"Hit"),"Position")+tpoff
cfr=cfl(pos,pos+camcfLV*v3_101)
xzvel=v3_0
Yvel=0
else
predictionfling()
end
end
end))
else
tinsert(cons,Connect(insGet(mouse,"Button1Down"),function()
if insGet(mouse,"Target") and IsKeyDown(uis,ctrlclicktp) then
pos=cfGet(insGet(mouse,"Hit"),"Position")+tpoff
cfr=cfl(pos,pos+camcfLV*v3_101)
xzvel=v3_0
Yvel=0
end
end))
end
elseif clickfling then
tinsert(cons,Connect(insGet(mouse,"Button1Down"),predictionfling))
end
if Preload then
if replicatesignal then
tspawn(function()
local lastc=nil
local hdied=function()
if not c then
--replicatesignal(cdsb)
pdloadedtime=osclock()+rst
end
end
Connect(GetPropertyChangedSignal(lp,"Character"),function()
local c=lp.Character
if c and c~=lastc then
lastc=c
--replicatesignal(cdsb)
pdloadedtime=osclock()+rst
while lastc==c do
local h=FindFirstChildOfClass(c,"Humanoid")
if h then
Connect(insGet(h,"Died"),hdied)
for _,x in lp.Character:GetChildren() do 
if x:IsA("Accessory") then 
local h=x.Handle 
if h:FindFirstChild("AccessoryWeld") then 
h.AccessoryWeld:Destroy()
end
end
end
for _,x in lp.Character:GetChildren() do 
if x:IsA("BasePart") then 
local h=x 
if h:FindFirstChild("HeadWeld") then 
h.HeadWeld:Destroy()
end
end
end
break
end
Wait(preanimation)
end
end
end)
end)
else 
notify("No ReplicateSignal")
Preload=false
end
--replicatesignal(cdsb)
end









local noYvelTime=1
local lastsine=sine
local mainFunction=function()

if not c then 
for i,v in next,cframes do
local p=i.v
if p then
Destroy(p)
end
end
for i,v in next,flingtable do
if v then --it could be false
Destroy(v)
end
end
for i,v in next,charcons do
Disconnect(v)
end
if clickConnection then
Disconnect(clickConnection)
end
mouseBehavior=nil
insSet(uis,"MouseBehavior",enumMD)
onnewcamera()
local c=insGet(lp,"Character")
if c then
insSet(cam,"CameraSubject",FindFirstChildOfClass(c,"Humanoid"))
end
return con and Disconnect(con) 
end
sine=osclock()
local delta=sine-lastsine
deltaTime=min(delta*10,1)
lastsine=sine
if shiftlock then
if allowshiftlock then
mouseBehavior=enumMLC
mouseCameraMove=true
else
shiftlock=false
end
elseif firstperson then
mouseBehavior=enumMLC
mouseCameraMove=true
elseif IsMouseButtonPressed(uis,enumMB2) then
mouseBehavior=enumMLCP
mouseCameraMove=true
else
mouseBehavior=enumMD
mouseCameraMove=false
end
if lastMouseBehavior~=mouseBehavior then
lastMouseBehavior=mouseBehavior
insSet(uis,"MouseBehavior",mouseBehavior)
end
local raycastresult=Raycast(ws,pos,v3_010*(fpdh-v3Get(pos,"Y")),raycastparams)
local onground=nil
if raycastresult then
raycastresult=v3Get(raycastresult.Position,"Y")
onground=v3Get(pos,"Y")-raycastresult<hhOff1
if onground then
Yvel=0
pos=pos+v3_010*(raycastresult+hhOff-v3Get(pos,"Y"))*min(delta*20,1)
if jumpingInput and (jumpPower>0) then
Yvel=jumpPower
onground=false
end
else
Yvel=Yvel-gravity*delta
if v3Get(pos,"Y")+Yvel*delta<raycastresult then
Yvel=0
pos=pos+v3_010*(raycastresult+hhOff-v3Get(pos,"Y"))
end
end
else
Yvel=0
onground=false
end
if firstperson then
if isWalking then
if walkSpeed==0 then
xzvel=v3_0
if onground then
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsIdle()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-22.5 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
else
xzvel=vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
if onground then
pos=pos+xzvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsWalk()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+(xzvel+v3_010*Yvel)*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+(xzvel+v3_010*Yvel)*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
end
else
xzvel=v3_0
if onground then
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsIdle()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
end
elseif shiftlock then
if isWalking then
if walkSpeed==0 then
xzvel=v3_0
if onground then
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsIdle()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
else
xzvel=vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
if onground then
pos=pos+xzvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsWalk()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+(xzvel+v3_010*Yvel)*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+(xzvel+v3_010*Yvel)*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
end
else
xzvel=v3_0
if onground then
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsIdle()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+v3_010*Yvel*delta
cfr=cfl(pos,pos+camcfLV*v3_101)
camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
end
else
if isWalking then
if walkSpeed==0 then
xzvel=v3_0
if onground then
cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsIdle()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+v3_010*Yvel*delta
cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+v3_010*Yvel*delta
cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
else
xzvel=vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
if onground then
pos=pos+xzvel*delta
cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsWalk()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+(xzvel+(v3_010*Yvel))*delta
cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+(xzvel+(v3_010*Yvel))*delta
cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
end
else
xzvel=v3_0
if onground then
cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsIdle()
Falling=false
Jumping=false
noYvelTime=min(noYvelTime+delta*0.3,1)
xzvel=xzvel*(1-noYvelTime)
elseif Yvel>0 then
pos=pos+v3_010*Yvel*delta
cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsJump()
Falling=false
Jumping=true
noYvelTime=0
elseif Yvel<-12.5 then
pos=pos+v3_010*Yvel*delta
cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
cframes[rootpart]=cfr
insSet(cam,"CFrame",cfMul(camcf,camcfOff))
lerpsFall()
Falling=true
Jumping=false
noYvelTime=0
end
end
end
refreshjointsI(rootpart)
tclear(refreshedjoints)
local sine15=sine*15
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
local idleoff=idlerv*0.003910064697265625 --0.0156402587890625/4
local claimpos=insGet(primarypart,"Position")
local claimposY=v3Get(claimpos,"Y")

for i,v in next,cframes do
local part=i.p
if part and not IsHatDropped then
if insGet(part,"ReceiveAge")==0 then
local placeholder=i.v
local vpos=cfGet(v,"Position")
if novoid and (v3Get(vpos,"Y")<novoid) then
v=cfAdd(v,v3_010*(novoid-v3Get(vpos,"Y")))
end
local lastpos=i.l
local vel=(vpos-lastpos)/delta
local mag=vmagnitude(vel)
if mag<0.11730194091796875 then --0.0156402587890625*15/2
if placeholder and i.b then
insSet(placeholder,"Parent",nil)
i.b=false
end
i.l=cfGet(v,"Position")
v=cfAdd(v,idleoff)
elseif mag>speedlimit then
if placeholder then
insSet(placeholder,"CFrame",v)
if not i.b then
insSet(placeholder,"Parent",ws)
i.b=true
end
end
vel=vnormalize(vel)*speedlimit
local newpos=lastpos+vel*delta
v=cfAdd(cfGet(v,"Rotation"),newpos)
i.l=newpos
else
if placeholder and i.b then
insSet(placeholder,"Parent",nil)
i.b=false
end
i.l=cfGet(v,"Position")
end
local claimtime=i.c
if claimtime then
if sine-claimtime<retVelTime then
local Ydiff=cfGet(v,"Y")-claimposY
local velY=25.01
local fallingTime=0
while (Ydiff>0) or (velY>0) do
fallingTime=fallingTime+0.025
if fallingTime>0.6 then
break
end
velY=velY-velYdelta
Ydiff=Ydiff+(velY*0.025)
end
insSet(part,"AssemblyLinearVelocity",(claimpos-cfGet(v,"Position"))*v3_101/fallingTime+v3_net)
else
local vel1=vel*noYvelTime+xzvel
if vmagnitude(vel1)>25.01 then
insSet(part,"AssemblyLinearVelocity",vnormalize(vel1)*v3_xzL+v3_net)
else
insSet(part,"AssemblyLinearVelocity",vel1*v3_xz+v3_net)
end
end
else
i.c=sine
local vel1=vel*noYvelTime+xzvel
if vmagnitude(vel1)>25.01 then
insSet(part,"AssemblyLinearVelocity",vnormalize(vel1)*v3_xzL+v3_net)
else
insSet(part,"AssemblyLinearVelocity",vel1*v3_xz+v3_net)
end
end
--if IsHatDropped then return end
insSet(part,"CFrame",v)
insSet(part,"AssemblyAngularVelocity",idlerv)
else
i.c=nil
i.l=insGet(part,"Position")
local placeholder=i.v
if placeholder then
insSet(placeholder,"CFrame",v)
if not i.b then
insSet(placeholder,"Parent",ws)
i.b=true
end
end
end
else
local placeholder=i.v
if placeholder then
insSet(placeholder,"CFrame",v)
if not i.b then
insSet(placeholder,"Parent",ws)
i.b=true
end
end
end
end
setsimrad()
end

sine=osclock()
lastsine=sine
tinsert(cons,Connect(heartbeat,mainFunction))
mainFunction()

local refreshjoints=function() --use this on the main part if u have parts that
refreshjointsI(v) --are connected with each other but arent connected to rootpart
tclear(refreshedjoints)
end

local legcfR=cf(1,-1,0)
local legcfL=cf(-1,-1,0)
local raydir=v3_010*-2
local raycastlegs=function() --this returns 2 values: right leg raycast offset, left leg raycast offset
local rY=Raycast(ws,cfGet(cfMul(cfr,legcfR),"Position"),raydir,raycastparams)
local lY=Raycast(ws,cfGet(cfMul(cfr,legcfL),"Position"),raydir,raycastparams)
if rY then
if lY then
return v3Get(rY.Position,"Y")-(v3Get(pos,"Y")-3),v3Get(lY.Position,"Y")-(v3Get(pos,"Y")-3)
else
return v3Get(rY.Position,"Y")-(v3Get(pos,"Y")-3),0
end
elseif lY then
return 0,v3Get(lY.Position,"Y")-(v3Get(pos,"Y")-3)
else
return 0,0
end
end

local velbycfrvec=function() --this returns 2 values: forward/backwards movement (from -1 to 1), right/left movement (from -1 to 1)
local fw=cfGet(cfr,"LookVector")*xzvel/walkSpeed
local rt=cfGet(cfr,"RightVector")*xzvel/walkSpeed
return v3Get(fw,"X")+v3Get(fw,"Z"),v3Get(rt,"X")+v3Get(rt,"Z")
end

local lastvel=v3_0
local velchg1=v3_0
local velchgbycfrvec=function() --this returns 2 values: forward/backwards velocity change, right/left velocity change
velchg1=velchg1+(lastvel-xzvel) --i recommend setting velchg1 to v3_0 when u start using this function or it will look worse
lastvel=xzvel
velchg1=velchg1-velchg1*(deltaTime/2)
local fw=cfGet(cfr,"LookVector")*velchg1/32
local rt=cfGet(cfr,"RightVector")*velchg1/32
return v3Get(fw,"X")+v3Get(fw,"Z"),v3Get(rt,"X")+v3Get(rt,"Z")
end

local lastYvel=0
local velYchg1=0
local velYchg=function() --this returns Y axis velocity change
velYchg1=clamp(velYchg1+(lastYvel-Yvel),-50,50) --i recommend setting velYchg1 to 0 when u start using this function or it will look worse
lastYvel=Yvel
velYchg1=velYchg1-velYchg1*(deltaTime/2)
return velYchg1
end

local rotToMouse=function(alpha) --this rotates ur character towards your mouse hit position
local pos1=pos*v3_010+cfGet(insGet(mouse,"Hit"),"Position")*v3_101
if pos~=pos1 then --could make nan rotation
cfr=Lerp(cfr,cfl(pos,pos1),alpha or deltaTime)
end
end

local glitchJoint=function(joint,targetGlitchTime,delayFrom,delayTo,radiansFrom,radiansTo) 
if sine>targetGlitchTime then --example usage: local glitchtime=0 addMode("x",{idle=function() glitchtime=glitchJoint(joint,glitchtime,0.2,0.4,-0.1,0.1) end})
radiansFrom=radiansFrom*100
radiansTo=radiansTo*100
joint.C0=cfMul(joint.C0,angles(mrandom(radiansFrom,radiansTo)/100,mrandom(radiansFrom,radiansTo)/100,mrandom(radiansFrom,radiansTo)/100)) 
return sine+mrandom(delayFrom*100,delayTo*100)/100
end
return targetGlitchTime
end

local setWalkSpeed=function(n)
if type(n)~="number" then
n=16
end
walkSpeed=n
end
local setJumpPower=function(n)
if type(n)~="number" then
n=50
end
jumpPower=n
end
local setGravity=function(n)
if type(n)~="number" then
n=196.2
end
gravity=n
end
local setCfr=function(v) --sets character cframe
if typeof(v)=="CFrame" then
local newpos=cfGet(v,"Position")
camcf=cfAdd(camcf,newpos-pos)
insSet(cam,"CFrame",camcf)
cfr=v
pos=newpos
elseif typeof(v)=="Vector3" then
camcf=cfAdd(camcf,v-pos)
insSet(cam,"CFrame",camcf)
cfr=cfAdd(cfGet(cfr,"Rotation"),v)
pos=v
end
end
local getVel=function() --returns character velocity
return xzvel+v3_010*Yvel --important: use only in lerps or it might not work
end
local getCamCF=function() --returns camera cframe
return camcf
end
local isFirstPerson=function() --returns true if user is in first person camera mode
return firstperson
end
local setCamOffset=function(v)
if typeof(v)=="CFrame" then
camcfOff=v
elseif typeof(v)=="Vector3" then
camcfOff=cf(v)
end
end
local IsWalking=function() --returns camera cframe
return isWalking
end
local IsFall=function()
  return Falling
  end
local IsJump=function()
  return Jumping
  end
return {
cframes=cframes,
IsFall=Falling,
IsJump=Jumping,
setCamOffset=setCamOffset,
Yvel=Yvel,
R6parts=R6parts,
joints=joints,
IsWalking=IsWalking,
fling=predictionfling,
predictionfling=predictionfling,
refreshjoints=refreshjoints,
raycastlegs=raycastlegs,
velbycfrvec=velbycfrvec,
velchgbycfrvec=velchgbycfrvec,
velYchg=velYchg,
addmode=addmode,
getPart=getPart,
getPartFromMesh=getPartFromMesh,
getAccWeldFromMesh=getAccWeldFromMesh,
getJoint=getJoint,
getPartJoint=getPartJoint,
rotToMouse=rotToMouse,
glitchJoint=glitchJoint,
setWalkSpeed=setWalkSpeed,
setJumpPower=setJumpPower,
setGravity=setGravity,
setCfr=setCfr,
getVel=getVel,
getCamCF=getCamCF,
isFirstPerson=isFirstPerson,
setHipHeight=setHipHeight
}
end












--// Misc
local reanimate=reanimate
local stopreanimate=stopreanimate
local Running=false
local IsRendering=nil
local IsRendering1=nil
local deltaTime=.5
local GuiOpened=true
local Mode="None"
local ClockTicky=0
local Constant=1
local Constant2=1
local Boost=1

local SpecialAnimRThingy=0
local K=nil
local Token=1
local Seek0=nil
local Seek1=nil
local Seek2=nil
local VFXTables={}
local VFXLoading = false
local VFXPostConn = nil
local ActiveVFX = nil
local IsSitting=false

local LastTick=tick()
Weld=nil
Animate1=nil
Weld1=nil
local Retroify=false
MainWeld=nil
MainWeld1=nil
plr=game.Players.LocalPlayer

if game.SoundService:FindFirstChild("GlitcherAudioPlayer") then
game.SoundService.GlitcherAudioPlayer:Destroy()
end













local olddt=.5
--// Main Script
function MainScript()
clik()
local GuiVisible=true
local BBGVisibilty=false
local OverrideAnimation=false
local AnimStyles=0

--lp.Character["Torso"].Position=v3(0,-50,0)
if Running then print("Already Running.") return end 
Running=true

local t=reanimate()

if type(t)~="table" then  
print("Script Already Running")
return 
end
--// Necessary Variables
local walking=false
local idle=true 
local getPart=t.getPart
local velYchg=t.velYchg 
local Yvel=t.Yvel
local raycastlegs=t.raycastlegs
local velbycfrvec=t.velbycfrvec
local setWalkSpeed=t.setWalkSpeed
local rgb=Color3.fromRGB
local R6parts=t.R6parts
local setCamOffset=t.setCamOffset
local Player=game.Players.LocalPlayer
local getVel=t.getVel
local IsWalking=t.IsWalking
local getJoint=t.getJoint
local setCfr=t.setCfr
local cframes=t.cframes
local joints=t.joints
local refreshjoints=t.refreshjoints
local onnewcamera=t.onnewcamera
local SoundService=game.SoundService
local setHipHeight=t.setHipHeight
local getAccWeldFromMesh=t.getAccWeldFromMesh
local Torso=getPart("Torso")
local New = function(instance,parent,properties)
local LastTimePosition=0
local inst = Instance.new(instance)
inst.Parent = parent
if(properties)then
for i,v in next, properties do
pcall(function() inst[i] = v end)
end
end
return inst;
end

if isfile and not isfile(Name.." Assets/VFX/FeLib.lua") then
writefile(Name.." Assets/VFX/FeLib.lua",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/FeLib.lua?raw=true"))
repeat wait() until isfile(Name.." Assets/VFX/FeLib.lua")
end
local lib=loadstring(readfile(Name.." Assets/VFX/FeLib.lua"))()

local Create=lib.Create

CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			return Part
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};
	
	["Weld"] = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	["Sound"] = {
		Create = function(id, par, vol, pit) 
			task.spawn(function()
				local S = Create("Sound"){
					Volume = vol,
                                        Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end)
		end;
	};

	["TimeSound"] = {
		Create = function(id, par, vol, pit, timepos) 
			task.spawn(function()
				local S = Create("Sound"){
					Volume = vol,
                                        Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
                                        TimePosition = timepos,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end)
		end;
	};
		["EchoSound"] = {
		Create = function(id, par, vol, pit, timepos,delays,echodelay,fedb,dryl) 
			task.spawn(function()
				local Sas = Create("Sound"){
					Volume = vol,
                    Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
                    TimePosition = timepos,
					Parent = par or workspace,
				}
				local E = Create("EchoSoundEffect"){
					Delay = echodelay,
                    Name = "Echo",
					Feedback = fedb,
                    DryLevel = dryl,
					Parent = Sas,
				}
				wait() 
				Sas:play() 
				game:GetService("Debris"):AddItem(Sas, delays)
			end)
		end;
	};

["LongSound"] = {
		Create = function(id, par, vol, pit) 
			task.spawn(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 60)
			end)
		end;
	};
	
	["ParticleEmitter"] = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return fp
		end;
	};

	CreateTemplate = {
	
	};
}

function createBGCircle(size,parent,color)
local bgui = Instance.new("BillboardGui",parent)
bgui.Size = UDim2.new(size, 0, size, 0)
local imgc = Instance.new("ImageLabel",bgui)
imgc.BackgroundTransparency = 1
imgc.ImageTransparency = 0
imgc.Size = UDim2.new(1,0,1,0)
imgc.Image = "rbxassetid://997291547" --997291547,521073910
imgc.ImageColor3 = color
return bgui,imgc
end

function symbolizeBlink(guipar,size,img,color,bonussize,vol,pit,soundid,spar,rotationenabled,rotsp,delay)
local bgui,imgc = createBGCircle(size,guipar,color)
bgui.AlwaysOnTop = true
imgc.Image = "rbxassetid://" ..img
local rrot = math.random(1,2)
CFuncs["Sound"].Create("rbxassetid://" ..soundid, spar, vol,pit)
task.spawn(function()
for i = 0, 24*delay do
oswait()
if rotationenabled == true then
if rrot == 1 then
imgc.Rotation = imgc.Rotation + rotsp
elseif rrot == 2 then
imgc.Rotation = imgc.Rotation - rotsp
end
end
bgui.Size = bgui.Size + UDim2.new(1*bonussize/delay,0,1*bonussize/delay,0)
imgc.ImageTransparency = imgc.ImageTransparency + 0.04/delay
end
bgui:Destroy()
end)
end









local rootpart,torso,head,rightarm,leftarm,rightleg,leftleg,rootpart1,fakecharmodel,humanoid=i("Part"),i("Part"),i("Part"),i("Part"),i("Part"),i("Part"),i("Part"),i("Part"),i("Model"),i("Humanoid")
local scriptfolder1=i("Folder",ws)
scriptfolder1.Name="MainScript"
scriptfolder1:SetAttribute("VFX",true)
local scriptfolder=i("Folder",scriptfolder1)
scriptfolder.Name=rs()
scriptfolder:SetAttribute("VFX",true)
local extrasfolder=i("Folder",scriptfolder1)
extrasfolder.Name="Misc"
local camoff=i("CFrameValue",extrasfolder)
camoff.Name="CamOffset"
local pcolor,scolor,modelabel,numvalconstant,numval=i("Color3Value",extrasfolder),i("Color3Value",extrasfolder),i("StringValue",extrasfolder),i("NumberValue",extrasfolder),i("NumberValue",extrasfolder)
pcolor.Name="PrimaryColor"
scolor.Name="SecondaryColor"
modelabel.Name="ModeName"
fakecharmodel.Parent=scriptfolder1
fakecharmodel.Name="FakeChar"
local pl=i("PointLight",torso)
pl.Name="BodyLight"
pl.Range=7.5
pl.Brightness=10
insSet(rootpart,"Size",v3(2,2,1))
insSet(rootpart,"CanCollide",false)
insSet(rootpart,"CastShadow",false)
insSet(rootpart,"CanTouch",false)
insSet(rootpart,"CanQuery",false)
insSet(rootpart,"Anchored",true)
insSet(rootpart,"Name",rs())
insSet(rootpart,"Transparency",1)
insSet(rootpart,"Parent",fakecharmodel)

--insSet(humanoid,"LeftLeg",leftleg)
--insSet(humanoid,"RightArm",rightarm)
insSet(humanoid,"Parent",fakecharmodel)

insSet(fakecharmodel,"PrimaryPart",rootpart)

insSet(rootpart1,"Size",v3(2,2,1))
insSet(rootpart1,"CanCollide",false)
insSet(rootpart1,"CastShadow",false)
insSet(rootpart1,"CanTouch",false)
insSet(rootpart1,"CanQuery",false)
insSet(rootpart1,"Anchored",true)
insSet(rootpart1,"Name","Floor")
insSet(rootpart1,"Transparency",1)
insSet(rootpart1,"Parent",fakecharmodel)

insSet(torso,"Size",v3(2,2,1))
insSet(torso,"CanCollide",false)
insSet(torso,"CastShadow",false)
insSet(torso,"CanTouch",false)
insSet(torso,"CanQuery",false)
insSet(torso,"Anchored",true)
insSet(torso,"Name",rs())
insSet(torso,"Transparency",1)
insSet(torso,"Parent",fakecharmodel)

insSet(head,"Size",v3(2,1,1))
insSet(head,"CanCollide",false)
insSet(head,"CastShadow",false)
insSet(head,"CanTouch",false)
insSet(head,"CanQuery",false)
insSet(head,"Anchored",true)
insSet(head,"Name",rs())
insSet(head,"Transparency",1)
insSet(head,"Parent",fakecharmodel)

insSet(rightarm,"Size",v3(1,2,1))
insSet(rightarm,"CanCollide",false)
insSet(rightarm,"CastShadow",false)
insSet(rightarm,"CanTouch",false)
insSet(rightarm,"CanQuery",false)
insSet(rightarm,"Anchored",true)
insSet(rightarm,"Name",rs())
insSet(rightarm,"Transparency",1)
insSet(rightarm,"Parent",fakecharmodel)

insSet(leftarm,"Size",v3(1,2,1))
insSet(leftarm,"CanCollide",false)
insSet(leftarm,"CastShadow",false)
insSet(leftarm,"CanTouch",false)
insSet(leftarm,"CanQuery",false)
insSet(leftarm,"Anchored",true)
insSet(leftarm,"Name",rs())
insSet(leftarm,"Transparency",1)
insSet(leftarm,"Parent",fakecharmodel)

insSet(rightleg,"Size",v3(1,2,1))
insSet(rightleg,"CanCollide",false)
insSet(rightleg,"CastShadow",false)
insSet(rightleg,"CanTouch",false)
insSet(rightleg,"CanQuery",false)
insSet(rightleg,"Anchored",true)
insSet(rightleg,"Name",rs())
insSet(rightleg,"Transparency",1)
insSet(rightleg,"Parent",fakecharmodel)

insSet(leftleg,"Size",v3(1,2,1))
insSet(leftleg,"CanCollide",false)
insSet(leftleg,"CastShadow",false)
insSet(leftleg,"CanTouch",false)
insSet(leftleg,"CanQuery",false)
insSet(leftleg,"Anchored",true)
insSet(leftleg,"Name",rs())
insSet(leftleg,"Transparency",1)
insSet(leftleg,"Parent",fakecharmodel)



local wingPart1={}
local wingPart2={}
local wingPart3={}
local wingPart4={}

local Extra_Part1={C0=cf(0,-1,0+0)*angles(3.141592653589793+0,0,-3.141592653589793+0),C1=cf_0,Part0=wingPart1,Part1=Torso}
local Extra_Part2={C0=cf(0,-1,0+0)*angles(3.141592653589793+0,0,-3.141592653589793+0),C1=cf_0,Part0=wingPart2,Part1=Torso}
local Extra_Part3={C0=cf_0,C1=cf_0,Part0=wingPart3,Part1=Torso}
local Extra_Part4={C0=cf_0,C1=cf_0,Part0=wingPart4,Part1=Torso}

cframes[wingPart1]=cf(0,-1,0+0)*angles(3.141592653589793+0,0,-3.141592653589793+0)
cframes[wingPart2]=cf(0,-1,0+0)*angles(3.141592653589793+0,0,-3.141592653589793+0)
cframes[wingPart3]=cf_0
cframes[wingPart4]=cf_0

tinsert(joints,Extra_Part1)
tinsert(joints,Extra_Part2)
tinsert(joints,Extra_Part3)
tinsert(joints,Extra_Part4)
--tinsert(joints,Wing5)
local Ring=getAccWeldFromMesh("103250068835965", "85418748473290")
Ring.Part1=wingPart1
Ring.C0=angles(3.141592653589793+0,0,-3.141592653589793+0)
local Ring1=getAccWeldFromMesh("132280799439271", "94508623390669")
Ring1.Part1=wingPart2
Ring1.C0=angles(3.141592653589793+0,0,-3.141592653589793+0)
function AttachSword(Sword,Attachto,C0)
local p=Sword
p.Part1=Attachto
p.C1=cf_0
tspawn(function()
C0()
end)
end





--// Main Swords
local getPartFromMesh=t.getPartFromMesh
local getPartJoint=t.getPartJoint

local sword=getPartFromMesh(5254583415, 5268538095)
local s1_1=sword and getPartJoint(sword) or {C0=cf_0} -- VoidLord Sword
local sword2=getPartFromMesh(5278721954, 5316471565) or getPartFromMesh(5278721954, 5692006383)
local s1_2=sword2 and getPartJoint(sword2) or {C0=cf_0} -- Aurora Sword or Halloween Sword
local sword3=getPartFromMesh(5278721954, 5316510551)
local s1_3=sword3 and getPartJoint(sword3) or {C0=cf_0} -- Rainbow Sword
local sword4=getPartFromMesh(5278721954, 5278777022)
local s1_4=sword4 and getPartJoint(sword4) or {C0=cf_0} -- Demon God Sword

local SWAtt1=getAccWeldFromMesh("5254583415", "5268538095") -- VoidLordSword
local SWAtt2=getAccWeldFromMesh("5278721954", "5316471565") or getAccWeldFromMesh("5278721954", "5692006383") -- Aurora Sword or Halloween Sword
local SWAtt3=getAccWeldFromMesh("5278721954", "5316510551") -- RainbowGodSword
local SWAtt4=getAccWeldFromMesh("5278721954", "5278777022") -- DemonGodSword

local setclientparts=function()
pcall(function()
workspace.CurrentCamera.CameraSubject=humanoid
--lp.Character.Humanoid.Parent=humanoid
end)
local rootcf=cframes[R6parts.root]
local torsocf=cframes[R6parts.torso]
local headcf=cframes[R6parts.head]
local rightarmcf=cframes[R6parts.rightArm]
local leftarmcf=cframes[R6parts.leftArm]
local rightlegcf=cframes[R6parts.rightLeg]
local leftlegcf=cframes[R6parts.leftLeg]
local char=lp.Character
--[[task.spawn(function()
if not char:FindFirstChild("AuroraSword") or not char:FindFirstChild("DemonGodSword") or not char:FindFirstChild("RainbowGodSword") or not char:FindFirstChild("VoidLordSword") then 
pcall(function()
local Torso=char["Torso"]
local DemonGodSword_89=i("Accessory", char)
DemonGodSword_89.Name="DemonGodSword"
DemonGodSword_89:SetAttribute("assetid", "35333136343739363431")



local Handle_90=i("Part", DemonGodSword_89)
Handle_90.Name="Handle"
Handle_90.Anchored=false
Handle_90.CanCollide=false
Handle_90.CanQuery=true
Handle_90.CanTouch=true
Handle_90.Transparency=0
Handle_90.Reflectance=0
Handle_90.Color=c3(0.639216,0.635294,0.647059)
Handle_90.Material=Enum.Material.Plastic
Handle_90.Size=v3(1.000000,1.000000,1.000000)
Handle_90.CastShadow=true
Handle_90.Massless=false



local SpecialMesh_91=i("SpecialMesh", Handle_90)
SpecialMesh_91.Name="SpecialMesh"
SpecialMesh_91.MeshType=Enum.MeshType.FileMesh
SpecialMesh_91.MeshId="rbxassetid://5278721954"
SpecialMesh_91.TextureId="http://www.roblox.com/asset/?id=5278777022"
SpecialMesh_91.Scale=v3(1.000000,1.000000,1.000000)
SpecialMesh_91.Offset=v3(0.000000,0.000000,0.000000)
SpecialMesh_91.VertexColor=v3(1.000000,1.000000,1.000000)



local AvatarPartScaleType_92=i("StringValue", Handle_90)
AvatarPartScaleType_92.Name="AvatarPartScaleType"



local BodyBackAttachment_93=i("Attachment", Handle_90)
BodyBackAttachment_93.Name="BodyBackAttachment"
BodyBackAttachment_93.Visible=false
BodyBackAttachment_93.CFrame=cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227,0,0,1,0,1,-0,-1,0,0)



local OriginalSize_94=i("Vector3Value", Handle_90)
OriginalSize_94.Name="OriginalSize"



local AccessoryWeld_95=i("Weld", Handle_90)
AccessoryWeld_95.Name="AccessoryWeld"
AccessoryWeld_95.Enabled=true
AccessoryWeld_95.C0=cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227,0,0,1,0,1,-0,-1,0,0)
AccessoryWeld_95.C1=cf(0,0,0.5,1,0,0,0,1,0,0,0,1)
AccessoryWeld_95.Part0=Handle_90
AccessoryWeld_95.Part1=Torso



local RainbowGodSword_96=i("Accessory", char)
RainbowGodSword_96.Name="RainbowGodSword"
RainbowGodSword_96:SetAttribute("assetid", "35333136353339343231")



local Handle_97=i("Part", RainbowGodSword_96)
Handle_97.Name="Handle"
Handle_97.Anchored=false
Handle_97.CanCollide=false
Handle_97.CanQuery=true
Handle_97.CanTouch=true
Handle_97.Transparency=0
Handle_97.Reflectance=0
Handle_97.Color=c3(0.639216,0.635294,0.647059)
Handle_97.Material=Enum.Material.Plastic
Handle_97.Size=v3(1.000000,1.000000,1.000000)
Handle_97.CastShadow=true
Handle_97.Massless=false



local SpecialMesh_98=i("SpecialMesh", Handle_97)
SpecialMesh_98.Name="SpecialMesh"
SpecialMesh_98.MeshType=Enum.MeshType.FileMesh
SpecialMesh_98.MeshId="rbxassetid://5278721954"
SpecialMesh_98.TextureId="http://www.roblox.com/asset/?id=5316510551"
SpecialMesh_98.Scale=v3(1.000000,1.000000,1.000000)
SpecialMesh_98.Offset=v3(0.000000,0.000000,0.000000)
SpecialMesh_98.VertexColor=v3(1.000000,1.000000,1.000000)



local AvatarPartScaleType_99=i("StringValue", Handle_97)
AvatarPartScaleType_99.Name="AvatarPartScaleType"



local BodyBackAttachment_100=i("Attachment", Handle_97)
BodyBackAttachment_100.Name="BodyBackAttachment"
BodyBackAttachment_100.Visible=false
BodyBackAttachment_100.CFrame=cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227,0,0,1,0,1,-0,-1,0,0)



local OriginalSize_101=i("Vector3Value", Handle_97)
OriginalSize_101.Name="OriginalSize"



local AccessoryWeld_102=i("Weld", Handle_97)
AccessoryWeld_102.Name="AccessoryWeld"
AccessoryWeld_102.Enabled=true
AccessoryWeld_102.C0=cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227,0,0,1,0,1,-0,-1,0,0)
AccessoryWeld_102.C1=cf(0,0,0.5,1,0,0,0,1,0,0,0,1)
AccessoryWeld_102.Part0=Handle_97
AccessoryWeld_102.Part1=Torso



local VoidLordSword_103=i("Accessory", char)
VoidLordSword_103.Name="VoidLordSword"
VoidLordSword_103:SetAttribute("assetid", "35323638363032323037")



local Handle_104=i("Part", VoidLordSword_103)
Handle_104.Name="Handle"
Handle_104.Anchored=false
Handle_104.CanCollide=false
Handle_104.CanQuery=true
Handle_104.CanTouch=true
Handle_104.Transparency=0
Handle_104.Reflectance=0
Handle_104.Color=c3(0.639216,0.635294,0.647059)
Handle_104.Material=Enum.Material.Plastic
Handle_104.Size=v3(1.000000,5.000000,5.000000)
Handle_104.CastShadow=true
Handle_104.Massless=false



local SpecialMesh_105=i("SpecialMesh", Handle_104)
SpecialMesh_105.Name="SpecialMesh"
SpecialMesh_105.MeshType=Enum.MeshType.FileMesh
SpecialMesh_105.MeshId="rbxassetid://5254583415"
SpecialMesh_105.TextureId="http://www.roblox.com/asset/?id=5268538095"
SpecialMesh_105.Scale=v3(1.000000,1.000000,1.000000)
SpecialMesh_105.Offset=v3(0.000000,0.000000,0.000000)
SpecialMesh_105.VertexColor=v3(1.000000,1.000000,1.000000)



local AvatarPartScaleType_106=i("StringValue", Handle_104)
AvatarPartScaleType_106.Name="AvatarPartScaleType"



local BodyBackAttachment_107=i("Attachment", Handle_104)
BodyBackAttachment_107.Name="BodyBackAttachment"
BodyBackAttachment_107.Visible=false
BodyBackAttachment_107.CFrame=cf(-0.12439757585525513,0.06162172555923462,0.38154950737953186,0,0,1,0,1,-0,-1,0,0)



local OriginalSize_108=i("Vector3Value", Handle_104)
OriginalSize_108.Name="OriginalSize"



local AccessoryWeld_109=i("Weld", Handle_104)
AccessoryWeld_109.Name="AccessoryWeld"
AccessoryWeld_109.Enabled=true
AccessoryWeld_109.C0=cf(-0.12439757585525513,0.06162172555923462,0.38154950737953186,0,0,1,0,1,-0,-1,0,0)
AccessoryWeld_109.C1=cf(0,0,0.5,1,0,0,0,1,0,0,0,1)
AccessoryWeld_109.Part0=Handle_104
AccessoryWeld_109.Part1=Torso



local AuroraSword_110=i("Accessory", char)
AuroraSword_110.Name="AuroraSword"
AuroraSword_110:SetAttribute("assetid", "35333136353439373535")



local Handle_111=i("Part", AuroraSword_110)
Handle_111.Name="Handle"
Handle_111.Anchored=false
Handle_111.CanCollide=false
Handle_111.CanQuery=true
Handle_111.CanTouch=true
Handle_111.Transparency=0
Handle_111.Reflectance=0
Handle_111.Color=c3(0.639216,0.635294,0.647059)
Handle_111.Material=Enum.Material.Plastic
Handle_111.Size=v3(1.000000,1.000000,1.000000)
Handle_111.CastShadow=true
Handle_111.Massless=false



local SpecialMesh_112=i("SpecialMesh", Handle_111)
SpecialMesh_112.Name="SpecialMesh"
SpecialMesh_112.MeshType=Enum.MeshType.FileMesh
SpecialMesh_112.MeshId="rbxassetid://5278721954"
SpecialMesh_112.TextureId="http://www.roblox.com/asset/?id=5316471565"
SpecialMesh_112.Scale=v3(1.000000,1.000000,1.000000)
SpecialMesh_112.Offset=v3(0.000000,0.000000,0.000000)
SpecialMesh_112.VertexColor=v3(1.000000,1.000000,1.000000)



local AvatarPartScaleType_113=i("StringValue", Handle_111)
AvatarPartScaleType_113.Name="AvatarPartScaleType"



local BodyBackAttachment_114=i("Attachment", Handle_111)
BodyBackAttachment_114.Name="BodyBackAttachment"
BodyBackAttachment_114.Visible=false
BodyBackAttachment_114.CFrame=cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227,0,0,1,0,1,-0,-1,0,0)



local OriginalSize_115=i("Vector3Value", Handle_111)
OriginalSize_115.Name="OriginalSize"



local AccessoryWeld_116=i("Weld", Handle_111)
AccessoryWeld_116.Name="AccessoryWeld"
AccessoryWeld_116.Enabled=true
AccessoryWeld_116.C0=cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227,0,0,1,0,1,-0,-1,0,0)
AccessoryWeld_116.C1=cf(0,0,0.5,1,0,0,0,1,0,0,0,1)
AccessoryWeld_116.Part0=Handle_111
AccessoryWeld_116.Part1=Torso
end)
end 
end)]]
insSet(rootpart,"CFrame",rootcf)
insSet(torso,"CFrame",torsocf)
insSet(head,"CFrame",headcf)
insSet(rightarm,"CFrame",rightarmcf)
insSet(leftarm,"CFrame",leftarmcf)
insSet(rightleg,"CFrame",rightlegcf)
insSet(leftleg,"CFrame",leftlegcf)

if UsePlayerBody then
pcall(function()
local char=lp.Character
local LeftLeg=char["Left Leg"]
local LeftArm=char["Left Arm"]
local Head=char["Head"]
local Torso=char["Torso"]
local RightLeg=char["Right Leg"]
local Root=char["HumanoidRootPart"]
local RightArm=char["Right Arm"]
local sine=os.clock()
local sine15=sine*15
local sin=math.sin 
local v3=Vector3.new
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
if Root then
insSet(Root,"CFrame",rootpart.CFrame)
insSet(Root,"AssemblyAngularVelocity",idlerv)
insSet(Root,"AssemblyLinearVelocity",v3(0,25.01,0))
end
if Torso then
insSet(Torso,"CFrame",torso.CFrame)
insSet(Torso,"AssemblyAngularVelocity",idlerv)
insSet(Torso,"AssemblyLinearVelocity",v3(0,25.01,0))
end
if Head then 
insSet(Head,"CFrame",head.CFrame)
insSet(Head,"AssemblyAngularVelocity",idlerv)
insSet(Head,"AssemblyLinearVelocity",v3(0,25.01,0))
end
if RightArm then
insSet(RightArm,"CFrame",rightarm.CFrame)
insSet(RightArm,"AssemblyAngularVelocity",idlerv)
insSet(RightArm,"AssemblyLinearVelocity",v3(0,25.01,0))
end
if LeftArm then 
insSet(LeftArm,"CFrame",leftarm.CFrame)
insSet(LeftArm,"AssemblyAngularVelocity",idlerv)
insSet(LeftArm,"AssemblyLinearVelocity",v3(0,25.01,0))
end 
if RightLeg then
insSet(RightLeg,"CFrame",rightleg.CFrame)
insSet(RightLeg,"AssemblyAngularVelocity",idlerv)
insSet(RightLeg,"AssemblyLinearVelocity",v3(0,25.01,0))
end
if LeftLeg then
insSet(LeftLeg,"CFrame",leftleg.CFrame)
insSet(LeftLeg,"AssemblyAngularVelocity",idlerv)
insSet(LeftLeg,"AssemblyLinearVelocity",v3(0,25.01,0))
end
end)
end
end






if game.SoundService:FindFirstChild("GlitcherAudioPlayer") then
game.SoundService.GlitcherAudioPlayer:Destroy()
end

--// Init UI
local basgui=Instance.new("GuiMain",plrgui)
basgui.Name="MainGui"
basgui.ClipToDeviceSafeArea=false
basgui.ScreenInsets="None"
local FSCREEN=Instance.new("Frame")
FSCREEN.Parent=basgui
FSCREEN.BackgroundColor3=Color3.new(255, 255, 255)


FSCREEN.BackgroundTransparency=1
FSCREEN.ZIndex=-60
FSCREEN.BorderColor3=Color3.new(17, 17, 17)
FSCREEN.Size=UDim2.new(0, basgui.AbsoluteSize.X, 0, basgui.AbsoluteSize.Y)
FSCREEN.Position=UDim2.new(0, 0, 0, 0)




--// Interface 
local AnarchyMainUI={};

AnarchyMainUI["Main Interface_1"] = Instance.new("Frame", FSCREEN)
local f1=AnarchyMainUI["Main Interface_1"]
f1.Parent=FSCREEN
f1.BackgroundColor3=Color3.new(255, 255, 255)


f1.BackgroundTransparency=1
f1.ZIndex=-60
f1.BorderColor3=Color3.new(17, 17, 17)
f1.Size=UDim2.new(0, basgui.AbsoluteSize.X, 0, basgui.AbsoluteSize.Y)
f1.Position=UDim2.new(0, 0, 0, 0)


AnarchyMainUI["SC_MusicDurScale_2"] = Instance.new("Frame", AnarchyMainUI["Main Interface_1"]);
AnarchyMainUI["SC_MusicDurScale_2"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_MusicDurScale_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_MusicDurScale_2"]["Size"] = UDim2.new(1, 0, 0.06667, 0);
AnarchyMainUI["SC_MusicDurScale_2"]["Position"] = UDim2.new(0, 0, 0.965, 0);
AnarchyMainUI["SC_MusicDurScale_2"]["Name"] = [[SC_MusicDurScale]];
AnarchyMainUI["SC_MusicDurScale_2"]["BackgroundTransparency"] = 0.5;


AnarchyMainUI["PC_Frame_3"] = Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["PC_Frame_3"]["BorderSizePixel"] = 1;
AnarchyMainUI["PC_Frame_3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
AnarchyMainUI["PC_Frame_3"]["Size"] = UDim2.new(0.10256, 0, 1, 0);
AnarchyMainUI["PC_Frame_3"]["Position"] = UDim2.new(0, 0, -1, 0);
AnarchyMainUI["PC_Frame_3"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_Frame_3"]["Name"] = [[PC_Frame]];


AnarchyMainUI["SC_TextLabel_4"] = Instance.new("TextLabel", AnarchyMainUI["PC_Frame_3"]);
AnarchyMainUI["SC_TextLabel_4"]["TextWrapped"] = true;
AnarchyMainUI["SC_TextLabel_4"]["TextStrokeTransparency"] = 0;
AnarchyMainUI["SC_TextLabel_4"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_TextLabel_4"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_TextLabel_4"]["TextScaled"] = true;
AnarchyMainUI["SC_TextLabel_4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_TextLabel_4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
AnarchyMainUI["SC_TextLabel_4"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_TextLabel_4"]["Size"] = UDim2.new(0.7, 0, 0.83333, 0);
AnarchyMainUI["SC_TextLabel_4"]["Text"] = [[00:00]];
AnarchyMainUI["SC_TextLabel_4"]["Name"] = [[SC_TextLabel]];
AnarchyMainUI["SC_TextLabel_4"]["Position"] = UDim2.new(0.25, 0, 0.1, 0);


AnarchyMainUI["UIStroke_5"] = Instance.new("UIStroke", AnarchyMainUI["PC_Frame_3"]);
AnarchyMainUI["UIStroke_5"]["Color"] = Color3.fromRGB(255, 255, 255);

AnarchyMainUI["PC_UIGradient_6"] = Instance.new("UIGradient", AnarchyMainUI["PC_Frame_3"])
AnarchyMainUI["PC_UIGradient_6"]["Name"] = [[PC_UIGradient]];
AnarchyMainUI["PC_UIGradient_6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.698, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};
AnarchyMainUI["PC_UIGradient_6"]["Transparency"]=NumberSequence.new{NumberSequenceKeypoint.new(0.000, 2.35713),NumberSequenceKeypoint.new(1.000, .5)};
AnarchyMainUI["PC_UIGradient_6"]["Rotation"]=-150;
AnarchyMainUI["PC_UIGradient_6"]["Offset"]=v2(.25,0);

AnarchyMainUI["PC_UIGradient_6"] = Instance.new("UIGradient", AnarchyMainUI["UIStroke_5"]);
AnarchyMainUI["PC_UIGradient_6"]["Name"] = [[PC_UIGradient]];
AnarchyMainUI["PC_UIGradient_6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.698, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};
AnarchyMainUI["PC_UIGradient_6"]["Transparency"]=NumberSequence.new{NumberSequenceKeypoint.new(0.000, 2.35713),NumberSequenceKeypoint.new(1.000, .5)};
AnarchyMainUI["PC_UIGradient_6"]["Rotation"]=-150;
AnarchyMainUI["PC_UIGradient_6"]["Offset"]=v2(.25,0);

AnarchyMainUI["PC_Frame_7"] = Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["PC_Frame_7"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Frame_7"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
AnarchyMainUI["PC_Frame_7"]["Size"] = UDim2.new(0.10256, 0, 1, 0);
AnarchyMainUI["PC_Frame_7"]["Position"] = UDim2.new(0.90256, 0, -1, 0);
AnarchyMainUI["PC_Frame_7"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_Frame_7"]["Name"] = [[PC_Frame]];


AnarchyMainUI["SC_TextLabel_8"] = Instance.new("TextLabel", AnarchyMainUI["PC_Frame_7"]);
AnarchyMainUI["SC_TextLabel_8"]["TextWrapped"] = true;
AnarchyMainUI["SC_TextLabel_8"]["TextStrokeTransparency"] = 0;
AnarchyMainUI["SC_TextLabel_8"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_TextLabel_8"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_TextLabel_8"]["TextScaled"] = true;
AnarchyMainUI["SC_TextLabel_8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_TextLabel_8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
AnarchyMainUI["SC_TextLabel_8"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_TextLabel_8"]["Size"] = UDim2.new(0.7, 0, 0.83333, 0);
AnarchyMainUI["SC_TextLabel_8"]["Text"] = [[00:00]];
AnarchyMainUI["SC_TextLabel_8"]["Name"] = [[SC_TextLabel]];
AnarchyMainUI["SC_TextLabel_8"]["Position"] = UDim2.new(0.05, 0, 0.1, 0);


AnarchyMainUI["UIStroke_9"] = Instance.new("UIStroke", AnarchyMainUI["PC_Frame_7"]);
AnarchyMainUI["UIStroke_9"]["Color"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_UIGradient_a"] = Instance.new("UIGradient", AnarchyMainUI["PC_Frame_7"]);
AnarchyMainUI["PC_UIGradient_a"]["Name"] = [[PC_UIGradient]];
AnarchyMainUI["PC_UIGradient_a"]["Offset"] = Vector2.new(0.25, 0);
AnarchyMainUI["PC_UIGradient_a"]["Transparency"]=NumberSequence.new{NumberSequenceKeypoint.new(0.000, 2.35713),NumberSequenceKeypoint.new(1.000, .5)};
AnarchyMainUI["PC_UIGradient_a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.698, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};
AnarchyMainUI["PC_UIGradient_a"]["Rotation"]=-40;
AnarchyMainUI["PC_UIGradient_a"]["Offset"]=v2(-.25,0);

AnarchyMainUI["PC_UIGradient_a"] = Instance.new("UIGradient", AnarchyMainUI["UIStroke_9"]);
AnarchyMainUI["PC_UIGradient_a"]["Name"] = [[PC_UIGradient]];
AnarchyMainUI["PC_UIGradient_a"]["Offset"] = Vector2.new(0.25, 0);
AnarchyMainUI["PC_UIGradient_a"]["Transparency"]=NumberSequence.new{NumberSequenceKeypoint.new(0.000, 2.35713),NumberSequenceKeypoint.new(1.000, .5)};
AnarchyMainUI["PC_UIGradient_a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.698, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};
AnarchyMainUI["PC_UIGradient_a"]["Rotation"]=-40;
AnarchyMainUI["PC_UIGradient_a"]["Offset"]=v2(-.25,0);

AnarchyMainUI["SC_Show/HideMusicDur_b"] = Instance.new("TextButton", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["SC_Show/HideMusicDur_b"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Show/HideMusicDur_b"]["TextSize"] = 12;
AnarchyMainUI["SC_Show/HideMusicDur_b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_Show/HideMusicDur_b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_Show/HideMusicDur_b"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Show/HideMusicDur_b"]["Size"] = UDim2.new(0.05128, 0, 0.83333, 0);
AnarchyMainUI["SC_Show/HideMusicDur_b"]["Text"] = [[v]];
AnarchyMainUI["SC_Show/HideMusicDur_b"]["Name"] = [[SC_Show/HideMusicDur]];
AnarchyMainUI["SC_Show/HideMusicDur_b"]["Position"] = UDim2.new(0.47513, 0, -0.83333, 0);


AnarchyMainUI["Hide Music Progress_c"] = Instance.new("LocalScript", AnarchyMainUI["SC_Show/HideMusicDur_b"]);
AnarchyMainUI["Hide Music Progress_c"]["Name"] = [[Hide Music Progress]];


AnarchyMainUI["SC_Blur_d"] = Instance.new("ImageLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["SC_Blur_d"]["ZIndex"] = -1;
AnarchyMainUI["SC_Blur_d"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Blur_d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["SC_Blur_d"]["ImageContent"] = ;
AnarchyMainUI["SC_Blur_d"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["SC_Blur_d"]["Size"] = UDim2.new(1, 0, 3.33333, 0);
AnarchyMainUI["SC_Blur_d"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Blur_d"]["Name"] = [[SC_Blur]];
AnarchyMainUI["SC_Blur_d"]["Position"] = UDim2.new(-0.46154, 0, -1.66667, 0);


AnarchyMainUI["SC_Blur_e"] = Instance.new("ImageLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["SC_Blur_e"]["ZIndex"] = -1;
AnarchyMainUI["SC_Blur_e"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Blur_e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["SC_Blur_e"]["ImageContent"] = ;
AnarchyMainUI["SC_Blur_e"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["SC_Blur_e"]["Size"] = UDim2.new(1, 0, 3.33333, 0);
AnarchyMainUI["SC_Blur_e"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Blur_e"]["Name"] = [[SC_Blur]];
AnarchyMainUI["SC_Blur_e"]["Position"] = UDim2.new(0.53846, 0, -1.66667, 0);


AnarchyMainUI["SC_Blur_f"] = Instance.new("ImageLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["SC_Blur_f"]["ZIndex"] = -1;
AnarchyMainUI["SC_Blur_f"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Blur_f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["SC_Blur_f"]["ImageContent"] = ;
AnarchyMainUI["SC_Blur_f"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["SC_Blur_f"]["Size"] = UDim2.new(1, 0, 3.33333, 0);
AnarchyMainUI["SC_Blur_f"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Blur_f"]["Name"] = [[SC_Blur]];
AnarchyMainUI["SC_Blur_f"]["Position"] = UDim2.new(0.00154, 0, -1.16667, 0);


AnarchyMainUI["PC_Blur_10"] = Instance.new("ImageLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["PC_Blur_10"]["ZIndex"] = -1;
AnarchyMainUI["PC_Blur_10"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Blur_10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Blur_10"]["ImageContent"] = ;
AnarchyMainUI["PC_Blur_10"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["PC_Blur_10"]["Size"] = UDim2.new(1.25641, 0, 3.33333, 0);
AnarchyMainUI["PC_Blur_10"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Blur_10"]["Rotation"] = 90;
AnarchyMainUI["PC_Blur_10"]["Name"] = [[PC_Blur]];
AnarchyMainUI["PC_Blur_10"]["Position"] = UDim2.new(-0.62564, 0, -3.33333, 0);


AnarchyMainUI["PC_Blur_11"] = Instance.new("ImageLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["PC_Blur_11"]["ZIndex"] = -1;
AnarchyMainUI["PC_Blur_11"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Blur_11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Blur_11"]["ImageContent"] = ;
AnarchyMainUI["PC_Blur_11"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["PC_Blur_11"]["Size"] = UDim2.new(1.25641, 0, 3.33333, 0);
AnarchyMainUI["PC_Blur_11"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Blur_11"]["Rotation"] = 90;
AnarchyMainUI["PC_Blur_11"]["Name"] = [[PC_Blur]];
AnarchyMainUI["PC_Blur_11"]["Position"] = UDim2.new(0.37436, 0, -3.33333, 0);


AnarchyMainUI["PC_Author_12"] = Instance.new("TextLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["PC_Author_12"]["TextWrapped"] = true;
AnarchyMainUI["PC_Author_12"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Author_12"]["TextStrokeTransparency"] = 0;
AnarchyMainUI["PC_Author_12"]["TextXAlignment"] = Enum.TextXAlignment.Left;
AnarchyMainUI["PC_Author_12"]["TextScaled"] = true;
AnarchyMainUI["PC_Author_12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_Author_12"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Author_12"]["Size"] = UDim2.new(0.15385, 0, 0.83333, 0);
AnarchyMainUI["PC_Author_12"]["Text"] = [[Author]];
AnarchyMainUI["PC_Author_12"]["Name"] = [[PC_Author]];
AnarchyMainUI["PC_Author_12"]["Position"] = UDim2.new(0.10513, 0, -0.83333, 0);


AnarchyMainUI["PC_MusicName_13"] = Instance.new("TextLabel", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["PC_MusicName_13"]["TextWrapped"] = true;
AnarchyMainUI["PC_MusicName_13"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
AnarchyMainUI["PC_MusicName_13"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_MusicName_13"]["TextStrokeTransparency"] = 0;
AnarchyMainUI["PC_MusicName_13"]["TextXAlignment"] = Enum.TextXAlignment.Right;
AnarchyMainUI["PC_MusicName_13"]["TextScaled"] = true;
AnarchyMainUI["PC_MusicName_13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_MusicName_13"]["TextDirection"] = Enum.TextDirection.RightToLeft;
AnarchyMainUI["PC_MusicName_13"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_MusicName_13"]["Size"] = UDim2.new(0.00473, 150, 0.83333, 0);
AnarchyMainUI["PC_MusicName_13"]["Text"] = [[Music Name]];
AnarchyMainUI["PC_MusicName_13"]["Name"] = [[PC_MusicName]];
AnarchyMainUI["PC_MusicName_13"]["Position"] = UDim2.new(0.748, 0, -0.83333, 0);


AnarchyMainUI["Stretch_Frame_14"] = Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["Stretch_Frame_14"]["BorderSizePixel"] = 0;
AnarchyMainUI["Stretch_Frame_14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["Stretch_Frame_14"]["Size"] = UDim2.new(0, 0, 1, 0);
AnarchyMainUI["Stretch_Frame_14"]["Name"] = [[Stretch_Frame]];


AnarchyMainUI["SC_Blur_15"] = Instance.new("ImageLabel", AnarchyMainUI["Stretch_Frame_14"]);
AnarchyMainUI["SC_Blur_15"]["ZIndex"] = 5;
AnarchyMainUI["SC_Blur_15"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Blur_15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["SC_Blur_15"]["ImageContent"] = ;
AnarchyMainUI["SC_Blur_15"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["SC_Blur_15"]["Size"] = UDim2.new(0, 50, 1.66667, 100);
AnarchyMainUI["SC_Blur_15"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Blur_15"]["Rotation"] = 90;
AnarchyMainUI["SC_Blur_15"]["Name"] = [[PC_Blur]];
AnarchyMainUI["SC_Blur_15"]["Position"] = UDim2.new(1, -25, -0.33333, -47);


AnarchyMainUI["Image_Frame1_16"] = Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["Image_Frame1_16"]["BorderSizePixel"] = 0;
AnarchyMainUI["Image_Frame1_16"]["ZIndex"] = -5;
AnarchyMainUI["Image_Frame1_16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["Image_Frame1_16"]["Size"] = UDim2.new(0.10256, 0, 3.33333, 0);
AnarchyMainUI["Image_Frame1_16"]["Position"] = UDim2.new(0.45, 0, -4, 75);
AnarchyMainUI["Image_Frame1_16"]["Name"] = [[Image_Frame1]];
AnarchyMainUI["Image_Frame1_16"]["BackgroundTransparency"] = 1;


AnarchyMainUI["PC_Circle_17"] = Instance.new("ImageLabel", AnarchyMainUI["Image_Frame1_16"]);
AnarchyMainUI["PC_Circle_17"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Circle_17"]["ZIndex"] = -10;
AnarchyMainUI["PC_Circle_17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Circle_17"]["ImageContent"] = ;
AnarchyMainUI["PC_Circle_17"]["Image"] = [[rbxassetid://2092248396]];
AnarchyMainUI["PC_Circle_17"]["Size"] = UDim2.new(1, 0, 1, 0);
AnarchyMainUI["PC_Circle_17"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Circle_17"]["Rotation"] = 75;
AnarchyMainUI["PC_Circle_17"]["Name"] = [[PC_Circle]];


AnarchyMainUI["PC_Circle_18"] = Instance.new("ImageLabel", AnarchyMainUI["Image_Frame1_16"]);
AnarchyMainUI["PC_Circle_18"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Circle_18"]["ZIndex"] = -10;
AnarchyMainUI["PC_Circle_18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Circle_18"]["ImageContent"] = ;
AnarchyMainUI["PC_Circle_18"]["Image"] = [[rbxassetid://2325939897]];
AnarchyMainUI["PC_Circle_18"]["Size"] = UDim2.new(1, 0, 1, 0);
AnarchyMainUI["PC_Circle_18"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Circle_18"]["Name"] = [[SC_Circle]];


AnarchyMainUI["UIAspectRatioConstraint_19"] = Instance.new("UIAspectRatioConstraint", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["UIAspectRatioConstraint_19"]["AspectRatio"] = 32.5;


AnarchyMainUI["Frame_1a"] = Instance.new("Frame", AnarchyMainUI["Main Interface_1"]);
AnarchyMainUI["Frame_1a"]["BorderSizePixel"] = 0;
AnarchyMainUI["Frame_1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["Frame_1a"]["Size"] = UDim2.new(0.15385, 0, 0.11111, 0);
AnarchyMainUI["Frame_1a"]["Position"] = UDim2.new(0.42949, 0, 0, -20);
AnarchyMainUI["Frame_1a"]["BackgroundTransparency"] = 1;


AnarchyMainUI["PC_Blur_1b"] = Instance.new("ImageLabel", AnarchyMainUI["Frame_1a"]);
AnarchyMainUI["PC_Blur_1b"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Blur_1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Blur_1b"]["ImageContent"] = ;
AnarchyMainUI["PC_Blur_1b"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["PC_Blur_1b"]["TileSize"] = UDim2.new(2, 0, 1, 0);
AnarchyMainUI["PC_Blur_1b"]["Size"] = UDim2.new(3.33333, 0, 1.8, 0);
AnarchyMainUI["PC_Blur_1b"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Blur_1b"]["ZIndex"] = 5;
AnarchyMainUI["PC_Blur_1b"]["Name"] = [[PC_Blur]];
AnarchyMainUI["PC_Blur_1b"]["Position"] = UDim2.new(-1.13333, 0, -0.8, 20);


AnarchyMainUI["SC_ModeText_1c"] = Instance.new("TextLabel", AnarchyMainUI["PC_Blur_1b"]);
AnarchyMainUI["SC_ModeText_1c"]["TextWrapped"] = true;
AnarchyMainUI["SC_ModeText_1c"]["TextSize"] = 30;
AnarchyMainUI["SC_ModeText_1c"]["ZIndex"] = 10;
AnarchyMainUI["SC_ModeText_1c"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_ModeText_1c"]["TextScaled"] = false;
AnarchyMainUI["SC_ModeText_1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["SC_ModeText_1c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
AnarchyMainUI["SC_ModeText_1c"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_ModeText_1c"]["TextStrokeTransparency"] = 0;
AnarchyMainUI["SC_ModeText_1c"]["Size"] = UDim2.new(0.2, 216, 0.3, 0);
AnarchyMainUI["SC_ModeText_1c"]["Text"] = [[Mode Name]];
AnarchyMainUI["SC_ModeText_1c"]["Name"] = [[SC_ModeText]];
AnarchyMainUI["SC_ModeText_1c"]["Position"] = UDim2.new(0.355, 0, 0.66667, 0);


AnarchyMainUI["Image_Frame2_1d"] = Instance.new("Frame", AnarchyMainUI["PC_Blur_1b"]);
AnarchyMainUI["Image_Frame2_1d"]["BorderSizePixel"] = 0;
AnarchyMainUI["Image_Frame2_1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["Image_Frame2_1d"]["Size"] = UDim2.new(0.34, 0, 1.88889, 0);
AnarchyMainUI["Image_Frame2_1d"]["Position"] = UDim2.new(0.31, 0, -0.41111, -20);
AnarchyMainUI["Image_Frame2_1d"]["Name"] = [[Image_Frame2]];
AnarchyMainUI["Image_Frame2_1d"]["BackgroundTransparency"] = 1;
AnarchyMainUI["Image_Frame2_1d"]["ZIndex"] = -10;


AnarchyMainUI["SC_Circle_1e"] = Instance.new("ImageLabel", AnarchyMainUI["Image_Frame2_1d"]);
AnarchyMainUI["SC_Circle_1e"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Circle_1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["SC_Circle_1e"]["ImageContent"] = ;
AnarchyMainUI["SC_Circle_1e"]["Image"] = [[rbxassetid://2076519836]];
AnarchyMainUI["SC_Circle_1e"]["Size"] = UDim2.new(1, 0, 1, 0);
AnarchyMainUI["SC_Circle_1e"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Circle_1e"]["ZIndex"] = -10;
AnarchyMainUI["SC_Circle_1e"]["Rotation"] = 75;
AnarchyMainUI["SC_Circle_1e"]["Name"] = [[SC_Circle]];

AnarchyMainUI["IdkVro"] = Instance.new("ImageLabel", AnarchyMainUI["Image_Frame2_1d"]);
AnarchyMainUI["IdkVro"]["BorderSizePixel"] = 0;
AnarchyMainUI["IdkVro"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["IdkVro"]["ImageContent"] = ;
AnarchyMainUI["IdkVro"]["Image"] = [[http://www.roblox.com/asset/?id=7069855869]];
AnarchyMainUI["IdkVro"]["Size"] = UDim2.new(0, 170, 0, 44);
AnarchyMainUI["IdkVro"]["Position"] = UDim2.new(0, 0, 0, 78);
AnarchyMainUI["IdkVro"]["BackgroundTransparency"] = 1;
AnarchyMainUI["IdkVro"]["ZIndex"] = 2;
AnarchyMainUI["IdkVro"]["Rotation"] = 0;
AnarchyMainUI["IdkVro"]["Name"] = [[PC_Idk]];

AnarchyMainUI["UIAspectRatioConstraint_20"] = Instance.new("UIAspectRatioConstraint", AnarchyMainUI["Frame_1a"]);
AnarchyMainUI["UIAspectRatioConstraint_20"]["AspectRatio"] = 3;

AnarchyMainUI["Frame_2"] = Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
AnarchyMainUI["Frame_2"]["ZIndex"] = 0;
AnarchyMainUI["Frame_2"]["BorderSizePixel"] = 0;
AnarchyMainUI["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
AnarchyMainUI["Frame_2"]["Size"] = UDim2.new(0, 212, 0, 32);
AnarchyMainUI["Frame_2"]["Position"] = UDim2.new(0.72707, 50, 0.77041, -100);
AnarchyMainUI["Frame_2"]["Rotation"] = 5;
AnarchyMainUI["Frame_2"]["BackgroundTransparency"] = 0.2;


AnarchyMainUI["PC_UIStroke_3"] = Instance.new("UIStroke", AnarchyMainUI["Frame_2"]);
AnarchyMainUI["PC_UIStroke_3"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
AnarchyMainUI["PC_UIStroke_3"]["Name"] = [[PC_UIStroke]];
AnarchyMainUI["PC_UIStroke_3"]["Thickness"] = 2;
AnarchyMainUI["PC_UIStroke_3"]["Color"] = Color3.fromRGB(255, 255, 255);

AnarchyMainUI["SC_UIGradient_4"] = Instance.new("UIGradient", AnarchyMainUI["PC_UIStroke_3"]);
AnarchyMainUI["SC_UIGradient_4"]["Name"] = [[PC_UIGradient]];
AnarchyMainUI["SC_UIGradient_4"]["Transparency"] = NumberSequence.new({
nsk(0,0),
nsk(.95,0),
nsk(1,1)
})

AnarchyMainUI["Trans"] = Instance.new("UIGradient", AnarchyMainUI["Frame_2"]);
AnarchyMainUI["Trans"]["Name"] = [[Trans]];
AnarchyMainUI["Trans"]["Transparency"] = NumberSequence.new({
nsk(0,0),
nsk(1,1)
})

AnarchyMainUI["PC_ActualModeLabell_5"] = Instance.new("TextLabel", AnarchyMainUI["Frame_2"]);
AnarchyMainUI["PC_ActualModeLabell_5"]["TextWrapped"] = true;
AnarchyMainUI["PC_ActualModeLabell_5"]["ZIndex"] = 3;
AnarchyMainUI["PC_ActualModeLabell_5"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_ActualModeLabell_5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
AnarchyMainUI["PC_ActualModeLabell_5"]["TextScaled"] = true;
AnarchyMainUI["PC_ActualModeLabell_5"]["TextSize"] = 24;
AnarchyMainUI["PC_ActualModeLabell_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_ActualModeLabell_5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
AnarchyMainUI["PC_ActualModeLabell_5"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_ActualModeLabell_5"]["TextStrokeTransparency"] = 0;
AnarchyMainUI["PC_ActualModeLabell_5"]["Size"] = UDim2.new(0, 210, 0, 32);
AnarchyMainUI["PC_ActualModeLabell_5"]["Name"] = [[SC_ActualModeLabell]];


AnarchyMainUI["PC_Blur_6"] = Instance.new("ImageLabel", AnarchyMainUI["Frame_2"]);
AnarchyMainUI["PC_Blur_6"]["ZIndex"] = -10;
AnarchyMainUI["PC_Blur_6"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Blur_6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Blur_6"]["ImageContent"] = ;
AnarchyMainUI["PC_Blur_6"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["PC_Blur_6"]["Size"] = UDim2.new(0, 232, 0, 32);
AnarchyMainUI["PC_Blur_6"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Blur_6"]["Name"] = [[PC_Blur]];
AnarchyMainUI["PC_Blur_6"]["Position"] = UDim2.new(-0.0566, 0, -0.5, 0);


AnarchyMainUI["Frame_7"] = Instance.new("Frame", AnarchyMainUI["Frame_2"]);
AnarchyMainUI["Frame_7"]["ZIndex"] = 3;
AnarchyMainUI["Frame_7"]["BorderSizePixel"] = 0;
AnarchyMainUI["Frame_7"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
AnarchyMainUI["Frame_7"]["Size"] = UDim2.new(0, 32, 0, 32);
AnarchyMainUI["Frame_7"]["Position"] = UDim2.new(0.96226, 0, 0, 0);
AnarchyMainUI["Frame_7"]["Rotation"] = 45;
AnarchyMainUI["Frame_7"]["BackgroundTransparency"] = 0.3;


AnarchyMainUI["PC_UIStroke_8"] = Instance.new("UIStroke", AnarchyMainUI["Frame_7"]);
AnarchyMainUI["PC_UIStroke_8"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
AnarchyMainUI["PC_UIStroke_8"]["Name"] = [[SC_UIStroke]];
AnarchyMainUI["PC_UIStroke_8"]["Thickness"] = 5;
AnarchyMainUI["PC_UIStroke_8"]["Color"] = Color3.fromRGB(255, 255, 255);



AnarchyMainUI["SC_Circle_a"] = Instance.new("ImageLabel", AnarchyMainUI["Frame_7"]);
AnarchyMainUI["SC_Circle_a"]["ZIndex"] = -5;
AnarchyMainUI["SC_Circle_a"]["BorderSizePixel"] = 0;
AnarchyMainUI["SC_Circle_a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["SC_Circle_a"]["ImageContent"] = ;
AnarchyMainUI["SC_Circle_a"]["Image"] = [[rbxassetid://2092248396]];
AnarchyMainUI["SC_Circle_a"]["Size"] = UDim2.new(0, 50, 0, 50);
AnarchyMainUI["SC_Circle_a"]["BackgroundTransparency"] = 1;
AnarchyMainUI["SC_Circle_a"]["Name"] = [[SC_Circle]];
AnarchyMainUI["SC_Circle_a"]["Position"] = UDim2.new(-0.3125, 0, -0.28125, 0);


AnarchyMainUI["PC_Circle_b"] = Instance.new("ImageLabel", AnarchyMainUI["Frame_7"]);
AnarchyMainUI["PC_Circle_b"]["ZIndex"] = 5;
AnarchyMainUI["PC_Circle_b"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Circle_b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Circle_b"]["ImageContent"] = ;
AnarchyMainUI["PC_Circle_b"]["Image"] = [[rbxassetid://2325939897]];
AnarchyMainUI["PC_Circle_b"]["Size"] = UDim2.new(0, 50, 0, 50);
AnarchyMainUI["PC_Circle_b"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Circle_b"]["Name"] = [[PC_Circle]];
AnarchyMainUI["PC_Circle_b"]["Position"] = UDim2.new(-0.3125, 0, -0.28125, 0);


AnarchyMainUI["PC_Blur_c"] = Instance.new("ImageLabel", AnarchyMainUI["Frame_2"]);
AnarchyMainUI["PC_Blur_c"]["ZIndex"] = -10;
AnarchyMainUI["PC_Blur_c"]["BorderSizePixel"] = 0;
AnarchyMainUI["PC_Blur_c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- AnarchyMainUI["PC_Blur_c"]["ImageContent"] = ;
AnarchyMainUI["PC_Blur_c"]["Image"] = [[rbxassetid://108982568848492]];
AnarchyMainUI["PC_Blur_c"]["Size"] = UDim2.new(0, 232, 0, 32);
AnarchyMainUI["PC_Blur_c"]["BackgroundTransparency"] = 1;
AnarchyMainUI["PC_Blur_c"]["Name"] = [[PC_Blur]];
AnarchyMainUI["PC_Blur_c"]["Position"] = UDim2.new(-0.0566, 0, 0.5, 0);




local statics={}
local staticpngs={4388380516,4388381112,4388381606,4388382104,4388382493,4388382958,4388383410,4388383891}
for _,v in next,staticpngs do
local i=i("ImageLabel")
insSet(i,"Visible",false)
insSet(i,"Image","rbxassetid://"..v)
insSet(i,"Size",u2scale(5,5))
insSet(i,"BackgroundTransparency",1)
insSet(i,"ResampleMode",e.ResamplerMode.Pixelated)
insSet(i,"ZIndex",-1000)
insSet(i,"Name","Statics")
insSet(i,"Parent",basgui)
tinsert(statics,i)
end






local IsHidden=false
local function C_c()
	local script = AnarchyMainUI["Hide Music Progress_c"];
	function BetterTween(obj, speed, prop)	
	local Tinfo=TweenInfo.new 	
	local TweenService=game.TweenService  	
	local hii=Tinfo(speed, Enum.EasingStyle.Quad, Enum.EasingDirection.In)	
	return TweenService:Create(obj, hii,prop) 	
	
	end  	
	local u2=UDim2.new   	
	local Button=script.Parent   	
	local LongFrame=Button.Parent	
	local IsTween=false  	
	local Orig=u2(0, 0, 0.9649999737739563, 0)   	
	local Hidden=u2(0, 0, 0.9649999737739563, 20)	
	
	local Hide=false	
	Button.MouseButton1Click:Connect(function() 	
	if IsTween then return end  	
	IsTween=true	
	Hide=not Hide   	
	if Hide then	
	local v=BetterTween(LongFrame,1.5,{Position=Hidden})	
	v:Play()	
	v.Completed:Wait()  	
	IsTween=false   	
	Button.Text="^"   
	IsHidden=true
	else  	
	local v=BetterTween(LongFrame,1.5,{Position=Orig})	
	v:Play()  	
	v.Completed:Wait()	
	IsTween=false 	
	Button.Text="v" 
	IsHidden=false
	end 	
	end)	
end;
task.spawn(C_c);






AnarchyMainUI["FunnyButton_2"]=Instance.new("TextButton", FSCREEN);
AnarchyMainUI["FunnyButton_2"]["BorderSizePixel"]=0;
AnarchyMainUI["FunnyButton_2"]["BackgroundColor3"]=Color3.fromRGB(22, 22, 22);
AnarchyMainUI["FunnyButton_2"]["BackgroundTransparency"]=0.24;
AnarchyMainUI["FunnyButton_2"]["Size"]=UDim2.new(0.06897, 0, 0.14724, 0);
AnarchyMainUI["FunnyButton_2"]["Text"]=[[]];
AnarchyMainUI["FunnyButton_2"]["Name"]=[[FunnyButton]];
if DEBUG then 
AnarchyMainUI["FunnyButton_2"]["Position"]=UDim2.new(0.81963, 0, 0.4908, 0);
else 
AnarchyMainUI["FunnyButton_2"]["Position"]=UDim2.new(10, 0, 0.4908, 0);

end

AnarchyMainUI["UICorner_3"]=Instance.new("UICorner", AnarchyMainUI["FunnyButton_2"]);





local FunnyDebug=AnarchyMainUI["FunnyButton_2"]



--// Make the Audio Visualizer
local frame=Instance.new("Frame",AnarchyMainUI["SC_MusicDurScale_2"])
frame.Name="Container"
frame.AnchorPoint=Vector2.new(.5,.5)

frame.Size=UDim2.new(.75,0,.15,25)
frame.Transparency=1
frame.ZIndex=-999
frame.Rotation=0
local fr1=Instance.new("Frame",frame)
fr1.Name="Bar"
fr1.Size=UDim2.new(0,5,0,5)
fr1.BackgroundColor3=Color3.fromRGB(255,255,255)
fr1.Transparency=0
fr1.ZIndex=-50
fr1.BorderSizePixel=1.25
fr1.BorderColor3=c3()
local grad=Instance.new("UIGradient",fr1)
grad.Transparency=ns{
  nsk(0, 1),
  nsk(.25, .15),
  nsk(1, .15)
}
grad.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255))
  ,ColorSequenceKeypoint.new(.75, Color3.fromRGB(255, 255, 255))
  ,ColorSequenceKeypoint.new(1,Color3.fromRGB(0, 0, 0))
  
}
grad.Rotation=90
local listlay=Instance.new("UIListLayout",frame)
listlay.Padding=UDim.new(0,1)
listlay.FillDirection="Horizontal"
listlay.HorizontalAlignment="Left"
listlay.SortOrder="LayoutOrder"
listlay.VerticalAlignment="Center"

local analyzer=Instance.new("AudioAnalyzer")
analyzer.Name="Analyzer"
analyzer.WindowSize="Large"

local AudioPlayer=Instance.new("AudioPlayer",SoundService)
AudioPlayer.Looping=true
AudioPlayer.Volume=1
AudioPlayer.Name="GlitcherAudioPlayer"
AudioPlayer.TimePosition=0
analyzer.Parent=AudioPlayer

local sound=Instance.new("Sound",AudioPlayer)
sound.Looped=true 
sound.Volume=0 --// Set this to 0 to avoid interference
sound.Name="Sound2"

local output=Instance.new("AudioDeviceOutput",AudioPlayer)
local wire=Instance.new("Wire",AudioPlayer)
wire.SourceInstance=AudioPlayer
wire.TargetInstance=output
wire.Name="Output"

local wire2=Instance.new("Wire",AudioPlayer)
wire2.SourceInstance=AudioPlayer
wire2.TargetInstance=analyzer
wire2.Name="WireAnalyzer"



local lolframe=Instance.new("Frame",AnarchyMainUI["SC_MusicDurScale_2"])
lolframe.Name="Container1"
lolframe.AnchorPoint=Vector2.new(.5,.5)
lolframe.Rotation=270
lolframe.Size=UDim2.new(.75,0,.15,25)
lolframe.Transparency=1
lolframe.ZIndex=-999
lolframe.Rotation=180
local fr2=Instance.new("Frame",lolframe)
fr2.Name="Bar1"
fr2.Size=UDim2.new(0,5,0,5)
fr2.BackgroundColor3=Color3.fromRGB(255,255,255)
fr2.Transparency=0
fr2.ZIndex=-50
fr2.BorderSizePixel=1.25
fr2.BorderColor3=c3()
local grad1=Instance.new("UIGradient",fr2)
grad1.Transparency=ns{
  nsk(0, .15),
  nsk(.75, .15),
  nsk(1, 1)
}
grad1.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0))
  ,ColorSequenceKeypoint.new(.25, Color3.fromRGB(255, 255, 255))
  ,ColorSequenceKeypoint.new(1,Color3.fromRGB(255, 255, 255))
  
}
grad1.Rotation=90
local listlay1=Instance.new("UIListLayout",lolframe)
listlay1.Padding=UDim.new(0,1)
listlay1.FillDirection="Horizontal"
listlay1.HorizontalAlignment="Left"
listlay1.SortOrder="LayoutOrder"
listlay1.VerticalAlignment="Center"



--// Tween function 
function TweenFunction(obj, speed,whattype, anim)
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
if whattype =="pos" then
return TweenService:Create(obj, hii,{Position=anim})
elseif whattype =="size" then
return TweenService:Create(obj, hii,{Size=anim})
elseif whattype =="bt" then
return TweenService:Create(obj, hii,{BackgroundTransparency=anim})
elseif whattype =="trans" then
return TweenService:Create(obj, hii,{Transparency=anim})
elseif whattype=="rot" then
return TweenService:Create(obj, hii,{Rotation=anim})
elseif whattype=="brightness" then
return TweenService:Create(obj, hii,{Brightness=anim})
end
end



function BetterTween(obj, speed, prop)
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)

end
function swait(num)
if num==0 or num==nil then
game:service'RunService'.Stepped:wait(0)
else
for i=0,num do
game:service'RunService'.Stepped:wait(0)
end
end
end


--// Load the Visualizer
local container=frame
local container1=lolframe
local Bar=container.Bar
local Bar1=container1.Bar1
local MusicPlayer=SoundService:WaitForChild("GlitcherAudioPlayer")
Bar.Parent=nil
Bar1.Parent=nil
local marker=20
local startfreq=0
local endfreq=7.5

frame.Position=UDim2.new(0,-50,0,0)
lolframe.Position=u2(1,50,0,0)


local h76=UDim2.new(0,45,.35,0)
tspawn(function()
for i=1, marker do
local bar=Bar:Clone()
local freq=startfreq + i * (endfreq - startfreq) / (marker -5) *.1
bar.LayoutOrder=i+.25+freq-23.5
bar.Name=i+.25+freq-3.5
bar.Parent=container
bar.ZIndex=-20
bar.Transparency=.35
TweenFunction(bar,1.5,"size",h76):Play()
end 
end)
tspawn(function()
for i=1, marker do
local bar1=Bar1:Clone()
local freq=startfreq + i * (endfreq - startfreq) / (marker -5) *.1
bar1.LayoutOrder=i+.25+freq-3.5
bar1.Name=i+.25+freq-3.5
bar1.Parent=container1
bar1.ZIndex=-20
bar1.Transparency=.35
TweenFunction(bar1,1.5,"size",h76):Play()
end 
end)

fr1.Size=h76
fr2.Size=h76
local SafeTreshold=.0000475
local umax=0.00030

local barlength=1
local barlength1=1.5
local mult=15
local update=1
function This1()
if MusicPlayer.TimePosition==0 then return end
update+=1
tspawn(function()
pcall(function()
local spectrum=analyzer:GetSpectrum()
local spectrumCount=#spectrum
local SafeTreshold=SafeTreshold
local currentTime=tick()
for i, v in ipairs(container:GetChildren()) do
if v:IsA("Frame")  then
local spectrumIndex=math.floor((tonumber(v.Name) / marker) * spectrumCount) + 2
spectrumIndex=math.clamp(spectrumIndex, 1, spectrumCount)
local magnitude=spectrum[spectrumIndex] or 0
local scale=math.min(magnitude / umax * 2, 550)
local i_pos=tonumber(v.Name) / marker
local edgeFactor = barlength1 - (i / #container:GetChildren())
local maxHeight = barlength + edgeFactor * mult
local targetSize = u2(Bar.Size.X.Scale, Bar.Size.X.Offset, math.min(Bar.Size.Y.Scale * scale *2 , maxHeight - .15*sin((tick()*i_pos)+update/5.5))+sound.PlaybackLoudness/350, Bar.Size.Y.Offset)
v.Size=v.Size:Lerp(targetSize, .75)
if magnitude > SafeTreshold then
else
v.Size=v.Size:Lerp(u2(Bar.Size.X.Scale, Bar.Size.X.Offset, .0100,Bar.Size.Y.Offset), 0.1)
end
end
end
end)
end)
end
local update1=0
function This2()
if MusicPlayer.TimePosition==0 then return end
update1+=1
tspawn(function()
pcall(function()
local spectrum=analyzer:GetSpectrum()
local spectrumCount=#spectrum
local SafeTreshold=SafeTreshold
local currentTime=tick()
for i, v in ipairs(lolframe:GetChildren()) do
if v:IsA("Frame")  then
local spectrumIndex=math.floor((tonumber(v.Name) / marker) * spectrumCount) + 2
spectrumIndex=math.clamp(spectrumIndex, 1, spectrumCount)
local magnitude=spectrum[spectrumIndex] or 0
local scale=math.min(magnitude / umax * 2, 550)
local i_pos=tonumber(v.Name) / marker
local edgeFactor = barlength1 - (i / #lolframe:GetChildren())
local maxHeight = barlength + edgeFactor * mult
local targetSize = u2(Bar.Size.X.Scale, Bar.Size.X.Offset, math.min(Bar.Size.Y.Scale * scale *2 , maxHeight - .15*sin((tick()*i_pos)+update/5.5))+sound.PlaybackLoudness/350, Bar.Size.Y.Offset)
v.Size=v.Size:Lerp(targetSize, .75)
if magnitude > SafeTreshold then
else
v.Size=v.Size:Lerp(u2(Bar.Size.X.Scale, Bar.Size.X.Offset, .0100,Bar.Size.Y.Offset), 0.1)
end
end
end
end)
end)
end





function FormatTime(seconds)
seconds=math.floor(seconds or 0)
local minutes=math.floor(seconds / 60)
local secs=seconds % 60
return string.format("%d:%02d", minutes, secs)
end




function Asset(filename)
if isfile(Name.." Assets/"..filename) then
return getcustomasset(Name.." Assets/"..filename)
else
warn("Downloading File "..filename)
writefile(Name.." Assets/"..filename, game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/"..filename.."?raw=true"))
end
end




--// Body Parts
local RootJoint=getJoint("RootJoint")
local RightShoulder=getJoint("Right Shoulder")
local LeftShoulder=getJoint("Left Shoulder")
local RightHip=getJoint("Right Hip")
local LeftHip=getJoint("Left Hip")
local Neck=getJoint("Neck")


local RArm=getPart("Right Shoulder")
local LArm=getPart("Left Shoulder")
local RLeg=getPart("Right Hip")
local LLeg=getPart("Left Hip")
local Head=getPart("Neck")



function SafePart(Find)
local char=game.Players.LocalPlayer.Character
if char:FindFirstChild(Find) and Running then 
return char:FindFirstChild(Find).Handle
else 
return scriptfolder:FindFirstChild(head.Name)
end

end


function FindPartByMesh(meshId, textureId, accessoryname)
local char=game.Players.LocalPlayer.Character
meshId=tostring(meshId)
textureId=tostring(textureId)

for _, obj in ipairs(char:GetDescendants()) do
if obj:IsA("SpecialMesh") then

local meshMatch=string.find(obj.MeshId, meshId)
local textureMatch=string.find(obj.TextureId, textureId)

if meshMatch and textureMatch then
local accessory=obj:FindFirstAncestorWhichIsA("Accessory")
if accessory then
return accessory.Name
end
else 
if accessoryname~=nil and char:FindFirstChild(accessoryname) then 
return char:FindFirstChild(accessoryname).Name or nil
end
end
end
end
return char:WaitForChild(accessoryname).Name or nil
end




local exclude={}
function ForRaycast()
tclear(exclude)
for _, plr in ipairs(plrs:GetPlayers()) do
--print(plr.Name)
tinsert(exclude,plr.Name)
end
end

ForRaycast()
nj=game.Players.PlayerAdded:Connect(function()
if not Running then nj:Disconnect() end
ForRaycast()
end)
nj1=game.Players.PlayerRemoving:Connect(function()
if not Running then nj1:Disconnect() end
ForRaycast()
end)

local jj=nil
function PosRoot(Change, rotate)
if jj then
jj:Disconnect()
jj=nil
end

task.spawn(function()
jj=game:GetService("RunService").PostSimulation:Connect(function()
if not Running then
jj:Disconnect()
jj=nil
return
end
ForRaycast()
rotate=rotate == true
local char=nil
local char1=lp.Character
for _,c in next,exclude do 
pcall(function()
if not game.Players:FindFirstChild(c) then 
tclear(exclude)
else 
char=game.Players[c].Character
end
end)
end
local humroot=rootpart1
local Torso=torso
if not humroot or not Torso then return end
local rayParams=raycastparams
local origin=Torso.Position
local direction=v3(0,-500000,0)
local result=workspace:Raycast(origin,direction, rayParams)
local yPos=origin.Y
if result then
yPos=result.Position.Y+Change
end
local _, y, _ =Torso.CFrame:ToEulerAnglesYXZ()
if rotate then
humroot.CFrame =CFrame.new(origin.X,yPos,origin.Z)*CFrame.Angles(0,y,0)
else
humroot.CFrame=CFrame.new(origin.X, yPos, origin.Z)
end
humroot.Anchored=true
humroot.Massless=true
humroot.CanCollide=false
humroot.Transparency=1
end)
end)
end


PosRoot(0)



--local righead=ws:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild(HTarget).Handle
function WhatIsThis()
tspawn(function()
pcall(function()
for _,c in lp.Character:GetChildren() do 
if c:IsA("Accessory") then
local ostj=.1
repeat
--c.Handle.Position=rootpart1.Position+Vector3.new(0,0,-5)
local sine15=sine*15
local sin=math.sin 
local v3=Vector3.new
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
c.Handle.AssemblyAngularVelocity=idlerv
c.Handle.AssemblyLinearVelocity=v3(0,25.01,0)
--c.Handle.CFrame=rootpart.CFrame*CFrame.new(Vector3.new(0,1,0))*CFrame.new(Vector3.new(0,Workspace.FallenPartsDestroyHeight-c.Handle.Position.Y+1,0))
oswait(.1)
ostj+=.1
until ostj>=1
end
end
end)
end)
end


local scann={}
for _,a in lp.Character:GetChildren() do 
if a:IsA("Accessory") then 
local f=a:Clone()
tinsert(scann,f)
end
end


function LolXD()
local fuhyu=nil
function god()
if fuhyu then fuhyu:Disconnect() fuhyu=nil end
local accessoriesthataretracked={}
local char=lp.Character
for _,t in char:GetChildren() do 
if t:IsA("Accessory") and Running then 
accessoriesthataretracked[t]=true
if char and t then 
if char:FindFirstChild(t.Name.."_Fake") then 
char[t.Name.."_Fake"]:Destroy()
end
end
tspawn(function()
pcall(function()
local c=t
tspawn(function()
pcall(function()
if c:FindFirstChildOfClass("Weld") then 
repeat 
 
if not c:FindFirstChildOfClass("Weld") then return end
c:FindFirstChildOfClass("Weld"):Destroy()
oswait(.1)
until IsHatDropped
end
end)
end)
local lkj=i("Highlight",c.Handle)
lkj.Enabled=false
twait(.5)
repeat oswait(.1) until (not c.Handle.AssemblyLinearVelocity.Y~=25.01 or c.Handle.AssemblyLinearVelocity.X >=-15.5 or c.Handle.AssemblyLinearVelocity.X>=15.5 or c.Handle.AssemblyLinearVelocity.Z >=-15.5 or c.Handle.AssemblyLinearVelocity.Z>=15.5) and not IsHatDropped
local hd=c.Handle 

--print("Fired")
lkj.Enabled=true
lkj.FillTransparency=1
lkj.OutlineTransparency=.5
lkj.OutlineColor=pcolor.Value
local xd=BetterTween(lkj,2.5,{FillTransparency=1})
local xd1=BetterTween(lkj,2.5,{OutlineTransparency=1})
xd:Play()
xd1:Play()
xd.Completed:Connect(function()lkj.Enabled=false  end)
local ostj=.1
repeat
--c.Handle.Position=rootpart1.Position+Vector3.new(0,0,-5)
local sine15=sine*15
local sin=math.sin 
local v3=Vector3.new
local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
c.Handle.AssemblyAngularVelocity=idlerv
--c.Handle.AssemblyLinearVelocity=v3(0,25.01,0)
--c.Handle.CFrame=c.Handle.CFrame*cf(0,5,0)
oswait(.5)
ostj+=.1
until ostj>=.5
end)
end)
end
end
if Hatdrop then
--HatDrop(char)
end
fuhyu=char.ChildRemoved:Connect(function(c)
if c:IsA("Accessory") and accessoriesthataretracked[c] and Running then 
local tust=0
local f=c
oswait(.1)
for i,a in next,scann do 
if not char:FindFirstChild(a.Name) then 
local g=a:Clone()
g.Handle.Transparency=.75
--g.Parent=char
--print(g.Name)
end
end
accessoriesthataretracked[c]=nil
repeat Respawn() tust+=1 oswait(.1) until tust>=2
end
end)
char.ChildAdded:Connect(function(c)
if c:IsA("Accessory") then 
accessoriesthataretracked[c]=true 
end
end)
if UsePlayerBody then
char.ChildAdded:Connect(function(c)
if c:IsA("BasePart") and Running then 
twait(.5)
repeat swait() until c.AssemblyLinearVelocity==v3()
Respawn()
end
end)
end
end

god()
ck=lp.CharacterAdded:Connect(function()
if not Running then ck:Disconnect()end
--refreshjoints()
repeat oswait(game.Players.LocalPlayer:GetNetworkPing()) 
until not IsHatDropped
if Hatdrop then oswait(plrs.RespawnTime+.1) end
god()

--refreshjoints()
end)
tspawn(function()
local lllll
lllll=lp.CharacterAdded:Connect(function()
if not Running then 
lllll:Disconnect()
end
if Running then
oswait(game.Players.RespawnTime+.1)
for _,d in lp.Character:GetDescendants() do 
if d:IsA("Weld") then 
if not d then continue end
local h=d
h:Destroy()
end
end
oswait(math.round(game.Players.LocalPlayer:GetNetworkPing())+1)
if  SmoothCamera then 
if ws.CurrentCamera.CameraType~="Custom" then
ws.CurrentCamera.CameraType="Custom"
end
end
end
end)
end)
end

tspawn(function()
oswait(1)
LolXD()
end)







 --// Other Variables
local WingAnimations={}
local sp=0
local Spinny=1
local AnimType=" "


function TypeWrite(fulltext,typespeed,usefontface,font,color,timehappen,timedur,prevent,trans,sizebeggin,sizeout)

if prevent==nil then prevent=true end
if sizebeggin==nil then sizebeggin=20 end
if sizeout==nil then sizeout=30 end
if trans==nil then sizeout=.1 end

if prevent then
if AnarchyMainUI["SC_MusicDurScale_2"]:FindFirstChild("TypeWriteUI") then return end
else 
if AnarchyMainUI["SC_MusicDurScale_2"]:FindFirstChild("TypeWriteUI") then 
AnarchyMainUI["SC_MusicDurScale_2"].TypeWriteUI:Destroy()
end
end
tspawn(function()

if timehappen~=nil and timedur~=nil then
if sound.TimePosition>timehappen and sound.TimePosition<=timedur then
local TypeWriteUIFrame={};


TypeWriteUIFrame["Frame_2"]=Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
TypeWriteUIFrame["Frame_2"]["BorderSizePixel"]=0;
TypeWriteUIFrame["Frame_2"]["BackgroundColor3"]=Color3.fromRGB(255, 255, 255);
TypeWriteUIFrame["Frame_2"]["Size"]=UDim2.new(0, 170, 0, 26);
TypeWriteUIFrame["Frame_2"]["Position"]=UDim2.new(0, 100, -0.83333, -75);
TypeWriteUIFrame["Frame_2"]["BackgroundTransparency"]=1;
TypeWriteUIFrame["Frame_2"]["Name"]=[[TypeWriteUI]];
local X=i("TextLabel")
X.Text=" "
if usefontface then 
X.FontFace=font
else
X.Font=font
end
X.TextSize=sizebeggin
X.Name="Lyrics"
X.TextColor3=color
X.BackgroundTransparency=100
X.Parent=TypeWriteUIFrame["Frame_2"]
X.Size=UDim2.new(0,176,0,26) --// Centralized
X.Rotation=0
X.Visible=true
for i=1, #fulltext  do
X.Visible=true
X.Text=ssub(fulltext, 1 ,i)
oswait(timehappen-timedur)
end
task.wait(delaybeforedelete)
BetterTween(X,.5,{TextSize=sizeout}):Play()
--BetterTween(X,.5,{Size=size}):Play()
BetterTween(TypeWriteUIFrame["Frame_2"],.5,{Size=size1}):Play()
for i=0,1,.1  do
X.TextTransparency=i
oswait(trans)
end
--oswait(1)
TypeWriteUIFrame["Frame_2"]:Destroy()
end
else 
local TypeWriteUIFrame={};


TypeWriteUIFrame["Frame_2"]=Instance.new("Frame", AnarchyMainUI["SC_MusicDurScale_2"]);
TypeWriteUIFrame["Frame_2"]["BorderSizePixel"]=0;
TypeWriteUIFrame["Frame_2"]["BackgroundColor3"]=Color3.fromRGB(255, 255, 255);
TypeWriteUIFrame["Frame_2"]["Size"]=UDim2.new(0, 170, 0, 26);
TypeWriteUIFrame["Frame_2"]["Position"]=UDim2.new(0, 100, -0.83333, -75);
TypeWriteUIFrame["Frame_2"]["BackgroundTransparency"]=1;
TypeWriteUIFrame["Frame_2"]["Name"]=[[TypeWriteUI]];
local X=i("TextLabel")
X.Text=" "
if usefontface then 
X.FontFace=font
else
X.Font=font
end
X.TextSize=sizebeggin
X.Name="Lyrics"
X.TextColor3=color
X.BackgroundTransparency=100
X.Parent=TypeWriteUIFrame["Frame_2"]
X.Size=UDim2.new(0,176,0,26) --// Centralized
X.Rotation=0
X.Visible=true
for i=1, #fulltext  do
X.Visible=true
X.Text=ssub(fulltext, 1 ,i)
oswait(typespeed)
end
task.wait(delaybeforedelete)
BetterTween(X,.5,{TextSize=sizeout}):Play()
--BetterTween(X,.5,{Size=size}):Play()
BetterTween(TypeWriteUIFrame["Frame_2"],.5,{Size=size1}):Play()
for i=0,1,.1  do
X.TextTransparency=i
oswait(trans)
end
--oswait(1)
TypeWriteUIFrame["Frame_2"]:Destroy()

end
end)
end


function GetAcc(mesh,text)
for _,v in lp:GetDescendants() do 
mesh=tonumber(mesh)
text=tonumber(text)
if v:IsA("Accessory") then 
local specialmesh=v.Handle:FindFirstChild("SpecialMesh")
if SpecialMesh then 
if specialmesh.MeshId:sub(1,#mesh)==mesh and specialmesh.TextureId:sub(1,#text)==text then
return v.Name
end
end
end
end
end


local swords={
  "DemonGodSword",
  "VoidLordSword",
  "AuroraSword",
  "RainbowGodSword",
  GetAcc(5278721954, 5692006383)
}

--// VFX Essenstials
function CreateR6D(parent,part0,part1,C0P,C0A,C1P,C1A)
local weld=Instance.new("Motor6D")
weld.Parent=parent
weld.Part0=part0
weld.Part1=part1
weld.Name="What Weld"
weld.C1=C1P*C1A
weld.C0=C0P*C0A
return weld
end

function CreateWeld(parent,part0,part1,C0P,C0A,C1P,C1A)
local weld=Instance.new("Weld")
weld.Parent=parent
weld.Part0=part0
weld.Part1=part1
weld.Name="What Weld"
weld.C1=cf(C1X,C1Y,C1Z)*angles(C1Xa,C1Ya,C1Za)
weld.C0=cf(C0X,C0Y,C0Z)*angles(C0Xa,C0Ya,C0Za)
return weld
end

function CreatePart(parent,transparency,reflectance,material,col,size,name)
local p=Instance.new("Part")
p.TopSurface=0
p.Name=name
p.BottomSurface=0
p.Parent=parent
p.Size=size
p.Transparency=transparency
p.Reflectance=reflectance
p.CanCollide=false
p.Locked=false 
p.Massless=true 
p.Anchored=true 
p.Color=col 
p.Material=material
return p
end

function sphereMK(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local char=scriptfolder
local rng = Instance.new("Part", char)
rng.Anchored = true
rng.Color=color
rng.CanCollide = false
rng.FormFactor = 3
rng.Name = "Ring"
rng.Material = "Neon"
rng.Size = Vector3.new(1, 1, 1)
rng.Transparency = 0
rng.TopSurface = 0
rng.BottomSurface = 0
rng.CFrame = pos
local li=i("PointLight",rng)
li.Range=sound.PlaybackLoudness/75
li.Color=color
li.Brightness=sound.PlaybackLoudness/30
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
local rngm = Instance.new("SpecialMesh", rng)
rngm.MeshType = "Sphere"
rngm.Scale = Vector3.new(x1,y1,z1)

local scaler2 = 1
local speeder = FastSpeed
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
task.spawn(function()
for i = 0,10/bonuspeed,0.1 do
swait()

if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end

speeder = speeder - 0.01*FastSpeed*bonuspeed
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, 0)
end
rng:Destroy()
end)
end



function slash(bonuspeed,rotspeed,rotatingop,typeofshape,type,typeoftrans,pos,scale,value,color)
local type = type
local char=scriptfolder
local rotenable = rotatingop
local rng = Instance.new("Part", char)
rng.Anchored = true
rng.Color = color
rng.CanCollide = false
rng.FormFactor = 3
rng.Name = "Ring"
rng.Material = "Neon"
rng.Size = Vector3.new(.1, .1, .1)
rng.Transparency = 0
if typeoftrans == "In" then
rng.Transparency = 1
end
rng.TopSurface = 0
rng.BottomSurface = 0
rng.CFrame = pos
local rngm = Instance.new("SpecialMesh", rng)
rngm.MeshType = "FileMesh"
if typeofshape == "Normal" then
rngm.MeshId = "rbxassetid://662586858"
elseif typeofshape == "Round" then
rngm.MeshId = "rbxassetid://662585058"
end
rngm.Scale = scale
local scaler2 = 1/10
if type == "Add" then
scaler2 = 1*value/10
elseif type == "Divide" then
scaler2 = 1/value/10
end
local randomrot = math.random(1,2)
task.spawn(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed/10
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed/10
end
if rotenable == true then
if randomrot == 1 then
rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(rotspeed*bonuspeed/2),0)
elseif randomrot == 2 then
rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(-rotspeed*bonuspeed/2),0)
end
end
if typeoftrans == "Out" then
rng.Transparency = rng.Transparency + 0.01*bonuspeed
elseif typeoftrans == "In" then
rng.Transparency = rng.Transparency - 0.01*bonuspeed
end
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed/10, 0, scaler2*bonuspeed/10)
end
rng:Destroy()
end)
end


function sphere2(bonuspeed,type,pos,scale,value,value2,value3,color)
local type = type
local char=scriptfolder
local rng = Instance.new("Part", char)
rng.Anchored = true
rng.CanCollide = false
rng.FormFactor = 3
rng.Name = "Ring"
rng.Material = "Neon"
rng.Size = Vector3.new(1, 1, 1)
rng.Transparency = 0
rng.TopSurface = 0
rng.BottomSurface = 0
rng.CFrame = pos
local rngm = Instance.new("SpecialMesh", rng)
rngm.MeshType = "Sphere"
rngm.Scale = scale
local scaler2 = 1
local scaler2b = 1
local scaler2c = 1
if type == "Add" then
scaler2 = 1*value
scaler2b = 1*value2
scaler2c = 1*value3
elseif type == "Divide" then
scaler2 = 1/value
scaler2b = 1/value2
scaler2c = 1/value3
end

tspawn(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
scaler2b = scaler2b - 0.01*value/bonuspeed
scaler2c = scaler2c - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
scaler2b = scaler2b - 0.01/value*bonuspeed
scaler2c = scaler2c - 0.01/value*bonuspeed
end
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2b*bonuspeed, scaler2c*bonuspeed)
end
rng:Destroy()
end)
end


function wave1(type,speed,scaleto,position,color,starttransparency,ref)
tspawn(function()
if starttransparency==nil then starttransparency=0 end
if ref==nil then ref=1 end
local type = type
local char=scriptfolder
local function oswait(seconds)
if seconds==nil then seconds=0 end
local start = os.clock()
repeat
wait()
until os.clock() >= start + seconds
end
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local w1=i("MeshPart", char)
w1.Name="Wave1"
w1.MeshId="rbxassetid://863344136"
w1.Anchored=true
w1.CanCollide=false
w1.CanQuery=false
w1.CanTouch=false
w1.Reflectance=ref
w1.Color=color
w1.CFrame=position
w1.Material=Enum.Material.Neon
w1.CastShadow=false
w1.Massless=true
w1.Material=Enum.Material.Neon
w1.TextureID=""
local scaler2 = 1
local scaler2b = 1
local scaler2c = 1
task.spawn(function()
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)

end
local speed=1.5/speed
if type=="Out" then
w1.Size=v3(0,0,0)
w1.Transparency=starttransparency
local r=BetterTween(w1,speed,{Size=v3(scaleto,scaleto,scaleto)})
local t=BetterTween(w1,speed,{Transparency=1})
r:Play()
t:Play()
r.Completed:Wait()
w1:Destroy()
elseif type=="In" then
w1.Size=v3(scaleto,scaleto,scaleto)
local s=BetterTween(w1,speed,{Size=v3(0,0,0)})
local y=BetterTween(w1,speed,{Transparency=0})
w1.Transparency=starttransparency
s:Play()
y:Play()
s.Completed:Wait()
w1:Destroy()
end
end)
end) end

function wave2(type,speed,scaleto,position,color,starttransparency,ref)
tspawn(function()
if starttransparency==nil then starttransparency=0 end
if ref==nil then ref=1 end
local type = type
local char=scriptfolder
local function oswait(seconds)
if seconds==nil then seconds=0 end
local start = os.clock()
repeat
wait()
until os.clock() >= start + seconds
end
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local w2=i("MeshPart", char)
w2.Name="Wave2"
w2.MeshId="rbxassetid://6862105399"
w2.Anchored=true
w2.CanCollide=false
w2.CanQuery=false
w2.CanTouch=false
w2.Reflectance=ref
w2.Color=color
w2.CFrame=position
w2.Material=Enum.Material.Neon
w2.CastShadow=false
w2.Massless=true
w2.Material=Enum.Material.Neon
w2.TextureID=""
local scaler2 = 1
local scaler2b = 1
local scaler2c = 1
task.spawn(function()
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)

end
local speed=1.5/speed
if type=="Out" then
w2.Size=v3(0,0,0)
w2.Transparency=starttransparency
local r=BetterTween(w2,speed,{Size=v3(scaleto,scaleto,scaleto)})
local t=BetterTween(w2,speed,{Transparency=1})
r:Play()
t:Play()
r.Completed:Wait()
w2:Destroy()
elseif type=="In" then
w2.Size=v3(scaleto,scaleto,scaleto)
local s=BetterTween(w2,speed,{Size=v3(0,0,0)})
local y=BetterTween(w2,speed,{Transparency=0})
w2.Transparency=starttransparency
s:Play()
y:Play()
s.Completed:Wait()
w2:Destroy()
end
end)
end) end

function wave3(type,speed,scaleto,position,color,starttransparency,ref)
tspawn(function()
if starttransparency==nil then starttransparency=0 end
if ref==nil then ref=1 end
local type = type
local char=scriptfolder
local function oswait(seconds)
if seconds==nil then seconds=0 end
local start = os.clock()
repeat
wait()
until os.clock() >= start + seconds
end
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local w3=i("MeshPart", char)
w3.Name="Wave3"
w3.MeshId="rbxassetid://17388414697"
w3.Anchored=true
w3.CanCollide=false
w3.CanQuery=false
w3.CanTouch=false
w3.Reflectance=ref
w3.Color=color
w3.CFrame=position
w3.Material=Enum.Material.Neon
w3.CastShadow=false
w3.Massless=true
w3.Material=Enum.Material.Neon
w3.TextureID=""
task.spawn(function()
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)

end
local speed=1.5/speed
if type=="Out" then
w3.Size=v3(0,0,0)
w3.Transparency=starttransparency
local r=BetterTween(w3,speed,{Size=v3(scaleto,scaleto,scaleto)})
local t=BetterTween(w3,speed,{Transparency=1})
r:Play()
t:Play()
r.Completed:Wait()
w3:Destroy()
elseif type=="In" then
w3.Size=v3(scaleto,scaleto,scaleto)
local s=BetterTween(w3,speed,{Size=v3(0,0,0)})
local y=BetterTween(w3,speed,{Transparency=0})
w3.Transparency=starttransparency
s:Play()
y:Play()
s.Completed:Wait()
w3:Destroy()
end
end)
end) end

function wave4(type,speed,scaleto,position,color,starttransparency,ref)
tspawn(function()
local type = type
if starttransparency==nil then starttransparency=0 end
if ref==nil then ref=1 end
local char=scriptfolder
local function oswait(seconds)
if seconds==nil then seconds=0 end
local start = os.clock()
repeat
wait()
until os.clock() >= start + seconds
end
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local w4=i("MeshPart", char)
w4.Name="Wave4"
w4.MeshId="rbxassetid://20329976"
w4.Anchored=true
w4.CanCollide=false
w4.CanQuery=false
w4.CanTouch=false
w4.Reflectance=ref
w4.Color=color
w4.CFrame=position
w4.Material=Enum.Material.Neon
--w4.Size=v3(0,0,0)
w4.CastShadow=false
w4.Massless=true
w4.Material=Enum.Material.Neon
w4.TextureID=""
local scaler2 = 1
local scaler2b = 1
local scaler2c = 1
task.spawn(function()
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)

end
local speed=1.5/speed
if type=="Out" then
w4.Size=v3(0,0,0)
local r=BetterTween(w4,speed,{Size=v3(scaleto,scaleto,scaleto)})
local t=BetterTween(w4,speed,{Transparency=1})
r:Play()
t:Play()
w4.Transparency=starttransparency
r.Completed:Wait()
w4:Destroy()
elseif type=="In" then
w4.Size=v3(scaleto,scaleto,scaleto)
local s=BetterTween(w4,speed,{Size=v3(0,0,0)})
local y=BetterTween(w4,speed,{Transparency=0})
w4.Transparency=starttransparency
s:Play()
y:Play()
s.Completed:Wait()
w4:Destroy()
end
end)
end) end

function block(type,speed,startsize,endsize,pos,col,starttransparency,outline,ocol,maketransparent,ref,mat)
if outline==nil then outline=false end
if maketransparent==nil then maketransparent=false end
if ref==nil then ref=1 end
if mat==nil then mat="Neon" end
local type = type
local char=scriptfolder
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local Block_1=i("Part", char)
Block_1.Name="Block"
Block_1.Anchored=true
Block_1.CanCollide=false
Block_1.CanQuery=false
Block_1.CanTouch=false
Block_1.Reflectance=ref
Block_1.Color=col
Block_1.Material=mat
Block_1.Size=startsize
Block_1.CastShadow=false
Block_1.CFrame=pos
Block_1.Massless=true
if outline then 
local h=i("Highlight",Block_1)
h.FillTransparency=1
h.DepthMode="Occluded"
h.OutlineColor=ocol
end
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)
end
local speed=1.5/speed
tspawn(function()
if type=="Out" then 
Block_1.Transparency=starttransparency
Block_1.Size=startsize
local t=BetterTween(Block_1,speed,{Size=endsize})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=1})
t1:Play()
end
t:Play()
t.Completed:Wait()
Block_1:Destroy()
elseif type=="In" then
Block_1.Transparency=starttransparency
Block_1.Size=endsize
local t=BetterTween(Block_1,speed,{Size=startsize})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=0})
t1:Play()
end
t:Play()
t.Completed:Wait()
Block_1:Destroy()
end
end)


end

function block1(type,speed,startsize,endsize,pos,col,starttransparency,endpos,outline,ocol,maketransparent,ref,mat)
if outline==nil then outline=false end
if maketransparent==nil then maketransparent=false end
if ref==nil then ref=1 end
if mat==nil then mat="Neon" end
local type = type
local char=scriptfolder
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local Block_1=i("Part", char)
Block_1.Name="Block"
Block_1.Anchored=true
Block_1.CanCollide=false
Block_1.CanQuery=false
Block_1.CanTouch=false
Block_1.Reflectance=ref
Block_1.Color=col
Block_1.Material=mat
Block_1.Size=startsize
Block_1.CastShadow=false
Block_1.CastShadow=false
Block_1.CFrame=pos
Block_1.Massless=true
if outline then 
local h=i("Highlight",Block_1)
h.FillTransparency=1
h.DepthMode="Occluded"
h.OutlineColor=ocol
end
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)
end
local speed=1.5/speed
tspawn(function()
if type=="Out" then 
Block_1.Transparency=starttransparency
Block_1.Size=startsize
local t=BetterTween(Block_1,speed,{Size=endsize})
local t2=BetterTween(Block_1,speed,{CFrame=endpos})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=1})
t1:Play()
end
t:Play()
t2:Play()
t.Completed:Wait()
Block_1:Destroy()
elseif type=="In" then
Block_1.Transparency=starttransparency
Block_1.Size=endsize
local t=BetterTween(Block_1,speed,{Size=startsize})
local t2=BetterTween(Block_1,speed,{CFrame=endpos})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=0})
t1:Play()
end
t2:Play()
t:Play()
t.Completed:Wait()
Block_1:Destroy()
end
end)


end

function sphere1(type,speed,startsize,endsize,pos,col,starttransparency,endpos,outline,ocol,maketransparent,ref,mat)
if outline==nil then outline=false end
if maketransparent==nil then maketransparent=false end
if ref==nil then ref=1 end
if mat==nil then mat="Neon" end
local type = type
local char=scriptfolder
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local Block_1=i("MeshPart", char)
Block_1.Name="Block"
Block_1.MeshId="rbxassetid://482906818"
Block_1.Anchored=true
Block_1.CanCollide=false
Block_1.CanQuery=false
Block_1.CanTouch=false
Block_1.Reflectance=ref
Block_1.Color=col
Block_1.Material=mat
Block_1.Size=startsize
Block_1.CastShadow=false
Block_1.CastShadow=false
Block_1.CFrame=pos
Block_1.Massless=true
if outline then 
local h=i("Highlight",Block_1)
h.FillTransparency=1
h.DepthMode="Occluded"
h.OutlineColor=ocol
end
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)
end
local speed=1.5/speed
tspawn(function()
if type=="Out" then 
Block_1.Transparency=starttransparency
Block_1.Size=startsize
local t=BetterTween(Block_1,speed,{Size=endsize})
local t2=BetterTween(Block_1,speed,{CFrame=endpos})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=1})
t1:Play()
end
t:Play()
t2:Play()
t.Completed:Wait()
Block_1:Destroy()
elseif type=="In" then
Block_1.Transparency=starttransparency
Block_1.Size=endsize
local t=BetterTween(Block_1,speed,{Size=startsize})
local t2=BetterTween(Block_1,speed,{CFrame=endpos})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=0})
t1:Play()
end
t2:Play()
t:Play()
t.Completed:Wait()
Block_1:Destroy()
end
end)


end

function square(type,speed,startsize,endsize,pos,col,starttransparency,endpos,outline,ocol,maketransparent,ref)
if outline==nil then outline=false end
if maketransparent==nil then maketransparent=false end
if ref==nil then ref=1 end
local type = type
local char=scriptfolder
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local Square_19=i("MeshPart", char)
Square_19.Name="Square"
Square_19.MeshId="rbxassetid://7263678476"
Square_19.Anchored=true
Square_19.CanCollide=false
Square_19.CanQuery=false
Square_19.CanTouch=false
--Square_19.Transparency=1
Square_19.Reflectance=0
Square_19.Color=col
Square_19.Material=Enum.Material.Neon
--Square_19.Size=v3(0.100000,0.100000,0.100000)
Square_19.CastShadow=false
Square_19.Massless=true
Square_19.Material=Enum.Material.Neon
Square_19.TextureID=""
Square_19.CFrame=pos
Square_19.DoubleSided=false
if outline then 
local h=i("Highlight",Square_19)
h.FillTransparency=1
h.DepthMode="Occluded"
h.OutlineColor=ocol
h.LineThickness=2.5
end
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)
end
local speed=1.5/speed
tspawn(function()
if type=="Out" then 
Square_19.Transparency=starttransparency
Square_19.Size=startsize
local t=BetterTween(Square_19,speed,{Size=endsize})
local t2=BetterTween(Square_19,speed,{CFrame=endpos})
if maketransparent then
local t1=BetterTween(Square_19,speed,{Transparency=1})
t1:Play()
end
t:Play()
t2:Play()
t.Completed:Wait()
Square_19:Destroy()
elseif type=="In" then
Square_19.Transparency=starttransparency
Square_19.Size=endsize
local t=BetterTween(Square_19,speed,{Size=startsize})
local t2=BetterTween(Square_19,speed,{CFrame=endpos})
if maketransparent then
local t1=BetterTween(Square_19,speed,{Transparency=0})
t1:Play()
end
t2:Play()
t:Play()
t.Completed:Wait()
Square_19:Destroy()
end
end)


end



function blockmoveup(type,speed,startsize,endsize,pos,col,starttransparency,endpos,outline,ocol,maketransparent,ref)
if maketransparent==nil then maketransparent=false end
if outline==nil then outline=false end
if ref==nil then ref=1 end
local type = type
local char=scriptfolder
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local Block_1=i("Part", char)
Block_1.Name="Block"
Block_1.Anchored=true
Block_1.CanCollide=false
Block_1.CanQuery=false
Block_1.CanTouch=false
Block_1.Reflectance=ref
Block_1.Color=col
Block_1.Material=Enum.Material.Neon
Block_1.Size=startsize
Block_1.CastShadow=false
Block_1.CFrame=pos
Block_1.Massless=true
if outline then 
local h=i("Highlight",Block_1)
h.FillTransparency=1
h.DepthMode="Occluded"
h.OutlineColor=ocol
end
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)
end
local speed=1.5/speed
tspawn(function()
if type=="Out" then 
Block_1.Transparency=starttransparency
Block_1.Size=startsize
local t=BetterTween(Block_1,speed,{Size=endsize})
local t2=BetterTween(Block_1,speed,{Position=v3(Block_1.Position.X,Block_1.Position.Y*endpos,Block_1.Position.Z)})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=1})
t1:Play()
end
t:Play()
t2:Play()
t.Completed:Wait()
Block_1:Destroy()
elseif type=="In" then
Block_1.Transparency=starttransparency
Block_1.Size=endsize
local t=BetterTween(Block_1,speed,{Size=startsize})
local t2=BetterTween(Block_1,speed,{Position=v3(Block_1.Position.X,Block_1.Position.Y*endpos,Block_1.Position.Z)})
if maketransparent then
local t1=BetterTween(Block_1,speed,{Transparency=0})
t1:Play()
end
t:Play()
t2:Play()
t.Completed:Wait()
Block_1:Destroy()
end
end)


end

function sphere(type,speed,startsize,endsize,pos,col,starttransparency,maketransparent,ref)
if outline==nil then outline=false end
if maketransparent==nil then maketransparent=false end
if ref==nil then ref=1 end
local type = type
local char=scriptfolder
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local Sphere_23=i("MeshPart", char)
Sphere_23.Name="Sphere"
Sphere_23.MeshId="rbxassetid://482906818"
Sphere_23.Anchored=true
Sphere_23.CanCollide=false
Sphere_23.CanQuery=false
Sphere_23.CanTouch=false
Sphere_23.Transparency=1
Sphere_23.Reflectance=ref
Sphere_23.Color=col
Sphere_23.Material=Enum.Material.Neon
Sphere_23.CFrame=pos
Sphere_23.CastShadow=false
Sphere_23.Massless=true
Sphere_23.Material=Enum.Material.Neon
Sphere_23.TextureID=""
Sphere_23.DoubleSided=false
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)
end
local speed=1.5/speed
tspawn(function()
if type=="Out" then 
Sphere_23.Transparency=starttransparency
Sphere_23.Size=startsize
local t=BetterTween(Sphere_23,speed,{Size=endsize})
if maketransparent then
local t1=BetterTween(Sphere_23,speed,{Transparency=1})
t1:Play()
end
t:Play()
t.Completed:Wait()
Sphere_23:Destroy()
elseif type=="In" then 
Sphere_23.Transparency=starttransparency
Sphere_23.Size=endsize
local t=BetterTween(Sphere_23,speed,{Size=startsize})
if maketransparent then
local t1=BetterTween(Sphere_23,speed,{Transparency=0})
t1:Play()
end
t:Play()
t.Completed:Wait()
Sphere_23:Destroy()
end

end)


end


local fds
local Kfkfk=true
fds=game.Players.LocalPlayer.CharacterAdded:Connect(function()
if not Running then 
fds:Disconnect() 
Kfkfk=false
end
Kfkfk=false
wait() 
Kfkfk=true
end)

--// Main Function that does things
tspawn(function()
local up
--local obj=game.Players.LocalPlayer.Character:FindFirstChild(Head)
up=game:GetService("RunService").RenderStepped:Connect(function()
if not Running then 
for _, v in ipairs(ws:GetChildren()) do 
if v.Name=="CamFocus" or v.Name=="BBG" then 
v:Destroy()
end
end
up:Disconnect()
else 
pcall(function()
for _,s in next,swords do
if lp.Character:FindFirstChild(s) then 
local sw=lp.Character:FindFirstChild(s).Handle
if not sw:FindFirstChildOfClass("Trail") then 
local att0=i("Attachment")
local att1=i("Attachment")
local trail=i("Trail")

insSet(att0,"Position",v3(0,-2.4,3));insSet(att0,"Parent",sw)
insSet(att1,"Position",v3(0,.5,-.5));insSet(att1,"Parent",sw)
insSet(trail,"Texture","rbxassetid://2108945559");insSet(trail,"Attachment0",att0);insSet(trail,"Attachment1",att1);insSet(trail,"LightEmission",0.5);insSet(trail,"Transparency",ns(0));insSet(trail,"Lifetime",0.6);insSet(trail,"WidthScale",ns(1,0));insSet(trail,"Parent",sw);insSet(trail,"Brightness",10);insSet(trail,"Color",cs({csk(0,pcolor.Value),csk(1,scolor.Value)}))
end
end
end
end)
pcall(function()
for _,s in next,swords do
if lp.Character:FindFirstChild(s) then 
local sw=lp.Character:FindFirstChild(s).Handle
if  sw:FindFirstChildOfClass("Trail")  then 

insSet(sw:FindFirstChildOfClass("Trail"),"Color",cs({csk(0,pcolor.Value),csk(1,scolor.Value)}))

end
end
end
end)


pcall(function()
if not Kfkfk then 
workspace.CurrentCamera.CameraSubject=humanoid
else
workspace.CurrentCamera.CameraSubject=humanoid
end
end)
--local Head=FindPartByMesh(HTarget)
if ws:FindFirstChild("CamFocus") then
ws:FindFirstChild("CamFocus").Anchored=true
if head then
pcall(function()
if Kfkfk then
if not head:FindFirstChild("Lol") then 
local wel=Instance.new("Weld",head)
wel.Part0=ws:FindFirstChild("CamFocus")
wel.Part1=head
wel.Name="Lol"
for _=1,10 do
wel.Part1=ws:FindFirstChild("CamFocus")
wait(.01)
--print(wel.Part1)
end
for _=1,10 do
wel.Part1=head
wait(.01)
--print(wel.Part1)
end
wel.Part1=head
end
end
end)
else 
pcall(function()
workspace.CurrentCamera.CameraSubject=head
ws:FindFirstChild("CamFocus").Position=head
end)
end 




pcall(function()
for _,v in ws:FindFirstChild("CamFocus"):GetChildren() do 
if v:IsA("Attachment") and v.Name~="TitleAttachment" then 
v:Destroy()
end
end
end)
pcall(function()
for _,v in ws:FindFirstChild("CamFocus"):GetChildren() do 
if v:IsA("Weld") then 
v:Destroy()
end
end
end)
else
CreatePart(ws,1,0,"Neon",c3(0,0,0),v3(.1,.1,.1),"CamFocus")
end
end
end)
end)


--// BillboardGui
local BBGAttachment=Instance.new("Attachment", head)
BBGAttachment.CFrame=cf()
BBGAttachment.Name="TitleAttachment"
local bilguit=Instance.new("BillboardGui", BBGAttachment)
bilguit.Adornee=nil
bilguit.LightInfluence=0
bilguit.AlwaysOnTop=false
--bilguit.MaxDistance=100
bilguit.Name="Overhead"
bilguit.Size=UDim2.new(20, 0, 4,0)
bilguit.StudsOffset=Vector3.new(0, 2, 0)
bilguit.StudsOffsetWorldSpace=v3(0,8,0)
local modet=Instance.new("TextLabel", bilguit)
modet.Size=UDim2.new(2, 0, 1.3, 0)
modet.Position=UDim2.new(-.5, 0, -.15, 0)
modet.TextSize=25
modet.ZIndex=100000000000
modet.TextScaled=true
modet.TextTransparency=0
modet.BackgroundTransparency=1 
modet.TextStrokeTransparency=0
modet.FontFace=Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
modet.TextStrokeColor3=Color3.new(0,1,1)
modet.TextColor3=Color3.new(1,1,1)
modet.Text=" "
modet.Name="ModeText"
modet.Visible=BBGVisibilty
BBGAttachment.Parent=head



--// Get the PlaybackLoudness 
local Loudness=sound.PlaybackLoudness







--// API for Loading VFX files
function VFXApi(Asset, FloorPos, autorot)
Asset = tostring(Asset)

if autorot == nil then autorot = true end
if FloorPos == nil then FloorPos = 1 end

-- Disconnect previous connection
if VFXPostConn then
VFXPostConn:Disconnect()
VFXPostConn = nil
end

-- Destroy previous asset ONLY
if ActiveVFX then
local old = scriptfolder:FindFirstChild(ActiveVFX.."Assets")
if old then
old:Destroy()
end
end

if Asset == "ClearFX" then
ActiveVFX = nil
return
end

ActiveVFX = Asset

Global.Flooring=rootpart1 
Global.Cont=scriptfolder 
Global.Loud=sound
Global.im2=AnarchyMainUI["SC_Blur_15"]
Global.MusicPlayer=MusicPlayer
Global.rootpart1=rootpart1
Global.rootpart=rootpart
Global.insSet=insSet
Global.head=head
Global.torso=torso
Global.wave1=wave1
Global.wave2=wave2
Global.wave3=wave3
Global.wave4=wave4
Global.block=block
Global.block1=block1
Global.sphere1=sphere1
Global.blockmoveup=blockmoveup
Global.sphere=sphere
Global.square=square
Global.Extras={
  Head=head,
  Torso=torso,
  Larm=leftarm,
  Rarm=rightarm,
  Lleg=leftleg,
  Rleg=rightleg,
  pcolor=pcolor,
  scolor=scolor,
  AssstName=Asset,
}

local VFXFolder = Name.." Assets/VFX"
local path = VFXFolder.."/"..Asset..".lua"

if not isfolder(VFXFolder) then
makefolder(VFXFolder)
end

if not isfile(path) then
pcall(function()
writefile(path,
game:HttpGet(
"https://raw.githubusercontent.com/Solary-3/Scripts/Audios-1/"..Asset..".lua"
)
)
end)
end
 tspawn(function()
pcall(function()
writefile(path,
game:HttpGet(
"https://raw.githubusercontent.com/Solary-3/Scripts/Audios-1/"..Asset..".lua"
)
)
end)
end)



if isfile(path) then
pcall(function()
loadstring(readfile(path))()
end)
end


VFXPostConn = rus.PostSimulation:Connect(function()
if not Running then return end
if Mode ~= ActiveVFX then
pcall(function()
local f = scriptfolder:FindFirstChild(ActiveVFX.."Assets")
if f then
f:Destroy()
end
ActiveVFX = nil
VFXPostConn:Disconnect()
VFXPostConn = nil
end)
return
end

PosRoot(FloorPos, autorot)
end)
end

--VFXApi("TestSubject")

local Retro=0 
function RetroAnimation(targetmode,Animation) 
if Mode==targetmode then
Retroify=true

tspawn(function()
Animation()
PosRoot(1,true)
end)
else 
--PosRoot(0)
Retroify=false
end
end


AnarchyMainUI["SC_MusicDurScale_2"]["Position"] = UDim2.new(0, 0, 0.965, 0); -- Bottom
AnarchyMainUI["Frame_1a"]["Position"] = UDim2.new(0.42949, 0, 0, -20); -- Top

local RotatedUI=false
function MakeUIAnimated(botpos, toppos, botrot, toprot, makewholeuirotated, rotation,speed)
if makewholeuirotated == nil then makewholeuirotated = false end
if speed == nil then speed = .1 end
if IsHidden then
AnarchyMainUI["SC_MusicDurScale_2"]["Position"] = u2(0, 0, 0.9649999737739563, 20) + botpos
else
AnarchyMainUI["SC_MusicDurScale_2"]["Position"] = UDim2.new(0, 0, 0.965, 0) + botpos
end
AnarchyMainUI["SC_MusicDurScale_2"]["Rotation"] = botrot
AnarchyMainUI["Frame_1a"]["Position"] = UDim2.new(0.42949, 0, 0, -20) + toppos
AnarchyMainUI["Frame_1a"]["Rotation"] = toprot
if makewholeuirotated then
RotatedUI=true
tspawn(function()
while math.abs(FSCREEN.Rotation - rotation) > 0.01 and RotatedUI do
if not RotatedUI then break end
FSCREEN.Rotation = FSCREEN.Rotation + (rotation - FSCREEN.Rotation) * speed
swait()
end
FSCREEN.Rotation = rotation
end)
end
end

function ReturnOldUIPos()
if IsHidden then
AnarchyMainUI["SC_MusicDurScale_2"]["Position"]=u2(0, 0, 0.9649999737739563, 20)	
else 
AnarchyMainUI["SC_MusicDurScale_2"]["Position"] = UDim2.new(0, 0, 0.965, 0)
end
AnarchyMainUI["Frame_1a"]["Position"] = UDim2.new(0.42949, 0, 0, -20)
RotatedUI=false
AnarchyMainUI["SC_MusicDurScale_2"]["Rotation"]=0
AnarchyMainUI["Frame_1a"]["Rotation"]=0
tspawn(function()
while math.abs(FSCREEN.Rotation - 0) > 0.01 and RotatedUI do
if not RotatedUI then break end
FSCREEN.Rotation = FSCREEN.Rotation + (0 - FSCREEN.Rotation) * .075
swait()
end
FSCREEN.Rotation = 0
end)
end


--// Recolor And Rename Function 
function ChangeAndRecolor(txt, usefontface, font, col1, col2, usergb,purergb,rgbval,rgbval1,dontaffecttxtcol)
if usergb==nil then usergb=false end
if dontaffecttxtcol==nil then dontaffecttxtcol=false end
if purergb==nil then purergb=false end
if rgbval==nil then rgbval=1 end
if rgbval1==nil then rgbval1=1 end
pcolor.Value=col1
scolor.Value=col2

modelabel.Value=tostring(txt)

Token+=1
modet.Text=supper(AnarchyMainUI["PC_ActualModeLabell_5"].Text)
AnarchyMainUI["SC_ModeText_1c"].Text=modelabel.Value

pl.Color=pcolor.Value

--// Fonts
if usefontface then
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") then
v.FontFace=font
end
end
modet.FontFace=font
else
modet.Font=font

for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") then
v.Font=font
end
end
end

local Tk=Token

--// Disconnect Things
if IsRendering1 then
IsRendering1:Disconnect()
IsRendering1=nil
end
if K then 
K:Disconnect()
K=nil
end
--// RGB 
if usergb then
IsRendering1=PostSimulation:Connect(function()
if Tk~=Token or not Running then 
IsRendering1:Disconnect()
IsRendering1=nil
return
end 

local currentrgb=Color3.fromHSV((tick()*.075)%1,1,rgbval)
local currentrgb1=Color3.fromHSV((tick()*.075)%1,1,rgbval1)
if purergb then

scolor.Value=currentrgb
pcolor.Value=currentrgb1
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("ImageLabel") and v.Name:sub(1,#"PC")=="PC" then
v.ImageColor3=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIStroke") and v.Name:sub(1,#"SC")=="SC" then
v.Color=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIStroke") and v.Name:sub(1,#"PC")=="PC" then
v.Color=col1
end
end
pl.Color=currentrgb
AnarchyMainUI["Stretch_Frame_14"].BackgroundColor3=currentrgb1
AnarchyMainUI["SC_Blur_15"].ImageColor3=currentrgb
AnarchyMainUI["SC_MusicDurScale_2"].BackgroundColor3=currentrgb1
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("ImageLabel") and v.Name:sub(1,#"SC")=="SC" then
v.ImageColor3=currentrgb1
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") and v.Name:sub(1,#"SC")=="SC" then
v.TextColor3=currentrgb1
v.TextStrokeColor3=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") and v.Name:sub(1,#"PC")=="PC" then
v.TextColor3=currentrgb1
v.TextStrokeColor3=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{ColorSequenceKeypoint.new(0.000, currentrgb1),ColorSequenceKeypoint.new(0.698, currentrgb1),ColorSequenceKeypoint.new(1.000, currentrgb)};
end
end
modet.TextColor3=currentrgb1
modet.TextStrokeColor3=currentrgb
pcall(function()
for _,c in lp.Character:GetDescendants() do
if c:IsA("Trail") then 
c.Color=cs({
  csk(0,currentrgb1),
  csk(0,currentrgb),
})
end
end
end)
pcall(function()
for _,v in frame:GetChildren() do 
if v:IsA("Frame") then 
v.BorderColor3=currentrgb1
end
end
end)
pcall(function()
for _,v in lolframe:GetChildren() do 
if v:IsA("Frame") then 
v.BorderColor3=currentrgb1
end
end
end)
pcall(function()
for _,v in frame:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, currentrgb1),
  ColorSequenceKeypoint.new(.75, currentrgb),
  ColorSequenceKeypoint.new(1,currentrgb1)
}
end
end
end)
pcall(function()
for _,v in frame:GetDescendants() do
if v:IsA("UIStroke") then
v.Color=currentrgb1
end
end
end)
pcall(function()
for _,v in lolframe:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, currentrgb1),
  ColorSequenceKeypoint.new(.25, currentrgb),
  ColorSequenceKeypoint.new(1,currentrgb1)
}
end
end
end)
pcall(function()
for _,v in lolframe:GetDescendants() do
if v:IsA("UIStroke") then
v.Color=currentrgb1
end
end
end)
else
scolor.Value=currentrgb
pcolor.Value=col1
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("ImageLabel") and v.Name:sub(1,#"PC")=="PC" then
v.ImageColor3=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIStroke") and v.Name:sub(1,#"SC")=="SC" then
v.Color=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIStroke") and v.Name:sub(1,#"PC")=="PC" then
v.Color=col1
end
end
pl.Color=currentrgb
AnarchyMainUI["Stretch_Frame_14"].BackgroundColor3=col2
AnarchyMainUI["SC_Blur_15"].ImageColor3=currentrgb
AnarchyMainUI["SC_MusicDurScale_2"].BackgroundColor3=col2
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("ImageLabel") and v.Name:sub(1,#"SC")=="SC" then
v.ImageColor3=col1
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") and v.Name:sub(1,#"SC")=="SC" then
v.TextColor3=col1
v.TextStrokeColor3=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") and v.Name:sub(1,#"PC")=="PC" then
v.TextColor3=col2
v.TextStrokeColor3=currentrgb
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{ColorSequenceKeypoint.new(0.000, col1),ColorSequenceKeypoint.new(0.698, col1),ColorSequenceKeypoint.new(1.000, currentrgb)};
end
end
modet.TextColor3=col1
modet.TextStrokeColor3=currentrgb
pcall(function()
for _,c in lp.Character:GetDescendants() do
if c:IsA("Trail") then 
c.Color=cs({
  csk(0,col1),
  csk(0,currentrgb),
})
end
end
end)
pcall(function()
for _,v in frame:GetChildren() do 
if v:IsA("Frame") then 
v.BorderColor3=col1
end
end
end)
pcall(function()
for _,v in lolframe:GetChildren() do 
if v:IsA("Frame") then 
v.BorderColor3=col1
end
end
end)
pcall(function()
for _,v in frame:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, col2),
  ColorSequenceKeypoint.new(.75, currentrgb),
  ColorSequenceKeypoint.new(1,col1)
}
end
end
end)
pcall(function()
for _,v in frame:GetDescendants() do
if v:IsA("UIStroke") then
v.Color=col2
end
end
end)
pcall(function()
for _,v in lolframe:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, col1),
  ColorSequenceKeypoint.new(.25, currentrgb),
  ColorSequenceKeypoint.new(1,col2)
}
end
end
end)
pcall(function()
for _,v in lolframe:GetDescendants() do
if v:IsA("UIStroke") then
v.Color=col2
end
end
end)
end
end)



else
if IsRendering1 then
IsRendering1:Disconnect()
IsRendering1=nil
end
if K then
K:Disconnect()
K=nil
end
modet.TextStrokeColor3=col2
if dontaffecttxtcol==false then
modet.TextColor3=col1
else 
modet.TextColor3=rgb(255,255,255)
end
pcall(function()
for _,c in lp.Character:GetDescendants() do
if c:IsA("Trail") then 
c.Color=cs({
  csk(0,col1),
  csk(0,col2),
})
end
end
end)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("ImageLabel") and v.Name:sub(1,#"PC")=="PC" then
v.ImageColor3=col2
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIStroke") and v.Name:sub(1,#"SC")=="SC" then
v.Color=col2
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIStroke") and v.Name:sub(1,#"PC")=="PC" then
v.Color=col1
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("ImageLabel") and v.Name:sub(1,#"SC")=="SC" then
v.ImageColor3=col1
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") and v.Name:sub(1,#"SC")=="SC" then
v.TextColor3=col1
v.TextStrokeColor3=col2
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("TextLabel") and v.Name:sub(1,#"PC")=="PC" then
v.TextColor3=col2
v.TextStrokeColor3=col1
end
end
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{ColorSequenceKeypoint.new(0.000, col1),ColorSequenceKeypoint.new(0.698, col1),ColorSequenceKeypoint.new(1.000, col2)};
end
end

AnarchyMainUI["Stretch_Frame_14"].BackgroundColor3=col2
AnarchyMainUI["SC_Blur_15"].ImageColor3=col1
AnarchyMainUI["SC_MusicDurScale_2"].BackgroundColor3=col2

pcall(function()
for _,v in frame:GetChildren() do 
if v:IsA("Frame") then 
v.BorderColor3=col1
end
end
end)
pcall(function()
for _,v in lolframe:GetChildren() do 
if v:IsA("Frame") then 
v.BorderColor3=col1
end
end
end)
pcall(function()
for _,v in frame:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, col2),
  ColorSequenceKeypoint.new(.75, col2),
  ColorSequenceKeypoint.new(1,col1)
}
end
end
end)
pcall(function()
for _,v in frame:GetDescendants() do
if v:IsA("UIStroke") then
v.Color=col2
end
end
end)
pcall(function()
for _,v in lolframe:GetDescendants() do
if v:IsA("UIGradient") then
v.Color=ColorSequence.new{
  ColorSequenceKeypoint.new(0.000, col1),
  ColorSequenceKeypoint.new(.25, col2),
  ColorSequenceKeypoint.new(1,col2)
}
end
end
end)
pcall(function()
for _,v in lolframe:GetDescendants() do
if v:IsA("UIStroke") then
v.Color=col2
end
end
end)
end
end


function RemoveAttachment()
local s=SWAtt1
s.Part1=getPart("Torso")
s.C0=cf(-1,0,0)*angles(rad(-50),rad(90),rad(0))
s.C1=cf_0
local s1=SWAtt2
s1.C0=cf(-1,0,0)*angles(rad(-50),rad(90),rad(0))
s1.Part1=getPart("Torso")
s1.C1=cf_0
local s2=SWAtt3
s2.C0=cf(-1,0,0)*angles(rad(-50),rad(90),rad(0))
s2.Part1=getPart("Torso")
s2.C1=cf_0
local s3=SWAtt4
s3.C0=cf(-1,0,0)*angles(rad(-50),rad(90),rad(0))
s3.C1=cf_0
s3.Part1=getPart("Torso")
end









--// Fetch Modes
function getMode(modeName)
for i,v in next, Modes do
if(v.Name==modeName)then
return v
end
end
return Modes[1]
end 




local WaitForRemove=false
local Deboun=false
local OverrideWingAnim=false
local ActiveSpecial=nil
function Reset()
Deboun=false
SpecialAnimRThingy=0
OverrideWingAnim=false
ActiveSpecial=nil
end

local BasicAnimChange=0
local lastclock=osclock()
function changeMode(modeName)
Reset()
ReturnOldUIPos()
RotatedUI=false
OverrideAnimation=false
lastclock=osclock()

IsSitting=false
BasicAnimChange=0
deltaTime=olddt
OverrideAnimation=false
LastTick=tick()
AnimStyles=0
tspawn(function()
for _=0,3 do
WhatIsThis()
ReturnOldUIPos()
RotatedUI=false
WaitForRemove=true
Ring.Part1=wingPart1
Extra_Part1.Part1=Torso
Ring1.Part1=wingPart2
Extra_Part2.Part1=Torso
Ring.C0=cf_0*angles(3.141592653589793+0,0,-3.141592653589793+0)
Ring1.C0=cf_0*angles(3.141592653589793+0,0,-3.141592653589793+0)
for _,v in next,statics do
insSet(v,"Visible",false)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))
end
RemoveAttachment()
twait()
end
repeat WaitForRemove=false until WaitForRemove==false
end)
tspawn(function()
camoff.Value=cf_0
local info=getMode(modeName)
Mode=info.Name;
AnimType=info.WingAnim or "Iviriza"
if not SmoothCamera then 
setHipHeight(info.HHeight)
end
Interface["Current Music_12"]["Text"] = "Music Playing: "..info.Author.." - "..info.MusicTitle
AnarchyMainUI["PC_MusicName_13"]["Text"]=info.MusicTitle
AnarchyMainUI["PC_Author_12"]["Text"]=info.Author
AnimStyles=0
AnarchyMainUI["PC_ActualModeLabell_5"].Text=supper(info.ActualName)
MusicPlayer.TimePosition=0 
if info.Music=="None" then
MusicPlayer:Stop()
sound:Stop()
sound.TimePosition=0 
MusicPlayer.TimePosition=0 
else
MusicPlayer.Asset=Asset(info.Music..".mp3")
MusicPlayer:Play()

sound.SoundId=Asset(info.Music..".mp3")
sound:Play()
sound.TimePosition=0 
MusicPlayer.TimePosition=0 


end
end)
tspawn(function()
VFXApi("ClearFX")

twait()
symbolizeBlink(rootpart,0,2092248396,pcolor.Value,5,3,1,847061203,rootpart,true,10,1)
symbolizeBlink(rootpart,0,2092248396,scolor.Value,4,0,0,0,rootpart,true,-5,1)
end)
end










--// Camera Bobbing
local RunService=game:GetService("RunService")
local LoudnessSmoothing=0
local BobbingIntensity=0.25
local llllll
llllll=PostSimulation:Connect(function()
if Running then
local target=sound.PlaybackLoudness
LoudnessSmoothing=LoudnessSmoothing + (target - LoudnessSmoothing) * BobbingIntensity
local bob=math.clamp(LoudnessSmoothing / 100, 0, 30)
ws.CurrentCamera.FieldOfView =70-bob*1.5
else 
ws.CurrentCamera.FieldOfView =70
llllll:Disconnect()
end
end)







--// Make Music Seeking thing
local bar=AnarchyMainUI["SC_MusicDurScale_2"]
local fill=AnarchyMainUI["Stretch_Frame_14"]
local audio=AudioPlayer

local dragging=false
local activeInput=nil
local LastTimePos=0

local lolupdate 

function Percent(x)
local barX=bar.AbsolutePosition.X
local barW=bar.AbsoluteSize.X
return math.clamp((x - barX) / barW, 0, 1)
end


Seek0=bar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
LastTimePos=sound.TimePosition
dragging=true
activeInput=input

local percent=Percent(input.Position.X)
fill.Size=u2(percent,0,fill
  .Size.Y.Scale,fill.Size.Y.Offset)
end
end)

Seek1=uis.InputChanged:Connect(function(input)
if dragging and input == activeInput then
local percent=Percent(input.Position.X)
fill.Size=u2(percent,0,0,fill.Size.Y.Offset)
LastTimePos=sound.TimePosition
end
end)

Seek2=uis.InputEnded:Connect(function(input)
if dragging and input == activeInput then
dragging=false
activeInput=nil
local percent=Percent(input.Position.X)

if audio.TimeLength > 0 then
Reset()
sound.TimePosition=percent * audio.TimeLength
audio.TimePosition=percent * audio.TimeLength
end
end
end)

function SpecialAnimations(current,start,dur,mode,change,override,default)
if IsSitting then return end
tspawn(function()
if not Running then return end
if ActiveSpecial and Mode ~= ActiveSpecial then
Reset()
return
end
if Mode ~= mode then
return
end
if override == nil then override=false end
if default==nil then default=false end
--if override1==nil then override1=false end

if current<=dur and current>=dur then
Reset()
end
if current >= start and current <= dur and not Deboun then
Deboun=true
ActiveSpecial=mode
OverrideWingAnim=override
SpecialAnimRThingy=change
elseif current >= dur and Deboun and ActiveSpecial == mode then
Deboun=false
OverrideWingAnim=false
if not default then
SpecialAnimRThingy=0
end
end
end)
end



local Debounce=false


local Txts={
  "H A R M O  I OU S』",
  "『E V E R S T I L L』", 
  "『A B S O L U T E』", 
  "『I M M U T A B L E』", 
  "『U L T I M A T E』", 
  "『E T E RN A L』", 
  "『I N F I N I T E』", 
  "『B A L A N C ED』",
  "『E Q U I L I B R I U M』",
  "『E Q U A L』",
  "『I N D I V I S I B L E』",
  "『S T A B L E』",
  "『U N I T E D』",
  "『E V E N』",
}
function EquinoxTexts()
if not Running then return end
local TweenService=game.TweenService
local Tinfo=TweenInfo.new
function Tween(obj, speed, whattype, anim,type)
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, type, Enum.EasingDirection.Out)
if whattype =="pos" then
return TweenService:Create(obj, hii,{Position=anim}):Play()
elseif whattype =="size" then
return TweenService:Create(obj, hii,{Size=anim})
elseif whattype =="bt" then
return TweenService:Create(obj, hii,{BackgroundTransparency=anim}):Play()
elseif whattype =="trans" then
return TweenService:Create(obj, hii,{Transparency=anim}):Play()
elseif whattype=="rot" then
return TweenService:Create(obj, hii,{Rotation=anim}):Play()
end
end
local Deb=game:GetService("Debris")
local mrandom=mrandom

 function func(arg1) 
return Vector3.new(mrandom(-arg1 * 10, arg1 * 10) / 10, mrandom(-arg1 * 10, arg1 * 10) / 10, mrandom(-arg1 * 10, arg1 * 10) / 10)
end
local clone=scriptfolder:WaitForChild("EulogyAssets"):Clone()
local bbg=clone:WaitForChild("Bill")
local txtclone=bbg:WaitForChild("Splash")
local randomv3=bbg.StudsOffset+v3(mrandom(-20,5),mrandom(5,10),mrandom(-15,-10))
local clonestk=txtclone:WaitForChild("TxtStroke")
bbg.Parent=rootpart1
bbg.Adornee=rootpart1
bbg.StudsOffset=randomv3
bbg.Brightness=10
local gj
clonestk.Thickness=0
local rancol=mrandom(1,2)
local val=Instance.new("NumberValue")
val.Value=1
if rancol==1 then
txtclone.TextColor3=rgb(255,255,255)
clonestk.Color=rgb(0,0,0)
gj=1
elseif rancol==2 then
gj=-1
txtclone.TextColor3=rgb(0,0,0)
clonestk.Color=rgb(255,255,255)
end
txtclone.Rotation=mrandom(-45,45)
txtclone.Position=UDim2.fromScale(-5,10)
txtclone.Text=Txts[mrandom(1,#Txts)]
txtclone.TextScaled=false
--txtclone.AutomaticSize="X"
local txtran=mrandom(1,8)

tspawn(function()
TweenService:Create(txtclone, Tinfo(0.5,Enum.EasingStyle.Quart),{
  Position=UDim2.fromScale(mrandom(-5.5,-1.5),mrandom(-1.75,-1));
  Size=UDim2.fromScale(7.5,1.5);
  Rotation=mrandom(-20,20);
}):Play()
TweenService:Create(val, Tinfo(1.5,Enum.EasingStyle.Quart),{
  Value=0;
}):Play()
local lol
local res=time()

lol=game:GetService("RunService").Heartbeat:Connect(function()
if bbg and bbg.Parent then 
bbg.StudsOffsetWorldSpace=randomv3+v3(sin((time() - res)*6*gj),sin((time()-res)*8*gj),sin((time()-gj)*4*gj))+func(val.Value)
else
lol:Disconnect()
end
end)
wait(1)
Deb:AddItem(bbg,1.5)
TweenService:Create(txtclone, Tinfo(0.5,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{
  Size=UDim2.fromScale(1,.5);
  Position=UDim2.fromScale(mrandom(-1,1),mrandom(-1,1));
  Transparency=1
}):Play()
TweenService:Create(bbg, Tinfo(1.5,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{
  Brightness=1
}):Play()
TweenService:Create(clonestk, Tinfo(2.5,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{
  Thickness=2.5
}):Play()
txtclone.TextScaled=false
TweenService:Create(txtclone, Tinfo(1.25,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{
  Transparency=1
}):Play()

end)
end

function EquinoxCloneBars()
if not Running then return end
local FrameFolders=Instance.new("Folder",scriptfolder:FindFirstChild("EulogyAssets"))
FrameFolders.Name="Frames"
local TopFrameBars=scriptfolder:FindFirstChild("EulogyAssets"):WaitForChild("TopFrame"):FindFirstChild("Frame")
local TopFrame=scriptfolder:FindFirstChild("EulogyAssets"):WaitForChild("TopFrame")
local BottomFrameBars=scriptfolder:FindFirstChild("EulogyAssets"):WaitForChild("BottomFrame"):FindFirstChild("Frame")
local BottomFrame=scriptfolder:FindFirstChild("EulogyAssets"):WaitForChild("BottomFrame")

TopFrame.Position=UDim2.new(-.01,0,0,-50)
BottomFrame.Position=u2(.0715,10,.8,0)
BottomFrame.Rotation=180
tspawn(function()
for i=1,20 do
local Barclone=TopFrameBars:Clone()
Barclone.Size=u2(.05,0,1,0)
Barclone.BackgroundTransparency=1 
Barclone.Parent=TopFrame
Barclone.Name=i
end
end)
tspawn(function()
for i=1,20 do 
local Barclone1=BottomFrameBars:Clone()
Barclone1.Size=u2(.05,0,1,0)
Barclone1.BackgroundTransparency=1 
Barclone1.Parent=BottomFrame 
Barclone1.Name=i
end
BottomFrame.Parent=FrameFolders
TopFrame.Parent=FrameFolders
end)
end

local EulogyBarsFolder=Instance.new("Folder",basgui)
function EquinoxMainBars()
if not Running then return end
EulogyBarsFolder.Name="BarFrames"
local Deb=game:GetService("Debris")
local FrameFolder=scriptfolder:FindFirstChild("EulogyAssets"):FindFirstChild("Frames")
local GUIMain=basgui:WaitForChild("BarFrames")
local FolClone=FrameFolder:Clone()
FolClone.Parent=GUIMain

for _, v in GUIMain:GetDescendants() do
if v:IsA("ImageLabel")and v.ImageTransparency==0 then
local variable
variable=UDim2.fromScale(1, mrandom(50, 200) / 200)
v.Size=variable

if mrandom(1, 2) == 1 then 
variable=Color3.fromRGB(0, 0, 0)
else 
variable=Color3.fromRGB(255, 255, 255)
end
v.ImageColor3=variable
variable=game:GetService("TweenService")
local _={
Size=UDim2.fromScale(1, 0);
ImageTransparency=1;
}
variable=variable:Create(v, TweenInfo.new(1.5, Enum.EasingStyle.Quart), _)
variable:Play()
end
Deb:AddItem(FolClone,1)
end

end



function EulogyAssets()
if not Running then return end
if scriptfolder:FindFirstChild("EulogyAssets") then return end
--//Stroke 
wait(.2)
local nr=NumberRange.new
local EquinoxFolder=Instance.new("Folder",scriptfolder)
EquinoxFolder.Name="EulogyAssets"
EquinoxFolder:SetAttribute("VFX",true)
local stk=Instance.new("UIStroke",modet)
stk.Color=rgb(255,255,255)
stk.Thickness=1
local gr1=Instance.new("UIGradient",modet)
gr1.Offset=v2(-.1,0)
gr1.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(.225,rgb(100,100,100)),
  csk(.322,rgb(255,255,255)),
  csk(.403,rgb(0,0,0)),
  csk(.465,rgb(255,255,255)),
  csk(.488,rgb(0,0,0)),
  csk(.501,rgb(0,0,0)),
  csk(.64,rgb(0,0,0)),
  csk(.694,rgb(0,0,0)),
  csk(.747,rgb(0,0,0)),
  csk(.784,rgb(0,0,0)),
  csk(.941,rgb(100,100,100)),
  csk(1,rgb(0,0,0))
})
gr1.Rotation=87
gr1.Name="Grad1"
gr1.Enabled=true
local gr2=Instance.new("UIGradient",stk)
gr2.Offset=v2(.25,0)
gr2.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(.289,rgb(100,100,100)),
  csk(.374,rgb(0,0,0)),
  csk(.431,rgb(150,150,150)),
  csk(.497,rgb(0,0,0)),
  csk(.514,rgb(0,0,0)),
  csk(.668,rgb(100,100,100)),
  csk(.765,rgb(255,255,255)),
  csk(.784,rgb(100,100,100)),
  csk(.941,rgb(0,0,0)),
  csk(1,rgb(255,255,255)),
})
gr2.Rotation=87 
gr2.Name="Grad2"
gr2.Enabled=true

--//Assets 
local bbg2=Instance.new("BillboardGui",EquinoxFolder)
bbg2.Size=u2(20,0,20,0)
bbg2.Adornee=nil
bbg2.Name="Bill"
bbg2.StudsOffsetWorldSpace=v3(0,0,0)
bbg2.StudsOffset=Vector3.new(7.5, -10, 8.5)
bbg2.StudsOffsetWorldSpace=Vector3.new(0, 0, -15)
local lbl=Instance.new("TextLabel",bbg2)
lbl.Name="Splash"
lbl.Text=" "
lbl.TextColor3=rgb(255,255,255)
lbl.Size=u2(7,0,1.5,0)
lbl.Position=u2(0,0,0,0)
lbl.BackgroundTransparency=1
lbl.FontFace=Font.new([[rbxassetid://12187376739]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
lbl.TextSize=15
lbl.TextScaled=false
local stk0=Instance.new("UIStroke",lbl)
stk0.Name="TxtStroke"
stk0.Color=rgb(255,255,255)
stk0.Thickness=1

Asset("star.png")


--// Effects 
local att1=Instance.new("Attachment",EquinoxFolder)
att1.Name="Black Pulse"
att1.CFrame=cf(0,-1,0)
local sq1=Instance.new("ParticleEmitter",att1)
sq1.Name="Square"
sq1.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0)),
})

sq1.Brightness=8 
sq1.Size=ns({
  nsk(0,0),
  nsk(0.055,26.763),
  nsk(0.120,40),
  nsk(0.234,48),
  nsk(0.39,52),
  nsk(0.612,54),
  nsk(1,56),
})
sq1.Texture="rbxassetid://108130357346045"
sq1.Orientation="VelocityPerpendicular"
sq1.Transparency=ns({
  nsk(0,0),
  nsk(.2,0),
  nsk(.59,.238),
  nsk(1,1),
})
sq1.Enabled=false
sq1.Lifetime=nr(.44,.44)
sq1.Rate=7
sq1.Rotation=nr(45,45)
sq1.Speed=nr(.001,.001)
sq1.SpreadAngle=Vector2.new(0,0)
sq1.EmissionDirection="Top"
sq1.FlipbookFramerate=nr(1,1)
sq1.FlipbookLayout="Grid4x4"
sq1.FlipbookMode="OneShot"
sq1:SetAttribute("EmitCount",1)
local att2=Instance.new("Attachment",EquinoxFolder)
att2.Name="White Pulse"
att2.CFrame=cf(0,4,0)
local sq2=Instance.new("ParticleEmitter",att2)
sq2.Name="Square"
sq2.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255)),
})

sq2.Brightness=8 
sq2.Size=ns({
  nsk(0,0),
  nsk(0.055,26.763),
  nsk(0.120,40),
  nsk(0.234,48),
  nsk(0.39,52),
  nsk(0.612,54),
  nsk(1,56),
})
sq2.Texture="rbxassetid://108130357346045"
sq2.Orientation="FacingCamera"
sq2.Transparency=ns({
  nsk(0,0),
  nsk(.2,0),
  nsk(.59,.238),
  nsk(1,1),
})
sq2.Enabled=false
sq2.Lifetime=nr(.44,.44)
sq2.Rate=7
sq2.Rotation=nr(45,45)
sq2.Speed=nr(.001,.001)
sq2.SpreadAngle=Vector2.new(0,0)
sq2.EmissionDirection="Top"
sq2.FlipbookFramerate=nr(1,1)
sq2.FlipbookLayout="Grid4x4"
sq2.FlipbookMode="OneShot"
sq2:SetAttribute("EmitCount",1)

local charge1att=Instance.new("Attachment",EquinoxFolder)
charge1att.Name="ParticleAttachmets"
charge1att.CFrame=cf()
local e0=Instance.new("ParticleEmitter",charge1att)
e0.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e0.Orientation="VelocityPerpendicular"
e0.Size=ns({
  nsk(0,0),
  nsk(.226,24),
  nsk(.5,33),
  nsk(1,42),
})
e0.Transparency=ns({
  nsk(0,1),
  nsk(1,.7),
  nsk(1,1),
})
e0.Texture="rbxassetid://130341645640774"
e0.Name="Shock1"
e0.EmissionDirection="Top"
e0.Enabled=false
e0.Lifetime=nr(.25,.25)
e0.Rate=7
e0.Rotation=nr(0,0)
e0.RotSpeed=nr(0,0)
e0.Speed=nr(.002,.002)
e0.SpreadAngle=v2(360,360)
e0.VelocitySpread=360
e0.FlipbookFramerate=nr(1,1)
e0.FlipbookMode="OneShot"
e0.FlipbookLayout="Grid4x4"
e0:SetAttribute("EmitCount",1)

local e1=Instance.new("ParticleEmitter",charge1att)
e1.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e1.Orientation="VelocityPerpendicular"
e1.Size=ns({
  nsk(0,0),
  nsk(.226,24),
  nsk(.5,33),
  nsk(1,42),
})
e1.Transparency=ns({
  nsk(0,1),
  nsk(1,.7),
  nsk(1,1),
})
e1.Texture="rbxassetid://130341645640774"
e1.Name="Shock2"
e1.EmissionDirection="Top"
e1.Enabled=false
e1.Lifetime=nr(.25,.25)
e1.Rate=7
e1.Rotation=nr(0,0)
e1.RotSpeed=nr(0,0)
e1.Speed=nr(.002,.002)
e1.SpreadAngle=v2(360,360)
e1.VelocitySpread=360
e1.FlipbookFramerate=nr(1,1)
e1.FlipbookMode="OneShot"
e1.FlipbookLayout="Grid4x4"
e1:SetAttribute("EmitCount",1)

local e2=Instance.new("ParticleEmitter",charge1att)
e2.Name="Impact1"
e2.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e2.Brightness=20
e2.Orientation="VelocityPerpendicular"
e2.Size=ns({
  nsk(0,0),
  nsk(.14,11.5),
  nsk(.42,18),
  nsk(1,21,.01),
})
e2.Texture="rbxassetid://18140248952"
e2.Transparency=ns({
  nsk(0,0),
  nsk(1,0),
})
e2.ZOffset=-.1
e2.Enabled=false 
e2.EmissionDirection="Top"
e2.Lifetime=nr(.4,.4)
e2.Rate=7
e2.Rotation=nr(0,0)
e2.RotSpeed=nr(0,0)
e2.Speed=nr(.002,.002)
e2.SpreadAngle=v2(360,360)
e2.VelocitySpread=360 
e2.FlipbookFramerate=nr(1,1)
e2.FlipbookLayout="Grid4x4"
e2.FlipbookMode="OneShot"
e2:SetAttribute("EmitCount",1)

local e3=Instance.new("ParticleEmitter",charge1att)
e3.Name="Impact2"
e3.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e3.Brightness=20
e3.Orientation="VelocityPerpendicular"
e3.Size=ns({
  nsk(0,0),
  nsk(.14,11.5),
  nsk(.42,18),
  nsk(1,21,.01),
})
e3.Texture="rbxassetid://18140248952"
e3.Transparency=ns({
  nsk(0,0),
  nsk(1,0),
})
e3.ZOffset=-.1
e3.Enabled=false 
e3.EmissionDirection="Top"
e3.Lifetime=nr(.4,.4)
e3.Rate=7
e3.Rotation=nr(0,0)
e3.RotSpeed=nr(0,0)
e3.Speed=nr(.002,.002)
e3.SpreadAngle=v2(360,360)
e3.VelocitySpread=360 
e3.FlipbookFramerate=nr(1,1)
e3.FlipbookLayout="Grid4x4"
e3.FlipbookMode="OneShot"
e3:SetAttribute("EmitCount",1)

local e4=Instance.new("ParticleEmitter",charge1att)
e4.Name="Impact3"
e4.Brightness=20
e4.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e4.Orientation="VelocityPerpendicular"
e4.Size=ns({
  nsk(0,0),
  nsk(.4,18),
  nsk(1,21,.1),
})
e4.Texture="rbxassetid://13800461961"
e4.Transparency=ns({
  nsk(0,.8),
  nsk(1,1),
})
e4.ZOffset=-.1 
e4.Enabled=false 
e4.Rate=7
e4.Lifetime=nr(.3,.3)
e4.EmissionDirection="Top"
e4.Rotation=nr(0,0)
e4.RotSpeed=nr(0,0)
e4.Speed=nr(.002,.002)
e4.SpreadAngle=v2(360,360)
e4.VelocitySpread=360 
e4.FlipbookFramerate=nr(1,1)
e4.FlipbookLayout="Grid4x4"
e4.FlipbookMode="OneShot"
e4:SetAttribute("EmitCount",1)

local e5=Instance.new("ParticleEmitter",charge1att)
e5.Name="Impact4"
e5.Brightness=20
e5.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e5.Orientation="VelocityPerpendicular"

e5.Size=ns({
  nsk(0,0),
  nsk(.4,18),
  nsk(1,21,.1),
})
e5.Texture="rbxassetid://13800461961"
e5.Transparency=ns({
  nsk(0,.8),
  nsk(1,1),
})
e5.ZOffset=-.1 
e5.Rate=7
e5.Enabled=false 
e5.Lifetime=nr(.3,.3)
e5.EmissionDirection="Top"
e5.Rotation=nr(0,0)
e5.RotSpeed=nr(0,0)
e5.Speed=nr(.002,.002)
e5.SpreadAngle=v2(360,360)
e5.VelocitySpread=360 
e5.FlipbookFramerate=nr(1,1)
e5.FlipbookLayout="Grid4x4"
e5.FlipbookMode="OneShot"
e5:SetAttribute("EmitCount",1)

local e6=Instance.new("ParticleEmitter",charge1att)
e6.Name="Pulse1"
e6.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e6.Brightness=15 
e6.Orientation="FacingCamera"
e6.Size=ns({
  nsk(0,0),
  nsk(.15,7),
  nsk(.3,11),
  nsk(.6,13),
  nsk(1,14),
})
e6.Texture="rbxassetid://119057920510209"
e6.Transparency=ns({
  nsk(0,0),
  nsk(1,1),
})
e6.EmissionDirection="Top"
e6.Enabled=false 
e6.Rate=7
e6.Lifetime=nr(.6,.6)
e6.Rotation=nr(0,360)
e6.RotSpeed=nr(0,0)
e6.SpreadAngle=v2(0,0)
e6.VelocitySpread=0 
e6.FlipbookFramerate=nr(1,1)
e6.FlipbookLayout="Grid4x4"
e6.FlipbookMode="OneShot"
e6:SetAttribute("EmitCount",1)

local e7=Instance.new("ParticleEmitter",charge1att)
e7.Name="Pulse2"
e7.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e7.Brightness=15 
e7.Orientation="FacingCamera"
e7.Size=ns({
  nsk(0,0),
  nsk(.15,7),
  nsk(.3,11),
  nsk(.6,13),
  nsk(1,14),
})
e7.Texture="rbxassetid://119057920510209"
e7.Transparency=ns({
  nsk(0,0),
  nsk(1,1),
})
e7.EmissionDirection="Top"
e7.Enabled=false 
e7.Rate=7
e7.Lifetime=nr(.6,.6)
e7.Rotation=nr(0,360)
e7.RotSpeed=nr(0,0)
e7.SpreadAngle=v2(0,0)
e7.VelocitySpread=0 
e7.FlipbookFramerate=nr(1,1)
e7.FlipbookLayout="Grid4x4"
e7.FlipbookMode="OneShot"
e7:SetAttribute("EmitCount",1)

local e8=Instance.new("ParticleEmitter",charge1att)
e8.Name="Pulse3"
e8.Brightness=15
e8.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e8.Orientation="VelocityPerpendicular"
--0 0 0 0.156376 9.1546 0 0.394376 15.4639 0 0.606376 17.4659 0 1 18.2 0 
e8.Size=ns({
  nsk(0,0),
  nsk(.15,9),
  nsk(.39,15),
  nsk(1,18.2),
})
e8.Texture="rbxassetid://98161445784635"
e8.Transparency=ns({
  nsk(0,.5),
  nsk(1,1),
})
e8.EmissionDirection="Top"
e8.Enabled=false
e8.Rate=7
e8.Lifetime=nr(.3,.3)
e8.Speed=nr(.001,.001)
e8.SpreadAngle=v2(180,180)
e8.VelocitySpread=180 
e8.FlipbookFramerate=nr(1,2)
e8.FlipbookLayout="Grid4x4"
e8.FlipbookMode="OneShot"
e8:SetAttribute("EmitCount",1)

local e9=Instance.new("ParticleEmitter",charge1att)
e9.Name="Pulse4"
e9.Brightness=15
e9.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e9.Orientation="VelocityPerpendicular"
--0 0 0 0.156376 9.1546 0 0.394376 15.4639 0 0.606376 17.4659 0 1 18.2 0 
e9.Size=ns({
  nsk(0,0),
  nsk(.15,9),
  nsk(.39,15),
  nsk(1,18.2),
})
e9.Texture="rbxassetid://98161445784635"
e9.Transparency=ns({
  nsk(0,.5),
  nsk(1,1),
})
e9.EmissionDirection="Top"
e9.Enabled=false
e9.Rate=7
e9.Lifetime=nr(.3,.3)
e9.Speed=nr(.001,.001)
e9.SpreadAngle=v2(180,180)
e9.VelocitySpread=180 
e9.FlipbookFramerate=nr(1,2)
e9.FlipbookLayout="Grid4x4"
e9.FlipbookMode="OneShot"
e9:SetAttribute("EmitCount",1)

local e10=Instance.new("ParticleEmitter",charge1att)
e10.Name="WhiteStarPulse"
e10.Orientation="FacingCamera"
e10.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
--0 0 0 0.156376 7.042 0 0.394376 11.8953 0 0.606376 13.4353 0 1 14 0 
e10.Size=ns({
  nsk(0,0),
  nsk(.15,7),
  nsk(.39,11),
  nsk(.6,13),
  nsk(1,14),
})
e10.Transparency=ns({
  nsk(0,0),
  nsk(1,1),
})
e10.ZOffset=3
e10.Texture=Asset("star.png")
e10.EmissionDirection="Top"
e10.Enabled=false 
e10.Lifetime=nr(.6,.6)
e10.Rate=3.5
e10.Rotation=nr(0,360)
e10.RotSpeed=nr(0,0)
e10.Speed=nr(0,0)
e10.SpreadAngle=v2(0,0)
e10.VelocitySpread=0 
e10.FlipbookFramerate=nr(1,1)
e10.FlipbookLayout="None"
e10.FlipbookMode="OneShot"
e10:SetAttribute("EmitCount",1)

local e11=Instance.new("ParticleEmitter",charge1att)
e11.Name="BlackStarPulse"
e11.Texture=Asset("star.png")
e11.Orientation="FacingCamera"
e11.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0)),
})
--0 0 0 0.156376 7.042 0 0.394376 11.8953 0 0.606376 13.4353 0 1 14 0 
e11.Size=ns({
  nsk(0,0),
  nsk(.15,7),
  nsk(.39,11),
  nsk(.6,13),
  nsk(1,14),
})
e11.Transparency=ns({
  nsk(0,0),
  nsk(1,1),
})
e11.ZOffset=4
e11.EmissionDirection="Top"
e11.Enabled=false 
e11.Lifetime=nr(.6,.6)
e11.Rate=3.5
e11.Rotation=nr(0,360)
e11.RotSpeed=nr(0,0)
e11.Speed=nr(0,0)
e11.SpreadAngle=v2(0,0)
e11.VelocitySpread=0 
e11.FlipbookFramerate=nr(1,1)
e11.FlipbookLayout="None"
e11.FlipbookMode="OneShot"
e11:SetAttribute("EmitCount",1)
--[[
local e12=Instance.new("ParticleEmitter",charge1att)
e12.Name="Star1"
e12.Brightness=15 
e12.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
--0 0 0 0.1 17.5 0 1 0 0 
e12.Orientation="FacingCamera"
e12.Size=ns({
  nsk(0,0),
  nsk(.1,17),
  nsk(1,0),
})
e12.Texture=Asset("star.png")
e12.Transparency=ns({
  nsk(0,0),
  nsk(1,0),
})
e12.ZOffset=5
e12.EmissionDirection="Top"
e12.Enabled=false 
e12.Lifetime=nr(.3,.3)
e12.Rate=7
e12.Rotation=nr(0,360)
e12.RotSpeed=nr(0,0)
e12.Speed=nr(0,0)
e12.SpreadAngle=v2(0,0)
e12.VelocitySpread=0
e12.FlipbookFramerate=nr(1,1)
e12.FlipbookLayout="None"
e12.FlipbookMode="OneShot"
e12:SetAttribute("EmitCount",1)

local e13=Instance.new("ParticleEmitter",charge1att)
e13.Name="Star2"
e13.Brightness=15 
e13.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
--0 0 0 0.1 17.5 0 1 0 0 
e13.Orientation="FacingCamera"
e13.Size=ns({
  nsk(0,0),
  nsk(.1,17),
  nsk(1,0),
})
e13.Texture=Asset("star.png")
e13.Transparency=ns({
  nsk(0,0),
  nsk(1,0),
})
e13.ZOffset=4
e13.EmissionDirection="Top"
e13.Enabled=false 
e13.Lifetime=nr(.3,.3)
e13.Rate=7
e13.Rotation=nr(0,360)
e13.RotSpeed=nr(0,0)
e13.Speed=nr(0,0)
e13.SpreadAngle=v2(0,0)
e13.VelocitySpread=0
e13.FlipbookFramerate=nr(1,1)
e13.FlipbookLayout="None"
e13.FlipbookMode="OneShot"
e13:SetAttribute("EmitCount",1)

local e14=Instance.new("ParticleEmitter",charge1att)
e14.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0)),
})
e14.Name="Stardark1"
e14.Orientation="FacingCamera"
--0 0 0 0.1 22.75 0 1 0 0 
e14.Size=ns({
  nsk(0,0),
  nsk(.1,22.75),
  nsk(1,0),
})
e14.Texture=Asset("star.png")
e14.Transparency=ns({
  nsk(0,0),
  nsk(1,0)
})
e14.ZOffset=4 
e14.EmissionDirection="Top"
e14.Enabled=false 
e14.Lifetime=nr(.3,.3)
e14.Rate=7
e14.Rotation=nr(0,360)
e14.RotSpeed=nr(0,0)
e14.Speed=nr(0,0)
e14.SpreadAngle=v2(0,0)
e14.VelocitySpread=0 
e14.FlipbookFramerate=nr(1,1)
e14.FlipbookLayout="None"
e14.FlipbookMode="OneShot"
e14:SetAttribute("EmitCount",1)

local e15=Instance.new("ParticleEmitter",charge1att)
e15.Name="Stardark2"
e15.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0)),
})
e15.Orientation="FacingCamera"
--0 0 0 0.1 22.75 0 1 0 0 
e15.Size=ns({
  nsk(0,0),
  nsk(.1,22.75),
  nsk(1,0),
})
e15.Texture=Asset("star.png")
e15.Transparency=ns({
  nsk(0,0),
  nsk(1,0)
})
e15.ZOffset=224 
e15.EmissionDirection="Top"
e15.Enabled=false 
e15.Lifetime=nr(.3,.3)
e15.Rate=7
e15.Rotation=nr(0,360)
e15.RotSpeed=nr(0,0)
e15.Speed=nr(0,0)
e15.SpreadAngle=v2(0,0)
e15.VelocitySpread=0 
e15.FlipbookFramerate=nr(1,1)
e15.FlipbookLayout="None"
e15.FlipbookMode="OneShot"
e15:SetAttribute("EmitCount",1)
]]
local e16=Instance.new("ParticleEmitter",charge1att)
e16.Name="Wind1"
e16.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e16.Orientation="VelocityPerpendicular"
--0 0 0 0.10339 14.7875 0 0.342373 28.4375 0 0.535593 32.76 0 1 36.4 0 
e16.Size=ns({
  nsk(0,0),
  nsk(.1,14.8),
  nsk(.3,28.8),
  nsk(.5,32.7),
  nsk(1,36.4),
})
e16.Texture="rbxassetid://14850595833"
e16.Transparency=ns({
  nsk(0,.2),
  nsk(1,1),
})
e16.EmissionDirection="Top"
e16.Enabled=false 
e16.Lifetime=nr(.3,.3)
e16.Rate=14 
e16.Rotation=nr(0,0)
e16.RotSpeed=nr(0,0)
e16.Speed=nr(.002,.002)
e16.SpreadAngle=v2(15,15)
e16.VelocitySpread=15 
e16.FlipbookFramerate=nr(1,1)
e16.FlipbookLayout="None"
e16.FlipbookMode="OneShot"
e16:SetAttribute("EmitCount",1)

local e17=Instance.new("ParticleEmitter",charge1att)
e17.Name="Wind2"
e17.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e17.Orientation="VelocityPerpendicular"
--0 0 0 0.10339 14.7875 0 0.342373 28.4375 0 0.535593 32.76 0 1 36.4 0 
e17.Size=ns({
  nsk(0,0),
  nsk(.1,14.8),
  nsk(.3,28.8),
  nsk(.5,32.7),
  nsk(1,36.4),
})
e17.Texture="rbxassetid://16434901408"
e17.Transparency=ns({
  nsk(0,.5),
  nsk(1,1),
})
e17.EmissionDirection="Top"
e17.Enabled=false 
e17.Lifetime=nr(.3,.3)
e17.Rate=14
e17.Rotation=nr(0,0)
e17.RotSpeed=nr(0,0)
e17.Speed=nr(.002,.002)
e17.SpreadAngle=v2(15,15)
e17.VelocitySpread=15 
e17.FlipbookFramerate=nr(1,1)
e17.FlipbookLayout="None"
e17.FlipbookMode="OneShot"
e17:SetAttribute("EmitCount",1)

local e18=Instance.new("ParticleEmitter",charge1att)
e18.Name="Lightning"
e18.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e18.Orientation="VelocityParallel"
e18.Size=ns({
  nsk(0,12.6),
  nsk(1,12.6),
})
e18.Squash=ns({
  nsk(0,0),
  nsk(1,.213,.1),
})
e18.Texture="rbxassetid://132060681192414"
e18.Transparency=ns({
  nsk(0,0),
  nsk(1,.18),
})
e18.ZOffset=3.3 
e18.EmissionDirection="Top"
e18.Enabled=false 
e18.Lifetime=nr(.11,.13)
e18.Rate=7 
e18.Rotation=nr(-996,1004)
e18.RotSpeed=nr(0,0)
e18.Speed=nr(0,0)
e18.SpreadAngle=v2(-1000,1000)
e18.VelocitySpread=-1000 
e18.FlipbookFramerate=nr(2.34,2.34)
e18.FlipbookLayout="Grid4x4"
e18.FlipbookMode="OneShot"
e18:SetAttribute("EmitCount",1)

local e19=Instance.new("ParticleEmitter",charge1att)
e19.Name="EyeShine"
e19.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e19.Brightness=15 
--0 -0.5 0 1 -0.5 0 
e19.Orientation="FacingCamera"
e19.Squash=ns({
  nsk(0,-.5),
  nsk(1,-.5)
})
e19.Size=ns({
  nsk(0,0),
  nsk(.1,21),
  nsk(1,0),
})
e19.Transparency=ns({
  nsk(0,1),
  nsk(.5,.3),
  nsk(1,1),
})
e19.ZOffset=20
e19.Texture="rbxassetid://82921243876307"
e19.EmissionDirection="Top"
e19.Enabled=false 
e19.Lifetime=nr(.3,.3)
e19.Rate=7 
e19.Rotation=nr(0,0)
e19.Rotation=nr(0,0)
e19.RotSpeed=nr(0,0)
e19.Speed=nr(0,0)
e19.SpreadAngle=v2(0,0)
e19.VelocitySpread=0 
e19.FlipbookFramerate=nr(1,1)
e19.FlipbookLayout="None"
e19.FlipbookMode="OneShot"
e19:SetAttribute("EmitCount",1)

local e20=Instance.new("ParticleEmitter",charge1att)
e20.Name="WhiteStarBurst"
e20.Brightness=20 
e20.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
})
e20.Orientation="FacingCamera"
--0 0 0 0.1 36 0 0.230376 14.988 0 0.428376 4.788 0 1 0 0 
e20.Size=ns({
  nsk(0,0),
  nsk(.1,36),
  nsk(.23,15),
  nsk(.4,4),
  nsk(1,0),
})
e20.ZOffset=13
e20.Texture="rbxassetid://8905832887"
e20.EmissionDirection="Top"
e20.Enabled=false 
e20.Lifetime=nr(.2,.2)
e20.Rate=7 
e20.Rotation=nr(0,360)
e20.RotSpeed=nr(0,0)
e20.Speed=nr(300,500)
e20.SpreadAngle=v2(180,180)
e20.VelocitySpread=180 
e20.FlipbookFramerate=nr(1,1)
e20.FlipbookLayout="None"
e20.FlipbookMode="OneShot"
e20:SetAttribute("EmitCount",1)

local e21=Instance.new("ParticleEmitter",charge1att)
e21.Name="DarkStarBurst"
e21.Brightness=0 
e21.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0))
})
e21.Orientation="FacingCamera"
--0 0 0 0.1 36 0 0.230376 14.988 0 0.428376 4.788 0 1 0 0 
e21.Size=ns({
  nsk(0,0),
  nsk(.1,36),
  nsk(.23,15),
  nsk(.4,4),
  nsk(1,0),
})
e21.ZOffset=13
e21.Texture="rbxassetid://8905832887"
e21.EmissionDirection="Top"
e21.Enabled=false 
e21.Lifetime=nr(.2,.2)
e21.Rate=7 
e21.Rotation=nr(0,360)
e21.RotSpeed=nr(0,0)
e21.Speed=nr(300,500)
e21.SpreadAngle=v2(180,180)
e21.VelocitySpread=180 
e21.FlipbookFramerate=nr(1,1)
e21.FlipbookLayout="None"
e21.FlipbookMode="OneShot"
e21:SetAttribute("EmitCount",1)

local e22=Instance.new("ParticleEmitter",charge1att)
e22.Name="Lightning1"
e22.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e22.Orientation="VelocityParallel"
e22.Size=ns({
  nsk(0,12.6),
  nsk(1,12.6),
})
e22.Squash=ns({
  nsk(0,0),
  nsk(1,.213,.1),
})
e22.Texture="rbxassetid://132060681192414"
e22.Transparency=ns({
  nsk(0,0),
  nsk(1,.18),
})
e22.ZOffset=3.3 
e22.EmissionDirection="Top"
e22.Enabled=false 
e22.Lifetime=nr(.11,.13)
e22.Rate=7 
e22.Rotation=nr(-996,1004)
e22.RotSpeed=nr(0,0)
e22.Speed=nr(0,0)
e22.SpreadAngle=v2(-1000,1000)
e22.VelocitySpread=-1000 
e22.FlipbookFramerate=nr(2.34,2.34)
e22.FlipbookLayout="Grid4x4"
e22.FlipbookMode="OneShot"
e22:SetAttribute("EmitCount",1)

local e23=Instance.new("ParticleEmitter",charge1att)
e23.Name="Lightning2"
e23.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e23.Orientation="VelocityParallel"
e23.Size=ns({
  nsk(0,12.6),
  nsk(1,12.6),
})
e23.Squash=ns({
  nsk(0,0),
  nsk(1,.213,.1),
})
e23.Texture="rbxassetid://132060681192414"
e23.Transparency=ns({
  nsk(0,0),
  nsk(1,.18),
})
e23.ZOffset=3.3 
e23.EmissionDirection="Top"
e23.Enabled=false 
e23.Lifetime=nr(.11,.13)
e23.Rate=7 
e23.Rotation=nr(-996,1004)
e23.RotSpeed=nr(0,0)
e23.Speed=nr(0,0)
e23.SpreadAngle=v2(-1000,1000)
e23.VelocitySpread=-1000 
e23.FlipbookFramerate=nr(2.34,2.34)
e23.FlipbookLayout="Grid4x4"
e23.FlipbookMode="OneShot"
e23:SetAttribute("EmitCount",1)

local e24=Instance.new("ParticleEmitter",charge1att)
e24.Name="GlareWhite"
e24.Brightness=10
e24.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e24.Orientation="FacingCamera"
--0 5 0 0.1 65.5894 0 0.2 96.0972 0 0.3 110.692 0 0.4 117.975 0 0.5 121.705 0 0.6 123.593 0 0.7 124.494 0 0.8 124.87 0 0.9 124.986 0 1 125 0 1 125 0 
e24.Size=ns({
  nsk(0,5),
  nsk(.1,65),
  nsk(.2,96),
  nsk(.3,110),
  nsk(.4,117),
  nsk(.5,212),
  nsk(.6,123),
  nsk(.7,124),
  nsk(.8,124),
  nsk(.9,125),
  nsk(1,125),
})
e24.Texture="rbxassetid://74633209088223"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e24.Transparency=ns({
  nsk(0,2),
  nsk(.1,.21),
  nsk(.5,.38),
  nsk(.8,.56),
  nsk(1,1),
})
e24.ZOffset=0
e24.EmissionDirection="Top"
e24.Enabled=false 
e24.Lifetime=nr(.1,.3)
e24.Rate=7 
e24.Rotation=nr(0,360)
e24.RotSpeed=nr(0,0)
e24.Speed=nr(.001,.001)
e24.SpreadAngle=v2(180,180)
e24.VelocitySpread=180 
e24.FlipbookFramerate=nr(1,1)
e24.FlipbookLayout="None"
e24.FlipbookMode="OneShot"
e24:SetAttribute("EmitCount",1)

local e25=Instance.new("ParticleEmitter",charge1att)
e25.Name="Impact"
e25.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e25.Orientation="VelocityPerpendicular"
--0 12 0 0.0762712 35.625 0 0.225424 50.625 0 0.5 57.375 0 1 60 0 
e25.Size=ns({
  nsk(0,12),
  nsk(.07,35),
  nsk(.22,50),
  nsk(.5,57.37),
  nsk(1,70),
})
e25.Texture="rbxassetid://18453327840"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e25.Transparency=ns({
  nsk(0,1),
  nsk(.1,0),
  nsk(.21,.512),
  nsk(.38,.79),
  nsk(.56,.925),
  nsk(1,1),
})
e25.ZOffset=0
e25.EmissionDirection="Top"
e25.Enabled=false 
e25.Lifetime=nr(.2,.5)
e25.Rate=7 
e25.Rotation=nr(0,360)
e25.RotSpeed=nr(0,0)
e25.Speed=nr(.001,.001)
e25.SpreadAngle=v2(180,180)
e25.VelocitySpread=180 
e25.FlipbookFramerate=nr(1,1)
e25.FlipbookLayout="None"
e25.FlipbookMode="OneShot"
e25:SetAttribute("EmitCount",1)

local e26=Instance.new("ParticleEmitter",charge1att)
e26.Name="Impact1"
e26.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e26.Orientation="VelocityPerpendicular"
--0 12 0 0.0762712 35.625 0 0.225424 50.625 0 0.5 57.375 0 1 60 0 
e26.Size=ns({
  nsk(0,12),
  nsk(.07,35),
  nsk(.22,50),
  nsk(.5,57.37),
  nsk(1,70),
})
e26.Texture="rbxassetid://15536021290"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e26.Transparency=ns({
  nsk(0,1),
  nsk(.1,0),
  nsk(.21,.512),
  nsk(.38,.79),
  nsk(.56,.925),
  nsk(1,1),
})
e26.ZOffset=0
e26.EmissionDirection="Top"
e26.Enabled=false 
e26.Lifetime=nr(.2,.5)
e26.Rate=7 
e26.Rotation=nr(0,360)
e26.RotSpeed=nr(0,0)
e26.Speed=nr(.001,.001)
e26.SpreadAngle=v2(180,180)
e26.VelocitySpread=180 
e26.FlipbookFramerate=nr(1,1)
e26.FlipbookLayout="Grid4x4"
e26.FlipbookMode="OneShot"
e26:SetAttribute("EmitCount",1)

local e27=Instance.new("ParticleEmitter",charge1att)
e27.Name="Impacts2"
e25.Brightness=45
e27.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0))
}) 
e27.Orientation="VelocityPerpendicular"
--0 40 0 1 40 0 
e27.Size=ns({
  nsk(0,40),
  nsk(1,40),
})
e27.Texture="rbxassetid://18140248952"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e27.Transparency=ns({
  nsk(0,1),
  nsk(.1,0),
  nsk(1,1),
})
e27.ZOffset=0
e27.EmissionDirection="Top"
e27.Enabled=false 
e27.Lifetime=nr(.3,.3)
e27.Rate=7 
e27.Rotation=nr(0,360)
e27.RotSpeed=nr(0,0)
e27.Speed=nr(.001,.001)
e27.SpreadAngle=v2(35,35)
e27.VelocitySpread=35 
e27.FlipbookFramerate=nr(1,1)
e27.FlipbookLayout="Grid4x4"
e27.FlipbookMode="OneShot"
e27:SetAttribute("EmitCount",1)

local e28=Instance.new("ParticleEmitter",charge1att)
e28.Name="Impacts3"
e25.Brightness=45
e28.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e28.Orientation="VelocityPerpendicular"
--0 40 0 0.0830508 52.5 0 0.211864 59 0 0.472881 60.5 0 1 64 0 
e28.Size=ns({
  nsk(0,40),
  nsk(.08,52.5),
  nsk(.21,59),
  nsk(.47,60.5),
  nsk(1,64),
})
e28.Texture="rbxassetid://13280251453"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e28.Transparency=ns({
  nsk(0,1),
  nsk(.1,.8),
  nsk(1,1),
})
e28.ZOffset=0
e28.EmissionDirection="Top"
e28.Enabled=false 
e28.Lifetime=nr(.3,.5)
e28.Rate=7 
e28.Rotation=nr(0,360)
e28.RotSpeed=nr(0,0)
e28.Speed=nr(.001,.001)
e28.SpreadAngle=v2(3,3)
e28.VelocitySpread=3
e28.FlipbookFramerate=nr(1,1)
e28.FlipbookLayout="None"
e28.FlipbookMode="OneShot"
e28:SetAttribute("EmitCount",1)

local e29=Instance.new("ParticleEmitter",charge1att)
e29.Name="Impacts4"
e25.Brightness=45
e29.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e29.Orientation="VelocityPerpendicular"
--0 40 0 0.0830508 52.5 0 0.211864 59 0 0.472881 60.5 0 1 64 0 
e29.Size=ns({
  nsk(0,40),
  nsk(.08,52.5),
  nsk(.21,59),
  nsk(.47,60.5),
  nsk(1,64),
})
e29.Texture="rbxassetid://10529371971"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e29.Transparency=ns({
  nsk(0,1),
  nsk(.1,.9),
  nsk(1,1),
})
e29.ZOffset=0
e29.EmissionDirection="Top"
e29.Enabled=false 
e29.Lifetime=nr(.3,.5)
e29.Rate=7 
e29.Rotation=nr(0,360)
e29.RotSpeed=nr(0,0)
e29.Speed=nr(.001,.001)
e29.SpreadAngle=v2(3,3)
e29.VelocitySpread=3
e29.FlipbookFramerate=nr(1,1)
e29.FlipbookLayout="None"
e29.FlipbookMode="OneShot"
e29:SetAttribute("EmitCount",1)

local e30=Instance.new("ParticleEmitter",charge1att)
e30.Name="Impacts5"
e25.Brightness=45
e30.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e30.Orientation="VelocityPerpendicular"
--0 40 0 0.0830508 52.5 0 0.211864 59 0 0.472881 60.5 0 1 64 0 
e30.Size=ns({
  nsk(0,40),
  nsk(.08,52.5),
  nsk(.21,59),
  nsk(.47,60.5),
  nsk(1,64),
})
e30.Texture="rbxassetid://18356099314"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e30.Transparency=ns({
  nsk(0,1),
  nsk(.1,.9),
  nsk(1,1),
})
e30.ZOffset=0
e30.EmissionDirection="Top"
e30.Enabled=false 
e30.Lifetime=nr(.3,.5)
e30.Rate=7 
e30.Rotation=nr(0,360)
e30.RotSpeed=nr(0,0)
e30.Speed=nr(.001,.001)
e30.SpreadAngle=v2(3,3)
e30.VelocitySpread=3
e30.FlipbookFramerate=nr(1,1)
e30.FlipbookLayout="None"
e30.FlipbookMode="OneShot"
e30:SetAttribute("EmitCount",1)

local e31=Instance.new("ParticleEmitter",charge1att)
e31.Name="HorizonImpact"
e25.Brightness=15
e31.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e31.Orientation="VelocityPerpendicular"
--0 12 0 0.0762712 35.625 0 0.225424 50.625 0 0.5 57.375 0 1 60 0 
e31.Size=ns({
  nsk(0,12),
  nsk(.07,35.625),
  nsk(.22,50.625),
  nsk(.5,57.5),
  nsk(1,60),
})
e31.Texture="rbxassetid://16924410706"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e31.Transparency=ns({
  nsk(0,1),
  nsk(.1,0),
  nsk(.21,.51),
  nsk(.38,.79),
  nsk(.56,.925),
  nsk(1,1),
})
e31.ZOffset=0
e31.EmissionDirection="Top"
e31.Enabled=false 
e31.Lifetime=nr(.2,.5)
e31.Rate=14
e31.Rotation=nr(0,360)
e31.RotSpeed=nr(0,0)
e31.Speed=nr(.001,.001)
e31.SpreadAngle=v2(6,6)
e31.VelocitySpread=6
e31.FlipbookFramerate=nr(1,1)
e31.FlipbookLayout="Grid4x4"
e31.FlipbookMode="OneShot"
e31:SetAttribute("EmitCount",1)

local e32=Instance.new("ParticleEmitter",charge1att)
e32.Name="Wind3"
e32.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e32.Orientation="VelocityPerpendicular"
--0 0 0 0.10339 14.7875 0 0.342373 28.4375 0 0.535593 32.76 0 1 36.4 0 
e32.Size=ns({
  nsk(0,0),
  nsk(.1,14.8),
  nsk(.3,28.8),
  nsk(.5,32.7),
  nsk(1,36.4),
})
e32.Texture="rbxassetid://16434901408"
e32.Transparency=ns({
  nsk(0,.5),
  nsk(1,1),
})
e32.EmissionDirection="Top"
e32.Enabled=false 
e32.Lifetime=nr(.3,.3)
e32.Rate=14
e32.Rotation=nr(0,0)
e32.RotSpeed=nr(0,0)
e32.Speed=nr(.002,.002)
e32.SpreadAngle=v2(15,15)
e32.VelocitySpread=15 
e32.FlipbookFramerate=nr(1,1)
e32.FlipbookLayout="None"
e32.FlipbookMode="OneShot"
e32:SetAttribute("EmitCount",1)

local e33=Instance.new("ParticleEmitter",charge1att)
e33.Name="Wind4"
e33.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e33.Orientation="VelocityPerpendicular"
--0 0 0 0.10339 14.7875 0 0.342373 28.4375 0 0.535593 32.76 0 1 36.4 0 
e33.Size=ns({
  nsk(0,0),
  nsk(.1,14.8),
  nsk(.3,28.8),
  nsk(.5,32.7),
  nsk(1,36.4),
})
e33.Texture="rbxassetid://16434901408"
e33.Transparency=ns({
  nsk(0,.5),
  nsk(1,1),
})
e33.EmissionDirection="Top"
e33.Enabled=false 
e33.Lifetime=nr(.3,.3)
e33.Rate=14
e33.Rotation=nr(0,0)
e33.RotSpeed=nr(0,0)
e33.Speed=nr(.002,.002)
e33.SpreadAngle=v2(15,15)
e33.VelocitySpread=15 
e33.FlipbookFramerate=nr(1,1)
e33.FlipbookLayout="None"
e33.FlipbookMode="OneShot"
e33:SetAttribute("EmitCount",1)

local e34=Instance.new("ParticleEmitter",charge1att)
e34.Name="Wind5"
e34.Color=cs({
  csk(0,rgb(255,255,255)),
  csk(1,rgb(255,255,255))
}) 
e34.Orientation="VelocityPerpendicular"
--0 0 0 0.10339 14.7875 0 0.342373 28.4375 0 0.535593 32.76 0 1 36.4 0 
e34.Size=ns({
  nsk(0,0),
  nsk(.1,14.8),
  nsk(.3,28.8),
  nsk(.5,32.7),
  nsk(1,36.4),
})
e34.Texture="rbxassetid://16434901408"
e34.Transparency=ns({
  nsk(0,.5),
  nsk(1,1),
})
e34.EmissionDirection="Top"
e34.Enabled=false 
e34.Lifetime=nr(.3,.3)
e34.Rate=14
e34.Rotation=nr(0,0)
e34.RotSpeed=nr(0,0)
e34.Speed=nr(.002,.002)
e34.SpreadAngle=v2(15,15)
e34.VelocitySpread=15 
e34.FlipbookFramerate=nr(1,1)
e34.FlipbookLayout="None"
e34.FlipbookMode="OneShot"
e34:SetAttribute("EmitCount",1)

local e35=Instance.new("ParticleEmitter",charge1att)
e35.Name="GlareDark"
e35.Brightness=50
e35.Color=cs({
  csk(0,rgb(0,0,0)),
  csk(1,rgb(0,0,0))
}) 
e35.Orientation="FacingCamera"
--0 5 0 0.1 65.5894 0 0.2 96.0972 0 0.3 110.692 0 0.4 117.975 0 0.5 121.705 0 0.6 123.593 0 0.7 124.494 0 0.8 124.87 0 0.9 124.986 0 1 125 0 1 125 0 
e35.Size=ns({
  nsk(0,5),
  nsk(.1,65),
  nsk(.2,96),
  nsk(.3,110),
  nsk(.4,117),
  nsk(.5,212),
  nsk(.6,123),
  nsk(.7,124),
  nsk(.8,124),
  nsk(.9,125),
  nsk(1,125),
})
e35.Texture="rbxassetid://74633209088223"
--0 1 0 0.1 0 0 0.211864 0.5125 0 0.383051 0.79375 0 0.566102 0.925 0 1 1 0 
e35.Transparency=ns({
  nsk(0,2),
  nsk(.1,.21),
  nsk(.5,.38),
  nsk(.8,.56),
  nsk(1,1),
})
e35.ZOffset=0
e35.EmissionDirection="Top"
e35.Enabled=false 
e35.Lifetime=nr(.1,.3)
e35.Rate=7 
e35.Rotation=nr(0,360)
e35.RotSpeed=nr(0,0)
e35.Speed=nr(.001,.001)
e35.SpreadAngle=v2(180,180)
e35.VelocitySpread=180 
e35.FlipbookFramerate=nr(1,1)
e35.FlipbookLayout="None"
e35.FlipbookMode="OneShot"
e35:SetAttribute("EmitCount",1)




local TopFrameBars=Instance.new("Frame",EquinoxFolder)
TopFrameBars.Size=u2(1,0,.3,0)
TopFrameBars.BackgroundTransparency=1 
TopFrameBars.Name="TopFrame"
TopFrameBars.Position=UDim2.fromScale(.05,-.5)

local TopframeBar=Instance.new("Frame",TopFrameBars)
TopframeBar.Size=u2(.05,0,1,0)
TopframeBar.BackgroundTransparency=1 


local TopframeBarImage=Instance.new("ImageLabel",TopframeBar)
TopframeBarImage.Image="rbxassetid://13271935089"
TopframeBarImage.ImageColor3=rgb(255,255,255)
TopframeBarImage.ScaleType="Stretch"
TopframeBarImage.Position=u2(.5,0,0,0)
TopframeBarImage.Size=u2(1,0,2,0)
TopframeBarImage.BackgroundTransparency=1

local topbarlayout=Instance.new("UIListLayout",TopFrameBars)
topbarlayout.FillDirection="Horizontal"
topbarlayout.SortOrder="Name"





local BottomFrame=Instance.new("Frame",EquinoxFolder)
BottomFrame.Size=u2(1,0,.3,0)
BottomFrame.Position=u2(.5,0,.7,0)
BottomFrame.BackgroundTransparency=1 
BottomFrame.Name="BottomFrame"

local BottomFrameBar=Instance.new("Frame",BottomFrame)
BottomFrameBar.Size=u2(.05,0,1,0)
BottomFrameBar.BackgroundTransparency=1 


local BottomFrameBarImage=Instance.new("ImageLabel",BottomFrameBar)
BottomFrameBarImage.Image="rbxassetid://13271935089"
BottomFrameBarImage.ImageColor3=rgb(255,255,255)
BottomFrameBarImage.ScaleType="Stretch"
BottomFrameBarImage.Position=u2(.5,0,0,0)
BottomFrameBarImage.Size=u2(1,0,2,0)
BottomFrameBarImage.BackgroundTransparency=1

local BottomFrameLayout=Instance.new("UIListLayout",BottomFrame)
BottomFrameLayout.FillDirection="Horizontal"
BottomFrameLayout.SortOrder="Name"


local Model=Instance.new("Model", EquinoxFolder)
Model.Name="Orbs Model"
local Orb=Instance.new("Part", Model)
Orb.Name="Orb"
Orb.Anchored=true 
Orb.CanCollide=false
Orb.CanQuery=false
Orb.CanTouch=false
Orb.Massless=false
--Orb.Massless=false
Orb.Transparency=1
Orb.Reflectance=0
Orb.Color=Color3.new(0.647059,0.647059,0.647059)
Orb.Material=Enum.Material.Plastic
Orb.Size=Vector3.new(21,21,21)
Orb.CFrame=CFrame.new(0,0,0)
Orb.Orientation=Vector3.new(0,0,0)
Orb.Position=Vector3.new(0,0,0)
Orb.CastShadow=true
Orb.Massless=true

local Trail=Instance.new("Attachment", Orb)
Trail.Name="Trail"
Trail.CFrame=CFrame.new(5,0,7.5,1,0,0,0,1,0,0,0,1)
Trail.Position=Vector3.new(5.000000,0.000000,7.500000)
Trail.Orientation=Vector3.new(-0.000000,0.000000,0.000000)
Trail.Axis=Vector3.new(1.000000,0.000000,0.000000)
Trail.SecondaryAxis=Vector3.new(0.000000,1.000000,0.000000)
Trail.Visible=false

local Trail1=Instance.new("Trail", Trail)
Trail1.Name="Trail4"
Trail1.Enabled=true
Trail1.Lifetime=0.5
Trail1.FaceCamera=true
Trail1.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.900000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Trail1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.806250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Trail1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Trail1.Texture="rbxassetid://72238695362864"
Trail1.TextureLength=1
Trail1.LightEmission=0
Trail1.LightInfluence=0
Trail1.Attachment0=Trail

local Trail2=Instance.new("Trail", Trail)
Trail2.Name="Trail3"
Trail2.Enabled=true
Trail2.Lifetime=0.5
Trail2.FaceCamera=true
Trail2.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.900000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Trail2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.600000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Trail2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Trail2.Texture="rbxassetid://12251459424"
Trail2.TextureLength=1
Trail2.LightEmission=0
Trail2.LightInfluence=0
Trail2.Attachment0=Trail

local Trail3=Instance.new("Trail", Trail)
Trail3.Name="Trail2"
Trail3.Enabled=true
Trail3.Lifetime=0.5
Trail3.FaceCamera=true
Trail3.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Trail3.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Trail3.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Trail3.Texture="rbxassetid://15687532616"
Trail3.TextureLength=1
Trail3.LightEmission=0
Trail3.LightInfluence=0
Trail3.Attachment0=Trail

local Trail4=Instance.new("Trail", Trail)
Trail4.Name="Trail1"
Trail4.Enabled=true
Trail4.Lifetime=0.5
Trail4.FaceCamera=true
Trail4.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Trail4.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Trail4.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Trail4.Texture="rbxassetid://16892384522"
Trail4.TextureLength=1
Trail4.LightEmission=0
Trail4.LightInfluence=0
Trail4.Attachment0=Trail


local TrailAttachment=Instance.new("Attachment", Trail)
TrailAttachment.Name="Attachment1"
TrailAttachment.CFrame=CFrame.new(0,0,-15,1,0,0,0,1,0,0,0,1)
TrailAttachment.Position=Vector3.new(0.000000,0.000000,-15.000000)
TrailAttachment.Orientation=Vector3.new(-0.000000,0.000000,0.000000)
TrailAttachment.Axis=Vector3.new(1.000000,0.000000,0.000000)
TrailAttachment.SecondaryAxis=Vector3.new(0.000000,1.000000,0.000000)
TrailAttachment.Visible=false
Trail4.Attachment1=TrailAttachment
Trail1.Attachment1=TrailAttachment
Trail3.Attachment1=TrailAttachment
Trail2.Attachment1=TrailAttachment

local Shock=Instance.new("Attachment", Orb)
Shock.Name="Shock"
Shock.CFrame=CFrame.new(0,0,0,1,0,0,0,1,0,0,0,1)
Shock.Position=Vector3.new(0.000000,0.000000,0.000000)
Shock.Orientation=Vector3.new(-0.000000,0.000000,0.000000)
Shock.Axis=Vector3.new(1.000000,0.000000,0.000000)
Shock.SecondaryAxis=Vector3.new(0.000000,1.000000,0.000000)
Shock.Visible=false

local Slash=Instance.new("ParticleEmitter", Shock)
Slash.Name="3d slash"
Slash.Enabled=true
Slash.Rate=5
Slash.Lifetime=NumberRange.new(1.000000,1.000000)
Slash.Speed=NumberRange.new(0.001894,0.001894)
Slash.Rotation=NumberRange.new(-1000.000000,1000.000000)
Slash.RotSpeed=NumberRange.new(-30.000000,30.000000)
Slash.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,3.499333,0.000000),NumberSequenceKeypoint.new(1.000000,9.260430,0.000000)})
Slash.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.501000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Slash.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Slash.LightEmission=0
Slash.LightInfluence=0
Slash.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Slash.Drag=0
Slash.EmissionDirection=Enum.NormalId.Top
Slash.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
Slash.ZOffset=0.0010000000474974513
Slash.Texture="http://www.roblox.com/asset/?id=123855728234115"
Slash.LockedToPart=true
Slash.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Slash.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Slash.FlipbookFramerate=NumberRange.new(0.000000,0.000000)
Slash.FlipbookStartRandom=false

local Burst=Instance.new("ParticleEmitter", Shock)
Burst.Name="Burst2"
Burst.Enabled=true
Burst.Rate=4
Burst.Lifetime=NumberRange.new(1.600000,1.600000)
Burst.Speed=NumberRange.new(0.000143,0.000143)
Burst.Rotation=NumberRange.new(-1000.000000,1000.000000)
Burst.RotSpeed=NumberRange.new(0.000000,0.000000)
Burst.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,4.924009,0.000000),NumberSequenceKeypoint.new(1.000000,8.021369,0.000000)})
Burst.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.298235,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Burst.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Burst.LightEmission=0
Burst.LightInfluence=0
Burst.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Burst.Drag=0
Burst.EmissionDirection=Enum.NormalId.Top
Burst.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Burst.ZOffset=0
Burst.Texture="rbxassetid://14378454717"
Burst.LockedToPart=true
Burst.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Burst.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Burst.FlipbookFramerate=NumberRange.new(0.125000,0.125000)
Burst.FlipbookStartRandom=false

local Twinkle=Instance.new("ParticleEmitter", Shock)
Twinkle.Name="twinkle"
Twinkle.Enabled=true
Twinkle.Rate=11
Twinkle.Lifetime=NumberRange.new(0.200000,0.200000)
Twinkle.Speed=NumberRange.new(0.000644,0.000644)
Twinkle.Rotation=NumberRange.new(45.000000,45.000000)
Twinkle.RotSpeed=NumberRange.new(0.000000,0.000000)
Twinkle.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.399882,0.000000),NumberSequenceKeypoint.new(1.000000,10.399882,0.000000)})
Twinkle.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.756250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Twinkle.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Twinkle.LightEmission=-2
Twinkle.LightInfluence=0
Twinkle.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Twinkle.Drag=0
Twinkle.EmissionDirection=Enum.NormalId.Top
Twinkle.SpreadAngle=Vector2.new(90.000000,90.000000)
Twinkle.ZOffset=4.550000190734863
Twinkle.Texture="rbxassetid://97749903406217"
Twinkle.LockedToPart=true
Twinkle.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Twinkle.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Twinkle.FlipbookFramerate=NumberRange.new(50.000000,50.000000)
Twinkle.FlipbookStartRandom=true

local Star=Instance.new("ParticleEmitter", Shock)
Star.Name="Star"
Star.Enabled=true
Star.Rate=4
Star.Lifetime=NumberRange.new(1.000000,1.000000)
Star.Speed=NumberRange.new(0.000889,0.000889)
Star.Rotation=NumberRange.new(0.000000,0.000000)
Star.RotSpeed=NumberRange.new(0.000000,0.000000)
Star.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,3.361442,0.577075),NumberSequenceKeypoint.new(1.000000,3.529514,0.760689),NumberSequenceKeypoint.new(1.000000,3.529514,0.000000)})
Star.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.496656,0.181250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Star.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Star.LightEmission=0
Star.LightInfluence=0
Star.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Star.Drag=0
Star.EmissionDirection=Enum.NormalId.Top
Star.SpreadAngle=Vector2.new(0.000000,0.000000)
Star.ZOffset=5.699999809265137
Star.Texture="rbxassetid://86329861981973"
Star.LockedToPart=true
Star.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Star.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Star.FlipbookFramerate=NumberRange.new(19.522776,19.522776)
Star.FlipbookStartRandom=false

local Lightning=Instance.new("Attachment", Shock)
Lightning.Name="lightning"
Lightning.CFrame=CFrame.new(0,0,0,1,0,0,0,1,0,0,0,1)
Lightning.Position=Vector3.new(0.000000,0.000000,0.000000)
Lightning.Orientation=Vector3.new(-0.000000,0.000000,0.000000)
Lightning.Axis=Vector3.new(1.000000,0.000000,0.000000)
Lightning.SecondaryAxis=Vector3.new(0.000000,1.000000,0.000000)
Lightning.Visible=false

local Lightning1=Instance.new("ParticleEmitter", Lightning)
Lightning1.Name="lightning"
Lightning1.Enabled=true
Lightning1.Rate=4
Lightning1.Lifetime=NumberRange.new(0.075000,0.075000)
Lightning1.Speed=NumberRange.new(0.000341,0.000341)
Lightning1.Rotation=NumberRange.new(-995.999756,1004.000244)
Lightning1.RotSpeed=NumberRange.new(0.000000,0.000000)
Lightning1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.258267,0.000000),NumberSequenceKeypoint.new(1.000000,10.258267,0.000000)})
Lightning1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.187500,0.000000)})
Lightning1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Lightning1.LightEmission=0
Lightning1.LightInfluence=0
Lightning1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Lightning1.Drag=0
Lightning1.EmissionDirection=Enum.NormalId.Top
Lightning1.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Lightning1.ZOffset=3.3499999046325684
Lightning1.Texture="rbxassetid://70666087000189"
Lightning1.LockedToPart=true
Lightning1.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Lightning1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Lightning1.FlipbookFramerate=NumberRange.new(2.343750,2.343750)
Lightning1.FlipbookStartRandom=false

local Lightning2=Instance.new("ParticleEmitter", Lightning)
Lightning2.Name="lightning"
Lightning2.Enabled=true
Lightning2.Rate=1.2999999523162842
Lightning2.Lifetime=NumberRange.new(0.075000,0.075000)
Lightning2.Speed=NumberRange.new(0.000341,0.000341)
Lightning2.Rotation=NumberRange.new(-995.999756,1004.000244)
Lightning2.RotSpeed=NumberRange.new(0.000000,0.000000)
Lightning2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.258267,0.000000),NumberSequenceKeypoint.new(1.000000,10.258267,0.000000)})
Lightning2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.187500,0.000000)})
Lightning2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Lightning2.LightEmission=0
Lightning2.LightInfluence=0
Lightning2.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Lightning2.Drag=0
Lightning2.EmissionDirection=Enum.NormalId.Top
Lightning2.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Lightning2.ZOffset=3.3499999046325684
Lightning2.Texture="rbxassetid://109604349904035"
Lightning2.LockedToPart=true
Lightning2.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Lightning2.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Lightning2.FlipbookFramerate=NumberRange.new(2.343750,2.343750)
Lightning2.FlipbookStartRandom=false

local Lightning3=Instance.new("ParticleEmitter", Lightning)
Lightning3.Name="lightning"
Lightning3.Enabled=true
Lightning3.Rate=3
Lightning3.Lifetime=NumberRange.new(0.125000,0.125000)
Lightning3.Speed=NumberRange.new(0.000341,0.000341)
Lightning3.Rotation=NumberRange.new(-995.999756,1004.000244)
Lightning3.RotSpeed=NumberRange.new(0.000000,0.000000)
Lightning3.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.258267,0.000000),NumberSequenceKeypoint.new(1.000000,10.258267,0.000000)})
Lightning3.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.187500,0.000000)})
Lightning3.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Lightning3.LightEmission=0
Lightning3.LightInfluence=0
Lightning3.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Lightning3.Drag=0
Lightning3.EmissionDirection=Enum.NormalId.Top
Lightning3.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Lightning3.ZOffset=3.3499999046325684
Lightning3.Texture="rbxassetid://132060681192414"
Lightning3.LockedToPart=true
Lightning3.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Lightning3.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Lightning3.FlipbookFramerate=NumberRange.new(2.343750,2.343750)
Lightning3.FlipbookStartRandom=false

local Lightning4=Instance.new("ParticleEmitter", Lightning)
Lightning4.Name="lightning"
Lightning4.Enabled=true
Lightning4.Rate=4
Lightning4.Lifetime=NumberRange.new(0.075000,0.075000)
Lightning4.Speed=NumberRange.new(0.000341,0.000341)
Lightning4.Rotation=NumberRange.new(-995.999756,1004.000244)
Lightning4.RotSpeed=NumberRange.new(0.000000,0.000000)
Lightning4.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.258267,0.000000),NumberSequenceKeypoint.new(1.000000,10.258267,0.000000)})
Lightning4.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.187500,0.000000)})
Lightning4.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Lightning4.LightEmission=0
Lightning4.LightInfluence=0
Lightning4.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Lightning4.Drag=0
Lightning4.EmissionDirection=Enum.NormalId.Top
Lightning4.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Lightning4.ZOffset=3.299999952316284
Lightning4.Texture="rbxassetid://70666087000189"
Lightning4.LockedToPart=true
Lightning4.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Lightning4.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Lightning4.FlipbookFramerate=NumberRange.new(2.343750,2.343750)
Lightning4.FlipbookStartRandom=false

local Lightning5=Instance.new("ParticleEmitter", Lightning)
Lightning5.Name="lightning"
Lightning5.Enabled=true
Lightning5.Rate=1.2999999523162842
Lightning5.Lifetime=NumberRange.new(0.075000,0.075000)
Lightning5.Speed=NumberRange.new(0.000463,0.000463)
Lightning5.Rotation=NumberRange.new(-995.999756,1004.000244)
Lightning5.RotSpeed=NumberRange.new(0.000000,0.000000)
Lightning5.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,13.914905,0.000000),NumberSequenceKeypoint.new(1.000000,13.914905,0.000000)})
Lightning5.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.187500,0.000000)})
Lightning5.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Lightning5.LightEmission=0
Lightning5.LightInfluence=0
Lightning5.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Lightning5.Drag=0
Lightning5.EmissionDirection=Enum.NormalId.Top
Lightning5.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Lightning5.ZOffset=3.299999952316284
Lightning5.Texture="rbxassetid://109604349904035"
Lightning5.LockedToPart=true
Lightning5.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Lightning5.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Lightning5.FlipbookFramerate=NumberRange.new(2.343750,2.343750)
Lightning5.FlipbookStartRandom=false

local Lightning6=Instance.new("ParticleEmitter", Lightning)
Lightning6.Name="lightning"
Lightning6.Enabled=true
Lightning6.Rate=3
Lightning6.Lifetime=NumberRange.new(0.125000,0.125000)
Lightning6.Speed=NumberRange.new(0.000463,0.000463)
Lightning6.Rotation=NumberRange.new(-995.999756,1004.000244)
Lightning6.RotSpeed=NumberRange.new(0.000000,0.000000)
Lightning6.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,13.914905,0.000000),NumberSequenceKeypoint.new(1.000000,13.914905,0.000000)})
Lightning6.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.187500,0.000000)})
Lightning6.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Lightning6.LightEmission=0
Lightning6.LightInfluence=0
Lightning6.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Lightning6.Drag=0
Lightning6.EmissionDirection=Enum.NormalId.Top
Lightning6.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Lightning6.ZOffset=3.299999952316284
Lightning6.Texture="rbxassetid://132060681192414"
Lightning6.LockedToPart=true
Lightning6.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Lightning6.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Lightning6.FlipbookFramerate=NumberRange.new(2.343750,2.343750)
Lightning6.FlipbookStartRandom=false

local Inner=Instance.new("ParticleEmitter", Shock)
Inner.Name="Innerthing"
Inner.Enabled=true
Inner.Rate=3
Inner.Lifetime=NumberRange.new(2.000000,2.000000)
Inner.Speed=NumberRange.new(0.000000,0.000000)
Inner.Rotation=NumberRange.new(-360.000000,360.000000)
Inner.RotSpeed=NumberRange.new(0.000000,0.000000)
Inner.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.599378,0.000000),NumberSequenceKeypoint.new(0.100000,2.631196,0.000000),NumberSequenceKeypoint.new(0.200000,3.604931,0.000000),NumberSequenceKeypoint.new(0.300000,4.513783,0.000000),NumberSequenceKeypoint.new(0.400000,5.349400,0.000000),NumberSequenceKeypoint.new(0.500000,6.101332,0.000000),NumberSequenceKeypoint.new(0.600000,6.756232,0.000000),NumberSequenceKeypoint.new(0.700000,7.296708,0.000000),NumberSequenceKeypoint.new(0.800000,7.699868,0.000000),NumberSequenceKeypoint.new(0.900000,7.937325,0.000000),NumberSequenceKeypoint.new(1.000000,7.996892,0.000000),NumberSequenceKeypoint.new(1.000000,7.996892,0.000000)})
Inner.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.495012,0.587500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Inner.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Inner.LightEmission=0
Inner.LightInfluence=0
Inner.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Inner.Drag=0
Inner.EmissionDirection=Enum.NormalId.Top
Inner.SpreadAngle=Vector2.new(0.000000,0.000000)
Inner.ZOffset=0.3569999933242798
Inner.Texture="rbxassetid://140670363158980"
Inner.LockedToPart=true
Inner.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Inner.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Inner.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Inner.FlipbookStartRandom=false

local Star2=Instance.new("ParticleEmitter", Shock)
Star2.Name="Star"
Star2.Enabled=true
Star2.Rate=4
Star2.Lifetime=NumberRange.new(1.000000,1.000000)
Star2.Speed=NumberRange.new(0.001777,0.001777)
Star2.Rotation=NumberRange.new(0.000000,0.000000)
Star2.RotSpeed=NumberRange.new(0.000000,0.000000)
Star2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,6.722885,1.154149),NumberSequenceKeypoint.new(1.000000,7.059028,1.521378),NumberSequenceKeypoint.new(1.000000,7.059028,0.000000)})
Star2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.496656,0.181250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Star2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Star2.LightEmission=0
Star2.LightInfluence=0
Star2.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Star2.Drag=0
Star2.EmissionDirection=Enum.NormalId.Top
Star2.SpreadAngle=Vector2.new(0.000000,0.000000)
Star2.ZOffset=5.699999809265137
Star2.Texture="rbxassetid://86329861981973"
Star2.LockedToPart=true
Star2.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Star2.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Star2.FlipbookFramerate=NumberRange.new(19.522776,19.522776)
Star2.FlipbookStartRandom=false

local Impact=Instance.new("ParticleEmitter", Shock)
Impact.Name="Impacts3LeftDark"
Impact.Enabled=true
Impact.Rate=20
Impact.Lifetime=NumberRange.new(0.300000,0.600000)
Impact.Speed=NumberRange.new(0.001404,0.001404)
Impact.Rotation=NumberRange.new(0.000000,360.000000)
Impact.RotSpeed=NumberRange.new(0.000000,0.000000)
Impact.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.608519,0.000000),NumberSequenceKeypoint.new(0.100000,11.748220,0.000000),NumberSequenceKeypoint.new(0.200000,12.714145,0.000000),NumberSequenceKeypoint.new(0.300000,13.527091,0.000000),NumberSequenceKeypoint.new(0.400000,14.203175,0.000000),NumberSequenceKeypoint.new(0.500000,14.754955,0.000000),NumberSequenceKeypoint.new(0.600000,15.192159,0.000000),NumberSequenceKeypoint.new(0.700000,15.522090,0.000000),NumberSequenceKeypoint.new(0.800000,15.749836,0.000000),NumberSequenceKeypoint.new(0.900000,15.878382,0.000000),NumberSequenceKeypoint.new(1.000000,15.912780,0.000000),NumberSequenceKeypoint.new(1.000000,15.912780,0.000000)})
Impact.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.098901,0.637500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact.LightEmission=0
Impact.LightInfluence=0
Impact.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact.Drag=0
Impact.EmissionDirection=Enum.NormalId.Front
Impact.SpreadAngle=Vector2.new(25.000000,25.000000)
Impact.ZOffset=0
Impact.Texture="rbxassetid://15124481454"
Impact.LockedToPart=false
Impact.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Impact.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Impact.FlipbookFramerate=NumberRange.new(4.000000,4.000000)
Impact.FlipbookStartRandom=false

local Sigil=Instance.new("ParticleEmitter", Shock)
Sigil.Name="SigilCorners"
Sigil.Enabled=true
Sigil.Rate=1
Sigil.Lifetime=NumberRange.new(2.000000,2.000000)
Sigil.Speed=NumberRange.new(0.001143,0.001143)
Sigil.Rotation=NumberRange.new(0.000000,360.000000)
Sigil.RotSpeed=NumberRange.new(90.000000,90.000000)
Sigil.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.409513,0.000000),NumberSequenceKeypoint.new(1.000000,10.409513,0.000000)})
Sigil.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499725,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Sigil.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Sigil.LightEmission=0
Sigil.LightInfluence=0
Sigil.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Sigil.Drag=0
Sigil.EmissionDirection=Enum.NormalId.Back
Sigil.SpreadAngle=Vector2.new(0.000000,0.000000)
Sigil.ZOffset=0
Sigil.Texture="rbxassetid://96236061952134"
Sigil.LockedToPart=true
Sigil.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Sigil.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Sigil.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Sigil.FlipbookStartRandom=false

local Impact2=Instance.new("ParticleEmitter", Shock)
Impact2.Name="Impacts3Left"
Impact2.Enabled=true
Impact2.Rate=20
Impact2.Lifetime=NumberRange.new(0.200000,0.400000)
Impact2.Speed=NumberRange.new(0.002080,0.002080)
Impact2.Rotation=NumberRange.new(0.000000,360.000000)
Impact2.RotSpeed=NumberRange.new(0.000000,0.000000)
Impact2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,15.716324,0.000000),NumberSequenceKeypoint.new(0.100000,17.404772,0.000000),NumberSequenceKeypoint.new(0.200000,18.835770,0.000000),NumberSequenceKeypoint.new(0.300000,20.040136,0.000000),NumberSequenceKeypoint.new(0.400000,21.041740,0.000000),NumberSequenceKeypoint.new(0.500000,21.859194,0.000000),NumberSequenceKeypoint.new(0.600000,22.506901,0.000000),NumberSequenceKeypoint.new(0.700000,22.995689,0.000000),NumberSequenceKeypoint.new(0.800000,23.333090,0.000000),NumberSequenceKeypoint.new(0.900000,23.523527,0.000000),NumberSequenceKeypoint.new(1.000000,23.574488,0.000000),NumberSequenceKeypoint.new(1.000000,23.574488,0.000000)})
Impact2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.098901,0.712500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact2.LightEmission=0
Impact2.LightInfluence=0
Impact2.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact2.Drag=0
Impact2.EmissionDirection=Enum.NormalId.Front
Impact2.SpreadAngle=Vector2.new(25.000000,25.000000)
Impact2.ZOffset=0
Impact2.Texture="rbxassetid://15124481454"
Impact2.LockedToPart=false
Impact2.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Impact2.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Impact2.FlipbookFramerate=NumberRange.new(4.000000,4.000000)
Impact2.FlipbookStartRandom=false

local Impact3=Instance.new("ParticleEmitter", Shock)
Impact3.Name="Impacts2Left"
Impact3.Enabled=true
Impact3.Rate=20
Impact3.Lifetime=NumberRange.new(0.200000,0.400000)
Impact3.Speed=NumberRange.new(0.001891,0.001891)
Impact3.Rotation=NumberRange.new(0.000000,360.000000)
Impact3.RotSpeed=NumberRange.new(0.000000,0.000000)
Impact3.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,15.716324,0.000000),NumberSequenceKeypoint.new(0.100000,17.404772,0.000000),NumberSequenceKeypoint.new(0.200000,18.835770,0.000000),NumberSequenceKeypoint.new(0.300000,20.040136,0.000000),NumberSequenceKeypoint.new(0.400000,21.041740,0.000000),NumberSequenceKeypoint.new(0.500000,21.859194,0.000000),NumberSequenceKeypoint.new(0.600000,22.506901,0.000000),NumberSequenceKeypoint.new(0.700000,22.995689,0.000000),NumberSequenceKeypoint.new(0.800000,23.333090,0.000000),NumberSequenceKeypoint.new(0.900000,23.523527,0.000000),NumberSequenceKeypoint.new(1.000000,23.574488,0.000000),NumberSequenceKeypoint.new(1.000000,23.574488,0.000000)})
Impact3.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.100000,0.800000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact3.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact3.LightEmission=0
Impact3.LightInfluence=0
Impact3.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact3.Drag=0
Impact3.EmissionDirection=Enum.NormalId.Front
Impact3.SpreadAngle=Vector2.new(25.000000,25.000000)
Impact3.ZOffset=0
Impact3.Texture="rbxassetid://9281305957"
Impact3.LockedToPart=false
Impact3.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Impact3.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Impact3.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact3.FlipbookStartRandom=false

local Base=Instance.new("ParticleEmitter", Shock)
Base.Name="Base"
Base.Enabled=true
Base.Rate=2
Base.Lifetime=NumberRange.new(2.000000,2.000000)
Base.Speed=NumberRange.new(0.000000,0.000000)
Base.Rotation=NumberRange.new(0.000000,0.000000)
Base.RotSpeed=NumberRange.new(0.000000,0.000000)
Base.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.205405,0.000000),NumberSequenceKeypoint.new(1.000000,10.205405,0.000000)})
Base.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.401496,0.000000,0.000000),NumberSequenceKeypoint.new(0.602244,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Base.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Base.LightEmission=0
Base.LightInfluence=0
Base.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Base.Drag=0
Base.EmissionDirection=Enum.NormalId.Top
Base.SpreadAngle=Vector2.new(0.000000,0.000000)
Base.ZOffset=-0.05000000074505806
Base.Texture="rbxassetid://117136016778083"
Base.LockedToPart=true
Base.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Base.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Base.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Base.FlipbookStartRandom=false

local OuterSigil=Instance.new("ParticleEmitter", Shock)
OuterSigil.Name="Outersigil"
OuterSigil.Enabled=true
OuterSigil.Rate=1.25
OuterSigil.Lifetime=NumberRange.new(1.600000,1.600000)
OuterSigil.Speed=NumberRange.new(0.001021,0.001021)
OuterSigil.Rotation=NumberRange.new(-360.000000,360.000000)
OuterSigil.RotSpeed=NumberRange.new(-30.000000,30.000000)
OuterSigil.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.458429,0.000000),NumberSequenceKeypoint.new(1.000000,11.612464,0.000000)})
OuterSigil.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.083541,0.587500,0.000000),NumberSequenceKeypoint.new(0.599751,0.525000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
OuterSigil.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
OuterSigil.LightEmission=0
OuterSigil.LightInfluence=0
OuterSigil.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
OuterSigil.Drag=0
OuterSigil.EmissionDirection=Enum.NormalId.Top
OuterSigil.SpreadAngle=Vector2.new(0.000000,0.000000)
OuterSigil.ZOffset=0.3619999885559082
OuterSigil.Texture="rbxassetid://121806600874818"
OuterSigil.LockedToPart=true
OuterSigil.FlipbookLayout=Enum.ParticleFlipbookLayout.None
OuterSigil.FlipbookMode=Enum.ParticleFlipbookMode.Loop
OuterSigil.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
OuterSigil.FlipbookStartRandom=false

local Inner1=Instance.new("ParticleEmitter", Shock)
Inner1.Name="inner"
Inner1.Enabled=true
Inner1.Rate=5
Inner1.Lifetime=NumberRange.new(0.900000,1.200000)
Inner1.Speed=NumberRange.new(0.000000,0.000000)
Inner1.Rotation=NumberRange.new(-360.000000,360.000000)
Inner1.RotSpeed=NumberRange.new(0.000000,0.000000)
Inner1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.296940,0.000000),NumberSequenceKeypoint.new(0.100000,2.133644,0.000000),NumberSequenceKeypoint.new(0.200000,2.923249,0.000000),NumberSequenceKeypoint.new(0.300000,3.660239,0.000000),NumberSequenceKeypoint.new(0.400000,4.337843,0.000000),NumberSequenceKeypoint.new(0.500000,4.947586,0.000000),NumberSequenceKeypoint.new(0.600000,5.478647,0.000000),NumberSequenceKeypoint.new(0.700000,5.916920,0.000000),NumberSequenceKeypoint.new(0.800000,6.243844,0.000000),NumberSequenceKeypoint.new(0.900000,6.436398,0.000000),NumberSequenceKeypoint.new(1.000000,6.484702,0.000000),NumberSequenceKeypoint.new(1.000000,6.484702,0.000000)})
Inner1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.501247,0.531250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Inner1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Inner1.LightEmission=0
Inner1.LightInfluence=0
Inner1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Inner1.Drag=0
Inner1.EmissionDirection=Enum.NormalId.Top
Inner1.SpreadAngle=Vector2.new(0.000000,0.000000)
Inner1.ZOffset=3.003000020980835
Inner1.Texture="rbxassetid://130336287800373"
Inner1.LockedToPart=true
Inner1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Inner1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Inner1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Inner1.FlipbookStartRandom=false

local DarkGlow=Instance.new("ParticleEmitter", Shock)
DarkGlow.Name="darkglow"
DarkGlow.Enabled=true
DarkGlow.Rate=2
DarkGlow.Lifetime=NumberRange.new(2.000000,2.000000)
DarkGlow.Speed=NumberRange.new(0.000000,0.000000)
DarkGlow.Rotation=NumberRange.new(0.000000,0.000000)
DarkGlow.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkGlow.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,25.513514,0.000000),NumberSequenceKeypoint.new(0.100000,25.658041,0.000000),NumberSequenceKeypoint.new(0.200000,25.832272,0.000000),NumberSequenceKeypoint.new(0.300000,26.032890,0.000000),NumberSequenceKeypoint.new(0.400000,26.260151,0.000000),NumberSequenceKeypoint.new(0.500000,26.516460,0.000000),NumberSequenceKeypoint.new(0.600000,26.806372,0.000000),NumberSequenceKeypoint.new(0.700000,27.137440,0.000000),NumberSequenceKeypoint.new(0.800000,27.522360,0.000000),NumberSequenceKeypoint.new(0.900000,27.984442,0.000000),NumberSequenceKeypoint.new(1.000000,28.575136,0.000000),NumberSequenceKeypoint.new(1.000000,28.575136,0.000000)})
DarkGlow.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.502494,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkGlow.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
DarkGlow.LightEmission=-0.5
DarkGlow.LightInfluence=0
DarkGlow.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkGlow.Drag=0
DarkGlow.EmissionDirection=Enum.NormalId.Top
DarkGlow.SpreadAngle=Vector2.new(0.000000,0.000000)
DarkGlow.ZOffset=-3
DarkGlow.Texture="rbxassetid://14183571391"
DarkGlow.LockedToPart=true
DarkGlow.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkGlow.FlipbookMode=Enum.ParticleFlipbookMode.Loop
DarkGlow.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkGlow.FlipbookStartRandom=false

local Debris=Instance.new("ParticleEmitter", Shock)
Debris.Name="TriangleDebrisAlt"
Debris.Enabled=true
Debris.Rate=10
Debris.Lifetime=NumberRange.new(0.300000,0.900000)
Debris.Speed=NumberRange.new(35.000000,50.000000)
Debris.Rotation=NumberRange.new(-360.000000,360.000000)
Debris.RotSpeed=NumberRange.new(0.000000,0.000000)
Debris.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.120948,0.887426,0.347124),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Debris.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.926434,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Debris.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Debris.LightEmission=-0.5
Debris.LightInfluence=0
Debris.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Debris.Drag=4
Debris.EmissionDirection=Enum.NormalId.Top
Debris.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
Debris.ZOffset=2
Debris.Texture="rbxassetid://86773672116920"
Debris.LockedToPart=true
Debris.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Debris.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Debris.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Debris.FlipbookStartRandom=false

local Debris1=Instance.new("ParticleEmitter", Shock)
Debris1.Name="TriangleDebris"
Debris1.Enabled=true
Debris1.Rate=25
Debris1.Lifetime=NumberRange.new(0.300000,0.900000)
Debris1.Speed=NumberRange.new(60.000000,90.000000)
Debris1.Rotation=NumberRange.new(-360.000000,360.000000)
Debris1.RotSpeed=NumberRange.new(0.000000,0.000000)
Debris1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.118454,1.204365,0.347124),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Debris1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.926434,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Debris1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Debris1.LightEmission=0
Debris1.LightInfluence=0
Debris1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Debris1.Drag=7
Debris1.EmissionDirection=Enum.NormalId.Top
Debris1.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
Debris1.ZOffset=2
Debris1.Texture="rbxassetid://86773672116920"
Debris1.LockedToPart=true
Debris1.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Debris1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Debris1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Debris1.FlipbookStartRandom=false

local Debris2=Instance.new("ParticleEmitter", Shock)
Debris2.Name="StarDebris"
Debris2.Enabled=true
Debris2.Rate=25
Debris2.Lifetime=NumberRange.new(0.300000,0.600000)
Debris2.Speed=NumberRange.new(25.000000,45.000000)
Debris2.Rotation=NumberRange.new(-2.000000,2.000000)
Debris2.RotSpeed=NumberRange.new(0.000000,0.000000)
Debris2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.118454,1.648078,0.533460),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Debris2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.926434,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Debris2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Debris2.LightEmission=0
Debris2.LightInfluence=0
Debris2.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Debris2.Drag=5
Debris2.EmissionDirection=Enum.NormalId.Top
Debris2.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
Debris2.ZOffset=2
Debris2.Texture="rbxassetid://17062452122"
Debris2.LockedToPart=true
Debris2.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Debris2.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Debris2.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Debris2.FlipbookStartRandom=false

local Sides=Instance.new("ParticleEmitter", Shock)
Sides.Name="Sides"
Sides.Enabled=true
Sides.Rate=2
Sides.Lifetime=NumberRange.new(2.000000,2.000000)
Sides.Speed=NumberRange.new(0.000000,0.000000)
Sides.Rotation=NumberRange.new(0.000000,0.000000)
Sides.RotSpeed=NumberRange.new(0.000000,0.000000)
Sides.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,16.221498,0.000000),NumberSequenceKeypoint.new(1.000000,16.221498,0.000000)})
Sides.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.400249,0.368750,0.000000),NumberSequenceKeypoint.new(0.598504,0.375000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Sides.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Sides.LightEmission=0
Sides.LightInfluence=0
Sides.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Sides.Drag=0
Sides.EmissionDirection=Enum.NormalId.Top
Sides.SpreadAngle=Vector2.new(0.000000,0.000000)
Sides.ZOffset=0.35100001096725464
Sides.Texture="rbxassetid://129593009933713"
Sides.LockedToPart=true
Sides.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Sides.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Sides.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Sides.FlipbookStartRandom=false

local Impact3=Instance.new("ParticleEmitter", Shock)
Impact3.Name="Impact3"
Impact3.Enabled=true
Impact3.Rate=4
Impact3.Lifetime=NumberRange.new(1.600000,1.600000)
Impact3.Speed=NumberRange.new(0.000737,0.000737)
Impact3.Rotation=NumberRange.new(-360.000000,360.000000)
Impact3.RotSpeed=NumberRange.new(-30.000000,30.000000)
Impact3.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.751942,0.000000),NumberSequenceKeypoint.new(0.100000,2.449808,0.000000),NumberSequenceKeypoint.new(0.200000,4.052101,0.000000),NumberSequenceKeypoint.new(0.300000,5.547629,0.000000),NumberSequenceKeypoint.new(0.400000,6.922646,0.000000),NumberSequenceKeypoint.new(0.500000,8.159958,0.000000),NumberSequenceKeypoint.new(0.600000,9.237604,0.000000),NumberSequenceKeypoint.new(0.700000,10.126963,0.000000),NumberSequenceKeypoint.new(0.800000,10.790368,0.000000),NumberSequenceKeypoint.new(0.900000,11.181106,0.000000),NumberSequenceKeypoint.new(1.000000,11.279123,0.000000),NumberSequenceKeypoint.new(1.000000,11.279123,0.000000)})
Impact3.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.501247,0.525000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact3.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact3.LightEmission=0
Impact3.LightInfluence=0
Impact3.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact3.Drag=0
Impact3.EmissionDirection=Enum.NormalId.Top
Impact3.SpreadAngle=Vector2.new(360.000000,-360.000000)
Impact3.ZOffset=0.3610000014305115
Impact3.Texture="rbxassetid://84099119555030"
Impact3.LockedToPart=true
Impact3.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Impact3.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Impact3.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact3.FlipbookStartRandom=false

local OuterSigil1=Instance.new("ParticleEmitter", Shock)
OuterSigil1.Name="Outersigil"
OuterSigil1.Enabled=true
OuterSigil1.Rate=1.25
OuterSigil1.Lifetime=NumberRange.new(1.600000,1.600000)
OuterSigil1.Speed=NumberRange.new(0.001000,0.001000)
OuterSigil1.Rotation=NumberRange.new(-360.000000,360.000000)
OuterSigil1.RotSpeed=NumberRange.new(-30.000000,30.000000)
OuterSigil1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.246936,0.000000),NumberSequenceKeypoint.new(1.000000,11.377632,0.000000)})
OuterSigil1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.083541,0.587500,0.000000),NumberSequenceKeypoint.new(0.599751,0.525000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
OuterSigil1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
OuterSigil1.LightEmission=0
OuterSigil1.LightInfluence=0
OuterSigil1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
OuterSigil1.Drag=0
OuterSigil1.EmissionDirection=Enum.NormalId.Top
OuterSigil1.SpreadAngle=Vector2.new(0.000000,0.000000)
OuterSigil1.ZOffset=0.3619999885559082
OuterSigil1.Texture="rbxassetid://16878090342"
OuterSigil1.LockedToPart=true
OuterSigil1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
OuterSigil1.FlipbookMode=Enum.ParticleFlipbookMode.Loop
OuterSigil1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
OuterSigil1.FlipbookStartRandom=false

local OuterImpact=Instance.new("ParticleEmitter", Shock)
OuterImpact.Name="OuterImpact2"
OuterImpact.Enabled=true
OuterImpact.Rate=2.5
OuterImpact.Lifetime=NumberRange.new(1.600000,1.600000)
OuterImpact.Speed=NumberRange.new(0.000000,0.000000)
OuterImpact.Rotation=NumberRange.new(-360.000000,360.000000)
OuterImpact.RotSpeed=NumberRange.new(-30.000000,30.000000)
OuterImpact.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,8.902741,0.000000),NumberSequenceKeypoint.new(0.100000,10.681177,0.000000),NumberSequenceKeypoint.new(0.200000,12.087225,0.000000),NumberSequenceKeypoint.new(0.300000,13.173157,0.000000),NumberSequenceKeypoint.new(0.400000,13.985841,0.000000),NumberSequenceKeypoint.new(0.500000,14.568122,0.000000),NumberSequenceKeypoint.new(0.600000,14.959993,0.000000),NumberSequenceKeypoint.new(0.700000,15.199584,0.000000),NumberSequenceKeypoint.new(0.800000,15.324093,0.000000),NumberSequenceKeypoint.new(0.900000,15.370688,0.000000),NumberSequenceKeypoint.new(1.000000,15.377462,0.000000),NumberSequenceKeypoint.new(1.000000,15.377462,0.000000)})
OuterImpact.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.083541,0.587500,0.000000),NumberSequenceKeypoint.new(0.599751,0.525000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
OuterImpact.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
OuterImpact.LightEmission=0
OuterImpact.LightInfluence=0
OuterImpact.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
OuterImpact.Drag=0
OuterImpact.EmissionDirection=Enum.NormalId.Top
OuterImpact.SpreadAngle=Vector2.new(0.000000,0.000000)
OuterImpact.ZOffset=0.3619999885559082
OuterImpact.Texture="rbxassetid://75635825506318"
OuterImpact.LockedToPart=true
OuterImpact.FlipbookLayout=Enum.ParticleFlipbookLayout.None
OuterImpact.FlipbookMode=Enum.ParticleFlipbookMode.Loop
OuterImpact.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
OuterImpact.FlipbookStartRandom=false

local Impact4=Instance.new("ParticleEmitter", Shock)
Impact4.Name="Impacts2LeftDark"
Impact4.Enabled=true
Impact4.Rate=20
Impact4.Lifetime=NumberRange.new(0.300000,0.600000)
Impact4.Speed=NumberRange.new(0.001276,0.001276)
Impact4.Rotation=NumberRange.new(0.000000,360.000000)
Impact4.RotSpeed=NumberRange.new(0.000000,0.000000)
Impact4.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,10.608519,0.000000),NumberSequenceKeypoint.new(0.100000,11.748220,0.000000),NumberSequenceKeypoint.new(0.200000,12.714145,0.000000),NumberSequenceKeypoint.new(0.300000,13.527091,0.000000),NumberSequenceKeypoint.new(0.400000,14.203175,0.000000),NumberSequenceKeypoint.new(0.500000,14.754955,0.000000),NumberSequenceKeypoint.new(0.600000,15.192159,0.000000),NumberSequenceKeypoint.new(0.700000,15.522090,0.000000),NumberSequenceKeypoint.new(0.800000,15.749836,0.000000),NumberSequenceKeypoint.new(0.900000,15.878382,0.000000),NumberSequenceKeypoint.new(1.000000,15.912780,0.000000),NumberSequenceKeypoint.new(1.000000,15.912780,0.000000)})
Impact4.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.098901,0.743750,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact4.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact4.LightEmission=0
Impact4.LightInfluence=0
Impact4.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact4.Drag=0
Impact4.EmissionDirection=Enum.NormalId.Front
Impact4.SpreadAngle=Vector2.new(25.000000,25.000000)
Impact4.ZOffset=0
Impact4.Texture="rbxassetid://9281305957"
Impact4.LockedToPart=false
Impact4.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Impact4.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Impact4.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact4.FlipbookStartRandom=false

local Emitter=Instance.new("ParticleEmitter", Shock)
Emitter.Name="ParticleEmitter"
Emitter.Enabled=true
Emitter.Rate=5.5
Emitter.Lifetime=NumberRange.new(0.800000,0.800000)
Emitter.Speed=NumberRange.new(0.001000,0.001000)
Emitter.Rotation=NumberRange.new(-1000.000000,1000.000000)
Emitter.RotSpeed=NumberRange.new(0.000000,0.000000)
Emitter.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.653277,7.151085,0.000000),NumberSequenceKeypoint.new(0.738901,7.789574,0.000000),NumberSequenceKeypoint.new(0.823467,8.236515,0.000000),NumberSequenceKeypoint.new(0.899577,8.747306,0.000000),NumberSequenceKeypoint.new(0.961416,8.938855,0.000000),NumberSequenceKeypoint.new(1.000000,8.938855,0.000000)})
Emitter.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.400853,0.469945,0.000000),NumberSequenceKeypoint.new(0.600213,0.382514,0.000000),NumberSequenceKeypoint.new(0.801173,0.491803,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Emitter.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Emitter.LightEmission=0
Emitter.LightInfluence=0
Emitter.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Emitter.Drag=0
Emitter.EmissionDirection=Enum.NormalId.Top
Emitter.SpreadAngle=Vector2.new(-1000.000000,1000.000000)
Emitter.ZOffset=0.8143582344055176
Emitter.Texture="http://www.roblox.com/asset/?id=131005175504995"
Emitter.LockedToPart=true
Emitter.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Emitter.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Emitter.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Emitter.FlipbookStartRandom=false

local InnerBurst=Instance.new("ParticleEmitter", Shock)
InnerBurst.Name="InnerBursts"
InnerBurst.Enabled=true
InnerBurst.Rate=8
InnerBurst.Lifetime=NumberRange.new(0.900000,1.200000)
InnerBurst.Speed=NumberRange.new(0.001000,0.001000)
InnerBurst.Rotation=NumberRange.new(-360.000000,360.000000)
InnerBurst.RotSpeed=NumberRange.new(0.000000,0.000000)
InnerBurst.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,4.518205,0.000000),NumberSequenceKeypoint.new(0.100000,7.433064,0.000000),NumberSequenceKeypoint.new(0.200000,10.183843,0.000000),NumberSequenceKeypoint.new(0.300000,12.751329,0.000000),NumberSequenceKeypoint.new(0.400000,15.111927,0.000000),NumberSequenceKeypoint.new(0.500000,17.236116,0.000000),NumberSequenceKeypoint.new(0.600000,19.086193,0.000000),NumberSequenceKeypoint.new(0.700000,20.613024,0.000000),NumberSequenceKeypoint.new(0.800000,21.751942,0.000000),NumberSequenceKeypoint.new(0.900000,22.422752,0.000000),NumberSequenceKeypoint.new(1.000000,22.591024,0.000000),NumberSequenceKeypoint.new(1.000000,22.591024,0.000000)})
InnerBurst.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.501247,0.543750,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
InnerBurst.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
InnerBurst.LightEmission=0
InnerBurst.LightInfluence=0
InnerBurst.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
InnerBurst.Drag=0
InnerBurst.EmissionDirection=Enum.NormalId.Top
InnerBurst.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
InnerBurst.ZOffset=0.3529999852180481
InnerBurst.Texture="rbxassetid://14709236536"
InnerBurst.LockedToPart=true
InnerBurst.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
InnerBurst.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
InnerBurst.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
InnerBurst.FlipbookStartRandom=false

local DarkSlash=Instance.new("ParticleEmitter", Shock)
DarkSlash.Name="DarkSlash"
DarkSlash.Enabled=true
DarkSlash.Rate=5
DarkSlash.Lifetime=NumberRange.new(1.600000,1.600000)
DarkSlash.Speed=NumberRange.new(0.000227,0.000227)
DarkSlash.Rotation=NumberRange.new(-360.000000,360.000000)
DarkSlash.RotSpeed=NumberRange.new(-30.000000,30.000000)
DarkSlash.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,15.338382,0.000000),NumberSequenceKeypoint.new(0.100000,15.216269,0.000000),NumberSequenceKeypoint.new(0.200000,14.748873,0.000000),NumberSequenceKeypoint.new(0.300000,13.972363,0.000000),NumberSequenceKeypoint.new(0.400000,12.943644,0.000000),NumberSequenceKeypoint.new(0.500000,11.706139,0.000000),NumberSequenceKeypoint.new(0.600000,10.292093,0.000000),NumberSequenceKeypoint.new(0.700000,8.725957,0.000000),NumberSequenceKeypoint.new(0.800000,7.026742,0.000000),NumberSequenceKeypoint.new(0.900000,5.209591,0.000000),NumberSequenceKeypoint.new(1.000000,3.286796,0.000000),NumberSequenceKeypoint.new(1.000000,3.286796,0.000000)})
DarkSlash.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.501247,0.437500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkSlash.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
DarkSlash.LightEmission=-0.5
DarkSlash.LightInfluence=0
DarkSlash.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkSlash.Drag=0
DarkSlash.EmissionDirection=Enum.NormalId.Top
DarkSlash.SpreadAngle=Vector2.new(360.000000,-360.000000)
DarkSlash.ZOffset=0.3580000102519989
DarkSlash.Texture="rbxassetid://17218042034"
DarkSlash.LockedToPart=true
DarkSlash.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkSlash.FlipbookMode=Enum.ParticleFlipbookMode.Loop
DarkSlash.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkSlash.FlipbookStartRandom=false

local Impact5=Instance.new("ParticleEmitter", Shock)
Impact5.Name="Impact2"
Impact5.Enabled=true
Impact5.Rate=2
Impact5.Lifetime=NumberRange.new(1.600000,1.600000)
Impact5.Speed=NumberRange.new(0.000854,0.000854)
Impact5.Rotation=NumberRange.new(-360.000000,360.000000)
Impact5.RotSpeed=NumberRange.new(-30.000000,30.000000)
Impact5.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.871135,0.000000),NumberSequenceKeypoint.new(0.100000,2.838137,0.000000),NumberSequenceKeypoint.new(0.200000,4.694416,0.000000),NumberSequenceKeypoint.new(0.300000,6.427006,0.000000),NumberSequenceKeypoint.new(0.400000,8.019982,0.000000),NumberSequenceKeypoint.new(0.500000,9.453426,0.000000),NumberSequenceKeypoint.new(0.600000,10.701895,0.000000),NumberSequenceKeypoint.new(0.700000,11.732229,0.000000),NumberSequenceKeypoint.new(0.800000,12.500793,0.000000),NumberSequenceKeypoint.new(0.900000,12.953468,0.000000),NumberSequenceKeypoint.new(1.000000,13.067023,0.000000),NumberSequenceKeypoint.new(1.000000,13.067023,0.000000)})
Impact5.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.591022,0.500000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact5.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact5.LightEmission=0
Impact5.LightInfluence=0
Impact5.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact5.Drag=0
Impact5.EmissionDirection=Enum.NormalId.Top
Impact5.SpreadAngle=Vector2.new(360.000000,-360.000000)
Impact5.ZOffset=0.36000001430511475
Impact5.Texture="rbxassetid://95103479549892"
Impact5.LockedToPart=true
Impact5.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Impact5.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Impact5.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact5.FlipbookStartRandom=false

local Impact6=Instance.new("ParticleEmitter", Shock)
Impact6.Name="Impact"
Impact6.Enabled=true
Impact6.Rate=2.5
Impact6.Lifetime=NumberRange.new(1.600000,1.600000)
Impact6.Speed=NumberRange.new(0.000000,0.000000)
Impact6.Rotation=NumberRange.new(-360.000000,360.000000)
Impact6.RotSpeed=NumberRange.new(-30.000000,30.000000)
Impact6.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.020541,0.000000),NumberSequenceKeypoint.new(0.100000,3.324898,0.000000),NumberSequenceKeypoint.new(0.200000,5.499541,0.000000),NumberSequenceKeypoint.new(0.300000,7.529282,0.000000),NumberSequenceKeypoint.new(0.400000,9.395466,0.000000),NumberSequenceKeypoint.new(0.500000,11.074755,0.000000),NumberSequenceKeypoint.new(0.600000,12.537345,0.000000),NumberSequenceKeypoint.new(0.700000,13.744388,0.000000),NumberSequenceKeypoint.new(0.800000,14.644766,0.000000),NumberSequenceKeypoint.new(0.900000,15.175077,0.000000),NumberSequenceKeypoint.new(1.000000,15.308108,0.000000),NumberSequenceKeypoint.new(1.000000,15.308108,0.000000)})
Impact6.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.591022,0.500000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Impact6.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
Impact6.LightEmission=-0.5
Impact6.LightInfluence=0
Impact6.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact6.Drag=0
Impact6.EmissionDirection=Enum.NormalId.Top
Impact6.SpreadAngle=Vector2.new(0.000000,0.000000)
Impact6.ZOffset=0.35899999737739563
Impact6.Texture="rbxassetid://89469375425469"
Impact6.LockedToPart=true
Impact6.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Impact6.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Impact6.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact6.FlipbookStartRandom=false

local DarkGlow1=Instance.new("ParticleEmitter", Shock)
DarkGlow1.Name="darkglow"
DarkGlow1.Enabled=true
DarkGlow1.Rate=2
DarkGlow1.Lifetime=NumberRange.new(2.000000,2.000000)
DarkGlow1.Speed=NumberRange.new(0.000000,0.000000)
DarkGlow1.Rotation=NumberRange.new(0.000000,0.000000)
DarkGlow1.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkGlow1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,25.513514,0.000000),NumberSequenceKeypoint.new(0.100000,25.658041,0.000000),NumberSequenceKeypoint.new(0.200000,25.832272,0.000000),NumberSequenceKeypoint.new(0.300000,26.032890,0.000000),NumberSequenceKeypoint.new(0.400000,26.260151,0.000000),NumberSequenceKeypoint.new(0.500000,26.516460,0.000000),NumberSequenceKeypoint.new(0.600000,26.806372,0.000000),NumberSequenceKeypoint.new(0.700000,27.137440,0.000000),NumberSequenceKeypoint.new(0.800000,27.522360,0.000000),NumberSequenceKeypoint.new(0.900000,27.984442,0.000000),NumberSequenceKeypoint.new(1.000000,28.575136,0.000000),NumberSequenceKeypoint.new(1.000000,28.575136,0.000000)})
DarkGlow1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.498626,0.650000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkGlow1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.205406,0.205406,0.205406)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.205406,0.205406,0.205406))})
DarkGlow1.LightEmission=-0.5
DarkGlow1.LightInfluence=0
DarkGlow1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkGlow1.Drag=0
DarkGlow1.EmissionDirection=Enum.NormalId.Top
DarkGlow1.SpreadAngle=Vector2.new(0.000000,0.000000)
DarkGlow1.ZOffset=-3
DarkGlow1.Texture="rbxassetid://3052949762"
DarkGlow1.LockedToPart=true
DarkGlow1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkGlow1.FlipbookMode=Enum.ParticleFlipbookMode.Loop
DarkGlow1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkGlow1.FlipbookStartRandom=false

local Dots=Instance.new("ParticleEmitter", Shock)
Dots.Name="Dots"
Dots.Enabled=true
Dots.Rate=4
Dots.Lifetime=NumberRange.new(2.000000,2.000000)
Dots.Speed=NumberRange.new(0.000697,0.000697)
Dots.Rotation=NumberRange.new(-360.000000,360.000000)
Dots.RotSpeed=NumberRange.new(0.000000,0.000000)
Dots.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,2.751675,0.000000),NumberSequenceKeypoint.new(0.100000,4.585519,0.000000),NumberSequenceKeypoint.new(0.200000,6.306005,0.000000),NumberSequenceKeypoint.new(0.300000,7.900546,0.000000),NumberSequenceKeypoint.new(0.400000,9.353917,0.000000),NumberSequenceKeypoint.new(0.500000,10.647444,0.000000),NumberSequenceKeypoint.new(0.600000,11.757934,0.000000),NumberSequenceKeypoint.new(0.700000,12.656412,0.000000),NumberSequenceKeypoint.new(0.800000,13.307367,0.000000),NumberSequenceKeypoint.new(0.900000,13.673215,0.000000),NumberSequenceKeypoint.new(1.000000,13.758376,0.000000),NumberSequenceKeypoint.new(1.000000,13.758376,0.000000)})
Dots.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.405237,0.000000,0.000000),NumberSequenceKeypoint.new(0.586035,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Dots.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Dots.LightEmission=0
Dots.LightInfluence=0
Dots.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Dots.Drag=0
Dots.EmissionDirection=Enum.NormalId.Top
Dots.SpreadAngle=Vector2.new(360.000000,-360.000000)
Dots.ZOffset=0.35199999809265137
Dots.Texture="rbxassetid://119784156810130"
Dots.LockedToPart=true
Dots.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Dots.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Dots.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Dots.FlipbookStartRandom=false

local DarkStar=Instance.new("ParticleEmitter", Shock)
DarkStar.Name="Star"
DarkStar.Enabled=true
DarkStar.Rate=10
DarkStar.Lifetime=NumberRange.new(0.200000,0.500000)
DarkStar.Speed=NumberRange.new(0.000000,0.000000)
DarkStar.Rotation=NumberRange.new(0.000000,0.000000)
DarkStar.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkStar.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,8.295382,0.000000),NumberSequenceKeypoint.new(0.097257,8.303777,1.055901),NumberSequenceKeypoint.new(0.197007,8.240389,0.000000),NumberSequenceKeypoint.new(0.299252,8.303777,0.621118),NumberSequenceKeypoint.new(0.402743,8.113614,0.000000),NumberSequenceKeypoint.new(0.501247,8.430552,0.745342),NumberSequenceKeypoint.new(0.605985,8.050227,0.000000),NumberSequenceKeypoint.new(0.704489,8.177002,0.496894),NumberSequenceKeypoint.new(0.805486,8.050227,0.000000),NumberSequenceKeypoint.new(0.905237,8.557328,0.683230),NumberSequenceKeypoint.new(1.000000,8.295382,0.000000)})
DarkStar.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.500000,0.000000),NumberSequenceKeypoint.new(1.000000,0.500000,0.000000)})
DarkStar.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
DarkStar.LightEmission=-0.5
DarkStar.LightInfluence=0
DarkStar.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkStar.Drag=0
DarkStar.EmissionDirection=Enum.NormalId.Top
DarkStar.SpreadAngle=Vector2.new(0.000000,0.000000)
DarkStar.ZOffset=3.005000114440918
DarkStar.Texture="rbxassetid://16697790503"
DarkStar.LockedToPart=true
DarkStar.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkStar.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkStar.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkStar.FlipbookStartRandom=false

local DarkShine=Instance.new("ParticleEmitter", Shock)
DarkShine.Name="Darkshine"
DarkShine.Enabled=true
DarkShine.Rate=14
DarkShine.Lifetime=NumberRange.new(1.000000,1.200000)
DarkShine.Speed=NumberRange.new(0.000105,0.000105)
DarkShine.Rotation=NumberRange.new(-360.000000,360.000000)
DarkShine.RotSpeed=NumberRange.new(-5.000000,5.000000)
DarkShine.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,2.041081,0.000000),NumberSequenceKeypoint.new(1.000000,5.007621,0.000000)})
DarkShine.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.496259,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkShine.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
DarkShine.LightEmission=-0.4000000059604645
DarkShine.LightInfluence=0
DarkShine.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkShine.Drag=0
DarkShine.EmissionDirection=Enum.NormalId.Top
DarkShine.SpreadAngle=Vector2.new(360.000000,-360.000000)
DarkShine.ZOffset=3.009000062942505
DarkShine.Texture="rbxassetid://17391818367"
DarkShine.LockedToPart=true
DarkShine.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkShine.FlipbookMode=Enum.ParticleFlipbookMode.Loop
DarkShine.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkShine.FlipbookStartRandom=false

local Twinkle1=Instance.new("ParticleEmitter", Shock)
Twinkle1.Name="twinkle"
Twinkle1.Enabled=true
Twinkle1.Rate=11
Twinkle1.Lifetime=NumberRange.new(0.200000,0.200000)
Twinkle1.Speed=NumberRange.new(0.000834,0.000834)
Twinkle1.Rotation=NumberRange.new(45.000000,45.000000)
Twinkle1.RotSpeed=NumberRange.new(0.000000,0.000000)
Twinkle1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,2.954694,0.000000),NumberSequenceKeypoint.new(1.000000,2.954694,0.000000)})
Twinkle1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499164,0.706250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Twinkle1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Twinkle1.LightEmission=-2
Twinkle1.LightInfluence=0
Twinkle1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Twinkle1.Drag=0
Twinkle1.EmissionDirection=Enum.NormalId.Top
Twinkle1.SpreadAngle=Vector2.new(90.000000,90.000000)
Twinkle1.ZOffset=4.550000190734863
Twinkle1.Texture="rbxassetid://97749903406217"
Twinkle1.LockedToPart=true
Twinkle1.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Twinkle1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Twinkle1.FlipbookFramerate=NumberRange.new(50.000000,50.000000)
Twinkle1.FlipbookStartRandom=true

local PointLight=Instance.new("PointLight", Orb)
PointLight.Name="PointLight"

local Emitter2=Instance.new("Attachment", Orb)
Emitter2.Name="Emit"
Emitter2.CFrame=CFrame.new(0,0,0,1,0,0,0,1,0,0,0,1)
Emitter2.Position=Vector3.new(0.000000,0.000000,0.000000)
Emitter2.Orientation=Vector3.new(-0.000000,0.000000,0.000000)
Emitter2.Axis=Vector3.new(1.000000,0.000000,0.000000)
Emitter2.SecondaryAxis=Vector3.new(0.000000,1.000000,0.000000)
Emitter2.Visible=false



wed=i("Weld",Orb)
wed.Name="OrbyWeldy"





local Shock3=Instance.new("ParticleEmitter", Emitter2)
Shock3.Name="Shock3"
Shock3.Enabled=false
Shock3.Rate=25
Shock3.Lifetime=NumberRange.new(0.300000,0.300000)
Shock3.Speed=NumberRange.new(0.001000,0.001000)
Shock3.Rotation=NumberRange.new(-360.000000,360.000000)
Shock3.RotSpeed=NumberRange.new(0.000000,0.000000)
Shock3.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,4.082162,0.000000),NumberSequenceKeypoint.new(0.076271,12.118919,0.000000),NumberSequenceKeypoint.new(0.225424,17.221622,0.000000),NumberSequenceKeypoint.new(0.500000,19.517838,0.000000),NumberSequenceKeypoint.new(1.000000,20.410810,0.000000)})
Shock3.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.098901,0.756250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Shock3.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Shock3.LightEmission=0
Shock3.LightInfluence=0
Shock3.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Shock3.Drag=0
Shock3.EmissionDirection=Enum.NormalId.Top
Shock3.SpreadAngle=Vector2.new(360.000000,360.000000)
Shock3.ZOffset=0
Shock3.Texture="rbxassetid://15124481454"
Shock3.LockedToPart=false
Shock3.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Shock3.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Shock3.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Shock3.FlipbookStartRandom=false

local DarkStar=Instance.new("ParticleEmitter", Emitter2)
DarkStar.Name="Star"
DarkStar.Enabled=false
DarkStar.Rate=10
DarkStar.Lifetime=NumberRange.new(0.300000,0.300000)
DarkStar.Speed=NumberRange.new(0.000000,0.000000)
DarkStar.Rotation=NumberRange.new(0.000000,0.000000)
DarkStar.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkStar.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.215711,13.945275,1.863354),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
DarkStar.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.500000,0.000000),NumberSequenceKeypoint.new(1.000000,0.500000,0.000000)})
DarkStar.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
DarkStar.LightEmission=-0.5
DarkStar.LightInfluence=0
DarkStar.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkStar.Drag=0
DarkStar.EmissionDirection=Enum.NormalId.Top
DarkStar.SpreadAngle=Vector2.new(0.000000,0.000000)
DarkStar.ZOffset=4
DarkStar.Texture="rbxassetid://16697790503"
DarkStar.LockedToPart=true
DarkStar.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkStar.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkStar.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkStar.FlipbookStartRandom=false

local DarkStar1=Instance.new("ParticleEmitter", Emitter2)
DarkStar1.Name="Darkstar"
DarkStar1.Enabled=false
DarkStar1.Rate=10
DarkStar1.Lifetime=NumberRange.new(0.300000,0.300000)
DarkStar1.Speed=NumberRange.new(0.000000,0.000000)
DarkStar1.Rotation=NumberRange.new(0.000000,0.000000)
DarkStar1.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkStar1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.215711,13.945275,1.863354),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
DarkStar1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.500000,0.000000),NumberSequenceKeypoint.new(1.000000,0.500000,0.000000)})
DarkStar1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
DarkStar1.LightEmission=-0.5
DarkStar1.LightInfluence=0
DarkStar1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
DarkStar1.Drag=0
DarkStar1.EmissionDirection=Enum.NormalId.Top
DarkStar1.SpreadAngle=Vector2.new(0.000000,0.000000)
DarkStar1.ZOffset=4
DarkStar1.Texture="rbxassetid://16697790503"
DarkStar1.LockedToPart=true
DarkStar1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
DarkStar1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkStar1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkStar1.FlipbookStartRandom=false

local Smoke=Instance.new("ParticleEmitter", Emitter2)
Smoke.Name="u dont wnat this smoke"
Smoke.Enabled=false
Smoke.Rate=2
Smoke.Lifetime=NumberRange.new(0.350000,0.550000)
Smoke.Speed=NumberRange.new(0.000964,0.000964)
Smoke.Rotation=NumberRange.new(-1000.000000,1000.000000)
Smoke.RotSpeed=NumberRange.new(0.000000,0.000000)
Smoke.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.100000,13.298442,5.932544),NumberSequenceKeypoint.new(0.200000,17.309782,5.932544),NumberSequenceKeypoint.new(0.300000,19.737053,5.932544),NumberSequenceKeypoint.new(0.400000,21.354284,5.932544),NumberSequenceKeypoint.new(0.500000,22.462730,5.932544),NumberSequenceKeypoint.new(0.600000,23.218443,5.932544),NumberSequenceKeypoint.new(0.700000,23.715857,5.932544),NumberSequenceKeypoint.new(0.800000,24.018597,5.932544),NumberSequenceKeypoint.new(0.900000,24.173401,5.932544),NumberSequenceKeypoint.new(1.000000,24.217607,5.932544),NumberSequenceKeypoint.new(1.000000,24.217607,5.932544)})
Smoke.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.190275,0.751553,0.000000),NumberSequenceKeypoint.new(0.349894,0.850932,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Smoke.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Smoke.LightEmission=0
Smoke.LightInfluence=0
Smoke.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Smoke.Drag=0
Smoke.EmissionDirection=Enum.NormalId.Top
Smoke.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
Smoke.ZOffset=3.555999994277954
Smoke.Texture="rbxassetid://11198241185"
Smoke.LockedToPart=false
Smoke.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Smoke.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Smoke.FlipbookFramerate=NumberRange.new(30.000000,30.000000)
Smoke.FlipbookStartRandom=false

local Impact=Instance.new("ParticleEmitter", Emitter2)
Impact.Name="Impact2"
Impact.Enabled=false
Impact.Rate=2
Impact.Lifetime=NumberRange.new(0.300000,0.500000)
Impact.Speed=NumberRange.new(0.001000,0.001000)
Impact.Rotation=NumberRange.new(-1000.000000,1000.000000)
Impact.RotSpeed=NumberRange.new(0.000000,0.000000)
Impact.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.100000,11.527493,5.048995),NumberSequenceKeypoint.new(0.200000,14.946835,5.048995),NumberSequenceKeypoint.new(0.300000,16.989651,5.048995),NumberSequenceKeypoint.new(0.400000,18.332365,5.048995),NumberSequenceKeypoint.new(0.500000,19.238565,5.048995),NumberSequenceKeypoint.new(0.600000,19.845186,5.048995),NumberSequenceKeypoint.new(0.700000,20.235571,5.048995),NumberSequenceKeypoint.new(0.800000,20.466400,5.048995),NumberSequenceKeypoint.new(0.900000,20.579962,5.048995),NumberSequenceKeypoint.new(1.000000,20.610817,5.048995),NumberSequenceKeypoint.new(1.000000,20.610817,5.048995)})
Impact.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Impact.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Impact.LightEmission=0
Impact.LightInfluence=0
Impact.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact.Drag=0
Impact.EmissionDirection=Enum.NormalId.Top
Impact.SpreadAngle=Vector2.new(1000.000000,-1000.000000)
Impact.ZOffset=3.552999973297119
Impact.Texture="rbxassetid://16860307403"
Impact.LockedToPart=false
Impact.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Impact.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Impact.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact.FlipbookStartRandom=false

local Impact=Instance.new("ParticleEmitter", Emitter2)
Impact.Name="Impact"
Impact.Enabled=false
Impact.Rate=2
Impact.Lifetime=NumberRange.new(0.150000,0.300000)
Impact.Speed=NumberRange.new(0.021109,0.021109)
Impact.Rotation=NumberRange.new(-360.000000,360.000000)
Impact.RotSpeed=NumberRange.new(0.000000,0.000000)
Impact.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.100000,11.440483,5.010885),NumberSequenceKeypoint.new(0.200000,14.834016,5.010885),NumberSequenceKeypoint.new(0.300000,16.861414,5.010885),NumberSequenceKeypoint.new(0.400000,18.193993,5.010885),NumberSequenceKeypoint.new(0.500000,19.093351,5.010885),NumberSequenceKeypoint.new(0.600000,19.695393,5.010885),NumberSequenceKeypoint.new(0.700000,20.082832,5.010885),NumberSequenceKeypoint.new(0.800000,20.311920,5.010885),NumberSequenceKeypoint.new(0.900000,20.424625,5.010885),NumberSequenceKeypoint.new(1.000000,20.455246,5.010885),NumberSequenceKeypoint.new(1.000000,20.455246,5.010885)})
Impact.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Impact.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Impact.LightEmission=0
Impact.LightInfluence=0
Impact.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Impact.Drag=0
Impact.EmissionDirection=Enum.NormalId.Top
Impact.SpreadAngle=Vector2.new(360.000000,-360.000000)
Impact.ZOffset=3.5510001182556152
Impact.Texture="rbxassetid://15343033007"
Impact.LockedToPart=false
Impact.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Impact.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Impact.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Impact.FlipbookStartRandom=false

local Fog=Instance.new("ParticleEmitter", Emitter2)
Fog.Name="Foggy"
Fog.Enabled=false
Fog.Rate=20
Fog.Lifetime=NumberRange.new(0.350000,0.485000)
Fog.Speed=NumberRange.new(0.024627,0.024627)
Fog.Rotation=NumberRange.new(0.000000,360.000000)
Fog.RotSpeed=NumberRange.new(0.000000,0.000000)
Fog.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.100000,5.067104,4.965118),NumberSequenceKeypoint.new(0.200000,8.239219,8.073387),NumberSequenceKeypoint.new(0.300000,10.825111,9.850616),NumberSequenceKeypoint.new(0.400000,13.021883,9.850616),NumberSequenceKeypoint.new(0.500000,14.902777,9.850616),NumberSequenceKeypoint.new(0.600000,16.499428,9.850616),NumberSequenceKeypoint.new(0.700000,17.823463,9.850616),NumberSequenceKeypoint.new(0.800000,18.874161,9.850616),NumberSequenceKeypoint.new(0.900000,19.641317,9.850616),NumberSequenceKeypoint.new(1.000000,20.105907,9.850616),NumberSequenceKeypoint.new(1.000000,20.105907,9.850616)})
Fog.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.414905,0.645963,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Fog.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Fog.LightEmission=0
Fog.LightInfluence=0
Fog.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Fog.Drag=0
Fog.EmissionDirection=Enum.NormalId.Top
Fog.SpreadAngle=Vector2.new(360.000000,360.000000)
Fog.ZOffset=3.549999952316284
Fog.Texture="rbxassetid://15056677063"
Fog.LockedToPart=false
Fog.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Fog.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Fog.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Fog.FlipbookStartRandom=false

local Shock=Instance.new("ParticleEmitter", Emitter2)
Shock.Name="Shocker"
Shock.Enabled=false
Shock.Rate=4
Shock.Lifetime=NumberRange.new(0.350000,0.350000)
Shock.Speed=NumberRange.new(0.000000,0.000000)
Shock.Rotation=NumberRange.new(-1000.000000,1000.000000)
Shock.RotSpeed=NumberRange.new(0.000000,0.000000)
Shock.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.104474,9.328000,0.000000),NumberSequenceKeypoint.new(0.344474,18.337002,0.000000),NumberSequenceKeypoint.new(0.642474,20.279139,0.000000),NumberSequenceKeypoint.new(1.000000,24.276699,0.000000)})
Shock.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.681250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Shock.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Shock.LightEmission=0
Shock.LightInfluence=0
Shock.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Shock.Drag=0
Shock.EmissionDirection=Enum.NormalId.Top
Shock.SpreadAngle=Vector2.new(360.000000,360.000000)
Shock.ZOffset=0
Shock.Texture="rbxassetid://16878076248"
Shock.LockedToPart=false
Shock.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Shock.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Shock.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Shock.FlipbookStartRandom=false

local Shock1=Instance.new("ParticleEmitter", Emitter2)
Shock1.Name="Shock"
Shock1.Enabled=false
Shock1.Rate=2
Shock1.Lifetime=NumberRange.new(0.250000,0.250000)
Shock1.Speed=NumberRange.new(0.000000,0.000000)
Shock1.Rotation=NumberRange.new(0.000000,360.000000)
Shock1.RotSpeed=NumberRange.new(0.000000,0.000000)
Shock1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.119250,11.356447,0.000000),NumberSequenceKeypoint.new(0.341250,15.817480,0.000000),NumberSequenceKeypoint.new(0.593224,18.945684,0.000000),NumberSequenceKeypoint.new(1.000000,20.133568,0.000000)})
Shock1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Shock1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Shock1.LightEmission=0
Shock1.LightInfluence=0
Shock1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Shock1.Drag=0
Shock1.EmissionDirection=Enum.NormalId.Top
Shock1.SpreadAngle=Vector2.new(0.000000,0.000000)
Shock1.ZOffset=2
Shock1.Texture="rbxassetid://14152113700"
Shock1.LockedToPart=false
Shock1.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Shock1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Shock1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Shock1.FlipbookStartRandom=false

local Flare=Instance.new("ParticleEmitter", Emitter2)
Flare.Name="Flare"
Flare.Enabled=false
Flare.Rate=4
Flare.Lifetime=NumberRange.new(0.300000,0.300000)
Flare.Speed=NumberRange.new(0.000944,0.000944)
Flare.Rotation=NumberRange.new(-360.000000,360.000000)
Flare.RotSpeed=NumberRange.new(0.000000,0.000000)
Flare.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,19.343966,0.574382),NumberSequenceKeypoint.new(0.100000,20.667547,0.574382),NumberSequenceKeypoint.new(0.200000,21.916622,0.574382),NumberSequenceKeypoint.new(0.300000,23.082468,0.574382),NumberSequenceKeypoint.new(0.400000,24.154373,0.574382),NumberSequenceKeypoint.new(0.500000,25.118925,0.574382),NumberSequenceKeypoint.new(0.600000,25.959015,0.574382),NumberSequenceKeypoint.new(0.700000,26.652313,0.574382),NumberSequenceKeypoint.new(0.800000,27.169483,0.574382),NumberSequenceKeypoint.new(0.900000,27.474081,0.574382),NumberSequenceKeypoint.new(1.000000,27.550491,0.574382),NumberSequenceKeypoint.new(1.000000,27.550491,0.574382)})
Flare.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.502494,0.775000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Flare.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Flare.LightEmission=-1
Flare.LightInfluence=0
Flare.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Flare.Drag=0
Flare.EmissionDirection=Enum.NormalId.Top
Flare.SpreadAngle=Vector2.new(360.000000,-360.000000)
Flare.ZOffset=3.5
Flare.Texture="rbxassetid://13712002536"
Flare.LockedToPart=false
Flare.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Flare.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Flare.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Flare.FlipbookStartRandom=false

local Glow=Instance.new("ParticleEmitter", Emitter2)
Glow.Name="Glow"
Glow.Enabled=false
Glow.Rate=2
Glow.Lifetime=NumberRange.new(0.250000,0.250000)
Glow.Speed=NumberRange.new(0.000000,0.000000)
Glow.Rotation=NumberRange.new(0.000000,0.000000)
Glow.RotSpeed=NumberRange.new(0.000000,0.000000)
Glow.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,25.513514,0.000000),NumberSequenceKeypoint.new(0.100000,25.647943,0.000000),NumberSequenceKeypoint.new(0.200000,26.162476,0.000000),NumberSequenceKeypoint.new(0.300000,27.017300,0.000000),NumberSequenceKeypoint.new(0.400000,28.149769,0.000000),NumberSequenceKeypoint.new(0.500000,29.512081,0.000000),NumberSequenceKeypoint.new(0.600000,31.068737,0.000000),NumberSequenceKeypoint.new(0.700000,32.792824,0.000000),NumberSequenceKeypoint.new(0.800000,34.663406,0.000000),NumberSequenceKeypoint.new(0.900000,36.663826,0.000000),NumberSequenceKeypoint.new(1.000000,38.780540,0.000000),NumberSequenceKeypoint.new(1.000000,38.780540,0.000000)})
Glow.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.487500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Glow.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Glow.LightEmission=0
Glow.LightInfluence=0
Glow.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Glow.Drag=0
Glow.EmissionDirection=Enum.NormalId.Top
Glow.SpreadAngle=Vector2.new(0.000000,0.000000)
Glow.ZOffset=4
Glow.Texture="rbxassetid://14183571391"
Glow.LockedToPart=false
Glow.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Glow.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Glow.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Glow.FlipbookStartRandom=false

local Debris=Instance.new("ParticleEmitter", Emitter2)
Debris.Name="Debris"
Debris.Enabled=false
Debris.Rate=20
Debris.Lifetime=NumberRange.new(0.600000,1.400000)
Debris.Speed=NumberRange.new(69.445038,130.209457)
Debris.Rotation=NumberRange.new(-1000.000000,1000.000000)
Debris.RotSpeed=NumberRange.new(-175.000000,175.000000)
Debris.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(0.123441,7.416350,2.732920),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Debris.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,0.000000,0.000000)})
Debris.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.794594,0.794594,0.794594)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.794594,0.794594,0.794594))})
Debris.LightEmission=0
Debris.LightInfluence=0
Debris.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Debris.Drag=6
Debris.EmissionDirection=Enum.NormalId.Top
Debris.SpreadAngle=Vector2.new(360.000000,360.000000)
Debris.ZOffset=3.509999990463257
Debris.Texture="rbxassetid://2545904564"
Debris.LockedToPart=false
Debris.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Debris.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Debris.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Debris.FlipbookStartRandom=false






local Floor=Instance.new("Part", Model)
Floor.Name="Floor"
Floor.Anchored=true
Floor.CanCollide=false
Floor.CanQuery=false
Floor.CanTouch=false
Floor.Transparency=1
Floor.Reflectance=0
Floor.Color=Color3.new(0,0,0)
Floor.Material=Enum.Material.Plastic
Floor.Size=Vector3.new(60,1,60)
--Floor.CFrame=CFrame.new(211.32192993164062,88.14154815673828,-367.06134033203125,0.6427632570266724,0,0.7660648822784424,0,1,0,-0.7660648822784424,0,0.6427632570266724)
--Floor.Orientation=Vector3.new(0.000000,50.001999,0.000000)
--Floor.Position=Vector3.new(211.321930,88.141548,-367.061340)
Floor.CastShadow=true
Floor.Massless=true

local Floor2= Instance.new("Attachment", Floor)
Floor2.Name="Floor"
Floor2.Position=Vector3.new(0.000000,.515,0.000000)
Floor2.Visible=false

local Logo=Instance.new("ParticleEmitter", Floor2)
Logo.Name="logo"
Logo.Enabled=false
Logo.Rate=10
Logo.Lifetime=NumberRange.new(2.000000,2.000000)
Logo.Speed=NumberRange.new(0.001000,0.001000)
Logo.Rotation=NumberRange.new(0.000000,0.000000)
Logo.RotSpeed=NumberRange.new(0.000000,0.000000)
Logo.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,9.001414,0.000000),NumberSequenceKeypoint.new(1.000000,9.001414,0.000000)})
Logo.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499174,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Logo.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Logo.LightEmission=0
Logo.LightInfluence=0
Logo.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Logo.Drag=0
Logo.EmissionDirection=Enum.NormalId.Bottom
Logo.SpreadAngle=Vector2.new(0.003000,0.003000)
Logo.ZOffset=0.10999999940395355
Logo.Texture="rbxassetid://103591556248770"
Logo.LockedToPart=true
Logo.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Logo.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Logo.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Logo.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Logo.FlipbookStartRandom=false

local Cracks=Instance.new("ParticleEmitter", Floor2)
Cracks.Name="cracks"
Cracks.Enabled=true
Cracks.Rate=2
Cracks.Lifetime=NumberRange.new(1.000000,2.000000)
Cracks.Speed=NumberRange.new(0.001000,0.001000)
Cracks.Rotation=NumberRange.new(0.000000,360.000000)
Cracks.RotSpeed=NumberRange.new(-80.000000,-30.000000)
Cracks.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,12.001885,6.000000),NumberSequenceKeypoint.new(0.100000,12.064971,6.000000),NumberSequenceKeypoint.new(0.200000,12.302635,6.000000),NumberSequenceKeypoint.new(0.300000,12.693851,6.000000),NumberSequenceKeypoint.new(0.400000,13.209258,6.000000),NumberSequenceKeypoint.new(0.500000,13.826952,6.000000),NumberSequenceKeypoint.new(0.600000,14.530854,6.000000),NumberSequenceKeypoint.new(0.700000,15.308852,6.000000),NumberSequenceKeypoint.new(0.800000,16.151569,6.000000),NumberSequenceKeypoint.new(0.900000,17.051571,6.000000),NumberSequenceKeypoint.new(1.000000,18.002829,6.000000),NumberSequenceKeypoint.new(1.000000,18.002829,6.000000)})
Cracks.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499174,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Cracks.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Cracks.LightEmission=1
Cracks.LightInfluence=0
Cracks.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Cracks.Drag=0
Cracks.EmissionDirection=Enum.NormalId.Top
Cracks.SpreadAngle=Vector2.new(1.000000,1.000000)
Cracks.ZOffset=0
Cracks.Texture="rbxassetid://75402530690234"
Cracks.LockedToPart=true
Cracks.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Cracks.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Cracks.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Cracks.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Cracks.FlipbookStartRandom=false

local Ink=Instance.new("ParticleEmitter", Floor2)
Ink.Name="inkslashup"
Ink.Enabled=true
Ink.Rate=6
Ink.Lifetime=NumberRange.new(1.000000,1.200000)
Ink.Speed=NumberRange.new(2.000000,6.000000)
Ink.Rotation=NumberRange.new(0.000000,360.000000)
Ink.RotSpeed=NumberRange.new(-50.000000,-50.000000)
Ink.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,20.003141,0.000000),NumberSequenceKeypoint.new(0.100000,19.919027,0.000000),NumberSequenceKeypoint.new(0.200000,19.602140,0.000000),NumberSequenceKeypoint.new(0.300000,19.080519,0.000000),NumberSequenceKeypoint.new(0.400000,18.393312,0.000000),NumberSequenceKeypoint.new(0.500000,17.569719,0.000000),NumberSequenceKeypoint.new(0.600000,16.631184,0.000000),NumberSequenceKeypoint.new(0.700000,15.593853,0.000000),NumberSequenceKeypoint.new(0.800000,14.470228,0.000000),NumberSequenceKeypoint.new(0.900000,13.270227,0.000000),NumberSequenceKeypoint.new(1.000000,12.001885,0.000000),NumberSequenceKeypoint.new(1.000000,12.001885,0.000000)})
Ink.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.308540,0.000000,0.000000),NumberSequenceKeypoint.new(0.439669,0.590062,0.000000),NumberSequenceKeypoint.new(0.565289,0.869565,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Ink.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Ink.LightEmission=1
Ink.LightInfluence=0
Ink.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Ink.Drag=0
Ink.EmissionDirection=Enum.NormalId.Top
Ink.SpreadAngle=Vector2.new(8.000000,8.000000)
Ink.ZOffset=0
Ink.Texture="http://www.roblox.com/asset/?id=120320962206652"
Ink.LockedToPart=true
Ink.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Ink.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Ink.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Ink.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Ink.FlipbookStartRandom=false

local Cracks=Instance.new("ParticleEmitter", Floor2)
Cracks.Name="cracks"
Cracks.Enabled=true
Cracks.Rate=1
Cracks.Lifetime=NumberRange.new(2.000000,2.000000)
Cracks.Speed=NumberRange.new(0.001000,0.001000)
Cracks.Rotation=NumberRange.new(0.000000,0.000000)
Cracks.RotSpeed=NumberRange.new(-30.000000,-30.000000)
Cracks.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,25.003927,6.000000),NumberSequenceKeypoint.new(0.100000,24.898787,6.000000),NumberSequenceKeypoint.new(0.200000,24.502676,6.000000),NumberSequenceKeypoint.new(0.300000,23.850651,6.000000),NumberSequenceKeypoint.new(0.400000,22.991640,6.000000),NumberSequenceKeypoint.new(0.500000,21.962149,6.000000),NumberSequenceKeypoint.new(0.600000,20.788979,6.000000),NumberSequenceKeypoint.new(0.700000,19.492315,6.000000),NumberSequenceKeypoint.new(0.800000,18.087786,6.000000),NumberSequenceKeypoint.new(0.900000,16.587784,6.000000),NumberSequenceKeypoint.new(1.000000,15.002357,6.000000),NumberSequenceKeypoint.new(1.000000,15.002357,6.000000)})
Cracks.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499174,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Cracks.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Cracks.LightEmission=0
Cracks.LightInfluence=0
Cracks.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Cracks.Drag=0
Cracks.EmissionDirection=Enum.NormalId.Top
Cracks.SpreadAngle=Vector2.new(1.000000,1.000000)
Cracks.ZOffset=0
Cracks.Texture="rbxassetid://17223867020"
Cracks.LockedToPart=true
Cracks.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Cracks.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Cracks.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Cracks.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Cracks.FlipbookStartRandom=false

local Crack2=Instance.new("ParticleEmitter", Floor2)
Crack2.Name="cracks"
Crack2.Enabled=true
Crack2.Rate=5
Crack2.Lifetime=NumberRange.new(2.000000,2.000000)
Crack2.Speed=NumberRange.new(0.000430,0.000430)
Crack2.Rotation=NumberRange.new(-360.000000,360.000000)
Crack2.RotSpeed=NumberRange.new(-40.000000,-40.000000)
Crack2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,9.897352,0.000000),NumberSequenceKeypoint.new(1.000000,8.100982,0.000000)})
Crack2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499174,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Crack2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Crack2.LightEmission=-1
Crack2.LightInfluence=0
Crack2.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Crack2.Drag=0
Crack2.EmissionDirection=Enum.NormalId.Top
Crack2.SpreadAngle=Vector2.new(1.000000,1.000000)
Crack2.ZOffset=0
Crack2.Texture="rbxassetid://75402530690234"
Crack2.LockedToPart=true
Crack2.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Crack2.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Crack2.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Crack2.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Crack2.FlipbookStartRandom=false

local Ink1=Instance.new("ParticleEmitter", Floor2)
Ink1.Name="inkslashup"
Ink1.Enabled=true
Ink1.Rate=6
Ink1.Lifetime=NumberRange.new(1.000000,1.200000)
Ink1.Speed=NumberRange.new(2.000000,6.000000)
Ink1.Rotation=NumberRange.new(0.000000,360.000000)
Ink1.RotSpeed=NumberRange.new(-50.000000,-50.000000)
Ink1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,20.003141,0.000000),NumberSequenceKeypoint.new(0.100000,19.919027,0.000000),NumberSequenceKeypoint.new(0.200000,19.602140,0.000000),NumberSequenceKeypoint.new(0.300000,19.080519,0.000000),NumberSequenceKeypoint.new(0.400000,18.393312,0.000000),NumberSequenceKeypoint.new(0.500000,17.569719,0.000000),NumberSequenceKeypoint.new(0.600000,16.631184,0.000000),NumberSequenceKeypoint.new(0.700000,15.593853,0.000000),NumberSequenceKeypoint.new(0.800000,14.470228,0.000000),NumberSequenceKeypoint.new(0.900000,13.270227,0.000000),NumberSequenceKeypoint.new(1.000000,12.001885,0.000000),NumberSequenceKeypoint.new(1.000000,12.001885,0.000000)})
Ink1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.308540,0.000000,0.000000),NumberSequenceKeypoint.new(0.439669,0.590062,0.000000),NumberSequenceKeypoint.new(0.565289,0.869565,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Ink1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Ink1.LightEmission=1
Ink1.LightInfluence=0
Ink1.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Ink1.Drag=0
Ink1.EmissionDirection=Enum.NormalId.Top
Ink1.SpreadAngle=Vector2.new(8.000000,8.000000)
Ink1.ZOffset=0
Ink1.Texture="rbxassetid://72439972737297"
Ink1.LockedToPart=true
Ink1.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Ink1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Ink1.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Ink1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Ink1.FlipbookStartRandom=false

local Logo1=Instance.new("ParticleEmitter", Floor2)
Logo1.Name="logoreach"
Logo1.Enabled=false
Logo1.Rate=0.5
Logo1.Lifetime=NumberRange.new(2.000000,2.000000)
Logo1.Speed=NumberRange.new(0.001000,0.001000)
Logo1.Rotation=NumberRange.new(0.000000,0.000000)
Logo1.RotSpeed=NumberRange.new(0.000000,0.000000)
Logo1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,9.001414,0.000000),NumberSequenceKeypoint.new(0.100000,9.235092,0.000000),NumberSequenceKeypoint.new(0.200000,9.459246,0.000000),NumberSequenceKeypoint.new(0.300000,9.685756,0.000000),NumberSequenceKeypoint.new(0.400000,9.921442,0.000000),NumberSequenceKeypoint.new(0.500000,10.172012,0.000000),NumberSequenceKeypoint.new(0.600000,10.443659,0.000000),NumberSequenceKeypoint.new(0.700000,10.744427,0.000000),NumberSequenceKeypoint.new(0.800000,11.086377,0.000000),NumberSequenceKeypoint.new(0.900000,11.490484,0.000000),NumberSequenceKeypoint.new(1.000000,12.001885,0.000000),NumberSequenceKeypoint.new(1.000000,12.001885,0.000000)})
Logo1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499174,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Logo1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Logo1.LightEmission=0.4000000059604645
Logo1.LightInfluence=0
Logo1.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Logo1.Drag=0
Logo1.EmissionDirection=Enum.NormalId.Bottom
Logo1.SpreadAngle=Vector2.new(0.003000,0.003000)
Logo1.ZOffset=0.11999999731779099
Logo1.Texture="rbxassetid://103591556248770"
Logo1.LockedToPart=true
Logo1.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Logo1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Logo1.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Logo1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Logo1.FlipbookStartRandom=false

local Swirl=Instance.new("ParticleEmitter", Floor2)
Swirl.Name="bigfat swirl0"
Swirl.Enabled=true
Swirl.Rate=1
Swirl.Lifetime=NumberRange.new(2.000000,2.000000)
Swirl.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl.Rotation=NumberRange.new(0.000000,0.000000)
Swirl.RotSpeed=NumberRange.new(50.000000,50.000000)
Swirl.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,60.009426,6.000000),NumberSequenceKeypoint.new(0.100000,59.799141,6.000000),NumberSequenceKeypoint.new(0.200000,59.006924,6.000000),NumberSequenceKeypoint.new(0.300000,57.702873,6.000000),NumberSequenceKeypoint.new(0.400000,55.984852,6.000000),NumberSequenceKeypoint.new(0.500000,53.925869,6.000000),NumberSequenceKeypoint.new(0.600000,51.579529,6.000000),NumberSequenceKeypoint.new(0.700000,48.986202,6.000000),NumberSequenceKeypoint.new(0.800000,46.177139,6.000000),NumberSequenceKeypoint.new(0.900000,43.177139,6.000000),NumberSequenceKeypoint.new(1.000000,40.006283,6.000000),NumberSequenceKeypoint.new(1.000000,40.006283,6.000000)})
Swirl.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.498750,0.812500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Swirl.LightEmission=0.10000000149011612
Swirl.LightInfluence=0
Swirl.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl.Drag=0
Swirl.EmissionDirection=Enum.NormalId.Top
Swirl.SpreadAngle=Vector2.new(0.100000,0.100000)
Swirl.ZOffset=0
Swirl.Texture="rbxassetid://129970553305560"
Swirl.LockedToPart=true
Swirl.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Swirl.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl.FlipbookStartRandom=false

local Swirl1=Instance.new("ParticleEmitter", Floor2)
Swirl1.Name="bigfat swirl1"
Swirl1.Enabled=true
Swirl1.Rate=3
Swirl1.Lifetime=NumberRange.new(2.000000,2.000000)
Swirl1.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl1.Rotation=NumberRange.new(0.000000,0.000000)
Swirl1.RotSpeed=NumberRange.new(50.000000,50.000000)
Swirl1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,21.659653,3.712500),NumberSequenceKeypoint.new(0.100000,21.529537,3.712500),NumberSequenceKeypoint.new(0.200000,21.039354,3.712500),NumberSequenceKeypoint.new(0.300000,20.232473,3.712500),NumberSequenceKeypoint.new(0.400000,19.169447,3.712500),NumberSequenceKeypoint.new(0.500000,17.895451,3.712500),NumberSequenceKeypoint.new(0.600000,16.443653,3.712500),NumberSequenceKeypoint.new(0.700000,14.839034,3.712500),NumberSequenceKeypoint.new(0.800000,13.100926,3.712500),NumberSequenceKeypoint.new(0.900000,11.244674,3.712500),NumberSequenceKeypoint.new(1.000000,9.282708,3.712500),NumberSequenceKeypoint.new(1.000000,9.282708,3.712500)})
Swirl1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.475000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Swirl1.LightEmission=1
Swirl1.LightInfluence=0
Swirl1.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl1.Drag=0
Swirl1.EmissionDirection=Enum.NormalId.Top
Swirl1.SpreadAngle=Vector2.new(0.500000,0.500000)
Swirl1.ZOffset=0.0010000000474974513
Swirl1.Texture="rbxassetid://130062310628140"
Swirl1.LockedToPart=true
Swirl1.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl1.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Swirl1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl1.FlipbookStartRandom=false

local Swirl2=Instance.new("ParticleEmitter", Floor2)
Swirl2.Name="bigfat swirl2"
Swirl2.Enabled=true
Swirl2.Rate=3
Swirl2.Lifetime=NumberRange.new(2.000000,2.000000)
Swirl2.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl2.Rotation=NumberRange.new(0.000000,0.000000)
Swirl2.RotSpeed=NumberRange.new(50.000000,50.000000)
Swirl2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,60.009426,6.000000),NumberSequenceKeypoint.new(0.100000,59.799141,6.000000),NumberSequenceKeypoint.new(0.200000,59.006924,6.000000),NumberSequenceKeypoint.new(0.300000,57.702873,6.000000),NumberSequenceKeypoint.new(0.400000,55.984852,6.000000),NumberSequenceKeypoint.new(0.500000,53.925869,6.000000),NumberSequenceKeypoint.new(0.600000,51.579529,6.000000),NumberSequenceKeypoint.new(0.700000,48.986202,6.000000),NumberSequenceKeypoint.new(0.800000,46.177139,6.000000),NumberSequenceKeypoint.new(0.900000,43.177139,6.000000),NumberSequenceKeypoint.new(1.000000,40.006283,6.000000),NumberSequenceKeypoint.new(1.000000,40.006283,6.000000)})
Swirl2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.475000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Swirl2.LightEmission=0.10000000149011612
Swirl2.LightInfluence=0
Swirl2.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl2.Drag=0
Swirl2.EmissionDirection=Enum.NormalId.Top
Swirl2.SpreadAngle=Vector2.new(0.500000,0.500000)
Swirl2.ZOffset=0
Swirl2.Texture="rbxassetid://122715342103378"
Swirl2.LockedToPart=true
Swirl2.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl2.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl2.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Swirl2.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl2.FlipbookStartRandom=false

local Swirl3=Instance.new("ParticleEmitter", Floor2)
Swirl3.Name="bigfat swirl3"
Swirl3.Enabled=true
Swirl3.Rate=10
Swirl3.Lifetime=NumberRange.new(2.000000,2.000000)
Swirl3.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl3.Rotation=NumberRange.new(-360.000000,360.000000)
Swirl3.RotSpeed=NumberRange.new(35.000000,35.000000)
Swirl3.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,21.003300,6.300000),NumberSequenceKeypoint.new(0.100000,21.168898,6.300000),NumberSequenceKeypoint.new(0.200000,21.792770,6.300000),NumberSequenceKeypoint.new(0.300000,22.819712,6.300000),NumberSequenceKeypoint.new(0.400000,24.172651,6.300000),NumberSequenceKeypoint.new(0.500000,25.794102,6.300000),NumberSequenceKeypoint.new(0.600000,27.641842,6.300000),NumberSequenceKeypoint.new(0.700000,29.684088,6.300000),NumberSequenceKeypoint.new(0.800000,31.896223,6.300000),NumberSequenceKeypoint.new(0.900000,34.258724,6.300000),NumberSequenceKeypoint.new(1.000000,36.755775,6.300000),NumberSequenceKeypoint.new(1.000000,36.755775,6.300000)})
Swirl3.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.501374,0.706250,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl3.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Swirl3.LightEmission=-1
Swirl3.LightInfluence=0
Swirl3.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl3.Drag=0
Swirl3.EmissionDirection=Enum.NormalId.Top
Swirl3.SpreadAngle=Vector2.new(0.500000,0.500000)
Swirl3.ZOffset=-0.0020000000949949026
Swirl3.Texture="rbxassetid://74105581300423"
Swirl3.LockedToPart=true
Swirl3.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl3.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Swirl3.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Swirl3.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl3.FlipbookStartRandom=false

local Swirl4=Instance.new("ParticleEmitter", Floor2)
Swirl4.Name="bigfat swirl4"
Swirl4.Enabled=true
Swirl4.Rate=4
Swirl4.Lifetime=NumberRange.new(2.000000,2.000000)
Swirl4.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl4.Rotation=NumberRange.new(-360.000000,360.000000)
Swirl4.RotSpeed=NumberRange.new(35.000000,35.000000)
Swirl4.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,41.022068,9.843750),NumberSequenceKeypoint.new(0.100000,40.935822,9.843750),NumberSequenceKeypoint.new(0.200000,40.610886,9.843750),NumberSequenceKeypoint.new(0.300000,40.076019,9.843750),NumberSequenceKeypoint.new(0.400000,39.371365,9.843750),NumberSequenceKeypoint.new(0.500000,38.526855,9.843750),NumberSequenceKeypoint.new(0.600000,37.564495,9.843750),NumberSequenceKeypoint.new(0.700000,36.500824,9.843750),NumberSequenceKeypoint.new(0.800000,35.348675,9.843750),NumberSequenceKeypoint.new(0.900000,34.118198,9.843750),NumberSequenceKeypoint.new(1.000000,32.817654,9.843750),NumberSequenceKeypoint.new(1.000000,32.817654,9.843750)})
Swirl4.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.495879,0.237500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl4.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Swirl4.LightEmission=-1
Swirl4.LightInfluence=0
Swirl4.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl4.Drag=0
Swirl4.EmissionDirection=Enum.NormalId.Top
Swirl4.SpreadAngle=Vector2.new(0.500000,0.500000)
Swirl4.ZOffset=-0.0010000000474974513
Swirl4.Texture="rbxassetid://92746635364590"
Swirl4.LockedToPart=true
Swirl4.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl4.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl4.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Swirl4.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl4.FlipbookStartRandom=false

local Swirl5=Instance.new("ParticleEmitter", Floor2)
Swirl5.Name="bigfat swirl6"
Swirl5.Enabled=true
Swirl5.Rate=.5
Swirl5.Lifetime=NumberRange.new(4.000000,4.000000)
Swirl5.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl5.Rotation=NumberRange.new(0.000000,0.000000)
Swirl5.RotSpeed=NumberRange.new(48.000000,48.000000)
Swirl5.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,37.330662,4.147200),NumberSequenceKeypoint.new(0.100000,37.047237,4.147200),NumberSequenceKeypoint.new(0.200000,35.979454,4.147200),NumberSequenceKeypoint.new(0.300000,34.221798,4.147200),NumberSequenceKeypoint.new(0.400000,31.906181,4.147200),NumberSequenceKeypoint.new(0.500000,29.131002,4.147200),NumberSequenceKeypoint.new(0.600000,25.968512,4.147200),NumberSequenceKeypoint.new(0.700000,22.473124,4.147200),NumberSequenceKeypoint.new(0.800000,18.686958,4.147200),NumberSequenceKeypoint.new(0.900000,14.643435,4.147200),NumberSequenceKeypoint.new(1.000000,10.369628,4.147200),NumberSequenceKeypoint.new(1.000000,10.369628,4.147200)})
Swirl5.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.499174,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl5.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Swirl5.LightEmission=0
Swirl5.LightInfluence=0
Swirl5.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl5.Drag=0
Swirl5.EmissionDirection=Enum.NormalId.Top
Swirl5.SpreadAngle=Vector2.new(0.500000,0.500000)
Swirl5.ZOffset=0.0020000000949949026
Swirl5.Texture="rbxassetid://100891617826830"
Swirl5.LockedToPart=true
Swirl5.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl5.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl5.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Swirl5.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl5.FlipbookStartRandom=false

local Swirl6=Instance.new("ParticleEmitter", Floor2)
Swirl6.Name="bigfat swirl6"
Swirl6.Enabled=true
Swirl6.Rate=3
Swirl6.Lifetime=NumberRange.new(2.000000,2.000000)
Swirl6.Speed=NumberRange.new(-0.500000,-0.500000)
Swirl6.Rotation=NumberRange.new(0.000000,0.000000)
Swirl6.RotSpeed=NumberRange.new(50.000000,50.000000)
Swirl6.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,38.506050,6.600000),NumberSequenceKeypoint.new(0.100000,38.274734,6.600000),NumberSequenceKeypoint.new(0.200000,37.403294,6.600000),NumberSequenceKeypoint.new(0.300000,35.968842,6.600000),NumberSequenceKeypoint.new(0.400000,34.079014,6.600000),NumberSequenceKeypoint.new(0.500000,31.814133,6.600000),NumberSequenceKeypoint.new(0.600000,29.233162,6.600000),NumberSequenceKeypoint.new(0.700000,26.380507,6.600000),NumberSequenceKeypoint.new(0.800000,23.290537,6.600000),NumberSequenceKeypoint.new(0.900000,19.990532,6.600000),NumberSequenceKeypoint.new(1.000000,16.502592,6.600000),NumberSequenceKeypoint.new(1.000000,16.502592,6.600000)})
Swirl6.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.475000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl6.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.998430,0.998430,0.998430)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.998430,0.998430,0.998430))})
Swirl6.LightEmission=1
Swirl6.LightInfluence=0
Swirl6.Acceleration=Vector3.new(0.000000,0.000000,0.000001)
Swirl6.Drag=0
Swirl6.EmissionDirection=Enum.NormalId.Top
Swirl6.SpreadAngle=Vector2.new(0.500000,0.500000)
Swirl6.ZOffset=0.0010000000474974513
Swirl6.Texture="rbxassetid://122715342103378"
Swirl6.LockedToPart=true
Swirl6.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl6.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl6.FlipbookMode=Enum.ParticleFlipbookMode.Loop
Swirl6.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl6.FlipbookStartRandom=false



local AttachmentClone=Instance.new("Attachment", Floor2)
AttachmentClone.Name="Attachment"
AttachmentClone.Visible=false

local Debris=Instance.new("ParticleEmitter", AttachmentClone)
Debris.Name="debris"
Debris.Enabled=true
Debris.Rate=3
Debris.Lifetime=NumberRange.new(2.000000,2.000000)
Debris.Speed=NumberRange.new(18.673553,18.673553)
Debris.Rotation=NumberRange.new(90.000000,90.000000)
Debris.RotSpeed=NumberRange.new(0.000000,0.000000)
Debris.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,5.280000,0.000000),NumberSequenceKeypoint.new(1.000000,5.280000,0.000000)})
Debris.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.205000,0.000000,0.000000),NumberSequenceKeypoint.new(0.837500,1.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Debris.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
Debris.LightEmission=0
Debris.LightInfluence=0
Debris.Acceleration=Vector3.new(0.000000,-13.505184,-31.122433)
Debris.Drag=0
Debris.EmissionDirection=Enum.NormalId.Right
Debris.SpreadAngle=Vector2.new(15.000000,50.000000)
Debris.ZOffset=0.050999999046325684
Debris.Texture="rbxassetid://129874527856523"
Debris.LockedToPart=true
Debris.Orientation=Enum.ParticleOrientation.VelocityParallel
Debris.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
Debris.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Debris.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Debris.FlipbookStartRandom=false

local DarkFog=Instance.new("ParticleEmitter", AttachmentClone)
DarkFog.Name="dark fog3"
DarkFog.Enabled=true
DarkFog.Rate=2
DarkFog.Lifetime=NumberRange.new(2.000000,2.000000)
DarkFog.Speed=NumberRange.new(18.673553,18.673553)
DarkFog.Rotation=NumberRange.new(90.000000,90.000000)
DarkFog.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkFog.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,31.680000,0.000000),NumberSequenceKeypoint.new(1.000000,10.559999,0.000000)})
DarkFog.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.297500,0.731250,0.000000),NumberSequenceKeypoint.new(0.720000,1.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkFog.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
DarkFog.LightEmission=-1
DarkFog.LightInfluence=0
DarkFog.Acceleration=Vector3.new(0.000000,-11.393184,-31.122433)
DarkFog.Drag=0
DarkFog.EmissionDirection=Enum.NormalId.Right
DarkFog.SpreadAngle=Vector2.new(15.000000,50.000000)
DarkFog.ZOffset=0.05130000039935112
DarkFog.Texture="rbxassetid://11941047152"
DarkFog.LockedToPart=true
DarkFog.Orientation=Enum.ParticleOrientation.VelocityParallel
DarkFog.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
DarkFog.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkFog.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkFog.FlipbookStartRandom=false

local Electric=Instance.new("ParticleEmitter", AttachmentClone)
Electric.Name="eletric thing"
Electric.Enabled=true
Electric.Rate=2
Electric.Lifetime=NumberRange.new(0.800000,1.500000)
Electric.Speed=NumberRange.new(15.840000,15.840000)
Electric.Rotation=NumberRange.new(-90.000000,-90.000000)
Electric.RotSpeed=NumberRange.new(0.000000,0.000000)
Electric.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,3.168000,0.000000),NumberSequenceKeypoint.new(1.000000,3.168000,0.000000)})
Electric.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.253750,0.562500,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Electric.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
Electric.LightEmission=1
Electric.LightInfluence=0
Electric.Acceleration=Vector3.new(0.000000,-6.113184,-31.122433)
Electric.Drag=0
Electric.EmissionDirection=Enum.NormalId.Right
Electric.SpreadAngle=Vector2.new(15.000000,50.000000)
Electric.ZOffset=4.980000019073486
Electric.Texture="rbxassetid://12757089364"
Electric.LockedToPart=true
Electric.Orientation=Enum.ParticleOrientation.VelocityParallel
Electric.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
Electric.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Electric.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Electric.FlipbookStartRandom=false

local DarkFog2=Instance.new("ParticleEmitter", AttachmentClone)
DarkFog2.Name="dark fog2"
DarkFog2.Enabled=true
DarkFog2.Rate=2
DarkFog2.Lifetime=NumberRange.new(2.000000,2.000000)
DarkFog2.Speed=NumberRange.new(18.673553,18.673553)
DarkFog2.Rotation=NumberRange.new(90.000000,90.000000)
DarkFog2.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkFog2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,31.680000,0.000000),NumberSequenceKeypoint.new(1.000000,10.559999,0.000000)})
DarkFog2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.295000,0.918750,0.000000),NumberSequenceKeypoint.new(0.837500,1.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkFog2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
DarkFog2.LightEmission=-1
DarkFog2.LightInfluence=0
DarkFog2.Acceleration=Vector3.new(0.000000,-6.113184,-31.122433)
DarkFog2.Drag=0
DarkFog2.EmissionDirection=Enum.NormalId.Right
DarkFog2.SpreadAngle=Vector2.new(15.000000,50.000000)
DarkFog2.ZOffset=4.980000019073486
DarkFog2.Texture="rbxassetid://11941047152"
DarkFog2.LockedToPart=true
DarkFog2.Orientation=Enum.ParticleOrientation.VelocityParallel
DarkFog2.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
DarkFog2.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkFog2.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkFog2.FlipbookStartRandom=false

local WhiteDebris=Instance.new("ParticleEmitter", AttachmentClone)
WhiteDebris.Name="white debris"
WhiteDebris.Enabled=true
WhiteDebris.Rate=2.5
WhiteDebris.Lifetime=NumberRange.new(1.500000,1.500000)
WhiteDebris.Speed=NumberRange.new(18.673553,18.673553)
WhiteDebris.Rotation=NumberRange.new(-1000.000000,1000.000000)
WhiteDebris.RotSpeed=NumberRange.new(0.000000,0.000000)
WhiteDebris.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,4.646400,1.289665),NumberSequenceKeypoint.new(1.000000,4.646400,1.289665)})
WhiteDebris.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(0.760599,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
WhiteDebris.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
WhiteDebris.LightEmission=1
WhiteDebris.LightInfluence=0
WhiteDebris.Acceleration=Vector3.new(0.000000,-6.113184,-31.122433)
WhiteDebris.Drag=0
WhiteDebris.EmissionDirection=Enum.NormalId.Right
WhiteDebris.SpreadAngle=Vector2.new(15.000000,15.000000)
WhiteDebris.ZOffset=5
WhiteDebris.Texture="rbxassetid://129874527856523"
WhiteDebris.LockedToPart=true
WhiteDebris.Orientation=Enum.ParticleOrientation.FacingCamera
WhiteDebris.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
WhiteDebris.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
WhiteDebris.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
WhiteDebris.FlipbookStartRandom=false

local DarkDebris=Instance.new("ParticleEmitter", AttachmentClone)
DarkDebris.Name="dark debris"
DarkDebris.Enabled=true
DarkDebris.Rate=2.5
DarkDebris.Lifetime=NumberRange.new(1.500000,1.500000)
DarkDebris.Speed=NumberRange.new(18.673553,18.673553)
DarkDebris.Rotation=NumberRange.new(-1000.000000,1000.000000)
DarkDebris.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkDebris.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,4.646400,1.289665),NumberSequenceKeypoint.new(1.000000,4.646400,1.289665)})
DarkDebris.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(0.760599,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkDebris.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
DarkDebris.LightEmission=-1
DarkDebris.LightInfluence=0
DarkDebris.Acceleration=Vector3.new(0.000000,-6.113184,-31.122433)
DarkDebris.Drag=0
DarkDebris.EmissionDirection=Enum.NormalId.Right
DarkDebris.SpreadAngle=Vector2.new(15.000000,15.000000)
DarkDebris.ZOffset=5
DarkDebris.Texture="rbxassetid://129874527856523"
DarkDebris.LockedToPart=true
DarkDebris.Orientation=Enum.ParticleOrientation.FacingCamera
DarkDebris.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
DarkDebris.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkDebris.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkDebris.FlipbookStartRandom=false

local DarkFog=Instance.new("ParticleEmitter", AttachmentClone)
DarkFog.Name="dark fog"
DarkFog.Enabled=true
DarkFog.Rate=5
DarkFog.Lifetime=NumberRange.new(1.500000,1.500000)
DarkFog.Speed=NumberRange.new(18.673553,18.673553)
DarkFog.Rotation=NumberRange.new(90.000000,90.000000)
DarkFog.RotSpeed=NumberRange.new(0.000000,0.000000)
DarkFog.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,15.840000,0.000000),NumberSequenceKeypoint.new(1.000000,5.280000,0.000000)})
DarkFog.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.297500,0.818750,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
DarkFog.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(1.000000,1.000000,1.000000)),ColorSequenceKeypoint.new(1.000000,Color3.new(1.000000,1.000000,1.000000))})
DarkFog.LightEmission=0
DarkFog.LightInfluence=0
DarkFog.Acceleration=Vector3.new(0.000000,-6.113184,-31.122433)
DarkFog.Drag=0
DarkFog.EmissionDirection=Enum.NormalId.Right
DarkFog.SpreadAngle=Vector2.new(15.000000,15.000000)
DarkFog.ZOffset=4.980000019073486
DarkFog.Texture="rbxassetid://14066311352"
DarkFog.LockedToPart=true
DarkFog.Orientation=Enum.ParticleOrientation.VelocityParallel
DarkFog.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
DarkFog.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
DarkFog.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
DarkFog.FlipbookStartRandom=false


local Attachment=Instance.new("Attachment", Floor2)
Attachment.Name="Attachment"
Attachment.Visible=false

local FlipSlash=Instance.new("ParticleEmitter", Attachment)
FlipSlash.Name="flipbookslash"
FlipSlash.Enabled=true
FlipSlash.Rate=20
FlipSlash.Lifetime=NumberRange.new(1.000000,1.000000)
FlipSlash.Speed=NumberRange.new(0.000998,0.000998)
FlipSlash.Rotation=NumberRange.new(0.000000,360.000000)
FlipSlash.RotSpeed=NumberRange.new(100.000000,150.000000)
FlipSlash.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,21.957687,2.993760),NumberSequenceKeypoint.new(0.100000,21.957687,2.993760),NumberSequenceKeypoint.new(0.200000,21.957687,2.993760),NumberSequenceKeypoint.new(0.300000,21.957687,2.993760),NumberSequenceKeypoint.new(0.400000,21.957687,2.993760),NumberSequenceKeypoint.new(0.500000,21.957687,2.993760),NumberSequenceKeypoint.new(0.600000,21.957687,2.993760),NumberSequenceKeypoint.new(0.700000,21.957687,2.993760),NumberSequenceKeypoint.new(0.800000,21.957687,2.993760),NumberSequenceKeypoint.new(0.900000,21.957687,2.993760),NumberSequenceKeypoint.new(1.000000,21.957687,2.993760),NumberSequenceKeypoint.new(1.000000,21.957687,2.993760)})
FlipSlash.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
FlipSlash.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
FlipSlash.LightEmission=0
FlipSlash.LightInfluence=0
FlipSlash.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
FlipSlash.Drag=0
FlipSlash.EmissionDirection=Enum.NormalId.Top
FlipSlash.SpreadAngle=Vector2.new(3.000000,3.000000)
FlipSlash.ZOffset=0
FlipSlash.Texture="rbxassetid://13580369561"
FlipSlash.LockedToPart=true
FlipSlash.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
FlipSlash.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
FlipSlash.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
FlipSlash.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
FlipSlash.FlipbookStartRandom=false

local Swirl=Instance.new("ParticleEmitter", Attachment)
Swirl.Name="swirgly"
Swirl.Enabled=true
Swirl.Rate=2
Swirl.Lifetime=NumberRange.new(1.000000,1.000000)
Swirl.Speed=NumberRange.new(0.000998,0.000998)
Swirl.Rotation=NumberRange.new(0.000000,360.000000)
Swirl.RotSpeed=NumberRange.new(100.000000,150.000000)
Swirl.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,35.363079,0.000000),NumberSequenceKeypoint.new(1.000000,35.363079,0.000000)})
Swirl.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Swirl.LightEmission=0
Swirl.LightInfluence=0
Swirl.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Swirl.Drag=0
Swirl.EmissionDirection=Enum.NormalId.Top
Swirl.SpreadAngle=Vector2.new(3.000000,3.000000)
Swirl.ZOffset=0
Swirl.Texture="rbxassetid://90285935569419"
Swirl.LockedToPart=true
Swirl.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Swirl.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl.FlipbookStartRandom=false

local Dots=Instance.new("ParticleEmitter", Attachment)
Dots.Name="the dottish one"
Dots.Enabled=true
Dots.Rate=5
Dots.Lifetime=NumberRange.new(1.000000,1.000000)
Dots.Speed=NumberRange.new(0.001098,0.001098)
Dots.Rotation=NumberRange.new(0.000000,360.000000)
Dots.RotSpeed=NumberRange.new(100.000000,150.000000)
Dots.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,24.153458,3.293136),NumberSequenceKeypoint.new(0.100000,24.153458,3.293136),NumberSequenceKeypoint.new(0.200000,24.153458,3.293136),NumberSequenceKeypoint.new(0.300000,24.153458,3.293136),NumberSequenceKeypoint.new(0.400000,24.153458,3.293136),NumberSequenceKeypoint.new(0.500000,24.153458,3.293136),NumberSequenceKeypoint.new(0.600000,24.153458,3.293136),NumberSequenceKeypoint.new(0.700000,24.153458,3.293136),NumberSequenceKeypoint.new(0.800000,24.153458,3.293136),NumberSequenceKeypoint.new(0.900000,24.153458,3.293136),NumberSequenceKeypoint.new(1.000000,24.153458,3.293136),NumberSequenceKeypoint.new(1.000000,24.153458,3.293136)})
Dots.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Dots.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Dots.LightEmission=0
Dots.LightInfluence=0
Dots.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Dots.Drag=0
Dots.EmissionDirection=Enum.NormalId.Top
Dots.SpreadAngle=Vector2.new(3.000000,3.000000)
Dots.ZOffset=0
Dots.Texture="rbxassetid://18453345631"
Dots.LockedToPart=true
Dots.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Dots.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Dots.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Dots.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Dots.FlipbookStartRandom=false


local AttachmentClone1=Instance.new("Attachment", Floor2)
AttachmentClone1.Name="Attachment"
AttachmentClone1.Visible=false

local Debris_1=Instance.new("ParticleEmitter", AttachmentClone1)
Debris_1.Name="debris"
Debris_1.Enabled=true
Debris_1.Rate=3
Debris_1.Lifetime=NumberRange.new(2.000000,2.000000)
Debris_1.Speed=NumberRange.new(18.673553,18.673553)
Debris_1.Rotation=NumberRange.new(90.000000,90.000000)
Debris_1.RotSpeed=NumberRange.new(0.000000,0.000000)
Debris_1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,5.280829,0.000000),NumberSequenceKeypoint.new(1.000000,5.280829,0.000000)})
Debris_1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.205000,0.000000,0.000000),NumberSequenceKeypoint.new(0.837500,1.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Debris_1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Debris_1.LightEmission=-1
Debris_1.LightInfluence=0
Debris_1.Acceleration=Vector3.new(0.000000,-13.505184,-31.122433)
Debris_1.Drag=0
Debris_1.EmissionDirection=Enum.NormalId.Right
Debris_1.SpreadAngle=Vector2.new(15.000000,50.000000)
Debris_1.ZOffset=0.050999999046325684
Debris_1.Texture="rbxassetid://129874527856523"
Debris_1.LockedToPart=true
Debris_1.Orientation=Enum.ParticleOrientation.VelocityParallel
Debris_1.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
Debris_1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Debris_1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Debris_1.FlipbookStartRandom=false

local WhiteDebris_1=Instance.new("ParticleEmitter", AttachmentClone1)
WhiteDebris_1.Name="white debris"
WhiteDebris_1.Enabled=true
WhiteDebris_1.Rate=2.5
WhiteDebris_1.Lifetime=NumberRange.new(1.500000,1.500000)
WhiteDebris_1.Speed=NumberRange.new(18.673553,18.673553)
WhiteDebris_1.Rotation=NumberRange.new(-1000.000000,1000.000000)
WhiteDebris_1.RotSpeed=NumberRange.new(0.000000,0.000000)
WhiteDebris_1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,4.647130,1.289665),NumberSequenceKeypoint.new(1.000000,4.647130,1.289665)})
WhiteDebris_1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(0.760599,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
WhiteDebris_1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
WhiteDebris_1.LightEmission=-1
WhiteDebris_1.LightInfluence=0
WhiteDebris_1.Acceleration=Vector3.new(0.000000,-6.113184,-31.122433)
WhiteDebris_1.Drag=0
WhiteDebris_1.EmissionDirection=Enum.NormalId.Right
WhiteDebris_1.SpreadAngle=Vector2.new(15.000000,15.000000)
WhiteDebris_1.ZOffset=5
WhiteDebris_1.Texture="rbxassetid://129874527856523"
WhiteDebris_1.LockedToPart=true
WhiteDebris_1.Orientation=Enum.ParticleOrientation.FacingCamera
WhiteDebris_1.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid8x8
WhiteDebris_1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
WhiteDebris_1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
WhiteDebris_1.FlipbookStartRandom=false


local FSlash=Instance.new("ParticleEmitter", Floor2)
FSlash.Name="flipbookslash"
FSlash.Enabled=true
FSlash.Rate=20
FSlash.Lifetime=NumberRange.new(1.000000,1.000000)
FSlash.Speed=NumberRange.new(0.001559,0.001559)
FSlash.Rotation=NumberRange.new(0.000000,360.000000)
FSlash.RotSpeed=NumberRange.new(100.000000,150.000000)
FSlash.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,34.308891,4.677750),NumberSequenceKeypoint.new(0.100000,34.308891,4.677750),NumberSequenceKeypoint.new(0.200000,34.308891,4.677750),NumberSequenceKeypoint.new(0.300000,34.308891,4.677750),NumberSequenceKeypoint.new(0.400000,34.308891,4.677750),NumberSequenceKeypoint.new(0.500000,34.308891,4.677750),NumberSequenceKeypoint.new(0.600000,34.308891,4.677750),NumberSequenceKeypoint.new(0.700000,34.308891,4.677750),NumberSequenceKeypoint.new(0.800000,34.308891,4.677750),NumberSequenceKeypoint.new(0.900000,34.308891,4.677750),NumberSequenceKeypoint.new(1.000000,34.308891,4.677750),NumberSequenceKeypoint.new(1.000000,34.308891,4.677750)})
FSlash.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
FSlash.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
FSlash.LightEmission=0
FSlash.LightInfluence=0
FSlash.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
FSlash.Drag=0
FSlash.EmissionDirection=Enum.NormalId.Bottom
FSlash.SpreadAngle=Vector2.new(3.000000,3.000000)
FSlash.ZOffset=0
FSlash.Texture="rbxassetid://13580369561"
FSlash.LockedToPart=true
FSlash.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
FSlash.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4
FSlash.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
FSlash.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
FSlash.FlipbookStartRandom=false

local Swirl_1=Instance.new("ParticleEmitter", Floor2)
Swirl_1.Name="swirgly"
Swirl_1.Enabled=true
Swirl_1.Rate=2
Swirl_1.Lifetime=NumberRange.new(1.000000,1.000000)
Swirl_1.Speed=NumberRange.new(0.001559,0.001559)
Swirl_1.Rotation=NumberRange.new(0.000000,360.000000)
Swirl_1.RotSpeed=NumberRange.new(100.000000,150.000000)
Swirl_1.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,55.254810,0.000000),NumberSequenceKeypoint.new(1.000000,55.254810,0.000000)})
Swirl_1.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Swirl_1.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Swirl_1.LightEmission=0
Swirl_1.LightInfluence=0
Swirl_1.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Swirl_1.Drag=0
Swirl_1.EmissionDirection=Enum.NormalId.Bottom
Swirl_1.SpreadAngle=Vector2.new(3.000000,3.000000)
Swirl_1.ZOffset=0
Swirl_1.Texture="rbxassetid://90285935569419"
Swirl_1.LockedToPart=true
Swirl_1.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Swirl_1.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Swirl_1.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Swirl_1.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Swirl_1.FlipbookStartRandom=false

local Dots_2=Instance.new("ParticleEmitter", Floor2)
Dots_2.Name="the dottish one"
Dots_2.Enabled=true
Dots_2.Rate=5
Dots_2.Lifetime=NumberRange.new(1.000000,1.000000)
Dots_2.Speed=NumberRange.new(0.001715,0.001715)
Dots_2.Rotation=NumberRange.new(0.000000,360.000000)
Dots_2.RotSpeed=NumberRange.new(100.000000,150.000000)
Dots_2.Size=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,37.739780,5.145525),NumberSequenceKeypoint.new(0.100000,37.739780,5.145525),NumberSequenceKeypoint.new(0.200000,37.739780,5.145525),NumberSequenceKeypoint.new(0.300000,37.739780,5.145525),NumberSequenceKeypoint.new(0.400000,37.739780,5.145525),NumberSequenceKeypoint.new(0.500000,37.739780,5.145525),NumberSequenceKeypoint.new(0.600000,37.739780,5.145525),NumberSequenceKeypoint.new(0.700000,37.739780,5.145525),NumberSequenceKeypoint.new(0.800000,37.739780,5.145525),NumberSequenceKeypoint.new(0.900000,37.739780,5.145525),NumberSequenceKeypoint.new(1.000000,37.739780,5.145525),NumberSequenceKeypoint.new(1.000000,37.739780,5.145525)})
Dots_2.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0.000000,1.000000,0.000000),NumberSequenceKeypoint.new(0.500000,0.000000,0.000000),NumberSequenceKeypoint.new(1.000000,1.000000,0.000000)})
Dots_2.Color=ColorSequence.new({ColorSequenceKeypoint.new(0.000000,Color3.new(0.001570,0.001570,0.001570)),ColorSequenceKeypoint.new(1.000000,Color3.new(0.001570,0.001570,0.001570))})
Dots_2.LightEmission=0
Dots_2.LightInfluence=0
Dots_2.Acceleration=Vector3.new(0.000000,0.000000,0.000000)
Dots_2.Drag=0
Dots_2.EmissionDirection=Enum.NormalId.Bottom
Dots_2.SpreadAngle=Vector2.new(3.000000,3.000000)
Dots_2.ZOffset=0
Dots_2.Texture="rbxassetid://18453345631"
Dots_2.LockedToPart=true
Dots_2.Orientation=Enum.ParticleOrientation.VelocityPerpendicular
Dots_2.FlipbookLayout=Enum.ParticleFlipbookLayout.None
Dots_2.FlipbookMode=Enum.ParticleFlipbookMode.OneShot
Dots_2.FlipbookFramerate=NumberRange.new(1.000000,1.000000)
Dots_2.FlipbookStartRandom=false
local Light=i("PointLight",Floor2)












function Part1()

local Charge2_18122=i("Attachment", charge1att)
Charge2_18122.Name="Charge2"
Charge2_18122:SetAttribute("AuraInstance", true)
Charge2_18122.Position = v3(0.000000,0.000000,0.000000)
Charge2_18122.Visible = false

local Winds1_18123=i("ParticleEmitter", Charge2_18122)
Winds1_18123.Name="Winds1"
Winds1_18123:SetAttribute("AuraInstance", true)
Winds1_18123.Enabled = false
Winds1_18123.Rate = 20
Winds1_18123.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Winds1_18123.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Winds1_18123.Rotation = nr(0,360)
Winds1_18123.RotSpeed = nr(-50,50)
Winds1_18123.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.103390,21.125000,0.000000),nsk(0.342373,40.625000,0.000000),nsk(0.535593,46.799999,0.000000),nsk(1.000000,52.000000,0.000000)})
Winds1_18123.Transparency = ns({nsk(0.000000,0.200000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds1_18123.Color = cs({
  csk(0.000000,c3(1.000000,1.000000,1.000000))
  ,csk(1.000000,c3(1.000000,1.000000,1.000000))
})
Winds1_18123.LightEmission = 0
Winds1_18123.LightInfluence = 0
Winds1_18123.Acceleration = v3(0.000000,0.000000,0.000000)
Winds1_18123.Drag = 0
Winds1_18123.EmissionDirection = Enum.NormalId.Top
Winds1_18123.SpreadAngle = v2(15.000000,15.000000)
Winds1_18123.ZOffset = 0
Winds1_18123.Texture = "rbxassetid://16434901408"
Winds1_18123.LockedToPart = true
Winds1_18123.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds1_18123.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Winds1_18123.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Winds1_18123.FlipbookFramerate = nr(1,1)
Winds1_18123.FlipbookStartRandom = false
Winds1_18123.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impact2_18124=i("ParticleEmitter", Charge2_18122)
Impact2_18124.Name="Impact2"
Impact2_18124:SetAttribute("AuraInstance", true)
Impact2_18124.Enabled = false
Impact2_18124.Rate = 25
Impact2_18124.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Impact2_18124.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Impact2_18124.Rotation = nr(0,0)
Impact2_18124.RotSpeed = nr(0,0)
Impact2_18124.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.148324,16.386770,0.000000),nsk(0.420324,26.002600,0.000000),nsk(1.000000,30.000000,0.010000)})
Impact2_18124.Transparency = ns({nsk(0.000000,0.800000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impact2_18124.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impact2_18124.LightEmission = 0
Impact2_18124.LightInfluence = 0
Impact2_18124.Acceleration = v3(0.000000,0.000000,0.000000)
Impact2_18124.Drag = 0
Impact2_18124.EmissionDirection = Enum.NormalId.Top
Impact2_18124.SpreadAngle = v2(360.000000,360.000000)
Impact2_18124.ZOffset = -0.10000000149011612
Impact2_18124.Texture = "rbxassetid://13800461961"
Impact2_18124.LockedToPart = true
Impact2_18124.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impact2_18124.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impact2_18124.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impact2_18124.FlipbookFramerate = nr(1,1)
Impact2_18124.FlipbookStartRandom = false
Impact2_18124.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Pulse1_18125=i("ParticleEmitter", Charge2_18122)
Pulse1_18125.Name="Pulse1"
Pulse1_18125:SetAttribute("AuraInstance", true)
Pulse1_18125.Enabled = false
Pulse1_18125.Rate = 15
Pulse1_18125.Lifetime = nr(0.6000000238418579,0.6000000238418579)
Pulse1_18125.Speed = nr(0.10000000149011612,0.10000000149011612)
Pulse1_18125.Rotation = nr(0,360)
Pulse1_18125.RotSpeed = nr(0,0)
Pulse1_18125.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,10.060001,0.000000),nsk(0.394376,16.993336,0.000000),nsk(0.606376,19.193335,0.000000),nsk(1.000000,20.000000,0.000000)})
Pulse1_18125.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
Pulse1_18125.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Pulse1_18125.LightEmission = 0
Pulse1_18125.LightInfluence = 0
Pulse1_18125.Acceleration = v3(0.000000,0.000000,0.000000)
Pulse1_18125.Drag = 0
Pulse1_18125.EmissionDirection = Enum.NormalId.Top
Pulse1_18125.SpreadAngle = v2(180.000000,180.000000)
Pulse1_18125.ZOffset = 0
Pulse1_18125.Texture = "rbxassetid://119057920510209"
Pulse1_18125.LockedToPart = false
Pulse1_18125.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Pulse1_18125.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Pulse1_18125.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Pulse1_18125.FlipbookFramerate = nr(1,1)
Pulse1_18125.FlipbookStartRandom = false
Pulse1_18125.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local PulseDark_18126=i("ParticleEmitter", Charge2_18122)
PulseDark_18126.Name="PulseDark"
PulseDark_18126:SetAttribute("AuraInstance", true)
PulseDark_18126.Enabled = false
PulseDark_18126.Rate = 6
PulseDark_18126.Lifetime = nr(0.6000000238418579,0.6000000238418579)
PulseDark_18126.Speed = nr(0,0)
PulseDark_18126.Rotation = nr(0,360)
PulseDark_18126.RotSpeed = nr(0,0)
PulseDark_18126.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,10.060001,0.000000),nsk(0.394376,16.993336,0.000000),nsk(0.606376,19.193335,0.000000),nsk(1.000000,20.000000,0.000000)})
PulseDark_18126.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
PulseDark_18126.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
PulseDark_18126.LightEmission = 0
PulseDark_18126.LightInfluence = 0
PulseDark_18126.Acceleration = v3(0.000000,0.000000,0.000000)
PulseDark_18126.Drag = 0
PulseDark_18126.EmissionDirection = Enum.NormalId.Top
PulseDark_18126.SpreadAngle = v2(0.000000,0.000000)
PulseDark_18126.ZOffset = 1
PulseDark_18126.Texture = "rbxassetid://119057920510209"
PulseDark_18126.LockedToPart = false
PulseDark_18126.Orientation = Enum.ParticleOrientation.FacingCamera
PulseDark_18126.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
PulseDark_18126.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
PulseDark_18126.FlipbookFramerate = nr(1,1)
PulseDark_18126.FlipbookStartRandom = false
PulseDark_18126.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Pulse2_18127=i("ParticleEmitter", Charge2_18122)
Pulse2_18127.Name="Pulse2"
Pulse2_18127:SetAttribute("AuraInstance", true)
Pulse2_18127.Enabled = false
Pulse2_18127.Rate = 15
Pulse2_18127.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Pulse2_18127.Speed = nr(0.10000000149011612,0.10000000149011612)
Pulse2_18127.Rotation = nr(0,360)
Pulse2_18127.RotSpeed = nr(0,0)
Pulse2_18127.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,13.078002,0.000000),nsk(0.394376,22.091337,0.000000),nsk(0.606376,24.951336,0.000000),nsk(1.000000,26.000000,0.000000)})
Pulse2_18127.Transparency = ns({nsk(0.000000,0.500000,0.000000),nsk(1.000000,1.000000,0.000000)})
Pulse2_18127.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Pulse2_18127.LightEmission = 0
Pulse2_18127.LightInfluence = 0
Pulse2_18127.Acceleration = v3(0.000000,0.000000,0.000000)
Pulse2_18127.Drag = 0
Pulse2_18127.EmissionDirection = Enum.NormalId.Top
Pulse2_18127.SpreadAngle = v2(180.000000,180.000000)
Pulse2_18127.ZOffset = 0
Pulse2_18127.Texture = "rbxassetid://98161445784635"
Pulse2_18127.LockedToPart = false
Pulse2_18127.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Pulse2_18127.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Pulse2_18127.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Pulse2_18127.FlipbookFramerate = nr(1,1)
Pulse2_18127.FlipbookStartRandom = false
Pulse2_18127.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Star_18128=i("ParticleEmitter", Charge2_18122)
Star_18128.Name="Star"
Star_18128:SetAttribute("AuraInstance", true)
Star_18128.Enabled = false
Star_18128.Rate = 10
Star_18128.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Star_18128.Speed = nr(0,0)
Star_18128.Rotation = nr(0,0)
Star_18128.RotSpeed = nr(0,0)
Star_18128.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,30.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Star_18128.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Star_18128.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Star_18128.LightEmission = 0
Star_18128.LightInfluence = 0
Star_18128.Acceleration = v3(0.000000,0.000000,0.000000)
Star_18128.Drag = 0
Star_18128.EmissionDirection = Enum.NormalId.Top
Star_18128.SpreadAngle = v2(0.000000,0.000000)
Star_18128.ZOffset = 15
Star_18128.Texture = "rbxassetid://17062452122"
Star_18128.LockedToPart = true
Star_18128.Orientation = Enum.ParticleOrientation.FacingCamera
Star_18128.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Star_18128.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Star_18128.FlipbookFramerate = nr(1,1)
Star_18128.FlipbookStartRandom = false
Star_18128.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local StarDark_18129=i("ParticleEmitter", Charge2_18122)
StarDark_18129.Name="StarDark"
StarDark_18129:SetAttribute("AuraInstance", true)
StarDark_18129.Enabled = false
StarDark_18129.Rate = 10
StarDark_18129.Lifetime = nr(0.30000001192092896,0.30000001192092896)
StarDark_18129.Speed = nr(0,0)
StarDark_18129.Rotation = nr(0,0)
StarDark_18129.RotSpeed = nr(0,0)
StarDark_18129.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,39.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarDark_18129.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarDark_18129.Color = cs({csk(0.000000,c3(0.000000,0.000000,0.000000)),csk(1.000000,c3(0.000000,0.000000,0.000000))})
StarDark_18129.LightEmission = 0
StarDark_18129.LightInfluence = 0
StarDark_18129.Acceleration = v3(0.000000,0.000000,0.000000)
StarDark_18129.Drag = 0
StarDark_18129.EmissionDirection = Enum.NormalId.Top
StarDark_18129.SpreadAngle = v2(0.000000,0.000000)
StarDark_18129.ZOffset = 14
StarDark_18129.Texture = "rbxassetid://17062452122"
StarDark_18129.LockedToPart = true
StarDark_18129.Orientation = Enum.ParticleOrientation.FacingCamera
StarDark_18129.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarDark_18129.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
StarDark_18129.FlipbookFramerate = nr(1,1)
StarDark_18129.FlipbookStartRandom = false
StarDark_18129.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Winds2_18130=i("ParticleEmitter", Charge2_18122)
Winds2_18130.Name="Winds2"
Winds2_18130:SetAttribute("AuraInstance", true)
Winds2_18130.Enabled = false
Winds2_18130.Rate = 20
Winds2_18130.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Winds2_18130.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Winds2_18130.Rotation = nr(0,360)
Winds2_18130.RotSpeed = nr(-50,50)
Winds2_18130.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.103390,21.125000,0.000000),nsk(0.342373,40.625000,0.000000),nsk(0.535593,46.799999,0.000000),nsk(1.000000,52.000000,0.000000)})
Winds2_18130.Transparency = ns({nsk(0.000000,0.200000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds2_18130.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Winds2_18130.LightEmission = 0
Winds2_18130.LightInfluence = 0
Winds2_18130.Acceleration = v3(0.000000,0.000000,0.000000)
Winds2_18130.Drag = 0
Winds2_18130.EmissionDirection = Enum.NormalId.Top
Winds2_18130.SpreadAngle = v2(15.000000,15.000000)
Winds2_18130.ZOffset = 0
Winds2_18130.Texture = "rbxassetid://14850595833"
Winds2_18130.LockedToPart = true
Winds2_18130.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds2_18130.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Winds2_18130.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Winds2_18130.FlipbookFramerate = nr(1,1)
Winds2_18130.FlipbookStartRandom = false
Winds2_18130.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local lightning_18131=i("ParticleEmitter", Charge2_18122)
lightning_18131.Name="lightning"
lightning_18131:SetAttribute("AuraInstance", true)
lightning_18131.Enabled = false
lightning_18131.Rate = 15
lightning_18131.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18131.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18131.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18131.RotSpeed = nr(0,0)
lightning_18131.Size = ns({nsk(0.000000,27.000000,0.000000),nsk(1.000000,27.000000,0.000000)})
lightning_18131.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18131.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18131.LightEmission = 1
lightning_18131.LightInfluence = 0
lightning_18131.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18131.Drag = 0
lightning_18131.EmissionDirection = Enum.NormalId.Top
lightning_18131.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18131.ZOffset = 3.299999952316284
lightning_18131.Texture = "rbxassetid://132060681192414"
lightning_18131.LockedToPart = true
lightning_18131.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18131.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18131.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18131.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18131.FlipbookStartRandom = false
lightning_18131.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18132=i("ParticleEmitter", Charge2_18122)
lightning_18132.Name="lightning"
lightning_18132:SetAttribute("AuraInstance", true)
lightning_18132.Enabled = false
lightning_18132.Rate = 15
lightning_18132.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18132.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18132.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18132.RotSpeed = nr(0,0)
lightning_18132.Size = ns({nsk(0.000000,27.000000,0.000000),nsk(1.000000,27.000000,0.000000)})
lightning_18132.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18132.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18132.LightEmission = 1
lightning_18132.LightInfluence = 0
lightning_18132.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18132.Drag = 0
lightning_18132.EmissionDirection = Enum.NormalId.Top
lightning_18132.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18132.ZOffset = 3.299999952316284
lightning_18132.Texture = "rbxassetid://109604349904035"
lightning_18132.LockedToPart = true
lightning_18132.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18132.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18132.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18132.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18132.FlipbookStartRandom = false
lightning_18132.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18133=i("ParticleEmitter", Charge2_18122)
lightning_18133.Name="lightning"
lightning_18133:SetAttribute("AuraInstance", true)
lightning_18133.Enabled = false
lightning_18133.Rate = 15
lightning_18133.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18133.Speed = nr(0.00008531969069736078,0.00008531969069736078)
lightning_18133.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18133.RotSpeed = nr(0,0)
lightning_18133.Size = ns({nsk(0.000000,21.000000,0.000000),nsk(1.000000,21.000000,0.000000)})
lightning_18133.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18133.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18133.LightEmission = 1
lightning_18133.LightInfluence = 0
lightning_18133.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18133.Drag = 0
lightning_18133.EmissionDirection = Enum.NormalId.Top
lightning_18133.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18133.ZOffset = 3.299999952316284
lightning_18133.Texture = "rbxassetid://70666087000189"
lightning_18133.LockedToPart = true
lightning_18133.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18133.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18133.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18133.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18133.FlipbookStartRandom = false
lightning_18133.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18134=i("ParticleEmitter", Charge2_18122)
lightning_18134.Name="lightning"
lightning_18134:SetAttribute("AuraInstance", true)
lightning_18134.Enabled = false
lightning_18134.Rate = 15
lightning_18134.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18134.Speed = nr(0.00008531969069736078,0.00008531969069736078)
lightning_18134.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18134.RotSpeed = nr(0,0)
lightning_18134.Size = ns({nsk(0.000000,7.538848,0.000000),nsk(1.000000,7.538848,0.000000)})
lightning_18134.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18134.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18134.LightEmission = 0
lightning_18134.LightInfluence = 0
lightning_18134.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18134.Drag = 0
lightning_18134.EmissionDirection = Enum.NormalId.Top
lightning_18134.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18134.ZOffset = 3.299999952316284
lightning_18134.Texture = "rbxassetid://70666087000189"
lightning_18134.LockedToPart = true
lightning_18134.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18134.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18134.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18134.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18134.FlipbookStartRandom = false
lightning_18134.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18135=i("ParticleEmitter", Charge2_18122)
lightning_18135.Name="lightning"
lightning_18135:SetAttribute("AuraInstance", true)
lightning_18135.Enabled = false
lightning_18135.Rate = 15
lightning_18135.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18135.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18135.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18135.RotSpeed = nr(0,0)
lightning_18135.Size = ns({nsk(0.000000,10.226128,0.000000),nsk(1.000000,10.226128,0.000000)})
lightning_18135.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18135.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18135.LightEmission = 0
lightning_18135.LightInfluence = 0
lightning_18135.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18135.Drag = 0
lightning_18135.EmissionDirection = Enum.NormalId.Top
lightning_18135.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18135.ZOffset = 3.299999952316284
lightning_18135.Texture = "rbxassetid://109604349904035"
lightning_18135.LockedToPart = true
lightning_18135.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18135.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18135.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18135.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18135.FlipbookStartRandom = false
lightning_18135.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18136=i("ParticleEmitter", Charge2_18122)
lightning_18136.Name="lightning"
lightning_18136:SetAttribute("AuraInstance", true)
lightning_18136.Enabled = false
lightning_18136.Rate = 15
lightning_18136.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18136.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18136.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18136.RotSpeed = nr(0,0)
lightning_18136.Size = ns({nsk(0.000000,10.226128,0.000000),nsk(1.000000,10.226128,0.000000)})
lightning_18136.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18136.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18136.LightEmission = 0
lightning_18136.LightInfluence = 0
lightning_18136.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18136.Drag = 0
lightning_18136.EmissionDirection = Enum.NormalId.Top
lightning_18136.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18136.ZOffset = 3.299999952316284
lightning_18136.Texture = "rbxassetid://132060681192414"
lightning_18136.LockedToPart = true
lightning_18136.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18136.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18136.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18136.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18136.FlipbookStartRandom = false
lightning_18136.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local DarkShocks_18137=i("ParticleEmitter", Charge2_18122)
DarkShocks_18137.Name="DarkShocks"
DarkShocks_18137:SetAttribute("AuraInstance", true)
DarkShocks_18137.Enabled = false
DarkShocks_18137.Rate = 25
DarkShocks_18137.Lifetime = nr(0.25,0.44999998807907104)
DarkShocks_18137.Speed = nr(0.001875000074505806,0.001875000074505806)
DarkShocks_18137.Rotation = nr(0,360)
DarkShocks_18137.RotSpeed = nr(0,0)
DarkShocks_18137.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.226376,34.780006,0.000000),nsk(0.502376,48.180004,0.000000),nsk(1.000000,60.000000,0.000000)})
DarkShocks_18137.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.110994,0.739130,0.000000),nsk(1.000000,1.000000,0.000000)})
DarkShocks_18137.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
DarkShocks_18137.LightEmission = 0
DarkShocks_18137.LightInfluence = 0
DarkShocks_18137.Acceleration = v3(0.000000,0.000000,0.000000)
DarkShocks_18137.Drag = 0
DarkShocks_18137.EmissionDirection = Enum.NormalId.Top
DarkShocks_18137.SpreadAngle = v2(360.000000,360.000000)
DarkShocks_18137.ZOffset = 0
DarkShocks_18137.Texture = "rbxassetid://130341645640774"
DarkShocks_18137.LockedToPart = true
DarkShocks_18137.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
DarkShocks_18137.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
DarkShocks_18137.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
DarkShocks_18137.FlipbookFramerate = nr(1,1)
DarkShocks_18137.FlipbookStartRandom = false
DarkShocks_18137.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impact1_18138=i("ParticleEmitter", Charge2_18122)
Impact1_18138.Name="Impact1"
Impact1_18138:SetAttribute("AuraInstance", true)
Impact1_18138.Enabled = false
Impact1_18138.Rate = 5
Impact1_18138.Lifetime = nr(0.4000000059604645,0.4000000059604645)
Impact1_18138.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Impact1_18138.Rotation = nr(0,0)
Impact1_18138.RotSpeed = nr(0,0)
Impact1_18138.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.148324,16.386770,0.000000),nsk(0.420324,26.002600,0.000000),nsk(1.000000,30.000000,0.010000)})
Impact1_18138.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Impact1_18138.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impact1_18138.LightEmission = 0
Impact1_18138.LightInfluence = 0
Impact1_18138.Acceleration = v3(0.000000,0.000000,0.000000)
Impact1_18138.Drag = 0
Impact1_18138.EmissionDirection = Enum.NormalId.Top
Impact1_18138.SpreadAngle = v2(360.000000,360.000000)
Impact1_18138.ZOffset = -0.10000000149011612
Impact1_18138.Texture = "rbxassetid://18140248952"
Impact1_18138.LockedToPart = true
Impact1_18138.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impact1_18138.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impact1_18138.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impact1_18138.FlipbookFramerate = nr(1,1)
Impact1_18138.FlipbookStartRandom = false
Impact1_18138.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local DarkShocks2_18139=i("ParticleEmitter", Charge2_18122)
DarkShocks2_18139.Name="DarkShocks2"
DarkShocks2_18139:SetAttribute("AuraInstance", true)
DarkShocks2_18139.Enabled = false
DarkShocks2_18139.Rate = 40
DarkShocks2_18139.Lifetime = nr(0.25,0.44999998807907104)
DarkShocks2_18139.Speed = nr(0.001875000074505806,0.001875000074505806)
DarkShocks2_18139.Rotation = nr(0,360)
DarkShocks2_18139.RotSpeed = nr(0,0)
DarkShocks2_18139.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.226376,34.780006,0.000000),nsk(0.502376,48.180004,0.000000),nsk(1.000000,60.000000,0.000000)})
DarkShocks2_18139.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.500000,0.000000),nsk(1.000000,1.000000,0.000000)})
DarkShocks2_18139.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
DarkShocks2_18139.LightEmission = 0
DarkShocks2_18139.LightInfluence = 0
DarkShocks2_18139.Acceleration = v3(0.000000,0.000000,0.000000)
DarkShocks2_18139.Drag = 0
DarkShocks2_18139.EmissionDirection = Enum.NormalId.Top
DarkShocks2_18139.SpreadAngle = v2(360.000000,360.000000)
DarkShocks2_18139.ZOffset = -0.10000000149011612
DarkShocks2_18139.Texture = "rbxassetid://130341645640774"
DarkShocks2_18139.LockedToPart = true
DarkShocks2_18139.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
DarkShocks2_18139.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
DarkShocks2_18139.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
DarkShocks2_18139.FlipbookFramerate = nr(1,1)
DarkShocks2_18139.FlipbookStartRandom = false
DarkShocks2_18139.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Shine_18140=i("ParticleEmitter", Charge2_18122)
Shine_18140.Name="Shine"
Shine_18140:SetAttribute("AuraInstance", true)
Shine_18140.Enabled = false
Shine_18140.Rate = 10
Shine_18140.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Shine_18140.Speed = nr(0,0)
Shine_18140.Rotation = nr(0,0)
Shine_18140.RotSpeed = nr(0,0)
Shine_18140.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,30.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Shine_18140.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.500000,0.300000,0.000000),nsk(1.000000,1.000000,0.000000)})
Shine_18140.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Shine_18140.LightEmission = 0
Shine_18140.LightInfluence = 0
Shine_18140.Acceleration = v3(0.000000,0.000000,0.000000)
Shine_18140.Drag = 0
Shine_18140.EmissionDirection = Enum.NormalId.Top
Shine_18140.SpreadAngle = v2(0.000000,0.000000)
Shine_18140.ZOffset = 15
Shine_18140.Texture = "rbxassetid://82921243876307"
Shine_18140.LockedToPart = false
Shine_18140.Orientation = Enum.ParticleOrientation.FacingCamera
Shine_18140.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Shine_18140.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Shine_18140.FlipbookFramerate = nr(1,1)
Shine_18140.FlipbookStartRandom = false
Shine_18140.Squash = ns({nsk(0.000000,-0.500000,0.000000),nsk(1.000000,-0.500000,0.000000)})

local StarBurst_18141=i("ParticleEmitter", Charge2_18122)
StarBurst_18141.Name="StarBurst"
StarBurst_18141:SetAttribute("AuraInstance", true)
StarBurst_18141.Enabled = false
StarBurst_18141.Rate = 25
StarBurst_18141.Lifetime = nr(0.20000000298023224,0.20000000298023224)
StarBurst_18141.Speed = nr(300,500)
StarBurst_18141.Rotation = nr(0,0)
StarBurst_18141.RotSpeed = nr(0,0)
StarBurst_18141.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,50.000000,0.000000),nsk(0.230376,20.816671,0.000000),nsk(0.428376,6.650004,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurst_18141.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurst_18141.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
StarBurst_18141.LightEmission = 0
StarBurst_18141.LightInfluence = 0
StarBurst_18141.Acceleration = v3(0.000000,0.000000,0.000000)
StarBurst_18141.Drag = 50
StarBurst_18141.EmissionDirection = Enum.NormalId.Top
StarBurst_18141.SpreadAngle = v2(180.000000,180.000000)
StarBurst_18141.ZOffset = 13
StarBurst_18141.Texture = "rbxassetid://8905832887"
StarBurst_18141.LockedToPart = false
StarBurst_18141.Orientation = Enum.ParticleOrientation.FacingCamera
StarBurst_18141.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarBurst_18141.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
StarBurst_18141.FlipbookFramerate = nr(1,1)
StarBurst_18141.FlipbookStartRandom = false
StarBurst_18141.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local StarBurstDark_18142=i("ParticleEmitter", Charge2_18122)
StarBurstDark_18142.Name="StarBurstDark"
StarBurstDark_18142:SetAttribute("AuraInstance", true)
StarBurstDark_18142.Enabled = false
StarBurstDark_18142.Rate = 25
StarBurstDark_18142.Lifetime = nr(0.20000000298023224,0.20000000298023224)
StarBurstDark_18142.Speed = nr(300,500)
StarBurstDark_18142.Rotation = nr(0,0)
StarBurstDark_18142.RotSpeed = nr(0,0)
StarBurstDark_18142.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,50.000000,0.000000),nsk(0.230376,20.816671,0.000000),nsk(0.428376,6.650004,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurstDark_18142.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurstDark_18142.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
StarBurstDark_18142.LightEmission = 0
StarBurstDark_18142.LightInfluence = 0
StarBurstDark_18142.Acceleration = v3(0.000000,0.000000,0.000000)
StarBurstDark_18142.Drag = 50
StarBurstDark_18142.EmissionDirection = Enum.NormalId.Top
StarBurstDark_18142.SpreadAngle = v2(180.000000,180.000000)
StarBurstDark_18142.ZOffset = 13
StarBurstDark_18142.Texture = "rbxassetid://8905832887"
StarBurstDark_18142.LockedToPart = false
StarBurstDark_18142.Orientation = Enum.ParticleOrientation.FacingCamera
StarBurstDark_18142.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarBurstDark_18142.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
StarBurstDark_18142.FlipbookFramerate = nr(1,1)
StarBurstDark_18142.FlipbookStartRandom = false
StarBurstDark_18142.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Emit_18143=i("Attachment", Charge2_18122)
Emit_18143.Name="Emit"
Emit_18143:SetAttribute("AuraInstance", true)
Emit_18143.Position = v3(0.000000,0.000000,0.000000)
Emit_18143.Visible = false

local DarkShocks_18144=i("ParticleEmitter", Emit_18143)
DarkShocks_18144.Name="DarkShocks"
DarkShocks_18144:SetAttribute("EmitCount", 15)
DarkShocks_18144:SetAttribute("AuraInstance", true)
DarkShocks_18144.Enabled = false
DarkShocks_18144.Rate = 25
DarkShocks_18144.Lifetime = nr(0.25,0.44999998807907104)
DarkShocks_18144.Speed = nr(0.001875000074505806,0.001875000074505806)
DarkShocks_18144.Rotation = nr(0,360)
DarkShocks_18144.RotSpeed = nr(0,0)
DarkShocks_18144.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.226376,41.736008,0.000000),nsk(0.502376,57.816006,0.000000),nsk(1.000000,72.000000,0.000000)})
DarkShocks_18144.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.110994,0.739130,0.000000),nsk(1.000000,1.000000,0.000000)})
DarkShocks_18144.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
DarkShocks_18144.LightEmission = 0
DarkShocks_18144.LightInfluence = 0
DarkShocks_18144.Acceleration = v3(0.000000,0.000000,0.000000)
DarkShocks_18144.Drag = 0
DarkShocks_18144.EmissionDirection = Enum.NormalId.Top
DarkShocks_18144.SpreadAngle = v2(360.000000,360.000000)
DarkShocks_18144.ZOffset = 0
DarkShocks_18144.Texture = "rbxassetid://130341645640774"
DarkShocks_18144.LockedToPart = true
DarkShocks_18144.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
DarkShocks_18144.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
DarkShocks_18144.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
DarkShocks_18144.FlipbookFramerate = nr(1,1)
DarkShocks_18144.FlipbookStartRandom = false
DarkShocks_18144.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local DarkShocks2_18145=i("ParticleEmitter", Emit_18143)
DarkShocks2_18145.Name="DarkShocks2"
DarkShocks2_18145:SetAttribute("EmitCount", 15)
DarkShocks2_18145:SetAttribute("AuraInstance", true)
DarkShocks2_18145.Enabled = false
DarkShocks2_18145.Rate = 40
DarkShocks2_18145.Lifetime = nr(0.25,0.44999998807907104)
DarkShocks2_18145.Speed = nr(0.001875000074505806,0.001875000074505806)
DarkShocks2_18145.Rotation = nr(0,360)
DarkShocks2_18145.RotSpeed = nr(0,0)
DarkShocks2_18145.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.226376,41.736008,0.000000),nsk(0.502376,57.816006,0.000000),nsk(1.000000,72.000000,0.000000)})
DarkShocks2_18145.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.500000,0.000000),nsk(1.000000,1.000000,0.000000)})
DarkShocks2_18145.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
DarkShocks2_18145.LightEmission = 0
DarkShocks2_18145.LightInfluence = 0
DarkShocks2_18145.Acceleration = v3(0.000000,0.000000,0.000000)
DarkShocks2_18145.Drag = 0
DarkShocks2_18145.EmissionDirection = Enum.NormalId.Top
DarkShocks2_18145.SpreadAngle = v2(360.000000,360.000000)
DarkShocks2_18145.ZOffset = -0.10000000149011612
DarkShocks2_18145.Texture = "rbxassetid://130341645640774"
DarkShocks2_18145.LockedToPart = true
DarkShocks2_18145.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
DarkShocks2_18145.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
DarkShocks2_18145.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
DarkShocks2_18145.FlipbookFramerate = nr(1,1)
DarkShocks2_18145.FlipbookStartRandom = false
DarkShocks2_18145.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impact1_18146=i("ParticleEmitter", Emit_18143)
Impact1_18146.Name="Impact1"
Impact1_18146:SetAttribute("EmitCount", 3)
Impact1_18146:SetAttribute("AuraInstance", true)
Impact1_18146.Enabled = false
Impact1_18146.Rate = 5
Impact1_18146.Lifetime = nr(0.4000000059604645,0.4000000059604645)
Impact1_18146.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Impact1_18146.Rotation = nr(0,0)
Impact1_18146.RotSpeed = nr(0,0)
Impact1_18146.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.148324,19.664124,0.000000),nsk(0.420324,31.203119,0.000000),nsk(1.000000,36.000000,0.010000)})
Impact1_18146.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Impact1_18146.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impact1_18146.LightEmission = 0
Impact1_18146.LightInfluence = 0
Impact1_18146.Acceleration = v3(0.000000,0.000000,0.000000)
Impact1_18146.Drag = 0
Impact1_18146.EmissionDirection = Enum.NormalId.Top
Impact1_18146.SpreadAngle = v2(360.000000,360.000000)
Impact1_18146.ZOffset = -0.10000000149011612
Impact1_18146.Texture = "rbxassetid://18140248952"
Impact1_18146.LockedToPart = true
Impact1_18146.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impact1_18146.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impact1_18146.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impact1_18146.FlipbookFramerate = nr(1,1)
Impact1_18146.FlipbookStartRandom = false
Impact1_18146.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impact2_18147=i("ParticleEmitter", Emit_18143)
Impact2_18147.Name="Impact2"
Impact2_18147:SetAttribute("EmitCount", 3)
Impact2_18147:SetAttribute("AuraInstance", true)
Impact2_18147.Enabled = false
Impact2_18147.Rate = 25
Impact2_18147.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Impact2_18147.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Impact2_18147.Rotation = nr(0,0)
Impact2_18147.RotSpeed = nr(0,0)
Impact2_18147.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.148324,22.613743,0.000000),nsk(0.420324,35.883587,0.000000),nsk(1.000000,41.400002,0.010000)})
Impact2_18147.Transparency = ns({nsk(0.000000,0.800000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impact2_18147.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impact2_18147.LightEmission = 0
Impact2_18147.LightInfluence = 0
Impact2_18147.Acceleration = v3(0.000000,0.000000,0.000000)
Impact2_18147.Drag = 0
Impact2_18147.EmissionDirection = Enum.NormalId.Top
Impact2_18147.SpreadAngle = v2(360.000000,360.000000)
Impact2_18147.ZOffset = -0.10000000149011612
Impact2_18147.Texture = "rbxassetid://13800461961"
Impact2_18147.LockedToPart = true
Impact2_18147.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impact2_18147.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impact2_18147.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impact2_18147.FlipbookFramerate = nr(1,1)
Impact2_18147.FlipbookStartRandom = false
Impact2_18147.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Pulse1_18148=i("ParticleEmitter", Emit_18143)
Pulse1_18148.Name="Pulse1"
Pulse1_18148:SetAttribute("EmitCount", 3)
Pulse1_18148:SetAttribute("AuraInstance", true)
Pulse1_18148.Enabled = false
Pulse1_18148.Rate = 15
Pulse1_18148.Lifetime = nr(0.6000000238418579,0.6000000238418579)
Pulse1_18148.Speed = nr(0.10000000149011612,0.10000000149011612)
Pulse1_18148.Rotation = nr(0,360)
Pulse1_18148.RotSpeed = nr(0,0)
Pulse1_18148.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,12.072001,0.000000),nsk(0.394376,20.392002,0.000000),nsk(0.606376,23.032001,0.000000),nsk(1.000000,24.000000,0.000000)})
Pulse1_18148.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
Pulse1_18148.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Pulse1_18148.LightEmission = 0
Pulse1_18148.LightInfluence = 0
Pulse1_18148.Acceleration = v3(0.000000,0.000000,0.000000)
Pulse1_18148.Drag = 0
Pulse1_18148.EmissionDirection = Enum.NormalId.Top
Pulse1_18148.SpreadAngle = v2(180.000000,180.000000)
Pulse1_18148.ZOffset = 0
Pulse1_18148.Texture = "rbxassetid://119057920510209"
Pulse1_18148.LockedToPart = false
Pulse1_18148.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Pulse1_18148.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Pulse1_18148.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Pulse1_18148.FlipbookFramerate = nr(1,1)
Pulse1_18148.FlipbookStartRandom = false
Pulse1_18148.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Pulse2_18149=i("ParticleEmitter", Emit_18143)
Pulse2_18149.Name="Pulse2"
Pulse2_18149:SetAttribute("EmitCount", 3)
Pulse2_18149:SetAttribute("AuraInstance", true)
Pulse2_18149.Enabled = false
Pulse2_18149.Rate = 15
Pulse2_18149.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Pulse2_18149.Speed = nr(0.10000000149011612,0.10000000149011612)
Pulse2_18149.Rotation = nr(0,360)
Pulse2_18149.RotSpeed = nr(0,0)
Pulse2_18149.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,15.693603,0.000000),nsk(0.394376,26.509605,0.000000),nsk(0.606376,29.941603,0.000000),nsk(1.000000,31.200001,0.000000)})
Pulse2_18149.Transparency = ns({nsk(0.000000,0.500000,0.000000),nsk(1.000000,1.000000,0.000000)})
Pulse2_18149.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Pulse2_18149.LightEmission = 0
Pulse2_18149.LightInfluence = 0
Pulse2_18149.Acceleration = v3(0.000000,0.000000,0.000000)
Pulse2_18149.Drag = 0
Pulse2_18149.EmissionDirection = Enum.NormalId.Top
Pulse2_18149.SpreadAngle = v2(180.000000,180.000000)
Pulse2_18149.ZOffset = 0
Pulse2_18149.Texture = "rbxassetid://98161445784635"
Pulse2_18149.LockedToPart = false
Pulse2_18149.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Pulse2_18149.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Pulse2_18149.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Pulse2_18149.FlipbookFramerate = nr(1,1)
Pulse2_18149.FlipbookStartRandom = false
Pulse2_18149.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local PulseDark_18150=i("ParticleEmitter", Emit_18143)
PulseDark_18150.Name="PulseDark"
PulseDark_18150:SetAttribute("EmitCount", 2)
PulseDark_18150:SetAttribute("AuraInstance", true)
PulseDark_18150.Enabled = false
PulseDark_18150.Rate = 6
PulseDark_18150.Lifetime = nr(0.6000000238418579,0.6000000238418579)
PulseDark_18150.Speed = nr(0,0)
PulseDark_18150.Rotation = nr(0,360)
PulseDark_18150.RotSpeed = nr(0,0)
PulseDark_18150.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,12.072001,0.000000),nsk(0.394376,20.392002,0.000000),nsk(0.606376,23.032001,0.000000),nsk(1.000000,24.000000,0.000000)})
PulseDark_18150.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
PulseDark_18150.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
PulseDark_18150.LightEmission = 0
PulseDark_18150.LightInfluence = 0
PulseDark_18150.Acceleration = v3(0.000000,0.000000,0.000000)
PulseDark_18150.Drag = 0
PulseDark_18150.EmissionDirection = Enum.NormalId.Top
PulseDark_18150.SpreadAngle = v2(0.000000,0.000000)
PulseDark_18150.ZOffset = 1
PulseDark_18150.Texture = "rbxassetid://119057920510209"
PulseDark_18150.LockedToPart = false
PulseDark_18150.Orientation = Enum.ParticleOrientation.FacingCamera
PulseDark_18150.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
PulseDark_18150.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
PulseDark_18150.FlipbookFramerate = nr(1,1)
PulseDark_18150.FlipbookStartRandom = false
PulseDark_18150.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Star_18151=i("ParticleEmitter", Emit_18143)
Star_18151.Name="Star"
Star_18151:SetAttribute("EmitCount", 2)
Star_18151:SetAttribute("AuraInstance", true)
Star_18151.Enabled = false
Star_18151.Rate = 10
Star_18151.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Star_18151.Speed = nr(0,0)
Star_18151.Rotation = nr(0,0)
Star_18151.RotSpeed = nr(0,0)
Star_18151.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,36.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Star_18151.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Star_18151.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Star_18151.LightEmission = 0
Star_18151.LightInfluence = 0
Star_18151.Acceleration = v3(0.000000,0.000000,0.000000)
Star_18151.Drag = 0
Star_18151.EmissionDirection = Enum.NormalId.Top
Star_18151.SpreadAngle = v2(0.000000,0.000000)
Star_18151.ZOffset = 15
Star_18151.Texture = "rbxassetid://17062452122"
Star_18151.LockedToPart = false
Star_18151.Orientation = Enum.ParticleOrientation.FacingCamera
Star_18151.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Star_18151.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Star_18151.FlipbookFramerate = nr(1,1)
Star_18151.FlipbookStartRandom = false
Star_18151.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Shine_18152=i("ParticleEmitter", Emit_18143)
Shine_18152.Name="Shine"
Shine_18152:SetAttribute("EmitCount", 1)
Shine_18152:SetAttribute("AuraInstance", true)
Shine_18152.Enabled = false
Shine_18152.Rate = 10
Shine_18152.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Shine_18152.Speed = nr(0,0)
Shine_18152.Rotation = nr(0,0)
Shine_18152.RotSpeed = nr(0,0)
Shine_18152.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,36.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Shine_18152.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.500000,0.300000,0.000000),nsk(1.000000,1.000000,0.000000)})
Shine_18152.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Shine_18152.LightEmission = 0
Shine_18152.LightInfluence = 0
Shine_18152.Acceleration = v3(0.000000,0.000000,0.000000)
Shine_18152.Drag = 0
Shine_18152.EmissionDirection = Enum.NormalId.Top
Shine_18152.SpreadAngle = v2(0.000000,0.000000)
Shine_18152.ZOffset = 15
Shine_18152.Texture = "rbxassetid://82921243876307"
Shine_18152.LockedToPart = false
Shine_18152.Orientation = Enum.ParticleOrientation.FacingCamera
Shine_18152.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Shine_18152.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Shine_18152.FlipbookFramerate = nr(1,1)
Shine_18152.FlipbookStartRandom = false
Shine_18152.Squash = ns({nsk(0.000000,-0.500000,0.000000),nsk(1.000000,-0.500000,0.000000)})

local StarBurst_18153=i("ParticleEmitter", Emit_18143)
StarBurst_18153.Name="StarBurst"
StarBurst_18153:SetAttribute("EmitCount", 12)
StarBurst_18153:SetAttribute("AuraInstance", true)
StarBurst_18153.Enabled = false
StarBurst_18153.Rate = 25
StarBurst_18153.Lifetime = nr(0.20000000298023224,0.20000000298023224)
StarBurst_18153.Speed = nr(300,500)
StarBurst_18153.Rotation = nr(0,360)
StarBurst_18153.RotSpeed = nr(0,0)
StarBurst_18153.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,60.000000,0.000000),nsk(0.230376,24.980005,0.000000),nsk(0.428376,7.980005,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurst_18153.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurst_18153.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
StarBurst_18153.LightEmission = 0
StarBurst_18153.LightInfluence = 0
StarBurst_18153.Acceleration = v3(0.000000,0.000000,0.000000)
StarBurst_18153.Drag = 50
StarBurst_18153.EmissionDirection = Enum.NormalId.Top
StarBurst_18153.SpreadAngle = v2(180.000000,180.000000)
StarBurst_18153.ZOffset = 13
StarBurst_18153.Texture = "rbxassetid://8905832887"
StarBurst_18153.LockedToPart = false
StarBurst_18153.Orientation = Enum.ParticleOrientation.FacingCamera
StarBurst_18153.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarBurst_18153.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
StarBurst_18153.FlipbookFramerate = nr(1,1)
StarBurst_18153.FlipbookStartRandom = false
StarBurst_18153.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local StarBurstDark_18154=i("ParticleEmitter", Emit_18143)
StarBurstDark_18154.Name="StarBurstDark"
StarBurstDark_18154:SetAttribute("EmitCount", 12)
StarBurstDark_18154:SetAttribute("AuraInstance", true)
StarBurstDark_18154.Enabled = false
StarBurstDark_18154.Rate = 25
StarBurstDark_18154.Lifetime = nr(0.20000000298023224,0.20000000298023224)
StarBurstDark_18154.Speed = nr(300,500)
StarBurstDark_18154.Rotation = nr(0,360)
StarBurstDark_18154.RotSpeed = nr(0,0)
StarBurstDark_18154.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,60.000000,0.000000),nsk(0.230376,24.980005,0.000000),nsk(0.428376,7.980005,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurstDark_18154.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarBurstDark_18154.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
StarBurstDark_18154.LightEmission = 0
StarBurstDark_18154.LightInfluence = 0
StarBurstDark_18154.Acceleration = v3(0.000000,0.000000,0.000000)
StarBurstDark_18154.Drag = 50
StarBurstDark_18154.EmissionDirection = Enum.NormalId.Top
StarBurstDark_18154.SpreadAngle = v2(180.000000,180.000000)
StarBurstDark_18154.ZOffset = 13
StarBurstDark_18154.Texture = "rbxassetid://8905832887"
StarBurstDark_18154.LockedToPart = false
StarBurstDark_18154.Orientation = Enum.ParticleOrientation.FacingCamera
StarBurstDark_18154.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarBurstDark_18154.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
StarBurstDark_18154.FlipbookFramerate = nr(1,1)
StarBurstDark_18154.FlipbookStartRandom = false
StarBurstDark_18154.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local StarDark_18155=i("ParticleEmitter", Emit_18143)
StarDark_18155.Name="StarDark"
StarDark_18155:SetAttribute("EmitCount", 2)
StarDark_18155:SetAttribute("AuraInstance", true)
StarDark_18155.Enabled = false
StarDark_18155.Rate = 10
StarDark_18155.Lifetime = nr(0.30000001192092896,0.30000001192092896)
StarDark_18155.Speed = nr(0,0)
StarDark_18155.Rotation = nr(0,0)
StarDark_18155.RotSpeed = nr(0,0)
StarDark_18155.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,46.799999,0.000000),nsk(1.000000,0.000000,0.000000)})
StarDark_18155.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarDark_18155.Color = cs({csk(0.000000,c3(0.000000,0.000000,0.000000)),csk(1.000000,c3(0.000000,0.000000,0.000000))})
StarDark_18155.LightEmission = 0
StarDark_18155.LightInfluence = 0
StarDark_18155.Acceleration = v3(0.000000,0.000000,0.000000)
StarDark_18155.Drag = 0
StarDark_18155.EmissionDirection = Enum.NormalId.Top
StarDark_18155.SpreadAngle = v2(0.000000,0.000000)
StarDark_18155.ZOffset = 14
StarDark_18155.Texture = "rbxassetid://17062452122"
StarDark_18155.LockedToPart = false
StarDark_18155.Orientation = Enum.ParticleOrientation.FacingCamera
StarDark_18155.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarDark_18155.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
StarDark_18155.FlipbookFramerate = nr(1,1)
StarDark_18155.FlipbookStartRandom = false
StarDark_18155.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Winds1_18156=i("ParticleEmitter", Emit_18143)
Winds1_18156.Name="Winds1"
Winds1_18156:SetAttribute("EmitCount", 5)
Winds1_18156:SetAttribute("AuraInstance", true)
Winds1_18156.Enabled = false
Winds1_18156.Rate = 20
Winds1_18156.Lifetime = nr(0.20000000298023224,0.800000011920929)
Winds1_18156.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Winds1_18156.Rotation = nr(0,360)
Winds1_18156.RotSpeed = nr(-50,50)
Winds1_18156.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.103390,25.350000,0.000000),nsk(0.342373,48.750000,0.000000),nsk(0.535593,56.160000,0.000000),nsk(1.000000,62.400002,0.000000)})
Winds1_18156.Transparency = ns({nsk(0.000000,0.200000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds1_18156.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Winds1_18156.LightEmission = 0
Winds1_18156.LightInfluence = 0
Winds1_18156.Acceleration = v3(0.000000,0.000000,0.000000)
Winds1_18156.Drag = 0
Winds1_18156.EmissionDirection = Enum.NormalId.Top
Winds1_18156.SpreadAngle = v2(15.000000,15.000000)
Winds1_18156.ZOffset = 0
Winds1_18156.Texture = "rbxassetid://16434901408"
Winds1_18156.LockedToPart = true
Winds1_18156.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds1_18156.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Winds1_18156.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Winds1_18156.FlipbookFramerate = nr(1,1)
Winds1_18156.FlipbookStartRandom = false
Winds1_18156.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Winds2_18157=i("ParticleEmitter", Emit_18143)
Winds2_18157.Name="Winds2"
Winds2_18157:SetAttribute("EmitCount", 5)
Winds2_18157:SetAttribute("AuraInstance", true)
Winds2_18157.Enabled = false
Winds2_18157.Rate = 20
Winds2_18157.Lifetime = nr(0.20000000298023224,0.800000011920929)
Winds2_18157.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Winds2_18157.Rotation = nr(0,360)
Winds2_18157.RotSpeed = nr(-50,50)
Winds2_18157.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.103390,25.350000,0.000000),nsk(0.342373,48.750000,0.000000),nsk(0.535593,56.160000,0.000000),nsk(1.000000,62.400002,0.000000)})
Winds2_18157.Transparency = ns({nsk(0.000000,0.200000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds2_18157.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Winds2_18157.LightEmission = 0
Winds2_18157.LightInfluence = 0
Winds2_18157.Acceleration = v3(0.000000,0.000000,0.000000)
Winds2_18157.Drag = 0
Winds2_18157.EmissionDirection = Enum.NormalId.Top
Winds2_18157.SpreadAngle = v2(15.000000,15.000000)
Winds2_18157.ZOffset = 0
Winds2_18157.Texture = "rbxassetid://14850595833"
Winds2_18157.LockedToPart = true
Winds2_18157.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds2_18157.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Winds2_18157.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Winds2_18157.FlipbookFramerate = nr(1,1)
Winds2_18157.FlipbookStartRandom = false
Winds2_18157.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local lightning_18158=i("ParticleEmitter", Emit_18143)
lightning_18158.Name="lightning"
lightning_18158:SetAttribute("EmitCount", 3)
lightning_18158:SetAttribute("AuraInstance", true)
lightning_18158.Enabled = false
lightning_18158.Rate = 15
lightning_18158.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18158.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18158.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18158.RotSpeed = nr(0,0)
lightning_18158.Size = ns({nsk(0.000000,32.400002,0.000000),nsk(1.000000,32.400002,0.000000)})
lightning_18158.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18158.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18158.LightEmission = 1
lightning_18158.LightInfluence = 0
lightning_18158.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18158.Drag = 0
lightning_18158.EmissionDirection = Enum.NormalId.Top
lightning_18158.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18158.ZOffset = 3.299999952316284
lightning_18158.Texture = "rbxassetid://132060681192414"
lightning_18158.LockedToPart = true
lightning_18158.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18158.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18158.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18158.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18158.FlipbookStartRandom = false
lightning_18158.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18159=i("ParticleEmitter", Emit_18143)
lightning_18159.Name="lightning"
lightning_18159:SetAttribute("EmitCount", 3)
lightning_18159:SetAttribute("AuraInstance", true)
lightning_18159.Enabled = false
lightning_18159.Rate = 15
lightning_18159.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18159.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18159.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18159.RotSpeed = nr(0,0)
lightning_18159.Size = ns({nsk(0.000000,32.400002,0.000000),nsk(1.000000,32.400002,0.000000)})
lightning_18159.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18159.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18159.LightEmission = 1
lightning_18159.LightInfluence = 0
lightning_18159.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18159.Drag = 0
lightning_18159.EmissionDirection = Enum.NormalId.Top
lightning_18159.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18159.ZOffset = 3.299999952316284
lightning_18159.Texture = "rbxassetid://109604349904035"
lightning_18159.LockedToPart = true
lightning_18159.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18159.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18159.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18159.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18159.FlipbookStartRandom = false
lightning_18159.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18160=i("ParticleEmitter", Emit_18143)
lightning_18160.Name="lightning"
lightning_18160:SetAttribute("EmitCount", 3)
lightning_18160:SetAttribute("AuraInstance", true)
lightning_18160.Enabled = false
lightning_18160.Rate = 15
lightning_18160.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18160.Speed = nr(0.00008531969069736078,0.00008531969069736078)
lightning_18160.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18160.RotSpeed = nr(0,0)
lightning_18160.Size = ns({nsk(0.000000,25.200001,0.000000),nsk(1.000000,25.200001,0.000000)})
lightning_18160.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18160.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18160.LightEmission = 1
lightning_18160.LightInfluence = 0
lightning_18160.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18160.Drag = 0
lightning_18160.EmissionDirection = Enum.NormalId.Top
lightning_18160.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18160.ZOffset = 3.299999952316284
lightning_18160.Texture = "rbxassetid://70666087000189"
lightning_18160.LockedToPart = true
lightning_18160.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18160.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18160.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18160.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18160.FlipbookStartRandom = false
lightning_18160.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18161=i("ParticleEmitter", Emit_18143)
lightning_18161.Name="lightning"
lightning_18161:SetAttribute("EmitCount", 3)
lightning_18161:SetAttribute("AuraInstance", true)
lightning_18161.Enabled = false
lightning_18161.Rate = 15
lightning_18161.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18161.Speed = nr(0.00008531969069736078,0.00008531969069736078)
lightning_18161.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18161.RotSpeed = nr(0,0)
lightning_18161.Size = ns({nsk(0.000000,9.046618,0.000000),nsk(1.000000,9.046618,0.000000)})
lightning_18161.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18161.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18161.LightEmission = 0
lightning_18161.LightInfluence = 0
lightning_18161.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18161.Drag = 0
lightning_18161.EmissionDirection = Enum.NormalId.Top
lightning_18161.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18161.ZOffset = 3.299999952316284
lightning_18161.Texture = "rbxassetid://70666087000189"
lightning_18161.LockedToPart = true
lightning_18161.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18161.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18161.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18161.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18161.FlipbookStartRandom = false
lightning_18161.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18162=i("ParticleEmitter", Emit_18143)
lightning_18162.Name="lightning"
lightning_18162:SetAttribute("EmitCount", 3)
lightning_18162:SetAttribute("AuraInstance", true)
lightning_18162.Enabled = false
lightning_18162.Rate = 15
lightning_18162.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18162.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18162.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18162.RotSpeed = nr(0,0)
lightning_18162.Size = ns({nsk(0.000000,12.271353,0.000000),nsk(1.000000,12.271353,0.000000)})
lightning_18162.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18162.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18162.LightEmission = 0
lightning_18162.LightInfluence = 0
lightning_18162.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18162.Drag = 0
lightning_18162.EmissionDirection = Enum.NormalId.Top
lightning_18162.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18162.ZOffset = 3.299999952316284
lightning_18162.Texture = "rbxassetid://109604349904035"
lightning_18162.LockedToPart = true
lightning_18162.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18162.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18162.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18162.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18162.FlipbookStartRandom = false
lightning_18162.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local lightning_18163=i("ParticleEmitter", Emit_18143)
lightning_18163.Name="lightning"
lightning_18163:SetAttribute("EmitCount", 3)
lightning_18163:SetAttribute("AuraInstance", true)
lightning_18163.Enabled = false
lightning_18163.Rate = 15
lightning_18163.Lifetime = nr(0.10999999940395355,0.12999999523162842)
lightning_18163.Speed = nr(0.00011573253868846223,0.00011573253868846223)
lightning_18163.Rotation = nr(-995.999755859375,1004.000244140625)
lightning_18163.RotSpeed = nr(0,0)
lightning_18163.Size = ns({nsk(0.000000,12.271353,0.000000),nsk(1.000000,12.271353,0.000000)})
lightning_18163.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.187500,0.000000)})
lightning_18163.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
lightning_18163.LightEmission = 0
lightning_18163.LightInfluence = 0
lightning_18163.Acceleration = v3(0.000000,0.000000,0.000000)
lightning_18163.Drag = 0
lightning_18163.EmissionDirection = Enum.NormalId.Top
lightning_18163.SpreadAngle = v2(-1000.000000,1000.000000)
lightning_18163.ZOffset = 3.299999952316284
lightning_18163.Texture = "rbxassetid://132060681192414"
lightning_18163.LockedToPart = true
lightning_18163.Orientation = Enum.ParticleOrientation.VelocityParallel
lightning_18163.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
lightning_18163.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
lightning_18163.FlipbookFramerate = nr(2.34375,2.34375)
lightning_18163.FlipbookStartRandom = false
lightning_18163.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.213115,0.100000)})

local Explosion_18164=i("Attachment", Charge2_18122)
Explosion_18164.Name="Explosion"
Explosion_18164:SetAttribute("AuraInstance", true)
Explosion_18164.Position = v3(0.000000,0.000000,0.000000)
Explosion_18164.Visible = false

local fog2_18165=i("ParticleEmitter", Explosion_18164)
fog2_18165.Name="fog2"
fog2_18165:SetAttribute("EmitCount", 5)
fog2_18165:SetAttribute("AuraInstance", true)
fog2_18165.Enabled = false
fog2_18165.Rate = 25
fog2_18165.Lifetime = nr(0.5,0.5)
fog2_18165.Speed = nr(180,180)
fog2_18165.Rotation = nr(0,360)
fog2_18165.RotSpeed = nr(0,0)
fog2_18165.Size = ns({nsk(0.000000,22.922462,0.000000),nsk(1.000000,22.922462,0.000000)})
fog2_18165.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.200000,0.901000,0.000000),nsk(1.000000,1.000000,0.000000)})
fog2_18165.Color = cs({csk(0.000000,c3(0.000000,0.000000,0.000000)),csk(1.000000,c3(0.000000,0.000000,0.000000))})
fog2_18165.LightEmission = 0
fog2_18165.LightInfluence = 0
fog2_18165.Acceleration = v3(0.000000,0.000000,0.000000)
fog2_18165.Drag = 10
fog2_18165.EmissionDirection = Enum.NormalId.Front
fog2_18165.SpreadAngle = v2(180.000000,180.000000)
fog2_18165.ZOffset = -12.199999809265137
fog2_18165.Texture = "rbxassetid://11627083142"
fog2_18165.LockedToPart = true
fog2_18165.Orientation = Enum.ParticleOrientation.FacingCamera
fog2_18165.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
fog2_18165.FlipbookMode = Enum.ParticleFlipbookMode.Loop
fog2_18165.FlipbookFramerate = nr(30,30)
fog2_18165.FlipbookStartRandom = false
fog2_18165.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local fog_18166=i("ParticleEmitter", Explosion_18164)
fog_18166.Name="fog"
fog_18166:SetAttribute("EmitCount", 5)
fog_18166:SetAttribute("AuraInstance", true)
fog_18166.Enabled = false
fog_18166.Rate = 25
fog_18166.Lifetime = nr(0.5,0.5)
fog_18166.Speed = nr(180,180)
fog_18166.Rotation = nr(0,360)
fog_18166.RotSpeed = nr(0,0)
fog_18166.Size = ns({nsk(0.000000,22.922462,0.000000),nsk(1.000000,22.922462,0.000000)})
fog_18166.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.200000,0.901000,0.000000),nsk(1.000000,1.000000,0.000000)})
fog_18166.Color = cs({csk(0.000000,c3(0.000000,0.000000,0.000000)),csk(1.000000,c3(0.000000,0.000000,0.000000))})
fog_18166.LightEmission = 0
fog_18166.LightInfluence = 0
fog_18166.Acceleration = v3(0.000000,0.000000,0.000000)
fog_18166.Drag = 10
fog_18166.EmissionDirection = Enum.NormalId.Front
fog_18166.SpreadAngle = v2(180.000000,180.000000)
fog_18166.ZOffset = -12.100000381469727
fog_18166.Texture = "rbxassetid://18739740411"
fog_18166.LockedToPart = true
fog_18166.Orientation = Enum.ParticleOrientation.FacingCamera
fog_18166.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
fog_18166.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
fog_18166.FlipbookFramerate = nr(1,1)
fog_18166.FlipbookStartRandom = false
fog_18166.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Star_18167=i("ParticleEmitter", Explosion_18164)
Star_18167.Name="Star"
Star_18167:SetAttribute("EmitCount", 2)
Star_18167:SetAttribute("AuraInstance", true)
Star_18167.Enabled = false
Star_18167.Rate = 10
Star_18167.Lifetime = nr(0.20000000298023224,0.20000000298023224)
Star_18167.Speed = nr(0,0)
Star_18167.Rotation = nr(0,0)
Star_18167.RotSpeed = nr(0,0)
Star_18167.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,81.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Star_18167.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Star_18167.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Star_18167.LightEmission = 0
Star_18167.LightInfluence = 0
Star_18167.Acceleration = v3(0.000000,0.000000,0.000000)
Star_18167.Drag = 0
Star_18167.EmissionDirection = Enum.NormalId.Top
Star_18167.SpreadAngle = v2(0.000000,0.000000)
Star_18167.ZOffset = 15
Star_18167.Texture = "rbxassetid://17062452122"
Star_18167.LockedToPart = false
Star_18167.Orientation = Enum.ParticleOrientation.FacingCamera
Star_18167.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Star_18167.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Star_18167.FlipbookFramerate = nr(1,1)
Star_18167.FlipbookStartRandom = false
Star_18167.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local SpinDots_18168=i("ParticleEmitter", Explosion_18164)
SpinDots_18168.Name="SpinDots"
SpinDots_18168:SetAttribute("EmitCount", 12)
SpinDots_18168:SetAttribute("AuraInstance", true)
SpinDots_18168.Enabled = false
SpinDots_18168.Rate = 23
SpinDots_18168.Lifetime = nr(0.30000001192092896,0.6000000238418579)
SpinDots_18168.Speed = nr(180,180)
SpinDots_18168.Rotation = nr(0,360)
SpinDots_18168.RotSpeed = nr(-20,20)
SpinDots_18168.Size = ns({nsk(0.000000,15.000000,0.000000),nsk(1.000000,15.000000,0.000000)})
SpinDots_18168.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.189746,0.775000,0.000000),nsk(0.500529,0.581250,0.000000),nsk(0.809725,0.800000,0.000000),nsk(1.000000,1.000000,0.000000)})
SpinDots_18168.Color = cs({csk(0.000000,c3(0.000000,0.000000,0.000000)),csk(1.000000,c3(0.000000,0.000000,0.000000))})
SpinDots_18168.LightEmission = 0
SpinDots_18168.LightInfluence = 0
SpinDots_18168.Acceleration = v3(0.000000,0.000000,0.000000)
SpinDots_18168.Drag = 10
SpinDots_18168.EmissionDirection = Enum.NormalId.Front
SpinDots_18168.SpreadAngle = v2(180.000000,180.000000)
SpinDots_18168.ZOffset = -12
SpinDots_18168.Texture = "http://www.roblox.com/asset/?id=122927543925683"
SpinDots_18168.LockedToPart = true
SpinDots_18168.Orientation = Enum.ParticleOrientation.FacingCamera
SpinDots_18168.FlipbookLayout = Enum.ParticleFlipbookLayout.None
SpinDots_18168.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
SpinDots_18168.FlipbookFramerate = nr(1,1)
SpinDots_18168.FlipbookStartRandom = false
SpinDots_18168.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local PulseDark_18169=i("ParticleEmitter", Explosion_18164)
PulseDark_18169.Name="PulseDark"
PulseDark_18169:SetAttribute("EmitCount", 2)
PulseDark_18169:SetAttribute("AuraInstance", true)
PulseDark_18169.Enabled = false
PulseDark_18169.Rate = 6
PulseDark_18169.Lifetime = nr(0.6000000238418579,0.6000000238418579)
PulseDark_18169.Speed = nr(0,0)
PulseDark_18169.Rotation = nr(0,360)
PulseDark_18169.RotSpeed = nr(0,0)
PulseDark_18169.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,21.729603,0.000000),nsk(0.394376,36.705605,0.000000),nsk(0.606376,41.457603,0.000000),nsk(1.000000,43.200001,0.000000)})
PulseDark_18169.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
PulseDark_18169.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
PulseDark_18169.LightEmission = 0
PulseDark_18169.LightInfluence = 0
PulseDark_18169.Acceleration = v3(0.000000,0.000000,0.000000)
PulseDark_18169.Drag = 0
PulseDark_18169.EmissionDirection = Enum.NormalId.Top
PulseDark_18169.SpreadAngle = v2(0.000000,0.000000)
PulseDark_18169.ZOffset = 1
PulseDark_18169.Texture = "rbxassetid://119057920510209"
PulseDark_18169.LockedToPart = false
PulseDark_18169.Orientation = Enum.ParticleOrientation.FacingCamera
PulseDark_18169.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
PulseDark_18169.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
PulseDark_18169.FlipbookFramerate = nr(1,1)
PulseDark_18169.FlipbookStartRandom = false
PulseDark_18169.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Pulse2_18170=i("ParticleEmitter", Explosion_18164)
Pulse2_18170.Name="Pulse2"
Pulse2_18170:SetAttribute("EmitCount", 3)
Pulse2_18170:SetAttribute("AuraInstance", true)
Pulse2_18170.Enabled = false
Pulse2_18170.Rate = 15
Pulse2_18170.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Pulse2_18170.Speed = nr(0.10000000149011612,0.10000000149011612)
Pulse2_18170.Rotation = nr(0,360)
Pulse2_18170.RotSpeed = nr(0,0)
Pulse2_18170.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,28.248486,0.000000),nsk(0.394376,47.717289,0.000000),nsk(0.606376,53.894886,0.000000),nsk(1.000000,56.160000,0.000000)})
Pulse2_18170.Transparency = ns({nsk(0.000000,0.500000,0.000000),nsk(1.000000,1.000000,0.000000)})
Pulse2_18170.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Pulse2_18170.LightEmission = 0
Pulse2_18170.LightInfluence = 0
Pulse2_18170.Acceleration = v3(0.000000,0.000000,0.000000)
Pulse2_18170.Drag = 0
Pulse2_18170.EmissionDirection = Enum.NormalId.Top
Pulse2_18170.SpreadAngle = v2(180.000000,180.000000)
Pulse2_18170.ZOffset = 0
Pulse2_18170.Texture = "rbxassetid://98161445784635"
Pulse2_18170.LockedToPart = false
Pulse2_18170.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Pulse2_18170.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Pulse2_18170.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Pulse2_18170.FlipbookFramerate = nr(1,1)
Pulse2_18170.FlipbookStartRandom = false
Pulse2_18170.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Pulse1_18171=i("ParticleEmitter", Explosion_18164)
Pulse1_18171.Name="Pulse1"
Pulse1_18171:SetAttribute("EmitCount", 3)
Pulse1_18171:SetAttribute("AuraInstance", true)
Pulse1_18171.Enabled = false
Pulse1_18171.Rate = 15
Pulse1_18171.Lifetime = nr(0.6000000238418579,0.6000000238418579)
Pulse1_18171.Speed = nr(0.10000000149011612,0.10000000149011612)
Pulse1_18171.Rotation = nr(0,360)
Pulse1_18171.RotSpeed = nr(0,0)
Pulse1_18171.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.156376,21.729603,0.000000),nsk(0.394376,36.705605,0.000000),nsk(0.606376,41.457603,0.000000),nsk(1.000000,43.200001,0.000000)})
Pulse1_18171.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
Pulse1_18171.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Pulse1_18171.LightEmission = 0
Pulse1_18171.LightInfluence = 0
Pulse1_18171.Acceleration = v3(0.000000,0.000000,0.000000)
Pulse1_18171.Drag = 0
Pulse1_18171.EmissionDirection = Enum.NormalId.Top
Pulse1_18171.SpreadAngle = v2(180.000000,180.000000)
Pulse1_18171.ZOffset = 0
Pulse1_18171.Texture = "rbxassetid://119057920510209"
Pulse1_18171.LockedToPart = false
Pulse1_18171.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Pulse1_18171.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Pulse1_18171.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Pulse1_18171.FlipbookFramerate = nr(1,1)
Pulse1_18171.FlipbookStartRandom = false
Pulse1_18171.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impact2_18172=i("ParticleEmitter", Explosion_18164)
Impact2_18172.Name="Impact2"
Impact2_18172:SetAttribute("EmitCount", 3)
Impact2_18172:SetAttribute("AuraInstance", true)
Impact2_18172.Enabled = false
Impact2_18172.Rate = 25
Impact2_18172.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Impact2_18172.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Impact2_18172.Rotation = nr(0,0)
Impact2_18172.RotSpeed = nr(0,0)
Impact2_18172.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.148324,40.704739,0.000000),nsk(0.420324,64.590454,0.000000),nsk(1.000000,74.520004,0.010000)})
Impact2_18172.Transparency = ns({nsk(0.000000,0.800000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impact2_18172.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impact2_18172.LightEmission = 0
Impact2_18172.LightInfluence = 0
Impact2_18172.Acceleration = v3(0.000000,0.000000,0.000000)
Impact2_18172.Drag = 0
Impact2_18172.EmissionDirection = Enum.NormalId.Top
Impact2_18172.SpreadAngle = v2(360.000000,360.000000)
Impact2_18172.ZOffset = -0.10000000149011612
Impact2_18172.Texture = "rbxassetid://13800461961"
Impact2_18172.LockedToPart = true
Impact2_18172.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impact2_18172.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impact2_18172.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impact2_18172.FlipbookFramerate = nr(1,1)
Impact2_18172.FlipbookStartRandom = false
Impact2_18172.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impact1_18173=i("ParticleEmitter", Explosion_18164)
Impact1_18173.Name="Impact1"
Impact1_18173:SetAttribute("EmitCount", 3)
Impact1_18173:SetAttribute("AuraInstance", true)
Impact1_18173.Enabled = false
Impact1_18173.Rate = 5
Impact1_18173.Lifetime = nr(0.4000000059604645,0.4000000059604645)
Impact1_18173.Speed = nr(0.0024374998174607754,0.0024374998174607754)
Impact1_18173.Rotation = nr(0,0)
Impact1_18173.RotSpeed = nr(0,0)
Impact1_18173.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.148324,35.395424,0.000000),nsk(0.420324,56.165615,0.000000),nsk(1.000000,64.800003,0.010000)})
Impact1_18173.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Impact1_18173.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impact1_18173.LightEmission = 0
Impact1_18173.LightInfluence = 0
Impact1_18173.Acceleration = v3(0.000000,0.000000,0.000000)
Impact1_18173.Drag = 0
Impact1_18173.EmissionDirection = Enum.NormalId.Top
Impact1_18173.SpreadAngle = v2(360.000000,360.000000)
Impact1_18173.ZOffset = -0.10000000149011612
Impact1_18173.Texture = "rbxassetid://18140248952"
Impact1_18173.LockedToPart = true
Impact1_18173.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impact1_18173.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impact1_18173.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impact1_18173.FlipbookFramerate = nr(1,1)
Impact1_18173.FlipbookStartRandom = false
Impact1_18173.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Fog2_18174=i("ParticleEmitter", Explosion_18164)
Fog2_18174.Name="Fog2"
Fog2_18174:SetAttribute("EmitCount", 40)
Fog2_18174:SetAttribute("AuraInstance", true)
Fog2_18174.Enabled = false
Fog2_18174.Rate = 20
Fog2_18174.Lifetime = nr(1,1.5)
Fog2_18174.Speed = nr(440,480)
Fog2_18174.Rotation = nr(0,360)
Fog2_18174.RotSpeed = nr(0,0)
Fog2_18174.Size = ns({nsk(0.000000,14.400001,0.000000),nsk(1.000000,16.800001,0.000000)})
Fog2_18174.Transparency = ns({nsk(0.000000,0.900000,0.000000),nsk(0.220000,0.950000,0.000000),nsk(1.000000,1.000000,0.000000)})
Fog2_18174.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Fog2_18174.LightEmission = 0
Fog2_18174.LightInfluence = 0
Fog2_18174.Acceleration = v3(0.000000,0.000000,0.000000)
Fog2_18174.Drag = 10
Fog2_18174.EmissionDirection = Enum.NormalId.Left
Fog2_18174.SpreadAngle = v2(3.000000,180.000000)
Fog2_18174.ZOffset = 0
Fog2_18174.Texture = "rbxassetid://9841246065"
Fog2_18174.LockedToPart = false
Fog2_18174.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Fog2_18174.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Fog2_18174.FlipbookMode = Enum.ParticleFlipbookMode.Loop
Fog2_18174.FlipbookFramerate = nr(1,1)
Fog2_18174.FlipbookStartRandom = false
Fog2_18174.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Fog1_18175=i("ParticleEmitter", Explosion_18164)
Fog1_18175.Name="Fog1"
Fog1_18175:SetAttribute("EmitCount", 40)
Fog1_18175:SetAttribute("AuraInstance", true)
Fog1_18175.Enabled = false
Fog1_18175.Rate = 25
Fog1_18175.Lifetime = nr(1,2.5)
Fog1_18175.Speed = nr(40,320)
Fog1_18175.Rotation = nr(0,360)
Fog1_18175.RotSpeed = nr(0,0)
Fog1_18175.Size = ns({nsk(0.000000,21.600000,0.000000),nsk(1.000000,21.600000,0.000000)})
Fog1_18175.Transparency = ns({nsk(0.000000,0.900000,0.000000),nsk(1.000000,1.000000,0.000000)})
Fog1_18175.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Fog1_18175.LightEmission = 0
Fog1_18175.LightInfluence = 1
Fog1_18175.Acceleration = v3(6.400000,6.400000,6.400000)
Fog1_18175.Drag = 6
Fog1_18175.EmissionDirection = Enum.NormalId.Left
Fog1_18175.SpreadAngle = v2(5.000000,180.000000)
Fog1_18175.ZOffset = 0
Fog1_18175.Texture = "rbxassetid://11163763158"
Fog1_18175.LockedToPart = false
Fog1_18175.Orientation = Enum.ParticleOrientation.FacingCamera
Fog1_18175.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Fog1_18175.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Fog1_18175.FlipbookFramerate = nr(1,1)
Fog1_18175.FlipbookStartRandom = false
Fog1_18175.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Explosion3_18176=i("ParticleEmitter", Explosion_18164)
Explosion3_18176.Name="Explosion3"
Explosion3_18176:SetAttribute("EmitCount", 3)
Explosion3_18176:SetAttribute("AuraInstance", true)
Explosion3_18176.Enabled = false
Explosion3_18176.Rate = 20
Explosion3_18176.Lifetime = nr(0.10000000149011612,0.15000000596046448)
Explosion3_18176.Speed = nr(0.08000000566244125,0.08000000566244125)
Explosion3_18176.Rotation = nr(0,360)
Explosion3_18176.RotSpeed = nr(0,0)
Explosion3_18176.Size = ns({nsk(0.000000,16.000000,0.000000),nsk(0.048376,30.698671,0.000000),nsk(0.118376,40.725338,0.000000),nsk(0.216376,48.832005,0.000000),nsk(0.324376,54.805340,0.000000),nsk(0.470376,59.498672,0.000000),nsk(0.616376,61.845337,0.000000),nsk(1.000000,64.000000,0.000000)})
Explosion3_18176.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
Explosion3_18176.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Explosion3_18176.LightEmission = 0
Explosion3_18176.LightInfluence = 0
Explosion3_18176.Acceleration = v3(0.000000,0.000000,0.000000)
Explosion3_18176.Drag = 0
Explosion3_18176.EmissionDirection = Enum.NormalId.Front
Explosion3_18176.SpreadAngle = v2(90.000000,90.000000)
Explosion3_18176.ZOffset = 0.019999999552965164
Explosion3_18176.Texture = "rbxassetid://124167802896759"
Explosion3_18176.LockedToPart = false
Explosion3_18176.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Explosion3_18176.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Explosion3_18176.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Explosion3_18176.FlipbookFramerate = nr(18,18)
Explosion3_18176.FlipbookStartRandom = false
Explosion3_18176.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Explosion2_18177=i("ParticleEmitter", Explosion_18164)
Explosion2_18177.Name="Explosion2"
Explosion2_18177:SetAttribute("EmitCount", 5)
Explosion2_18177:SetAttribute("AuraInstance", true)
Explosion2_18177.Enabled = false
Explosion2_18177.Rate = 20
Explosion2_18177.Lifetime = nr(0.20000000298023224,0.6000000238418579)
Explosion2_18177.Speed = nr(0.08000000566244125,0.08000000566244125)
Explosion2_18177.Rotation = nr(0,360)
Explosion2_18177.RotSpeed = nr(0,0)
Explosion2_18177.Size = ns({nsk(0.000000,16.000000,0.000000),nsk(0.057476,36.629337,0.000000),nsk(0.129476,48.149334,0.000000),nsk(0.251476,55.616005,0.000000),nsk(0.369476,59.029335,0.000000),nsk(0.571476,62.229336,0.000000),nsk(1.000000,64.000000,0.000000)})
Explosion2_18177.Transparency = ns({nsk(0.000000,0.800000,0.000000),nsk(1.000000,1.000000,0.000000)})
Explosion2_18177.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Explosion2_18177.LightEmission = 0
Explosion2_18177.LightInfluence = 0
Explosion2_18177.Acceleration = v3(0.000000,0.000000,0.000000)
Explosion2_18177.Drag = 0
Explosion2_18177.EmissionDirection = Enum.NormalId.Front
Explosion2_18177.SpreadAngle = v2(90.000000,90.000000)
Explosion2_18177.ZOffset = 0.019999999552965164
Explosion2_18177.Texture = "rbxassetid://13795445083"
Explosion2_18177.LockedToPart = false
Explosion2_18177.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Explosion2_18177.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Explosion2_18177.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Explosion2_18177.FlipbookFramerate = nr(18,18)
Explosion2_18177.FlipbookStartRandom = false
Explosion2_18177.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Explosion1_18178=i("ParticleEmitter", Explosion_18164)
Explosion1_18178.Name="Explosion1"
Explosion1_18178:SetAttribute("EmitCount", 15)
Explosion1_18178:SetAttribute("AuraInstance", true)
Explosion1_18178.Enabled = false
Explosion1_18178.Rate = 20
Explosion1_18178.Lifetime = nr(0.5,1)
Explosion1_18178.Speed = nr(40,480)
Explosion1_18178.Rotation = nr(0,360)
Explosion1_18178.RotSpeed = nr(0,0)
Explosion1_18178.Size = ns({nsk(0.000000,48.000000,0.000000),nsk(1.000000,80.000000,0.000000)})
Explosion1_18178.Transparency = ns({nsk(0.000000,0.900000,0.000000),nsk(1.000000,1.000000,0.000000)})
Explosion1_18178.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Explosion1_18178.LightEmission = 0
Explosion1_18178.LightInfluence = 0
Explosion1_18178.Acceleration = v3(20.000000,20.000000,20.000000)
Explosion1_18178.Drag = 10
Explosion1_18178.EmissionDirection = Enum.NormalId.Front
Explosion1_18178.SpreadAngle = v2(90.000000,90.000000)
Explosion1_18178.ZOffset = 0
Explosion1_18178.Texture = "rbxassetid://11792944417"
Explosion1_18178.LockedToPart = false
Explosion1_18178.Orientation = Enum.ParticleOrientation.FacingCamera
Explosion1_18178.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Explosion1_18178.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Explosion1_18178.FlipbookFramerate = nr(18,18)
Explosion1_18178.FlipbookStartRandom = false
Explosion1_18178.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local EffectsBlack_18179=i("ParticleEmitter", Explosion_18164)
EffectsBlack_18179.Name="EffectsBlack"
EffectsBlack_18179:SetAttribute("EmitCount", 10)
EffectsBlack_18179:SetAttribute("AuraInstance", true)
EffectsBlack_18179.Enabled = false
EffectsBlack_18179.Rate = 20
EffectsBlack_18179.Lifetime = nr(0.5,1)
EffectsBlack_18179.Speed = nr(240,400)
EffectsBlack_18179.Rotation = nr(90,90)
EffectsBlack_18179.RotSpeed = nr(0,0)
EffectsBlack_18179.Size = ns({nsk(0.000000,21.167999,0.000000),nsk(0.106780,14.773500,0.000000),nsk(0.344068,10.584000,0.000000),nsk(1.000000,7.056001,0.000000)})
EffectsBlack_18179.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.215254,0.812500,0.000000),nsk(1.000000,1.000000,0.000000)})
EffectsBlack_18179.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
EffectsBlack_18179.LightEmission = 0
EffectsBlack_18179.LightInfluence = 0
EffectsBlack_18179.Acceleration = v3(0.000000,320.000000,0.000000)
EffectsBlack_18179.Drag = 5
EffectsBlack_18179.EmissionDirection = Enum.NormalId.Left
EffectsBlack_18179.SpreadAngle = v2(2.000000,180.000000)
EffectsBlack_18179.ZOffset = 0
EffectsBlack_18179.Texture = "rbxassetid://15550340138"
EffectsBlack_18179.LockedToPart = false
EffectsBlack_18179.Orientation = Enum.ParticleOrientation.VelocityParallel
EffectsBlack_18179.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
EffectsBlack_18179.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
EffectsBlack_18179.FlipbookFramerate = nr(1,1)
EffectsBlack_18179.FlipbookStartRandom = false
EffectsBlack_18179.Squash = ns({nsk(0.000000,1.000000,0.000000),nsk(0.150847,0.344263,0.000000),nsk(0.349153,0.016394,0.000000),nsk(1.000000,0.000000,0.000000)})

local Effects_18180=i("ParticleEmitter", Explosion_18164)
Effects_18180.Name="Effects"
Effects_18180:SetAttribute("EmitCount", 10)
Effects_18180:SetAttribute("AuraInstance", true)
Effects_18180.Enabled = false
Effects_18180.Rate = 20
Effects_18180.Lifetime = nr(0.5,1)
Effects_18180.Speed = nr(240,400)
Effects_18180.Rotation = nr(90,90)
Effects_18180.RotSpeed = nr(0,0)
Effects_18180.Size = ns({nsk(0.000000,21.167999,0.000000),nsk(0.106780,14.773500,0.000000),nsk(0.344068,10.584000,0.000000),nsk(1.000000,7.056001,0.000000)})
Effects_18180.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.215254,0.812500,0.000000),nsk(1.000000,1.000000,0.000000)})
Effects_18180.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Effects_18180.LightEmission = 0
Effects_18180.LightInfluence = 0
Effects_18180.Acceleration = v3(0.000000,320.000000,0.000000)
Effects_18180.Drag = 5
Effects_18180.EmissionDirection = Enum.NormalId.Left
Effects_18180.SpreadAngle = v2(2.000000,180.000000)
Effects_18180.ZOffset = 0
Effects_18180.Texture = "rbxassetid://15550340138"
Effects_18180.LockedToPart = false
Effects_18180.Orientation = Enum.ParticleOrientation.VelocityParallel
Effects_18180.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Effects_18180.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Effects_18180.FlipbookFramerate = nr(1,1)
Effects_18180.FlipbookStartRandom = false
Effects_18180.Squash = ns({nsk(0.000000,1.000000,0.000000),nsk(0.150847,0.344263,0.000000),nsk(0.349153,0.016394,0.000000),nsk(1.000000,0.000000,0.000000)})

local Debris4_18181=i("ParticleEmitter", Explosion_18164)
Debris4_18181.Name="Debris4"
Debris4_18181:SetAttribute("EmitCount", 12)
Debris4_18181:SetAttribute("AuraInstance", true)
Debris4_18181.Enabled = false
Debris4_18181.Rate = 20
Debris4_18181.Lifetime = nr(0.5,1.5)
Debris4_18181.Speed = nr(80,320)
Debris4_18181.Rotation = nr(0,360)
Debris4_18181.RotSpeed = nr(-40,40)
Debris4_18181.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,2.400000,0.400000),nsk(1.000000,0.000000,0.000000)})
Debris4_18181.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Debris4_18181.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Debris4_18181.LightEmission = 0
Debris4_18181.LightInfluence = 0
Debris4_18181.Acceleration = v3(0.000000,-4.000000,0.000000)
Debris4_18181.Drag = 6
Debris4_18181.EmissionDirection = Enum.NormalId.Top
Debris4_18181.SpreadAngle = v2(90.000000,90.000000)
Debris4_18181.ZOffset = 0.10999999940395355
Debris4_18181.Texture = "rbxassetid://16924875355"
Debris4_18181.LockedToPart = false
Debris4_18181.Orientation = Enum.ParticleOrientation.FacingCamera
Debris4_18181.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Debris4_18181.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Debris4_18181.FlipbookFramerate = nr(1,1)
Debris4_18181.FlipbookStartRandom = false
Debris4_18181.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Debris3_18182=i("ParticleEmitter", Explosion_18164)
Debris3_18182.Name="Debris3"
Debris3_18182:SetAttribute("EmitCount", 15)
Debris3_18182:SetAttribute("AuraInstance", true)
Debris3_18182.Enabled = false
Debris3_18182.Rate = 20
Debris3_18182.Lifetime = nr(0.5,1.5)
Debris3_18182.Speed = nr(80,320)
Debris3_18182.Rotation = nr(0,360)
Debris3_18182.RotSpeed = nr(-80,80)
Debris3_18182.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,8.000000,0.280000),nsk(1.000000,0.000000,0.000000)})
Debris3_18182.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Debris3_18182.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Debris3_18182.LightEmission = 0
Debris3_18182.LightInfluence = 0
Debris3_18182.Acceleration = v3(0.000000,0.000000,0.000000)
Debris3_18182.Drag = 6
Debris3_18182.EmissionDirection = Enum.NormalId.Top
Debris3_18182.SpreadAngle = v2(90.000000,90.000000)
Debris3_18182.ZOffset = 0.10999999940395355
Debris3_18182.Texture = "rbxassetid://8242018934"
Debris3_18182.LockedToPart = false
Debris3_18182.Orientation = Enum.ParticleOrientation.FacingCamera
Debris3_18182.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Debris3_18182.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Debris3_18182.FlipbookFramerate = nr(1,1)
Debris3_18182.FlipbookStartRandom = false
Debris3_18182.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Debris2_18183=i("ParticleEmitter", Explosion_18164)
Debris2_18183.Name="Debris2"
Debris2_18183:SetAttribute("EmitCount", 35)
Debris2_18183:SetAttribute("AuraInstance", true)
Debris2_18183.Enabled = false
Debris2_18183.Rate = 20
Debris2_18183.Lifetime = nr(0.5,1.5)
Debris2_18183.Speed = nr(80,320)
Debris2_18183.Rotation = nr(0,360)
Debris2_18183.RotSpeed = nr(-80,80)
Debris2_18183.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.050000,1.600000,0.800000),nsk(1.000000,0.000000,0.000000)})
Debris2_18183.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Debris2_18183.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Debris2_18183.LightEmission = 0
Debris2_18183.LightInfluence = 0
Debris2_18183.Acceleration = v3(0.000000,4.000000,0.000000)
Debris2_18183.Drag = 6
Debris2_18183.EmissionDirection = Enum.NormalId.Top
Debris2_18183.SpreadAngle = v2(90.000000,90.000000)
Debris2_18183.ZOffset = 0.10999999940395355
Debris2_18183.Texture = "rbxassetid://8242018934"
Debris2_18183.LockedToPart = false
Debris2_18183.Orientation = Enum.ParticleOrientation.FacingCamera
Debris2_18183.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2
Debris2_18183.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Debris2_18183.FlipbookFramerate = nr(1,1)
Debris2_18183.FlipbookStartRandom = false
Debris2_18183.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Debris1_18184=i("ParticleEmitter", Explosion_18164)
Debris1_18184.Name="Debris1"
Debris1_18184:SetAttribute("EmitCount", 12)
Debris1_18184:SetAttribute("AuraInstance", true)
Debris1_18184.Enabled = false
Debris1_18184.Rate = 20
Debris1_18184.Lifetime = nr(0.5,1.5)
Debris1_18184.Speed = nr(80,320)
Debris1_18184.Rotation = nr(0,360)
Debris1_18184.RotSpeed = nr(-50,50)
Debris1_18184.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.100000,2.400000,0.400000),nsk(1.000000,0.000000,0.000000)})
Debris1_18184.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Debris1_18184.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Debris1_18184.LightEmission = 0
Debris1_18184.LightInfluence = 0
Debris1_18184.Acceleration = v3(20.000000,20.000000,20.000000)
Debris1_18184.Drag = 15
Debris1_18184.EmissionDirection = Enum.NormalId.Top
Debris1_18184.SpreadAngle = v2(90.000000,90.000000)
Debris1_18184.ZOffset = 0.09999999403953552
Debris1_18184.Texture = "rbxassetid://16924875355"
Debris1_18184.LockedToPart = true
Debris1_18184.Orientation = Enum.ParticleOrientation.FacingCamera
Debris1_18184.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Debris1_18184.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Debris1_18184.FlipbookFramerate = nr(1,1)
Debris1_18184.FlipbookStartRandom = false
Debris1_18184.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local BigBurstFlowGlow_18185=i("ParticleEmitter", Explosion_18164)
BigBurstFlowGlow_18185.Name="BigBurstFlowGlow"
BigBurstFlowGlow_18185:SetAttribute("EmitCount", 5)
BigBurstFlowGlow_18185:SetAttribute("AuraInstance", true)
BigBurstFlowGlow_18185.Enabled = false
BigBurstFlowGlow_18185.Rate = 20
BigBurstFlowGlow_18185.Lifetime = nr(0.20000000298023224,0.4000000059604645)
BigBurstFlowGlow_18185.Speed = nr(0.001120000029914081,0.001120000029914081)
BigBurstFlowGlow_18185.Rotation = nr(0,360)
BigBurstFlowGlow_18185.RotSpeed = nr(0,0)
BigBurstFlowGlow_18185.Size = ns({nsk(0.000000,23.799997,0.000000),nsk(0.106376,45.483902,0.000000),nsk(0.234376,57.726902,0.000000),nsk(0.408376,63.501900,0.000000),nsk(0.614376,66.966904,0.000000),nsk(1.000000,69.299995,0.000000)})
BigBurstFlowGlow_18185.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
BigBurstFlowGlow_18185.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
BigBurstFlowGlow_18185.LightEmission = 0
BigBurstFlowGlow_18185.LightInfluence = 0
BigBurstFlowGlow_18185.Acceleration = v3(0.000000,0.000000,0.000000)
BigBurstFlowGlow_18185.Drag = 8
BigBurstFlowGlow_18185.EmissionDirection = Enum.NormalId.Top
BigBurstFlowGlow_18185.SpreadAngle = v2(180.000000,180.000000)
BigBurstFlowGlow_18185.ZOffset = 0.009999999776482582
BigBurstFlowGlow_18185.Texture = "rbxassetid://13553050928"
BigBurstFlowGlow_18185.LockedToPart = false
BigBurstFlowGlow_18185.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
BigBurstFlowGlow_18185.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
BigBurstFlowGlow_18185.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
BigBurstFlowGlow_18185.FlipbookFramerate = nr(1,1)
BigBurstFlowGlow_18185.FlipbookStartRandom = false
BigBurstFlowGlow_18185.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local ImpactDebris_18186=i("ParticleEmitter", Explosion_18164)
ImpactDebris_18186.Name="ImpactDebris"
ImpactDebris_18186:SetAttribute("EmitCount", 15)
ImpactDebris_18186:SetAttribute("AuraInstance", true)
ImpactDebris_18186.Enabled = false
ImpactDebris_18186.Rate = 20
ImpactDebris_18186.Lifetime = nr(1.5,2.5)
ImpactDebris_18186.Speed = nr(80,320)
ImpactDebris_18186.Rotation = nr(-90,-90)
ImpactDebris_18186.RotSpeed = nr(0,0)
ImpactDebris_18186.Size = ns({nsk(0.000000,30.000000,0.000000),nsk(1.000000,30.000000,0.000000)})
ImpactDebris_18186.Transparency = ns({nsk(0.000000,0.900000,0.000000),nsk(1.000000,1.000000,0.000000)})
ImpactDebris_18186.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
ImpactDebris_18186.LightEmission = 0
ImpactDebris_18186.LightInfluence = 0
ImpactDebris_18186.Acceleration = v3(0.000000,0.000000,0.000000)
ImpactDebris_18186.Drag = 6
ImpactDebris_18186.EmissionDirection = Enum.NormalId.Top
ImpactDebris_18186.SpreadAngle = v2(180.000000,180.000000)
ImpactDebris_18186.ZOffset = 0.10999999940395355
ImpactDebris_18186.Texture = "rbxassetid://13280154167"
ImpactDebris_18186.LockedToPart = false
ImpactDebris_18186.Orientation = Enum.ParticleOrientation.VelocityParallel
ImpactDebris_18186.FlipbookLayout = Enum.ParticleFlipbookLayout.Custom
ImpactDebris_18186.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
ImpactDebris_18186.FlipbookFramerate = nr(1,1)
ImpactDebris_18186.FlipbookStartRandom = false
ImpactDebris_18186.Squash = ns({nsk(0.000000,-0.500000,0.000000),nsk(1.000000,-0.500000,0.000000)})


for _,b in Charge2_18122:GetDescendants() do
if b:IsA("ParticleEmitter") then 
b:SetAttribute("EmitCount",1)
end
end





local PULSE_19099=i("Attachment", sq1)
PULSE_19099.Name="PULSE"
PULSE_19099:SetAttribute("AuraInstance", true)
PULSE_19099.Position = v3(0.000000,1,0.000000)
PULSE_19099.Visible = false

local Winds2_19100=i("ParticleEmitter", PULSE_19099)
Winds2_19100.Name="Winds2"
Winds2_19100:SetAttribute("EmitCount", 7)
Winds2_19100:SetAttribute("AuraInstance", true)
Winds2_19100.Enabled = false
Winds2_19100.Rate = 0
Winds2_19100.Lifetime = nr(0.6481481194496155,0.9259259104728699)
Winds2_19100.Speed = nr(1,1)
Winds2_19100.Rotation = nr(-360,360)
Winds2_19100.RotSpeed = nr(0,0)
Winds2_19100.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.105146,54.120396,0.000000),nsk(0.347146,72.352165,0.000000),nsk(0.659146,78.929634,0.000000),nsk(1.000000,82.065216,0.000000)})
Winds2_19100.Transparency = ns({nsk(0.000000,0.950000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds2_19100.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Winds2_19100.LightEmission = 0
Winds2_19100.LightInfluence = 0
Winds2_19100.Acceleration = v3(0.000000,0.000000,0.000000)
Winds2_19100.Drag = 0
Winds2_19100.EmissionDirection = Enum.NormalId.Top
Winds2_19100.SpreadAngle = v2(15.000000,15.000000)
Winds2_19100.ZOffset = 0
Winds2_19100.Texture = "rbxassetid://15124481454"
Winds2_19100.LockedToPart = false
Winds2_19100.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds2_19100.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Winds2_19100.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Winds2_19100.FlipbookFramerate = nr(10.800000190734863,10.800000190734863)
Winds2_19100.FlipbookStartRandom = false
Winds2_19100.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Winds1_19101=i("ParticleEmitter", PULSE_19099)
Winds1_19101.Name="Winds1"
Winds1_19101:SetAttribute("EmitCount", 7)
Winds1_19101:SetAttribute("AuraInstance", true)
Winds1_19101.Enabled = false
Winds1_19101.Rate = 0
Winds1_19101.Lifetime = nr(0.6481481194496155,0.9259259104728699)
Winds1_19101.Speed = nr(1,1)
Winds1_19101.Rotation = nr(-360,360)
Winds1_19101.RotSpeed = nr(0,0)
Winds1_19101.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.105146,54.120396,0.000000),nsk(0.347146,72.352165,0.000000),nsk(0.659146,78.929634,0.000000),nsk(1.000000,82.065216,0.000000)})
Winds1_19101.Transparency = ns({nsk(0.000000,0.950000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds1_19101.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Winds1_19101.LightEmission = 0
Winds1_19101.LightInfluence = 0
Winds1_19101.Acceleration = v3(0.000000,0.000000,0.000000)
Winds1_19101.Drag = 0
Winds1_19101.EmissionDirection = Enum.NormalId.Top
Winds1_19101.SpreadAngle = v2(15.000000,15.000000)
Winds1_19101.ZOffset = 0
Winds1_19101.Texture = "rbxassetid://9281305957"
Winds1_19101.LockedToPart = false
Winds1_19101.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds1_19101.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Winds1_19101.FlipbookMode = Enum.ParticleFlipbookMode.Loop
Winds1_19101.FlipbookFramerate = nr(1.0800000429153442,1.0800000429153442)
Winds1_19101.FlipbookStartRandom = false
Winds1_19101.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local StarIn_19102=i("ParticleEmitter", PULSE_19099)
StarIn_19102.Name="StarIn"
StarIn_19102:SetAttribute("EmitCount", 1)
StarIn_19102:SetAttribute("AuraInstance", true)
StarIn_19102.Enabled = false
StarIn_19102.Rate = 0
StarIn_19102.Lifetime = nr(0.30000001192092896,0.30000001192092896)
StarIn_19102.Speed = nr(0,0)
StarIn_19102.Rotation = nr(0,360)
StarIn_19102.RotSpeed = nr(-180,180)
StarIn_19102.Size = ns({nsk(0.000000,109.366158,0.000000),nsk(0.138548,40.100925,0.000000),nsk(0.420548,12.759385,0.000000),nsk(0.817796,1.379999,0.000000),nsk(1.000000,0.000000,0.000000)})
StarIn_19102.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
StarIn_19102.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
StarIn_19102.LightEmission = -3
StarIn_19102.LightInfluence = 0
StarIn_19102.Acceleration = v3(0.000000,0.000000,0.000000)
StarIn_19102.Drag = 0
StarIn_19102.EmissionDirection = Enum.NormalId.Top
StarIn_19102.SpreadAngle = v2(0.000000,0.000000)
StarIn_19102.ZOffset = 2
StarIn_19102.Texture = "rbxassetid://17062452122"
StarIn_19102.LockedToPart = true
StarIn_19102.Orientation = Enum.ParticleOrientation.FacingCamera
StarIn_19102.FlipbookLayout = Enum.ParticleFlipbookLayout.None
StarIn_19102.FlipbookMode = Enum.ParticleFlipbookMode.Loop
StarIn_19102.FlipbookFramerate = nr(1,1)
StarIn_19102.FlipbookStartRandom = false
StarIn_19102.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})


local Shock3_19104=i("ParticleEmitter", PULSE_19099)
Shock3_19104.Name="Shock3"
Shock3_19104:SetAttribute("EmitCount", 2)
Shock3_19104:SetAttribute("AuraInstance", true)
Shock3_19104.Enabled = false
Shock3_19104.Rate = 25
Shock3_19104.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Shock3_19104.Speed = nr(0.000800000037997961,0.000800000037997961)
Shock3_19104.Rotation = nr(0,360)
Shock3_19104.RotSpeed = nr(0,0)
Shock3_19104.Size = ns({nsk(0.000000,9.600000,0.000000),nsk(0.076271,28.500000,0.000000),nsk(0.225424,40.500000,0.000000),nsk(0.500000,45.900002,0.000000),nsk(1.000000,48.000000,0.000000)})
Shock3_19104.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.901099,0.243750,0.000000),nsk(1.000000,1.000000,0.000000)})
Shock3_19104.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Shock3_19104.LightEmission = -5
Shock3_19104.LightInfluence = 0
Shock3_19104.Acceleration = v3(0.000000,0.000000,0.000000)
Shock3_19104.Drag = 0
Shock3_19104.EmissionDirection = Enum.NormalId.Top
Shock3_19104.SpreadAngle = v2(15.000000,15.000000)
Shock3_19104.ZOffset = 0
Shock3_19104.Texture = "rbxassetid://13521633748"
Shock3_19104.LockedToPart = false
Shock3_19104.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Shock3_19104.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Shock3_19104.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Shock3_19104.FlipbookFramerate = nr(1,1)
Shock3_19104.FlipbookStartRandom = false
Shock3_19104.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Shock2_19105=i("ParticleEmitter", PULSE_19099)
Shock2_19105.Name="Shock2"
Shock2_19105:SetAttribute("EmitCount", 2)
Shock2_19105:SetAttribute("AuraInstance", true)
Shock2_19105.Enabled = false
Shock2_19105.Rate = 2
Shock2_19105.Lifetime = nr(0.25,0.25)
Shock2_19105.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Shock2_19105.Rotation = nr(0,360)
Shock2_19105.RotSpeed = nr(0,0)
Shock2_19105.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.062548,22.147905,0.000000),nsk(0.166548,36.085812,0.000000),nsk(0.341250,45.000000,0.000000),nsk(0.593224,53.899597,0.000000),nsk(1.000000,57.279064,0.000000)})
Shock2_19105.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Shock2_19105.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Shock2_19105.LightEmission = -5
Shock2_19105.LightInfluence = 0
Shock2_19105.Acceleration = v3(0.000000,0.000000,0.000000)
Shock2_19105.Drag = 0
Shock2_19105.EmissionDirection = Enum.NormalId.Top
Shock2_19105.SpreadAngle = v2(10.000000,10.000000)
Shock2_19105.ZOffset = 2
Shock2_19105.Texture = "rbxassetid://14152113700"
Shock2_19105.LockedToPart = false
Shock2_19105.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Shock2_19105.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Shock2_19105.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Shock2_19105.FlipbookFramerate = nr(1,1)
Shock2_19105.FlipbookStartRandom = false
Shock2_19105.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Shock1_19106=i("ParticleEmitter", PULSE_19099)
Shock1_19106.Name="Shock1"
Shock1_19106:SetAttribute("EmitCount", 2)
Shock1_19106:SetAttribute("AuraInstance", true)
Shock1_19106.Enabled = false
Shock1_19106.Rate = 2
Shock1_19106.Lifetime = nr(0.25,0.25)
Shock1_19106.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Shock1_19106.Rotation = nr(0,0)
Shock1_19106.RotSpeed = nr(0,0)
Shock1_19106.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.080548,21.400000,0.000000),nsk(0.230548,41.571136,0.000000),nsk(0.426548,52.755249,0.000000),nsk(0.628548,60.140984,0.000000),nsk(1.000000,63.306297,0.000000)})
Shock1_19106.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})
Shock1_19106.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Shock1_19106.LightEmission = -1
Shock1_19106.LightInfluence = 0
Shock1_19106.Acceleration = v3(0.000000,0.000000,0.000000)
Shock1_19106.Drag = 0
Shock1_19106.EmissionDirection = Enum.NormalId.Top
Shock1_19106.SpreadAngle = v2(10.000000,10.000000)
Shock1_19106.ZOffset = 2
Shock1_19106.Texture = "rbxassetid://92353261735516"
Shock1_19106.LockedToPart = false
Shock1_19106.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Shock1_19106.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Shock1_19106.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Shock1_19106.FlipbookFramerate = nr(1,1)
Shock1_19106.FlipbookStartRandom = false
Shock1_19106.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local ImpactsHorizon_19107=i("ParticleEmitter", PULSE_19099)
ImpactsHorizon_19107.Name="ImpactsHorizon"
ImpactsHorizon_19107:SetAttribute("EmitCount", 3)
ImpactsHorizon_19107:SetAttribute("AuraInstance", true)
ImpactsHorizon_19107.Enabled = false
ImpactsHorizon_19107.Rate = 25
ImpactsHorizon_19107.Lifetime = nr(0.20000000298023224,0.5)
ImpactsHorizon_19107.Speed = nr(0.0010000000474974513,0.0010000000474974513)
ImpactsHorizon_19107.Rotation = nr(0,360)
ImpactsHorizon_19107.RotSpeed = nr(0,0)
ImpactsHorizon_19107.Size = ns({nsk(0.000000,12.000000,0.000000),nsk(0.076271,35.625000,0.000000),nsk(0.225424,50.625000,0.000000),nsk(0.500000,57.375000,0.000000),nsk(1.000000,60.000000,0.000000)})
ImpactsHorizon_19107.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.211864,0.512500,0.000000),nsk(0.383051,0.793750,0.000000),nsk(0.566102,0.925000,0.000000),nsk(1.000000,1.000000,0.000000)})
ImpactsHorizon_19107.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
ImpactsHorizon_19107.LightEmission = 0
ImpactsHorizon_19107.LightInfluence = 0
ImpactsHorizon_19107.Acceleration = v3(0.000000,0.000000,0.000000)
ImpactsHorizon_19107.Drag = 0
ImpactsHorizon_19107.EmissionDirection = Enum.NormalId.Top
ImpactsHorizon_19107.SpreadAngle = v2(6.000000,6.000000)
ImpactsHorizon_19107.ZOffset = 0
ImpactsHorizon_19107.Texture = "rbxassetid://16924410706"
ImpactsHorizon_19107.LockedToPart = false
ImpactsHorizon_19107.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
ImpactsHorizon_19107.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
ImpactsHorizon_19107.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
ImpactsHorizon_19107.FlipbookFramerate = nr(1,1)
ImpactsHorizon_19107.FlipbookStartRandom = false
ImpactsHorizon_19107.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impacts_19108=i("ParticleEmitter", PULSE_19099)
Impacts_19108.Name="Impacts"
Impacts_19108:SetAttribute("EmitCount", 3)
Impacts_19108:SetAttribute("AuraInstance", true)
Impacts_19108.Enabled = false
Impacts_19108.Rate = 25
Impacts_19108.Lifetime = nr(0.20000000298023224,0.5)
Impacts_19108.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Impacts_19108.Rotation = nr(0,360)
Impacts_19108.RotSpeed = nr(0,0)
Impacts_19108.Size = ns({nsk(0.000000,12.000000,0.000000),nsk(0.076271,35.625000,0.000000),nsk(0.225424,50.625000,0.000000),nsk(0.500000,57.375000,0.000000),nsk(1.000000,60.000000,0.000000)})
Impacts_19108.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.211864,0.512500,0.000000),nsk(0.383051,0.793750,0.000000),nsk(0.566102,0.925000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impacts_19108.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impacts_19108.LightEmission = 0
Impacts_19108.LightInfluence = 0
Impacts_19108.Acceleration = v3(0.000000,0.000000,0.000000)
Impacts_19108.Drag = 0
Impacts_19108.EmissionDirection = Enum.NormalId.Top
Impacts_19108.SpreadAngle = v2(180.000000,180.000000)
Impacts_19108.ZOffset = 0
Impacts_19108.Texture = "rbxassetid://18453327840"
Impacts_19108.LockedToPart = false
Impacts_19108.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impacts_19108.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Impacts_19108.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impacts_19108.FlipbookFramerate = nr(1,1)
Impacts_19108.FlipbookStartRandom = false
Impacts_19108.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Glar_19109=i("ParticleEmitter", PULSE_19099)
Glar_19109.Name="Glar"
Glar_19109:SetAttribute("EmitCount", 3)
Glar_19109:SetAttribute("AuraInstance", true)
Glar_19109.Enabled = false
Glar_19109.Rate = 25
Glar_19109.Lifetime = nr(0.10000000149011612,0.30000001192092896)
Glar_19109.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Glar_19109.Rotation = nr(0,360)
Glar_19109.RotSpeed = nr(0,0)
Glar_19109.Size = ns({nsk(0.000000,5.000000,0.000000),nsk(0.100000,65.589424,0.000000),nsk(0.200000,96.097214,0.000000),nsk(0.300000,110.691628,0.000000),nsk(0.400000,117.975418,0.000000),nsk(0.500000,121.705025,0.000000),nsk(0.600000,123.592957,0.000000),nsk(0.700000,124.494095,0.000000),nsk(0.800000,124.870071,0.000000),nsk(0.900000,124.985733,0.000000),nsk(1.000000,125.000000,0.000000),nsk(1.000000,125.000000,0.000000)})
Glar_19109.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.211864,0.512500,0.000000),nsk(0.383051,0.793750,0.000000),nsk(0.566102,0.925000,0.000000),nsk(1.000000,1.000000,0.000000)})
Glar_19109.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Glar_19109.LightEmission = 0
Glar_19109.LightInfluence = 0
Glar_19109.Acceleration = v3(0.000000,0.000000,0.000000)
Glar_19109.Drag = 0
Glar_19109.EmissionDirection = Enum.NormalId.Top
Glar_19109.SpreadAngle = v2(180.000000,180.000000)
Glar_19109.ZOffset = 0
Glar_19109.Texture = "rbxassetid://74633209088223"
Glar_19109.LockedToPart = false
Glar_19109.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Glar_19109.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Glar_19109.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Glar_19109.FlipbookFramerate = nr(1,1)
Glar_19109.FlipbookStartRandom = false
Glar_19109.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Winds3_19110=i("ParticleEmitter", PULSE_19099)
Winds3_19110.Name="Winds3"
Winds3_19110:SetAttribute("EmitCount", 7)
Winds3_19110:SetAttribute("AuraInstance", true)
Winds3_19110.Enabled = false
Winds3_19110.Rate = 0
Winds3_19110.Lifetime = nr(0.6481481194496155,0.9259259104728699)
Winds3_19110.Speed = nr(1.2100000381469727,1.2100000381469727)
Winds3_19110.Rotation = nr(-360,360)
Winds3_19110.RotSpeed = nr(0,0)
Winds3_19110.Size = ns({nsk(0.000000,0.000000,0.000000),nsk(0.105146,65.485680,0.000000),nsk(0.347146,87.546120,0.000000),nsk(0.659146,95.504860,0.000000),nsk(1.000000,99.298912,0.000000)})
Winds3_19110.Transparency = ns({nsk(0.000000,0.950000,0.000000),nsk(1.000000,1.000000,0.000000)})
Winds3_19110.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Winds3_19110.LightEmission = 0
Winds3_19110.LightInfluence = 0
Winds3_19110.Acceleration = v3(0.000000,0.000000,0.000000)
Winds3_19110.Drag = 0
Winds3_19110.EmissionDirection = Enum.NormalId.Top
Winds3_19110.SpreadAngle = v2(15.000000,15.000000)
Winds3_19110.ZOffset = 0
Winds3_19110.Texture = "rbxassetid://17000892071"
Winds3_19110.LockedToPart = false
Winds3_19110.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Winds3_19110.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Winds3_19110.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Winds3_19110.FlipbookFramerate = nr(1.0800000429153442,1.0800000429153442)
Winds3_19110.FlipbookStartRandom = false
Winds3_19110.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impacts4_19111=i("ParticleEmitter", PULSE_19099)
Impacts4_19111.Name="Impacts4"
Impacts4_19111:SetAttribute("EmitCount", 1)
Impacts4_19111:SetAttribute("AuraInstance", true)
Impacts4_19111.Enabled = false
Impacts4_19111.Rate = 20
Impacts4_19111.Lifetime = nr(0.30000001192092896,0.5)
Impacts4_19111.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Impacts4_19111.Rotation = nr(0,360)
Impacts4_19111.RotSpeed = nr(0,0)
Impacts4_19111.Size = ns({nsk(0.000000,40.000000,0.000000),nsk(0.083051,52.500000,0.000000),nsk(0.211864,58.999996,0.000000),nsk(0.472881,60.500000,0.000000),nsk(1.000000,64.000000,0.000000)})
Impacts4_19111.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.900000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impacts4_19111.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impacts4_19111.LightEmission = 1
Impacts4_19111.LightInfluence = 0
Impacts4_19111.Acceleration = v3(0.000000,0.000000,0.000000)
Impacts4_19111.Drag = 0
Impacts4_19111.EmissionDirection = Enum.NormalId.Top
Impacts4_19111.SpreadAngle = v2(3.000000,3.000000)
Impacts4_19111.ZOffset = 0
Impacts4_19111.Texture = "rbxassetid://18356099314"
Impacts4_19111.LockedToPart = false
Impacts4_19111.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impacts4_19111.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Impacts4_19111.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impacts4_19111.FlipbookFramerate = nr(1,1)
Impacts4_19111.FlipbookStartRandom = false
Impacts4_19111.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impacts4_19112=i("ParticleEmitter", PULSE_19099)
Impacts4_19112.Name="Impacts4"
Impacts4_19112:SetAttribute("EmitCount", 1)
Impacts4_19112:SetAttribute("AuraInstance", true)
Impacts4_19112.Enabled = false
Impacts4_19112.Rate = 20
Impacts4_19112.Lifetime = nr(0.30000001192092896,0.5)
Impacts4_19112.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Impacts4_19112.Rotation = nr(0,360)
Impacts4_19112.RotSpeed = nr(0,0)
Impacts4_19112.Size = ns({nsk(0.000000,40.000000,0.000000),nsk(0.083051,52.500000,0.000000),nsk(0.211864,58.999996,0.000000),nsk(0.472881,60.500000,0.000000),nsk(1.000000,64.000000,0.000000)})
Impacts4_19112.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.900000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impacts4_19112.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impacts4_19112.LightEmission = 1
Impacts4_19112.LightInfluence = 0
Impacts4_19112.Acceleration = v3(0.000000,0.000000,0.000000)
Impacts4_19112.Drag = 0
Impacts4_19112.EmissionDirection = Enum.NormalId.Top
Impacts4_19112.SpreadAngle = v2(3.000000,3.000000)
Impacts4_19112.ZOffset = 0
Impacts4_19112.Texture = "rbxassetid://10529371971"
Impacts4_19112.LockedToPart = false
Impacts4_19112.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impacts4_19112.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Impacts4_19112.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impacts4_19112.FlipbookFramerate = nr(1,1)
Impacts4_19112.FlipbookStartRandom = false
Impacts4_19112.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impacts3_19113=i("ParticleEmitter", PULSE_19099)
Impacts3_19113.Name="Impacts3"
Impacts3_19113:SetAttribute("EmitCount", 1)
Impacts3_19113:SetAttribute("AuraInstance", true)
Impacts3_19113.Enabled = false
Impacts3_19113.Rate = 20
Impacts3_19113.Lifetime = nr(0.30000001192092896,0.5)
Impacts3_19113.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Impacts3_19113.Rotation = nr(0,360)
Impacts3_19113.RotSpeed = nr(0,0)
Impacts3_19113.Size = ns({nsk(0.000000,40.000000,0.000000),nsk(0.083051,52.500000,0.000000),nsk(0.211864,58.999996,0.000000),nsk(0.472881,60.500000,0.000000),nsk(1.000000,64.000000,0.000000)})
Impacts3_19113.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.800000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impacts3_19113.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impacts3_19113.LightEmission = 1
Impacts3_19113.LightInfluence = 0
Impacts3_19113.Acceleration = v3(0.000000,0.000000,0.000000)
Impacts3_19113.Drag = 0
Impacts3_19113.EmissionDirection = Enum.NormalId.Top
Impacts3_19113.SpreadAngle = v2(3.000000,3.000000)
Impacts3_19113.ZOffset = 0
Impacts3_19113.Texture = "rbxassetid://13280251453"
Impacts3_19113.LockedToPart = false
Impacts3_19113.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impacts3_19113.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Impacts3_19113.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impacts3_19113.FlipbookFramerate = nr(1,1)
Impacts3_19113.FlipbookStartRandom = false
Impacts3_19113.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impacts1_19114=i("ParticleEmitter", PULSE_19099)
Impacts1_19114.Name="Impacts1"
Impacts1_19114:SetAttribute("EmitCount", 2)
Impacts1_19114:SetAttribute("AuraInstance", true)
Impacts1_19114.Enabled = false
Impacts1_19114.Rate = 25
Impacts1_19114.Lifetime = nr(0.30000001192092896,0.30000001192092896)
Impacts1_19114.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Impacts1_19114.Rotation = nr(0,360)
Impacts1_19114.RotSpeed = nr(0,0)
Impacts1_19114.Size = ns({nsk(0.000000,40.000000,0.000000),nsk(1.000000,40.000000,0.000000)})
Impacts1_19114.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impacts1_19114.Color = cs({csk(0.000000,c3(0.000000,0.000000,0.000000)),csk(1.000000,c3(0.000000,0.000000,0.000000))})
Impacts1_19114.LightEmission = 0
Impacts1_19114.LightInfluence = 0
Impacts1_19114.Acceleration = v3(0.000000,0.000000,0.000000)
Impacts1_19114.Drag = 0
Impacts1_19114.EmissionDirection = Enum.NormalId.Top
Impacts1_19114.SpreadAngle = v2(35.000000,35.000000)
Impacts1_19114.ZOffset = 0
Impacts1_19114.Texture = "rbxassetid://18140248952"
Impacts1_19114.LockedToPart = false
Impacts1_19114.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impacts1_19114.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impacts1_19114.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impacts1_19114.FlipbookFramerate = nr(1,1)
Impacts1_19114.FlipbookStartRandom = false
Impacts1_19114.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Impacts_19115=i("ParticleEmitter", PULSE_19099)
Impacts_19115.Name="Impacts"
Impacts_19115:SetAttribute("EmitCount", 3)
Impacts_19115:SetAttribute("AuraInstance", true)
Impacts_19115.Enabled = false
Impacts_19115.Rate = 25
Impacts_19115.Lifetime = nr(0.20000000298023224,0.5)
Impacts_19115.Speed = nr(0.0010000000474974513,0.0010000000474974513)
Impacts_19115.Rotation = nr(0,360)
Impacts_19115.RotSpeed = nr(0,0)
Impacts_19115.Size = ns({nsk(0.000000,12.000000,0.000000),nsk(0.076271,35.625000,0.000000),nsk(0.225424,50.625000,0.000000),nsk(0.500000,57.375000,0.000000),nsk(1.000000,60.000000,0.000000)})
Impacts_19115.Transparency = ns({nsk(0.000000,1.000000,0.000000),nsk(0.100000,0.000000,0.000000),nsk(0.211864,0.512500,0.000000),nsk(0.383051,0.793750,0.000000),nsk(0.566102,0.925000,0.000000),nsk(1.000000,1.000000,0.000000)})
Impacts_19115.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Impacts_19115.LightEmission = 1
Impacts_19115.LightInfluence = 0
Impacts_19115.Acceleration = v3(0.000000,0.000000,0.000000)
Impacts_19115.Drag = 0
Impacts_19115.EmissionDirection = Enum.NormalId.Top
Impacts_19115.SpreadAngle = v2(180.000000,180.000000)
Impacts_19115.ZOffset = 0
Impacts_19115.Texture = "rbxassetid://15536021290"
Impacts_19115.LockedToPart = false
Impacts_19115.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
Impacts_19115.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
Impacts_19115.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Impacts_19115.FlipbookFramerate = nr(1,1)
Impacts_19115.FlipbookStartRandom = false
Impacts_19115.Squash = ns({nsk(0.000000,0.000000,0.000000),nsk(1.000000,0.000000,0.000000)})

local Glow_19116=i("ParticleEmitter", PULSE_19099)
Glow_19116.Name="Glow"
Glow_19116:SetAttribute("EmitCount", 2)
Glow_19116:SetAttribute("AuraInstance", true)
Glow_19116.Enabled = false
Glow_19116.Rate = 2
Glow_19116.Lifetime = nr(0.14000000059604645,0.14000000059604645)
Glow_19116.Speed = nr(0,0)
Glow_19116.Rotation = nr(0,0)
Glow_19116.RotSpeed = nr(0,0)
Glow_19116.Size = ns({nsk(0.000000,88.232071,0.000000),nsk(0.100000,88.530083,0.000000),nsk(0.200000,89.670715,0.000000),nsk(0.300000,91.565712,0.000000),nsk(0.400000,94.076195,0.000000),nsk(0.500000,97.096199,0.000000),nsk(0.600000,100.547043,0.000000),nsk(0.700000,104.369041,0.000000),nsk(0.800000,108.515800,0.000000),nsk(0.900000,112.950386,0.000000),nsk(1.000000,117.642769,0.000000),nsk(1.000000,117.642769,0.000000)})
Glow_19116.Transparency = ns({nsk(0.000000,0.000000,0.000000),nsk(0.256871,0.000000,0.000000),nsk(0.545455,0.571429,0.000000),nsk(0.793340,0.906832,0.000000),nsk(1.000000,1.000000,0.000000)})
Glow_19116.Color = cs({csk(0.000000,c3(1.000000,1.000000,1.000000)),csk(1.000000,c3(1.000000,1.000000,1.000000))})
Glow_19116.LightEmission = 0
Glow_19116.LightInfluence = 0
Glow_19116.Acceleration = v3(0.000000,0.000000,0.000000)
Glow_19116.Drag = 0
Glow_19116.EmissionDirection = Enum.NormalId.Top
Glow_19116.SpreadAngle = v2(0.000000,0.000000)
Glow_19116.ZOffset = 3
Glow_19116.Texture = "rbxassetid://14183571391"
Glow_19116.LockedToPart = false
Glow_19116.Orientation = Enum.ParticleOrientation.FacingCamera
Glow_19116.FlipbookLayout = Enum.ParticleFlipbookLayout.None
Glow_19116.FlipbookMode = Enum.ParticleFlipbookMode.Loop
Glow_19116.FlipbookFramerate = nr(1,1)
Glow_19116.FlipbookStartRandom = false
Glow_19116.Squash = ns({nsk(0.000000,-0.262500,0.000000),nsk(1.000000,0.391304,0.000000)})








end

Part1()





tspawn(function()
local count=1
for _=0, 3 do
count+=1 
local AttClone=AttachmentClone:Clone()
AttClone.Parent=Floor2 
AttClone.Name=count 
for _,v in AttClone:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Name=v.Name.."_"..count
end
end
end
end)
tspawn(function()
local count=1
for _=0, 3 do
count+=1 
local AttClone=AttachmentClone1:Clone()
AttClone.Parent=Floor2 
AttClone.Name=count 
for _,v in AttClone:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Name=v.Name.."_"..count
end
end
end
end)

local particlefolderclone=scriptfolder:FindFirstChild("EulogyAssets"):Clone()
local CloneOrb=Orb:Clone()
CloneOrb.Name="Orb1"
CloneOrb.Parent=Model
EquinoxCloneBars()
PosRoot(0)
particlefolderclone.Parent=HumanoidRoot
tspawn(function()
local ff 
ff=game:GetService("RunService").PostSimulation:Connect(function()
if Mode~="Layers" then
tspawn(function()
pcall(function()
for _=0,15 do
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetChildren()) do
if v:IsA("ScreenGui") then
v.Enabled=GuiVisible
end
--swait(.01)
end
end
end)
end)
gr1:Destroy()
gr2:Destroy()
stk:Destroy()
att1:Destroy()
att2:Destroy()
bbg2:Destroy()
for _,v in torso:GetChildren() do 
if v:IsA("Attachment") and v.Name=="ParticleAttachmets" then 
v:Destroy()
end
end
for _,v1 in leftarm:GetChildren() do 
if v1:IsA("Attachment") and v1.Name~="TitleAttachment" then 
v1:Destroy()
end
end
for _,v2 in leftleg:GetChildren() do 
if v2:IsA("Attachment") and v2.Name~="TitleAttachment" then 
v2:Destroy()
end
end
for _,v3 in rightleg:GetChildren() do 
if v3:IsA("Attachment") and v3.Name~="TitleAttachment" then 
v3:Destroy()
end
end
for _,v4 in head:GetChildren() do 
if v4:IsA("Attachment") and v4.Name~="TitleAttachment" then 
v4:Destroy()
end
end
for _,v5 in rootpart1:GetChildren() do 
if v5:IsA("Attachment") and v5.Name~="TitleAttachment" then 
v5:Destroy()
end
end
for _,v6 in rootpart:GetChildren() do 
if v6:IsA("Attachment") and v6.Name~="TitleAttachment" then 
v6:Destroy()
end
end
charge1att:Destroy()
EquinoxFolder:Destroy()
pcall(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
pcall(function()
for _,v in ipairs(basgui.Frame:GetChildren()) do
if v:IsA("ScreenGui") then
v.Enabled=true
end
swait(.01)
end
end)
EquinoxFolder:Destroy()
ff:Disconnect()
PosRoot(0)
end
PosRoot(1,true)


Light.Brightness=5+sound.PlaybackLoudness/250
Light.Range=2+sound.PlaybackLoudness/25



local char=game.Players.LocalPlayer.Character
if char:FindFirstChild("VoidLordSword") then 
--TweenFunction(Orb,0,"pos",v3(char["VoidLordSword"].Handle.Position.X,char["VoidLordSword"].Handle.Position.Y,char["VoidLordSword"].Handle.Position.Z)):Play()
Orb.CFrame=char["VoidLordSword"].Handle.CFrame
end

if char:FindFirstChild("RainbowGodSword") then 
--TweenFunction(CloneOrb,0,"pos",v3(char["RainbowGodSword"].Handle.Position.X,char["RainbowGodSword"].Handle.Position.Y,char["RainbowGodSword"].Handle.Position.Z)):Play()
CloneOrb.CFrame=char["RainbowGodSword"].Handle.CFrame
end


local Floor=Floor
local rootpart1=rootpart1
if Floor then 
Floor.Anchored=true
TweenFunction(Floor,.1,"pos",v3(rootpart1.Position.X,rootpart1.Position.Y,rootpart1.Position.Z)):Play()
end

if not torso:FindFirstChild("ParticleAttachmets") and Mode=="Layers" then 
charge1att:Clone().Parent=torso
end
if not rootpart1:FindFirstChild("White Pulse")  and not rootpart1:FindFirstChild("Black Pulse") and Mode=="Layers"then 
att1:Clone().Parent=rootpart1
att2:Clone().Parent=rootpart1
end

end)
end)
end





local EquiDouble=0
function EquinoxBeats(start,dur,current)
if not Running then return end
if current >= start and current <= dur and Mode=="Layers" then
if not Debounce then
Debounce= true
tspawn(function() 
local Count=0
local BeatInterval=0.3
while current <= dur and Mode=="Layers" and current>=start do
if Mode~="Layers" then break end
--ws.CurrentCamera.CFrame=cf(mrandom(-5,5), mrandom(-5,5),mrandom(-5,5))
local TParticles=torso:FindFirstChild("ParticleAttachmets")
local RParticles=rootpart1
EquiDouble+=1
tspawn(function()
for _,v in TParticles:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v:Emit(v:GetAttribute("EmitCount"))
end
end
if EquiDouble==5 then
for _=0,1 do
for _,v in RParticles:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v:Emit(v:GetAttribute("EmitCount"))
end
end
wait(.15)
EquiDouble=0
end
else
for _,v in RParticles:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v:Emit(v:GetAttribute("EmitCount"))
end
end
end
end)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-1,1),0+random(-.5,.5),1+random(-1,1)), angles(rad(1+random(-1,1)),rad(1+random(-1,1)),rad(1+random(-1,1)))),.35)
pcall(function()
local Orb=scriptfolder["EulogyAssets"]["Orbs Model"].Orb.Emit
local Orb1=scriptfolder["EulogyAssets"]["Orbs Model"].Orb1.Emit
for _,x in Orb:GetChildren() do 
if x:IsA("ParticleEmitter") then 
x:Emit(x:GetAttribute("EmitCount"))
end
end
for _,x1 in Orb1:GetChildren() do 
if x1:IsA("ParticleEmitter") then 
x1:Emit(x1:GetAttribute("EmitCount"))
end
end
end)


pcall(function()
EquinoxTexts()
EquinoxMainBars()
end)
local waitTime=math.min(BeatInterval, dur - current)
if waitTime > 0 then
oswait(waitTime)

PosRoot(1)
current=MusicPlayer.TimePosition
else
break
end
end
camoff.Value=cf_0
Debounce=false
end)

end
end
end


local Debounce1=false
local ColorFlick=false
function EquinoxBobbing()
if not Running then return end
if Debounce1 then return end
if not Debounce1 then
Debounce1=true
if Mode=="Layers" then
tspawn(function()
while wait() do
if Mode~="Layers" then
break
end



bilguit.StudsOffset=v3(0,2,0)
bilguit.StudsOffsetWorldSpace=v3(0,5,0)
bilguit.Size=u2(20.5,0,4.5,0)
bilguit.Brightness=100
ColorFlick=not ColorFlick 
local rand=mrandom(1,2)
tspawn(function()
if ColorFlick then
for _,v in modet:GetChildren() do 
if v:IsA("UIGradient") and Mode=="Layers" then
for i=1,255,25.5 do
if Mode~="Layers" then  break end 
v.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(.45,rgb(i,i,i)),
  csk(.55,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i))
})
ChangeAndRecolor("Layers",true,Font.new([[rbxassetid://12187376739]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255-i,255-i,255-i),rgb(i,i,i),false,false,nil,nil,true)
swait()
end
end
end 
else
for _,v in modet:GetChildren() do 
if v:IsA("UIGradient") and Mode=="Layers" then 
for i=1,255,25.5 do
if Mode~="Layers" then  break end
v.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(.45,rgb(255-i,255-i,255-i)),
  csk(.55,rgb(i,i,i)),
  csk(1,rgb(i,i,i))
})
ChangeAndRecolor("Layers",true,Font.new([[rbxassetid://12187376739]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(i,i,i),rgb(255-i,255-i,255-i),false,false,nil,nil,true)
swait()
end
end
end
end
end)



tspawn(function()
if ColorFlick then
for i=0,255,25.5 do
if Mode~="Layers" then  break end 
pcall(function()
local orb1=scriptfolder.EulogyAssets["Orbs Model"].Orb
local orb2=scriptfolder.EulogyAssets["Orbs Model"].Orb1
for _,C1 in orb2:GetDescendants() do 
if c1:IsA("ParticleEmitter")  and c1.Name~="Star"then 
c1.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
for _,c2 in orb1:GetDescendants() do 
if  c2:IsA("ParticleEmitter") and c2.Name~="Star"then 
c2.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})
end
end
for _,c3 in orb2:GetDescendants() do 
if  c3:IsA("ParticleEmitter") and c3.Name=="Star"then 
c3.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})
end
end
for _,c4 in orb2:GetDescendants() do 
if  c4:IsA("Trail") then 
c4.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})
end
end
for _,c5 in orb1:GetDescendants() do 
if  c5:IsA("ParticleEmitter")  and c5.Name=="Star"then 
c5.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
for _,c6 in orb1:GetDescendants() do 
if  c6:IsA("Trail")then 
c6.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
end)


pcall(function()
local floor=scriptfolder.EulogyAssets["Orbs Model"]["Floor"]
for _,c in floor:GetDescendants() do 
if c:IsA("ParticleEmitter") and c.Name~="logo" and c.Name~="logoreach" then 
c.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})

end
end
end)


pcall(function()
local floor=scriptfolder.EulogyAssets["Orbs Model"]["Floor"]
for _,f in floor:GetDescendants() do 
if f:IsA("ParticleEmitter") and f.Name=="logo" or f.Name=="logoreach" then 
f.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})

end
end
end)
swait()
end
else
for i=0,255,25.5 do
if Mode~="Layers" then  break end
pcall(function()
local floor=scriptfolder.EulogyAssets["Orbs Model"]["Floor"]
for _,c in floor:GetDescendants() do 
if c:IsA("ParticleEmitter") and c.Name~="logo" and c.Name~="logoreach" then 
c.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
end)


pcall(function()
local floor=scriptfolder.EulogyAssets["Orbs Model"]["Floor"]
for _,f in floor:GetDescendants() do 
if f:IsA("ParticleEmitter") and f.Name=="logo" or f.Name=="logoreach" then 
f.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})

end
end
end)


pcall(function()
local orb1=scriptfolder.EulogyAssets["Orbs Model"].Orb
local orb2=scriptfolder.EulogyAssets["Orbs Model"].Orb1
for _,c in orb2:GetDescendants() do 
if  c:IsA("ParticleEmitter")  and c.Name~="Star"then 
c.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})
end
end
for _,c1 in orb1:GetDescendants() do 
if  c1:IsA("ParticleEmitter") and c1.Name~="Star"then 
c1.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
for _,c2 in orb2:GetDescendants() do 
if c2:IsA("ParticleEmitter") and c2.Name=="Star"then 
c2.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
for _,c3 in orb2:GetDescendants() do 
if c3:IsA("Trail") then 
c3.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})
end
end
for _,c4 in orb1:GetDescendants() do 
if c4:IsA("ParticleEmitter")  and c4.Name=="Star"then 
c4.Color=cs({
  csk(0,rgb(i,i,i)),
  csk(1,rgb(i,i,i)),
})
end
end
for _,c5 in orb1:GetDescendants() do 
if c5:IsA("Trail")then 
c5.Color=cs({
  csk(0,rgb(255-i,255-i,255-i)),
  csk(1,rgb(255-i,255-i,255-i)),
})
end
end
end)
swait()
end
end
end)






if Debounce1 then
if Debounce then
local Tween=TweenFunction(bilguit,.275,"size",u2(20,0,4,0))
local Tween1=TweenFunction(bilguit,.275,"brightness",5)
pcall(function()
tspawn(function()

for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=false
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=false
end
--swait(.01)
end
end)
end)
Tween:Play()
Tween1:Play()
Tween.Completed:Connect(function()
Debounce1=false
end)
else
tspawn(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
local Tween=TweenFunction(bilguit,.5,"size",u2(20,0,4,0))
local Tween1=TweenFunction(bilguit,.5,"brightness",5)
Tween:Play()
Tween1:Play()
Tween.Completed:Connect(function()
Debounce1=false
end)
end
break
end
end
end)

end




end
end

















function AuxnoAssets()
if not Running then return end
if scriptfolder:FindFirstChild("AuxnoAssets") then return end

local Asset={
container=i("Model"),
part=i("Part"),
part1=i("Part"),
hydrosun=i("Part"),
sunatt=i("Attachment"),
partatt=i("Attachment"),

--welds
partweld=i("Weld"),

--particles
wave=i("ParticleEmitter"),
wave1=i("ParticleEmitter"),
wave2=i("ParticleEmitter"),
bubbles=i("ParticleEmitter"),
floorbubbles=i("ParticleEmitter"),
swirlbubbles=i("ParticleEmitter"),
wind=i("ParticleEmitter"),

sunouter=i("ParticleEmitter"),
suninter=i("ParticleEmitter"),
sunintershadow=i("ParticleEmitter"),
star=i("ParticleEmitter"),
ring=i("ParticleEmitter"),
ringaura=i("ParticleEmitter"),
light=i("PointLight"),
}



local container=Asset.container
local part=Asset.part
local part1=Asset.part1
local hydrosun=Asset.hydrosun
local partatt=Asset.partatt
local sunatt=Asset.sunatt
local partweld=Asset.partweld
local light=Asset.light

local wave=Asset.wave
local wave1=Asset.wave1
local wave2=Asset.wave2
local bubbles=Asset.bubbles
local floorbubbles=Asset.floorbubbles
local swirlbubbles=Asset.swirlbubbles
local wind=Asset.wind

local sunouter=Asset.sunouter
local suninter=Asset.suninter
local sunintershadow=Asset.sunintershadow
local star=Asset.star
local ring=Asset.ring
local ringaura=Asset.ringaura
insSet(container,"Parent",scriptfolder)
insSet(light,"Parent",part)
insSet(container,"Name","AuxnoAssets")
insSet(sunatt,"Parent",hydrosun)
insSet(hydrosun,"Name","Star")
container:SetAttribute("VFX",true)
insSet(wind,"Color",cs({csk(0,c3(1,1,1)),csk(1,c3(1,1,1))}));insSet(wind,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(wind,"Size",ns({nsk(0,0),nsk(.1,14.8),nsk(.3,28.8),nsk(.5,32.7),nsk(1,36.4),}));insSet(wind,"Texture","rbxassetid://14850595833");insSet(wind,"Transparency",ns({nsk(0,.2),nsk(1,1)}));insSet(wind,"Lifetime",nr(1,1));insSet(wind,"Rate",150);insSet(wind,"Rotation",nr(0,0));insSet(wind,"RotSpeed",nr(.002,.002));insSet(wind,"SpreadAngle",v2(15,15));insSet(wind,"VelocitySpread",15);insSet(wind,"FlipbookLayout",e.ParticleFlipbookLayout.None);insSet(wind,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(wind,"Parent",partatt);insSet(wind,"FlipbookFramerate",nr(1,1))

insSet(hydrosun,"Size",v3(0,5,0));insSet(hydrosun,"Anchored",true);insSet(hydrosun,"CastShadow",false);insSet(hydrosun,"CanCollide",false);insSet(hydrosun,"CanQuery",false);insSet(hydrosun,"CanTouch",false);insSet(hydrosun,"Transparency",1);insSet(hydrosun,"Parent",container)
insSet(part,"Size",v3(60,0,60));insSet(part,"CastShadow",false);insSet(part,"Anchored",true);insSet(part,"CanCollide",false);insSet(part,"CanQuery",false);insSet(part,"CanTouch",false);insSet(part,"Transparency",1);insSet(part,"Parent",container);insSet(part,"Name","Floor1")
insSet(part1,"Size",v3(60,0,60));insSet(part1,"CastShadow",false);insSet(part1,"CanCollide",false);insSet(part1,"CanQuery",false);insSet(part1,"CanTouch",false);insSet(part1,"Transparency",1);insSet(part1,"Parent",container);insSet(part1,"Name","Floor")
insSet(partatt,"Parent",part)
insSet(partweld,"Part0",part1);insSet(partweld,"Part1",part);insSet(partweld,"Parent",part1)
--insSet(part,"Name","Floor")
insSet(wave,"Lifetime",nr(2.5));insSet(wave,"LockedToPart",true);insSet(wave,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(wave,"Rate",40);insSet(wave,"RotSpeed",nr(-45,45));insSet(wave,"Rotation",nr(-180,180));insSet(wave,"Size",ns(0,50));insSet(wave,"Speed",nr(0.01));insSet(wave,"SpreadAngle",v2(-5,5));insSet(wave,"Texture","rbxassetid://93199537512137");insSet(wave,"LightEmission",0.8);insSet(wave,"FlipbookLayout",e.ParticleFlipbookLayout.Grid8x8);insSet(wave,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(wave,"Parent",partatt)
insSet(wave1,"Lifetime",nr(2));insSet(wave1,"LockedToPart",true);insSet(wave1,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(wave1,"Rate",25);insSet(wave1,"RotSpeed",nr(-45,45));insSet(wave1,"Rotation",nr(-180,180));insSet(wave1,"Size",ns(0,50));insSet(wave1,"Speed",nr(1));insSet(wave1,"SpreadAngle",v2(-5,5));insSet(wave1,"Texture","rbxassetid://82834813363987");insSet(wave1,"Transparency",ns(0,1));insSet(wave1,"LightEmission",0.85);insSet(wave1,"Parent",partatt);insSet(wave1,"Brightness",0)
insSet(wave2,"Lifetime",nr(2));insSet(wave2,"LockedToPart",true);insSet(wave2,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(wave2,"Rate",15);insSet(wave2,"RotSpeed",nr(-45,45));insSet(wave2,"Rotation",nr(-180,180));insSet(wave2,"Size",ns(0,50));insSet(wave2,"Speed",nr(1.4));insSet(wave2,"SpreadAngle",v2(-5,5));insSet(wave2,"Texture","rbxassetid://14039691837");insSet(wave2,"Transparency",ns(0,1));insSet(wave2,"LightEmission",0.6);insSet(wave2,"FlipbookLayout",e.ParticleFlipbookLayout.Grid4x4);insSet(wave2,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(wave2,"Parent",partatt)
insSet(bubbles,"Lifetime",nr(1.1));insSet(bubbles,"Rate",100);insSet(bubbles,"RotSpeed",nr(-45,45));insSet(bubbles,"Rotation",nr(-180,180));insSet(bubbles,"Size",ns(10,5));insSet(bubbles,"Speed",nr(10,30));insSet(bubbles,"SpreadAngle",v2(-20,20));insSet(bubbles,"Texture","rbxassetid://122363824119820");insSet(bubbles,"Transparency",ns({nsk(0,1,0),nsk(0.3333333432674408,0,0),nsk(0.6666666865348816,0,0),nsk(1,1,0)}));insSet(bubbles,"LightEmission",0.6);insSet(bubbles,"Shape",e.ParticleEmitterShape.Disc);insSet(bubbles,"ShapePartial",0.75);insSet(bubbles,"FlipbookLayout",e.ParticleFlipbookLayout.Grid2x2);insSet(bubbles,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(bubbles,"Parent",part);insSet(bubbles,"Enabled",false)
insSet(floorbubbles,"Lifetime",nr(1.100000023841858));insSet(floorbubbles,"Rate",50);insSet(floorbubbles,"RotSpeed",nr(-45,45));insSet(floorbubbles,"Rotation",nr(-45,45));insSet(floorbubbles,"Size",ns(3,0));insSet(floorbubbles,"Speed",nr(10,30));insSet(floorbubbles,"SpreadAngle",v2(-20,20));insSet(floorbubbles,"Texture","rbxassetid://9295449811");insSet(floorbubbles,"Transparency",ns(0.5,0));insSet(floorbubbles,"Acceleration",v3(0,40,0));insSet(floorbubbles,"LightEmission",1);insSet(floorbubbles,"Shape",e.ParticleEmitterShape.Sphere);insSet(floorbubbles,"ShapePartial",1);insSet(floorbubbles,"FlipbookLayout",e.ParticleFlipbookLayout.Grid4x4);insSet(floorbubbles,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(floorbubbles,"Parent",part)
insSet(swirlbubbles,"Lifetime",nr(1));insSet(swirlbubbles,"LockedToPart",true);insSet(swirlbubbles,"Rate",100);insSet(swirlbubbles,"RotSpeed",nr(-90,90));insSet(swirlbubbles,"Rotation",nr(-180,180));insSet(swirlbubbles,"Size",ns(10,5));insSet(swirlbubbles,"Speed",nr(0,3.75));insSet(swirlbubbles,"Texture","rbxassetid://122363824119820");insSet(swirlbubbles,"Transparency",ns({nsk(0,1,0),nsk(0.5,0,0),nsk(1,1,0)}));insSet(swirlbubbles,"LightEmission",1);insSet(swirlbubbles,"Shape",e.ParticleEmitterShape.Disc);insSet(swirlbubbles,"ShapePartial",0.75);insSet(swirlbubbles,"FlipbookLayout",e.ParticleFlipbookLayout.Grid2x2);insSet(swirlbubbles,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(swirlbubbles,"Parent",part1)

insSet(sunouter,"Lifetime",nr(0.75));insSet(sunouter,"LockedToPart",true);insSet(sunouter,"Rate",20);insSet(sunouter,"Rotation",nr(-180,180));insSet(sunouter,"Size",ns(6.25,25));insSet(sunouter,"Speed",nr(0));insSet(sunouter,"Texture","http://www.roblox.com/asset/?id=9573351641");insSet(sunouter,"Transparency",ns({nsk(0,1,0),nsk(0.5,0.5,0),nsk(1,1,0)}));insSet(sunouter,"LightEmission",0.75);insSet(sunouter,"Parent",sunatt)
insSet(suninter,"Lifetime",nr(1));insSet(suninter,"LockedToPart",true);insSet(suninter,"Rate",20);insSet(suninter,"Rotation",nr(-180,180));insSet(suninter,"Size",ns(12.5));insSet(suninter,"Speed",nr(0));insSet(suninter,"Texture","http://www.roblox.com/asset/?id=94357709098905");insSet(suninter,"Transparency",ns({nsk(0,1),nsk(0.5,0),nsk(1,1)}));insSet(suninter,"ZOffset",-0.1);insSet(suninter,"LightEmission",0.5);insSet(suninter,"Parent",sunatt);insSet(suninter,"Enabled",false)
insSet(sunintershadow,"Lifetime",nr(1.5));insSet(sunintershadow,"LockedToPart",true);insSet(sunintershadow,"Rate",100);insSet(sunintershadow,"Rotation",nr(-180,180));insSet(sunintershadow,"Size",ns(0,13.5));insSet(sunintershadow,"Speed",nr(0));insSet(sunintershadow,"Texture","http://www.roblox.com/asset/?id=14050610023");insSet(sunintershadow,"Transparency",ns(0,1));insSet(sunintershadow,"ZOffset",-0.2);insSet(sunintershadow,"LightEmission",0.5);insSet(sunintershadow,"Parent",sunatt)
insSet(star,"Lifetime",nr(1));insSet(star,"LockedToPart",true);insSet(star,"Rate",30);insSet(star,"RotSpeed",nr(-2.5,2.5));insSet(star,"Rotation",nr(45));insSet(star,"Size",ns(0,30));insSet(star,"Speed",nr(0));insSet(star,"Texture","rbxassetid://117212070519461");insSet(star,"Transparency",ns(0,1));insSet(star,"LightEmission",1);insSet(star,"Parent",sunatt)
insSet(ring,"Enabled",false);insSet(ring,"Lifetime",nr(10));insSet(ring,"LockedToPart",true);insSet(ring,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(ring,"Size",ns(25));insSet(ring,"Speed",nr(0.01));insSet(ring,"Texture","rbxassetid://92571909112286");insSet(ring,"Transparency",ns(0,1));insSet(ring,"LightEmission",0.825);insSet(ring,"Parent",sunatt)
insSet(ringaura,"Lifetime",nr(1));insSet(ringaura,"LockedToPart",true);insSet(ringaura,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(ringaura,"Rate",50);insSet(ringaura,"RotSpeed",nr(-90,90));insSet(ringaura,"Rotation",nr(-180,180));insSet(ringaura,"Size",ns(30));insSet(ringaura,"Speed",nr(0.01));insSet(ringaura,"SpreadAngle",v2(-5,5));insSet(ringaura,"Texture","rbxassetid://101676539465182");insSet(ringaura,"Transparency",ns({nsk(0,1,0),nsk(0.5,0.75,0),nsk(1,1,0)}));insSet(ringaura,"LightEmission",1);insSet(ringaura,"Parent",hydrosun)
scriptfolder:FindFirstChild("AuxnoAssets"):SetAttribute("VFX",true)
insSet(hydrosun,"Position",v3(0,-100,0))
insSet(part,"Position",v3(0,-100,0))
insSet(part1,"Position",v3(0,-100,0))
local b 
local up=1
b=PostSimulation:Connect(function()
if Mode~="Iviriza" then 
if scriptfolder:FindFirstChild("AuxnoAssets") then
scriptfolder.AuxnoAssets:Destroy()
end
b:Disconnect()
PosRoot(0)
end
up+=1
PosRoot(1)
pcall(function()
local model=container
if model then
local floor=model:FindFirstChild("Floor")
local floor1=model:FindFirstChild("Floor1")
local star=model:FindFirstChild("Star")
local root=rootpart1
TweenFunction(floor,.1,"pos",v3(root.Position.X,root.Position.Y-1,root.Position.Z)):Play()
TweenFunction(floor1,.1,"pos",v3(root.Position.X,root.Position.Y-1,root.Position.Z)):Play()
TweenFunction(star,.1,"pos",v3(root.Position.X+5-5*sin(up/100),root.Position.Y+30,root.Position.Z+5+10*sin(up/50))):Play()
floor.Rotation=v3(0,up+sound.PlaybackLoudness/450,0)
floor1.Rotation=v3(0,up+sound.PlaybackLoudness/450,0)
star.Rotation=v3(0+2.5*sin(up/20),up+sound.PlaybackLoudness/1000,0+5.5*sin(up/100))
end
end)
end)
end




function NULLVOIDAssets()
if not Running then return end
if scriptfolder:FindFirstChild("NULLVOIDAssets") then return end
local t={
container=i("Model"),
part=i("Part"),
part1=i("Part"),
partatt=i("Attachment"),
light=i("PointLight"),

--weld
weld=i("Weld"),

--particles
groundaura=i("ParticleEmitter"),
groundaura1=i("ParticleEmitter"),
groundaura2=i("ParticleEmitter"),
groundaura3=i("ParticleEmitter"),
groundaura4=i("ParticleEmitter"),
smoke=i("ParticleEmitter"),
slashes=i("ParticleEmitter"),
sparkles=i("ParticleEmitter"),
starsparkles=i("ParticleEmitter")
}

local container=t.container
local part=t.part
local part1=t.part1
local partatt=t.partatt
local weld=t.weld

local groundaura=t.groundaura
local groundaura1=t.groundaura1
local groundaura2=t.groundaura2
local groundaura3=t.groundaura3
local groundaura4=t.groundaura4
local smoke=t.smoke
local slashes=t.slashes
local sparkles=t.sparkles
local starsparkles=t.starsparkles
local light=t.light
container:SetAttribute("VFX",true)
insSet(light,"Parent",part1)
insSet(container,"Name","NULLVOIDAssets")
insSet(container,"Parent",scriptfolder)
insSet(part,"Size",v3(65,0,65));insSet(part,"CastShadow",false);insSet(part,"Anchored",true);insSet(part,"CanCollide",false);insSet(part,"CanQuery",false);insSet(part,"CanTouch",false);insSet(part,"Transparency",1);insSet(part,"Parent",container);insSet(part,"Name","Floor")
insSet(part1,"Size",v3(70,0,70));insSet(part1,"CastShadow",false);insSet(part1,"CanCollide",false);insSet(part1,"CanQuery",false);insSet(part1,"CanTouch",false);insSet(part1,"Transparency",1);insSet(part1,"Parent",container);insSet(part1,"Name","Floor2")
insSet(partatt,"Parent",part)
insSet(weld,"Part0",part1);insSet(weld,"Part1",part);insSet(weld,"Parent",part1)

insSet(groundaura,"Lifetime",nr(1));insSet(groundaura,"LockedToPart",true);insSet(groundaura,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(groundaura,"Rate",6);insSet(groundaura,"RotSpeed",nr(-90));insSet(groundaura,"Rotation",nr(-180,180));insSet(groundaura,"Size",ns(35));insSet(groundaura,"Speed",nr(0.01));insSet(groundaura,"Texture","rbxassetid://98586210209416");insSet(groundaura,"Transparency",ns({nsk(0,1,0),nsk(0.5,0,0),nsk(1,1,0)}));insSet(groundaura,"ZOffset",0.01);insSet(groundaura,"LightEmission",1);insSet(groundaura,"Parent",partatt);insSet(groundaura,"Brightness",0)
insSet(groundaura1,"Lifetime",nr(2));insSet(groundaura1,"LockedToPart",true);insSet(groundaura1,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(groundaura1,"Rate",20);insSet(groundaura1,"RotSpeed",nr(-90));insSet(groundaura1,"Rotation",nr(-180,180));insSet(groundaura1,"Size",ns(75,0));insSet(groundaura1,"Speed",nr(0.01));insSet(groundaura1,"Texture","rbxassetid://82834813363987");insSet(groundaura1,"Transparency",ns({nsk(0,1,0),nsk(0.5,0,0),nsk(1,1,0)}));insSet(groundaura1,"LightEmission",0.56);insSet(groundaura1,"Parent",partatt);insSet(groundaura1,"Brightness",0)
insSet(groundaura2,"Lifetime",nr(1.5,2));insSet(groundaura2,"LockedToPart",true);insSet(groundaura2,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(groundaura2,"Rate",17);insSet(groundaura2,"RotSpeed",nr(-90));insSet(groundaura2,"Rotation",nr(-180,180));insSet(groundaura2,"Size",ns(0,65));insSet(groundaura2,"Speed",nr(0.01));insSet(groundaura2,"Texture","rbxassetid://12350056117");insSet(groundaura2,"Transparency",ns(0.5,1));insSet(groundaura2,"ZOffset",0.01);insSet(groundaura2,"LightEmission",0.56);insSet(groundaura2,"FlipbookLayout",e.ParticleFlipbookLayout.Grid4x4);insSet(groundaura2,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(groundaura2,"Parent",partatt);insSet(groundaura2,"Brightness",0)
insSet(groundaura3,"Lifetime",nr(1,1.5));insSet(groundaura3,"LockedToPart",true);insSet(groundaura3,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(groundaura3,"Rate",25);insSet(groundaura3,"Rotation",nr(-180,180));insSet(groundaura3,"Size",ns(0,70));insSet(groundaura3,"Speed",nr(0.01));insSet(groundaura3,"Texture","rbxassetid://6479253935");insSet(groundaura3,"Transparency",ns(0,1));insSet(groundaura3,"ZOffset",0.01);insSet(groundaura3,"LightEmission",0.56);insSet(groundaura3,"Parent",partatt);insSet(groundaura3,"Brightness",0)
insSet(groundaura4,"Lifetime",nr(1));insSet(groundaura4,"LockedToPart",true);insSet(groundaura4,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(groundaura4,"Rate",6);insSet(groundaura4,"RotSpeed",nr(90));insSet(groundaura4,"Rotation",nr(-180,180));insSet(groundaura4,"Size",ns(35));insSet(groundaura4,"Speed",nr(0.01));insSet(groundaura4,"Texture","rbxassetid://116944613379749");insSet(groundaura4,"Transparency",ns({nsk(0,1,0),nsk(0.5,0,0),nsk(1,1,0)}));insSet(groundaura4,"ZOffset",0.01);insSet(groundaura4,"LightEmission",0.6);insSet(groundaura4,"Parent",partatt);insSet(groundaura4,"Name","Circle")
insSet(smoke,"Lifetime",nr(1.5,2));insSet(smoke,"Rate",30);insSet(smoke,"RotSpeed",nr(-45,45));insSet(smoke,"Rotation",nr(-180,180));insSet(smoke,"Size",ns(40,0));insSet(smoke,"Speed",nr(7.5,17.5));insSet(smoke,"SpreadAngle",v2(-10,10));insSet(smoke,"Texture","rbxassetid://11627083142");insSet(smoke,"Transparency",ns({nsk(0,1,0),nsk(0.5,0.65,0),nsk(1,1,0)}));insSet(smoke,"LightEmission",0.8);insSet(smoke,"Shape",e.ParticleEmitterShape.Disc);insSet(smoke,"ShapePartial",1);insSet(smoke,"FlipbookFramerate",nr(1));insSet(smoke,"FlipbookLayout",e.ParticleFlipbookLayout.Grid8x8);insSet(smoke,"FlipbookMode",e.ParticleFlipbookMode.OneShot);insSet(smoke,"Parent",part)
insSet(slashes,"Lifetime",nr(0.5,0.75));insSet(slashes,"Orientation",e.ParticleOrientation.VelocityPerpendicular);insSet(slashes,"Rate",50);insSet(slashes,"RotSpeed",nr(-720,720));insSet(slashes,"Rotation",nr(-180,180));insSet(slashes,"Size",ns(10,65));insSet(slashes,"Speed",nr(10,20));insSet(slashes,"SpreadAngle",v2(-25,25));insSet(slashes,"Texture","rbxassetid://77566265968194");insSet(slashes,"Transparency",ns({nsk(0,1,0),nsk(0.5,0,0),nsk(1,1,0)}));insSet(slashes,"LightEmission",1);insSet(slashes,"Parent",partatt);insSet(slashes,"Brightness",0)
insSet(sparkles,"Lifetime",nr(1,1.5));insSet(sparkles,"Rate",100);insSet(sparkles,"RotSpeed",nr(-360,360));insSet(sparkles,"Rotation",nr(-180,180));insSet(sparkles,"Size",ns({nsk(0,0,0),nsk(0.5,0.75,0),nsk(1,0,0)}));insSet(sparkles,"Speed",nr(30,60));insSet(sparkles,"SpreadAngle",v2(-60,60));insSet(sparkles,"Texture","http://www.roblox.com/asset/?id=3065269721");insSet(sparkles,"Transparency",ns({nsk(0,1,0),nsk(0.5,0,0),nsk(1,1,0)}));insSet(sparkles,"LightEmission",0.8);insSet(sparkles,"Shape",e.ParticleEmitterShape.Disc);insSet(sparkles,"ShapePartial",1);insSet(sparkles,"Parent",part1)
insSet(starsparkles,"Lifetime",nr(0.5));insSet(starsparkles,"Rate",100);insSet(starsparkles,"Rotation",nr(-180,180));insSet(starsparkles,"Size",ns(3,0));insSet(starsparkles,"Speed",nr(35,70));insSet(starsparkles,"SpreadAngle",v2(-30,30));insSet(starsparkles,"Texture","rbxassetid://1084970835");insSet(starsparkles,"Transparency",ns(0,1));insSet(starsparkles,"LightEmission",1);insSet(starsparkles,"Shape",e.ParticleEmitterShape.Disc);insSet(starsparkles,"ShapePartial",0.8);insSet(starsparkles,"Parent",part1)









local h 
h=rus.RenderStepped:Connect(function()
if Mode~="NULLVOID" then
if container then 
container:Destroy()
end
h:Disconnect() 
PosRoot(0)
end
PosRoot(1)
local asset=container
if asset then
pcall(function()
local floor=asset:FindFirstChild("Floor")
local Floor=asset:FindFirstChild("Floor2")
local root=rootpart1
TweenFunction(floor,.1,"pos",v3(root.Position.X,root.Position.Y-1,root.Position.Z)):Play()
TweenFunction(Floor,.1,"pos",v3(root.Position.X,root.Position.Y-1,root.Position.Z)):Play()
local t=sound.TimePosition
local lol1=random(35,75)
if t>= 221.75 and t<=257.1 or t>=260.45 and t<=293.3 then 

block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),scolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,pcolor.Value,true,15,"ForceField")
block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),pcolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,scolor.Value,true,15,"ForceField")
block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),scolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,pcolor.Value,true,15,"ForceField")
block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),pcolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,scolor.Value,true,15,"ForceField")
if t>=260.45 and t<=293.3 then
MakeUIAnimated(u2(0,20*sin(sine),0,0),u2(0,-20*sin(sine),0,0),random(-1,1),random(-1,1),true,180-2.5*cos(sine*1.5),.1)

block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),scolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,pcolor.Value,true,15,"ForceField")
block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),pcolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,scolor.Value,true,15,"ForceField")
block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),scolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,pcolor.Value,true,15,"ForceField")
block1("Out",5,v3(10,10,10),v3(30,75,30),Floor.CFrame*cf(random(-50,50),1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),pcolor.Value,0,Floor.CFrame*cf(random(-50,50),lol1,random(-50,50))*angles(random(-50,50),rad(random(-50,50)),rad(random(-50,50))),true,scolor.Value,true,15,"ForceField")
tspawn(function()
local z=random(-25,25)
local x=random(-25,25)
sphere1("Out",10,v3(.5,.5,.5),v3(50,1,1),rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
sphere1("Out",10,v3(.5,.5,.5),v3(50,1,1),rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
wave2("Out",10,5,rootpart1.CFrame*cf(z,.25,x),pcolor.Value)
wave2("Out",5,10.5,rootpart1.CFrame*cf(x,.25,z),scolor.Value)
end)
tspawn(function()
local z=random(-25,25)
local x=random(-25,25)
sphere1("Out",10,v3(.5,.5,.5),v3(50,1,1),rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
sphere1("Out",10,v3(.5,.5,.5),v3(50,1,1),rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
wave2("Out",10,5,rootpart1.CFrame*cf(z,.25,x),pcolor.Value)
wave2("Out",5,10.5,rootpart1.CFrame*cf(x,.25,z),scolor.Value)
end)
tspawn(function()
local z=random(-25,25)
local x=random(-25,25)
sphere1("Out",10,v3(.5,.5,.5),v3(50,1,1),rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
sphere1("Out",10,v3(.5,.5,.5),v3(50,1,1),rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
wave2("Out",10,5,rootpart1.CFrame*cf(z,.25,x),pcolor.Value)
wave2("Out",5,10.5,rootpart1.CFrame*cf(x,.25,z),scolor.Value)
end)
else
MakeUIAnimated(u2(0,random(-10,10),0,random(-5,5)),u2(0,random(-5,5),0,random(-5,5)),random(-5,5),random(-5,5))
end
for _,v in next,statics do
insSet(v,"Visible",true)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

insSet(v,"ImageTransparency",1-random(.050,.1))
if random(.1,2)>1 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",pcolor.Value)
end
end
else 
ReturnOldUIPos()
for _,v in next,statics do
insSet(v,"Visible",false)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

insSet(v,"ImageTransparency",1-random(.050,.1))
if random(.1,2)>1 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",pcolor.Value)
end
end
end
end)
else 
h:Disconnect() 
end





end)

end 




function Pandemonium()
if not Running then return end
if scriptfolder:FindFirstChild("PandemoniumAssets") then return end
local foldah=i("Folder",scriptfolder)
foldah.Name="PandemoniumAssets"
foldah:SetAttribute("VFX",true)


local Floor=Instance.new("Part", foldah)
Floor.Name="Floor"
Floor.Anchored=true
Floor.CanCollide=false
Floor.CanQuery=false
Floor.CanTouch=false
Floor.Transparency=1
Floor.Reflectance=0
Floor.Color=Color3.new(0,0,0)
Floor.Material=Enum.Material.Plastic
Floor.Size=Vector3.new(10,1,10)
--Floor.CFrame=CFrame.new(211.32192993164062,88.14154815673828,-367.06134033203125,0.6427632570266724,0,0.7660648822784424,0,1,0,-0.7660648822784424,0,0.6427632570266724)
--Floor.Orientation=Vector3.new(0.000000,50.001999,0.000000)
--Floor.Position=Vector3.new(211.321930,88.141548,-367.061340)
Floor.CastShadow=true
Floor.Massless=true
local lol=1
j=PostSimulation:Connect(function()
if Mode~="Pandemonium" then 
foldah:Destroy()
j:Disconnect()
end
lol+=1
local root=rootpart1
TweenFunction(Floor,.01,"pos",v3(root.Position.X,root.Position.Y-1,root.Position.Z)):Play()
Floor.Rotation=v3(0,lol*15,0)
end)


end













changeMode("Noxesium")
ChangeAndRecolor("Noxesium",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(94,24,0),rgb(204,166,154),false,false)


local IsKeys=nil
--// Keybinds and etc...
IsKeys=uis.InputBegan:Connect(function(io,gpe)
if gpe then return end
local k = string.lower(string.gsub(tostring(io.KeyCode),"Enum.KeyCode.",""))
if k=="one" and Mode~="Iviriza"then
changeMode("Iviriza")
ChangeAndRecolor("Iviriza",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(145,203,253),rgb(1,58,107),false,false)
AuxnoAssets()
elseif k=="two" and Mode~="NULLVOID" then
changeMode("NULLVOID")
ChangeAndRecolor("NULLVOID",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(0,0,0),false,false)
NULLVOIDAssets()
elseif k=="three" and Mode~="Mayhem" then
changeMode("Mayhem")
ChangeAndRecolor("Mayhem",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(224,0,0),false,false)
VFXApi("Mayhem")

elseif k=="four" and Mode~="Gaia" then
changeMode("Gaia")
ChangeAndRecolor("Gaia",true,Font.fromId(12187376545,e.FontWeight.Heavy,e.FontStyle.Italic),rgb(25,219,255),rgb(36,183,255),false,false)
VFXApi("Gaia")
elseif k=="five" and Mode~="Chromatic" then
changeMode("Chromatic")
ChangeAndRecolor("Chromatic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(0,0,0),true)
VFXApi("Chromatic",1)


elseif k=="six" and Mode~="Pandemonium" then
changeMode("Pandemonium")
ChangeAndRecolor("Pandemonium",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),rgb(0,0,0),rgb(0,0,0),false,false)
--VFXApi("Overseer",1)
Pandemonium()
--[[elseif k=="seven" and Mode~="Aegleseeker" then
changeMode("Aegleseeker")
ChangeAndRecolor("Aegleseeker",false,"Code",rgb(197,135,243),rgb(237,212,255),false,false)
VFXApi("Aegleseeker")]]

elseif k=="eight" and Mode~="Layers" then
changeMode("Layers")
ChangeAndRecolor("Layers",true,Font.new([[rbxassetid://12187376739]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(0,0,0),false,false,nil,nil,true)
EulogyAssets()



elseif k=="nine" and Mode~="Anarchus" then
changeMode("Anarchus")
ChangeAndRecolor("Anarchus",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,100),rgb(0,0,200),false,false)
VFXApi("Anarchus",1)
elseif k=="zero" and Mode~="Axius" then
changeMode("Axius")
ChangeAndRecolor("Axius",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,100),rgb(0,0,200),false,false)
VFXApi("Axius")

elseif k=="f" then
BBGVisibilty=not BBGVisibilty
if BBGVisibilty then
modet.Visible=BBGVisibilty
else
modet.Visible=BBGVisibilty
end

elseif k=="g" then
GuiVisible=not GuiVisible
if GuiVisible then
pcall(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
pcall(function()
for _,v in ipairs(basgui.Frame:GetChildren()) do
if v:IsA("ScreenGui") then
v.Enabled=GuiVisible
end
end
end)
else
pcall(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
pcall(function()
for _,v in ipairs(basgui.Frame:GetChildren()) do
if v:IsA("ScreenGui") then
v.Enabled=GuiVisible
end
end
end)
end

elseif k=="m" and Mode=="Mayhem" then
changeMode("Scourge")
ChangeAndRecolor("Scourge",true,Font.new([[rbxassetid://12187376739]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(220,0,0),rgb(100,0,0),false,false)
VFXApi("Scourge")
elseif k=="m" and Mode=="NULLVOID" then
changeMode("Vibrance")
ChangeAndRecolor("Vibrance",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(180,215,255),rgb(0,118,253),false,false)
VFXApi("Vibrance",1,true)
elseif k=="m" and Mode=="Chromatic" then
changeMode("Censored")
ChangeAndRecolor("Censored",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(61,255,77),false,false)
VFXApi("Censored",1)
elseif k=="m" and Mode=="Iviriza" then
changeMode("Noxesium")
ChangeAndRecolor("Noxesium",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(94,24,0),rgb(204,166,154),false,false)

elseif k=="m" and Mode=="Overseer" then
changeMode("Vanguard")
ChangeAndRecolor("Vanguard",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(254,255,184),rgb(255,255,254), false,false)
VFXApi("Vanguard",1,true)
elseif k=="seven" and Mode~="Nholiviction" then
changeMode("Nholiviction")
ChangeAndRecolor("Nholiviction",false,"Antique",rgb(0,0,0),rgb(90,19,0),false,false)
VFXApi("Nholiviction")

elseif k=="n" and Mode=="Mayhem" then
changeMode("Pyroplex")
ChangeAndRecolor("Pyroplex",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),c3(),rgb(193,83,0),false,false)
VFXApi("Pyroplex")
elseif k=="m" and Mode=="Layers" then
changeMode("Fatal")
ChangeAndRecolor("Fatal",true,Font.new("rbxasset://fonts/families/Michroma.json", e.FontWeight.Bold, Enum.FontStyle.Normal),c3(),c3(),false,false)
VFXApi("Fatal")
elseif k=="m" and Mode=="Nholiviction" then
changeMode("Cascade")
ChangeAndRecolor("Cascade",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,0,0),false)
--VFXApi("Fatal")
elseif k=="m" and Mode=="Anarchus" then
changeMode("Sentinel")
ChangeAndRecolor("Sentinel",true,Font.new([[rbxasset://fonts/families/Fondamento.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),c3(1,1,1),rgb(5,0,129),false,false)
elseif k=="n" and Mode=="Chromatic" then
changeMode("Cheatreal")
TypeWrite("It Only Gets Crazier From Now On",.055,true,Font.new([[rbxasset://fonts/families/HighwayGothic.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),c3(1,1,1),nil,nil,false,.055,15,19)
ChangeAndRecolor("Cheatreal",true,Font.new([[rbxasset://fonts/families/HighwayGothic.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),c3(1,1,1),c3(1,1,1),true,false)
VFXApi("Cheatreal")
elseif k=="n" and Mode=="Cheatreal" then
changeMode("HYPERINTERVENTIC")
TypeWrite("i Cant Handle This Anymore...",.055,true,Font.new([[rbxasset://fonts/families/HighwayGothic.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),c3(1,1,1),nil,nil,false,.055,15,19)
ChangeAndRecolor("HYPERINTERVENTIC",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),c3(1,1,1),c3(1,1,1),true,true,1,.25)
VFXApi("HYPERINTERVENTIC")
elseif k=="n" and Mode=="Nebulabrasque" then
changeMode("Dimension")
ChangeAndRecolor("Dimension",false,"SciFi",rgb(0,0,0),rgb(6,65,107),false,false)
VFXApi("Dimension")
elseif k=="n" and Mode=="NULLVOID" then
changeMode("Nebulabrasque")
ChangeAndRecolor("Nebulabrasque",true,Font.fromId(12187360881, e.FontWeight.Bold, Enum.FontStyle.Normal),c3(0,0,0),rgb(0,0,0),false,false)
VFXApi("Nebulabrasque")
elseif k=="n" and Mode=="Anarchus" then
changeMode("Imperial")
ChangeAndRecolor("Imperial",true,Font.fromId(12187376739, e.FontWeight.Bold, Enum.FontStyle.Normal),rgb(130,253,255),rgb(174,231,232),false,false)
--VFXApi("Nebulabrasque")
elseif k=="n" and Mode=="Vibrance" then
changeMode("Tachyon")
ChangeAndRecolor("Tachyon",false,"Code",rgb(0,0,255),rgb(255,0,0),false,false)
VFXApi("Tachyon")
elseif k=="n" and Mode=="Iviriza" then
changeMode("Serenity")
ChangeAndRecolor("Serenity",false,"SciFi",c3(1,1,1),rgb(0,0,0),false,false)
--VFXApi("Tachyon")
elseif k=="b" and Mode=="Mayhem" then
changeMode("Torment")
ChangeAndRecolor("Torment",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),c3(),rgb(0,0,0),false,false)
VFXApi("Torment")
elseif k=="b" and Mode=="Chromatic" then
changeMode("Lexapriatic")
ChangeAndRecolor("Lexapriatic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),c3(),rgb(0,0,0),false,false)
VFXApi("Lexapriatic")
elseif k=="r" and Mode=="Chromatic" then
changeMode("Parallax")
ChangeAndRecolor("Parallax",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(0,0,0),true)
VFXApi("Parallax")
elseif k=="m" and Mode=="Censored" then
changeMode("Restless")
ChangeAndRecolor("Restless",true,Font.fromId(12187368843, Enum.FontWeight.Regular, Enum.FontStyle.Normal),rgb(0,139,25),rgb(90,248,3),false,false)
elseif k=="m" and Mode=="Lexapriatic" then
changeMode("Horion")
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),c3(),rgb(0,0,0),false,false)
VFXApi("Horion")
elseif k=="n" and Mode=="Nholiviction" then
changeMode("Zionihilic")
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),c3(),rgb(0,0,0),false,false)
VFXApi("Zionihilic")

elseif k=="r" and Mode=="Anarchus" then
if AnimStyles==0 then 
AnimStyles=1

elseif AnimStyles==1 then 
AnimStyles=0
end
elseif k=="r" and Mode=="Mayhem" then
if AnimStyles==0 then 
AnimStyles=1

elseif AnimStyles==1 then 
AnimStyles=0
end
end
end)









--// Misc Function, either for debugging
game.Players.LocalPlayer.Chatted:Connect(function(m)
if m:sub(1,6)==".mode/"then
changeMode(m:sub(7))
if m:sub(7)=="Iviriza" then 
AuxnoAssets()
elseif m:sub(7)=="NULLVOID" then 
NULLVOIDAssets()
elseif m:sub(7)=="Censored" then 
VFXApi("Censored",1)
elseif m:sub(7)=="Vibrance" then
VFXApi("Vibrance",1,true)
ChangeAndRecolor("Vibrance",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(180,215,255),rgb(0,118,253),false,false)
elseif m:sub(7)=="Mayhem" then 
VFXApi("Mayhem",1)
ChangeAndRecolor("Mayhem",false,"Antique",rgb(0,0,0),rgb(224,0,0),false,false)
elseif m:sub(7)=="Layers" then 
EulogyAssets()
elseif m:sub(7)=="Chromatic" then 
VFXApi("Chromatic",1)
ChangeAndRecolor("Chromatic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(0,0,0),true)
elseif m:sub(7)=="Anarchus" then 
VFXApi("Anarchus",1)
ChangeAndRecolor("Anarchus",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,100),rgb(0,0,200),false,false)
elseif m:sub(7)=="Overseer" then 
ChangeAndRecolor("Overseer",true,Font.new([[rbxassetid://12187369639]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(202,202,202),rgb(255,246,199),false,false)
VFXApi("Overseer",1)
elseif m:sub(7)=="Vanguard" then 
ChangeAndRecolor("Vanguard",true,Font.new([[rbxasset://fonts/families/Fondamento.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(254,255,184),rgb(255,255,254), false,false)
VFXApi("Vanguard",1,true)
elseif m:sub(7)=="Aegleseeker" then 
ChangeAndRecolor("Aegleseeker",false,"Code",rgb(197,135,243),rgb(237,212,255),false,false)
VFXApi("Aegleseeker")
elseif m:sub(7)=="Gaia" then 
ChangeAndRecolor("Gaia",true,Font.fromId(12187376545,e.FontWeight.Heavy,e.FontStyle.Italic),rgb(72,255,106),rgb(36,183,255),false,false)
elseif m:sub(7)=="Scourge" then 
ChangeAndRecolor("Scourge",true,Font.new([[rbxassetid://12187376739]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(220,0,0),rgb(100,0,0),false,false)
VFXApi("Scourge",1,true)
end
elseif m:sub(1,6)==".skip/" then 
MusicPlayer.TimePosition=m:sub(7)
sound.TimePosition=m:sub(7)
elseif m==".togg" or m==". togg" then 
GuiVisible=not GuiVisible
if GuiVisible then
pcall(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
pcall(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
else
pcall(function()
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if v:IsA("Frame")then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetDescendants()) do
if  v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
end)
pcall(function()
for _,v in ipairs(basgui.Frame:GetChildren()) do
if v:IsA("ScreenGui") then
v.Enabled=GuiVisible
end
end
end)
end
elseif m==".bbg" or m==". bbg" then 
BBGVisibilty=not BBGVisibilty
if BBGVisibilty then
modet.Visible=BBGVisibilty
else
modet.Visible=BBGVisibilty
end

end
end)
FunnyDebug.MouseButton1Click:Connect(function()
print(MusicPlayer.TimePosition)
end)




--// Wing Animation Container
WingAnimations.Iviriza=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5+0,3+0,-5+0),angles(0,1.5707963267948966+0,0.8726646259971648+rad(-40)*sin(sine*2+0)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(-3+0,-5+0,-2+0),angles(0,0,rad(-20)*cos(sine*2+0)+0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-5+0),angles(0,-1.5707963267948966+0,-0.8726646259971648+rad(40)*sin(sine*2+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,3+0,-4+0),angles(0,-1.5707963267948966+0,-0.17453292519943295+rad(-30)*cos(sine*2+0)+0)),deltaTime)  end)
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5+0,3+0,-4+0),angles(0,1.5707963267948966+0,0.17453292519943295+rad(30)*cos(sine*2+0)+0)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(3+0,-5+0,-2+0),angles(0,0,rad(20)*cos(sine*2+0)+0)),deltaTime)  
end


WingAnimations.NULLVOID=function()
if SpecialAnimRThingy==0 then
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2+0,5+0,-5.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+rad(95)*cos(sine*1+0)+Boost/40)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2+0,5+0,-5.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+rad(95)*cos(sine*1+0)+Boost/40)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.890106201171875+0,1.5+0),angles(-0.32324927331808134+0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
elseif SpecialAnimRThingy==2 then 
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/40)),deltaTime)  end)
local att=Extra_Part1
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,1.75+0),angles(1.5707963267948966+0,0,0))

AttachSword(SWAtt3,wingPart2,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,-1.5707963267948966+Spinny/10+Boost/40)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/40)),deltaTime)  end)
local att=Extra_Part2
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,2+0),angles(1.5707963267948966+0,0,0))

AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/40)),deltaTime)  end)
end

end


WingAnimations.Mayhem=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,2+0,-2.6+0),angles(0,1.5707963267948966+0,-0.9075712110370514+rad(-5)*sin(sine*1.5+1)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-1.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,4+0,-1+0),angles(0,1.5707963267948966+0,-1.5707963267948966+rad(-30)*sin(sine*1.5+0.75)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,5.5+-1*cos(sine*1.5+0.75)+0,1*cos(sine*1.5+0)+0),angles(0,1.5707963267948966+0,-1.9198621771937625+rad(-40)*sin(sine*1.5+0.5)+0)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(0,-1.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3+0,-1.6+0),angles(0,1.5707963267948966+0,-1.2217304763960306+rad(-20)*sin(sine*1.5+0.85)+0)),deltaTime)  end)
end


WingAnimations.Gaia=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+-1*sin(sine*2.5+0)+0,-3.6+-1*cos(sine*2.5+0.75)+0),angles(0,1.5707963267948966+rad(20)*cos(sine*2.5+0)+0,1.5707963267948966+rad(-20)*cos(sine*2.5+0.5)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(2+-0.5*cos(sine*2.5+0)+0,0.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart2,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,3+-1*sin(sine*2.5+0)+0,-3.6+-1*cos(sine*2.5+0.75)+0),angles(0,-1.5707963267948966+rad(-20)*cos(sine*2.5+0)+0,-1.5707963267948966+rad(20)*cos(sine*2.5+0.5)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+-1*sin(sine*2.5+0)+0,-3.6+-1*cos(sine*2.5+0.75)+0),angles(0,-1.5707963267948966+rad(-20)*cos(sine*2.5+0)+0,-0.5235987755982988+rad(-20)*cos(sine*2.5+0.5)+0)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(-2+0.5*cos(sine*2.5+0)+0,0.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3+-1*sin(sine*2.5+0)+0,-3.6+-1*cos(sine*2.5+0.75)+0),angles(0,1.5707963267948966+rad(20)*cos(sine*2.5+0)+0,0.5235987755982988+rad(20)*cos(sine*2.5+0.5)+0)),deltaTime)  end)


end


WingAnimations.Chromatic=function()
AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(-1+0,3+1*sin(sine*2+0)+0,-3.6+1.6*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(-20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
Extra_Part1.C0=cfMul(cfMul(cf(2+0,0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso



AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(-1+0,3+1*sin(sine*2+0)+0,-3.6+-1.6*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+rad(20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(1+0,3+1*sin(sine*2+0)+0,-3.6+1.6*sin(sine*2+0)+0),angles(0,-1.5707963267948966+0,2.443460952792061+rad(20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
Extra_Part2.C0=cfMul(cfMul(cf(-2+0,0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-1+0,3+1*sin(sine*2+0)+0,-3.6+-1.6*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,2.9670597283903604+rad(-20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
end



WingAnimations.Layers=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)

local att=SWAtt2
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(-5+0,3+0,-3.6+0),angles(0.6981317007977318+Boost/70.5,0,1.5707963267948966))

Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,0,-7+0.2*cos(sine*3+0)+0),angles(1.3089969389957472+0,0,0.3490658503988659+0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,13+0,-13.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+Boost/70.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,13+0,-13.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Boost/70.5)),deltaTime)  end)
local att=SWAtt4
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(5+0,3+0,-3.6+0),angles(3.839724354387525-Boost/70.5,0,-1.5707963267948966))

end


WingAnimations.Scourge=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-1.2217304763960306+0)),deltaTime)  end)
local att=Extra_Part1
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(-0.5*cos(sine*3+0)+0,2+0.5*sin(sine*3+0.5)+0,-1+0),angles(0,-1.5707963267948966+0,rad(-5)*cos(sine*3+0.5)+0))

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+0)),deltaTime)  end)
local att=SWAtt1
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(-1+0,1+0,-2+0),angles(-0.8726646259971648+0,3.141592653589793+0,-0.17453292519943295+0))

AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-0.5235987755982988+0)),deltaTime)  end)
end


WingAnimations.Vibrance=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,.5,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)

--s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime)  
local s=getAccWeldFromMesh("5254583415", "5268538095")
s.C0=cf(.25,3.5,-2.35)*angles(rad(30),rad(-30),rad(-20))
s.C1=cf_0
s.Part1=getPart("Right Arm")
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,5,-5.75),angles(0,1.5707963267948966-0.1832595714594046*sin((sine+0.15)*1),2.2689280275926285)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,-3.5,5),angles(0,1.5707963267948966-0.1832595714594046*sin((sine+0.4)*1),0.5235987755982988-0.1832595714594046*sin((sine+0.95)*1))),deltaTime) 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,-4.75,4.5),angles(0,1.5707963267948966-0.1832595714594046*sin((sine+0.4)*1),-2.2689280275926285+0.1832595714594046*sin((sine+0.95)*1))),deltaTime)  



end


WingAnimations.Censored=function()
local addrot1=clamp(sound.PlaybackLoudness/10,0,random(.1,.5))/1000
--print(addrot1)
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(-5+1.5*cos(sine*1+3)+0,2*sin(sine*2+3)+0,-1.6+3*sin(sine*1+3)+0),angles(-2.443460952792061+0,0.8726646259971648+0,-0.8726646259971648+rad(2500)*cos((sine*.1)+3)+0)),angles(0,0,0)),deltaTime)  end)
Extra_Part1.C0=cfMul(cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(-5+1.5*cos(sine*1+1)+0,2*sin(sine*2+1)+0,1.6+3*sin(sine*1+1)+0),angles(-2.443460952792061+0,0.8726646259971648+0,-2.6179938779914944+rad(2500)*cos((sine*0.1)+1)+0)),angles(0,0,0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(-3+1.5*cos(sine*1+0)+0,2*sin(sine*2+0)+0,-2+3*sin(sine*1+0)+0),angles(-2.443460952792061+0,0.8726646259971648+0,0.17453292519943295+rad(2500)*cos((sine*.1)+0)+0)),angles(0,0,0)),deltaTime)  end)
Extra_Part2.C0=cfMul(cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-4+1.5*cos(sine*1+2)+0,3+2*sin(sine*2+2)+0,-4.6+3*sin(sine*1+2)+0),angles(-2.443460952792061+0,0.8726646259971648+0,1.5707963267948966+rad(2500)*cos((sine*.1)+2)+0)),angles(0,0,0)),deltaTime)  end)

end


WingAnimations.Noxesium=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(1+0,0.25*sin(sine*2+0)+0,-5+0.25*sin(sine*2+0)+0),angles(0,-1.5707963267948966+0,-0.8726646259971648+rad(5.5)*cos(sine*2+0)+0)),deltaTime)  
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0.5*sin(sine*1.5+0)+0,-5+1.25*cos(sine*1.25+0)+0,-3.15+-0.75*sin(sine*1+0)+0),angles(0.3490658503988659+rad(5.5)*cos(sine*2+0)+0,-0.5235987755982988+0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,0.25*sin(sine*2+0)+0,-5+0.25*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,0.8726646259971648+rad(-5.5)*cos(sine*2+0)+0)),deltaTime) 

end


WingAnimations.Anarchus=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,.5,-1.5)*angles(rad(0),rad(0),rad(0)),deltaTime)
if AnimStyles==0 then
local s=SWAtt1
s.C0=cf(-.25,3,-2.5)*angles(rad(10),rad(90),rad(20))
s.C1=cf_0
s.Part1=getPart("Right Arm")
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5,2.5+1*sin(sine+.75),-3-1*sin(sine+.75)),angles(0,1.5707963267948966,-0.8726646259971648+Spinny/10+Boost/30)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5,2.5+1*sin(sine+.75),-3-1*sin(sine+.75)),angles(0,1.5707963267948966,1.2217304763960306+Spinny/10+Boost/30)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5,2.5+1*sin(sine+.75),-3-1*sin(sine+.75)),angles(0,1.5707963267948966,3.3161255787892263+Spinny/10+Boost/30)),deltaTime)  
else
local s=SWAtt1
s.C0=cf(.25,2.5,-2.5)*angles(rad(10),rad(130),rad(30))
s.C1=cf_0
s.Part1=getPart("Right Arm")
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2.5,3.5,-4+2*sin((sine+1)*2)),angles(2.181661564992912,1.5707963267948966,0+Spinny/10+Boost/30)),deltaTime) 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2.5,3.2,-4.1+2*sin((sine+1)*2)),angles(0.08726646259971647,1.5707963267948966,0+Spinny/10+Boost/30)),deltaTime) 
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-2.5,3.26,-3.79+2*sin((sine+1)*2)),angles(-1.9547687622336491,1.5707963267948966,0+Spinny/10+Boost/30)),deltaTime) 
end

end



WingAnimations.Nholiviction=function()
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/30.5)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/30.5)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

end


WingAnimations.Pyroplex=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-4,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2+0,0,-6+0.5*sin(sine*2+0)+0),angles(0,1.5707963705062866+0,-3.141592653589793+rad(10)*cos(sine*2+0)+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(2+0,0,-6+0.5*sin(sine*2+0)+0),angles(0,-1.5707963267948966+0,-3.141592653589793+rad(-10)*cos(sine*2+0)+0)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(2+0,0,-3+0),angles(0,-1.5707963267948966+0,-2.6179938779914944+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2+0,0,-3+0),angles(0,1.5707963705062866+0,2.6179938779914944+0)),deltaTime)  

end


WingAnimations.Fatal=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,.5,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,0.6981317007977318+0+0+Spinny/10+Boost/20.5)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,3.839724354387525+0+0+Spinny/10+Boost/20.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,-0.8726646259971648+0+0+Spinny/10+Boost/20.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,2.2689280275926285+0+0+Spinny/10+Boost/20.5)),deltaTime)

end


WingAnimations.Cascade=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,.5,-1.5)*angles(rad(0),rad(0),rad(0)),deltaTime)
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1.5+0+0,3+0+0,-3.6+0+0),angles(0+0+0,-1.5707963267948966+0+0,0.8726646259971648+0+0+Spinny/10+Boost/20.5)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(1+0+0,3+0+0,-7+0+0),angles(0+0+rad(-5.5)*cos(sine*2+0),-1.5707963267948966+rad(-10)*sin(sine*2+0)+0,-0.6981317007977318+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0+0,3+0+0,-7+0+0),angles(0+0+rad(-5.5)*cos(sine*2+0),1.5707963267948966+rad(10)*sin(sine*2+0)+0,0.6981317007977318+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0+0,3+0+0,-3.6+0+0),angles(0+0+0,1.5707963267948966+0+0,2.2689280275926285+0+0+Spinny/10+Boost/20.5)),deltaTime)  


end


WingAnimations.Sentinel=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,.5,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)

local s=SWAtt1
s.C0=cf(.5,2.5,-2)*angles(rad(50),rad(-175),rad(20))
s.C1=cf_0
s.Part1=getPart("Right Arm")

s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,4+0.5*sin(sine*2+0)+0,-5+-0.5*sin(sine*2+0)+0),angles(-2.2689280275926285+0,1.5707963267948966+rad(5.5)*cos(sine*2+0)+0,-0.5235987755982988+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,4+-1*cos(sine*2+0)+0,-5+-1*sin(sine*2+0)+0),angles(-2.2689280275926285+0,1.5707963267948966+rad(-5.5)*sin(sine*2+0.5)+0,-1.0471975511965976+rad(-5.5)*cos(sine*2+0)+0)),deltaTime)  
--s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-0.12439757585525513+0,0.06162172555923462+0,0.38154950737953186+0),angles(0,1.5707963267948966+0,0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,4+1*sin(sine*2+0)+0,-5+1*cos(sine*2+0)+0),angles(-2.2689280275926285+0,1.5707963267948966+rad(-5.5)*sin(sine*2+0)+0,rad(5.5)*cos(sine*2+0)+0)),deltaTime)  

end


WingAnimations.Nebulabrasque=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))

local e=clamp(sound.PlaybackLoudness/50,0,5.5)

AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/30.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-0.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-4.014257279586958+Spinny/15+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,0.6981317007977318+Spinny/15+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-2.443460952792061+Spinny/15+Boost/30.5)),deltaTime)  end)

end


WingAnimations.Imperial=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(1*sin(sine*2.5+0)+0,-1.5+0.25*cos(sine*2+0)+0,-1+0),angles(rad(-10.5)*sin(sine*2.25+0)+0,rad(-5)*cos(sine*2.5+0)+0,0)),deltaTime)  

AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-3.5+0),angles(0,-1.5707963267948966+rad(5.5)*cos(sine*3+0)+0,-0.9599310885968813+rad(7.5)*sin(sine*3+0.75)+0)),deltaTime)   end)
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-3.5+0),angles(0,1.5707963267948966+rad(-5.5)*cos(sine*3+0.75)+0,0.9599310885968813+rad(-7.5)*sin(sine*3+0.75)+0)),deltaTime)  end)
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,2.5+0.5*sin(sine*3+0)+0,-4.5+0.5*sin(sine*3+0)+0),angles(0,1.5707963267948966+rad(-10.5)*cos(sine*3+0)+0,1.2217304763960306+rad(7.5)*cos(sine*3+0)+0)),deltaTime)   end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+0,2.5+0.5*sin(sine*3+0)+0,-4.5+0.5*sin(sine*3+0)+0),angles(0,-1.5707963267948966+rad(10.5)*cos(sine*3+0)+0,-1.2217304763960306+rad(-7.5)*cos(sine*3+0)+0)),deltaTime)   end)

end


WingAnimations.Dimension=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(0.5+0,7*sin(sine*1+0)+0,-9*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Boost/50.5)),deltaTime)  end)
local att=Extra_Part1
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,-1.75+0),angles(-1.5707963267948966+0,Spinny/10+Boost/10,0))

AttachSword(SWAtt3,wingPart2,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,7*sin(sine*1+0)+0,-9*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,-2.443460952792061+Boost/50.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,7*sin(sine*1+0)+0,-9*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,2.2689280275926285+Boost/50.5)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(-1*cos(sine*0.5+0)+0,0.5*sin(sine*1+0)+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(0.5+0,7*sin(sine*1+0)+0,-9*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,0.6981317007977318+Boost/50.5)),deltaTime)  end)

end


WingAnimations.Tachyon=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
local att=SWAtt4
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(-1+0,1.5+0,-2.5+0),angles(-0.8726646259971648+0,3.141592653589793+0,0))
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
local att=Extra_Part1
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(1*sin(sine*2.5+0)+0,.5+0.5*cos(sine*1.5+0)+0,-3+-0.5*sin(sine*3+0)+0),angles(0,-1.5707963267948966+0,1.5707963267948966+0))

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-3.5+0),angles(0,1.5707963267948966+0,-2.443460952792061+Spinny/10.5+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,3+0,-3.5+0),angles(0,1.5707963267948966+0,1.7453292519943295+Spinny/10.5+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(0.5+0,3+0,-3.5+0),angles(0,1.5707963267948966+0,-0.3490658503988659+Spinny/10.5+Boost/30.5)),deltaTime)  end)

end


WingAnimations.Serenity=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,0,0),angles(0,1.5707963267948966+0,-0.8726646259971648+0)),deltaTime)  
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0.75*sin(sine*1+0)+0,-4+-0.5*cos(sine*1.5+0)+0,-3+-1*sin(sine*1+0)+0),angles(rad(10)*sin(sine*1+0)+0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-3.5+0),angles(0,1.5707963267948966+rad(10)*sin(sine*1+0)+0,1.0471975511965976+rad(10)*cos(sine*1+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+rad(10)*sin(sine*1+0)+0,-2.443460952792061+rad(-10)*cos(sine*1+0)+0)),deltaTime)  end)
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,0,0),angles(0,1.5707963267948966+0,-0.8726646259971648+0)),deltaTime)  
end


WingAnimations.Torment=function()
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0.35*cos(sine*1.35+0)+0,5.6+0.5*sin(sine*1.35+0.5)+0,-5+-0.5*sin(sine*1.35+0.5)+0),angles(0,1.5707963267948966+rad(-30)*cos(sine*1.35+0.75)+0,-2.443460952792061+rad(-30)*cos(sine*1.35+0)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0.5*sin(sine*1.35+1)+0,-5+-0.75*cos(sine*2+0)+0,-5+1.5*sin(sine*1.35+0.5)+0),angles(rad(5.5)*sin(sine*1.35+0)+0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-6.6+0),angles(0,1.5707963267948966+rad(-20)*cos(sine*1.35+0)+0,0.17453292519943295+rad(20)*cos(sine*1.35+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-6.6+0),angles(0,-1.5707963267948966+rad(20)*cos(sine*1.35+0)+0,-0.17453292519943295+rad(-20)*cos(sine*1.35+0)+0)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+-0.35*cos(sine*1.35+0)+0,5.6+0.5*sin(sine*1.35+0.5)+0,-5+-0.5*sin(sine*1.35+0.5)+0),angles(0,-1.5707963267948966+rad(30)*cos(sine*1.35+0.75)+0,2.443460952792061+rad(30)*cos(sine*1.35+0)+0)),deltaTime)  end)

end


WingAnimations.Pandemonium=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.5235987755982988+rad(30)*sin(sine*3+0)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-1.5+-0.5*cos(sine*3+0)+0,-1.5+0),angles(0,rad(-5.5)*sin(sine*3+0)+0,0)),deltaTime)  
local att=SWAtt3
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(-0.5+0,2+0,-2.6+0),angles(-0.8726646259971648+0,1.5707963267948966+0,0))

local att=SWAtt1
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(-0.5+0,2+0,-2.6+0),angles(-0.8726646259971648+0,1.5707963267948966+0,0))

Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(0,130+0,-1+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.2689280275926285+rad(-30)*sin(sine*3+0)+0)),deltaTime)  end)
end


WingAnimations.Lexapriatic=function()
if BasicAnimChange==1 then
--Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
--Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,-1+-2*cos(sine*3+0)+0,-2+2*cos(sine*3+0)+0),angles(0,1.5707963267948966+0,rad(-50)*cos(sine*3+0)+0)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0+0,-1.5+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,-2.886498229980469+-4*sin(sine*3+0)+0,-7.193745422363282+3*sin(sine*3+0)+0),angles(0,-1.5707963267948966+0,rad(50)*sin(sine*3+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,-1+-2*cos(sine*3+0)+0,-2+2*cos(sine*3+0)+0),angles(0,-1.5707963267948966+0,rad(50)*cos(sine*3+0)+0)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,-2.886498229980469+-4*sin(sine*3+0)+0,-7.193745422363282+3*sin(sine*3+0)+0),angles(0,1.5707963267948966+0,rad(-50)*sin(sine*3+0)+0)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0+0,1.5+0),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

elseif BasicAnimChange==2 then
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/70.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(-20+0,0.5+0,-1+0),angles(0,0,Spinny/5)),deltaTime)  
Extra_Part1.Part1=Torso
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/70.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+Spinny/15+Boost/70.5)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(20+0,0.5+0,-1+0),angles(0,0,Spinny/5)),deltaTime)  
Extra_Part2.Part1=Torso
AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+Spinny/15+Boost/70.5)),deltaTime)  end)

elseif BasicAnimChange==3 then 
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


local e=clamp(sound.PlaybackLoudness/35,0,random(5,20))/2

AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/50.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-0.5+0,-2+0),angles(0,0,0)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-0.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-4.014257279586958+Spinny/15+Boost/50.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,0.6981317007977318-Spinny/15-Boost/50.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-2.443460952792061-Spinny/15-Boost/50.5)),deltaTime)  end)


elseif BasicAnimChange==4 then 
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+Spinny/15+Boost/50.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),deltaTime)  
Extra_Part1.Part1=Torso
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/50.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,2.2689280275926285-Spinny/15-Boost/50.5)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(-0.5+0,0,-1+0),angles(0,0,1.5707963267948966)),deltaTime)  
Extra_Part2.Part1=Torso
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648-Spinny/15-Boost/50.5)),deltaTime)  end)

elseif BasicAnimChange==5 then 
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


local e=clamp(sound.PlaybackLoudness/35,0,random(5,20))/2

AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/50.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-0.5+0,-2+0),angles(0,0,0)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-0.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-4.014257279586958+Spinny/15+Boost/50.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,0.6981317007977318-Spinny/15-Boost/50.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5,0.5+e,-1.6-e),angles(0,1.5707963267948966+0,-2.443460952792061-Spinny/15-Boost/50.5)),deltaTime)  end)

end
end


WingAnimations.Restless=function()
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5+0,3+1*sin(sine*2+0)+0,-3.6+1*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,2.2689280275926285+Spinny/15+Boost/40.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,0+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(1*sin(sine*2+0)+0,-3+-2*cos(sine*1+0)+0,-3+0.5*sin(sine*2+0.75)+0),angles(-2.2689280275926285+0,0,0)),deltaTime)  
Extra_Part2.Part1=getPart("Left Arm")
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5+0,3+1*sin(sine*2+0)+0,-3.6+1*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/40.5)),deltaTime)  end)
end


WingAnimations.Cheatreal=function()

AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+10*sin(sine*1.5+0)+0,-3.6+-10.6*sin(sine*1.5+0)+0),angles(0,1.5707963267948966+0,0.6981317007977318+Spinny/15+Boost/30.5)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0,-7+0),angles(-1.5707963267948966+0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+10*sin(sine*1.5+0)+0,-3.6+-10.6*sin(sine*1.5+0)+0),angles(0,1.5707963267948966+0,2.2689280275926285+Spinny/15+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+10*sin(sine*1.5+0)+0,-3.6+-10.6*sin(sine*1.5+0)+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3+10*sin(sine*1.5+0)+0,-3.6+-10.6*sin(sine*1.5+0)+0),angles(0,1.5707963267948966+0,-2.443460952792061+Spinny/15+Boost/30.5)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0,-7+0),angles(-1.5707963267948966+0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
end


WingAnimations.HYPERINTERVENTIC=function()
if sound.PlaybackLoudness>=random(200,300)then 
BasicAnimChange=2
else
BasicAnimChange=1
end
local spinnn=Spinny/15+Boost/45
local randomness=clamp(sound.PlaybackLoudness/100,0,random(1,10))
if BasicAnimChange==1 then
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,1.5707963267948966+spinnn)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,spinnn)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,4.71238898038469+spinnn)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,3.141592653589793+spinnn)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
elseif BasicAnimChange==2 then 
AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,1.5707963267948966+spinnn)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(15+0,0.5+0,-2+0),angles(0,0,Spinny/5))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,spinnn)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,4.71238898038469+spinnn)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,4+randomness,0),angles(0,1.5707963267948966+0,3.141592653589793+spinnn)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(-15+0,0.5+0,-2+0),angles(0,0,Spinny/5))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
end
end


WingAnimations.Parallax=function()
s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(2+0,4+0,-1.6+0),angles(0,-1.5707963267948966+rad(30)*sin(sine*2+0)+0,2.2689280275926285+0)),angles(0,0,0)),deltaTime)  
SWAtt2.Part1=Torso
SWAtt2.C1=cf_0

Extra_Part1.C0=cfMul(cfMul(cf(-3+0,0.5+0,-1+0),angles(0,0,Boost/40)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(2+0,2+0,-4+0),angles(0,-1.5707963267948966+rad(30)*cos(sine*2+-0.5)+0,0)),angles(0,0,0)),deltaTime)  
SWAtt3.Part1=Torso
SWAtt3.C1=cf_0

s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(-2+0,4+0,-1.6+0),angles(0,1.5707963267948966+rad(-30)*sin(sine*2+0)+0,-2.443460952792061+0)),angles(0,0,0)),deltaTime)  
SWAtt1.Part1=Torso
SWAtt1.C1=cf_0

Extra_Part2.C0=cfMul(cfMul(cf(3+0,0.5+0,-1+0),angles(0,0,Boost/40)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-2+0,2+0,-4+0),angles(0,1.5707963267948966+rad(-30)*cos(sine*2+-0.5)+0,0)),angles(0,0,0)),deltaTime)  
SWAtt4.Part1=Torso
SWAtt4.C1=cf_0
end


WingAnimations.Horion=function()
local spinn=Spinny/10+Boost/75
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(-1+0,5+-7*sin(sine*1+0)+0,-5.6+9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,-2.443460952792061+spinn)),angles(0,0,0)),deltaTime)  end)
Extra_Part1.C0=cfMul(cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(-1+0,5+-7*sin(sine*1+0)+0,-5.6+9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,0.6981317007977318+spinn)),angles(0,0,0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(-1+0,5+-7*sin(sine*1+0)+0,-5.6+9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,2.2689280275926285+spinn)),angles(0,0,0)),deltaTime)  end)
Extra_Part2.C0=cfMul(cfMul(cf(0,-0.5+0,-3+0),angles(1.5707963267948966+0,0,0)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-1+0,5+-7*sin(sine*1+0)+0,-5.6+9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,-0.8726646259971648+spinn)),angles(0,0,0)),deltaTime)  end)
end


WingAnimations.Zionihilic=function()
local spinnn=Spinny/15+Boost/45
local randomness=clamp(sound.PlaybackLoudness/15,0,random(1,30))
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(-1+0,3+randomness,0),angles(0,1.5707963267948966+0,-0.8726646259971648+spinnn)),angles(0,0,0)),deltaTime)  end)
Extra_Part1.C0=cfMul(cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(-1+0,3+randomness,0),angles(0,1.5707963267948966+0,2.2689280275926285+spinnn)),angles(0,0,0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(-1+0,3+randomness,0),angles(0,1.5707963267948966+0,-2.443460952792061+spinnn)),angles(0,0,0)),deltaTime)  end)
Extra_Part2.C0=cfMul(cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-1+0,3+randomness,0),angles(0,1.5707963267948966+0,0.6981317007977318+spinnn)),angles(0,0,0)),deltaTime)  end)
end


WingAnimations.Axius=function()
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3.25+2*sin(sine*2+0)+0,-3.85+-2*sin(sine*1+0)+0),angles(0,1.5707963267948966+0,-0.8726646259971648+rad(1000)*cos(sine*0.5+0)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3.25+2*sin(sine*2+0)+0,-3.85+-2*sin(sine*1+0)+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(-1000)*cos(sine*0.5+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3.25+2*sin(sine*2+0)+0,-3.85+-2*sin(sine*1+0)+0),angles(0,1.5707963267948966+0,2.2689280275926285+rad(1000)*cos(sine*0.5+0)+0)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(0,-0.25*cos(sine*1.5+0)+0,1.5+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3.25+2*sin(sine*2+0)+0,-3.85+-2*sin(sine*1+0)+0),angles(0,1.5707963267948966+0,3.839724354387525+rad(-1000)*cos(sine*0.5+0)+0)),deltaTime)  end)
end








local xd1=0
local CensoreIt=false
--// Every Amimations Function 
function MainAnimations()
if not Running then return end
if WaitForRemove then return end
if MusicPlayer.Volume==0 then return end

local target=sound.PlaybackLoudness/75
xd1=xd1+(target - xd1)
local posi=math.clamp(xd1*1.2,-5,1)
local posi1=math.clamp(xd1*5,-5,60)
local posi2=math.clamp(xd1*1.5,-5,100)
local ps=5-posi
setclientparts()
local possin=29*cos(sine*.5)
local possin1=-5*cos(sine*1)
local u=sound.PlaybackLoudness
LastTimePosition=sound.TimePosition
AnarchyMainUI["Frame_2"].Position=AnarchyMainUI["Frame_2"].Position:Lerp(UDim2.new(0.72707, 30-10*sin(sine*.5), 0.77041, -100-5*cos(sine*2)),deltaTime)
AnarchyMainUI["Frame_2"].Rotation=5+2.5*sin(sine)
if u>=250 then 
if IsHidden then 
AnarchyMainUI["Image_Frame1_16"]["Position"] = AnarchyMainUI["Image_Frame1_16"]["Position"]:Lerp(UDim2.new(0.45, possin, -4, 15-posi2+possin1),deltaTime/2)
else
AnarchyMainUI["Image_Frame1_16"]["Position"] = AnarchyMainUI["Image_Frame1_16"]["Position"]:Lerp(UDim2.new(0.45, possin, -4, 75-posi2+possin1),deltaTime/2)
end
else 
if IsHidden then 
AnarchyMainUI["Image_Frame1_16"]["Position"] = AnarchyMainUI["Image_Frame1_16"]["Position"]:Lerp(UDim2.new(0.45, possin, -4, 15+possin1),deltaTime/2)
else
AnarchyMainUI["Image_Frame1_16"]["Position"] = AnarchyMainUI["Image_Frame1_16"]["Position"]:Lerp(UDim2.new(0.45, possin, -4, 75+possin1),deltaTime/2)
end
end

--refreshjoints()
pcall(function()
local char=game.Players.LocalPlayer.Character
if IsHatDropped then
lp.Character.PrimaryPart=nil
for _,d in lp.Character:GetChildren() do 
if d:IsA("BasePart") and Hatdrop and not IsHatDropped then 
local h=d
for _,x in h:GetChildren() do 
if x:IsA("Weld") or x:IsA("Motor6D") then 
x:Destroy()
--print(x)
end
end
end
end
else 
for _,x in lp.Character:GetChildren() do 
if x:IsA("Accessory") and not Hatdrop then 
local h=x.Handle 
h:FindFirstChildOfClass("Weld"):Destroy()
end
end
return
end

end)



sine=osclock()
local walking=IsWalking()
local getVel= getVel()
local ray,ray2=raycastlegs()
local Vfw, Vrt=velbycfrvec(v3_xz)
local Vfw, Vrt = velbycfrvec()
local rY, lY = raycastlegs()
local Ychg=velYchg()/20

local velXZ=velbycfrvec(v3_xz)
local velXZ2=velbycfrvec(v3_xzL)
local velNet=velbycfrvec(v3_net)
local IsOnGround=(ray==0)
local Jump=Jumping
local Fall=Falling
 
 
 
 hitfloor,posfloor=rayCast(rootpart.Position,(CFrame.new(rootpart.Position,rootpart.Position - Vector3.new(0,3.5,0))).lookVector,4,lp.Character)
--print(hitfloor)




Spinny=osclock()*25
numvalconstant.Value=osclock()*15
sp=tonumber(numvalconstant.Value)
Boost+=1*(sound.PlaybackLoudness/15)
numval.Value=Boost
--print(Boost)
setCamOffset(camoff.Value)
Retro+=1
Constant+=1
Constant2+=1
local l=tick()
local lt=LastTick
if Mode=="Lexapriatic" then 
if l-lt<=5 then
BasicAnimChange=1
elseif l-lt>=5 and l-lt<=10 then
BasicAnimChange=2
elseif l-lt>=10 and l-lt<=15 then
BasicAnimChange=3
elseif l-lt>=15 and l-lt<=20 then
BasicAnimChange=4
elseif l-lt>=20 and l-lt<=25 then
BasicAnimChange=5
elseif l-lt>=25 then
LastTick=tick()
end
end
if Constant >=60 then
Constant=1 
ClockTicky+=90
end

setCamOffset(camoff.Value)
Retro+=1

if Mode=="Vibrance" or Mode=="Mayhem" or Mode=="Pyroplex" or Mode=="Anarchus" or Mode=="Noxesium" or Mode=="Iviriza" or Mode=="Chromatic" or Mode=="Anarchus" or Mode=="Sentinel" and Sitting==true then
if walking and IsSitting and Sitting then 
LastTick=tick() IsSitting=false
AudioPlayer.Volume=1
elseif not IsSitting and not walking and tick()-LastTick>=50 and Sitting then 
RemoveAttachment()
LastTick=tick() IsSitting=true 
AudioPlayer.Volume=.35
end
end

if SmoothCamera then
ws.CurrentCamera.CameraSubject=head
end


if IsSitting and not Jump and not Fall then 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(2+0,3.75+1*sin(sine*1+0)+0,-8+0),angles(0,-1.5707963267948966+rad(-10)*sin(sine*1+0)+0,-1.3962634015954636+rad(5.5)*cos(sine*1+0)+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-2+0,1*sin(sine*1+0)+0,-7+0),angles(0,1.5707963267948966+rad(10)*sin(sine*1+0)+0,0.5235987755982988+rad(-5.5)*cos(sine*1+0)+0)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-2+0,3.75+1*sin(sine*1+0)+0,-8+0),angles(0,1.5707963267948966+rad(10)*sin(sine*1+0)+0,1.3962634015954636+rad(-5.5)*cos(sine*1+0)+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(2+0,1*sin(sine*1+0)+0,-7+0),angles(0,-1.5707963267948966+rad(-10)*sin(sine*1+0)+0,-0.5235987755982988+rad(5.5)*cos(sine*1+0)+0)),deltaTime)  
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1.85+0.055*sin(sine*1+0)+0,0),angles(-1.3962634015954636+0,0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.8325957145940461+0,0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.15000000000000002+-.055*sin(sine*1+0)+0,0),angles(-0.3490658503988659+0,-0.3490658503988659+0,-0.3490658503988659+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.09999999999999998+-.055*sin(sine*1+0)+0,0),angles(0,2.6179938779914944+0,1.9198621771937625+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0,-1.25+-.055*sin(sine*1+0)+0,0),angles(1.4311699866353502+0,-0.3490658503988659+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75+0,-.055*sin(sine*1+0)+0,-0.5+0),angles(0.3490658503988659+0,0.3490658503988659+0,0)),deltaTime)  
end






--// Music Length Visualizer 
local current=MusicPlayer.TimePosition
local total=MusicPlayer.TimeLength
AnarchyMainUI["SC_TextLabel_4"].Text=string.format("%s", FormatTime(current), total > 0 and FormatTime(total) or "----")
AnarchyMainUI["SC_TextLabel_8"].Text=string.format("%s", FormatTime(total))
Interface["Current Time_11"]["Text"] = string.format("%s / %s", FormatTime(current), total > 0 and FormatTime(total) or "----")

if total > 0 then
local progress=math.clamp(current / total, 0, 1)
local maxWidth=basgui.AbsoluteSize.X
AnarchyMainUI["Stretch_Frame_14"].Size=UDim2.new(0, 0+progress * maxWidth, 0, 17+posi)

else
AnarchyMainUI["Stretch_Frame_14"].Size=UDim2.new(0, 5, 0, 5)
end











tspawn(function()
local th={
  "C#NS#ORED!!",
  "C#NS#R#D",
  "CENS#ROD",
  "########??",
  "CENSORED!!!",
  "CE###RED",
  "#E###RED",
  "#E###RE#",
  "#E#S#RED",
  "CE#S#RE#",
  "C##SORED",
  "Pazolite",
  "!!derosneC",
  "!!!DEROSNEC",
}

if Mode=="Censored" then 
local y=sound.TimePosition
if (y>39.1 and y<39.45) or (y>49 and y<49.3) or (y>53.9 and y<54.2) or (y>56.65 and y<57.2) or (y>58.8 and y<58.85) or (y>58.9 and y<58.95) or (y>59 and y<59.05) or (y>59.1 and y<59.15) or (y>60 and y<60.35) or (y>60.8 and y<61) or (y>61.25 and y<61.6) or (y>61.7 and y<61.85) or (y>62.2 and y<62.35) or (y>62.4 and y<62.55) or (y>62.7 and y<62.75) or (y>62.8 and y<62.85) or (y>62.9 and y<62.95) or (y>64 and y<64.1) or (y>64.15 and y<64.25) or (y>64.35 and y<64.45) or (y>64.55 and y<64.65) or (y>64.75 and y<64.85) or (y>64.95 and y<65) or (y>65.05 and y<65.1) or (y>65.15 and y<65.2) or (y>65.4 and y<65.5) or (y>65.55 and y<65.65) or (y>65.7 and y<65.8) or (y>65.85 and y<65.95) or (y>66 and y<66.05) or (y>66.1 and y<66.15) or (y>66.2 and y<66.25) or (y>66.8 and y<66.9) or (y>66.95 and y<.05) or (y>67.15 and y<67.25) or (y>67.6 and y<67.65) or (y>67.7 and y<67.75) or (y>67.8 and y<67.85) or (y>67.9 and y<67.95) or (y>68 and y<68.05) or (y>68.1 and y<68.15) or (y>68.2 and y<68.25) or (y>68.3 and y<68.35) or (y>68.4 and y<68.45) or (y>68.5 and y<68.55) or (y>68.6 and y<68.65) or (y>68.7 and y<68.75) or (y>68.8 and y<68.85) or (y>68.9 and y<68.95) or (y>69 and y<69.05) or (y>90.95 and y<91.3) or (y>95.9 and y<96.2) or (y>105.7 and y<105.9) or (y>127.75 and y<128.05) or (y>132.65 and y<132.95) or (y>135.4 and y<135.95) or (y>137.55 and y<137.6) or(y>137.65 and y<137.7) or (y>137.75 and y<137.8) or (y>137.85 and y<137.9) or (y>138.75 and y<139.1) or (y>139.55 and y<139.75) or (y>140 and y<140.35) or (y>140.45 and y<140.6) or (y>140.95 and y<141.2) or (y>141.25 and y<141.4) or (y>141.55 and y<141.6) or (y>141.65 and y<141.7) or (y>141.75 and y<141.8) or (y>143 and y<143.1) or (y>143.15 and y<143.25) or (y>143.3 and y<143.4) or (y>143.45 and y<143.55) or (y>143.6 and y<143.7) or (y>143.75 and y<143.8) or (y>143.85 and y<143.9) or (y>143.95 and y<144) or (y>144.3 and y<144.4) or (y>144.45 and y<144.55) or (y>144.6 and y<144.7) or (y>144.75 and y<144.85) or (y>144.95 and y<145) or (y>145.05 and y<145.1) or (y>145.15 and y<145.2) or (y>145.5 and y<145.55) or (y>145.6 and y<145.65) or (y>145.75 and y<145.85) or (y>145.9 and y<146) or (y>146.4 and y<146.45) or (y>146.5 and y<146.55) or (y>146.6 and y<146.65) or (y>146.7 and y<146.75) or (y>146.8 and y<146.85) or (y>146.9 and y<146.95) or (y>147 and y<147.05) or (y>147.1 and y<147.15) or (y>147.2 and y<147.25) or (y>147.3 and y<147.35) or (y>147.4 and y<147.45) or (y>147.5 and y<147.55) or (y>147.6 and y<147.65) or (y>147.7 and y<147.75) or (y>147.8 and y<147.85) or (y>147.9 and y<147.95) or (y>159.8 and y<160.1) or (y>164.8 and y<165.1) or (y>174.6 and y<174.9) or (y>177.3 and y<179.1) or (y>181.1 and y<182.2) or (y>196.6 and y<197) or (y>206.5 and y<206.8) or (y>207 and y<207.1) or (y>207.2 and y<207.3) or (y>207.4 and y<207.5) or (y>207.6 and y<207.7) or (y>208.2 and y<208.3) or (y>208.4 and y<208.5) or (y>208.6 and y<208.7) or (y>208.8 and y<208.9) or (y>209.3 and y<209.4) or (y>209.5 and y<209.6) or (y>209.3 and y<209.4) or (y>209.5 and y<209.6) or (y>209.7 and y<209.8) or (y>209.9 and y<210) or(y>210.5 and y<212) then
CensoreIt=true
Boost=Boost+random(250,1000)
else
CensoreIt=false
end

local lol=random(10,255)
if CensoreIt then
MakeUIAnimated(u2(0,random(-10,10),0,random(-10,10)),u2(0,random(-10,10),0,random(-10,10)),random(-5,5),random(-5,5))
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-2,2),0+random(-2,2),1+random(-2,2)), angles(rad(1+random(-2,2)),rad(1+random(-2,2)),rad(1+random(-2,2)))),.35)
local g=clamp(sound.PlaybackLoudness/10,0,2)
local yes=clamp(sound.PlaybackLoudness/10,1,75)
local g1=clamp(sound.PlaybackLoudness/50,15,75)
ChangeAndRecolor("CENSORED!!!",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(lol,lol,lol),rgb(255,0,0),false,false)
wave1("Out",5,.5,rootpart1.CFrame*cf(0,-.5,0),scolor.Value)
wave1("In",5,.25,rootpart1.CFrame*cf(0,-.5,0)*angles(0,rad(Spinny),0),pcolor.Value,1)
local g2=clamp(sound.PlaybackLoudness/900.5,0,1)/random(5,7.5)
for _,v in next,statics do
insSet(v,"Visible",true)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

insSet(v,"ImageTransparency",1-g2)
if random(.1,2)>1 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",pcolor.Value)
end
end
sphereMK(6,math.random(5,15)/45*g,"Add",rootpart1.CFrame*CFrame.new(math.random(-10,10),-5,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.2,0.2,3,0,pcolor.Value,0)
sphereMK(6,math.random(5,15)/45,"Add",rootpart1.CFrame*CFrame.new(math.random(-10,10),-5,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.2,0.2,3,0,scolor.Value,0)
sphereMK(6,math.random(5,15)/45*g,"Add",rootpart1.CFrame*CFrame.new(math.random(-10,10),-5,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.2,0.2,3,0,pcolor.Value,0)
sphereMK(6,math.random(5,15)/45,"Add",rootpart1.CFrame*CFrame.new(math.random(-10,10),-5,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.2,0.2,3,0,scolor.Value,0)
slash(g1,5,true,"Round","Add","In",rootpart1.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,scolor.Value)
slash(g1,5,true,"Round","Add","Out",rootpart1.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,pcolor.Value)
slash(g1,5,true,"Round","Add","Out",rootpart1.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,scolor.Value)
local s=clamp(1*math.tan(sine*2.5),.5,1)
local f=scriptfolder["CensoredAssets"]["Floor"]
block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,0)*angles(0,0,0),pcolor.Value,s)
block("Out",5,v3(2.5,.1,5),v3(1,.1,50),f.CFrame*cf(0,-.5,0)*angles(0,90,0),pcolor.Value,s)
block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,0)*angles(0,180,0),pcolor.Value,s)
block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,0)*angles(0,270,0),pcolor.Value,s)

if not walking then
OverrideAnimation=true
s1_1.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_2.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_3.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_4.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
deltaTime=1
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(random(-5,5),random(-2.5,2.5),random(-5,5)),angles(rad(-110)+rad(random(-10,10)),rad(0)+rad(random(-10,10)),rad(150)+rad(random(-10,10)))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+0,-0.17453292519943295+0,3.6651914291880923+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.5+0,-0.5+0),angles(0.3490658503988659+0,-2.6179938779914944+0,-2.6179938779914944+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0,0),angles(-0.5235987755982988+0,0.5235987755982988+0,0.5235987755982988+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,0,-0.5+0),angles(0,-0.8726646259971648+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+0,0),angles(-0.5235987755982988+0,0.8726646259971648+0,0.3490658503988659+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(random(-5,5),7+random(-2.5,2.5),random(-5,5)),angles(rad(-110)+rad(random(-10,10)),rad(0)+rad(random(-10,10)),rad(150)+rad(random(-10,10)))),deltaTime)   Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+0,-0.17453292519943295+0,3.6651914291880923+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+0,-0.17453292519943295+0,3.6651914291880923+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.5+0,-0.5+0),angles(0.3490658503988659+0,-2.6179938779914944+0,-2.6179938779914944+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0,0),angles(-0.5235987755982988+0,0.5235987755982988+0,0.5235987755982988+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,0,-0.5+0),angles(0,-0.8726646259971648+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+0,0),angles(-0.5235987755982988+0,0.8726646259971648+0,0.3490658503988659+0)),deltaTime)  
end
end
else
deltaTime=olddt
ReturnOldUIPos()
OverrideAnimation=false
local s=clamp(1*math.tan(sine*2.5),.5,1)
local f=scriptfolder["CensoredAssets"]["Floor"]
block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(30,-.5,0)*angles(0,rad(Spinny*10),0),scolor.Value,s)
block("Out",5,v3(2.5,.1,5),v3(1,.1,50),f.CFrame*cf(-30,-.5,0)*angles(0,rad(Spinny*10),0),scolor.Value,s)
block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,-30)*angles(0,rad(-Spinny*10),0),scolor.Value,s)
block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,30)*angles(0,rad(-Spinny*10),0),scolor.Value,s)

for _,v in next,statics do
insSet(v,"Visible",false)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

--insSet(v,"ImageTransparency",1-g2)
if random(1,2)>1.5 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",scolor.Value)
end
end
camoff.Value=cf_0

local rrot=clamp(sound.PlaybackLoudness/250,30,270)
local rsize=clamp(sound.PlaybackLoudness/50,10,70)
block("Out",5,v3(2.5,.1,30),v3(1,.1,30),f.CFrame*cf(0,-.5,10*cos(sine*5.5))*angles(0,90,0),scolor.Value,0,false,nil,true)
block("Out",5,v3(2.5,.1,30),v3(1,.1,30),f.CFrame*cf(0,-.5,-10*cos(sine*5.5))*angles(0,180,0),scolor.Value,0,false,nil,true)
block("Out",5,v3(2.5,.1,30),v3(1,.1,30),f.CFrame*cf(-10*cos(sine*5.5),-.5,0)*angles(0,270,0),scolor.Value,0,false,nil,true)
--block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,-30*cos(sine*.75))*angles(0,270+rad(-Spinny*10),0),pcolor.Value,s)
--block("Out",5,v3(2.5,.1,0),v3(1,.1,50),f.CFrame*cf(0,-.5,30*cos(sine*.75))*angles(0,270+rad(-Spinny*10),0),pcolor.Value,s)
if sound.PlaybackLoudness<random(200,300) then
ChangeAndRecolor(th[mrandom(1,#th)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,random(10,255),0),rgb(0,0,0),false,false)
else 
ChangeAndRecolor(th[mrandom(1,#th)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(0,random(50,200),0),false,false)
end
end
end
end)


if Mode=="Sentinel" then 
slash(math.random(150,250)/10,5,true,"Round","Add","Out",rootpart1.CFrame*CFrame.new(0,-.5,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,pcolor.Value)
wave1("Out",5,.1,rootpart1.CFrame*cf(0,-.5,0),scolor.Value)
wave1("In",5,.055,rootpart1.CFrame*cf(0,-.5,0)*angles(0,rad(Spinny),0),pcolor.Value,.5)
end


for _,v in next,statics do
--insSet(v,"Visible",true)
insSet(v,"ImageColor3",scolor.Value)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))
--insSet(v,"BackgroundTransparency",.25)
--insSet(v,"ImageTransparency",1-g2)
insSet(v,"ImageColor3",pcolor.Value)
end

--// VFX Handlers
pcall(function()
tspawn(function()
EquinoxBeats(58.75,78,current)
EquinoxBeats(101.35,110.5,current)
EquinoxBeats(112,121.150,current)
EquinoxBeats(122.5,132,current)
EquinoxBeats(133.5,142.5,current)
end)
end)


pcall(function()
tspawn(function()
if Mode=="Iviriza" then 
pcall(function()
local color=rgb(5+sound.PlaybackLoudness/200,10+sound.PlaybackLoudness/100,150+sound.PlaybackLoudness/7.5)
local secondary=rgb(255-sound.PlaybackLoudness/3.5,255-sound.PlaybackLoudness/3.5,200)


if current>135.08 and current<=155.65 then 
ChangeAndRecolor("Temptation",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(200,200,200),rgb(mrandom(75,255),0,0),false,false)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-1,1),0+random(-1,1),1+random(-1,1)), angles(rad(1+random(-1,1)),rad(1+random(-1,1)),rad(1+random(-1,1)))),.35)
wave1("Out",5,.3,rootpart1.CFrame*cf(0,-.5,0),scolor.Value)
wave1("In",5,.15,rootpart1.CFrame*cf(0,-.5,0)*angles(0,rad(Spinny),0),pcolor.Value,1)
MakeUIAnimated(u2(0,20*sin(sine),0,0),u2(0,-20*sin(sine),0,0),random(-1,1),random(-1,1))
tspawn(function()
local t=sound.TimePosition
local z=random(-25,25)
local x=random(-25,25)
sphere1("Out",5,v3(.5,.5,.5),v3(50,.5,.5),rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
sphere1("Out",5,v3(.5,.5,.5),v3(50,.5,.5),rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
wave2("Out",5,5,rootpart1.CFrame*cf(z,.25,x),pcolor.Value)
wave2("Out",5,7.5,rootpart1.CFrame*cf(x,.25,z),scolor.Value)
end)
tspawn(function()
local t=sound.TimePosition
local z=random(-25,25)
local x=random(-25,25)
sphere1("Out",5,v3(.5,.5,.5),v3(50,.5,.5),rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(z,0,x)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
sphere1("Out",5,v3(.5,.5,.5),v3(50,.5,.5),rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),scolor.Value,0,rootpart1.CFrame*cf(x,0,z)*angles(0,0,rad(90)),true,pcolor.Value,true,15)
wave2("Out",5,5,rootpart1.CFrame*cf(z,.25,x),pcolor.Value)
wave2("Out",5,7.5,rootpart1.CFrame*cf(x,.25,z),scolor.Value)
end)
deltaTime=1
else
ReturnOldUIPos()
camoff.Value=cf_0
deltaTime=.5
ChangeAndRecolor("Iviriza",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,secondary,false,false)
end



local model=scriptfolder:FindFirstChild("AuxnoAssets")



if Mode=="Iviriza" and current>135.08 and current<=155.65 then 
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.Color=cs({
  csk(0,rgb(mrandom(75,255),0,0)),
  csk(1,rgb(mrandom(75,255),0,0)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(mrandom(75,255),0,0)
end
end
else
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/50
v.Range=2+sound.PlaybackLoudness/150
v.Color=color
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.Color=cs({
  csk(0,color),
  csk(1,color),
})
end
end
end


end)
end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Iviriza" then
if current>=135.08 then 
SpecialAnimations(current,0,135.08,"Iviriza",0,false)
SpecialAnimations(current,135.08,140,"Iviriza",1, false)
SpecialAnimations(current,145.3,145.5,"Iviriza",3, false)
SpecialAnimations(current,145.5,145.8,"Iviriza",5,false)
SpecialAnimations(current,145.8,146.1,"Iviriza",3,false)
SpecialAnimations(current,146.1,146.45,"Iviriza",1,false)
SpecialAnimations(current,146.45,147.4,"Iviriza",5,false)
--SpecialAnimations(current,147.4,147.8,"Iviriza",1)
SpecialAnimations(current,148,148.25,"Iviriza",4,false)
SpecialAnimations(current,148.25,149.1,"Iviriza",1,false)
SpecialAnimations(current,149.1,149.4,"Iviriza",5,false)
SpecialAnimations(current,150.9,151.3,"Iviriza",4,false)
SpecialAnimations(current,151.3,151.7,"Iviriza",3,false)
SpecialAnimations(current,151.7,151.87,"Iviriza",5,false)
SpecialAnimations(current,151.87,152.47,"Iviriza",1,false)
SpecialAnimations(current,152.47,152.67,"Iviriza",3,false)
SpecialAnimations(current,152.67,153.1,"Iviriza",5,false)
SpecialAnimations(current,153.2,153.37,"Iviriza",1,false)
SpecialAnimations(current,153.37,153.65,"Iviriza",4,false)
SpecialAnimations(current,153.65,153.9,"Iviriza",3,false)
SpecialAnimations(current,154.3,155.65,"Iviriza",1, false)
else 
SpecialAnimRThingy=0
OverrideWingAnim=false
end
end
end)
end)


pcall(function()
tspawn(function()
if Mode=="NULLVOID" then 
local text={
  "NULLVOID",
  "NullVoid",
  "@@@@@@",
  "________",
  "999999",
  "???????",
  "!!!!!!!",
  "V__dnull",
  "V_id___l",
  "diovlluN",
  "#######",
  ".......",
}
local text1={
  "NullVoid",
  "NUlLvOId",
  "NuLLVoid",
  "NULLvood",
  "nullVoid",
  "VOIDNULL",
  "voidnull",
}
local text2={
  "DIODLLUN",
  "VOIDNULL",
}



local rdmwhite=mrandom(1+sound.PlaybackLoudness/3.9,255)
local rdmwhite1=mrandom(1+sound.PlaybackLoudness/3,255)
local model=scriptfolder:FindFirstChild("NULLVOIDAssets")
local color=rgb(rdmwhite,rdmwhite,rdmwhite)
local color1=rgb(rdmwhite1,rdmwhite1,rdmwhite1)

--if current>155.35 and current<155.4 then 
--fulltext,typespeed,usefontface,font,color,timehappen,timedur,prevent,trans,sizebeggin,sizeout
TypeWrite("And in that light i find deliverance...",.045,true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),c3(1,1,1),155.35,157.9,true,.1,15,20)
--end
local funnyflick2=clamp(100*tan(sine*500),random(10,50),random(170,255))
local funnyflick3=clamp(-100*tan(sine*500),random(10,50),random(170,255))
local funnyflick=rgb(funnyflick2,funnyflick2,funnyflick2)
local funnyflick1=rgb(funnyflick3,funnyflick3,funnyflick3)
if model then 
if current<=61.5 then
SpecialAnimRThingy=0
OverrideWingAnim=false
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=5
end
end
end)


elseif current>=61.5 and current<=78 then 
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=7+sound.PlaybackLoudness/350
v.Range=5+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color),
csk(1,color),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
end)


elseif current>=78 and current<=141.5 then 
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color1),
csk(1,color1),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=10+sound.PlaybackLoudness/350
v.Range=7+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=1
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=10
end
end
end)


elseif current>=141.5 and current<=149.9 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=1+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=10
end
end
end)


elseif current>=149.9 and current<=157.8 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=1+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=1000
end
end
end)


elseif current>=157.8 and current<=191 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color),
csk(1,color),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
end)


elseif current>=191 and current<=191.35 then
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=7+sound.PlaybackLoudness/350
v.Range=5+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color),
csk(1,color),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
end)


elseif current>=205.35 and current<=206.25 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,funnyflick),
csk(1,funnyflick1),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=0
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=10+sound.PlaybackLoudness/250
v.Range=7+sound.PlaybackLoudness/10
v.Color=funnyflick
end
end
end)


elseif current>=191.35 and current<=221.75 then
if sound.PlaybackLoudness>mrandom(200,300) then
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color1),
csk(1,color1),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=10+sound.PlaybackLoudness/350
v.Range=7+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=.1
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
else 
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9)),
csk(1,rgb(0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(25+sound.PlaybackLoudness/3.9,25+sound.PlaybackLoudness/3.9,25+sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color),
csk(1,color),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9)),
csk(1,rgb(0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9,0+sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
end


elseif current>=221.75 and current<=229.25 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,funnyflick),
csk(1,funnyflick1),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=0
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=10+sound.PlaybackLoudness/250
v.Range=7+sound.PlaybackLoudness/10
v.Color=funnyflick
end
end
end)


elseif current>=229.25 and current<=229.637 then
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=7+sound.PlaybackLoudness/350
v.Range=5+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color),
csk(1,color),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
end)


elseif current>=229.637 and current<=229.754 then
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=5
end
end
end)


elseif current>=230 and current<=237.65 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,funnyflick),
csk(1,funnyflick1),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=.15
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=20+sound.PlaybackLoudness/200
v.Range=15+sound.PlaybackLoudness/10
v.Color=funnyflick
end
end
end)


elseif current>=237.65 and current<=238 then
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=5
end
end
end)


elseif current>=238.2 and current<=257.1 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,funnyflick),
csk(1,funnyflick1),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=2.5
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=25+sound.PlaybackLoudness/150
v.Range=15+sound.PlaybackLoudness/12.5
v.Color=funnyflick
end
end
end)


elseif current>=260.45 and current<=293.3 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,funnyflick),
csk(1,funnyflick1),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Brightness=.15
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=20+sound.PlaybackLoudness/200
v.Range=15+sound.PlaybackLoudness/10
v.Color=funnyflick
end
end
end)

elseif current>=293.3 and current<=309.97 then
tspawn(function()
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=5
end
end
end)


elseif current>=309.97 and current<=318 then
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=color
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") then 
v.Color=cs({
csk(0,color),
csk(1,color),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=100
end
end
end)


elseif current>=318 then 
tspawn(function()
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name~="Circle" then 
v.Brightness=0
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=1+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)
end
end
for _,v in model:GetDescendants() do
if v:IsA("ParticleEmitter") and v.Name=="Circle" then 
v.Brightness=1
v.Color=cs({
csk(0,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
csk(1,rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9)),
})
v.LightInfluence=0
end
end
end)


end
end

if current>= 221.75 and current<=257.1 then 
--BetterTween(numvalconstant,0,{}):Play()
sp+=1
numvalconstant.Value=Boost/75
end
tspawn(function()
SpecialAnimations(current,0,219.75,"NULLVOID",0,false)
SpecialAnimations(current,219.75,260.45,"NULLVOID",5,true)
SpecialAnimations(current,260.45,293.3,"NULLVOID",6,true)
SpecialAnimations(current,293.3,309.97,"NULLVOID",0,false)
 
end)

if current<=61.5 then
ChangeAndRecolor(text1[mrandom(1,#text1)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
camoff.Value=cf_0

elseif current>=61.5 and current<=78 then 
ChangeAndRecolor(text1[mrandom(1,#text1)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(0,0,0),false,false)
camoff.Value=cf_0

elseif current>=78 and current<=141.5 then
ChangeAndRecolor(text1[mrandom(1,#text1)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
camoff.Value=cf_0

elseif current>=141.5 and current<=149.9 then 
ChangeAndRecolor(text1[mrandom(1,#text1)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(0,0,0),false,false)
camoff.Value=cf_0

elseif current>=149.9 and current<=157.8 then
ChangeAndRecolor(text1[mrandom(1,#text1)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
camoff.Value=cf_0

elseif current>=157.8 and current<=191  then 
ChangeAndRecolor(text1[mrandom(1,#text1)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
camoff.Value=cf_0

elseif current>=191 and current<=191.35  then 
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(0,0,0),false,false)
camoff.Value=cf_0

elseif current>=191.35 and current<=205.8  then
if sound.PlaybackLoudness>mrandom(200,300) then
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
else
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
end
camoff.Value=cf_0

elseif current>=205.35 and current<=206.25  then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),funnyflick,funnyflick1,false,false)
numvalconstant.Value+=random(10,1000)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-1,1),0+random(-1,1),1+random(-1,1)), angles(rad(1+random(-1,1)),rad(1+random(-1,1)),rad(1+random(-1,1)))),.35)

elseif current>=206.25 and current<=221.75  then
if sound.PlaybackLoudness>mrandom(200,300) then
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
else
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
end
camoff.Value=cf_0

elseif current>=221.75 and current<=229.25 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),funnyflick,funnyflick1,false,false)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-.5,.5),0+random(-.5,.5),1+random(-.5,.5)), angles(rad(1+random(-.5,.5)),rad(1+random(-.5,.5)),rad(1+random(-.5,.5)))),.15)

elseif current>=229.25 and current<=229.637 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
camoff.Value=cf_0

elseif current>=229.637 and current<=229.754 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
camoff.Value=cf_0

elseif current>=230 and current<=237.65 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),funnyflick,funnyflick1,false,false)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-.75,.75),0+random(-.75,.75),1+random(-.75,.75)), angles(rad(1+random(-.75,.75)),rad(1+random(-.75,.75)),rad(1+random(-.75,.75)))),.35)

elseif current>=237.65 and current<=238 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
camoff.Value=cf_0

elseif current>=238.2 and current<=257.1 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),funnyflick,funnyflick1,false,false)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-1,1),0+random(-1,1),1+random(-1,1)), angles(rad(1+random(-1,1)),rad(1+random(-1,1)),rad(1+random(-1,1)))),.35)



elseif current>=260.47 and current<=293.3 then
ChangeAndRecolor(text[mrandom(1,#text)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),funnyflick,funnyflick1,false,false)
camoff.Value=camoff.Value:Lerp(cfMul(cf(1+random(-1,1),0+random(-1,1),1+random(-1,1)), angles(rad(1+random(-1,1)),rad(1+random(-1,1)),rad(1+random(-1,1)))),.35)

elseif current>=293.3 and current<=309.9  then
if sound.PlaybackLoudness>mrandom(200,300) then
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
else
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
end
camoff.Value=cf_0

elseif current>=309.97 and current<=318 then 
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color,rgb(200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70,200+sound.PlaybackLoudness/70),false,false)
camoff.Value=cf_0

elseif current>=318 then 
ChangeAndRecolor(text2[mrandom(1,#text2)],true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9,sound.PlaybackLoudness/3.9),color,false,false)
camoff.Value=cf_0

end
end
end)
end)



tspawn(function()
pcall(function()
if Mode=="Nholiviction" then


if current>=132.6 and current<134.55 then 
local g2=clamp(sound.PlaybackLoudness/900.5,0,1)/random(5,7.5)
MakeUIAnimated(u2(0,random(-10,10),0,random(-10,10)),u2(0,random(-10,10),0,random(-10,10)),random(-5,5),random(-5,5))
for _,v in next,statics do
insSet(v,"Visible",true)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

insSet(v,"ImageTransparency",1-g2)
if random(.1,2)>1 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",pcolor.Value)
end
end
elseif current>=134.55 and current<154.3 then 
local g2=clamp(sound.PlaybackLoudness/900.5,0,3)/random(1,5.5)
for _,v in next,statics do
insSet(v,"Visible",false)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

insSet(v,"ImageTransparency",1-g2)
if random(.1,2)>1 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",pcolor.Value)
end
end
MakeUIAnimated(u2(0,10*sin(sine*5),0,0),u2(0,-10*sin(sine*5),0,0),random(-1,1),random(-1,1),true,180+5.5*sin(sine*5),.1)
else 
for _,v in next,statics do
insSet(v,"Visible",false)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))

insSet(v,"ImageTransparency",1)
if random(.1,2)>1 then
insSet(v,"ImageColor3",scolor.Value)
else
insSet(v,"ImageColor3",pcolor.Value)
end
end
ReturnOldUIPos()
end

if current<23.4 or (current>=110.9 and current<121.6) then
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local f=math.clamp(255*cos(sine*5)*1,0,255)

for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1
v.Brightness=1
v.Rate=2
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*5)
v.Brightness=.25
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
v.Color=rgb(f,0,0)
end
end
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,0,0),false,false)



elseif (current>=23.4 and current<45) or (current>=67 and current<110.9) or (current>=130.9 and current<132.6) or (current>=198 and current<329) then
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local h=math.random(1,255)
local f=math.clamp(255*tan(sine*50),0,255)
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,0,0),false,false)
for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1*cos(sine*1000)  
v.Brightness=1*cos(sine*1000)  
v.Rate=2+15*cos(sine*1000)  
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*1000)  
v.Brightness=.25*cos(sine*1000)  
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
v.Color=rgb(f,0,0)
end
end

elseif (current>=45 and current<67) or (current>=121.6 and current<130.9) then
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local h=math.random(1,255)
local f=math.clamp(255*tan(sine*50),0,255)
local r=math.random(1,3)
if r==2 then
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,f,f),false,false)
else
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,0,0),false,false)
end
for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1*cos(sine*1000)  
v.Brightness=1*cos(sine*1000)  
v.Rate=2+15*cos(sine*1000)  
if r==2 then
v.Color=cs({
  csk(0,rgb(f,f,f)),
  csk(1,rgb(f,f,f)),
})
else 
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0)),
})
end
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*1000)  
v.Brightness=.25*cos(sine*1000)  
if r==2 then
v.Color=cs({
  csk(0,rgb(f,f,f)),
  csk(1,rgb(f,f,f)),
})
else 
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0)),
})
end
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
if r==2 then
v.Color=rgb(f,f,f)
else 
v.Color=rgb(f,0,0)
end
end
end



elseif current>=132.6 and current<154.3 then
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local h=math.random(1,255)
local f=math.clamp(255*tan(sine*50),0,255)
local r=math.random(1,3)
if r==2 then
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,f,f),false,false)
else
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,0,0),false,false)
end
for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1*cos(sine*1500)  
v.Brightness=1*cos(sine*1500)  
v.Rate=2+15*cos(sine*1500)  
if r==2 then
v.Color=cs({
  csk(0,rgb(f,f,f)),
  csk(1,rgb(f,f,f)),
})
else 
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0)),
})
end
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*1500)  
v.Brightness=.25*cos(sine*1500)  
if r==2 then
v.Color=cs({
  csk(0,rgb(f,f,f)),
  csk(1,rgb(f,f,f)),
})
else 
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0)),
})
end
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
if r==2 then
v.Color=rgb(f,f,f)
else 
v.Color=rgb(f,0,0)
end
end
end



elseif current>=154.3 and current<198  then
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local f=math.clamp(255*cos(sine*5)*1,0,255)

for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1
v.Brightness=1
v.Rate=2
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*5)
v.Brightness=.25
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
v.Color=rgb(f,0,0)
end
end
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,0,0),false,false)

elseif current>=329 and current<369.85 then 
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local f=math.clamp(255*cos(sine*5)*1,0,255)

for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1
v.Brightness=1
v.Rate=2
v.Color=cs({
  csk(0,rgb(f,f,f)),
  csk(1,rgb(f,f,f))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*5)
v.Brightness=.25
v.Color=cs({
  csk(0,rgb(f,f,f)),
  csk(1,rgb(f,f,f))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
v.Color=rgb(f,f,f)
end
end
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,f,f),false,false)

else 
local model=scriptfolder["NholivictionAssets"]
local Letters=head["Letters"]
local f=math.clamp(255*cos(sine*5)*1,0,255)

for _,v in Letters:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=1
v.Brightness=1
v.Rate=2
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("ParticleEmitter") then 
v.LightEmission=.25*cos(sine*5)
v.Brightness=.25
v.Color=cs({
  csk(0,rgb(f,0,0)),
  csk(1,rgb(f,0,0))
})
end
end
for _,v in model:GetDescendants() do 
if v:IsA("PointLight") then 
v.Range=15+5*cos(sine*1000)  
v.Brightness=12.5+5*cos(sine*1000)  
if r==2 then
v.Color=rgb(f,f,f)
else 
v.Color=rgb(f,0,0)
end
end
end
ChangeAndRecolor("Nholiviction",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(f,0,0),false,false)





end


if walking then return end
if (current>=110.9 and current<121.6) then 
setHipHeight(10)
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0)+0,-1.5707963267948966+0+0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0.85)+0,0.5235987755982988+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0.85)+0,-0.3490658503988659+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0)+0,1.5707963267948966+0+0)),deltaTime)
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.5*sin(sine*2+0)+0,0),angles(-0.3217332954991647+rad(10)*cos(sine*2+0)+0,-0.38822379927651135+0,0.015783916622238027+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.3241992761421344+rad(-10)*sin(sine*1000+0)+rad(-10)*cos(sine*2+0),0.48182219368400026+0,0.18002329810274031+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8557235717773437+0,0.5+-0.25*cos(sine*2+0)+0,-0.6947830200195314+0),angles(2.199791193903291+rad(5)*sin(sine*1000+0)+0,0.885750121276491+0,1.3166711039929195+rad(-5)*sin(sine*1000+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,-0.2572921752929689+-0.2*cos(sine*2+0)+0,0.08072967529296876+0),angles(-0.17453292519943295+rad(10)*cos(sine*2+1)+0,-0.46482057328493437+0,0.467316381332113+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.4041641235351563+0,-0.13645324707031248+-0.25*cos(sine*2+0)+0,-0.5938293457031251+0),angles(-0.3633188755000828+rad(-20)*sin(sine*2+0)+0,0.5204978973514541+0,0.04861270337964476+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(rad(10)*cos(sine*2+0)+0,-0.3899083019292083+0,0.08726646259971647+0)),angles(0,rad(90),0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+0.5*sin(sine*2+0)+0,0),angles(-0.3217332954991647+rad(10)*cos(sine*2+0)+0,-0.38822379927651135+0,0.015783916622238027+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.3241992761421344+rad(-10)*sin(sine*1000+0)+rad(-10)*cos(sine*2+0),0.48182219368400026+0,0.18002329810274031+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8557235717773437+0,0.5+-0.25*cos(sine*2+0)+0,-0.6947830200195314+0),angles(2.199791193903291+rad(5)*sin(sine*1000+0)+0,0.885750121276491+0,1.3166711039929195+rad(-5)*sin(sine*1000+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,-0.2572921752929689+-0.2*cos(sine*2+0)+0,0.08072967529296876+0),angles(-0.17453292519943295+rad(10)*cos(sine*2+1)+0,-0.46482057328493437+0,0.467316381332113+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.4041641235351563+0,-0.13645324707031248+-0.25*cos(sine*2+0)+0,-0.5938293457031251+0),angles(-0.3633188755000828+rad(-20)*sin(sine*2+0)+0,0.5204978973514541+0,0.04861270337964476+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(rad(10)*cos(sine*2+0)+0,-0.3899083019292083+0,0.08726646259971647+0)),angles(0,rad(90),0)),deltaTime)  
end
OverrideAnimation=true
elseif current>=130.9 and current<132.6 then
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0)+0,-1.5707963267948966+0+0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0.85)+0,0.5235987755982988+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0.85)+0,-0.3490658503988659+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0)+0,1.5707963267948966+0+0)),deltaTime)
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf((random(-0.025,0.025))+0,(random(-0.025,0.025))+0+0.25*sin((sine*3)),(random(-0.025,0.025))+0),angles((random(-0.017453292519943295,0.017453292519943295))+-0.7853981633974483+-0.08726646259971647*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+0)),angles(-1.5707963705062866,0,-3.141592502593994)),min(deltaTime*3,1))Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles((random(-0.017453292519943295,0.017453292519943295))+-0.6981317007977318+-0.2617993877991494*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+0)),angles(-1.5707963705062866,0,-3.141592502593994)),min(deltaTime*2,1))RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+-0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+-0.3490658503988659)),angles(0,1.5707963705062866,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1,-0.9,-0.3),angles(0.2617993877991494+-0.2617993877991494*sin((sine*3)),0.3490658503988659,0)),angles(-0,-1.5707963705062866,0)),deltaTime)LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+-0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+0.3490658503988659)),angles(-0,-1.5707963705062866,0)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,0.2,-1),angles(-0.4363323129985824+-0.17453292519943295*cos((sine*3)),-0.4363323129985824,0)),angles(0,1.5707963705062866,0)),deltaTime)
setHipHeight(10)
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf((random(-0.025,0.025))+0,10+(random(-0.025,0.025))+5+0.25*sin((sine*3)),(random(-0.025,0.025))+0),angles((random(-0.017453292519943295,0.017453292519943295))+-0.7853981633974483+-0.08726646259971647*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+0)),angles(-1.5707963705062866,0,-3.141592502593994)),min(deltaTime*3,1))Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles((random(-0.017453292519943295,0.017453292519943295))+-0.6981317007977318+-0.2617993877991494*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+0)),angles(-1.5707963705062866,0,-3.141592502593994)),min(deltaTime*2,1))RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+-0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+-0.3490658503988659)),angles(0,1.5707963705062866,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1,-0.9,-0.3),angles(0.2617993877991494+-0.2617993877991494*sin((sine*3)),0.3490658503988659,0)),angles(-0,-1.5707963705062866,0)),deltaTime)LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+-0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+0.3490658503988659)),angles(-0,-1.5707963705062866,0)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,0.2,-1),angles(-0.4363323129985824+-0.17453292519943295*cos((sine*3)),-0.4363323129985824,0)),angles(0,1.5707963705062866,0)),deltaTime)
end
OverrideAnimation=true
elseif current>=132.6 and current<134.55 then 
s1_1.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_2.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_3.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_4.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
OverrideAnimation=true
if not SmoothCamera then
Neck.C0=cfMul(cfMul(cf(0,1,0),angles((random(-0.04363323129985824,0.04363323129985824))+0.7853981633974483+0.17453292519943295*cos((sine*3)),(random(-0.08726646259971647,0.08726646259971647))+0,(random(-0.04363323129985824,0.04363323129985824))+0)),angles(-1.5707963705062866,0,-3.141592502593994))RootJoint.C0=cfMul(cfMul(cf((random(-0.25,0.25))+0,(random(-0.25,0.25))+0+0.25*sin((sine*3)),(random(-0.25,0.25))+0),angles((random(-0.1,0.1))+0.4363323129985824,(random(-0.1,0.1))+0,(random(-0.1,0.1))+0)),angles(-1.5707963705062866,0,-3.141592502593994))LeftShoulder.C0=cfMul(cfMul(cf(-0.8,0.25,0.25),angles(1.1344640137963142,0.7853981633974483,-0.8726646259971648)),angles(-0,-1.5707963705062866,0))RightHip.C0=cfMul(cfMul(cf(0.9,0,-1.1),angles(-0.7853981633974483+0.08726646259971647*cos((sine*3)),-0.4363323129985824,0.08726646259971647)),angles(0,1.5707963705062866,0))LeftHip.C0=cfMul(cfMul(cf(-1,-0.9,-0.45),angles(-0.5235987755982988+0.08726646259971647*cos((sine*3)),0,-0.08726646259971647)),angles(-0,-1.5707963705062866,0))RightShoulder.C0=cfMul(cfMul(cf(0.8,0.25,0.25),angles(1.1344640137963142,-0.7853981633974483,0.8726646259971648)),angles(0,1.5707963705062866,0))
setHipHeight(10)
else
Neck.C0=cfMul(cfMul(cf(0,1,0),angles((random(-0.04363323129985824,0.04363323129985824))+0.7853981633974483+0.17453292519943295*cos((sine*3)),(random(-0.08726646259971647,0.08726646259971647))+0,(random(-0.04363323129985824,0.04363323129985824))+0)),angles(-1.5707963705062866,0,-3.141592502593994))RootJoint.C0=cfMul(cfMul(cf((random(-0.25,0.25))+0,10+(random(-0.25,0.25))+5+0.25*sin((sine*3)),(random(-0.25,0.25))+0),angles((random(-0.1,0.1))+0.4363323129985824,(random(-0.1,0.1))+0,(random(-0.1,0.1))+0)),angles(-1.5707963705062866,0,-3.141592502593994))LeftShoulder.C0=cfMul(cfMul(cf(-0.8,0.25,0.25),angles(1.1344640137963142,0.7853981633974483,-0.8726646259971648)),angles(-0,-1.5707963705062866,0))RightHip.C0=cfMul(cfMul(cf(0.9,0,-1.1),angles(-0.7853981633974483+0.08726646259971647*cos((sine*3)),-0.4363323129985824,0.08726646259971647)),angles(0,1.5707963705062866,0))LeftHip.C0=cfMul(cfMul(cf(-1,-0.9,-0.45),angles(-0.5235987755982988+0.08726646259971647*cos((sine*3)),0,-0.08726646259971647)),angles(-0,-1.5707963705062866,0))RightShoulder.C0=cfMul(cfMul(cf(0.8,0.25,0.25),angles(1.1344640137963142,-0.7853981633974483,0.8726646259971648)),angles(0,1.5707963705062866,0))
end
elseif current>=134.55 and current<154.3 then 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,0.6981317007977318+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,3.839724354387525+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,-0.8726646259971648+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,2.2689280275926285+0+0+Spinny/10+Boost/30.5)),deltaTime)
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf((random(-0.025,0.025))+0,(random(-0.025,0.025))+0+0.25*sin((sine*3)),(random(-0.025,0.025))+0),angles((random(-0.017453292519943295,0.017453292519943295))+0+-0.08726646259971647*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+3.141592653589793)),angles(-1.5707963705062866,0,-3.141592502593994)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,0.2,-1),angles(-0.4363323129985824+-0.17453292519943295*cos((sine*3)),-0.4363323129985824,0)),angles(0,1.5707963705062866,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1,-0.9,-0.3),angles(0.2617993877991494+-0.2617993877991494*sin((sine*3)),0.3490658503988659,0)),angles(-0,-1.5707963705062866,0)),deltaTime)LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+-0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+0.3490658503988659)),angles(-0,-1.5707963705062866,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+-0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+-0.3490658503988659)),angles(0,1.5707963705062866,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles((random(-0.017453292519943295,0.017453292519943295))+-0.6981317007977318+-0.2617993877991494*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+0)),angles(-1.5707963705062866,0,-3.141592502593994)),min(deltaTime*2,1))
setHipHeight(10)
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf((random(-0.025,0.025))+0,10+(random(-0.025,0.025))+5+0.25*sin((sine*3)),(random(-0.025,0.025))+0),angles((random(-0.017453292519943295,0.017453292519943295))+0+-0.08726646259971647*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+3.141592653589793)),angles(-1.5707963705062866,0,-3.141592502593994)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,0.2,-1),angles(-0.4363323129985824+-0.17453292519943295*cos((sine*3)),-0.4363323129985824,0)),angles(0,1.5707963705062866,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1,-0.9,-0.3),angles(0.2617993877991494+-0.2617993877991494*sin((sine*3)),0.3490658503988659,0)),angles(-0,-1.5707963705062866,0)),deltaTime)LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+-0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+0.3490658503988659)),angles(-0,-1.5707963705062866,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8,0.5,-0.25+0.2*sin((sine*3))),angles((random(-0.017453292519943295,0.017453292519943295))+2.8797932657906435+-0.17453292519943295*sin((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0.2617993877991494,(random(-0.017453292519943295,0.017453292519943295))+-0.3490658503988659)),angles(0,1.5707963705062866,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles((random(-0.017453292519943295,0.017453292519943295))+-0.6981317007977318+-0.2617993877991494*cos((sine*3)),(random(-0.017453292519943295,0.017453292519943295))+0,(random(-0.017453292519943295,0.017453292519943295))+0)),angles(-1.5707963705062866,0,-3.141592502593994)),min(deltaTime*2,1))
end 
OverrideAnimation=true
elseif current>=198 and current<329 then 
OverrideAnimation=true
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/30.5)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/30.5)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
if not SmoothCamera then
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0+0,-0.25+0+0.15*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,-2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),0.17453292519943295+rad(2.5)*sin(sine*1000+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0+0+0,1+0+0,0+0+0),angles(-2.0943951023931953+0+rad(-5.5)*cos(sine*3+0),0+rad(-1.5)*sin(sine*1000+0)+0,3.141592653589793+0+rad(1.5)*cos(sine*1000+0))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75+0+0,-0.09999999999999998+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0.3490658503988659+0+rad(-5.5)*cos(sine*3+0),0.3490658503988659+0+rad(1.5)*cos(sine*1000+0),0+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2+0+0,0+0+0.25*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),-0.17453292519943295+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0+0,-0.8+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0+0+rad(-5.5)*cos(sine*3+0),-0.3490658503988659+rad(-1.5)*sin(sine*1000+0)+0,0+0+rad(2)*cos(sine*1000+0))),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0+0+0,1+0.5*sin(sine*3+0)+0,0+0+0),angles(-2.2689280275926285+0+rad(-5.5)*cos(sine*3+0.5),0+rad(1)*sin(sine*1000+0)+0,3.141592653589793+0+rad(-1)*cos(sine*1000+0))),deltaTime)  
else 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0+0,-0.25+0+0.15*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,-2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),0.17453292519943295+rad(2.5)*sin(sine*1000+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0+0+0,1+0+0,0+0+0),angles(-2.0943951023931953+0+rad(-5.5)*cos(sine*3+0),0+rad(-1.5)*sin(sine*1000+0)+0,3.141592653589793+0+rad(1.5)*cos(sine*1000+0))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75+0+0,-0.09999999999999998+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0.3490658503988659+0+rad(-5.5)*cos(sine*3+0),0.3490658503988659+0+rad(1.5)*cos(sine*1000+0),0+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2+0+0,0+0+0.25*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),-0.17453292519943295+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0+0,-0.8+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0+0+rad(-5.5)*cos(sine*3+0),-0.3490658503988659+rad(-1.5)*sin(sine*1000+0)+0,0+0+rad(2)*cos(sine*1000+0))),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0+0+0,10+0.5*sin(sine*3+0)+0,0+0+0),angles(-2.2689280275926285+0+rad(-5.5)*cos(sine*3+0.5),0+rad(1)*sin(sine*1000+0)+0,3.141592653589793+0+rad(-1)*cos(sine*1000+0))),deltaTime) 
end
elseif current>=329 and current<369.85 and not walking then 
OverrideAnimation=true
SpecialAnimRThingy=1
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0)+0,-1.5707963267948966+0+0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0.85)+0,0.5235987755982988+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0.85)+0,-0.3490658503988659+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0)+0,1.5707963267948966+0+0)),deltaTime)
if not SmoothCamera then
RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.4,0+0.2*cos(sine*2.5),-0.9),angles(-0.6108652381980153+-0.3490658503988659*sin(sine*2.5),-0.3490658503988659+-0.17453292519943295*cos(sine*2.5),-0.2617993877991494)),angles(0,1.5707963705062866,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1,-0.9+0.2*cos(sine*2.5),-0.5),angles(-0.17453292519943295+0.3490658503988659*sin(sine*2.5),-0.4363323129985824,0)),angles(-0,-1.5707963705062866,0)),deltaTime)LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.4,0+-0.2*cos(sine*2.5),-0.4),angles(0.4363323129985824+0.4363323129985824*sin(sine*2.5),0.6108652381980153,2.0943951023931953)),angles(-0,-1.5707963705062866,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0+1*sin(sine*2.5),0),angles(0+0.3490658503988659*cos(sine*2.5),0.6108652381980153,0)),angles(-1.5707963705062866,0,-3.141592502593994)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1,0.75+-0.2*cos(sine*2.5),0.65),angles(0.3490658503988659+0.17453292519943295*sin(sine*2.5),0.6108652381980153,-1.0471975511965976)),angles(0,1.5707963705062866,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.17453292519943295+-0.2617993877991494*sin(sine*2.5),-0.6108652381980153,0)),angles(-1.5707963705062866,0,-3.141592502593994)),deltaTime)
setHipHeight(10)
else 
RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.4,0+0.2*cos(sine*2.5),-0.9),angles(-0.6108652381980153+-0.3490658503988659*sin(sine*2.5),-0.3490658503988659+-0.17453292519943295*cos(sine*2.5),-0.2617993877991494)),angles(0,1.5707963705062866,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1,-0.9+0.2*cos(sine*2.5),-0.5),angles(-0.17453292519943295+0.3490658503988659*sin(sine*2.5),-0.4363323129985824,0)),angles(-0,-1.5707963705062866,0)),deltaTime)LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.4,0+-0.2*cos(sine*2.5),-0.4),angles(0.4363323129985824+0.4363323129985824*sin(sine*2.5),0.6108652381980153,2.0943951023931953)),angles(-0,-1.5707963705062866,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+1*sin(sine*2.5),0),angles(0+0.3490658503988659*cos(sine*2.5),0.6108652381980153,0)),angles(-1.5707963705062866,0,-3.141592502593994)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1,0.75+-0.2*cos(sine*2.5),0.65),angles(0.3490658503988659+0.17453292519943295*sin(sine*2.5),0.6108652381980153,-1.0471975511965976)),angles(0,1.5707963705062866,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.17453292519943295+-0.2617993877991494*sin(sine*2.5),-0.6108652381980153,0)),angles(-1.5707963705062866,0,-3.141592502593994)),deltaTime)
end
else
OverrideAnimation=false
if current>=329 and current<369.85 and walking then
SpecialAnimRThingy=1
else
SpecialAnimRThingy=0
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/30.5)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/30.5)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,9+5*sin(sine*1+0)+0,-2+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/30.5)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
end
if not SmoothCamera then
setHipHeight(10)
end
end






end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Gaia" then

ChangeAndRecolor("Gaia",true,Font.fromId(12187376545,e.FontWeight.Heavy,e.FontStyle.Italic),rgb(25+sound.PlaybackLoudness/20,219+sound.PlaybackLoudness/100,255),rgb(36+sound.PlaybackLoudness/20,183+sound.PlaybackLoudness/80,255),false,false)
pcall(function()
local Floor=scriptfolder["GaiaAssets"]["Floor"]
for _,v in Floor:GetDescendants() do
if v:IsA("PointLight") then 
v.Color=rgb(36,183,255)
v.Brightness=5+sound.PlaybackLoudness/20.5
v.Range=7.5+sound.PlaybackLoudness/30.5
end
end
for _,v in Floor:GetDescendants() do
if v:IsA("ParticleEmitter") then 
--v.Color=rgb(36,183,255)
v.Brightness=1+sound.PlaybackLoudness/15.5
--v.Range=2+sound.PlaybackLoudness/30.5
end
end
for _,v in Floor:GetDescendants() do
if v:IsA("Beam") then 
--v.Color=rgb(36,183,255)
v.Brightness=1+sound.PlaybackLoudness/15.5
--v.Range=2+sound.PlaybackLoudness/30.5
end
end
end)


end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Nebulabrasque" then
local g=clamp(sound.PlaybackLoudness/5.5,0,25)
local g2=clamp(sound.PlaybackLoudness/900.5,0,1)/10
local g1=clamp(sound.PlaybackLoudness/2.5,0,255)
local prim=rgb(119+g+50*sin(sine*2),0,192+g+15*cos(sine*1.5))
ChangeAndRecolor("Nebulabrasque",true,Font.fromId(12187360881, e.FontWeight.Bold, Enum.FontStyle.Normal),prim,rgb(g1,g1,g1),false,false)
for _,v in next,statics do
insSet(v,"Visible",true)
insSet(v,"ImageColor3",scolor.Value)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))
--insSet(v,"BackgroundTransparency",.25)
insSet(v,"ImageTransparency",1-g2)
insSet(v,"ImageColor3",pcolor.Value)
end



end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Pyroplex" then

ChangeAndRecolor("Pyroplex",true,Font.new([[rbxasset://fonts/families/Fondamento.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0+sound.PlaybackLoudness/10,0+sound.PlaybackLoudness/10,0+sound.PlaybackLoudness/10),rgb(193+sound.PlaybackLoudness/50,83+sound.PlaybackLoudness/10,0),false,false)




end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Fatal" then 


local color={
  [1]=c3(1,0+sound.PlaybackLoudness/750,0+sound.PlaybackLoudness/750),
  [2]=c3(0+sound.PlaybackLoudness/750,1,0+sound.PlaybackLoudness/750),
  [3]=c3(0+sound.PlaybackLoudness/750,0+sound.PlaybackLoudness/750,1),
}
local txts={
  "FATAL",
  "!!!!!",
  "-----",
  "fatal",
  "FaTaL",
  "FATal",
  "00000",
  "Error",
  "?????",
  "lataF",
  "++++++",
  "Hall",
}
local glitch=color[mrandom(1,#color)]
if sound.PlaybackLoudness>=math.random(275,300) then
ChangeAndRecolor(txts[mrandom(1,#txts)],true,Font.fromId(12187360881, e.FontWeight.Bold, Enum.FontStyle.Normal),glitch,glitch,false,false)
else
ChangeAndRecolor(txts[mrandom(1,#txts)],true,Font.fromId(12187360881, e.FontWeight.Bold, Enum.FontStyle.Normal),c3(),glitch,false,false)
end
local Scary=torso:FindFirstChild("ScaryParticles")
local Floor=scriptfolder["FatalAssets"]["Floor"]
for _,b in Scary:GetDescendants() do 
if b:IsA("ParticleEmitter") then 
b.Brightness=1+sound.PlaybackLoudness/25
b.Rate=15+sound.PlaybackLoudness/25
b.Color=cs({
  csk(0,glitch),
  csk(1,glitch)
})
end
end
for _,b in Floor:GetDescendants() do 
if b:IsA("ParticleEmitter") then
b.Brightness=1+sound.PlaybackLoudness/25
b.Color=cs({
  csk(0,glitch),
  csk(1,glitch)
})
end
end
for _,v in Floor:GetDescendants() do 
if v:IsA("PointLight") then 
v.Brightness=5+sound.PlaybackLoudness/350
v.Range=2+sound.PlaybackLoudness/10
v.Color=glitch
end
end


end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Torment" then 
if current<=26.7 or (current>=29.25 and current<37.9) or (current>=41 and current<43) then
insSet(pcolor,"Value",rgb(100+100*sin(sine/75),0,0))
insSet(scolor,"Value",rgb(100+100*cos(sine/75),0,0))
elseif current>=26.7 and current<28.2 then
local t={rgb(random(175,255),0,0),rgb(0,0,0)}
insSet(pcolor,"Value",t[mrandom(1,2)])
insSet(scolor,"Value",t[mrandom(1,2)])
elseif current>=28.2 and current<29.25 then
insSet(pcolor,"Value",rgb(random(200,230),0,0))
insSet(scolor,"Value",rgb(random(200,230),0,0))
elseif current>=37.9 and current<39.3 then
local lol,lmao=random(0,255),random(0,255)
insSet(pcolor,"Value",rgb(lol,0,0))
insSet(scolor,"Value",rgb(lmao,0,0))
elseif current>=39.3 and current<40.3 then
local lol,lmao=random(125,255),random(125,255)
insSet(pcolor,"Value",rgb(lol,0,0))
insSet(scolor,"Value",rgb(lmao,0,0))
elseif current>=40.3 and current<41 then
local lol,lmao=random(0,125),random(0,125)
insSet(pcolor,"Value",rgb(lol,0,0))
insSet(scolor,"Value",rgb(lmao,0,0))
elseif current>=43 and current<43.8 then
insSet(pcolor,"Value",c3())
insSet(scolor,"Value",c3())
elseif (current>=43.8 and current<74.2) or (current>=107.8 and current<111) then
local t={rgb(random(175,255),0,0),rgb(random(70,100),0,0),rgb(55,55,55)}
insSet(pcolor,"Value",t[mrandom(1,3)])
insSet(scolor,"Value",rgb(200+abs(41*sin(sine)),0,0))
elseif current>=74.2 and current<76.45 then
local lol,lmao=random(55,100+25*sin(sine/100)),random(55,100+25*sin(sine/100))
insSet(pcolor,"Value",rgb(lol,0,0))
insSet(scolor,"Value",rgb(lmao,0,0))
elseif current>=76.45 and current<107.8 then
insSet(pcolor,"Value",CLerp(insGet(pcolor,"Value"),rgb(sound.PlaybackLoudness/1.5,sound.PlaybackLoudness/1.5,sound.PlaybackLoudness/1.5),deltaTime))
insSet(scolor,"Value",CLerp(insGet(scolor,"Value"),rgb(sound.PlaybackLoudness/2.25,sound.PlaybackLoudness/2.25,sound.PlaybackLoudness/2.25),deltaTime))
elseif current>=111 and current<113.26 then
insSet(pcolor,"Value",rgb(random(0,100),0,0))
insSet(scolor,"Value",rgb(random(0,50),0,0))
elseif (current>=113.26 and current<119.5) or (current>=131 and current<132.5) then --scream
insSet(pcolor,"Value",rgb(random(0,255),0,0))
insSet(scolor,"Value",rgb(random(0,255),0,0))
elseif current>=119.5 and current<154.5 then
insSet(pcolor,"Value",rgb(random(120,255),0,0))
insSet(scolor,"Value",rgb(random(25,75),0,0))
elseif current>=154.5 then
local lol,lmao = random(55,100),random(55,100)
insSet(pcolor,"Value",rgb(lol,0,0))
insSet(scolor,"Value",rgb(lmao,0,0))
end
 if (current>=113.26 and current<119.5) or (current>=131 and current<132.5) then
for _,v in next,statics do
insSet(v,"Visible",true)
insSet(v,"ImageColor3",scolor.Value)
--insSet(v,"BackgroundTransparency",.25)
insSet(v,"ImageTransparency",random(.8,.9))
end
else 
for _,v in next,statics do
insSet(v,"Visible",false)
insSet(v,"Position",u2(0,random(-5,5),0,random(-5,5)))
end
end
for _,c in scriptfolder["TormentAssets"]:GetDescendants() do
if c:IsA("ParticleEmitter") then 
c.Color=cs({
  csk(0,pcolor.Value),
  csk(1,scolor.Value),
})

end
end
for _,c in head:GetDescendants() do
if c:IsA("ParticleEmitter") then 
c.Color=cs({
  csk(0,pcolor.Value),
  csk(1,scolor.Value),
})
c.Enabled=true
end
end
for _,c in scriptfolder["TormentAssets"]:GetDescendants() do
if c:IsA("PointLight") then 
c.Color=pcolor.Value
c.Brightness=sound.PlaybackLoudness/50
c.Range=sound.PlaybackLoudness/75
end
end

ChangeAndRecolor("Torment",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),pcolor.Value,scolor.Value,false,false)
SpecialAnimations(current,0,111,"Torment",0,false)
SpecialAnimations(current,111,113.26,"Torment",1,false)
SpecialAnimations(current,113.26,119,"Torment",2,true)
SpecialAnimations(current,119,131,"Torment",0,false)
SpecialAnimations(current,131,132.5,"Torment",2,true)
end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Dimension" then 
local s
local d=math.clamp(sound.PlaybackLoudness/35.5,0,40)
local t=sound.TimePosition
if (t>0 and t<=33.5) or t>167.2 then
s=CLerp(rgb(0,45,59),rgb(0+d,45+d*2,59+d*2),deltaTime)
elseif t>=33.5 and t<=50.25 then 
s=CLerp(rgb(22,93,115),rgb(22+d,93+d,115+d),deltaTime)
elseif t>=50.25 and t<=66.1 then 
s=CLerp(rgb(64*2,205,248),rgb(64+d*2,205+d,248),deltaTime)
elseif t>=66.1 and t<=67.1 then 
s=rgb(0,0,0)
elseif t>=67.1 and t<=83.8 then 
s=CLerp(rgb(97,188,215),rgb(97+d,188+d*1.5,215+d),deltaTime)
elseif t>=83.8 and t<=116.85 then 
s=CLerp(rgb(22,93,115),rgb(22+d,93+d,115+d),deltaTime)
elseif t>=116.85 and t<=133.25 then 
s=CLerp(rgb(19,49,58),rgb(19+d*2,49+d*2,58+d*2),deltaTime)
elseif t>=133.25 and t<=133.85 then 
s=rgb(0,0,0)
elseif t>133.85 and t<=149.1 then 
s=CLerp(rgb(102,191,218),rgb(102+d*1.5,191+d*1.5,210+d),deltaTime)
elseif t>149.2 and t<=150.2 then 
s=rgb(0,0,0)
elseif t>150.1 and t<=167.2 then 
s=CLerp(rgb(96,196,237),rgb(96+d*1.5,196+d,237),deltaTime)
end
ChangeAndRecolor("Dimension",false,"SciFi",rgb(0,0,0),s,false,false)
end
end)
end)


pcall(function()
tspawn(function()
if Mode=="Pandemonium" then 
local s=clamp(100*sin(sine),0,100)
scolor.Value=rgb(255-s,1,153-s)
pcolor.Value=rgb(34+s,34+s,34+s)
ChangeAndRecolor("Pandemonium",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),scolor.Value,pcolor.Value,false,false)
--blockmoveup("In",1,v3(.1,.1,.1),v3(1.5,1.5,1.5),rootpart1.CFrame*cf(random(-10,10),random(-5.5,-2),random(-10,10)),scolor.Value,0,10,true,pcolor.Value,true)
local f=scriptfolder["PandemoniumAssets"]["Floor"]
local s=clamp(sound.PlaybackLoudness/50,0,5)
local g=s/2
local s1=clamp(sound.PlaybackLoudness/150,0,2.5)/2
block1("In",5,v3(0,1,1),v3(s,1,1),f.CFrame*cf(7.5,g,0)*angles(0,rad(0),rad(45)),scolor.Value,0,f.CFrame*cf(7.5,0,0)*angles(0,rad(45),rad(0)),true,pcolor.Value,true)
block1("In",5,v3(0,1,1),v3(s,1,1),f.CFrame*cf(-7.5,g,0)*angles(0,rad(0),rad(-45)),scolor.Value,0,f.CFrame*cf(-7.5,0,0)*angles(0,rad(45),rad(0)),true,pcolor.Value,true)
sphere("Out",5,v3(s1,s1,s1),v3(.1,.1,.1),rootpart1.CFrame*cf(5*sin(sine*5),-.5,-5*cos(sine*5)),pcolor.Value,0,true)
sphere("Out",5,v3(s1,s1,s1),v3(.1,.1,.1),rootpart1.CFrame*cf(-5*sin(sine*5),-.5,5*cos(sine*5)),pcolor.Value,0,true)
wave2("Out",5,3.5,f.CFrame*cf(0,.25,0),pcolor.Value)
PosRoot(1,true)
end
end)
end)


tspawn(function()
if Mode=="Lexapriatic" then 
local is=insSet
local pc=pcolor
local sc=scolor
local t=current
local o=sound.PlaybackLoudness
if t<29.707 or t>384.316  or t>=103.53 and t<=116.466 then


local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,110)
local sin1=clamp(25*cos(sine*5),0,10+h1)
local pcs=CLerp(rgb(0+h/2,0,0+h),rgb(55+sin1*2.5,0,100+h+sin1+h1/1.5),.25)
local scs=CLerp(rgb(0+h/2,0,0+h),rgb(90+sin1*5.5,0,100+h+sin1+h1/1.5),.25)
is(pc,"Value",pcs)
is(sc,"Value",scs)
elseif t>=29.707 and t<=57.502 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,30)
local sin1=clamp(25*sin(sine*5),0,10+h1)
local sin2=clamp(-25*cos(sine*5),0,10+h1)

is(pc,"Value",rgb(25+sin1*5.5,0,20+sin1*5.5*.5))
is(sc,"Value",rgb(30+sin2*5.5,0,70+sin2*1.5))
elseif t>59.283 and t<=88.929 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,30)
local sin1=clamp(25*sin(sine*5),0,10+h1)
local sin2=clamp(-25*cos(sine*5),0,10+h1*50)
is(sc,"Value",rgb(100+sin1,70+sin1*2.5,0))
is(pc,"Value",rgb(0,h1,50+sin2*5))
elseif t>118.499 and t<144.066 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,30)
local sin1=clamp(25*sin(sine*5),0,10+h1*5)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
local cols=clamp(100*sin(sine),0,100)
is(sc,"Value",rgb(cols,cols,cols))
is(pc,"Value",rgb(sin2*5.5,sin2*5.5,sin2*5.5))
elseif t>147.981 and t<173.671 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/25,0,200)
local rainb=Color3.fromHSV((tick()*.075)%1,1,1)
local sin1=clamp(200*sin(sine*1.5),0,200)
--local sin2=clamp(-25*cos(sine*5),0,10+h1*50)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
is(sc,"Value",rgb(sin2*5.5,0,0))
is(pc,"Value",rgb(sin1,sin1,sin1))
elseif t>177.499 and t<203.250 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,30)
local sin1=clamp(25*sin(sine*5),0,10+h1*5)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
local cols=clamp(100*sin(sine),0,100)
is(sc,"Value",rgb(cols,cols,cols))
is(pc,"Value",rgb(sin2*5.5,sin2*5.5,sin2*5.5))
elseif t>206.766 and t<232.947 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,30)
local rainb=Color3.fromHSV((tick()*.075)%1,1,1)
local sin1=clamp(25*sin(sine*5),0,10+h1*5)
--local sin2=clamp(-25*cos(sine*5),0,10+h1*50)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
is(sc,"Value",rgb(sin2*5.5,sin2*5.5,sin2*5.5))
is(pc,"Value",rainb)
elseif t>236.766 and t<251.947 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/25,0,200)
local rainb=Color3.fromHSV((tick()*.075)%1,1,1)
local sin1=clamp(200*sin(sine*2),0,200)
--local sin2=clamp(-25*cos(sine*5),0,10+h1*50)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
is(sc,"Value",rgb(sin2*5.5,sin2*5.5,0))
is(pc,"Value",rgb(0,0,sin1))
elseif t>266 and t<291.55 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/25,0,150)
local rainb=Color3.fromHSV((tick()*.075)%1,1,1)
local sin1=clamp(200*sin(sine),0,200)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
local cols=clamp(100*sin(sine*5),0,100)
is(sc,"Value",rainb)
is(pc,"Value",rgb(0,sin2*5.5,sin2*5.5))
elseif t>295.55 and t<320.804 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/25,0,200)
local rainb=Color3.fromHSV((tick()*.075)%1,1,1)
local sin1=clamp(200*sin(sine),0,200)
--local sin2=clamp(-25*cos(sine*5),0,10+h1*50)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
if mrandom(1,3)==1 then
is(sc,"Value",rgb(0,sin2*5.5,0))
elseif mrandom(1,3)==2 then 
is(sc,"Value",rgb(sin2*5.5,0,0))
elseif mrandom(1,3)==3 then 
is(sc,"Value",rgb(0,0,sin2*5.5))
end
if mrandom(1,3)==1 then
is(pc,"Value",rgb(0,sin2*5.5,0))
elseif mrandom(1,3)==2 then 
is(pc,"Value",rgb(sin2*5.5,0,0))
elseif mrandom(1,3)==3 then 
is(pc,"Value",rgb(0,0,sin2*5.5))
end

elseif t>325.2 and t<350.891 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/25,0,200)
local rainb=Color3.fromHSV((tick()*.075)%1,1,1)
local sin1=clamp(200*sin(sine*1.5),0,200)
--local sin2=clamp(-25*cos(sine*5),0,10+h1*50)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
is(sc,"Value",rgb(0,0,sin2*5.5))
is(pc,"Value",rgb(sin1,sin1,sin1))
elseif t>354.25 and t<380.508 then 
local h=clamp(o/50,0,50)
local h1=clamp(o/10,0,30)
local sin1=clamp(25*sin(sine*5),0,10+h1*5)
local sin2=clamp(-25*tan(sine*7.5),0,10+h1)
local cols=clamp(100*sin(sine),0,100)
is(sc,"Value",rgb(sin2*5.5,0,sin2*5.5))
is(pc,"Value",rgb(0,sin2*5.5,sin2*5.5))
end
local f={
  [[rbxasset://fonts/families/Michroma.json]],
  [[rbxasset://fonts/families/Sarpanch.json]],
  [[rbxasset://fonts/families/Fondamento.json]],
  [[rbxassetid://12187368843]],
  [[rbxassetid://12187368625]],
}

ChangeAndRecolor("Lexapriatic",true,Font.new(f[mrandom(1,#f)], Enum.FontWeight.Bold, Enum.FontStyle.Normal),sc.Value,pc.Value,false,false)
end
end)


tspawn(function()
if Mode=="Aegleseeker" then 
local is=insSet
local pc=pcolor
local sc=scolor
local t=current
local o=sound.PlaybackLoudness

local y={
  "Aegle",
  "Seeker",
  "Arbitrarium",
  "Trinity",
  "Cosmo",
  "LightBearer",
  "Kuiper",
  "Arctaurus",
  "Ethereal",
}
if BasicAnimChange=="Aegle" then 
ChangeAndRecolor("Aegle",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(197+50*cos(sine*1.5),135+100*sin(sine*2),243+12*sin(sine*2.5)),rgb(237+10*cos(sine*1.5),212+35*sin(sine*2),255),false,false)
elseif BasicAnimChange=="Seeker" then 
ChangeAndRecolor("Seeker",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(197+50*cos(sine*1.5),135+100*sin(sine*2),243+12*sin(sine*2.5)),false,false)
elseif BasicAnimChange=="Arbitrarium" then 
ChangeAndRecolor("Arbitrarium",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,255),rgb(255,0,0),false,false)
elseif BasicAnimChange=="Trinity" then 
ChangeAndRecolor("Trinity",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,255,255),rgb(100,100,100),false,false)
elseif BasicAnimChange=="Cosmo" then 
ChangeAndRecolor("Cosmo",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(0,0,0),rgb(144,29,242),false,false)
elseif BasicAnimChange=="Kuiper" then 
ChangeAndRecolor("Kuiper",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(50,50,50),rgb(150,150,150),false,false)
elseif BasicAnimChange=="Arctaurus" then 
ChangeAndRecolor("Arctaurus",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(163,6,6),rgb(150,150,150),false,false)
elseif BasicAnimChange=="Ethereal" then 
ChangeAndRecolor("Ethereal",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(130,223,250),rgb(148,165,234),false,false)
end
if t>=0 and t<=17 or t>=80.6 and t<=94.6 or t>=231.4 and t<=272.4 or t>=403.7 and t<=409.75 or t>=412.1 and t<=412.25 or t>=417 then 
BasicAnimChange="Aegle"


elseif t>=17 and t<=20.55  or t>=21.1 and t<=24.25 or t>=32.7 and t<=33 or t>=41 and t<=41.6 or t>=66 and t<=80.6 or t>=129.8 and t<=131.87 or t>=198.75 and t<=231.4 or t>=412.25 and t<=417 then
BasicAnimChange=y[mrandom(1,#y)]
elseif t>=20.55 and t<=21.1 or t>=24.25 and t<=25.1 or t>=197.5 and t<=198.75 or t>=366.8 and t<=370.8 or t>=411.8 and t<412 then 
BasicAnimChange="Seeker"
elseif t>=25.1 and t<=29 or t>=49.81 and t<=66 or t>=411.6 and t<=411.8 then 
BasicAnimChange="Arbitrarium"
elseif t>=29 and t<=32.7 or t>=41 and t<=49.81 or t>=113.4 and t<=129.8 or t>=411.4 and t<=411.6 then 
BasicAnimChange="Trinity" 
elseif t>=33 and t<=41 or t>=272.4 and t<=305.2 or t>=370.8 and t<=403.7 or t>=411.1 and t<=411.4 then 
BasicAnimChange="Cosmo" 
elseif t>=94.6 and t<=94.8  then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("AND",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=94.8 and t<=95.1 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("IN",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=95.1 and t<=95.4   then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("THAT",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=95.4 and t<=95.65 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("LIGHT",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=95.65 and t<=95.77 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("I",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=95.77 and t<=96.2 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("FIND",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=96.2 and t<=97 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("DELIVERANCE",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=97 and t<=113.4 or t>= 338 and t<=366.8 or t>=410.85 and t<=411.1 then 
BasicAnimChange="Kuiper" 
elseif t>=131.87 and t<=164.7 or t>=164.7 and t<=197.5 or t>=410.55 and t<=410.85 then 
BasicAnimChange="Arctaurus" 
elseif t>=305.2 and t<=335.7 or t>=409.75 and t<=410.1 then
BasicAnimChange="Ethereal" 
elseif t>=410.1 and t<=410.55 then
BasicAnimChange="LightBearer" 



elseif t>=335.7 and t<=335.97 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("AND",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=335.97 and t<=336.3 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("IN",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=336.3 and t<=336.6 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("THAT",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=336.6 and t<=336.7 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("LIGHT",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=336.7 and t<=336.95 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("I",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=336.95 and t<=337.25 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("FIND",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
elseif t>=337.25 and t<=337.5 then 
BasicAnimChange="LightBearer" 
ChangeAndRecolor("DELIVERANCE",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),rgb(255,255,255),rgb(255,255,255),false,false)
end


end
end)


tspawn(function()
if Mode=="Horion" then 
local is=insSet
local ig=insGet
local p=pcolor
local s=scolor
local t=current
local ld=sound.PlaybackLoudness
local clp=CLerp


if t>=1.666 and t<=9.521 then
local v1=clamp(ld,0,random(ld/500,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(v1,0,0),.75))
is(s,"Value",clp(ig(s,"Value"),rgb(0,v1,v1),.75))
else
is(s,"Value",clp(ig(s,"Value"),rgb(v1,0,0),.75))
is(p,"Value",clp(ig(p,"Value"),rgb(0,v1,v1),.75))
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=9.521 and t<=16.9 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*15.5),0,random(random(30,150),255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(0,0,0),.75))
else
is(s,"Value",clp(ig(s,"Value"),rgb(0,0,0),.75))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=16.9 and t<=22 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*15.5),0,random(h1,255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",Color3.fromHSV((tick()*.075)%1,1,random(.1,1)))
else
is(s,"Value",Color3.fromHSV((tick()*.075)%1,1,random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=22 and t<=32.2 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*50.5),0,random(h1,255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",Color3.fromHSV((tick())%1,1,random(.1,1)))
else
is(s,"Value",Color3.fromHSV((tick())%1,1,random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=32 and t<=39.7 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*7.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*50.5),0,random(h1,255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(0,0,v2),.75))
else
is(p,"Value",clp(ig(p,"Value"),rgb(v2,0,0),.75))
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=39.7 and t<=45.7 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*7.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*10.5),0,random(h1,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(v1,0,0),.35))
is(s,"Value",clp(ig(s,"Value"),rgb(0,sin2,sin2),.45))
else
is(s,"Value",clp(ig(s,"Value"),rgb(v2,0,0),.35))
is(p,"Value",clp(ig(p,"Value"),rgb(0,sin2,sin2),.35))
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=45.7 and t<=64.7 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*7.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*h1),0,random(h1,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(v1,v1,v1),1))
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
else
is(s,"Value",clp(ig(s,"Value"),rgb(v2,v2,v2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1))
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=64.7 and t<=65.8 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*50.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*100),0,random(h1,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(0,0,v1),1))
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,0,0),1))
else
is(s,"Value",clp(ig(s,"Value"),rgb(0,0,v2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,0,0),1))
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=65.8 and t<=66.5 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*50.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*100),0,random(h1,255))
is(p,"Value",Color3.fromHSV((tick()*h1)%1,1,random(.1,1)))
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))

ChangeAndRecolor("HEXED",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=66.5 and t<=83.1 then 
local h1=clamp(ld,0,random(100,150))
local sin2=clamp(-25*tan(sine*30.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*15),0,random(h1,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,v2,sin2),1))
is(s,"Value",clp(ig(s,"Value"),rgb(v2,sin2,v2),1))
else
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,v2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(v2,sin2,v2),1))
end

ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=83.5 and t<=94 then 
local h1=clamp(ld,0,random(100,150))
local sin2=clamp(-25*tan(sine*30.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*15),0,random(h1,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),random(.1,1)))
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),random(.1,1)))
else
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),random(.1,1)))
end

ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=94 and t<=110.45 then 
local h1=clamp(ld,0,random(100,150))
local v3=clamp(ld,0,random(.1,10))
local sin2=clamp(-25*tan(sine*30.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*15),0,random(h1,255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),random(.1,1)))
is(p,"Value",Color3.fromHSV((-tick()*v3)%1,1,random(.1,.5)))
else
is(s,"Value",Color3.fromHSV((-tick()*v3)%1,1,random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),random(.1,.5))) 
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)

elseif t>=110.45 and t<=122.3 then 
local h1=clamp(ld,0,random(100,150))
local v3=clamp(ld,0,random(.1,10))
local sin2=clamp(-25*tan(sine*30.5),0,random(h1,255))
local v2=clamp(-25*tan(sine*15),0,random(h1,255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),random(.1,1)))
is(p,"Value",Color3.fromHSV((-tick()*v3)%1,1,random(.1,1)))
else
is(s,"Value",Color3.fromHSV((-tick()*v3)%1,1,random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),random(.1,1))) 
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)

elseif t>=122.3 and t<=154.1 then 
local h1=clamp(ld,0,random(100,150))
local v3=clamp(ld,0,random(.1,10))
local sin2=clamp(-25*tan(sine*h1),0,random(random(150,200),255))
local v2=clamp(-25*tan(sine*15),0,random(random(150,200),255))
local v1=clamp(ld,0,random(ld/500,255))
if random(.1,1)>.5 then
is(p,"Value",clp(ig(p,"Value"),rgb(v1,v2,v2),.75))
is(s,"Value",clp(ig(s,"Value"),rgb(v2,v1,v1),.75))
else
is(s,"Value",clp(ig(s,"Value"),rgb(v1,v2,v2),.75))
is(p,"Value",clp(ig(p,"Value"),rgb(v2,v1,v1),.75))
end
ChangeAndRecolor("Horion",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)


--[[

9.521 
16.908 
21.992 
32.222 
39.784 
45.667 
64.736 
65.8
66.421 
83.1 
93.9 
95.5 
102.7 
110.8 
118.45 
121.4 
122.23 
126.063 
144.076 
145.16 
148.078 
152.788 
154.1

]]



end
end
end)


tspawn(function()
if Mode=="Zionihilic" then 
local is=insSet
local ig=insGet
local p=pcolor
local s=scolor
local t=current
local ld=sound.PlaybackLoudness
local clp=CLerp


if t>=0 and t<=7 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*20.5),0,random(random(30,150),255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(0,h1,h1),.75))
else
is(s,"Value",clp(ig(s,"Value"),rgb(0,h1,h1),.75))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=7 and t<=20.3 then 
local h1=clamp(ld,0,random(30,100))
local h2=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*20.5),0,random(random(30,150),255))
if random(.1,2)>1 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(random(30,255),random(30,255),random(30,255)),.75))
else
is(s,"Value",clp(ig(s,"Value"),rgb(random(30,255),random(30,255),random(30,255)),.75))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=20.3 and t<=22 then 
local h1=clamp(ld,0,random(30,100))
local h2=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*5.5),0,random(random(0,200),255))
if random(.1,2)>1 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(random(30,255),random(30,255),random(30,255)),.15))
else
is(s,"Value",clp(ig(s,"Value"),rgb(random(30,255),random(30,255),random(30,255)),.15))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=22 and t<=35 then 
local h1=clamp(ld,0,random(30,100))
local h2=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*35.5),0,random(random(30,150),255))
if random(.1,2)>1 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(random(30,255),random(30,255),random(30,255)),random(.1,1)))
else
is(s,"Value",clp(ig(s,"Value"),rgb(random(30,255),random(30,255),random(30,255)),random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=35 and t<=36.1 then 
local h1=clamp(ld,0,random(30,100))
local h2=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*2.5),0,random(random(0,200),255))
if random(.1,2)>1 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),.1))
is(p,"Value",clp(ig(p,"Value"),rgb(random(30,255),random(30,255),random(30,255)),.050))
else
is(s,"Value",clp(ig(s,"Value"),rgb(random(30,255),random(30,255),random(30,255)),.050))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),.1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>=36.1 and t<= 79.7 then 
local h1=clamp(ld,0,random(30,100))
local h2=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*35.5),0,random(random(0,150),255))
if random(.1,3)>1.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(random(30,255),random(0,255),random(0,255)),random(.1,1)))
else
is(s,"Value",clp(ig(s,"Value"),rgb(random(0,255),random(0,255),random(0,255)),random(.1,1)))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
elseif t>= 79.7 then 
local h1=clamp(ld,0,random(30,100))
local sin2=clamp(-25*tan(sine*20.5),0,random(random(30,150),255))
if random(.1,1)>.5 then 
is(s,"Value",clp(ig(s,"Value"),rgb(sin2,sin2,sin2),1))
is(p,"Value",clp(ig(p,"Value"),rgb(0,h1,h1),.75))
else
is(s,"Value",clp(ig(s,"Value"),rgb(0,h1,h1),.75))
is(p,"Value",clp(ig(p,"Value"),rgb(sin2,sin2,sin2),1)) 
end
ChangeAndRecolor("Zionihilic",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),p.Value,s.Value,false,false)
end

--[[
7 
20.3
22 
34.9 
36.1 
79.7

]]
end
end)

tspawn(function()
if Mode=="Axius" then 
local is=insSet
local ig=insGet
local p=pcolor
local s=scolor
local t=current
local ld=sound.PlaybackLoudness
local clp=CLerp

local color1,color2=rgb(197+50*cos(sine*1.5),135+100*sin(sine*2),243+12*sin(sine*2.5)),rgb(237+10*cos(sine*1.5),212+35*sin(sine*2),255)
ChangeAndRecolor("Axius",true,Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),color1,color2,false,false)

--[[
7 
20.3
22 
34.9 
36.1 
79.7

]]
end
end)



--[=[RetroAnimation("Cheatreal",function()
local yes=clamp(sound.PlaybackLoudness/10,1,75)
local g=clamp(sound.PlaybackLoudness/100,0,2)
local g1=clamp(sound.PlaybackLoudness/50,15,75)
local l=tick()
local lt=LastTick
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,.5,-1.5)*angles(rad(0),rad(0),rad(0)),deltaTime)
if sound.PlaybackLoudness>200 then
sphereMK(6,math.random(5,15)/45*g,"Add",rootpart1.CFrame*CFrame.new(math.random(-10,10),-5,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.2,0.2,3,0,scolor.Value,0)
sphereMK(6,math.random(5,15)/45,"Add",rootpart1.CFrame*CFrame.new(math.random(-10,10),-5,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.2,0.2,3,0,scolor.Value,0)
end

local f=scriptfolder["CheatrealAssets"]["PartFXFloor"]
local s=clamp(sound.PlaybackLoudness/25,0,math.random(5,10))
local s1=s/2
--Floor.Rotation=v3(0,l*10,0)
block1("In",3,v3(0,1,1),v3(s,1,1),f.CFrame*cf(9.5,s1,0)*angles(0,rad(0),rad(45)),c3(1,1,1),0,f.CFrame*cf(9.5,0,0)*angles(0,rad(0),rad(45)),true,AnarchyMainUI["SC_Blur_15"].ImageColor3,true)
block1("In",3,v3(0,1,1),v3(s,1,1),f.CFrame*cf(-9.5,s1,0)*angles(0,rad(0),rad(-45)),c3(1,1,1),0,f.CFrame*cf(-9.5,0,0)*angles(0,rad(0),rad(-45)),true,AnarchyMainUI["SC_Blur_15"].ImageColor3,true)
--[[slash(g1,5,true,"Round","Add","In",rootpart1.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,pcolor.Value)
slash(g1,5,true,"Round","Add","Out",rootpart1.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,pcolor.Value)
slash(g1,5,true,"Round","Add","Out",rootpart1.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),Vector3.new(0.01,0.01,0.01),math.random(5,100)/250,pcolor.Value)]]
if walking or Fall or Jump then return end
if l-lt>=0 and l-lt<=.1 then 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,5+0,-7+0),angles(1.2217304763960306+0,1.5707963267948966+0,0)),1)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,5+0,-7+0),angles(1.2217304763960306+0,-1.5707963267948966+0,0)),1)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-7+0),angles(0.3490658503988659+0,-1.5707963267948966+0,0)),1)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-7+0),angles(0.3490658503988659+0,1.5707963267948966+0,0)),1)  


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.5+0,0),angles(-1.5707963267948966+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+0,0,3.141592653589793+0)),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1+0,0.6+0),angles(0,-2.792526803190927+0,-2.443460952792061+0)),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.5+0,0),angles(1.2217304763960306+0,0.5235987755982988+0,0.5235987755982988+0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.5+0,1+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.5+0,0),angles(0,0.3490658503988659+0,0.17453292519943295+0)),1) 
elseif l-lt>=.1 and l-lt<=.2 then 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,5+0,-7+0),angles(1.2217304763960306+0,1.5707963267948966+0,0)),1)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,5+0,-7+0),angles(1.2217304763960306+0,-1.5707963267948966+0,0)),1)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-7+0),angles(0.3490658503988659+0,-1.5707963267948966+0,0)),1)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-7+0),angles(0.3490658503988659+0,1.5707963267948966+0,0)),1)  


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0,0),angles(-1.5707963267948966+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.8325957145940461+0,0,3.141592653589793+0)),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1+0,0.6+0),angles(0,-2.792526803190927+0,-2.356194490192345+0)),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.2+0,0),angles(1.2217304763960306+0,0.5235987755982988+0,0.5235987755982988+0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0,1+0),angles(-0.5235987755982988+0,-0.3490658503988659+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+0,0),angles(0,0.3490658503988659+0,0.3490658503988659+0)),1) 
elseif l-lt>=.2 and l-lt<=.3 then 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,5+0,-7+0),angles(1.2217304763960306+0,1.5707963267948966+0,0)),1)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,5+0,-7+0),angles(1.2217304763960306+0,-1.5707963267948966+0,0)),1)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-7+0),angles(0.3490658503988659+0,-1.5707963267948966+0,0)),1)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-7+0),angles(0.3490658503988659+0,1.5707963267948966+0,0)),1)  


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.1+0,0),angles(-1.6580627893946132+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+0,0,3.141592653589793+0)),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1+0,0.6+0),angles(0,-2.792526803190927+0,-2.356194490192345+0)),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.2+0,0),angles(1.0471975511965976+0,0.5235987755982988+0,0.3490658503988659+0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.1+0,1+0),angles(-0.5235987755982988+0,-0.3490658503988659+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.1+0,0),angles(0.17453292519943295+0,0.3490658503988659+0,0.3490658503988659+0)),1) 
elseif l-lt>=.3 and l-lt<=.4 then 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,5+0,-7+0),angles(1.2217304763960306+0,1.5707963267948966+0,0)),1)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,5+0,-7+0),angles(1.2217304763960306+0,-1.5707963267948966+0,0)),1)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-7+0),angles(0.3490658503988659+0,-1.5707963267948966+0,0)),1)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-7+0),angles(0.3490658503988659+0,1.5707963267948966+0,0)),1)  


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0,0),angles(-1.6580627893946132+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.6580627893946132+0,0,3.141592653589793+0)),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1+0,0.6+0),angles(0,-2.792526803190927+0,-2.443460952792061+0)),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.3+0,0),angles(1.1344640137963142+0,0.5235987755982988+0,0.3490658503988659+0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.2+0,1+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.25+0,0),angles(0.2617993877991494+0,0.3490658503988659+0,0.3490658503988659+0)),1)  
elseif l-lt>=.4 and l-lt<=.5 then 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,5+0,-7+0),angles(1.2217304763960306+0,1.5707963267948966+0,0)),1)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,5+0,-7+0),angles(1.2217304763960306+0,-1.5707963267948966+0,0)),1)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-7+0),angles(0.3490658503988659+0,-1.5707963267948966+0,0)),1)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-7+0),angles(0.3490658503988659+0,1.5707963267948966+0,0)),1)  


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.25+0,0),angles(-1.5707963267948966+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.6580627893946132+0,0,3.141592653589793+0)),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1+0,0.6+0),angles(0,-2.792526803190927+0,-2.443460952792061+0)),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.3+0,0),angles(1.2217304763960306+0,0.5235987755982988+0,0.3490658503988659+0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.2+0,1+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.5+0,0),angles(0.17453292519943295+0,0.3490658503988659+0,0.3490658503988659+0)),1)  
elseif l-lt>.5 then 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,5+0,-7+0),angles(1.2217304763960306+0,1.5707963267948966+0,0)),1)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,5+0,-7+0),angles(1.2217304763960306+0,-1.5707963267948966+0,0)),1)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-7+0),angles(0.3490658503988659+0,-1.5707963267948966+0,0)),1)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-7+0),angles(0.3490658503988659+0,1.5707963267948966+0,0)),1)  


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.5+0,0),angles(-1.5707963267948966+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+0,0,3.141592653589793+0)),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1+0,0.6+0),angles(0,-2.792526803190927+0,-2.443460952792061+0)),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.5+0,0),angles(1.2217304763960306+0,0.5235987755982988+0,0.5235987755982988+0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.5+0,1+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.5+0,0),angles(0,0.3490658503988659+0,0.17453292519943295+0)),1) 
LastTick=tick()
end
end)]=]








if Mode=="Layers" then
EquinoxBobbing()
BBGAttachment.CFrame=cf(0 + 2 * math.cos(osclock()*50 / 30.5),0 - 1.5 * math.cos(osclock()*50 / 30.5),0 + 1.5 * math.cos(osclock()*50 / 30.5))
modet.Position=UDim2.new(-.5,0 + 4 * math.cos(osclock()*50 / 17.5),-.15,0 - 2.5 * math.cos(osclock()*50 / 22.5))
modet.Rotation=0 - 5.5 * math.cos(osclock()*50 / 20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
elseif Mode=="Chromatic" then
bilguit.Brightness=1+sound.PlaybackLoudness/100
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Vibrance" then
bilguit.Brightness=1+sound.PlaybackLoudness/100
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Aegleseeker" then
bilguit.Brightness=1+sound.PlaybackLoudness/100
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Anarchus" then
bilguit.Brightness=1+sound.PlaybackLoudness/50.5
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Vanguard" then
bilguit.Brightness=1+sound.PlaybackLoudness/50.5
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Overseer" then
bilguit.Brightness=1+sound.PlaybackLoudness/50.5
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Scourge" then
bilguit.Brightness=1+sound.PlaybackLoudness/100
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Censored" then 
bilguit.Brightness=1+sound.PlaybackLoudness
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+mrandom(-1,1),0.66667,-17+mrandom(-1,1))
modet.Position=UDim2.new(0,mrandom(-1,1),0,mrandom(-1,1))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)+mrandom(-1,1)
modet.Rotation=-2 * math.cos(osclock()*50 / 1) + mrandom(-3,3)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Fatal" then 
bilguit.Brightness=1+sound.PlaybackLoudness
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+mrandom(-1,1),0.66667,-17+mrandom(-1,1))
modet.Position=UDim2.new(0,mrandom(-1,1),0,mrandom(-1,1))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)+mrandom(-1,1)
modet.Rotation=-2 * math.cos(osclock()*50 / 1) + mrandom(-3,3)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Iviriza" then
bilguit.Brightness=1+sound.PlaybackLoudness/50
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="Overseer" then
bilguit.Brightness=1+sound.PlaybackLoudness/50
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
elseif Mode=="NULLVOID" then
bilguit.Brightness=1+sound.PlaybackLoudness/50
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,mrandom(-1,1),0,mrandom(-1,1))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)+mrandom(-1,1)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+mrandom(-1,1),0.66667,-17+mrandom(-1,1))
modet.Rotation=-2 * math.cos(osclock()*50 / 1) + mrandom(-3,3)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
else
bilguit.Brightness=1+sound.PlaybackLoudness/100
BBGAttachment.CFrame=cf(0,0,0) 
bilguit.StudsOffsetWorldSpace=v3(0,0,0)
bilguit.StudsOffset=v3(-9.5,4,-1)
modet.Position=UDim2.new(0,0,0,0)
modet.Rotation=-5 * math.cos(osclock()*50 / 32)
AnarchyMainUI["SC_ModeText_1c"].Position=UDim2.new(0.355,-97.5+5*sin(osclock()*50/22.5),0.66667,-17+2.5*sin(osclock()*50/15))
AnarchyMainUI["SC_ModeText_1c"].Rotation=0-5.5*sin(osclock()*50/20)
for _,v in AnarchyMainUI["Main Interface_1"]:GetDescendants() do
if v:isA("ImageLabel") and v.Name=="PC_Circle" or v.Name=="SC_Circle" then
v.Rotation=Constant2+Boost/20
end
end
end


if not Debounce then
for _,v in ipairs(basgui:GetDescendants()) do
if v:IsA("Frame") then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui:GetDescendants()) do
if v:IsA("ImageLabel") and v.Name~="Statics" then
v.Visible=GuiVisible
end
--swait(.01)
end
for _,v in ipairs(basgui.Frame:GetChildren()) do
if v:IsA("ScreenGui") then
v.Enabled=GuiVisible
end
--swait(.01)
end

end








--// Every Animations
--[[if IsOnGround then
end]]
if Fall then
if Mode=="Iviriza" or Mode=="Mayhem" or Mode=="Chromatic" or Mode=="Noxesium" or Mode=="Anarchus" or Mode=="Vibrance" or Mode=="Pyroplex" or Mode=="Sentinel" or Mode=="Scourge" or Mode=="Serenity"  or Mode=="Layers" or Mode=="Torment" or Mode=="Pandemonium" or Mode=="Restless" or Mode=="Parallax" then
if hitfloor==nil then
RemoveAttachment()
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.7453292519943295,0,3.141592653589793),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.25),angles(-1.3962634015954636,1.3962634015954636,1.0471975511965976)),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.9198621771937625,0,3.141592653589793)),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,-0.3490658503988659)),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.25),angles(-1.3962634015954636,-1.3962634015954636,-1.0471975511965976)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-0.5),angles(0,1.5707963267948966,-0.5235987755982988)),deltaTime) 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 

end
end


elseif Jump  then
if Mode=="Iviriza" or Mode=="Mayhem" or Mode=="Chromatic" or Mode=="Noxesium" or Mode=="Anarchus" or Mode=="Vibrance" or Mode=="Pyroplex" or Mode=="Sentinel" or Mode=="Scourge" or Mode=="Serenity" or Mode=="Layers" or Mode=="Torment" or Mode=="Pandemonium" or Mode=="Restless" or Mode=="Parallax" then
RemoveAttachment()
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,-0.17453292519943295)),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,angles(-1.3962634015954636,0,3.141592653589793),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3962634015954636,0,3.141592653589793)),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0),angles(-0.5235987755982988,1.3962634015954636,0.5235987755982988)),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(-0.5235987755982988,-1.3962634015954636,-0.5235987755982988)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-0.5),angles(0,1.5707963267948966,-0.3490658503988659)),deltaTime) 

s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 

end


elseif walking and not Fall and not Jump then 
if Mode=="Iviriza" or Mode=="Mayhem"  or Mode=="Chromatic" or Mode=="Noxesium" or Mode=="Anarchus" or Mode=="Vibrance" or Mode=="Nholiviction" or Mode=="Pyroplex" or Mode=="Sentinel" or Mode=="Scourge" or Mode=="Serenity" or Mode=="Layers" or Mode=="Torment" or Mode=="Pandemonium" or Mode=="Restless" or Mode=="Parallax"then
if Mode~="Nholiviction" then setWalkSpeed(12) end

if Mode=="Iviriza" then
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5+0,3+0,-5+0),angles(0,1.5707963267948966+0,0.8726646259971648+rad(-40)*sin(sine*2+0)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(-3+0,-5+0,-2+0),angles(0,0,rad(-20)*cos(sine*2+0)+0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-5+0),angles(0,-1.5707963267948966+0,-0.8726646259971648+rad(40)*sin(sine*2+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,3+0,-4+0),angles(0,-1.5707963267948966+0,-0.17453292519943295+rad(-30)*cos(sine*2+0)+0)),deltaTime)  end)
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5+0,3+0,-4+0),angles(0,1.5707963267948966+0,0.17453292519943295+rad(30)*cos(sine*2+0)+0)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(3+0,-5+0,-2+0),angles(0,0,rad(20)*cos(sine*2+0)+0)),deltaTime)  

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime)


elseif Mode=="Mayhem" then

Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,2+0,-2.6+0),angles(0,1.5707963267948966+0,-0.9075712110370514+rad(-5)*sin(sine*1.5+1)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-1.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,4+0,-1+0),angles(0,1.5707963267948966+0,-1.5707963267948966+rad(-30)*sin(sine*1.5+0.75)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,5.5+-1*cos(sine*1.5+0.75)+0,1*cos(sine*1.5+0)+0),angles(0,1.5707963267948966+0,-1.9198621771937625+rad(-40)*sin(sine*1.5+0.5)+0)),deltaTime)  end)
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(0,-1.5+0,-2+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3+0,-1.6+0),angles(0,1.5707963267948966+0,-1.2217304763960306+rad(-20)*sin(sine*1.5+0.85)+0)),deltaTime)  end)
if AnimStyles==0 then
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif AnimStyles==1 then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.05*cos(sine*10+0)+0,0),angles(-0.08726646259971647+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(-5)*cos(sine*10000+0)+0,rad(2)*sin(sine*10000+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.16510009765625+0,0.727081298828125+0.05*cos(sine*10+1)+0,0),angles(1.7064548765095557+rad(5)*sin(sine*10000+0)+0,1.0280350418890414+0,1.2518516805363755+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.5+0.05*sin(sine*5+0)+0,-0.15*cos(sine*5+2.5)+0),angles(rad(-50)*cos(sine*5+0)+0,0,0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.25*sin(sine*5+0)+0,0.35*sin(sine*5+1)+0),angles(0.08726646259971647+rad(-50)*cos(sine*5+0)+0,0,0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-1+-0.25*sin(sine*5+0)+0,-0.35*sin(sine*5+1)+0),angles(0.08726646259971647+rad(50)*cos(sine*5+0)+0,0,0)),angles(0,rad(90),0)),deltaTime)  
end
elseif Mode=="Restless" then
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(0,-0.5+0,-2+0),angles(0,0,0)),deltaTime) 
Extra_Part2.Part1=getPart("Torso")
AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-0.5+0,3+1*sin(sine*2+0)+0,-3.6+1*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,2.2689280275926285+Spinny/15+Boost/12.5)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,0.5+0,-1+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
--Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(1*sin(sine*2+0)+0,-3+-2*cos(sine*1+0)+0,-3+0.5*sin(sine*2+0.75)+0),angles(-2.2689280275926285+0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-0.5+0,3+1*sin(sine*2+0)+0,-3.6+1*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,-0.8726646259971648+Spinny/15+Boost/12.5)),deltaTime)  end)
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Pandemonium" then

AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.5235987755982988+rad(30)*sin(sine*3+0)+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,-1.5+-0.5*cos(sine*3+0)+0,-1.5+0),angles(0,rad(-5.5)*sin(sine*3+0)+0,0)),deltaTime)  
SWAtt3.Part1=Torso
SWAtt3.C1=cf_0
SWAtt1.Part1=Torso
SWAtt1.C1=cf_0
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0.6981317007977318+0,1.5707963267948966+0,0)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(-2.443460952792061+0,1.5707963267948966+0,0)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part2.C0,cfMul(cf(0,130+0,-1+0),angles(0,0,0)),deltaTime)  
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.2689280275926285+rad(-30)*sin(sine*3+0)+0)),deltaTime)  end)

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Torment" then

Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0.35*cos(sine*1.35+0)+0,5.6+0.5*sin(sine*1.35+0.5)+0,-5+-0.5*sin(sine*1.35+0.5)+0),angles(0,1.5707963267948966+rad(-30)*cos(sine*1.35+0)+0,-2.443460952792061+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0.5*sin(sine*1.35+1)+0,-5+-0.75*cos(sine*2+0)+0,-5+1.5*sin(sine*1.35+0.5)+0),angles(rad(5.5)*sin(sine*1.35+0)+0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,2.5+0,-6.6+0),angles(0,1.5707963267948966+rad(-20)*cos(sine*1.35+0)+0,-0.17453292519943295+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,3+0,-6.6+0),angles(0,-1.5707963267948966+rad(20)*cos(sine*1.35+0)+0,-0.17453292519943295+0)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+-0.35*cos(sine*1.35+0)+0,5.6+0.5*sin(sine*1.35+0.5)+0,-5+-0.5*sin(sine*1.35+0.5)+0),angles(0,-1.5707963267948966+rad(30)*cos(sine*1.35+0)+0,2.2689280275926285+0)),deltaTime)  end)

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Layers" then

Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(2.2689280275926285+0,1.5707963267948966+0,1.5707963267948966+0)),deltaTime)  
SWAtt2.Part1=getPart("Torso")
SWAtt2.C1=cf_0
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0,0,-7+0.2*cos(sine*3+0)+0),angles(rad(70)+0,rad(0),0+0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,13+0,-13.6+0),angles(0,1.5707963267948966+0,rad(180)+Boost/70.5)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,13+0,-13.6+0),angles(0,1.5707963267948966+0,0+Boost/70.5)),deltaTime)  end)
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(2.2689280275926285+0,1.5707963267948966+0,-1.5707963267948966+0)),deltaTime)  
SWAtt4.Part1=getPart("Torso")
SWAtt4.C1=cf_0
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Serenity" then

Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,0,0),angles(0,1.5707963267948966+0,-0.8726646259971648+0)),deltaTime)  
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0.75*sin(sine*1+0)+0,-4+-0.5*cos(sine*1.5+0)+0,-3+-1*sin(sine*1+0)+0),angles(rad(10)*sin(sine*1+0)+0,0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-3.5+0),angles(0,1.5707963267948966+rad(10)*sin(sine*1+0)+0,1.0471975511965976+rad(10)*cos(sine*1+0)+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+rad(10)*sin(sine*1+0)+0,-2.443460952792061+rad(-10)*cos(sine*1+0)+0)),deltaTime)  end)
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,0,0),angles(0,1.5707963267948966+0,-0.8726646259971648+0)),deltaTime)  

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Scourge" then
Extra_Part1.Part1=Torso
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0)) 
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.9670597283903604+0)),deltaTime)  end)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(-0.5*cos(sine*3+0)+0,0.5+0.5*sin(sine*3+0.5)+0,-1.5+0),angles(0,0,-0.3490658503988659+rad(-5)*cos(sine*3+0.5)+0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.6179938779914944+0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.8726646259971648+0)),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(0.5+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.2689280275926285+0)),deltaTime)  end)

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Noxesium" then 

s1_2.C0=Lerp(s1_2.C0,cfMul(cf(1+0,0.25*sin(sine*2+0)+0,-5+0.25*sin(sine*2+0)+0),angles(0,-1.5707963267948966+0,-0.8726646259971648+rad(5.5)*cos(sine*2+0)+0)),deltaTime)  
Extra_Part1.C0=Lerp(Extra_Part1.C0,cfMul(cf(0.5*sin(sine*1.5+0)+0,-5+1.25*cos(sine*1.25+0)+0,-3.15+-0.75*sin(sine*1+0)+0),angles(0.3490658503988659+rad(5.5)*cos(sine*2+0)+0,0+0,0)),deltaTime)  
AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,0.25*sin(sine*2+0)+0,-5+0.25*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,0.8726646259971648+rad(-5.5)*cos(sine*2+0)+0)),deltaTime) 

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 

elseif Mode=="Vibrance" then 
local s=SWAtt1
s.C0=cf(-.25,2,-3.25)*angles(rad(-150),rad(0),rad(0))
s.C1=cf_0
s.Part1=getPart("Right Arm")
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,5,-5.75),angles(0,1.5707963267948966-0.1832595714594046*sin((sine+0.15)*1),2.2689280275926285)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,-3.5,5),angles(0,1.5707963267948966-0.1832595714594046*sin((sine+0.4)*1),0.5235987755982988-0.1832595714594046*sin((sine+0.95)*1))),deltaTime) 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,-4.75,4.5),angles(0,1.5707963267948966-0.1832595714594046*sin((sine+0.4)*1),-2.2689280275926285+0.1832595714594046*sin((sine+0.95)*1))),deltaTime)  

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 


elseif Mode=="Sentinel" then 
local s=SWAtt1
s.C0=cf(-.25,2,-3.25)*angles(rad(-150),rad(0),rad(0))
s.C1=cf_0
s.Part1=getPart("Right Arm")
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1+0,4+0.5*sin(sine*2+0)+0,-5+-0.5*sin(sine*2+0)+0),angles(-2.2689280275926285+0,1.5707963267948966+rad(5.5)*cos(sine*2+0)+0,-0.5235987755982988+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,4+-1*cos(sine*2+0)+0,-5+-1*sin(sine*2+0)+0),angles(-2.2689280275926285+0,1.5707963267948966+rad(-5.5)*sin(sine*2+0.5)+0,-1.0471975511965976+rad(-5.5)*cos(sine*2+0)+0)),deltaTime)  
--s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-0.12439757585525513+0,0.06162172555923462+0,0.38154950737953186+0),angles(0,1.5707963267948966+0,0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1+0,4+1*sin(sine*2+0)+0,-5+1*cos(sine*2+0)+0),angles(-2.2689280275926285+0,1.5707963267948966+rad(-5.5)*sin(sine*2+0)+0,rad(5.5)*cos(sine*2+0)+0)),deltaTime)  

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 

elseif Mode=="Chromatic" then
AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(-1+0,3+1*sin(sine*2+0)+0,-3.6+1.6*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(-20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
Extra_Part1.C0=cfMul(cfMul(cf(2+0,0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso



AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(-1+0,3+1*sin(sine*2+0)+0,-3.6+-1.6*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+rad(20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(1+0,3+1*sin(sine*2+0)+0,-3.6+1.6*sin(sine*2+0)+0),angles(0,-1.5707963267948966+0,2.443460952792061+rad(20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
Extra_Part2.C0=cfMul(cfMul(cf(-2+0,0,-1+0),angles(0,0,0)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-1+0,3+1*sin(sine*2+0)+0,-3.6+-1.6*sin(sine*2+0)+0),angles(0,1.5707963267948966+0,2.9670597283903604+rad(-20)*cos(sine*2+0)+0)),angles(0,0,0)),deltaTime)  end)
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Parallax" then
s1_2.C0=Lerp(s1_2.C0,cfMul(cfMul(cf(2+0,4+0,-1.6+0),angles(0,-1.5707963267948966+rad(30)*sin(sine*2+0)+0,2.2689280275926285+0)),angles(0,0,0)),deltaTime)  
SWAtt2.Part1=Torso
SWAtt2.C1=cf_0

Extra_Part1.C0=cfMul(cfMul(cf(-3+0,0.5+0,-1+0),angles(0,0,Boost/40)),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso


s1_3.C0=Lerp(s1_3.C0,cfMul(cfMul(cf(2+0,2+0,-4+0),angles(0,-1.5707963267948966+rad(30)*cos(sine*2+-0.5)+0,0)),angles(0,0,0)),deltaTime)  
SWAtt3.Part1=Torso
SWAtt3.C1=cf_0

s1_1.C0=Lerp(s1_1.C0,cfMul(cfMul(cf(-2+0,4+0,-1.6+0),angles(0,1.5707963267948966+rad(-30)*sin(sine*2+0)+0,-2.443460952792061+0)),angles(0,0,0)),deltaTime)  
SWAtt1.Part1=Torso
SWAtt1.C1=cf_0

Extra_Part2.C0=cfMul(cfMul(cf(3+0,0.5+0,-1+0),angles(0,0,Boost/40)),angles(0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0

s1_4.C0=Lerp(s1_4.C0,cfMul(cfMul(cf(-2+0,2+0,-4+0),angles(0,1.5707963267948966+rad(-30)*cos(sine*2+-0.5)+0,0)),angles(0,0,0)),deltaTime)  
SWAtt4.Part1=Torso
SWAtt4.C1=cf_0

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Pyroplex" then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2+0,0,-6+0.5*sin(sine*2+0)+0),angles(0,1.5707963705062866+0,-3.141592653589793+rad(10)*cos(sine*2+0)+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(2+0,0,-6+0.5*sin(sine*2+0)+0),angles(0,-1.5707963267948966+0,-3.141592653589793+rad(-10)*cos(sine*2+0)+0)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(2+0,0,-3+0),angles(0,-1.5707963267948966+0,-2.6179938779914944+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2+0,0,-3+0),angles(0,1.5707963705062866+0,2.6179938779914944+0)),deltaTime)  
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 

elseif Mode=="Anarchus" then

local s=SWAtt1
s.C0=cf(-.25,1.75,-3.25)*angles(rad(-150),rad(0),rad(0))
s.C1=cf_0
s.Part1=getPart("Right Arm")
if AnimStyles==0 then
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5,2.5+1*sin(sine+.75),-3-1*sin(sine+.75)),angles(0,1.5707963267948966,-0.8726646259971648+Spinny/10+Boost/30)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5,2.5+1*sin(sine+.75),-3-1*sin(sine+.75)),angles(0,1.5707963267948966,1.2217304763960306+Spinny/10+Boost/30)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5,2.5+1*sin(sine+.75),-3-1*sin(sine+.75)),angles(0,1.5707963267948966,3.3161255787892263+Spinny/10+Boost/30)),deltaTime)  
else 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2.5,3.5,-4+2*sin((sine+1)*2)),angles(2.181661564992912,1.5707963267948966,0+Spinny/10+Boost/30)),deltaTime) 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2.5,3.2,-4.1+2*sin((sine+1)*2)),angles(0.08726646259971647,1.5707963267948966,0+Spinny/10+Boost/30)),deltaTime) 
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-2.5,3.26,-3.79+2*sin((sine+1)*2)),angles(-1.9547687622336491,1.5707963267948966,0+Spinny/10+Boost/30)),deltaTime) 
end


LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0.5 * sin((sine+4)*-8)),angles(0,-1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.25*sin((sine+8)*8),-0.25+0.5*sin(sine*-8)),angles(0,1.5707963267948966+0.08726646259971647*sin(sine*-8),0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.25*sin((sine+8)*-8),-0.25+0.5*sin(sine*8)),angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*-8),-0.17453292519943295+0.5235987755982988*sin(sine*8))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0),angles(-1.9198621771937625,0,3.141592653589793+0.08726646259971647*sin(sine*8))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.05*sin(sine*16),0),angles(-1.3962634015954636,0.04363323129985824*sin(sine*8),3.141592653589793+0.08726646259971647*sin(sine*-8))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0.5 * sin((sine+4)*8)),angles(0,1.5707963267948966+0.08726646259971647*sin((sine+8)*-8),0.5235987755982988*sin(sine*-8))),deltaTime) 
elseif Mode=="Nholiviction" then

if (current>=110.9 and current<121.6 or current>=329 and current<369.85)then 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0)+0,-1.5707963267948966+0+0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0.85)+0,0.5235987755982988+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0.85)+0,-0.3490658503988659+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0)+0,1.5707963267948966+0+0)),deltaTime)
else 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,0.6981317007977318+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,3.839724354387525+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,-0.8726646259971648+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,2.2689280275926285+0+0+Spinny/10+Boost/30.5)),deltaTime)
end



if not OverrideAnimation then 
if not SmoothCamera then
setWalkSpeed(90)
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
setHipHeight(10)
else 
setWalkSpeed(90)
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
else 
if current>=110.9 and current<121.6 then 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0)+0,-1.5707963267948966+0+0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0.85)+0,0.5235987755982988+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0.85)+0,-0.3490658503988659+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0)+0,1.5707963267948966+0+0)),deltaTime)
if not SmoothCamera then
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
setWalkSpeed(90)

elseif (current>=198 and current<329 or current>=329 and current<369.85 or current>=134.55 and current<154.3 or current>=132.6 and current<134.55 or current>=130.9 and current<132.6) then
if current>=329 and current<369.85 then 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0)+0,-1.5707963267948966+0+0)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0.85)+0,0.5235987755982988+0+0)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(3+0+0,3+-1*sin(sine*3+0.5)+0,-5.75+0+0.5*cos(sine*3+0.5)),angles(0+0+0,-1.5707963705062866+rad(20)*sin(sine*3+0.85)+0,-0.3490658503988659+0+0)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,5+-1*sin(sine*3+0.5)+0,-5+0+0.5*cos(sine*3+0.5)),angles(0+0+0,1.5707963705062866+rad(-20)*sin(sine*3+0)+0,1.5707963267948966+0+0)),deltaTime)
else 
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,0.6981317007977318+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,3.839724354387525+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,-0.8726646259971648+0+0+Spinny/10+Boost/30.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-3+0+0,3+2*sin(sine*0.5+0)+0,-3+2*sin(sine*0.5+0)+0),angles(0+0+0,1.5707963705062866+0+0,2.2689280275926285+0+0+Spinny/10+Boost/30.5)),deltaTime)
end
if not SmoothCamera then
setWalkSpeed(90)
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
setHipHeight(10)
else 
setWalkSpeed(90)
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
end
end

else

s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1,0,0),angles(0,1.5707963267948966,-0.8726646259971648)),deltaTime) 
setWalkSpeed(12)

end
elseif Mode=="NULLVOID" or Mode=="Censored" or Mode=="Gaia" or Mode=="Overseer" or Mode=="Vanguard" or Mode=="Aegleseeker" or Mode=="Fatal" or Mode=="Cascade" or Mode=="Nebulabrasque" or Mode=="Imperial" or Mode=="Tachyon" or Mode=="Dimension" or Mode=="Lexapriatic" or Mode=="Cheatreal" or Mode=="HYPERINTERVENTIC" or Mode=="Horion" or Mode=="Zionihilic" or Mode=="Axius" then 
if Mode=="Nebulabrasque" then 
setWalkSpeed(20)
else
setWalkSpeed(90)
end
if Mode~="Vanguard" or Mode~="Cheatreal" then
if WingAnimations[AnimType] then
WingAnimations[AnimType]()
end
end
if Mode=="NULLVOID" then
if not SmoothCamera then
setHipHeight(15)
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,15,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Censored" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,9,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Axius" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,7,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Zionihilic" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Horion" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,7,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Lexapriatic" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,12,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Dimension" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Gaia" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Imperial" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,5,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Tachyon" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,5,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
end
elseif Mode=="Fatal" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)

end
elseif Mode=="Cheatreal" then
if not SmoothCamera then 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/20.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/20.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/20.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/20.5)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,.6981317007977318+Spinny/10+Boost/20.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/20.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/5.20)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/20.5)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)

end
elseif Mode=="HYPERINTERVENTIC" then
if not SmoothCamera then 
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,.6981317007977318+Spinny/10+Boost/20.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/20.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/20.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/20.5)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/20.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/20.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/5.20)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/20.5)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)

end
elseif Mode=="Nebulabrasque" then
if not SmoothCamera then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,2.5+0,0),angles(-0.2038755275634824+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.25+0,0.529+0),angles(-0.44313157631444183+0,0,-0.33928150308035837+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.25+0,0.529+0),angles(-0.44313157631444183+0,0,0.33928150308035837+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0,0),angles(-0.6401259217269339+0,0.22016576437216626+0,0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.537506103515625+0,-0.5562744140625+0),angles(-0.41665900939394906+0,-0.5903342901959329+0,0)),angles(0,rad(90),0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,2+0,0),angles(-0.2038755275634824+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.25+0,0.529+0),angles(-0.44313157631444183+0,0,-0.33928150308035837+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.25+0,0.529+0),angles(-0.44313157631444183+0,0,0.33928150308035837+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0,0),angles(-0.6401259217269339+0,0.22016576437216626+0,0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.537506103515625+0,-0.5562744140625+0),angles(-0.41665900939394906+0,-0.5903342901959329+0,0)),angles(0,rad(90),0)),deltaTime)  

end
elseif Mode=="Cascade" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,8,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)

end
elseif Mode=="Overseer" then
if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,4,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)

end
elseif Mode=="Vanguard" then

local s=SWAtt1
s.C0=cf(1,1,-1)*angles(rad(-50),rad(90),rad(0))
s.C1=cf_0
s.Part1=getPart("Right Arm")
local s1=SWAtt4
s1.C0=cf(-1,1,-1)*angles(rad(-50),rad(-90),rad(0))
s1.C1=cf_0
s1.Part1=getPart("Left Arm")

s1_2.C0=Lerp(s1_2.C0,cfMul(cf(2.5,3.5,-3),angles(0,-1.5707963267948966+0.17453292519943295*sin((sine+0.65)*1.5),-0.6981317007977318-0.17453292519943295*sin((sine+1)*1.5))),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-2.5,3.5,-3),angles(0,1.5707963267948966-0.17453292519943295*sin((sine+0.65)*1.5),0.6981317007977318+0.17453292519943295*sin((sine+1)*1.5))),deltaTime)  

if not SmoothCamera then 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)
else
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,-0.25,0),angles(-0.8726646259971648,0.3490658503988659,0.17453292519943295)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.1,-0.5),angles(-0.5235987755982988,0.3490658503988659,0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,-0.2,0),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-1.25,0.35),angles(-0.6981317007977318,-0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,3,0),angles(-2.443460952792061,0,3.141592653589793)),deltaTime)

end
end
else 
setWalkSpeed(12)
end



elseif not Jump or not Fall then

if IsSitting or Retroify then return end
if OverrideAnimation==true then return end
if OverrideWingAnim==false then
if WingAnimations[AnimType] then
WingAnimations[AnimType]()
end
end


--// Body Anims
if Mode=="Iviriza" then
if SpecialAnimRThingy==0 then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1+0.15*sin(sine*2+0)+0,0),angles(-2.2689280275926285+rad(5)*cos(sine*2+0)+0,0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(rad(-110)+rad(5)*cos(sine*2+0)+0,0.08726646259971647+rad(5)*sin(sine*2+0)+0,3.3161255787892263+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.5+0,0.25+-0.15*sin(sine*2+0.5)+0,-0.75+-0.15*sin(sine*2+0.5)+0),angles(0,-1.0471975511965976+0,-1.0471975511965976+rad(5)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,0.5+0,0.2+0),angles(-0.08726646259971647+0,-0.5235987755982988+rad(-7.5)*cos(sine*2+0)+0,1.5707963267948966+rad(-5.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0.1*sin(sine*2+0)+0,-1.2+0,0.5+0.15*sin(sine*2+0)+0),angles(-1.0471975511965976+rad(-5)*cos(sine*2+0.5)+0,-1.2217304763960306+0,-0.5235987755982988+rad(5)*cos(sine*2+0.75)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.25+-0.1*sin(sine*2+0)+0,-0.15*sin(sine*2+0.5)+0,-1+-0.15*sin(sine*2+0.5)+0),angles(0.08726646259971647+rad(-5)*cos(sine*2+0)+0,1.0471975511965976+0,0.5235987755982988+rad(5)*cos(sine*2+0)+0)),deltaTime)  
elseif SpecialAnimRThingy==1 then

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.75,0,0),angles(-0.5235987755982988+0.09599310885968812*sin((sine+0.4)*1000),0.3490658503988659,-0.17453292519943295+0.1832595714594046*sin((sine+0.75)*1000))),.45)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.45,0,0.5),angles(-0.5235987755982988+0.17453292519943295*sin((sine+0.2)*1000),-0.3490658503988659,-0.17453292519943295*sin((sine+0.9)*1000))),.45)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.2217304763960306-0.17453292519943295*sin((sine+0.85)*1000),0.17453292519943295*sin((sine+0.1)*1000),3.141592653589793-0.2617993877991494*sin((sine+0.75)*1000))),.45)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.25,0),angles(-1.2217304763960306,-0.08726646259971647,3.3161255787892263)),.45)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-0.85,0.5),angles(-1.2217304763960306,-0.3490658503988659,-0.17453292519943295)),.45)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-1,0.1),angles(-0.3490658503988659,-0.3490658503988659,-0.08726646259971647)),.45)  
elseif SpecialAnimRThingy==2 then

RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.5,-1,0.5),angles(-0.17453292519943295,-0.17453292519943295,0.17453292519943295)),.4)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.35,0,-0.25),angles(-0.5235987755982988,-0.3490658503988659,-0.17453292519943295)),.4)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.1,5),angles(-1.7453292519943295,0,0)),.4)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3962634015954636,0+mrandom(-1,1),3.141592653589793+mrandom(-1,1))),.4)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.35,0.1,-0.3),angles(-0.5235987755982988,0.3490658503988659,0.3490658503988659)),.4)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-1,0.2),angles(-0.5235987755982988,0.3490658503988659,-0.3490658503988659)),.4) 
elseif SpecialAnimRThingy==3 then

LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.35,-1.25),angles(0,0.3490658503988659,2.2689280275926285)),.45)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.85,-1,0.5),angles(-0.9599310885968813,-0.3490658503988659,-0.17453292519943295)),.45)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.9198621771937625-0.2617993877991494*sin((sine+0.8)*1000),0.2181661564992912*sin((sine+0.1)*1000),3.141592653589793-0.26529004630313807*sin((sine+0.74)*1000))),.45)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.6,-1.15,0),angles(0,-0.3490658503988659,-0.08726646259971647)),.45)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.5,0,0.75),angles(-0.5235987755982988+0.17453292519943295*sin((sine+0.8)*1000),-0.5235987755982988,0.3490658503988659-0.1308996938995747*sin((sine+0.1)*1000))),.45)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(-1,-0.15,-1),angles(-1.3962634015954636,-0.08726646259971647,3.839724354387525)),.45)  
elseif SpecialAnimRThingy==4 then

RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(3,-0.35,0),angles(-1.3962634015954636,0.04363323129985824,2.2689280275926285)),.45)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0,-1.25),angles(0,-0.3490658503988659,-2.0943951023931953)),.45)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.75,-0.2,0.25),angles(-1.2217304763960306,0.3490658503988659,-0.17453292519943295)),.45)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.35,-0.65,-0.35),angles(0,-0.3490658503988659,0.17453292519943295)),.45)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,-0.17453292519943295,3.141592653589793)),.45)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-1,0.75),angles(-0.6981317007977318,0.3490658503988659,-0.2181661564992912)),.45)  
elseif SpecialAnimRThingy==5 then

RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.25,-2),angles(-2.0943951023931953,0,3.141592653589793)),.45)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.45,-0.35,0.5),angles(-1.2217304763960306,-0.3490658503988659,0.17453292519943295)),.45)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.45,-0.2,0.5),angles(-1.2217304763960306,0.3490658503988659,-0.3490658503988659)),.45)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.5,-0.75,-0.5),angles(0.5235987755982988,-0.3490658503988659,0)),.45)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976+0.17453292519943295*sin((sine+0.65)*100),-0.2617993877991494*sin((sine+0.8)*1000),3.141592653589793+0.17453292519943295*sin((sine+0.4)*1000))),.45)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-1.25,0),angles(-0.5235987755982988,0.3490658503988659,0)),.45)  
end

elseif Mode=="NULLVOID" then
if not SmoothCamera then
if SpecialAnimRThingy==0 then
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2+0,5+0,-5.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+rad(95)*cos(sine*1+0)+Boost/40)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2+0,5+0,-5.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+rad(95)*cos(sine*1+0)+Boost/40)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.890106201171875+0,1.5+0),angles(-0.32324927331808134+0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1*sin(sine*2+0)+0,0),angles(0.298050336557308+rad(10)*sin(sine*2+0)+0,0.6085789676654041+rad(-10)*cos(sine*2+0)+0,-0.21202288302313999+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.2837779236433553+rad(-15)*cos(sine*2+0)+0,rad(-10)*sin(sine*2+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.1729232788085937+0.15*sin(sine*2+0)+0,0),angles(0.9331003797729944+0,0.6431891961391868+rad(-15)*cos(sine*2+0)+0,1.2217304763960306+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.0593780517578124+0,-0.6442642211914062+0.15*sin(sine*2+0)+0,-0.22761077880859376+0),angles(2.270889285945806+0,0.09748639654611728+0,-0.9432715246082252+rad(-15)*cos(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.1541645050048828+0,-1+0.2*sin(sine*2+0)+0,-0.04166679382324219+0),angles(0.03496815732428923+rad(20)*cos(sine*2+0)+0,0.39833976341395555+0,-0.0733019643709988+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.3885498046875+0.15*sin(sine*2+0)+0,-0.780224609375+0),angles(-0.34311507020630566+rad(-10)*sin(sine*2+0)+0,-0.4184382140550091+0,0.33444498948788726+0)),angles(0,rad(90),0)),deltaTime)  
setHipHeight(15)
elseif SpecialAnimRThingy==1 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/5.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/5.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/5.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/5.5)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.600000023841858,-0.20000000298023224+0.1*sin(sine*2.5),-0.25),angles(-0.17453292519943295+0.17453292519943295*sin(sine*2.5),-0.7853981633974483+0.08726646259971647*sin(sine*2.5),-1.4835298641951802+0.17453292519943295*sin(sine*2.5))),angles(0,-1.5707963267948966,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.100000023841858,-0.5+0.1*sin(sine*2.5),-0.125),angles(2.007128639793479+-0.4363323129985824*sin(sine*2.5),0.5235987755982988+0.17453292519943295*cos(sine*2.5),0.4363323129985824+-0.17453292519943295*cos(sine*2.5))),angles(0,1.5707963267948966,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.4363323129985824+-0.17453292519943295*sin(sine*2.5),0.7853981633974483,0.17453292519943295)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,-0.800000011920929+0.2*sin(sine*2.5),-0.30000001192092896),angles(-0.2617993877991494+0.17453292519943295*cos(sine*2.5),-0.5235987755982988,0.2617993877991494+0.17453292519943295*sin(sine*2.5))),angles(0,1.5707963267948966,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.5,-0.3499999940395355+-0.2*cos(sine*2.5),-0.6000000238418579),angles(-0.5235987755982988,0.6108652381980153,0.3490658503988659)),angles(0,-1.5707963267948966,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1-1*sin(sine*2.5),0),angles(0.17453292519943295+-0.17453292519943295*cos(sine*2.5),-0.7853981633974483,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)

setHipHeight(15)
elseif SpecialAnimRThingy==2 then
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/40)),deltaTime)  end)
local att=Extra_Part1
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,1.75+0),angles(1.5707963267948966+0,0,0))

AttachSword(SWAtt3,wingPart2,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,-1.5707963267948966+Spinny/10+Boost/40)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/40)),deltaTime)  end)
local att=Extra_Part2
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,2+0),angles(1.5707963267948966+0,0,0))

AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/40)),deltaTime)  end)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.75*sin(sine*2+0)+0,0),angles(-1.5707963267948966+rad(7.5)*cos(sine*2+0)+0,rad(7.5)*cos(sine*2+0)+0,2.443460952792061+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(7.5)*sin(sine*2+0)+0,-0.08726646259971647+rad(10)*sin(sine*2+0.5)+0,3.839724354387525+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.35+0.2*sin(sine*2+0)+0,0),angles(0,-0.8726646259971648+0,-1.3962634015954636+rad(20)*cos(sine*2+1)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,0.2+0.25*sin(sine*2+0)+0,0.25+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,1.5707963267948966+rad(-15)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.25+0,-0.09999999999999998+-0.25*cos(sine*2+0.5)+0,-0.45+0),angles(-0.17453292519943295+rad(5)*sin(sine*2+0)+0,-0.8726646259971648+0,0.08726646259971647+rad(-5)*sin(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.1+0,-1+-0.1*cos(sine*2+0)+0,0.2+0),angles(-0.3490658503988659+rad(5)*sin(sine*2+0)+0,0.8726646259971648+0,0.2617993877991494+rad(-5)*sin(sine*2+0)+0)),deltaTime)  
setHipHeight(15)
elseif SpecialAnimRThingy==5 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,sp/10+Boost/30.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+sp/10+Boost/30.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+sp/10+Boost/30.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+sp/10+Boost/30.5)),deltaTime)
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
--AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/12)),deltaTime)  end)
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),0.3490658503988659,-0.6108652381980153+0.17453292519943295*sin(sine*2))),angles(0,-1.5707963267948966,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),-0.3490658503988659,0.6108652381980153+-0.17453292519943295*sin(sine*2))),angles(0,1.5707963267948966,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.2617993877991494+-0.17453292519943295*sin(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,-0.8999999761581421+0.1*sin(sine*2),-0.25),angles(-0.3490658503988659+-0.13962634015954636*sin(sine*2),-0.2617993877991494,-0.05235987755982989)),angles(0,1.5707963267948966,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.100000023841858,-0.25+0.1*sin(sine*2),-0.8999999761581421),angles(-0.5235987755982988+-0.17453292519943295*sin(sine*2),0.3490658503988659,0.03490658503988659)),angles(0,-1.5707963267948966,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1*sin(sine*2),0),angles(-0.2181661564992912+-0.17453292519943295*cos(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)
setHipHeight(15)
elseif SpecialAnimRThingy==6 then
s1_1.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_2.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_3.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_4.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
--OverrideAnimation=true
Neck.C0=cfMul(cfMul(cf(0,1,0),angles((random(-0.04363323129985824,0.04363323129985824))+0.7853981633974483+0.17453292519943295*cos((sine*3)),(random(-0.08726646259971647,0.08726646259971647))+0,(random(-0.04363323129985824,0.04363323129985824))+0)),angles(-1.5707963705062866,0,-3.141592502593994))RootJoint.C0=cfMul(cfMul(cf((random(-1,1))+0,(random(-1,1))+0+0.25*sin((sine*3)),(random(-1,1))+0),angles((random(-0.1,0.1))+0.4363323129985824,(random(-0.1,0.1))+0,(random(-0.1,0.1))+0)),angles(-1.5707963705062866,0,-3.141592502593994))LeftShoulder.C0=cfMul(cfMul(cf(-0.8,0.25,0.25),angles(1.1344640137963142,0.7853981633974483,-0.8726646259971648)),angles(-0,-1.5707963705062866,0))RightHip.C0=cfMul(cfMul(cf(0.9,0,-1.1),angles(-0.7853981633974483+0.08726646259971647*cos((sine*3)),-0.4363323129985824,0.08726646259971647)),angles(0,1.5707963705062866,0))LeftHip.C0=cfMul(cfMul(cf(-1,-0.9,-0.45),angles(-0.5235987755982988+0.08726646259971647*cos((sine*3)),0,-0.08726646259971647)),angles(-0,-1.5707963705062866,0))RightShoulder.C0=cfMul(cfMul(cf(0.8,0.25,0.25),angles(1.1344640137963142,-0.7853981633974483,0.8726646259971648)),angles(0,1.5707963705062866,0))
setHipHeight(15)
elseif SpecialAnimRThingy==3 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/12)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/12)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/12)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/12)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295,2.2689280275926285)),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,0.5,0),angles(-1.0471975511965976*sin(sine*-1.75),-1.9198621771937625,-2.6179938779914944-1.0471975511965976*sin(sine*-1.75))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+1*sin(sine*1.75),0),angles(-1.5707963267948966,0.5235987755982988+0.08726646259971647*sin(sine*2.5),4.014257279586958)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.1*sin(sine*1.75),-0.25 * sin(sine*1.75)),angles(-0.7853981633974483+0.2617993877991494*sin(sine*-1.75),1.2217304763960306,0.7853981633974483-0.7853981633974483*sin(sine*-1.75))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.75+0.25*sin(sine*1.75),-0.75-0.25*sin(sine*1.75)),angles(0,-1.2217304763960306,0.3490658503988659-0.5235987755982988*sin(sine*1.75))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5+0.1*sin(sine*1.75),0),angles(-0.5235987755982988+0.17453292519943295*sin(sine*2.5),1.0471975511965976-0.3490658503988659*sin(sine*1.75),0.5235987755982988-0.17453292519943295*sin(sine*1.75))),deltaTime) 
setHipHeight(15)
elseif SpecialAnimRThingy==4 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/12)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/12)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/12)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/12)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,0,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295,2.2689280275926285)),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,0.5,0),angles(-1.0471975511965976*sin(sine*-1.75),-1.9198621771937625,-2.6179938779914944-1.0471975511965976*sin(sine*-1.75))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+1*sin(sine*1.75),0),angles(-1.5707963267948966,0.5235987755982988+0.08726646259971647*sin(sine*2.5),4.014257279586958)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.1*sin(sine*1.75),-0.25 * sin(sine*1.75)),angles(-0.7853981633974483+0.2617993877991494*sin(sine*-1.75),1.2217304763960306,0.7853981633974483-0.7853981633974483*sin(sine*-1.75))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.75+0.25*sin(sine*1.75),-0.75-0.25*sin(sine*1.75)),angles(0,-1.2217304763960306,0.3490658503988659-0.5235987755982988*sin(sine*1.75))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5+0.1*sin(sine*1.75),0),angles(-0.5235987755982988+0.17453292519943295*sin(sine*2.5),1.0471975511965976-0.3490658503988659*sin(sine*1.75),0.5235987755982988-0.17453292519943295*sin(sine*1.75))),deltaTime) 
setHipHeight(15)
end
else 
if SpecialAnimRThingy==0 then
AttachSword(SWAtt2,wingPart1,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-2+0,5+0,-5.6+0),angles(0,1.5707963267948966+0,2.2689280275926285+rad(95)*cos(sine*1+0)+Boost/40)),deltaTime)  end)
Extra_Part1.C0=cfMul(cf(0,0.5+0,-2+0),angles(0,0,0))
Extra_Part1.C1=cf_0
Extra_Part1.Part1=Torso

AttachSword(SWAtt3,wingPart1,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,0.6981317007977318+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt1,wingPart1,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1+0,3+0,-3.6+0),angles(0,1.5707963267948966+0,-2.443460952792061+rad(ClockTicky))),deltaTime)  end)
AttachSword(SWAtt4,wingPart1,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-2+0,5+0,-5.6+0),angles(0,1.5707963267948966+0,-0.8726646259971648+rad(95)*cos(sine*1+0)+Boost/40)),deltaTime)  end)
Extra_Part2.C0=cfMul(cf(0,0.890106201171875+0,1.5+0),angles(-0.32324927331808134+0,0,0))
Extra_Part2.Part1=Torso
Extra_Part2.C1=cf_0
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+1*sin(sine*2+0)+0,0),angles(0.298050336557308+rad(10)*sin(sine*2+0)+0,0.6085789676654041+rad(-10)*cos(sine*2+0)+0,-0.21202288302313999+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.2837779236433553+rad(-15)*cos(sine*2+0)+0,rad(-10)*sin(sine*2+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.1729232788085937+0.15*sin(sine*2+0)+0,0),angles(0.9331003797729944+0,0.6431891961391868+rad(-15)*cos(sine*2+0)+0,1.2217304763960306+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.0593780517578124+0,-0.6442642211914062+0.15*sin(sine*2+0)+0,-0.22761077880859376+0),angles(2.270889285945806+0,0.09748639654611728+0,-0.9432715246082252+rad(-15)*cos(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.1541645050048828+0,-1+0.2*sin(sine*2+0)+0,-0.04166679382324219+0),angles(0.03496815732428923+rad(20)*cos(sine*2+0)+0,0.39833976341395555+0,-0.0733019643709988+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.3885498046875+0.15*sin(sine*2+0)+0,-0.780224609375+0),angles(-0.34311507020630566+rad(-10)*sin(sine*2+0)+0,-0.4184382140550091+0,0.33444498948788726+0)),angles(0,rad(90),0)),deltaTime)  
elseif SpecialAnimRThingy==1 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/5.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/5.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/5.5)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/5.5)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.600000023841858,-0.20000000298023224+0.1*sin(sine*2.5),-0.25),angles(-0.17453292519943295+0.17453292519943295*sin(sine*2.5),-0.7853981633974483+0.08726646259971647*sin(sine*2.5),-1.4835298641951802+0.17453292519943295*sin(sine*2.5))),angles(0,-1.5707963267948966,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.100000023841858,-0.5+0.1*sin(sine*2.5),-0.125),angles(2.007128639793479+-0.4363323129985824*sin(sine*2.5),0.5235987755982988+0.17453292519943295*cos(sine*2.5),0.4363323129985824+-0.17453292519943295*cos(sine*2.5))),angles(0,1.5707963267948966,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.4363323129985824+-0.17453292519943295*sin(sine*2.5),0.7853981633974483,0.17453292519943295)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,-0.800000011920929+0.2*sin(sine*2.5),-0.30000001192092896),angles(-0.2617993877991494+0.17453292519943295*cos(sine*2.5),-0.5235987755982988,0.2617993877991494+0.17453292519943295*sin(sine*2.5))),angles(0,1.5707963267948966,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.5,-0.3499999940395355+-0.2*cos(sine*2.5),-0.6000000238418579),angles(-0.5235987755982988,0.6108652381980153,0.3490658503988659)),angles(0,-1.5707963267948966,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,15-1*sin(sine*2.5),0),angles(0.17453292519943295+-0.17453292519943295*cos(sine*2.5),-0.7853981633974483,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)
elseif SpecialAnimRThingy==5 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,sp/10+Boost/30.5)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+sp/10+Boost/30.5)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,10*sin(sine*1+0)+0,4-12*sin(sine/2+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+sp/10+Boost/30.5)),deltaTime)
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),0.3490658503988659,-0.6108652381980153+0.17453292519943295*sin(sine*2))),angles(0,-1.5707963267948966,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),-0.3490658503988659,0.6108652381980153+-0.17453292519943295*sin(sine*2))),angles(0,1.5707963267948966,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.2617993877991494+-0.17453292519943295*sin(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,-0.8999999761581421+0.1*sin(sine*2),-0.25),angles(-0.3490658503988659+-0.13962634015954636*sin(sine*2),-0.2617993877991494,-0.05235987755982989)),angles(0,1.5707963267948966,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.100000023841858,-0.25+0.1*sin(sine*2),-0.8999999761581421),angles(-0.5235987755982988+-0.17453292519943295*sin(sine*2),0.3490658503988659,0.03490658503988659)),angles(0,-1.5707963267948966,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,15+1*sin(sine*2),0),angles(-0.2181661564992912+-0.17453292519943295*cos(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)
elseif SpecialAnimRThingy==6 then
s1_1.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_2.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_3.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_4.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
--OverrideAnimation=true
Neck.C0=cfMul(cfMul(cf(0,1,0),angles((random(-0.04363323129985824,0.04363323129985824))+0.7853981633974483+0.17453292519943295*cos((sine*3)),(random(-0.08726646259971647,0.08726646259971647))+0,(random(-0.04363323129985824,0.04363323129985824))+0)),angles(-1.5707963705062866,0,-3.141592502593994))RootJoint.C0=cfMul(cfMul(cf((random(-1,1))+0,15+(random(-1,1))+0+0.25*sin((sine*3)),(random(-1,1))+0),angles((random(-0.1,0.1))+0.4363323129985824,(random(-0.1,0.1))+0,(random(-0.1,0.1))+0)),angles(-1.5707963705062866,0,-3.141592502593994))LeftShoulder.C0=cfMul(cfMul(cf(-0.8,0.25,0.25),angles(1.1344640137963142,0.7853981633974483,-0.8726646259971648)),angles(-0,-1.5707963705062866,0))RightHip.C0=cfMul(cfMul(cf(0.9,0,-1.1),angles(-0.7853981633974483+0.08726646259971647*cos((sine*3)),-0.4363323129985824,0.08726646259971647)),angles(0,1.5707963705062866,0))LeftHip.C0=cfMul(cfMul(cf(-1,-0.9,-0.45),angles(-0.5235987755982988+0.08726646259971647*cos((sine*3)),0,-0.08726646259971647)),angles(-0,-1.5707963705062866,0))RightShoulder.C0=cfMul(cfMul(cf(0.8,0.25,0.25),angles(1.1344640137963142,-0.7853981633974483,0.8726646259971648)),angles(0,1.5707963705062866,0))

elseif SpecialAnimRThingy==2 then
Ring.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))
Ring1.C0=cf(0,.6,.5)*angles(rad(0),rad(0),rad(0))


AttachSword(SWAtt2,wingPart2,function() s1_2.C0=Lerp(s1_2.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/40)),deltaTime)  end)
local att=Extra_Part1
att.Part1=getPart("Left Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,1.75+0),angles(1.5707963267948966+0,0,0))

AttachSword(SWAtt3,wingPart2,function() s1_3.C0=Lerp(s1_3.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,-1.5707963267948966+Spinny/10+Boost/40)),deltaTime)  end)
AttachSword(SWAtt1,wingPart2,function() s1_1.C0=Lerp(s1_1.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/40)),deltaTime)  end)
local att=Extra_Part2
att.Part1=getPart("Right Arm")
att.C1=cf_0
att.C0=cfMul(cf(0,0,2+0),angles(1.5707963267948966+0,0,0))

AttachSword(SWAtt4,wingPart2,function() s1_4.C0=Lerp(s1_4.C0,cfMul(cf(1+0,1+10*sin(sine*1+0)+0,1+-10*sin(sine*0.5+1)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/40)),deltaTime)  end)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,15+0.75*sin(sine*2+0)+0,0),angles(-1.5707963267948966+rad(7.5)*cos(sine*2+0)+0,rad(7.5)*cos(sine*2+0)+0,2.443460952792061+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(7.5)*sin(sine*2+0)+0,-0.08726646259971647+rad(10)*sin(sine*2+0.5)+0,3.839724354387525+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.35+0.2*sin(sine*2+0)+0,0),angles(0,-0.8726646259971648+0,-1.3962634015954636+rad(20)*cos(sine*2+1)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,0.2+0.25*sin(sine*2+0)+0,0.25+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,1.5707963267948966+rad(-15)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.25+0,-0.09999999999999998+-0.25*cos(sine*2+0.5)+0,-0.45+0),angles(-0.17453292519943295+rad(5)*sin(sine*2+0)+0,-0.8726646259971648+0,0.08726646259971647+rad(-5)*sin(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.1+0,-1+-0.1*cos(sine*2+0)+0,0.2+0),angles(-0.3490658503988659+rad(5)*sin(sine*2+0)+0,0.8726646259971648+0,0.2617993877991494+rad(-5)*sin(sine*2+0)+0)),deltaTime)  
elseif SpecialAnimRThingy==3 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/12)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/12)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/12)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/12)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295,2.2689280275926285)),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,0.5,0),angles(-1.0471975511965976*sin(sine*-1.75),-1.9198621771937625,-2.6179938779914944-1.0471975511965976*sin(sine*-1.75))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,15+1*sin(sine*1.75),0),angles(-1.5707963267948966,0.5235987755982988+0.08726646259971647*sin(sine*2.5),4.014257279586958)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.1*sin(sine*1.75),-0.25 * sin(sine*1.75)),angles(-0.7853981633974483+0.2617993877991494*sin(sine*-1.75),1.2217304763960306,0.7853981633974483-0.7853981633974483*sin(sine*-1.75))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.75+0.25*sin(sine*1.75),-0.75-0.25*sin(sine*1.75)),angles(0,-1.2217304763960306,0.3490658503988659-0.5235987755982988*sin(sine*1.75))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5+0.1*sin(sine*1.75),0),angles(-0.5235987755982988+0.17453292519943295*sin(sine*2.5),1.0471975511965976-0.3490658503988659*sin(sine*1.75),0.5235987755982988-0.17453292519943295*sin(sine*1.75))),deltaTime)
elseif SpecialAnimRThingy==4 then
s1_2.C0=Lerp(s1_2.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,Spinny/10+Boost/12)),deltaTime)  
s1_3.C0=Lerp(s1_3.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,3.141592653589793+Spinny/10+Boost/12)),deltaTime)  
s1_1.C0=Lerp(s1_1.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,4.71238898038469+Spinny/10+Boost/12)),deltaTime)  
s1_4.C0=Lerp(s1_4.C0,cfMul(cf(-1.5+0,7*sin(sine*1+0)+0,-9*sin(sine*0.5+0)+0),angles(0,1.5707963267948966+0,1.5707963267948966+Spinny/10+Boost/12)),deltaTime)  
Extra_Part2.C0=Lerp(Extra_Part1.C0,cf(0,130,-1)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.C0=Lerp(Extra_Part1.C0,cf(0,-.5,-2)*angles(rad(0),rad(0),rad(0)),deltaTime)
Extra_Part1.Part1=Torso
Extra_Part2.Part1=Torso
SWAtt2.Part1=Torso
SWAtt3.Part1=Torso
SWAtt1.Part1=Torso
SWAtt4.Part1=Torso

SWAtt2.C1=cf_0
SWAtt3.C1=cf_0
SWAtt1.C1=cf_0
SWAtt4.C1=cf_0
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295,2.2689280275926285)),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,0.5,0),angles(-1.0471975511965976*sin(sine*-1.75),-1.9198621771937625,-2.6179938779914944-1.0471975511965976*sin(sine*-1.75))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,15+1*sin(sine*1.75),0),angles(-1.5707963267948966,0.5235987755982988+0.08726646259971647*sin(sine*2.5),4.014257279586958)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.1*sin(sine*1.75),-0.25 * sin(sine*1.75)),angles(-0.7853981633974483+0.2617993877991494*sin(sine*-1.75),1.2217304763960306,0.7853981633974483-0.7853981633974483*sin(sine*-1.75))),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.75+0.25*sin(sine*1.75),-0.75-0.25*sin(sine*1.75)),angles(0,-1.2217304763960306,0.3490658503988659-0.5235987755982988*sin(sine*1.75))),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5+0.1*sin(sine*1.75),0),angles(-0.5235987755982988+0.17453292519943295*sin(sine*2.5),1.0471975511965976-0.3490658503988659*sin(sine*1.75),0.5235987755982988-0.17453292519943295*sin(sine*1.75))),deltaTime)
end
end




elseif Mode=="Mayhem" then
if LEGACY then 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.5,-1-0.15*sin(sine*3.5),0.35-0.1*sin(sine*3.5)),angles(-0.4363323129985824+0.09599310885968812*sin(sine*3.5),0,0.17453292519943295)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.045*sin((sine+0.5)*3.5),0),angles(-1.7453292519943295,0,3.7524578917878086)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.15 * sin(sine*3.5),0),angles(-1.7453292519943295,0,2.530727415391778)),deltaTime) LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-0.95-0.15*sin(sine*3.5),-0.25+0.15*sin(sine*3.5)),angles(0.17453292519943295,0,-0.17453292519943295)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,1.25+0.15*sin(sine*3.5),0.5),angles(2.6179938779914944,-0.3490658503988659,0.5235987755982988)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.35,0.5-0.1*sin((sine+0.75)*3.5),-0.5),angles(0,0.3490658503988659,0.5235987755982988+0.09599310885968812*sin((sine+1)*3.5))),deltaTime) 
else
if AnimStyles==0 then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.15*cos(sine*1.5+0)+0,0),angles(-1.5707963267948966+rad(-5)*sin(sine*1.5+0)+0,0,2.792526803190927+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(5)*cos(sine*1.5+0)+0,-0.08726646259971647+rad(-5)*sin(sine*1+0)+0,3.490658503988659+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.9+0,-0.19999999999999996+0.15*sin(sine*1.5+0.2)+0,0),angles(0,-2.9670597283903604+0,-1.5707963267948966+rad(-7.5)*sin(sine*1.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,0.09999999999999998+0.2*sin(sine*1.5+0)+0,-0.25+0),angles(0,2.9670597283903604+0,1.9198621771937625+rad(5)*cos(sine*1.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.1+0,-1+-0.15*cos(sine*1.5+0)+0,-0.1*sin(sine*1.5+0)+0),angles(rad(5)*sin(sine*1.5+0)+0,-0.8726646259971648+0,-0.08726646259971647+rad(-5)*sin(sine*1.5+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.15*cos(sine*1.5+0)+0,-0.1*sin(sine*1.5+0)+0),angles(-0.5235987755982988+rad(5)*sin(sine*1.5+0)+0,1.2217304763960306+0,0.17453292519943295+rad(-5)*sin(sine*1.5+0)+0)),deltaTime)  
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.15*cos(sine*2+0)+0,0),angles(-1.7453292519943295+0,0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.5707963267948966+rad(-2.5)*cos(sine*2+0)+0,-0.08726646259971647+rad(-5)*sin(sine*2+0)+rad(5.5)*cos(sine*10000+0),3.839724354387525+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,1.5+0.2*sin(sine*2+0)+0,0.5+0),angles(2.6179938779914944+rad(-5.5)*cos(sine*2+0)+0,-0.2617993877991494+0,0.2617993877991494+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.5+0,0.25*sin(sine*2+0)+0,0),angles(-0.3490658503988659+rad(7.5)*cos(sine*2+0)+0,0.3490658503988659+0,0.3490658503988659+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*2+0)+0,-0.35+0),angles(0.08726646259971647+0,-0.3490658503988659+0,-0.2617993877991494+rad(5)*cos(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75+0,-1.25+-0.15*cos(sine*2+0)+0,0.5+0),angles(-0.4363323129985824+rad(5)*cos(sine*2+0)+0,0.3490658503988659+0,0.3490658503988659+0)),deltaTime)  
end
end

elseif Mode=="Gaia" then
if not SmoothCamera then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.25*cos(sine*2.5+0)+0,0),angles(-1.3089969389957472+rad(5)*cos(sine*2.5+0)+0,-0.08726646259971647+rad(5)*sin(sine*2.5+0)+0,3.6651914291880923+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-6)*sin(sine*2.5+0)+0,0.17453292519943295+rad(-5.5)*cos(sine*2.5+0)+0,2.443460952792061+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,0.35+0.25*cos(sine*2.5+0)+0,0.25+0),angles(0.17453292519943295+0,-0.5235987755982988+0,0.8726646259971648+rad(5.5)*cos(sine*2.5+0.75)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2+0,1+0.15*cos(sine*2.5+0)+0,0.5+0),angles(-0.17453292519943295+0,2.6179938779914944+0,2.792526803190927+rad(5)*sin(sine*2.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.35+0,-1+0.15*sin(sine*2.5+0)+0,0),angles(-0.8726646259971648+rad(-5)*sin(sine*2.5+0)+0,-1.2217304763960306+0,-0.5235987755982988+rad(5)*sin(sine*2.5+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,0.25+0.15*sin(sine*2.5+0)+0,-0.75+0),angles(-0.17453292519943295+rad(-10)*cos(sine*2.5+0)+0,0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10+0.25*cos(sine*2.5+0)+0,0),angles(-1.3089969389957472+rad(5)*cos(sine*2.5+0)+0,-0.08726646259971647+rad(5)*sin(sine*2.5+0)+0,3.6651914291880923+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-6)*sin(sine*2.5+0)+0,0.17453292519943295+rad(-5.5)*cos(sine*2.5+0)+0,2.443460952792061+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,0.35+0.25*cos(sine*2.5+0)+0,0.25+0),angles(0.17453292519943295+0,-0.5235987755982988+0,0.8726646259971648+rad(5.5)*cos(sine*2.5+0.75)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2+0,1+0.15*cos(sine*2.5+0)+0,0.5+0),angles(-0.17453292519943295+0,2.6179938779914944+0,2.792526803190927+rad(5)*sin(sine*2.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.35+0,-1+0.15*sin(sine*2.5+0)+0,0),angles(-0.8726646259971648+rad(-5)*sin(sine*2.5+0)+0,-1.2217304763960306+0,-0.5235987755982988+rad(5)*sin(sine*2.5+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,0.25+0.15*sin(sine*2.5+0)+0,-0.75+0),angles(-0.17453292519943295+rad(-10)*cos(sine*2.5+0)+0,0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  
end
elseif Mode=="Chromatic" then

RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.2*sin(sine*2+0)+0,0),angles(rad(-5)*cos(sine*2+0)+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(-10)*sin(sine*2+0)+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.484375+0.1*cos(sine*2+0)+0,-0.6901046752929688+0),angles(0.38942658935123475+0,-0.026631397847905164+0,1.7287463870450677+rad(10)*sin(sine*2+1)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.5+0.1*cos(sine*2+0)+0,-0.34687347412109376+0),angles(0.33445020928362384+0,-0.34845342987459127+0,-1.9788640850386934+rad(-5)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.0562530517578126+0,-1+-0.2*sin(sine*2+0)+0,0),angles(-0.38255137268108624+rad(10)*cos(sine*2+0)+0,0.24587773248533248+0,-0.310269878376584+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-1.0741363525390626+-0.2*sin(sine*2+0)+0,0),angles(0.17453292519943295+rad(10)*cos(sine*2+0)+0,-0.3542951269889019+0,0.2275435728032346+0)),angles(0,rad(90),0)),deltaTime)    



elseif Mode=="Layers" then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.2*cos(sine*3+0)+0,0),angles(-1.9198621771937625+0,0.08726646259971647+0,2.2689280275926285+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.4835298641951802+rad(5)*cos(sine*3+0)+0,0.08726646259971647+rad(5)*sin(sine*3+0)+0,4.014257279586958+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.25+0.2*sin(sine*3+0)+0,0.35+0),angles(0.3490658503988659+rad(-5)*sin(sine*3+0)+0,-0.3490658503988659+0,0.8726646259971648+rad(-5)*cos(sine*3+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.5+0.15*sin(sine*3+0)+0,0),angles(-0.17453292519943295+rad(5)*sin(sine*3+0)+0,-0.08726646259971647+0,1.7453292519943295+rad(-7.5)*cos(sine*3+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.25+0,-0.9+-0.2*cos(sine*3+0)+0,-0.35+0),angles(0.17453292519943295+rad(2)*cos(sine*3+0)+0,-0.8726646259971648+0,-0.3490658503988659+rad(-2)*cos(sine*3+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.5+-0.2*cos(sine*3+0)+0,0.15+0),angles(-0.8726646259971648+rad(5)*cos(sine*3+0)+0,0.8726646259971648+0,0.5235987755982988+0)),deltaTime)  
elseif Mode=="Scourge" then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.5+0.15*sin(sine*3+0)+0,0),angles(-2.0943951023931953+0,-0.08726646259971647+0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3962634015954636+rad(-5.5)*cos(sine*3+0)+0,0.17453292519943295+rad(-5.5)*cos(sine*3+0)+0,3.839724354387525+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.5+-0.25*cos(sine*3+0)+0,-0.25+0),angles(0,-2.0943951023931953+0,-1.8325957145940461+rad(5.5)*sin(sine*3+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.25+-0.2*cos(sine*3+0)+0,0.2+0),angles(-0.3490658503988659+0,-0.3490658503988659+0,1.5707963267948966+rad(-7.5)*sin(sine*3+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.30000000000000004+-0.15*sin(sine*3+0)+0,-0.5+0),angles(rad(2)*sin(sine*3+0)+0,-0.8726646259971648+0,-0.6981317007977318+rad(-2)*sin(sine*3+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.1+-0.15*sin(sine*3+0)+0,0),angles(-0.3490658503988659+rad(2)*sin(sine*3+0)+0,1.2217304763960306+0,0.17453292519943295+rad(2)*sin(sine*3+0)+0)),deltaTime)  

elseif Mode=="Anarchus" then
if AnimStyles==0 then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.25+0.1*sin(sine*2),0),angles(-1.7453292519943295-0.08726646259971647*sin((sine+0.75)*2),-0.08726646259971647+0.08726646259971647*sin((sine+0.75)*2),2.443460952792061)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5+0.2*sin((sine+0.5)*2),0),angles(0.09599310885968812*sin((sine+0.25)*2),0.17453292519943295+0.04363323129985824*sin((sine+0.75)*2),1.7453292519943295-0.09599310885968812*sin((sine+1)*2))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.6,-1.25-0.15*sin(sine*2),0.75-0.2*sin((sine+0.75)*2)),angles(-0.6981317007977318+0.13962634015954636*sin((sine+0.8)*2),0.3490658503988659,0.3490658503988659+0.03490658503988659*sin((sine+0.75)*2))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.4,0.85+0.2*sin((sine+0.45)*2),-0.5),angles(1.5707963267948966-0.09599310885968812*sin((sine+0.65)*2),-0.3490658503988659,0.5235987755982988+0.09599310885968812*sin((sine+0.25)*2))),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-0.9-0.1*sin(sine*2),-0.1 * sin((sine+0.75)*2)),angles(0.17453292519943295+0.13962634015954636*sin((sine+0.8)*2),-0.3490658503988659,-0.4363323129985824-0.026179938779914945*sin((sine+0.75)*2))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.055*sin((sine+0.75)*2),0),angles(-1.6580627893946132-0.09599310885968812*sin((sine+0.75)*2),-0.08726646259971647-0.09599310885968812*sin((sine+0.75)*2),3.9269908169872414)),deltaTime)  
else 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.95,-0.8+0.06*sin((sine+1)*1.1),-0.8),angles(0.4363323129985824-0.04014257279586958*sin((sine+2)*1),-1.3962634015954636-0.026179938779914945*sin((sine+1)*1.2),0.3490658503988659-0.05235987755982989*sin((sine+1)*1))),deltaTime) RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.5-0.03*sin((sine+2)*1.1),0),angles(-2.530727415391778+0.04014257279586958*sin((sine+2)*1),0.12217304763960307-0.026179938779914945*sin((sine+1)*1.2),3.2288591161895095)),deltaTime) RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1-0.04*sin((sine+1)*1.2),0.3-0.04*sin(sine*1),-0.65-0.04*sin((sine+2)*1.2)),angles(-0.3490658503988659,1.3264502315156905-0.03490658503988659*sin((sine+0.5)*1),1.3089969389957472+0.05235987755982989*sin((sine+1)*1.1))),deltaTime) LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.1-0.1*sin((sine+1)*1.2),-0.2+0.1*sin((sine+1)*1.2)),angles(0.6981317007977318,-1.7453292519943295+0.08726646259971647*sin((sine+1)*1.5),-0.17453292519943295+0.17453292519943295*sin(sine*1))),deltaTime) Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.9198621771937625-0.08726646259971647*sin((sine+1)*1.1),-0.03490658503988659-0.08726646259971647*sin((sine+1)*1.2),3.141592653589793)),deltaTime) RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.17-0.03*sin(sine*1),-0.1+0.1*sin(sine*1),0.1 * sin((sine+2)*1)),angles(3.141592653589793+0.08726646259971647*sin((sine+2)*1),1.9198621771937625+0.10471975511965978*sin(sine*1),0.5235987755982988)),deltaTime)
end
elseif Mode=="Vibrance" then
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25,0.75+0.1*sin((sine+0.75)*1.5),-0.45),angles(1.5707963267948966+0.04363323129985824*sin((sine+0.95)*1.5),0.3490658503988659-0.09599310885968812*sin((sine+0.85)*1.5),0.6981317007977318-0.09599310885968812*sin((sine+0.85)*1.5))),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1+0.15*sin(sine*1.5),0),angles(-2.0943951023931953,0,3.141592653589793)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3089969389957472+0.09599310885968812*sin((sine+0.85)*1.5),-0.061086523819801536*sin((sine+0.5)*1.5),3.141592653589793-0.061086523819801536*sin((sine+0.85)*1.5))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75,-0.25-0.15*sin(sine*0.25),-0.3-0.15*sin(sine*1.5)),angles(0.6981317007977318-0.061086523819801536*sin(sine*1.5),0.3490658503988659,0.17453292519943295)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25,0.75+0.15*sin((sine+0.75)*1.5),-0.65),angles(1.9198621771937625-0.09599310885968812*sin((sine+0.65)*1.5),-0.3490658503988659+0.04363323129985824*sin((sine+0.4)*1.5),-0.5235987755982988+0.04363323129985824*sin((sine+0.85)*1.5))),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75,-0.85-0.15*sin(sine*1.5),0.15-0.1*sin(sine*1.5)),angles(-0.7853981633974483+0.04363323129985824*sin(sine*1.5),-0.3490658503988659,-0.17453292519943295)),deltaTime)  

elseif Mode=="Censored" then

if LEGACY then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,10+1*sin((sine+0.5)*2.5),0-2*sin((sine+.45)*2.5)),angles(-1.3962634015954636-0.09599310885968812*sin(sine*2.5),0,3.141592653589793)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.055*sin((sine+0.5)*2.5),0),angles(-1.9198621771937625+0.09599310885968812*sin(sine*2.5),0,3.141592653589793)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.5,0.5+0.15*sin((sine+0.5)*2.5),-0.25),angles(0.6108652381980153+0.17453292519943295*sin((sine+0.65)*2.5),0,-0.4363323129985824+0.09599310885968812*sin((sine+0.5)*2.5))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.5,-0.5+0.15*sin((sine+0.75)*2.5),-0.5),angles(-0.7853981633974483+0.1832595714594046*sin((sine+0.45)*2.5),0,0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-0.25-0.15*sin((sine+0.25)*2.5),-1),angles(-0.3490658503988659+0.1832595714594046*sin((sine+0.75)*2.5),0,0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.5,0.5+0.15*sin((sine+0.5)*2.5),-0.15),angles(0.6108652381980153+0.17453292519943295*sin((sine+0.65)*2.5),0,0.4363323129985824-0.09599310885968812*sin((sine+0.5)*2.5))),deltaTime)
else 
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1*sin((sine*1.5)+0.5)+0,0),angles(rad(20)*cos((sine*1.5)+0)+0,rad(15)*sin((sine*1.5)+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(15)*sin((sine*1.5)+0)+0,rad(-20)*cos((sine*1.5)+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.844831298828125+0,-0.162506103515625+0.25*cos((sine*1.5)+0)+0,0.5+0),angles(0.6818914121079246+0,-0.39120653969740055+0,-0.6401344097539602+rad(-5)*sin((sine*1.5)+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.844831298828125+0,-0.162506103515625+0.25*cos((sine*1.5)+0)+0,0.5+0),angles(0.6818914121079246+0,0.39120653969739977+0,0.6401344097539602+rad(5)*sin((sine*1.5)+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.15*cos((sine*1.5)+0)+0,0),angles(-0.17453292519943295+rad(20)*sin((sine*1.5)+0)+0,0.47291349373191083+0,-0.06694238895111135+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(0.9416702270507813+0,-0.09999999999999998+0.25*cos((sine*1.5)+0)+0,-0.350006103515625+0),angles(-0.3490658503988659+rad(-20)*cos((sine*1.5)+1)+0,-0.6981317007977318+0,0)),angles(0,rad(90),0)),deltaTime)
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,8+1*sin((sine*1.5)+0.5)+0,0),angles(rad(20)*cos((sine*1.5)+0)+0,rad(15)*sin((sine*1.5)+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(15)*sin((sine*1.5)+0)+0,rad(-20)*cos((sine*1.5)+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.844831298828125+0,-0.162506103515625+0.25*cos((sine*1.5)+0)+0,0.5+0),angles(0.6818914121079246+0,-0.39120653969740055+0,-0.6401344097539602+rad(-5)*sin((sine*1.5)+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.844831298828125+0,-0.162506103515625+0.25*cos((sine*1.5)+0)+0,0.5+0),angles(0.6818914121079246+0,0.39120653969739977+0,0.6401344097539602+rad(5)*sin((sine*1.5)+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.15*cos((sine*1.5)+0)+0,0),angles(-0.17453292519943295+rad(20)*sin((sine*1.5)+0)+0,0.47291349373191083+0,-0.06694238895111135+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(0.9416702270507813+0,-0.09999999999999998+0.25*cos((sine*1.5)+0)+0,-0.350006103515625+0),angles(-0.3490658503988659+rad(-20)*cos((sine*1.5)+1)+0,-0.6981317007977318+0,0)),angles(0,rad(90),0)),deltaTime)
end
end


elseif Mode=="Noxesium" then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.15*sin(sine*2+0)+0,0),angles(-1.3962634015954636+0,-0.17453292519943295+0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-7.5)*cos(sine*2+0)+0,0.08726646259971647+rad(5.5)*sin(sine*2+0)+0,3.6651914291880923+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.09999999999999998+0.1*sin(sine*2+0)+0,0),angles(0,-2.530727415391778+0,-2.2689280275926285+rad(5.5)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,-0.25*cos(sine*2+0)+0,0.25+0),angles(-0.5235987755982988+rad(6.5)*cos(sine*2+0)+0,0.8726646259971648+0,0.17453292519943295+rad(-6.5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.9+-0.15*sin(sine*2+0)+0,0.5+0),angles(-0.5235987755982988+rad(2)*sin(sine*2+0)+0,-0.8726646259971648+0,-0.3490658503988659+rad(2)*sin(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.1+-0.15*sin(sine*2+0)+0,0),angles(-0.5235987755982988+rad(-2)*sin(sine*2+0)+0,0.8726646259971648+0,0.3490658503988659+rad(-2)*sin(sine*2+0)+0)),deltaTime) 

elseif Mode=="Vanguard" then
if not SmoothCamera then 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-1.1+0.1*sin(sine*2),0.25),angles(-0.17453292519943295+0.08726646259971647*sin((sine+0.75)*2),0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.2*sin((sine+0.25)*2),0),angles(-1.4835298641951802+0.08726646259971647*sin((sine+0.5)*2),0.08726646259971647-0.03490658503988659*sin(sine*2),3.6651914291880923)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.5,-0.5+0.2*sin((sine+0.75)*2),-0.3),angles(0.1308996938995747*sin((sine+0.5)*2),-0.3490658503988659+0.08726646259971647*sin(sine*2),0.08726646259971647)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.5,-0.25+0.15*sin(sine*2),-0.2),angles(-0.4363323129985824+0.08726646259971647*sin((sine+0.65)*2),0.3490658503988659,-2.0943951023931953+0.09599310885968812*sin((sine+0.8)*2))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.055*sin((sine+0.35)*2),0),angles(-1.7453292519943295-0.08726646259971647*sin((sine+0.75)*2),0.17453292519943295+0.09599310885968812*sin((sine+0.85)*2),2.6179938779914944)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.4,0.2+0.15*sin((sine+0.2)*2),-0.1),angles(-0.1308996938995747*sin((sine+0.85)*2),-0.3490658503988659+0.08726646259971647*sin((sine+0.4)*2),0.3490658503988659-0.08726646259971647*sin((sine+0.75)*2))),deltaTime) 
else
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.5,-1.1+0.1*sin(sine*2),0.25),angles(-0.17453292519943295+0.08726646259971647*sin((sine+0.75)*2),0.3490658503988659,-0.17453292519943295)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,3+0.2*sin((sine+0.25)*2),0),angles(-1.4835298641951802+0.08726646259971647*sin((sine+0.5)*2),0.08726646259971647-0.03490658503988659*sin(sine*2),3.6651914291880923)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.5,-0.5+0.2*sin((sine+0.75)*2),-0.3),angles(0.1308996938995747*sin((sine+0.5)*2),-0.3490658503988659+0.08726646259971647*sin(sine*2),0.08726646259971647)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.5,-0.25+0.15*sin(sine*2),-0.2),angles(-0.4363323129985824+0.08726646259971647*sin((sine+0.65)*2),0.3490658503988659,-2.0943951023931953+0.09599310885968812*sin((sine+0.8)*2))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0.055*sin((sine+0.35)*2),0),angles(-1.7453292519943295-0.08726646259971647*sin((sine+0.75)*2),0.17453292519943295+0.09599310885968812*sin((sine+0.85)*2),2.6179938779914944)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.4,0.2+0.15*sin((sine+0.2)*2),-0.1),angles(-0.1308996938995747*sin((sine+0.85)*2),-0.3490658503988659+0.08726646259971647*sin((sine+0.4)*2),0.3490658503988659-0.08726646259971647*sin((sine+0.75)*2))),deltaTime) 
end

elseif Mode=="Aegleseeker" then


if BasicAnimChange=="Aegle" then 
if not SmoothCamera then
setHipHeight(5)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.5*sin(sine*2.5+0)+0,0),angles(-1.5707963267948966+rad(-10)*cos(sine*2.5+0)+0,0.08726646259971647+rad(2.5)*sin(sine*2.5+0)+0,3.490658503988659+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-10)*sin(sine*2.5+0)+0,0.08726646259971647+rad(5)*sin(sine*2.5+0)+0,2.792526803190927+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.25+-0.25*cos(sine*2.5+0.5)+0,0.2+0),angles(0.3490658503988659+0,-0.3490658503988659+0,1.0471975511965976+rad(10)*sin(sine*2.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,-0.19999999999999996+0.2*sin(sine*2.5+0.5)+0,-0.735+0),angles(-0.3490658503988659+0,1.0471975511965976+0,2.6179938779914944+rad(-7.5)*cos(sine*2.5+0.75)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.1*cos(sine*2.5+0)+0,0),angles(-0.2617993877991494+rad(15)*sin(sine*2.5+0)+0,-1.3089969389957472+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.1+0,-0.25*cos(sine*2.5+0)+0,-0.8+0),angles(-0.3490658503988659+rad(-10)*sin(sine*2.5+0)+0,0.8726646259971648+0,0)),deltaTime)
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,5+0.5*sin(sine*2.5+0)+0,0),angles(-1.5707963267948966+rad(-10)*cos(sine*2.5+0)+0,0.08726646259971647+rad(2.5)*sin(sine*2.5+0)+0,3.490658503988659+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-10)*sin(sine*2.5+0)+0,0.08726646259971647+rad(5)*sin(sine*2.5+0)+0,2.792526803190927+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.25+-0.25*cos(sine*2.5+0.5)+0,0.2+0),angles(0.3490658503988659+0,-0.3490658503988659+0,1.0471975511965976+rad(10)*sin(sine*2.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,-0.19999999999999996+0.2*sin(sine*2.5+0.5)+0,-0.735+0),angles(-0.3490658503988659+0,1.0471975511965976+0,2.6179938779914944+rad(-7.5)*cos(sine*2.5+0.75)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.1*cos(sine*2.5+0)+0,0),angles(-0.2617993877991494+rad(15)*sin(sine*2.5+0)+0,-1.3089969389957472+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.1+0,-0.25*cos(sine*2.5+0)+0,-0.8+0),angles(-0.3490658503988659+rad(-10)*sin(sine*2.5+0)+0,0.8726646259971648+0,0)),deltaTime)  
end
elseif BasicAnimChange=="Seeker" then 
if not SmoothCamera then
setHipHeight(5)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.5*sin(sine*2+0)+0,0),angles(-1.5707963267948966+rad(15)*cos(sine*2+0)+0,0,3.141592653589793+rad(5)*sin(sine*2+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(7.5)*sin(sine*2+0)+0,0,3.141592653589793+rad(-5)*cos(sine*2+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.35*sin(sine*2+0)+0,0),angles(0,-2.530727415391778+0,-1.7453292519943295+rad(7.5)*cos(sine*2+0.85)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.25*sin(sine*2+0)+0,0),angles(0,2.443460952792061+0,1.9198621771937625+rad(5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(-0.17453292519943295+rad(20)*cos(sine*2+0.5)+0,-1.2217304763960306+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.30000000000000004+-0.2*cos(sine*2+0)+0,-0.5+0),angles(-0.3490658503988659+rad(10)*sin(sine*2+0)+0,0.8726646259971648+0,0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,5+0.5*sin(sine*2+0)+0,0),angles(-1.5707963267948966+rad(15)*cos(sine*2+0)+0,0,3.141592653589793+rad(5)*sin(sine*2+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(7.5)*sin(sine*2+0)+0,0,3.141592653589793+rad(-5)*cos(sine*2+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.35*sin(sine*2+0)+0,0),angles(0,-2.530727415391778+0,-1.7453292519943295+rad(7.5)*cos(sine*2+0.85)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.25*sin(sine*2+0)+0,0),angles(0,2.443460952792061+0,1.9198621771937625+rad(5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(-0.17453292519943295+rad(20)*cos(sine*2+0.5)+0,-1.2217304763960306+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.30000000000000004+-0.2*cos(sine*2+0)+0,-0.5+0),angles(-0.3490658503988659+rad(10)*sin(sine*2+0)+0,0.8726646259971648+0,0)),deltaTime)  
end
elseif BasicAnimChange=="Arbitrarium" then 
if not SmoothCamera then
setHipHeight(5)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.25*sin(sine*2+0)+0,0),angles(-1.3962634015954636+rad(10)*cos(sine*2+0)+0,0.12217304763960307+0,3.490658503988659+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-10)*sin(sine*2+0)+0,0.12217304763960307+rad(5)*cos(sine*2+0)+0,2.792526803190927+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.25*sin(sine*2+0)+0,0.25+0),angles(-0.3490658503988659+rad(10)*sin(sine*2+0)+0,-0.6981317007977318+0,0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.25*sin(sine*2+0)+0,0),angles(1.7453292519943295+rad(10)*cos(sine*2+0)+0,0.3490658503988659+0,0.17453292519943295+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.1+0,0.10000000000000009+-0.2*cos(sine*2+0)+0,-0.75+0),angles(-0.5235987755982988+rad(-10)*cos(sine*2+1)+0,-1.2217304763960306+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(rad(15)*sin(sine*2+0.75)+0,0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,5+0.25*sin(sine*2+0)+0,0),angles(-1.3962634015954636+rad(10)*cos(sine*2+0)+0,0.12217304763960307+0,3.490658503988659+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-10)*sin(sine*2+0)+0,0.12217304763960307+rad(5)*cos(sine*2+0)+0,2.792526803190927+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.25*sin(sine*2+0)+0,0.25+0),angles(-0.3490658503988659+rad(10)*sin(sine*2+0)+0,-0.6981317007977318+0,0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.25*sin(sine*2+0)+0,0),angles(1.7453292519943295+rad(10)*cos(sine*2+0)+0,0.3490658503988659+0,0.17453292519943295+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.1+0,0.10000000000000009+-0.2*cos(sine*2+0)+0,-0.75+0),angles(-0.5235987755982988+rad(-10)*cos(sine*2+1)+0,-1.2217304763960306+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(rad(15)*sin(sine*2+0.75)+0,0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  
end
elseif BasicAnimChange=="Trinity" then
if not SmoothCamera then
setHipHeight(7)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.5*cos(sine*2+0)+0,1+0.5*sin(sine*2+0)+0,0),angles(-2.443460952792061+rad(10)*cos(sine*2+0)+0,rad(-10)*cos(sine*2+0.5)+0,2.6179938779914944+rad(5)*sin(sine*2+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(2.5)*sin(sine*10000+0)+0,rad(-2.5)*cos(sine*1000000+0)+0,3.6651914291880923+rad(6.5)*sin(sine*10000+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,0.5+0.2*sin(sine*2+0)+0,-0.2+0),angles(0.17453292519943295+0,-2.6179938779914944+rad(-2.5)*sin(sine*10000+0)+0,-2.2689280275926285+rad(-7.5)*sin(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,0.5+0.25*sin(sine*2+0)+0,0.25+0),angles(0,-0.5235987755982988+rad(-5)*cos(sine*10000+0)+0,1.5707963267948966+rad(10)*sin(sine*10000+0)+rad(-10)*cos(sine*2+0))),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.5+0.2*sin(sine*2+0)+0,-0.25+0),angles(0.17453292519943295+rad(20)*sin(sine*2+0)+0,-0.8726646259971648+0,-0.2617993877991494+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,0.25*cos(sine*2+0)+0,-0.5+0),angles(0.6981317007977318+rad(10)*sin(sine*2+0)+0,0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.5*cos(sine*2+0)+0,7+0.5*sin(sine*2+0)+0,0),angles(-2.443460952792061+rad(10)*cos(sine*2+0)+0,rad(-10)*cos(sine*2+0.5)+0,2.6179938779914944+rad(5)*sin(sine*2+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(2.5)*sin(sine*10000+0)+0,rad(-2.5)*cos(sine*1000000+0)+0,3.6651914291880923+rad(6.5)*sin(sine*10000+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,0.5+0.2*sin(sine*2+0)+0,-0.2+0),angles(0.17453292519943295+0,-2.6179938779914944+rad(-2.5)*sin(sine*10000+0)+0,-2.2689280275926285+rad(-7.5)*sin(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,0.5+0.25*sin(sine*2+0)+0,0.25+0),angles(0,-0.5235987755982988+rad(-5)*cos(sine*10000+0)+0,1.5707963267948966+rad(10)*sin(sine*10000+0)+rad(-10)*cos(sine*2+0))),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.5+0.2*sin(sine*2+0)+0,-0.25+0),angles(0.17453292519943295+rad(20)*sin(sine*2+0)+0,-0.8726646259971648+0,-0.2617993877991494+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,0.25*cos(sine*2+0)+0,-0.5+0),angles(0.6981317007977318+rad(10)*sin(sine*2+0)+0,0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  
end
elseif BasicAnimChange=="Cosmo" then
if not SmoothCamera then
setHipHeight(6)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.5*cos(sine*2+0)+0,0),angles(-1.5707963267948966+rad(10)*cos(sine*2+0)+0,-0.4363323129985824+rad(10)*sin(sine*2+0)+0,2.792526803190927+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3962634015954636+rad(10)*sin(sine*2+0)+0,-0.17453292519943295+rad(5)*cos(sine*2+0)+0,2.443460952792061+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,0.35*cos(sine*2+0)+0,-0.2+0),angles(-0.17453292519943295+0,-0.3490658503988659+0,-0.6981317007977318+rad(-10)*sin(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+-0.25*cos(sine*2+0)+0,1.1+0.25*sin(sine*2+0)+0,-0.25+0),angles(0,0.3490658503988659+0,2.2689280275926285+rad(-5)*sin(sine*2+0.5)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.2*sin(sine*2+0)+0,0.2+0),angles(-0.5235987755982988+0,-0.8726646259971648+0,-0.3490658503988659+rad(-20)*cos(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.25+0,0.25*sin(sine*2+0)+0,-0.5+0),angles(0.3490658503988659+0,0.8726646259971648+0,-0.3490658503988659+rad(-10)*cos(sine*2+0.5)+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,6+0.5*cos(sine*2+0)+0,0),angles(-1.5707963267948966+rad(10)*cos(sine*2+0)+0,-0.4363323129985824+rad(10)*sin(sine*2+0)+0,2.792526803190927+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3962634015954636+rad(10)*sin(sine*2+0)+0,-0.17453292519943295+rad(5)*cos(sine*2+0)+0,2.443460952792061+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,0.35*cos(sine*2+0)+0,-0.2+0),angles(-0.17453292519943295+0,-0.3490658503988659+0,-0.6981317007977318+rad(-10)*sin(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+-0.25*cos(sine*2+0)+0,1.1+0.25*sin(sine*2+0)+0,-0.25+0),angles(0,0.3490658503988659+0,2.2689280275926285+rad(-5)*sin(sine*2+0.5)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.2*sin(sine*2+0)+0,0.2+0),angles(-0.5235987755982988+0,-0.8726646259971648+0,-0.3490658503988659+rad(-20)*cos(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.25+0,0.25*sin(sine*2+0)+0,-0.5+0),angles(0.3490658503988659+0,0.8726646259971648+0,-0.3490658503988659+rad(-10)*cos(sine*2+0.5)+0)),deltaTime)  
end
elseif BasicAnimChange=="LightBearer" then
if not SmoothCamera then
setHipHeight(7)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(1,1+0.75*sin(sine*1.5+0)+0,0),angles(-1.3962634015954636+rad(-10)*cos(sine*1.5+0)+0,0.08726646259971647+0,3.6651914291880923+rad(-10)*sin(sine*0.75+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(-10)*sin(sine*1.5+0)+0,0.08726646259971647+0,3.141592653589793+rad(5)*cos(sine*1.5+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,-2.2689280275926285+0,-2.0943951023931953+rad(-10)*sin(sine*1.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,2.2689280275926285+0,2.0943951023931953+rad(10)*cos(sine*1.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.2*sin(sine*1.5+0)+0,0),angles(rad(-20)*cos(sine*1.5+0)+0,-1.0471975511965976+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+-0.25*cos(sine*1.5+0)+0,-0.5+0),angles(-0.17453292519943295+rad(-10)*sin(sine*1.5+0)+0,0.8726646259971648+0,0.08726646259971647+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,7+0.75*sin(sine*1.5+0)+0,0),angles(-1.3962634015954636+rad(-10)*cos(sine*1.5+0)+0,0.08726646259971647+0,3.6651914291880923+rad(-10)*sin(sine*0.75+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(-10)*sin(sine*1.5+0)+0,0.08726646259971647+0,3.141592653589793+rad(5)*cos(sine*1.5+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,-2.2689280275926285+0,-2.0943951023931953+rad(-10)*sin(sine*1.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,2.2689280275926285+0,2.0943951023931953+rad(10)*cos(sine*1.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.2*sin(sine*1.5+0)+0,0),angles(rad(-20)*cos(sine*1.5+0)+0,-1.0471975511965976+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+-0.25*cos(sine*1.5+0)+0,-0.5+0),angles(-0.17453292519943295+rad(-10)*sin(sine*1.5+0)+0,0.8726646259971648+0,0.08726646259971647+0)),deltaTime)  
end
elseif BasicAnimChange=="Kuiper" then
if not SmoothCamera then
setHipHeight(5)
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.4681219482421875*sin(sine*2+0)+0,0),angles(-1.5046190107617432+rad(10)*cos(sine*2+0)+0,0,3.141592653589793+rad(-10.079668579101561)*sin(sine*1+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.8232853034231291+0,0,3.141592653589793+rad(-10)*cos(sine*2+0.31499755859375)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.7104080200195313+0,0.03954925537109366+0.11258605957031276*cos(sine*2+0)+0,0),angles(-0.595593607243065+0,-3.0118872276494533+0,-1.7538014065805334+rad(-8.478119659423827)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.68017578125+0,0.45052032470703124+0.10017883300781254*sin(sine*2+0)+0,0),angles(-0.4278584539892811+0,2.858266402067315+0,1.9168424720969433+rad(9.320000610351562)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.9234405517578125+0.253436279296875*sin(sine*2+0)+0,0),angles(-0.08081735170398059+rad(10)*sin(sine*2+0.63123291015625)+0,-1.0385762595893497+0,0.004836513592471102+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.9812530517578125+0,-0.3732101440429687+0.19626434326171874*cos(sine*2+0)+0,-0.35678100585937494+0),angles(-0.13843867683981462+rad(-10.068791885375976)*cos(sine*2+0)+0,0.746635321099127+0,0)),deltaTime)  
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,5+0.4681219482421875*sin(sine*2+0)+0,0),angles(-1.5046190107617432+rad(10)*cos(sine*2+0)+0,0,3.141592653589793+rad(-10.079668579101561)*sin(sine*1+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.8232853034231291+0,0,3.141592653589793+rad(-10)*cos(sine*2+0.31499755859375)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.7104080200195313+0,0.03954925537109366+0.11258605957031276*cos(sine*2+0)+0,0),angles(-0.595593607243065+0,-3.0118872276494533+0,-1.7538014065805334+rad(-8.478119659423827)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.68017578125+0,0.45052032470703124+0.10017883300781254*sin(sine*2+0)+0,0),angles(-0.4278584539892811+0,2.858266402067315+0,1.9168424720969433+rad(9.320000610351562)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.9234405517578125+0.253436279296875*sin(sine*2+0)+0,0),angles(-0.08081735170398059+rad(10)*sin(sine*2+0.63123291015625)+0,-1.0385762595893497+0,0.004836513592471102+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.9812530517578125+0,-0.3732101440429687+0.19626434326171874*cos(sine*2+0)+0,-0.35678100585937494+0),angles(-0.13843867683981462+rad(-10.068791885375976)*cos(sine*2+0)+0,0.746635321099127+0,0)),deltaTime)  
end
elseif BasicAnimChange=="Arctaurus" then
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.25*sin(sine*2+0)+0,0),angles(-1.4338035333741077+rad(5)*cos(sine*2+0)+0,0.08310362223659182+0,3.839724354387525+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7097674227998398+0,0.13693313861237102+rad(-10)*sin(sine*2+0)+0,2.443460952792061+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.2079986572265624+0,0.343231201171875+0.2*cos(sine*2+0)+0,0.2572830200195313+0),angles(0.13108174759169253+0,-0.35308733017132926+0,0.8124537495437811+rad(10)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1197921752929687+0,-0.683319091796875+0.2*cos(sine*2+0)+0,0.07238616943359377+0),angles(2.2471429437700055+rad(10.1)*sin(sine*2+2.05253173828125)+0,2.7062510365167203+0,-0.8124485297480446+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.8909591674804687+0,-1.0453170776367187+0,0.2224029541015625+0),angles(-0.2617993877991494+rad(15)*cos(sine*2+0)+0,-0.9153943000023809+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.044281005859375+0,0.118743896484375+-0.15*cos(sine*2+0)+0,-1.0464569091796876+0),angles(-0.8027434381035778+rad(-10)*cos(sine*2+0)+0,1.3066723189434388+0,0.5467206597616976+0)),deltaTime)  
setHipHeight(6.5)
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,6.5+0.25*sin(sine*2+0)+0,0),angles(-1.4338035333741077+rad(5)*cos(sine*2+0)+0,0.08310362223659182+0,3.839724354387525+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7097674227998398+0,0.13693313861237102+rad(-10)*sin(sine*2+0)+0,2.443460952792061+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.2079986572265624+0,0.343231201171875+0.2*cos(sine*2+0)+0,0.2572830200195313+0),angles(0.13108174759169253+0,-0.35308733017132926+0,0.8124537495437811+rad(10)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1197921752929687+0,-0.683319091796875+0.2*cos(sine*2+0)+0,0.07238616943359377+0),angles(2.2471429437700055+rad(10.1)*sin(sine*2+2.05253173828125)+0,2.7062510365167203+0,-0.8124485297480446+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.8909591674804687+0,-1.0453170776367187+0,0.2224029541015625+0),angles(-0.2617993877991494+rad(15)*cos(sine*2+0)+0,-0.9153943000023809+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.044281005859375+0,0.118743896484375+-0.15*cos(sine*2+0)+0,-1.0464569091796876+0),angles(-0.8027434381035778+rad(-10)*cos(sine*2+0)+0,1.3066723189434388+0,0.5467206597616976+0)),deltaTime)  
end
elseif BasicAnimChange=="Ethereal" then
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1+0.5*sin(sine*2+0)+0,0),angles(0.17453292519943295+rad(-5)*cos(sine*2+0)+0,rad(20)*cos(sine*1+0)+0,rad(5)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(-10)*cos(sine*2+0)+0,rad(10)*sin(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.09375+0,-0.25+0.25*sin(sine*2+0)+0,0.2+0),angles(1.5707963267948966+rad(20)*cos(sine*2+0)+0,-0.4650243317399364+0,-0.4363323129985824+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.09375+0,-0.25+0.25*sin(sine*2+0)+0,0.2+0),angles(1.5707963267948966+rad(20)*cos(sine*2+0)+0,0.4650243317399364+0,0.4363323129985824+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.167184829711914+0,-1.02813720703125+-0.15*cos(sine*2+0)+0,0.031768798828125+0),angles(-0.08726646259971647+rad(-20)*cos(sine*2+0)+0,0.31663280937944493+0,0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.1927387237548828+0,-0.22081451416015618+-0.25*cos(sine*2+0)+0,-0.5849014282226563+0),angles(-0.17453292519943295+rad(-10)*sin(sine*2+0)+0,-0.5136428141791466+0,-0.007123529810187549+0)),angles(0,rad(90),0)),deltaTime)  
setHipHeight(5)
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,5+0.5*sin(sine*2+0)+0,0),angles(0.17453292519943295+rad(-5)*cos(sine*2+0)+0,rad(20)*cos(sine*1+0)+0,rad(5)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(-10)*cos(sine*2+0)+0,rad(10)*sin(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.09375+0,-0.25+0.25*sin(sine*2+0)+0,0.2+0),angles(1.5707963267948966+rad(20)*cos(sine*2+0)+0,-0.4650243317399364+0,-0.4363323129985824+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.09375+0,-0.25+0.25*sin(sine*2+0)+0,0.2+0),angles(1.5707963267948966+rad(20)*cos(sine*2+0)+0,0.4650243317399364+0,0.4363323129985824+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.167184829711914+0,-1.02813720703125+-0.15*cos(sine*2+0)+0,0.031768798828125+0),angles(-0.08726646259971647+rad(-20)*cos(sine*2+0)+0,0.31663280937944493+0,0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.1927387237548828+0,-0.22081451416015618+-0.25*cos(sine*2+0)+0,-0.5849014282226563+0),angles(-0.17453292519943295+rad(-10)*sin(sine*2+0)+0,-0.5136428141791466+0,-0.007123529810187549+0)),angles(0,rad(90),0)),deltaTime)  
end
end

elseif Mode=="Nholiviction" then

if not SmoothCamera then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.5*sin(sine*2+0)+0,0),angles(-0.3217332954991647+rad(10)*cos(sine*2+0)+0,-0.38822379927651135+0,0.015783916622238027+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.3241992761421344+rad(-10)*sin(sine*1000+0)+rad(-10)*cos(sine*2+0),0.48182219368400026+0,0.18002329810274031+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8557235717773437+0,0.5+-0.25*cos(sine*2+0)+0,-0.6947830200195314+0),angles(2.199791193903291+rad(5)*sin(sine*1000+0)+0,0.885750121276491+0,1.3166711039929195+rad(-5)*sin(sine*1000+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,-0.2572921752929689+-0.2*cos(sine*2+0)+0,0.08072967529296876+0),angles(-0.17453292519943295+rad(10)*cos(sine*2+1)+0,-0.46482057328493437+0,0.467316381332113+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.4041641235351563+0,-0.13645324707031248+-0.25*cos(sine*2+0)+0,-0.5938293457031251+0),angles(-0.3633188755000828+rad(-20)*sin(sine*2+0)+0,0.5204978973514541+0,0.04861270337964476+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(rad(10)*cos(sine*2+0)+0,-0.3899083019292083+0,0.08726646259971647+0)),angles(0,rad(90),0)),deltaTime)  
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+0.5*sin(sine*2+0)+0,0),angles(-0.3217332954991647+rad(10)*cos(sine*2+0)+0,-0.38822379927651135+0,0.015783916622238027+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.3241992761421344+rad(-10)*sin(sine*1000+0)+rad(-10)*cos(sine*2+0),0.48182219368400026+0,0.18002329810274031+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8557235717773437+0,0.5+-0.25*cos(sine*2+0)+0,-0.6947830200195314+0),angles(2.199791193903291+rad(5)*sin(sine*1000+0)+0,0.885750121276491+0,1.3166711039929195+rad(-5)*sin(sine*1000+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,-0.2572921752929689+-0.2*cos(sine*2+0)+0,0.08072967529296876+0),angles(-0.17453292519943295+rad(10)*cos(sine*2+1)+0,-0.46482057328493437+0,0.467316381332113+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.4041641235351563+0,-0.13645324707031248+-0.25*cos(sine*2+0)+0,-0.5938293457031251+0),angles(-0.3633188755000828+rad(-20)*sin(sine*2+0)+0,0.5204978973514541+0,0.04861270337964476+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-1+-0.15*cos(sine*2+0)+0,0),angles(rad(10)*cos(sine*2+0)+0,-0.3899083019292083+0,0.08726646259971647+0)),angles(0,rad(90),0)),deltaTime)  
end
elseif Mode=="Pyroplex" then

RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.25+0.15*sin(sine*2+0)+0,0),angles(-1.7453292519943295+0,0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.5707963267948966+rad(-5.5)*cos(sine*2+0)+0,rad(-2.5)*sin(sine*2+0)+0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.35+0,0.15*cos(sine*2+0.5)+0,0),angles(-0.17453292519943295+rad(-5.5)*sin(sine*2+0)+0,-0.3490658503988659+0,-0.17453292519943295+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,0.75+0.15*cos(sine*2+0.1)+0,-0.5+0),angles(1.3962634015954636+0,2.2689280275926285+rad(-5.5)*sin(sine*2+0)+0,1.3962634015954636+rad(5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.15+-0.15*sin(sine*2+0)+0,0.75+0),angles(-0.5235987755982988+rad(5)*sin(sine*2+0)+0,-0.5235987755982988+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.15*sin(sine*2+0)+0,-0.35+0),angles(0.17453292519943295+rad(-5.5)*sin(sine*2+0)+0,0.8726646259971648+0,0.17453292519943295+0)),deltaTime)  

elseif Mode=="Fatal" then

if not SmoothCamera then
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0+0,-0.25+0+0.15*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,-2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),0.17453292519943295+rad(2.5)*sin(sine*1000+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0+0+0,1+0+0,0+0+0),angles(-2.0943951023931953+0+rad(-5.5)*cos(sine*3+0),0+rad(-1.5)*sin(sine*1000+0)+0,3.141592653589793+0+rad(1.5)*cos(sine*1000+0))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75+0+0,-0.09999999999999998+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0.3490658503988659+0+rad(-5.5)*cos(sine*3+0),0.3490658503988659+0+rad(1.5)*cos(sine*1000+0),0+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2+0+0,0+0+0.25*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),-0.17453292519943295+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0+0,-0.8+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0+0+rad(-5.5)*cos(sine*3+0),-0.3490658503988659+rad(-1.5)*sin(sine*1000+0)+0,0+0+rad(2)*cos(sine*1000+0))),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0+0+0,1+0.5*sin(sine*3+0)+0,0+0+0),angles(-2.2689280275926285+0+rad(-5.5)*cos(sine*3+0.5),0+rad(1)*sin(sine*1000+0)+0,3.141592653589793+0+rad(-1)*cos(sine*1000+0))),deltaTime)  
else 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0+0,-0.25+0+0.15*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,-2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),0.17453292519943295+rad(2.5)*sin(sine*1000+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0+0+0,1+0+0,0+0+0),angles(-2.0943951023931953+0+rad(-5.5)*cos(sine*3+0),0+rad(-1.5)*sin(sine*1000+0)+0,3.141592653589793+0+rad(1.5)*cos(sine*1000+0))),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.75+0+0,-0.09999999999999998+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0.3490658503988659+0+rad(-5.5)*cos(sine*3+0),0.3490658503988659+0+rad(1.5)*cos(sine*1000+0),0+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2+0+0,0+0+0.25*cos(sine*3+0),0+0+0),angles(0.8726646259971648+0+0,2.6179938779914944+0+rad(-1.5)*cos(sine*1000+0),-0.17453292519943295+rad(-1.5)*sin(sine*1000+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0+0,-0.8+0.15*sin(sine*3+0)+0,-0.5+0+0),angles(0+0+rad(-5.5)*cos(sine*3+0),-0.3490658503988659+rad(-1.5)*sin(sine*1000+0)+0,0+0+rad(2)*cos(sine*1000+0))),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0+0+0,10+0.5*sin(sine*3+0)+0,0+0+0),angles(-2.2689280275926285+0+rad(-5.5)*cos(sine*3+0.5),0+rad(1)*sin(sine*1000+0)+0,3.141592653589793+0+rad(-1)*cos(sine*1000+0))),deltaTime) 
end


elseif Mode=="Cascade" then

if not SmoothCamera then
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0+0,0.25+0+0.25*cos(sine*2+0.25),0+0+0),angles(-0.17453292519943295+0+rad(5.5)*cos(sine*2+0),-0.3490658503988659+0+0,-0.6981317007977318+rad(5.5)*sin(sine*2+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0+0+0,1+0+0,0+0+0),angles(-1.7453292519943295+0+rad(-10.5)*cos(sine*2+0.5),0+rad(5.5)*sin(sine*2+0)+0,3.141592653589793+0+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.8+0+0,-0.09999999999999998+0.1*sin(sine*2+0)+0,-0.25+0+0),angles(-0.17453292519943295+rad(15.5)*sin(sine*2+0)+0,0.3490658503988659+0+0,0+0+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0+0,0.25+0+0.25*cos(sine*2+0.5),0+0+0),angles(-0.17453292519943295+0+rad(5.5)*cos(sine*2+0),0.3490658503988659+0+0,0.6981317007977318+rad(5.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0+0,-1+0+0.15*cos(sine*2+0),0.25+0+0),angles(-0.17453292519943295+0+rad(15.5)*cos(sine*2+0.5),-0.3490658503988659+0+0,0+0+0)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0+0+0.5*cos(sine*2+0.5),1+1.5*sin(sine*2+0)+0,0+0+0),angles(-1.7453292519943295+0+rad(20)*cos(sine*2+0),0+rad(5.5)*sin(sine*2+0)+0,3.141592653589793+0+rad(-5.5)*cos(sine*2+0))),deltaTime)  
else 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0+0,0.25+0+0.25*cos(sine*2+0.25),0+0+0),angles(-0.17453292519943295+0+rad(5.5)*cos(sine*2+0),-0.3490658503988659+0+0,-0.6981317007977318+rad(5.5)*sin(sine*2+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0+0+0,1+0+0,0+0+0),angles(-1.7453292519943295+0+rad(-10.5)*cos(sine*2+0.5),0+rad(5.5)*sin(sine*2+0)+0,3.141592653589793+0+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.8+0+0,-0.09999999999999998+0.1*sin(sine*2+0)+0,-0.25+0+0),angles(-0.17453292519943295+rad(15.5)*sin(sine*2+0)+0,0.3490658503988659+0+0,0+0+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0+0,0.25+0+0.25*cos(sine*2+0.5),0+0+0),angles(-0.17453292519943295+0+rad(5.5)*cos(sine*2+0),0.3490658503988659+0+0,0.6981317007977318+rad(5.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-0.75+0+0,-1+0+0.15*cos(sine*2+0),0.25+0+0),angles(-0.17453292519943295+0+rad(15.5)*cos(sine*2+0.5),-0.3490658503988659+0+0,0+0+0)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0+0+0.5*cos(sine*2+0.5),8+1.5*sin(sine*2+0)+0,0+0+0),angles(-1.7453292519943295+0+rad(20)*cos(sine*2+0),0+rad(5.5)*sin(sine*2+0)+0,3.141592653589793+0+rad(-5.5)*cos(sine*2+0))),deltaTime)  
end


elseif Mode=="Sentinel" then


RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.1+0.15*sin(sine*2+0)+0,0),angles(-1.6580627893946132+rad(-2.5)*sin(sine*2+0)+0,-0.04363323129985824+0,2.443460952792061+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.5707963267948966+rad(-5.5)*cos(sine*2+0)+0,rad(2.5)*sin(sine*2+0)+0,3.6651914291880923+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,0.35+-0.15*cos(sine*2+0)+0,0.15+0),angles(1.2217304763960306+rad(-10.5)*sin(sine*2+0)+0,-0.3490658503988659+0,-0.3490658503988659+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.35+0,-0.15000000000000002+-0.2*cos(sine*2+0.15)+0,-0.5+0),angles(0,0.3490658503988659+0,2.9670597283903604+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1.1+-0.15*sin(sine*2+0)+0,0),angles(0.17453292519943295+0,-0.3490658503988659+0,-0.3490658503988659+rad(-5.5)*sin(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.15+-0.15*sin(sine*2+0)+0,0),angles(0,2.2689280275926285+0,-0.5235987755982988+rad(5.5)*sin(sine*2+0)+0)),deltaTime)  


elseif Mode=="Nebulabrasque" then

if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1.5+0.25*cos(sine*2+0)+0,0),angles(0.17453292519943295+rad(5)*cos(sine*2+0)+0,rad(-15)*sin(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(10)*sin(sine*2+0)+0,rad(10)*cos(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8151046752929687+0,-0.616656494140625+0.15*sin(sine*2+0)+0,-0.5359390258789063+0),angles(0,-2.9682935176601717+0,-1.5941047387610443+rad(-10)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.5916671752929688+0,-0.2968322753906252+0.15*sin(sine*2+0)+0,-0.5036407470703125+0),angles(0,2.9380097541668886+0,1.8411574579193197+rad(10)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.15*cos(sine*2+0)+0,0),angles(-0.18275241237721532+rad(20)*cos(sine*2+0)+0,0.4886921905584123+0,0.03130404713850369+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.0812255859375+0,-0.6760345458984375+0.25*cos(sine*2+0)+0,-0.5010482788085938+0),angles(-0.33974382784559615+rad(20)*sin(sine*2+0)+0,-0.5569074639841378+0,-0.05039861920665192+0)),angles(0,rad(90),0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,2.5+0.25*cos(sine*2+0)+0,0),angles(0.17453292519943295+rad(5)*cos(sine*2+0)+0,rad(-15)*sin(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.17453292519943295+rad(10)*sin(sine*2+0)+0,rad(10)*cos(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8151046752929687+0,-0.616656494140625+0.15*sin(sine*2+0)+0,-0.5359390258789063+0),angles(0,-2.9682935176601717+0,-1.5941047387610443+rad(-10)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.5916671752929688+0,-0.2968322753906252+0.15*sin(sine*2+0)+0,-0.5036407470703125+0),angles(0,2.9380097541668886+0,1.8411574579193197+rad(10)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.15*cos(sine*2+0)+0,0),angles(-0.18275241237721532+rad(20)*cos(sine*2+0)+0,0.4886921905584123+0,0.03130404713850369+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.0812255859375+0,-0.6760345458984375+0.25*cos(sine*2+0)+0,-0.5010482788085938+0),angles(-0.33974382784559615+rad(20)*sin(sine*2+0)+0,-0.5569074639841378+0,-0.05039861920665192+0)),angles(0,rad(90),0)),deltaTime)  
end

elseif Mode=="Imperial" then

if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.75*sin(sine*2.5+0)+0,1+1*cos(sine*3+0)+0,0),angles(-1.3962634015954636+rad(10)*cos(sine*3+0)+0,rad(-5.5)*sin(sine*3+0)+0,3.141592653589793+rad(5.5)*sin(sine*3+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(-5.5)*cos(sine*3+0.75)+0,rad(2.5)*sin(sine*3+0)+0,3.141592653589793+rad(-5.5)*sin(sine*3+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.5+0,-0.25+0.2*cos(sine*3+0)+0,0),angles(0,-2.9670597283903604+0,-1.7453292519943295+rad(-5.5)*cos(sine*3+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,0.15*cos(sine*3+0)+0,0),angles(0,2.792526803190927+0,2.792526803190927+rad(7.5)*sin(sine*3+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.15*sin(sine*3+0)+0,0),angles(-0.17453292519943295+rad(10)*sin(sine*3+0.25)+0,-1.2217304763960306+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+0.15*cos(sine*3+0)+0,-0.6+0),angles(-0.3490658503988659+rad(10)*sin(sine*3+0)+0,1.2217304763960306+0,0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.75*sin(sine*2.5+0)+0,5+1*cos(sine*3+0)+0,0),angles(-1.3962634015954636+rad(10)*cos(sine*3+0)+0,rad(-5.5)*sin(sine*3+0)+0,3.141592653589793+rad(5.5)*sin(sine*3+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(-5.5)*cos(sine*3+0.75)+0,rad(2.5)*sin(sine*3+0)+0,3.141592653589793+rad(-5.5)*sin(sine*3+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.5+0,-0.25+0.2*cos(sine*3+0)+0,0),angles(0,-2.9670597283903604+0,-1.7453292519943295+rad(-5.5)*cos(sine*3+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,0.15*cos(sine*3+0)+0,0),angles(0,2.792526803190927+0,2.792526803190927+rad(7.5)*sin(sine*3+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.15*sin(sine*3+0)+0,0),angles(-0.17453292519943295+rad(10)*sin(sine*3+0.25)+0,-1.2217304763960306+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+0.15*cos(sine*3+0)+0,-0.6+0),angles(-0.3490658503988659+rad(10)*sin(sine*3+0)+0,1.2217304763960306+0,0)),deltaTime)  
end

elseif Mode=="Dimension" then

if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(-0.5*cos(sine*3+0)+0,1+0.75*sin(sine*3+0)+0,0.25*sin(sine*3+0.5)+0),angles(-1.3962634015954636+rad(-25)*cos(sine*3+0)+0,-0.17453292519943295+rad(-15)*sin(sine*3+0)+0,3.141592653589793+rad(5)*cos(sine*3+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-7.5)*sin(sine*3+0)+0,0.17453292519943295+rad(5)*cos(sine*3+0.5)+0,3.141592653589793+rad(20)*cos(sine*3+1)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,-0.25*cos(sine*3+0)+0,0.25+0),angles(-0.17453292519943295+0,-0.6981317007977318+0,-2.0943951023931953+rad(20)*sin(sine*3+0.5)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,-0.25*cos(sine*3+0)+0,-0.25+0),angles(-0.17453292519943295+0,0.6981317007977318+0,2.2689280275926285+rad(-20)*sin(sine*3+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*3+0)+0,0),angles(-0.5235987755982988+rad(20)*sin(sine*3+0)+0,-0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+-0.2*cos(sine*3+0)+0,-0.5+0),angles(-0.5235987755982988+rad(-10)*sin(sine*3+0)+0,1.2217304763960306+0,0.17453292519943295+rad(5)*cos(sine*3+0)+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(-0.5*cos(sine*3+0)+0,10+0.75*sin(sine*3+0)+0,0.25*sin(sine*3+0.5)+0),angles(-1.3962634015954636+rad(-25)*cos(sine*3+0)+0,-0.17453292519943295+rad(-15)*sin(sine*3+0)+0,3.141592653589793+rad(5)*cos(sine*3+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-7.5)*sin(sine*3+0)+0,0.17453292519943295+rad(5)*cos(sine*3+0.5)+0,3.141592653589793+rad(20)*cos(sine*3+1)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,-0.25*cos(sine*3+0)+0,0.25+0),angles(-0.17453292519943295+0,-0.6981317007977318+0,-2.0943951023931953+rad(20)*sin(sine*3+0.5)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,-0.25*cos(sine*3+0)+0,-0.25+0),angles(-0.17453292519943295+0,0.6981317007977318+0,2.2689280275926285+rad(-20)*sin(sine*3+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*3+0)+0,0),angles(-0.5235987755982988+rad(20)*sin(sine*3+0)+0,-0.8726646259971648+0,-0.17453292519943295+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+-0.2*cos(sine*3+0)+0,-0.5+0),angles(-0.5235987755982988+rad(-10)*sin(sine*3+0)+0,1.2217304763960306+0,0.17453292519943295+rad(5)*cos(sine*3+0)+0)),deltaTime)  
end


elseif Mode=="Tachyon" then

if not SmoothCamera then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.5*cos(sine*2+0)+0,1+1*sin(sine*3+0)+0,0),angles(-1.3962634015954636+0,0.17453292519943295+rad(12.5)*cos(sine*3+0)+0,2.0943951023931953+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.5707963267948966+rad(-10)*cos(sine*3+0)+0,-0.3490658503988659+rad(10)*sin(sine*3+0)+0,4.014257279586958+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.25*cos(sine*3+0.75)+0,0),angles(2.6179938779914944+rad(15)*sin(sine*3+0)+0,-2.2689280275926285+rad(-5)*cos(sine*3+0)+0,1.0471975511965976+rad(10)*cos(sine*3+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.2+0.25*sin(sine*3+0)+0,0),angles(0.3490658503988659+rad(-10)*cos(sine*3+0)+0,0.5235987755982988+0,0.8726646259971648+rad(12.5)*sin(sine*3+0.5)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.25+0,0.25+-0.2*cos(sine*3+0)+0,-0.75+0),angles(0.3490658503988659+rad(-7.5)*sin(sine*3+0)+0,-1.2217304763960306+0,0.3490658503988659+rad(7.5)*sin(sine*3+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.25*cos(sine*3+0)+0,-0.5+0),angles(0.6981317007977318+0,1.9198621771937625+0,-0.6981317007977318+rad(-10.5)*sin(sine*3+0)+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.5*cos(sine*2+0)+0,5+1*sin(sine*3+0)+0,0),angles(-1.3962634015954636+0,0.17453292519943295+rad(12.5)*cos(sine*3+0)+0,2.0943951023931953+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.5707963267948966+rad(-10)*cos(sine*3+0)+0,-0.3490658503988659+rad(10)*sin(sine*3+0)+0,4.014257279586958+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.25*cos(sine*3+0.75)+0,0),angles(2.6179938779914944+rad(15)*sin(sine*3+0)+0,-2.2689280275926285+rad(-5)*cos(sine*3+0)+0,1.0471975511965976+rad(10)*cos(sine*3+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.2+0.25*sin(sine*3+0)+0,0),angles(0.3490658503988659+rad(-10)*cos(sine*3+0)+0,0.5235987755982988+0,0.8726646259971648+rad(12.5)*sin(sine*3+0.5)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1.25+0,0.25+-0.2*cos(sine*3+0)+0,-0.75+0),angles(0.3490658503988659+rad(-7.5)*sin(sine*3+0)+0,-1.2217304763960306+0,0.3490658503988659+rad(7.5)*sin(sine*3+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.25*cos(sine*3+0)+0,-0.5+0),angles(0.6981317007977318+0,1.9198621771937625+0,-0.6981317007977318+rad(-10.5)*sin(sine*3+0)+0)),deltaTime)  
end

elseif Mode=="Serenity" then

RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.75+0.15*sin(sine*2+0)+0,0),angles(-2.2689280275926285+rad(-1.5)*cos(sine*2+0)+0,0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(5.5)*sin(sine*2+0)+0,-0.08726646259971647+0,3.490658503988659+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.8+0,0.5+0.1*cos(sine*2+0)+0,-0.3+0),angles(0.8726646259971648+0,-2.2689280275926285+rad(5)*cos(sine*2+0)+0,-1.7453292519943295+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,-0.15000000000000002+-0.15*sin(sine*2+0)+0,-1.85+-0.1*sin(sine*2+0)+0),angles(0.9599310885968813+0,0.8726646259971648+0,-0.17453292519943295+rad(-5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,0.25+-0.15*sin(sine*2+0)+0,-0.5+-0.1*sin(sine*2+0)+0),angles(0.17453292519943295+0,-0.8726646259971648+0,-0.6981317007977318+rad(-5)*sin(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.25+-0.15*sin(sine*2+0)+0,-0.25+-0.1*sin(sine*2+0)+0),angles(-0.8726646259971648+0,1.2217304763960306+0,0.5235987755982988+rad(5)*cos(sine*2+0)+0)),deltaTime)  

elseif Mode=="Torment" then
if SpecialAnimRThingy==0 then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1+0.15*sin(sine*2+0)+0,0),angles(-2.2689280275926285+rad(5)*cos(sine*2+0)+0,0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.0471975511965976+rad(5)*cos(sine*2+0)+0,0.08726646259971647+rad(5)*sin(sine*2+0)+0,3.3161255787892263+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.5+0,0.25+-0.15*sin(sine*2+0.5)+0,-0.75+-0.15*sin(sine*2+0.5)+0),angles(0,-1.0471975511965976+0,-1.0471975511965976+rad(5)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,0.5+0,0.2+0),angles(-0.08726646259971647+0,-0.5235987755982988+rad(-7.5)*cos(sine*2+0)+0,1.5707963267948966+rad(-5.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0.1*sin(sine*2+0)+0,-1.2+0,0.5+0.15*sin(sine*2+0)+0),angles(-1.0471975511965976+rad(-5)*cos(sine*2+0.5)+0,-1.2217304763960306+0,-0.5235987755982988+rad(5)*cos(sine*2+0.75)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.25+-0.1*sin(sine*2+0)+0,-0.15*sin(sine*2+0.5)+0,-1+-0.15*sin(sine*2+0.5)+0),angles(0.08726646259971647+rad(-5)*cos(sine*2+0)+0,1.0471975511965976+0,0.5235987755982988+rad(5)*cos(sine*2+0)+0)),deltaTime)  
elseif SpecialAnimRThingy==1 then 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.75+0.15*sin(sine*2+0)+0,0),angles(-2.2689280275926285+rad(-1.5)*cos(sine*2+0)+0,0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(5.5)*sin(sine*2+0)+0,-0.08726646259971647+0,3.490658503988659+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.8+0,0.5+0.1*cos(sine*2+0)+0,-0.3+0),angles(0.8726646259971648+0,-2.2689280275926285+rad(5)*cos(sine*2+0)+0,-1.7453292519943295+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.75+0,-0.15000000000000002+-0.15*sin(sine*2+0)+0,-1.85+-0.1*sin(sine*2+0)+0),angles(0.9599310885968813+0,0.8726646259971648+0,-0.17453292519943295+rad(-5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,0.25+-0.15*sin(sine*2+0)+0,-0.5+-0.1*sin(sine*2+0)+0),angles(0.17453292519943295+0,-0.8726646259971648+0,-0.6981317007977318+rad(-5)*sin(sine*2+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1.25+-0.15*sin(sine*2+0)+0,-0.25+-0.1*sin(sine*2+0)+0),angles(-0.8726646259971648+0,1.2217304763960306+0,0.5235987755982988+rad(5)*cos(sine*2+0)+0)),deltaTime)  
elseif SpecialAnimRThingy==2 then 
s1_1.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_2.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_3.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
s1_4.C0=cfMul(cf(random(-45,45),random(-10,45),random(-45,45)),angles(random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453),random(-6.632251157578453,6.632251157578453)))
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.5+0,0),angles(-1.2217304763960306+0,0,3.141592653589793+0)),1)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.2217304763960306+0,rad(random(-5,5)),3.141592653589793+rad(random(-5,5)))),1)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.85+0,0.5+0,0.5+0),angles(0.8726646259971648+rad(random(-5,5)),-0.5235987755982988+rad(random(-5,5)),-0.8726646259971648+rad(random(-5,5)))),1)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.85+0,0.5+0,0.5+0),angles(0.8726646259971648+rad(random(-5,5)),0.5235987755982988+rad(random(-5,5)),0.8726646259971648+rad(random(-5,5)))),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0,0.5+0),angles(-1.5707963267948966+0,-0.5235987755982988+0,-0.17453292519943295+0)),1)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.85+0,-0.5+0),angles(-0.5235987755982988+0,0.8726646259971648+0,0.3490658503988659+0)),1)  


end
elseif Mode=="Pandemonium" then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1*sin(sine*3+0)+0,0),angles(-1.3962634015954636+rad(-2.5)*cos(sine*3+0)+0,-0.08726646259971647+rad(2.5)*cos(sine*3+0.5)+0,2.6179938779914944+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(-5)*cos(sine*3+0)+0,-0.08726646259971647+rad(5)*sin(sine*3+0)+0,3.9269908169872414+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.5+-0.25*cos(sine*3+0)+0,0.5+0),angles(-1.0471975511965976+rad(-5)*cos(sine*3+0)+0,-0.08726646259971647+rad(-5)*sin(sine*3+0)+0,-2.2689280275926285+rad(5)*cos(sine*3+0.5)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,-0.25+-0.25*cos(sine*3+0)+0,0.25+0),angles(-0.5235987755982988+rad(-10)*cos(sine*3+0)+0,0.5235987755982988+0,2.2689280275926285+rad(5)*sin(sine*3+0.75)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.1*sin(sine*3+0)+0,-0.1*cos(sine*3+0)+0),angles(-0.3490658503988659+rad(2.5)*cos(sine*3+0)+0,-0.8726646259971648+rad(-2.5)*cos(sine*3+0.5)+0,-0.17453292519943295+rad(2.5)*cos(sine*3+0)+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+-0.1*sin(sine*3+0)+0,0.5+-0.1*cos(sine*3+0)+0),angles(-0.8726646259971648+rad(-2.5)*cos(sine*3+0)+0,0.8726646259971648+rad(-2.5)*cos(sine*3+0.5)+0,0.3490658503988659+rad(2.5)*cos(sine*3+0)+0)),deltaTime)  
elseif Mode=="Lexapriatic" then
if BasicAnimChange==1 then
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1+0.5*cos(sine*1+0)+0,0),angles(0.1440611425331899+rad(10)*cos(sine*1+0)+0,rad(-10)*sin(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.3061686102978619+rad(10)*sin(sine*1+0)+0,rad(10)*cos(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.0364593505859374+0,-0.36041259765625+0.15*sin(sine*1+0)+0,0.12551727294921874+0),angles(1.5388099511535034+0,0.6378299572879548+rad(10)*sin(sine*1+0)+0,1.0690141668465265+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.9385482788085937+0,-0.04687347412109377+0.25*sin(sine*1+0)+0,-0.12604827880859376+0),angles(1.1407938150752144+0,-0.6164369973042354+rad(-10)*cos(sine*1+0)+0,-1.1587939078301728+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0,-0.20885162353515627+0),angles(0.2771711536110868+rad(-20)*sin(sine*1+0)+0,0.16900132656245123+0,-0.17893459784911592+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.7196853637695313+0,-0.5380142211914063+0),angles(-0.5207618698787028+rad(15)*cos(sine*1+0)+0,-0.697912043271022+0,0.12268011351115414+0)),angles(0,rad(90),0)),deltaTime)   
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,15+0.5*cos(sine*1+0)+0,0),angles(0.1440611425331899+rad(10)*cos(sine*1+0)+0,rad(-10)*sin(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.3061686102978619+rad(10)*sin(sine*1+0)+0,rad(10)*cos(sine*1+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1.0364593505859374+0,-0.36041259765625+0.15*sin(sine*1+0)+0,0.12551727294921874+0),angles(1.5388099511535034+0,0.6378299572879548+rad(10)*sin(sine*1+0)+0,1.0690141668465265+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.9385482788085937+0,-0.04687347412109377+0.25*sin(sine*1+0)+0,-0.12604827880859376+0),angles(1.1407938150752144+0,-0.6164369973042354+rad(-10)*cos(sine*1+0)+0,-1.1587939078301728+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0,-0.20885162353515627+0),angles(0.2771711536110868+rad(-20)*sin(sine*1+0)+0,0.16900132656245123+0,-0.17893459784911592+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.7196853637695313+0,-0.5380142211914063+0),angles(-0.5207618698787028+rad(15)*cos(sine*1+0)+0,-0.697912043271022+0,0.12268011351115414+0)),angles(0,rad(90),0)),deltaTime)  
end
elseif BasicAnimChange==2 then
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+1*sin(sine*3+0)+0,0),angles(-1.3962634015954636+rad(5)*sin(sine*3+0)+0,rad(-2.5)*cos(sine*3+0)+0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3962634015954636+rad(-7.5)*sin(sine*3+0.75)+0,rad(-5)*cos(sine*3+0)+0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,0.75+0.15*sin(sine*3+0)+0,-0.25+0),angles(-0.3490658503988659+0,-0.6981317007977318+0,-2.443460952792061+rad(-7.5)*sin(sine*3+0.75)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.75+0.15*sin(sine*3+0)+0,-0.25+0),angles(-0.3490658503988659+0,0.6981317007977318+0,2.443460952792061+rad(7.5)*sin(sine*3+0.75)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*3+0)+0,0),angles(-0.17453292519943295+rad(-5)*cos(sine*3+0)+0,-0.8726646259971648+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25*cos(sine*3+0)+0,-0.75+0),angles(-0.3490658503988659+rad(-10.5)*sin(sine*3+0.85)+0,1.2217304763960306+0,0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,12+1*sin(sine*3+0)+0,0),angles(-1.3962634015954636+rad(5)*sin(sine*3+0)+0,rad(-2.5)*cos(sine*3+0)+0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3962634015954636+rad(-7.5)*sin(sine*3+0.75)+0,rad(-5)*cos(sine*3+0)+0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.25+0,0.75+0.15*sin(sine*3+0)+0,-0.25+0),angles(-0.3490658503988659+0,-0.6981317007977318+0,-2.443460952792061+rad(-7.5)*sin(sine*3+0.75)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.25+0,0.75+0.15*sin(sine*3+0)+0,-0.25+0),angles(-0.3490658503988659+0,0.6981317007977318+0,2.443460952792061+rad(7.5)*sin(sine*3+0.75)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.15*cos(sine*3+0)+0,0),angles(-0.17453292519943295+rad(-5)*cos(sine*3+0)+0,-0.8726646259971648+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25*cos(sine*3+0)+0,-0.75+0),angles(-0.3490658503988659+rad(-10.5)*sin(sine*3+0.85)+0,1.2217304763960306+0,0)),deltaTime)  
end
elseif BasicAnimChange==3 then 
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.5*sin(sine*2+0)+0,0),angles(0.02101937174600299+rad(5)*cos(sine*2+0)+0,-0.7881541090199058+rad(-5)*sin(sine*2+0)+0,0.040814328549231095+rad(-5)*cos(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.25966768713620636+rad(10)*cos(sine*2+0)+0,0.6661644999161874+0,0.004280232503975352+rad(5)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.271881103515625+0.05*sin(sine*2+0)+0,-0.44895477294921876+0),angles(1.4200074001895047+rad(5)*cos(sine*2+0)+0,0.03309499633997108+rad(-10)*sin(sine*2+0)+0,-0.6671145027402404+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.3015640258789063+0,-0.0135498046875+0,0.3734542846679688+0),angles(2.817356412771729+rad(10)*cos(sine*2+0)+0,-0.9712884053816331+rad(-5)*sin(sine*2+0)+0,0.6098466323442819+rad(-5)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.5791732788085937+0,-0.3505157470703125+0.15*cos(sine*2+0)+0,-0.8796798706054688+0),angles(-0.14126184064818578+0,-0.1842781773131381+0,0.19116383357475977+rad(10)*cos(sine*2+0.5)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.2153717041015626+0,-0.9572967529296875+0.15*cos(sine*2+0)+0,-0.273956298828125+0),angles(-0.16009411798057216+0,0.12726383985295492+0,0.294798403813434+rad(-5)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime) 
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,15+0.5*sin(sine*2+0)+0,0),angles(0.02101937174600299+rad(5)*cos(sine*2+0)+0,-0.7881541090199058+rad(-5)*sin(sine*2+0)+0,0.040814328549231095+rad(-5)*cos(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.25966768713620636+rad(10)*cos(sine*2+0)+0,0.6661644999161874+0,0.004280232503975352+rad(5)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.271881103515625+0.05*sin(sine*2+0)+0,-0.44895477294921876+0),angles(1.4200074001895047+rad(5)*cos(sine*2+0)+0,0.03309499633997108+rad(-10)*sin(sine*2+0)+0,-0.6671145027402404+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.3015640258789063+0,-0.0135498046875+0,0.3734542846679688+0),angles(2.817356412771729+rad(10)*cos(sine*2+0)+0,-0.9712884053816331+rad(-5)*sin(sine*2+0)+0,0.6098466323442819+rad(-5)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.5791732788085937+0,-0.3505157470703125+0.15*cos(sine*2+0)+0,-0.8796798706054688+0),angles(-0.14126184064818578+0,-0.1842781773131381+0,0.19116383357475977+rad(10)*cos(sine*2+0.5)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.2153717041015626+0,-0.9572967529296875+0.15*cos(sine*2+0)+0,-0.273956298828125+0),angles(-0.16009411798057216+0,0.12726383985295492+0,0.294798403813434+rad(-5)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  

end
elseif BasicAnimChange==4 then 
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(-0.5*cos(sine*2+0)+0,1+0.75*sin(sine*2+0)+0,0),angles(-1.2217304763960306+rad(-5)*cos(sine*2+0)+0,2.6179938779914944+rad(-5)*sin(sine*2+0)+0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3089969389957472+rad(-5)*cos(sine*2+0)+0,0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.5+0.2*cos(sine*2+0)+0,0),angles(-0.3490658503988659+0,-0.5235987755982988+0,-0.5235987755982988+rad(-7.5)*sin(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.3+0.25*cos(sine*2+0)+0,0.25+0),angles(-0.5235987755982988+0,0.8726646259971648+0,0.8726646259971648+rad(7.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.25*sin(sine*2+0)+0,-0.5+0),angles(-0.3490658503988659+rad(-5)*sin(sine*2+0)+0,-0.8726646259971648+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+0,0),angles(0.17453292519943295+rad(10)*cos(sine*2+0)+0,0.8726646259971648+0,0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(-0.5*cos(sine*2+0)+0,12+0.75*sin(sine*2+0)+0,0),angles(-1.2217304763960306+rad(-5)*cos(sine*2+0)+0,2.6179938779914944+rad(-5)*sin(sine*2+0)+0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.3089969389957472+rad(-5)*cos(sine*2+0)+0,0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.5+0.2*cos(sine*2+0)+0,0),angles(-0.3490658503988659+0,-0.5235987755982988+0,-0.5235987755982988+rad(-7.5)*sin(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,0.3+0.25*cos(sine*2+0)+0,0.25+0),angles(-0.5235987755982988+0,0.8726646259971648+0,0.8726646259971648+rad(7.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-0.25*sin(sine*2+0)+0,-0.5+0),angles(-0.3490658503988659+rad(-5)*sin(sine*2+0)+0,-0.8726646259971648+0,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-1+0,0),angles(0.17453292519943295+rad(10)*cos(sine*2+0)+0,0.8726646259971648+0,0)),deltaTime)  
end
elseif BasicAnimChange==5 then 
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,1+0.2*sin(sine*2+0)+0,0),angles(-1.3962634015954636+rad(7.5)*cos(sine*2+0)+0,0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.8325957145940461+rad(-7.5)*cos(sine*2+0)+0,0,3.141592653589793+rad(-2.5)*sin(sine*2+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,-0.15000000000000002+0,0),angles(0,-2.8797932657906435+0,-1.7453292519943295+rad(-7.5)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.8+0,0.1*sin(sine*2+0)+0,-0.25+0),angles(-0.08726646259971647+0,2.9670597283903604+0,1.9198621771937625+rad(-7.5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.1*cos(sine*2+0)+0,0),angles(-0.3490658503988659+rad(7)*cos(sine*2+0)+0,-0.8726646259971648+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.15000000000000002+0,-0.75+0),angles(-0.5235987755982988+rad(7)*cos(sine*2+0)+0,1.2217304763960306+0,0.17453292519943295+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,12+0.2*sin(sine*2+0)+0,0),angles(-1.3962634015954636+rad(7.5)*cos(sine*2+0)+0,0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.8325957145940461+rad(-7.5)*cos(sine*2+0)+0,0,3.141592653589793+rad(-2.5)*sin(sine*2+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.75+0,-0.15000000000000002+0,0),angles(0,-2.8797932657906435+0,-1.7453292519943295+rad(-7.5)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.8+0,0.1*sin(sine*2+0)+0,-0.25+0),angles(-0.08726646259971647+0,2.9670597283903604+0,1.9198621771937625+rad(-7.5)*cos(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.1*cos(sine*2+0)+0,0),angles(-0.3490658503988659+rad(7)*cos(sine*2+0)+0,-0.8726646259971648+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.15000000000000002+0,-0.75+0),angles(-0.5235987755982988+rad(7)*cos(sine*2+0)+0,1.2217304763960306+0,0.17453292519943295+0)),deltaTime)  
end
end

elseif Mode=="Restless" then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.2*sin(sine*2+0)+0,0),angles(-1.4835298641951802+rad(-5)*cos(sine*2+0)+0,0,3.141592653589793+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.7453292519943295+rad(5)*sin(sine*2+0)+0,0,3.141592653589793+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,0.09999999999999998+-0.2*cos(sine*2+0)+0,0.25+0),angles(0,-0.5235987755982988+0,-2.2689280275926285+rad(7.5)*cos(sine*2+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.1+0,-0.2*cos(sine*2+0)+0,0),angles(0,2.792526803190927+0,1.9198621771937625+rad(7.5)*sin(sine*2+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+-0.2*sin(sine*2+0)+0,-0.1*cos(sine*2+0)+0),angles(-0.2617993877991494+rad(5)*cos(sine*2+0)+0,-0.8726646259971648+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(0.85+0,-0.2*cos(sine*2+0.75)+0,-0.5+0),angles(-0.17453292519943295+rad(-5.5)*sin(sine*2+0)+0,0.8726646259971648+0,0)),deltaTime)  
elseif Mode=="Cheatreal" then
if not SmoothCamera then 
if sound.PlaybackLoudness>=random(230,300) then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(1.5*cos(sine*3+0)+0,2*sin(sine*3+0)+0,0),angles(0,-Spinny/5.5,3.141592653589793+rad(-20)*cos(sine*3+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(0.4363323129985824+rad(-10)*cos(sine*2+0)+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,-2.6179938779914944+rad(-10)*sin(sine*3+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,2.6179938779914944+rad(10)*sin(sine*3+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.25*cos(sine*3+0)+0,0.15+0),angles(-0.17453292519943295+rad(-10)*sin(sine*3+0)+0,0.4363323129985824+0,-0.17453292519943295+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.19999999999999996+0.15*cos(sine*3+0)+0,-0.5+0),angles(-0.3490658503988659+rad(-10)*sin(sine*3+1)+0,-0.6981317007977318+0,0.17453292519943295+0)),angles(0,rad(90),0)),deltaTime)
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(1.5*cos(sine*3+0)+0,2*sin(sine*3+0)+0,0),angles(0,rad(-50)*cos(sine*3+0)+0,3.141592653589793+rad(-20)*cos(sine*3+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(0.4363323129985824+rad(-10)*cos(sine*2+0)+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,-2.6179938779914944+rad(-10)*sin(sine*3+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,2.6179938779914944+rad(10)*sin(sine*3+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.25*cos(sine*3+0)+0,0.15+0),angles(-0.17453292519943295+rad(-10)*sin(sine*3+0)+0,0.4363323129985824+0,-0.17453292519943295+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.19999999999999996+0.15*cos(sine*3+0)+0,-0.5+0),angles(-0.3490658503988659+rad(-10)*sin(sine*3+1)+0,-0.6981317007977318+0,0.17453292519943295+0)),angles(0,rad(90),0)),deltaTime)
end
else
if sound.PlaybackLoudness>=random(230,300)  then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(1.5*cos(sine*3+0)+0,10+2*sin(sine*3+0)+0,0),angles(0,-Spinny/5.5,3.141592653589793+rad(-20)*cos(sine*3+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(0.4363323129985824+rad(-10)*cos(sine*2+0)+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,-2.6179938779914944+rad(-10)*sin(sine*3+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,2.6179938779914944+rad(10)*sin(sine*3+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.25*cos(sine*3+0)+0,0.15+0),angles(-0.17453292519943295+rad(-10)*sin(sine*3+0)+0,0.4363323129985824+0,-0.17453292519943295+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.19999999999999996+0.15*cos(sine*3+0)+0,-0.5+0),angles(-0.3490658503988659+rad(-10)*sin(sine*3+1)+0,-0.6981317007977318+0,0.17453292519943295+0)),angles(0,rad(90),0)),deltaTime)
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(1.5*cos(sine*3+0)+0,10+2*sin(sine*3+0)+0,0),angles(0,rad(-50)*cos(sine*3+0)+0,3.141592653589793+rad(-20)*cos(sine*3+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(0.4363323129985824+rad(-10)*cos(sine*2+0)+0,0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,-2.6179938779914944+rad(-10)*sin(sine*3+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(2+0,0.5+0.5*cos(sine*3+0)+0,0),angles(0,0,2.6179938779914944+rad(10)*sin(sine*3+0)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1+0.25*cos(sine*3+0)+0,0.15+0),angles(-0.17453292519943295+rad(-10)*sin(sine*3+0)+0,0.4363323129985824+0,-0.17453292519943295+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,-0.19999999999999996+0.15*cos(sine*3+0)+0,-0.5+0),angles(-0.3490658503988659+rad(-10)*sin(sine*3+1)+0,-0.6981317007977318+0,0.17453292519943295+0)),angles(0,rad(90),0)),deltaTime)
end

end

elseif Mode=="HYPERINTERVENTIC" then
if BasicAnimChange==1 then 
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1*cos(sine*2+0)+0,0),angles(0.07944529111037177+0,0.8558665776318245+0,-0.1661696406385917+rad(10)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.2087993928397081+rad(-10)*sin(sine*2+0)+0,-0.8726646259971648+0,0.06591526098188961+rad(5)*cos(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.5+0.25*sin(sine*2+0)+0,0.896881103515625+0),angles(0.202632470493077+0,-0.5049727334607282+0,1.13448960677439+rad(10)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.25+0.15*cos(sine*2+0)+0,-0.27812652587890624+0),angles(0.2835393044096843+0,-0.37160956228960845+0,-1.7603091403097644+rad(-5)*sin(sine*2+0.5)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.0760395050048828+0,-1.2124942779541015+0.15*cos(sine*2+0)+0,0.31979370117187506+0),angles(0.027490240667844855+rad(20)*sin(sine*2+0)+0,0.3614335705011939+0,-0.06667319662812615+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.5+0,-0.3822845458984374+0.2*sin(sine*2+0)+0,-0.3770751953125+0),angles(-0.42632756246825987+rad(-10)*cos(sine*2+0)+0,-0.7348182361837837+0,-0.1623856083089199+0)),angles(0,rad(90),0)),deltaTime)  
else 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+1*cos(sine*2+0)+0,0),angles(0.07944529111037177+0,0.8558665776318245+0,-0.1661696406385917+rad(10)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.2087993928397081+rad(-10)*sin(sine*2+0)+0,-0.8726646259971648+0,0.06591526098188961+rad(5)*cos(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.5+0.25*sin(sine*2+0)+0,0.896881103515625+0),angles(0.202632470493077+0,-0.5049727334607282+0,1.13448960677439+rad(10)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.25+0.15*cos(sine*2+0)+0,-0.27812652587890624+0),angles(0.2835393044096843+0,-0.37160956228960845+0,-1.7603091403097644+rad(-5)*sin(sine*2+0.5)+0)),angles(0,rad(90),0)),1)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.0760395050048828+0,-1.2124942779541015+0.15*cos(sine*2+0)+0,0.31979370117187506+0),angles(0.027490240667844855+rad(20)*sin(sine*2+0)+0,0.3614335705011939+0,-0.06667319662812615+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.5+0,-0.3822845458984374+0.2*sin(sine*2+0)+0,-0.3770751953125+0),angles(-0.42632756246825987+rad(-10)*cos(sine*2+0)+0,-0.7348182361837837+0,-0.1623856083089199+0)),angles(0,rad(90),0)),deltaTime)  
end
elseif BasicAnimChange==2 then 
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1*cos(sine*2+0)+0,0),angles(0.07944529111037177+0,0.8558665776318245+0,-0.1661696406385917+rad(10)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.2087993928397081+rad(-10)*sin(sine*2+0)+0,-0.8726646259971648+0,0.06591526098188961+rad(5)*cos(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.5+0.25*sin(sine*2+0)+0,0.896881103515625+0),angles(0.202632470493077+0,-0.5049727334607282+0,1.13448960677439+rad(10)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.2687480926513672+0,0.25+0.15*cos(sine*2+0)+0,-0.27239913940429683+0),angles(1.7318087293509388+0,-0.07457839084986286+rad(10)*cos(sine*2+0)+0,1.041274494510985+rad(-5)*sin(sine*2+0.5)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.0760395050048828+0,-1.2124942779541015+0.15*cos(sine*2+0)+0,0.31979370117187506+0),angles(0.027490240667844855+rad(20)*sin(sine*2+0)+0,0.3614335705011939+0,-0.06667319662812615+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.5+0,-0.3822845458984374+0.2*sin(sine*2+0)+0,-0.3770751953125+0),angles(-0.42632756246825987+rad(-10)*cos(sine*2+0)+0,-0.7348182361837837+0,-0.1623856083089199+0)),angles(0,rad(90),0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+1*cos(sine*2+0)+0,0),angles(0.07944529111037177+0,0.8558665776318245+0,-0.1661696406385917+rad(10)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.2087993928397081+rad(-10)*sin(sine*2+0)+0,-0.8726646259971648+0,0.06591526098188961+rad(5)*cos(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.5+0.25*sin(sine*2+0)+0,0.896881103515625+0),angles(0.202632470493077+0,-0.5049727334607282+0,1.13448960677439+rad(10)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.2687480926513672+0,0.25+0.15*cos(sine*2+0)+0,-0.27239913940429683+0),angles(1.7318087293509388+0,-0.07457839084986286+rad(10)*cos(sine*2+0)+0,1.041274494510985+rad(-5)*sin(sine*2+0.5)+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.0760395050048828+0,-1.2124942779541015+0.15*cos(sine*2+0)+0,0.31979370117187506+0),angles(0.027490240667844855+rad(20)*sin(sine*2+0)+0,0.3614335705011939+0,-0.06667319662812615+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1.5+0,-0.3822845458984374+0.2*sin(sine*2+0)+0,-0.3770751953125+0),angles(-0.42632756246825987+rad(-10)*cos(sine*2+0)+0,-0.7348182361837837+0,-0.1623856083089199+0)),angles(0,rad(90),0)),deltaTime)  
end
end

elseif Mode=="Parallax" then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.2*cos(sine*2+0)+0,0),angles(0.2891468564009551+0,0.6049691060710235+0,rad(5)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.4810608491915684+rad(-5)*cos(sine*2+0)+0,-0.5655626310004519+0,rad(2.5)*sin(sine*2+0)+0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,-0.16871185302734382+0.2*cos(sine*2+0)+0,0),angles(2.1595637195318704+rad(15)*sin(sine*2+0)+0,0.35193354226066326+0,-0.1875248902612755+rad(5)*cos(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1.4328205108642578+0,0.27916412353515624+0.1*sin(sine*2+0)+0,-0.50433349609375+0),angles(1.567012507518112+rad(10)*cos(sine*2+0)+0,-0.38331644559904415+rad(5)*sin(sine*2+0)+0,0.7587439156273901+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+-0.05*cos(sine*2+0)+0,-0.7833343505859375+-0.225*cos(sine*2+0)+0,-0.15*sin(sine*2+0)+0),angles(-0.36186606786222275+rad(-5)*sin(sine*2+0)+0,0.43651436669070015+0,-0.42150074278215666+rad(-10)*sin(sine*2+0)+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,0.172393798828125+0.25*cos(sine*2+0)+0,-0.6447952270507813+0),angles(-0.30198755391288123+rad(-10)*cos(sine*2+0)+0,-0.6034829556563157+0,0.17453292519943295+rad(-5)*sin(sine*2+0)+0)),angles(0,rad(90),0)),deltaTime)  

elseif Mode=="Horion" then
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,0.5*cos(sine*2+0)+0,0),angles(-0.3568446243636565+rad(-10)*sin(sine*2+0)+rad(5)*cos(sine*10000+0),rad(2.5)*sin(sine*10000+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.474951451124483+rad(10)*sin(sine*2+0)+rad(5)*cos(sine*10000+0),0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.16875305175781247+0.2*sin(sine*2+0)+0,0),angles(2.9239153735718078+rad(-10)*cos(sine*2+0)+0,-0.5294170368950167+0,0.5510568186485646+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.11302642822265624+0.15*sin(sine*2+0)+0,-0.15207977294921876+0),angles(3.1172224925602525+rad(10)*cos(sine*2+0)+0,0.6027223568489891+0,-0.5334877318844247+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1.0932220458984374+0.25*sin(sine*2+0.5)+0,0),angles(0.17453292519943295+rad(10)*cos(sine*2+1)+0,0.30492107911682526+0,-0.16594998311188197+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,0.334381103515625+0.35*sin(sine*2+0)+0,-0.5427032470703125+0),angles(-0.14915715454227838+rad(-10)*cos(sine*2+0)+0,-0.7801208433813472+0,0.2634356339728941+0)),angles(0,rad(90),0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,7+0.5*cos(sine*2+0)+0,0),angles(-0.3568446243636565+rad(-10)*sin(sine*2+0)+rad(5)*cos(sine*10000+0),rad(2.5)*sin(sine*10000+0)+0,0)),angles(rad(-90),0,rad(180))),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1+0,0),angles(-0.474951451124483+rad(10)*sin(sine*2+0)+rad(5)*cos(sine*10000+0),0,0)),angles(rad(-90),0,rad(180))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-1+0,0.16875305175781247+0.2*sin(sine*2+0)+0,0),angles(2.9239153735718078+rad(-10)*cos(sine*2+0)+0,-0.5294170368950167+0,0.5510568186485646+0)),angles(0,rad(-90),0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(1+0,0.11302642822265624+0.15*sin(sine*2+0)+0,-0.15207977294921876+0),angles(3.1172224925602525+rad(10)*cos(sine*2+0)+0,0.6027223568489891+0,-0.5334877318844247+0)),angles(0,rad(90),0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1+0,-1.0932220458984374+0.25*sin(sine*2+0.5)+0,0),angles(0.17453292519943295+rad(10)*cos(sine*2+1)+0,0.30492107911682526+0,-0.16594998311188197+0)),angles(0,rad(-90),0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1+0,0.334381103515625+0.35*sin(sine*2+0)+0,-0.5427032470703125+0),angles(-0.14915715454227838+rad(-10)*cos(sine*2+0)+0,-0.7801208433813472+0,0.2634356339728941+0)),angles(0,rad(90),0)),deltaTime)  
end

elseif Mode=="Zionihilic" then
if not SmoothCamera then 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),0.3490658503988659,-0.6108652381980153+0.17453292519943295*sin(sine*2))),angles(0,-1.5707963267948966,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),-0.3490658503988659,0.6108652381980153+-0.17453292519943295*sin(sine*2))),angles(0,1.5707963267948966,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.2617993877991494+-0.17453292519943295*sin(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,-0.8999999761581421+0.1*sin(sine*2),-0.25),angles(-0.3490658503988659+-0.13962634015954636*sin(sine*2),-0.2617993877991494,-0.05235987755982989)),angles(0,1.5707963267948966,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.100000023841858,-0.25+0.1*sin(sine*2),-0.8999999761581421),angles(-0.5235987755982988+-0.17453292519943295*sin(sine*2),0.3490658503988659,0.03490658503988659)),angles(0,-1.5707963267948966,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,1*sin(sine*2),0),angles(-0.2181661564992912+-0.17453292519943295*cos(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)
else
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cfMul(cf(-0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),0.3490658503988659,-0.6108652381980153+0.17453292519943295*sin(sine*2))),angles(0,-1.5707963267948966,0)),deltaTime)RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cfMul(cf(0.8500000238418579,0+0.2*sin(sine*2),0.25),angles(0.3490658503988659+-0.17453292519943295*sin(sine*2),-0.3490658503988659,0.6108652381980153+-0.17453292519943295*sin(sine*2))),angles(0,1.5707963267948966,0)),deltaTime)Neck.C0=Lerp(Neck.C0,cfMul(cfMul(cf(0,1,0),angles(-0.2617993877991494+-0.17453292519943295*sin(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)RightHip.C0=Lerp(RightHip.C0,cfMul(cfMul(cf(1,-0.8999999761581421+0.1*sin(sine*2),-0.25),angles(-0.3490658503988659+-0.13962634015954636*sin(sine*2),-0.2617993877991494,-0.05235987755982989)),angles(0,1.5707963267948966,0)),deltaTime)LeftHip.C0=Lerp(LeftHip.C0,cfMul(cfMul(cf(-1.100000023841858,-0.25+0.1*sin(sine*2),-0.8999999761581421),angles(-0.5235987755982988+-0.17453292519943295*sin(sine*2),0.3490658503988659,0.03490658503988659)),angles(0,-1.5707963267948966,0)),deltaTime)RootJoint.C0=Lerp(RootJoint.C0,cfMul(cfMul(cf(0,10+1*sin(sine*2),0),angles(-0.2181661564992912+-0.17453292519943295*cos(sine*2),0,0)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime)
end

elseif Mode=="Axius" then
if not SmoothCamera then
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(1,0.75*sin(sine*1.5+0)+0,0),angles(-1.3962634015954636+rad(-10)*cos(sine*1.5+0)+0,0.08726646259971647+0,3.6651914291880923+rad(-10)*sin(sine*0.75+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(-10)*sin(sine*1.5+0)+0,0.08726646259971647+0,3.141592653589793+rad(5)*cos(sine*1.5+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,-2.2689280275926285+0,-2.0943951023931953+rad(-10)*sin(sine*1.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,2.2689280275926285+0,2.0943951023931953+rad(10)*cos(sine*1.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.2*sin(sine*1.5+0)+0,0),angles(rad(-20)*cos(sine*1.5+0)+0,-1.0471975511965976+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+-0.25*cos(sine*1.5+0)+0,-0.5+0),angles(-0.17453292519943295+rad(-10)*sin(sine*1.5+0)+0,0.8726646259971648+0,0.08726646259971647+0)),deltaTime)  
else
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,7+0.75*sin(sine*1.5+0)+0,0),angles(-1.3962634015954636+rad(-10)*cos(sine*1.5+0)+0,0.08726646259971647+0,3.6651914291880923+rad(-10)*sin(sine*0.75+0)+0)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1+0,0),angles(-1.9198621771937625+rad(-10)*sin(sine*1.5+0)+0,0.08726646259971647+0,3.141592653589793+rad(5)*cos(sine*1.5+0)+0)),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,-2.2689280275926285+0,-2.0943951023931953+rad(-10)*sin(sine*1.5+0)+0)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1+0,-0.19999999999999996+0.25*cos(sine*1.5+0)+0,0),angles(0,2.2689280275926285+0,2.0943951023931953+rad(10)*cos(sine*1.5+0)+0)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1+0,-1+0.2*sin(sine*1.5+0)+0,0),angles(rad(-20)*cos(sine*1.5+0)+0,-1.0471975511965976+0,-0.08726646259971647+0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1+0,-0.25+-0.25*cos(sine*1.5+0)+0,-0.5+0),angles(-0.17453292519943295+rad(-10)*sin(sine*1.5+0)+0,0.8726646259971648+0,0.08726646259971647+0)),deltaTime)  
end





end
end
end





--// Render the animations
IsRendering=PostSimulation:Connect(function(dt)
if not Running then 
pcall(function()
IsKeys:Disconnect()
IsKeys=nil
Seek0:Disconnect()
Seek0=nil
Seek1:Disconnect()
Seek1=nil
Seek2:Disconnect()
Seek2=nil
end)
end
MainAnimations()
tspawn(function()
This1()
end)
tspawn(function()
This2()
end)
end)
end






--// Clean Up Everything Before Stopping And Respawning
function StopScript()
if stopreanimate then
stopreanimate()
notify("Stopping script")
end
--repeat oswait() until not IsHatDropped
IsSitting=false
Retroify=false
ActiveVFX=nil
--OverrideAnimation=false
--GuiVisible=true
SpecialAnimRThingy=0
for _,v in game.Players.LocalPlayer.Character:GetDescendants() do 
if v:isA("Trail") then 
v:Destroy()
end
end
for _,v in workspace:GetChildren() do 
if v:GetAttribute("VFX")==true then 
v:Destroy()
end
end
for _,v in workspace:GetChildren() do 
if v:GetAttribute("Main") then 
v:Destroy()
end
end
clik()
local gui=game:GetService("CoreGui")
local MainGui=gui:FindFirstChild("MainGui")
if MainGui then 
MainGui:Destroy()
end
if Running then
Running=false
tspawn(function()
Respawn()
repeat Respawn() twait() until lp.Character.Humanoid.Health>15
end)
end
wait(.1)
if Mode~="None" then
Mode="None"
end
tclear(VFXTables)
if IsRendering then
IsRendering:Disconnect()
IsRendering=nil
end

pcall(function()
game.SoundService:FindFirstChild("GlitcherAudioPlayer").TimePosition=0
game.SoundService:FindFirstChild("GlitcherAudioPlayer"):Stop()
game.SoundService:FindFirstChild("GlitcherAudioPlayer"):FindFirstChild("Sound2").TimePosition=0
game.SoundService:FindFirstChild("GlitcherAudioPlayer"):FindFirstChild("Sound2"):Stop()
if game.SoundService:FindFirstChild("GlitcherAudioPlayer") then
game.SoundService.GlitcherAudioPlayer:Destroy()
end
end)
if IsRendering1 then
IsRendering1:Disconnect()
IsRendering1=nil
end
if MainWeld1 then
MainWeld1:Destroy()
MainWeld1=nil
end
if MainWeld then
MainWeld:Destroy()
MainWeld=nil
end
if plrgui:FindFirstChild("MainGui") then 
plrgui.MainGui:Destroy()
end

ws.FallenPartsDestroyHeight=oldfds
ConRes=game.Players.LocalPlayer.CharacterAdded:Connect(function()
wait(1)
ws.CurrentCamera.CameraType="Custom"
wait(2)
ws.CurrentCamera.CameraSubject=lp.Character:WaitForChild("Humanoid")
repeat ws.CurrentCamera.CameraType="Custom" wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
ConRes:Disconnect()
end)
Interface["Current Music_12"]["Text"] = [[Music Playing: None!]]
local hhhh
hhhh=game.Players.LocalPlayer.CharacterAdded:Connect(function()
for _,v in game.Players.LocalPlayer.Character:GetDescendants() do 
if v:IsA("BasePart") or v:IsA("Part") then 
v.Anchored=false 
end
end
wait(1)
hhhh:Disconnect()
end)
end





--// Gui Visibility
function GuiVisible()
GuiOpened=not GuiOpened
if GuiOpened then
mainframe.Active=GuiOpened
mainframe.Visible=GuiOpened
for _,v in ipairs(mainframe:GetChildren()) do
if v:IsA("TextLabel") or v:IsA("TextButton") then
v.Active=true
end 
end
else
mainframe.Active=GuiOpened
mainframe.Visible=GuiOpened
for _,v in ipairs(mainframe:GetChildren()) do
if v:IsA("TextLabel") or v:IsA("TextButton") then
v.Active=false
end 
end
end
end 








--// Connect all three Functions
RunScript.MouseButton1Click:Connect(MainScript)
StopRunningScript.MouseButton1Click:Connect(StopScript)
--opengui.MouseButton1Click:Connect(GuiVisible)
local function C_1d()
local script = Interface["UIThings_1d"];
--[[IMPORTANT 


Canvas Pos 0, -202, 0, 158 (Opened) Size

MainFrame Pos 0, 0, 0, 30 and size 0, 642, 0, 400 Opened
MainFrame Pos 0, 640, 0, 30 and size 0, 0, 0, 400 Closed
MainFrameMain Size 0, 892, 0, 476 MainFrameMain Pos = 0, 0, 0, -12 and closed pos 0, 0, 0, 258
]]



function swait(num)
if num==0 or num==nil then
game:service'RunService'.Stepped:wait(0)
else
for i=0,num do
game:service'RunService'.Stepped:wait(0)
end
end
end
function BetterTween(obj, speed, prop,AnimType)
if AnimType==nil then AnimType="Quad" end
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle[AnimType], Enum.EasingDirection.In)
return TweenService:Create(obj, hii,prop)

end
local MainMainFrame=script.Parent.Parent
local MainMainFrame1=script.Parent.Parent.Parent
local Canvas=MainMainFrame["Frame"]["CanvasGroup"]
local u2=UDim2.new
local Tab=MainMainFrame["Tab"]
local CredsButton=Canvas["ScrollingFrame"]["Credits"]
local CredsImage=MainMainFrame["Credits"]["Owner"]
local Credits=MainMainFrame["Credits"]
local SubMain=MainMainFrame["SubMain"]
MainMainFrame1.Draggable=true
MainMainFrame1.Parent["ToggleGui"].Draggable=true
local Minimize=MainMainFrame["Minimize"]
local ToggleGui=MainMainFrame1.Parent["ToggleGui"]
local Players=game.Players
local rus=game:GetService('RunService')
local PostSimulation=rus.PostSimulation
local userId = Players:GetUserIdFromNameAsync("TH33NERGIZER")
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
CredsImage.Image=content

local CanvasShown=BetterTween(Canvas,1.5,{Position=u2(0, 0, 0, 12)})
local CanvasHidden=BetterTween(Canvas,1.5,{Position=u2(0, 0, 0, 500)},"Back")

local CreditsTweenOpenPos=BetterTween(Credits,1.5,{Position=u2(0, 0, 0, 30)})
local CreditsTweenOpenSize=BetterTween(Credits,1.5,{Size=u2(0, 642, 0, 400)})

local CreditsTweenClosePos=BetterTween(Credits,1.5,{Position=u2(0, 640, 0, 30)})
local CreditsTweenCloseSize=BetterTween(Credits,1.5,{Size=u2(0, 0, 0, 400)})


local ActualFrameOpenSize=BetterTween(MainMainFrame1,1.5,{Size=u2(0, 925, 0, 510)})
local ActualFrameOpenPos=BetterTween(MainMainFrame1,1.5,{Position=u2(0, 0, 0, -12)})


local ActualFrameCloseSize=BetterTween(MainMainFrame1,1.5,{Size=u2(0, 892, 0, 0)})
local ActualFrameClosePos=BetterTween(MainMainFrame1,1.5,{Position=u2(0, 0, 0, 258)})







local MainMainFrameOpenPos=BetterTween(SubMain,1.5,{Position=u2(0, 0, 0, 30)})
local MainMainFrameOpenSize=BetterTween(SubMain,1.5,{Size=u2(0, 642, 0, 400)})

local MainMainFrameClosePos=BetterTween(SubMain,1.5,{Position=u2(0, 640, 0, 30)})
local MainMainFrameCloseSize=BetterTween(SubMain,1.5,{Size=u2(0, 0, 0, 400)})




local Tweening1=false
local ti0=false
CredsButton.MouseButton1Click:Connect(function()
clik()
if Tweening1 then return end
Tweening1=true
ti0=not ti0

if ti0 then 
CreditsTweenOpenPos:Play()
CreditsTweenOpenSize:Play()
MainMainFrameClosePos:Play()
MainMainFrameCloseSize:Play()
CreditsTweenOpenSize.Completed:Connect(function()Tweening1=false end)
else
MainMainFrameOpenPos:Play()
MainMainFrameOpenSize:Play()
CreditsTweenClosePos:Play()
CreditsTweenCloseSize:Play()
CreditsTweenCloseSize.Completed:Connect(function()Tweening1=false end)
end


end)


local Tweening2=false
local ti1=false 
Interface["Close_b"].MouseButton1Click:Connect(function()
 clik()
 Interface["Main_Interface_1"]:Destroy()
 StopScript()
 end)
Tab.MouseButton1Click:Connect(function()
if Tweening2 then return end 
Tweening2=true 
clik()
ti1=not ti1
if ti1 then 
CanvasShown:Play()
CanvasShown.Completed:Connect(function() Tweening2=false end)
else
CanvasHidden:Play()
CanvasHidden.Completed:Connect(function() Tweening2=false end)
end


end)


local Tweening3=false
local ti2=false 
Minimize.MouseButton1Click:Connect(function()
ActualFrameCloseSize:Play()
clik()
ActualFrameCloseSize.Completed:Connect(function()
ToggleGui.Visible=true
end)
end)
Interface["ToggleGui_2"].MouseButton1Click:Connect(function()
ActualFrameOpenSize:Play()
clik()
ToggleGui.Visible=false

end)
--Draggable(Interface["ToggleGui_2"],Interface["ToggleGui_2"])


local lolframe=Instance.new("Frame",Interface["Visualize_10"])
lolframe.Name="Container1"
lolframe.AnchorPoint=Vector2.new(.5,.5)
lolframe.Position=u2(0,130,1,-1)
lolframe.Rotation=270
lolframe.Size=UDim2.new(.75,0,.15,25)
lolframe.Transparency=1
lolframe.Rotation=0
lolframe.ZIndex=0
local fr3=Instance.new("Frame",lolframe)
fr3.Name="Bar1"
fr3.Size=UDim2.new(0,5,0,5)
fr3.BackgroundColor3=Color3.fromRGB(255,0,0)
fr3.Transparency=0
fr3.ZIndex=-50
fr3.BorderSizePixel=1
fr3.BorderColor3=Color3.new()
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new 

--grad1.Rotation=90
local listlay1=Instance.new("UIListLayout",lolframe)
listlay1.Padding=UDim.new(0,1)
listlay1.FillDirection="Horizontal"
listlay1.HorizontalAlignment="Left"
listlay1.SortOrder="LayoutOrder"
listlay1.VerticalAlignment="Center"


function TweenFunction(obj, speed,whattype, anim)
local Tinfo=TweenInfo.new
local TweenService=game.TweenService
local hii=Tinfo(speed, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
if whattype =="pos" then
return TweenService:Create(obj, hii,{Position=anim})
elseif whattype =="size" then
return TweenService:Create(obj, hii,{Size=anim})
elseif whattype =="bt" then
return TweenService:Create(obj, hii,{BackgroundTransparency=anim})
elseif whattype =="trans" then
return TweenService:Create(obj, hii,{Transparency=anim})
elseif whattype=="rot" then
return TweenService:Create(obj, hii,{Rotation=anim})
elseif whattype=="brightness" then
return TweenService:Create(obj, hii,{Brightness=anim})
end
end
tspawn(function()
local ImageTable={}

while Interface["Main_Interface_1"] do 
tclear(ImageTable)
local files = listfiles(Images)
for _, path in pairs(files) do
local fileName = path:match("([^/]+)$")
--repeat writefile(Images,HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/"..fileName.."?raw=true")) until path

--print(fileName)
table.insert(ImageTable,path)
end
local s=BetterTween(Interface["PreviewImage_21"],1.35,{ImageTransparency=1})
s:Play()
s.Completed:Wait()
pcall(function()
Interface["PreviewImage_21"]["Image"]=getcustomasset(ImageTable[math.random(1,#ImageTable)])
end)
local s=BetterTween(Interface["PreviewImage_21"],1.35,{ImageTransparency=0})
s:Play()
s.Completed:Wait()
twait(1)
end
end)
fr3.Parent=nil
local marker=200
local startfreq=0
local endfreq=100
task.spawn(function()
for i=1, marker do
local bar1=fr3:Clone()
local freq=startfreq + (i-1) * (endfreq - startfreq) / (marker - 1) *.1
bar1.LayoutOrder=freq
bar1.Name=freq
bar1.Parent=lolframe
bar1.ZIndex=1
bar1.Transparency=.1
TweenFunction(bar1,1,"size",UDim2.new(0,1,.055,0)):Play()
end 
end)
fr3.Size=UDim2.new(0,1,.15,0)
task.spawn(function()
local update1=1
function This3()
pcall(function()
local ss=game:GetService("SoundService")
local MusicPlayer=ss:FindFirstChild("GlitcherAudioPlayer")
local analyzer=MusicPlayer["Analyzer"]
if MusicPlayer.TimePosition==0 then return end
update1+=1
task.spawn(function()
local spectrum=analyzer:GetSpectrum()
local spectrumCount=#spectrum
local SafeTreshold=0.00001
local currentTime=tick()
for i, v in ipairs(lolframe:GetChildren()) do
if v:IsA("Frame")  then
local spectrumIndex=math.floor((tonumber(v.Name) / marker) * spectrumCount) + 1
spectrumIndex=math.clamp(spectrumIndex, 1, spectrumCount)
local magnitude=spectrum[spectrumIndex] or 0
local scale=math.min(magnitude / 0.0030 * 2, 550)
local i_pos=tonumber(v.Name) / marker
if magnitude > SafeTreshold then
local targetSize=u2(fr3.Size.X.Scale, fr3.Size.X.Offset,math.min(fr3.Size.Y.Scale * scale, 3-.15*math.sin((tick()*i_pos)+update1/2.5)), fr3.Size.Y.Offset)
v.Size=v.Size:Lerp(targetSize, .45)
else
v.Size=v.Size:Lerp(u2(fr3.Size.X.Scale, fr3.Size.X.Offset, .0100,fr3.Size.Y.Offset), 0.25)
end
end
end

end)
end)
end

hhh=PostSimulation:Connect(function()
if not script.Parent then 
hhh:Disconnect()
end
pcall(function()
This3()
for _,v in MainMainFrame1.Parent:GetDescendants() do 
if v:IsA("UIGradient") then 
v.Rotation=v.Rotation+1
end
end
end)



end)
end)


end;
task.spawn(C_1d);
