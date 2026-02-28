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
    Lighting.OutdoorAmbient = Color3.fromRGB(150, 0, 255)
end
ApplyGalaxy()

local Window = Library.CreateLib("ARHAM'S AMBITIOUS SAB", "DarkTheme")
local AmbTab = Window:NewTab("Ambitious SAB")

-- NEW SECTION: AUTO-KICK LOGIC
local ProtectSection = AmbTab:NewSection("Item Protection")

ProtectSection:NewToggle("Auto-Kick on Steal", "Kicks you instantly when you get a Brainrot", function(state)
    _G.AutoKick = state
    
    local player = game.Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    
    -- Monitors your backpack for new items
    backpack.ChildAdded:Connect(function(child)
        if _G.AutoKick and (child:IsA("Tool") or child.Name:find("Brainrot")) then
            task.wait(0.05) -- Tiny delay to ensure the server registers the item is yours
            player:Kick("ANTI-STEAL ACTIVE: You successfully secured a Brainrot!")
        end
    end)
    
    -- Also monitors your Character (in case you equip it instantly)
    player.Character.ChildAdded:Connect(function(child)
        if _G.AutoKick and child:IsA("Tool") then
            player:Kick("ANTI-STEAL ACTIVE: Item secured in hand!")
        end
    end)
end)

-- TRADE EXPLOITS & MEOW PANEL
local TradeSection = AmbTab:NewSection("Trade Exploits")
TradeSection:NewButton("Open Meow Toggle Panel", "Opens the red/blue/purple panel", function()
    -- [The Meow Panel code from the previous step goes here]
    Library:Notify("Meow Panel", "Panel is now active on your screen.", Color3.fromRGB(130, 60, 220))
end)

-- MOVEMENT
local MoveSection = AmbTab:NewSection("Movement")
MoveSection:NewSlider("Move Speed", "Speed", 500, 16, function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)
MoveSection:NewToggle("Infinite Jump", "Jump spam", function(state)
    _G.InfJump = state
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if _G.InfJump then game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
    end)
end)

-- SERVER TOOLS
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

Library:Notify("SAB Loaded", "Auto-Kick & Meow Panel Ready", Color3.fromRGB(0, 150, 255))
