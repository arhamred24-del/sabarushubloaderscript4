local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Creating the Window with a Purple "DarkTheme"
local Window = Library.CreateLib("ARHAM'S GALAXY LOADER", "DarkTheme")

-- GALAXY THEME TWEAKS (Forces Purple Neon Glow)
local MainTab = Window:NewTab("Main Scripts")
local MainSection = MainTab:NewSection("Galaxy Scripts")

-- 1. YOUR NEW LAG SCRIPT (Updated to the paste.gg link)
MainSection:NewButton("Lag Script", "999 Lagswitch (Paste.gg)", function()
    loadstring(game:HttpGet("https://paste.gg/p/anonymous/d3492bd620bd4c46b54680ac80b0fa0d/files/161ddd9c992c4ceba3c298458d45188a/raw", true))()
end)

-- 2. INSTANT STEAL
MainSection:NewButton("Instant Steal", "AutoSteal Items", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoStealScript/InstantSteal/refs/heads/main/AutoSteal"))()
end)

-- 3. SAB HUB
MainSection:NewButton("Sab Hub Script", "Vinx-Hub SAB Loader", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vinx-Hub/SAB/refs/heads/main/loader"))()
end)

-- 4. FLY
MainSection:NewButton("Fly Script", "Toggle Flight", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ARUSCRIPT/Script/refs/heads/main/Script.lua",true))()
end)

-- 5. ANTI-KICK
MainSection:NewButton("Anti-Kick", "Prevention System", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mjajas/ANTII/refs/heads/main/antikick.lua"))()
end)

-- 6. TRAX VISUALS
MainSection:NewButton("Trax Visuals", "Galaxy Graphics", function()
    loadstring(game:HttpGet("https://gitlab.com/traxscriptss/traxscriptss/-/raw/main/visual2.lua"))()
end)

-- 7. MOREIRA SCRIPT
MainSection:NewButton("Moreira Script", "AutoJoin Method", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoMoreiraMethodV3/AutoMoreiraV3/refs/heads/main/AutoJoinBots"))()
end)

-- PURPLE GLOW SETTINGS
for i, v in pairs(game.CoreGui:GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") then
        v.TextColor3 = Color3.fromRGB(180, 50, 255) -- Neon Purple
    end
end

Library:Notify("Galaxy Loaded", "Welcome to the Realm, Arham.", Color3.fromRGB(157, 0, 255))
