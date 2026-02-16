local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
-- This library allows for more custom color schemes

local Window = Library.CreateLib("Arham's SAB Loader - GALAXY EDITION", "VapeV4")

-- Creating the Galaxy Theme (Purple/Black/Neon)
local MainTab = Window:NewTab("Main Scripts")
local MainSection = MainTab:NewSection("Galaxy Hub - Arham")

-- BACKGROUND TWEAK: To get the galaxy effect, we use a custom purple theme
-- Note: Most libraries use pre-set colors, but we will force Purple Neon here.

MainSection:NewButton("Lag Script", "Lags the server", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/khelzzz/x/refs/heads/main/best-lagger"))()
end)

MainSection:NewButton("Instant Steal", "Steals items instantly", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoStealScript/InstantSteal/refs/heads/main/AutoSteal"))()
end)

MainSection:NewButton("Sab Hub Script", "Loads the SAB hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vinx-Hub/SAB/refs/heads/main/loader"))()
end)

MainSection:NewButton("Fly Script", "Toggle Flight", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ARUSCRIPT/Script/refs/heads/main/Script.lua",true))()
end)

MainSection:NewButton("Anti-Kick", "Prevents being kicked", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mjajas/ANTII/refs/heads/main/antikick.lua"))()
end)

MainSection:NewButton("Trax Visuals", "Visual enhancements", function()
    loadstring(game:HttpGet("https://gitlab.com/traxscriptss/traxscriptss/-/raw/main/visual2.lua"))()
end)

MainSection:NewButton("Moreira Script", "Auto join bots", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoMoreiraMethodV3/AutoMoreiraV3/refs/heads/main/AutoJoinBots"))()
end)

-- ADDING THE PURPLE GLOW
for i, v in pairs(game.CoreGui:GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") then
        v.TextColor3 = Color3.fromRGB(180, 0, 255) -- Neon Purple
    end
end
