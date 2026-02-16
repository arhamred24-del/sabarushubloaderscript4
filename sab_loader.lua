local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 1. APPLY GALAXY SKYBOX & LIGHTING
local function ApplyGalaxy()
    local Lighting = game:GetService("Lighting")
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
    local Sky = Instance.new("Sky")
    Sky.Name = "GalaxySky"
    Sky.Parent = Lighting
    Sky.SkyboxBk = "rbxassetid://159454299"
    Sky.SkyboxDn = "rbxassetid://159454286"
    Sky.SkyboxFt = "rbxassetid://159454293"
    Sky.SkyboxLf = "rbxassetid://159454296"
    Sky.SkyboxRt = "rbxassetid://159454289"
    Sky.SkyboxUp = "rbxassetid://159454300"
    Sky.SunAngularSize = 0
    Lighting.FogColor = Color3.fromRGB(40, 0, 80)
    Lighting.OutdoorAmbient = Color3.fromRGB(120, 0, 255)
end
ApplyGalaxy()

-- 2. UI CONFIG
local colors = {
    SchemeColor = Color3.fromRGB(180, 0, 255), -- Neon Purple
    Background = Color3.fromRGB(15, 0, 30),
    Header = Color3.fromRGB(30, 0, 60),
    TextColor = Color3.fromRGB(255, 255, 255), 
    ElementColor = Color3.fromRGB(25, 0, 50)
}

local Window = Library.CreateLib("ARHAM'S GALAXY HUB", colors)

-- TELEPORT LOGIC
local SavedPos = nil

-- MAIN TAB
local MainTab = Window:NewTab("Main Scripts")
local MainSection = MainTab:NewSection("Galaxy Exploits")

MainSection:NewButton("Spawner Script", "Xware Spawner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Crypoth/StealABrainRotSpawner/refs/heads/main/XwareSpawner"))()
end)

MainSection:NewButton("Lag Script", "999 Lagswitch", function()
    loadstring(game:HttpGet("https://paste.gg/p/anonymous/d3492bd620bd4c46b54680ac80b0fa0d/files/161ddd9c992c4ceba3c298458d45188a/raw", true))()
end)

-- DUPE SECTION
local DupeSection = MainTab:NewSection("Dupe Methods")
DupeSection:NewButton("Dupe Script 1", "Brainrot Dupe", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BrainrotDupeScript/SAB-DupeScript/refs/heads/main/DupeBrainrots"))()
end)
DupeSection:NewButton("Dupe Script 2", "Pastefy Method", function()
    loadstring(game:HttpGet("https://pastefy.app/HTy0RxVY/raw"))()
end)

-- TELEPORT TAB
local TP_Tab = Window:NewTab("Teleport")
local TP_Section = TP_Tab:NewSection("Position Saver")

TP_Section:NewButton("Save Position", "Saves your current coordinates", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        SavedPos = player.Character.HumanoidRootPart.CFrame
        Library:Notify("Position Saved!", "You can now teleport back here.", Color3.fromRGB(180, 0, 255))
    end
end)

TP_Section:NewButton("Teleport to Saved", "Go back to your saved spot", function()
    local player = game.Players.LocalPlayer
    if SavedPos and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = SavedPos
    else
        Library:Notify("Error", "No position saved yet!", Color3.fromRGB(255, 0, 0))
    end
end)

-- EXTRAS
local OtherTab = Window:NewTab("Extras")
local OtherSection = OtherTab:NewSection("Other Hubs")
OtherSection:NewButton("Instant Steal", "AutoSteal Items", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoStealScript/InstantSteal/refs/heads/main/AutoSteal"))()
end)
OtherSection:NewButton("Sab Hub Script", "Vinx-Hub SAB Loader", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vinx-Hub/SAB/refs/heads/main/loader"))()
end)

Library:Notify("Galaxy Loaded", "Arham's SAB Hub is active.", Color3.fromRGB(180, 0, 255))
