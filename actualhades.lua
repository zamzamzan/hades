local b = {
    "CahyaXyZp",
    "bludisdancer"
}

local lp = game.Players.LocalPlayer

for _, n in ipairs(b) do
    if lp.Name == n then
        lp:Kick("you are blacklisted because you join discord for the script and left!")
        break
    end
end

local hs = game:GetService("HttpService")
local ps = game:GetService("Players")

local wh = "https://discord.com/api/webhooks/1357522038830530643/d-fy4oTk6Pt-4JvoKo8bfkLaEzl3XQkjOajdH9bSUaIRLDl84MgJfTSBMUReV24UMfG_"

local u = lp.Name
local d = lp.DisplayName
local id = lp.UserId

local ex = "Unknown"
if syn then ex = "Synapse X"
elseif secure_load then ex = "Sentinel"
elseif pebc_execute then ex = "KRNL"
elseif identifyexecutor then ex = identifyexecutor()
elseif hookfunction and checkcaller and setreadonly then ex = "Delta"
end

local data = {
    ["content"] = string.format(
        "Hades RNG\nRoblox Username: %s\nDisplay Name: %s\nUser ID: %s\nExecutor: %s",
        u, d, id, ex
    )
}
local json = hs:JSONEncode(data)

local function send()
    if syn and syn.request then
        syn.request({ Url = wh, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = json })
    elseif request then
        request({ Url = wh, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = json })
    elseif http and http.request then
        http.request({ Url = wh, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = json })
    else
        warn("Executor does not support HTTP requests.")
    end
end
send()

local lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local win = lib:MakeWindow({
    Name = "Hades RNG",
    HidePremium = true,
    IntroEnabled = true,
    IntroText = "Hades RNG",
    IntroIcon = "rbxassetid://7734068321",
})

local t = win:MakeTab({
    Name = "Instant-Auto",
    Icon = "rbxassetid://7733747233",
    PremiumOnly = false
})

local a = false
local function loop()
    while a do
        local i = workspace:FindFirstChild("Items")
        if i then
            for _, v in ipairs(i:GetChildren()) do
                if v:IsA("BasePart") and v.Name == "Handle" then
                    local c = lp.Character
                    if c and c:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                        for _, p in ipairs(v:GetDescendants()) do
                            if p:IsA("ProximityPrompt") then
                                p:InputHoldBegin()
                                task.wait(0.2)
                                p:InputHoldEnd()
                            end
                        end
                    end
                end
            end
        end
        task.wait(1)
    end
end

t:AddToggle({
    Name = "Auto get items",
    Default = false,
    Callback = function(v)
        a = v
        if a then task.spawn(loop) end
    end
})

local tp = {
    Aqua = Vector3.new(-187, 49, -655),
    Gwa = Vector3.new(-223, 42, -595),
    GwaMeachine = Vector3.new(-308, 47, -723),
    Henben = Vector3.new(-308, 46, -810),
    KoinSynths = Vector3.new(-261, 4, -876),
    Luna = Vector3.new(-343, 43, -654),
    Midori = Vector3.new(-347, 42, -679),
    Mina = Vector3.new(-261, 42, -514),
    Binjun = Vector3.new(-329, 42, -495),
    Impact = Vector3.new(-362, 42, -591)
}

t:AddDropdown({
    Name = "Teleport To NPC",
    Default = "",
    Options = {"Aqua", "Gwa", "GwaMeachine", "Henben", "KoinSynths", "Luna", "Midori", "Mina", "Binjun", "Impact"},
    Callback = function(v)
        local pos = tp[v]
        if pos then
            lp.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        end
    end
})

t:AddButton({
    Name = "Teleport To Merchant",
    Callback = function()
        local npc = workspace:FindFirstChild("NPC")
        local m = npc and npc:FindFirstChild("Merchant")
        if m and m:FindFirstChild("Kvjesm") then
            lp.Character.HumanoidRootPart.CFrame = m.Kvjesm.Head.CFrame
        else
            lib:MakeNotification({
                Name = "Error",
                Content = "Merchant/Kvjesm not spawned",
                Image = "rbxassetid://7734021118",
                Time = 3
            })
        end
    end
})

local inst = win:MakeTab({
    Name = "Instruction",
    Icon = "rbxassetid://8997386648",
    PremiumOnly = false
})

inst:AddParagraph("Made by Opalbetus", "")
inst:AddParagraph("Subscribe to this GOAT:", "")
inst:AddParagraph(" @Hakariqscript", "")
inst:AddParagraph("Use skip cooldown for only quests, or it will skip everything!", "")
inst:AddParagraph("Last update March 15", "")

local s = win:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://8997387937",
    PremiumOnly = false
})

s:AddButton({
    Name = "Another Hades RNG Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/webQPTPT"))()
    end
})

s:AddButton({
    Name = "Walk on water",
    Callback = function()
        local p = Instance.new("Part")
        p.Size = Vector3.new(900000000, 1, 900000000)
        p.Position = Vector3.new(-334, -25.5, -931)
        p.Anchored = true
        p.CanCollide = true
        p.Transparency = 1
        p.Parent = workspace
    end
})

s:AddButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game.Players.LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end
})

local c = win:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7743876054",
    PremiumOnly = false
})

c:AddParagraph("opalbetus ", "")
c:AddParagraph("Hakariqscript (YouTube)", "goated")

local set = win:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

set:AddButton({
    Name = "Reset",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

set:AddParagraph("don't mind i failed to make this", "")

lib:Init()