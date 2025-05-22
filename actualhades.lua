local p = game:GetService("Players").LocalPlayer
local r = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local w = r:CreateWindow({
    Name = "Hades RNG",
    LoadingTitle = "Hades RNG",
    LoadingSubtitle = "by opalbetus",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "HadesRNG",
        FileName = "HadesRNGConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "yourInviteHere",
        RememberJoins = false
    },
    KeySystem = false,
    KeySettings = {
        Title = "Hades RNG",
        Subtitle = "Key System",
        Note = "Get the key from Discord",
        FileName = "KeyFile",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"your-key-here"}
    }
})

local t1 = w:CreateTab("Main", 7733747233)
local a = false
local c = 0

local function l()
    while a do
        local m = workspace:FindFirstChild("Items") and workspace.Items:FindFirstChild("Main")
        if m then
            for _, v in ipairs(m:GetChildren()) do
                if v:IsA("Model") or v:IsA("BasePart") then
                    local b = v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") or v
                    local h = p.Character
                    if b and h and h:FindFirstChild("HumanoidRootPart") then
                        h.HumanoidRootPart.CFrame = b.CFrame + Vector3.new(0, 3, 0)
                        task.wait(0.2)
                        for _, g in ipairs(v:GetDescendants()) do
                            if g:IsA("ProximityPrompt") then
                                g:InputHoldBegin()
                                task.wait(0.3)
                                g:InputHoldEnd()
                                c += 1
                                r:Notify({
                                    Title = "Item Collected",
                                    Content = "Collected " .. c .. " item(s)",
                                    Duration = 2,
                                    Image = 7734053495
                                })
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

t1:CreateToggle({
    Name = "Auto Get Items",
    CurrentValue = false,
    Callback = function(v)
        a = v
        if a then task.spawn(l) end
    end
})

t1:CreateButton({
    Name = "Teleport To Merchant",
    Callback = function()
        local m = workspace:FindFirstChild("NPC") and workspace.NPC:FindFirstChild("Merchant")
        if m and m:FindFirstChild("Kvjesm") then
            p.Character.HumanoidRootPart.CFrame = m.Kvjesm.Head.CFrame
        else
            r:Notify({
                Title = "Error",
                Content = "Merchant/Kvjesm not spawned",
                Duration = 3,
                Image = 7734021118
            })
        end
    end
})

local t2 = w:CreateTab("Scripts", 8997387937)

t2:CreateButton({
    Name = "Walk on water",
    Callback = function()
        local p1 = Instance.new("Part")
        p1.Size = Vector3.new(900000000,1,900000000)
        p1.Position = Vector3.new(-334,-25.5,-931)
        p1.Anchored = true
        p1.CanCollide = true
        p1.Transparency = 1
        p1.Parent = workspace

        local p2 = Instance.new("Part")
        p2.Size = Vector3.new(200,1,200)
        p2.Position = Vector3.new(-469,30,-739)
        p2.Anchored = true
        p2.CanCollide = true
        p2.Transparency = 1
        p2.Parent = workspace
    end
})

t2:CreateButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        p.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end
})

local t3 = w:CreateTab("Misc", 7734053495)
t3:CreateButton({Name="Reset Character", Callback=function() p.Character.Humanoid.Health = 0 end})
t3:CreateButton({Name="Freeze Character", Callback=function() p.Character.Head.Anchored = true end})
t3:CreateButton({Name="Unfreeze", Callback=function() p.Character.Head.Anchored = false end})
t3:CreateButton({Name="Destroy Library", Callback=function() r:Destroy() end})
t3:CreateParagraph({Title="Note", Content="i made this for fun"})

local t4 = w:CreateTab("Credits", 7743876054)
t4:CreateParagraph({Title="opalbetus", Content="owner (i own yall)"})
t4:CreateParagraph({Title="Hakariqscript (YouTube)", Content="goated"})