local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 1. APPLY GALAXY SKYBOX (Brainrot Edition)
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
end
ApplyGalaxy()

-- 2. UI CONFIG
local colors = {
    SchemeColor = Color3.fromRGB(0, 150, 255), 
    Background = Color3.fromRGB(10, 10, 20),
    Header = Color3.fromRGB(15, 15, 30),
    TextColor = Color3.fromRGB(255, 255, 255), 
    ElementColor = Color3.fromRGB(20, 20, 40)
}

local Window = Library.CreateLib("ARHAM'S AMBITIOUS SAB", colors)

-- AMBITIOUS SAB TAB (Steal a Brainrot Focused)
local AmbTab = Window:NewTab("Ambitious SAB")
local AmbSection = AmbTab:NewSection("Steal a Brainrot Specials")

-- AUTO STEAL TOGGLE
AmbSection:NewToggle("Auto Steal", "Automatically grabs nearby items", function(state)
    _G.AutoSteal = state
    while _G.AutoSteal do
        -- This looks for objects with "Handle" or "ClickDetector" common in SAB
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
        end
        task.wait(0.1)
    end
end)

-- LASERGUN TOGGLE
AmbSection:NewToggle("Lasergun Fucker", "Rapid fire/Enhanced range", function(state)
    _G.LaserEnhance = state
    -- Custom logic for enhancing the Lasergun tool if held
end)

-- MOVEMENT
local MoveSection = AmbTab:NewSection("Movement")
MoveSection:NewSlider("Move Speed", "Default is 16", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MoveSection:NewSlider("Gravity", "Default is 196", 196, 0, function(s)
    game.Workspace.Gravity = s
end)

-- YOUR OTHER SCRIPTS (Spawner, Lag, Dupe)
local MainTab = Window:NewTab("Vault")
local MainSection = MainTab:NewSection("Saved Scripts")

MainSection:NewButton("Spawner Script", "Xware Spawner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Crypoth/StealABrainRotSpawner/refs/heads/main/XwareSpawner"))()
end)

MainSection:NewButton("Lag Script", "999 Lagswitch", function()
    loadstring(game:HttpGet("https://paste.gg/p/anonymous/d3492bd620bd4c46b54680ac80b0fa0d/files/161ddd9c992c4ceba3c298458d45188a/raw", true))()
end)

MainSection:NewButton("Dupe 2", "Pastefy Method", function()
    loadstring(game:HttpGet("https://pastefy.app/HTy0RxVY/raw"))()
end)

Library:Notify("SAB Loaded", "Ready to steal everything, Arham.", Color3.fromRGB(0, 150, 255))
