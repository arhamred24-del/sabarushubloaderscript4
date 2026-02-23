local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 1. GALAXY VISUALS
local function ApplyGalaxy()
    local Lighting = game:GetService("Lighting")
    for _, v in pairs(Lighting:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end
    local Sky = Instance.new("Sky")
    Sky.Name = "GalaxySky"; Sky.Parent = Lighting
    Sky.SkyboxBk = "rbxassetid://159454299"; Sky.SkyboxDn = "rbxassetid://159454286"
    Sky.SkyboxFt = "rbxassetid://159454293"; Sky.SkyboxLf = "rbxassetid://159454296"
    Sky.SkyboxRt = "rbxassetid://159454289"; Sky.SkyboxUp = "rbxassetid://159454300"
    Lighting.OutdoorAmbient = Color3.fromRGB(120, 0, 255)
end
ApplyGalaxy()

local Window = Library.CreateLib("ARHAM'S AMBITIOUS SAB", "DarkTheme")

-- AMBITIOUS SAB TAB
local AmbTab = Window:NewTab("Ambitious SAB")
local DupeSection = AmbTab:NewSection("SAB Lag-Grab Dupe (Experimental)")

DupeSection:NewButton("LAG-GRAB DUPE", "Click then GRAB within 2 seconds", function()
    Library:Notify("LAG STARTING", "Your game will freeze for 2 seconds. GRAB NOW!", Color3.fromRGB(255, 0, 0))
    
    -- This creates a massive lag spike on your end
    local lagTime = 2 
    local start = tick()
    
    -- Attempt to spam the grab while lagging
    while tick() - start < lagTime do
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
        end
        -- The empty loop below causes the "freeze"
        for i = 1, 1000000 do end 
    end
    
    Library:Notify("LAG ENDED", "Check your inventory for dupe.", Color3.fromRGB(0, 255, 0))
end)

-- MOVEMENT & COMBAT
local MoveSection = AmbTab:NewSection("Movement & Combat")
MoveSection:NewSlider("Move Speed", "Speed", 500, 16, function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)
MoveSection:NewToggle("Infinite Jump", "Jump spam", function(state)
    _G.InfJump = state
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if _G.InfJump then game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
    end)
end)

-- SERVER TAB
local ServerTab = Window:NewTab("Server")
local S_Section = ServerTab:NewSection("Server Tools")
S_Section:NewButton("Server Hop", "Find new lobby", function()
    local HttpService = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"
    local _srv = HttpService:JSONDecode(game:HttpGet(Api))
    for _, s in pairs(_srv.data) do
        if s.playing < s.maxPlayers and s.id ~= game.JobId then
            TPS:TeleportToPlaceInstance(game.PlaceId, s.id, game.Players.LocalPlayer)
        end
    end
end)

Library:Notify("SAB Loaded", "Galaxy Hub Active", Color3.fromRGB(0, 150, 255))
