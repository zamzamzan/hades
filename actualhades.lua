local b={"CahyaXyZp","bludisdancer"}
local lp=game.Players.LocalPlayer
for _,n in ipairs(b)do
if lp.Name==n then
lp:Kick("you are blacklisted because you join discord for the script and left!")
break
end
end
loadstring(game:HttpGet("https://pastebin.com/raw/sGxBvPDM"))()
local lib=loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local win=lib:MakeWindow({Name="Hades RNG",HidePremium=true,IntroEnabled=true,IntroText="Hades RNG",IntroIcon="rbxassetid://7734068321"})
local t=win:MakeTab({Name="Main",Icon="rbxassetid://7733747233",PremiumOnly=false})
local a=false
local c=0
local function loop()
while a do
local m=workspace:FindFirstChild("Items")and workspace.Items:FindFirstChild("Main")
if m then
for _,v in ipairs(m:GetChildren())do
if v:IsA("Model")or v:IsA("BasePart")then
local p=v:IsA("Model")and v:FindFirstChildWhichIsA("BasePart")or v
local ch=lp.Character
if p and ch and ch:FindFirstChild("HumanoidRootPart")then
ch.HumanoidRootPart.CFrame=p.CFrame+Vector3.new(0,3,0)
task.wait(0.2)
for _,g in ipairs(v:GetDescendants())do
if g:IsA("ProximityPrompt")then
g:InputHoldBegin()
task.wait(0.3)
g:InputHoldEnd()
c+=1
lib:MakeNotification({Name="Item Collected",Content="Collected "..c.." item(s)",Time=2,Image="rbxassetid://7734053495"})
break
end
end
end
end
end
end
task.wait(1)
end
end
t:AddToggle({Name="Auto get items",Default=false,Callback=function(v)a=v if a then task.spawn(loop)end end})
local tp={Aqua=Vector3.new(-187,49,-655),Gwa=Vector3.new(-223,42,-595),GwaMeachine=Vector3.new(-308,47,-723),Henben=Vector3.new(-308,46,-810),KoinSynths=Vector3.new(-261,4,-876),Luna=Vector3.new(-343,43,-654),Midori=Vector3.new(-347,42,-679),Mina=Vector3.new(-261,42,-514),Binjun=Vector3.new(-419,43,-603),Impact=Vector3.new(-427,43,-517)}
t:AddDropdown({Name="Teleport To NPC",Default="",Options={"Aqua","Gwa","GwaMeachine","Henben","KoinSynths","Luna","Midori","Mina","Binjun","Impact"},Callback=function(v)local pos=tp[v]if pos then lp.Character.HumanoidRootPart.CFrame=CFrame.new(pos)end end})
t:AddButton({Name="Teleport To Merchant",Callback=function()local m=workspace:FindFirstChild("NPC")and workspace.NPC:FindFirstChild("Merchant")if m and m:FindFirstChild("Kvjesm")then lp.Character.HumanoidRootPart.CFrame=m.Kvjesm.Head.CFrame else lib:MakeNotification({Name="Error",Content="Merchant/Kvjesm not spawned",Image="rbxassetid://7734021118",Time=3})end end})
local i=win:MakeTab({Name="Instruction",Icon="rbxassetid://8997386648",PremiumOnly=false})
i:AddParagraph("Made by Opalbetus","")
i:AddParagraph("Subscribe to this GOAT:","")
i:AddParagraph("@Hakariqscript","")
i:AddParagraph("Use skip cooldown for only quests, or it will skip everything!","")
i:AddParagraph("Last update April 9","")
local s=win:MakeTab({Name="Scripts",Icon="rbxassetid://8997387937",PremiumOnly=false})
s:AddButton({Name="Another Hades RNG Script",Callback=function()loadstring(game:HttpGet("https://pastebin.com/raw/webQPTPT"))()end})
s:AddButton({Name="Walk on water",Callback=function()local p1=Instance.new("Part")p1.Size=Vector3.new(900000000,1,900000000)p1.Position=Vector3.new(-334,-25.5,-931)p1.Anchored=true p1.CanCollide=true p1.Transparency=1 p1.Parent=workspace local p2=Instance.new("Part")p2.Size=Vector3.new(200,1,200)p2.Position=Vector3.new(-469,30,-739)p2.Anchored=true p2.CanCollide=true p2.Transparency=1 p2.Parent=workspace end})
s:AddButton({Name="Anti AFK",Callback=function()local vu=game:GetService("VirtualUser")lp.Idled:Connect(function()vu:CaptureController()vu:ClickButton2(Vector2.new())end)end})
local cr=win:MakeTab({Name="Credits",Icon="rbxassetid://7743876054",PremiumOnly=false})
cr:AddParagraph("opalbetus ","owner(i own yall)")
cr:AddParagraph("Hakariqscript (YouTube)","goated")
local ms=win:MakeTab({Name="Misc",Icon="rbxassetid://7734053495",PremiumOnly=false})
ms:AddButton({Name="reset character",Callback=function()lp.Character.Humanoid.Health=0 end})
ms:AddButton({Name="freeze character",Callback=function()lp.Character.Head.Anchored=true end})
ms:AddButton({Name="unfreeze",Callback=function()lp.Character.Head.Anchored=false end})
ms:AddButton({Name="destroy library",Callback=function()lib:Destroy()end})
ms:AddParagraph("i made this for fun","")
lib:Init()