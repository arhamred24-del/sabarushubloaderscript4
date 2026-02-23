local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 1. GALAXY VISUALS
local function ApplyGalaxy()
    local Lighting = game:GetService("Lighting")
    for _, v in pairs(Lighting:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end
    local Sky = Instance.new("Sky")
    Sky.Name = "GalaxySky"
    Sky.Parent = Lighting
    Sky.SkyboxBk = "rbxassetid://159454299"
    Sky.SkyboxDn = "rbxassetid://159454286"
    Sky.SkyboxFt = "rbxassetid://159454293"
    Sky.SkyboxLf = "rbxassetid://159454296"
    Sky.SkyboxRt = "rbxassetid://159454289"
    Sky.SkyboxUp = "rbxassetid://159454300"
    Lighting.OutdoorAmbient = Color3.fromRGB(120, 0, 255)
end
ApplyGalaxy()

local colors = {
    SchemeColor = Color3.fromRGB(0, 150, 255), 
    Background = Color3.fromRGB(10, 10, 20),
    Header = Color3.fromRGB(15, 15, 30),
    TextColor = Color3.fromRGB(255, 255, 255), 
    ElementColor = Color3.fromRGB(20, 20, 40)
}

local Window = Library.CreateLib("ARHAM'S AMBITIOUS SAB", colors)

-- AMBITIOUS SAB TAB
local AmbTab = Window:NewTab("Ambitious SAB")

-- DUPE SECTION
local DupeSection = AmbTab:NewSection("SAB Dupe V3 (15s Method)")

DupeSection:NewButton("Start 15s Dupe Sequence", "Wait for countdown then GRAB", function()
    Library:Notify("Dupe Initialized", "Starting 15s Countdown. Stand near the item!", Color3.fromRGB(255, 255, 0))
    for i = 15, 1, -1 do
        task.wait(1)
        if i <= 5 then
            Library:Notify("PREPARE", "Grab in " .. i .. " seconds!", Color3.fromRGB(255, 0, 0))
        end
    end
    Library:Notify("GRAB NOW!", "Picking up item...", Color3.fromRGB(0, 255, 0))
    local endTime = tick() + 2
    while tick() < endTime do
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("ClickDetector") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Parent.Position).Magnitude < 15 then
                fireclickdetector(v)
            end
        end
        task.wait()
    end
end)

-- MOVEMENT & COMBAT
local MoveSection = AmbTab:NewSection("Movement & Combat")
MoveSection:NewToggle("Infinite Jump", "Spam space to fly", function(state)
    _G.InfJump = state
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if _G.InfJump then game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
    end)
end)

MoveSection:NewSlider("Move Speed", "Speed", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MoveSection:NewButton("Duel Lagger", "OP Lagger Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OP-Lagger/DuelLagger/refs/heads/main/Lagger"))()
end)

-- SERVER TAB (New!)
local ServerTab = Window:NewTab("Server")
local S_Section = ServerTab:NewSection("Server Management")

S_Section:NewButton("Server Hop", "Find a new Steal a Brainrot server", function()
    local HttpService = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"
    local function NextServer()
        local _srv = HttpService:JSONDecode(game:HttpGet(Api))
        for _, s in pairs(_srv.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TPS:TeleportToPlaceInstance(game.PlaceId, s.id, game.Players.LocalPlayer)
            end
        end
    end
    NextServer()
end)

S_Section:NewButton("Rejoin Server", "Reconnect to this server", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end)

-- VAULT (Backups)
local VaultTab = Window:NewTab("Vault")
local VSection = VaultTab:NewSection("Backup Scripts")
VSection:NewButton("Spawner Script", "Xware", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Crypoth/StealABrainRotSpawner/refs/heads/main/XwareSpawner"))() end)

Library:Notify("SAB Loaded", "Server Hop & Dupe Ready", Color3.fromRGB(0, 150, 255))
