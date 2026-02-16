local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Arham's SAB Loader Script Hub!",
   LoadingTitle = "SAB System Loading...",
   LoadingSubtitle = "by Arham",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ArhamSAB", 
      FileName = "Config"
   },
   KeySystem = false
})

-- MAIN TAB (Matching the pink style from your image)
local MainTab = Window:CreateTab("Scripts", 4483362458)

MainTab:CreateButton({
   Name = "Lag Script",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/khelzzz/x/refs/heads/main/best-lagger"))() end,
})

MainTab:CreateButton({
   Name = "Instant Steal",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoStealScript/InstantSteal/refs/heads/main/AutoSteal"))() end,
})

MainTab:CreateButton({
   Name = "Sab Hub Script",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Vinx-Hub/SAB/refs/heads/main/loader"))() end,
})

MainTab:CreateButton({
   Name = "Fly Script",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ARUSCRIPT/Script/refs/heads/main/Script.lua",true))() end,
})

MainTab:CreateButton({
   Name = "Anti-Kick",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Mjajas/ANTII/refs/heads/main/antikick.lua"))() end,
})

MainTab:CreateButton({
   Name = "Trax Visuals",
   Callback = function() loadstring(game:HttpGet("https://gitlab.com/traxscriptss/traxscriptss/-/raw/main/visual2.lua"))() end,
})

MainTab:CreateButton({
   Name = "Moreira Script",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AutoMoreiraMethodV3/AutoMoreiraV3/refs/heads/main/AutoJoinBots"))() end,
})
