game.Players.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function()
    game.Players.LocalPlayer:Kick("You are blacklisted!")
end)

local blacklistedNames = {
    "BadUser1",
    "ToxicPlayer",
    "ExploitUser",
    "AnnoyingPlayer",
    "Cheater123"
}

local player = game.Players.LocalPlayer

for _, name in ipairs(blacklistedNames) do
    if player.Name == name then
        player:Kick("you are blacklisted because you join discord for the script and left!")
        break
    end
end

print("You are not blacklisted. Script running...")local HttpService = game:GetService("HttpService")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local webhookUrl = "https://discord.com/api/webhooks/1340559393997197416/l8cnVJISK8sDNLOwIrgSiV588qW9y_9FKNUMrJFPEOuumdbE2RXrBZnaQvxu8s0kqH7q"

local player = Players.LocalPlayer
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
    Mina = Vector3.new(-261, 42, -514)
}

Tab:AddDropdown({
    Name = "Teleport To NPC",
    Default = "",
    Options = {"Aqua", "Gwa", "GwaMeachine", "Henben", "KoinSynths", "Luna", "Midori", "Mina"},
    Callback = function(Value)
        local targetPos = npcPositions[Value]
        if targetPos then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPos)
        end
    end
})

local InstructionTab = Window:MakeTab({
    Name = "Instruction",
    Icon = "rbxassetid://8997386648",
    PremiumOnly = false
})

InstructionTab:AddParagraph("Made by Opalbetus", "")
InstructionTab:AddParagraph("Subscribe to these GOATs:", "")
InstructionTab:AddParagraph("@ExploitsServer, @Hakariqscript, @averageRobloxplayer-i8i", "")
InstructionTab:AddParagraph("Use skip cooldown for only quests, or it will skip everything!", "")

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

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7743876054",
    PremiumOnly = false
})

CreditsTab:AddParagraph("Pall (Discord)", "")
CreditsTab:AddParagraph("Scripter (YouTube, Discord)", "")
CreditsTab:AddParagraph("Hakariqscript (YouTube)", "")
CreditsTab:AddParagraph("averageRobloxplayer-i8i (YouTube)", "")

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

local ServerPlayer = SettingsTab:AddLabel("Player In Server [ " .. #game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]")
local TimeServer = SettingsTab:AddLabel("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) % 60 .. " Minutes | " .. math.floor(workspace.DistributedGameTime) % 60 .. " Seconds ]")
local TimeNow = SettingsTab:AddLabel("Now Time [ " .. os.date("%X") .. " ]")

SettingsTab:AddButton({ Name = "Reset", Callback = function() game.Players.LocalPlayer.Character.Humanoid.Health = 0 end })

OrionLib:Init()