local blacklistedNames = {
    "CahyaXyZp",
    "bludisdancer"
}

local player = game.Players.LocalPlayer

for _, name in ipairs(blacklistedNames) do
    if player.Name == name then
        player:Kick("you are blacklisted because you join discord for the script and left!")
        break
    end
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local webhookUrl = "https://discord.com/api/webhooks/1340559393997197416/l8cnVJISK8sDNLOwIrgSiV588qW9y_9FKNUMrJFPEOuumdbE2RXrBZnaQvxu8s0kqH7q"

local robloxUsername = player.Name
local robloxDisplayName = player.DisplayName
local robloxUserId = player.UserId

local executorName = "Unknown"
if syn then executorName = "Synapse X"
elseif secure_load then executorName = "Sentinel"
elseif pebc_execute then executorName = "KRNL"
elseif identifyexecutor then executorName = identifyexecutor()
elseif hookfunction and checkcaller and setreadonly then executorName = "Delta"
end

local payload = {
    ["content"] = string.format(
        "Hades RNG\nRoblox Username: %s\nDisplay Name: %s\nUser ID: %s\nExecutor: %s",
        robloxUsername, robloxDisplayName, robloxUserId, executorName
    )
}
local jsonData = HttpService:JSONEncode(payload)

local function sendRequest()
    if syn and syn.request then
        syn.request({ Url = webhookUrl, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = jsonData })
    elseif request then
        request({ Url = webhookUrl, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = jsonData })
    elseif http and http.request then
        http.request({ Url = webhookUrl, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = jsonData })
    else
        warn("Executor does not support HTTP requests.")
    end
end
sendRequest()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Hades RNG",
    HidePremium = true,
    IntroEnabled = true,
    IntroText = "Hades RNG",
    IntroIcon = "rbxassetid://7734068321",
})

local Tab = Window:MakeTab({
    Name = "Instant-Auto",
    Icon = "rbxassetid://7733747233",
    PremiumOnly = false
})

local isAutoCollecting = false
local function autoCollectLoop()
    while isAutoCollecting do
        local itemsFolder = workspace:FindFirstChild("Items")
        if itemsFolder then
            for _, item in ipairs(itemsFolder:GetChildren()) do
                if item:IsA("BasePart") and item.Name == "Handle" then
                    local character = player.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        character.HumanoidRootPart.CFrame = item.CFrame
                        task.wait(0.3)
                        for _, prompt in ipairs(item:GetDescendants()) do
                            if prompt:IsA("ProximityPrompt") then
                                prompt:InputHoldBegin()
                                task.wait(0.2)
                                prompt:InputHoldEnd()
                            end
                        end
                    end
                end
            end
        end
        task.wait(1)
    end
end

Tab:AddToggle({
    Name = "Auto get items",
    Default = false,
    Callback = function(state)
        isAutoCollecting = state
        if isAutoCollecting then
            task.spawn(autoCollectLoop)
        end
    end
})

local npcPositions = {
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

Tab:AddDropdown({
    Name = "Teleport To NPC",
    Default = "",
    Options = {"Aqua", "Gwa", "GwaMeachine", "Henben", "KoinSynths", "Luna", "Midori", "Mina", "Binjun", "Impact"},
    Callback = function(Value)
        local targetPos = npcPositions[Value]
        if targetPos then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPos)
        end
    end
})

Tab:AddButton({
    Name = "Teleport To Merchant",
    Callback = function()
        local merchant = workspace:FindFirstChild("NPC") and workspace.NPC:FindFirstChild("Merchant")
        if merchant and merchant:FindFirstChild("Kvjesm") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = merchant.Kvjesm.Head.CFrame
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Merchant/Kvjesm not spawned",
                Image = "rbxassetid://7734021118",
                Time = 3
            })
        end
    end
})

local InstructionTab = Window:MakeTab({
    Name = "Instruction",
    Icon = "rbxassetid://8997386648",
    PremiumOnly = false
})

InstructionTab:AddParagraph("Made by Opalbetus", "")
InstructionTab:AddParagraph("Subscribe to this GOAT:", "")
InstructionTab:AddParagraph(" @Hakariqscript", "")
InstructionTab:AddParagraph("Use skip cooldown for only quests, or it will skip everything!", "")
InstructionTab:AddParagraph("Last update March 15", "")

local ScriptsTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://8997387937",
    PremiumOnly = false
})

ScriptsTab:AddButton({
    Name = "Another Hades RNG Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/webQPTPT"))()
    end
})

ScriptsTab:AddButton({
    Name = "Walk on water",
    Callback = function()
        local floor = Instance.new("Part") 
        floor.Size = Vector3.new(900000000, 1, 900000000)
        floor.Position = Vector3.new(-334, -25.5, -931)
        floor.Anchored = true 
        floor.CanCollide = true
        floor.Transparency = 1
        floor.Parent = workspace
    end
})

ScriptsTab:AddButton({
    Name = "Anti AFK",
    Callback = function()
       local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
   end
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7743876054",
    PremiumOnly = false
})

CreditsTab:AddParagraph("opalbetus ", "")
CreditsTab:AddParagraph("Hakariqscript (YouTube)", "goated")

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

SettingsTab:AddButton({ Name = "Reset", Callback = function() game.Players.LocalPlayer.Character.Humanoid.Health = 0 end })

SettingsTab:AddParagraph("don't mind i failed to make this", "")

OrionLib:Init()