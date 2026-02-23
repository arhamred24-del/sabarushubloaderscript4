local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 1. GALAXY VISUALS (Fixed & Glowing)
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

-- DUPE SECTION
local AmbTab = Window:NewTab("Ambitious SAB")
local DupeSection = AmbTab:NewSection("SAB Drop-Dupe (V4)")

DupeSection:NewButton("EXECUTE DROP-DUPE", "Hold item, click this, then BACKSPACE", function()
    Library:Notify("DUPE ACTIVE", "Press BACKSPACE to drop. Script will try to glitch the server.", Color3.fromRGB(255, 255, 0))
    
    local player = game.Players.LocalPlayer
    local char = player.Character
    
    -- This waits for you to drop the item, then instantly "stutters" your character
    local connection
    connection = char.ChildRemoved:Connect(function(child)
        if child:IsA("Tool") or child.Name:find("Brainrot") then
            -- Immediate "Stutter" Logic
            for i = 1, 50 do
                char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 0.1, 0)
            end
            Library:Notify("ATTEMPTED", "Check if item duplicated on ground.", Color3.fromRGB(0, 255, 0))
            connection:Disconnect()
        end
    end)
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

-- TELEPORT (Useful for escaping after a steal)
local TPSection = AmbTab:NewSection("Quick TP")
local SavedPos = nil

TPSection:NewButton("Save Spot", "Saves current location", function()
    SavedPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

TPSection:NewButton("TP Back", "Teleport to saved spot", function()
    if SavedPos then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SavedPos end
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

Library:Notify("Galaxy Loaded", "V4 Drop-Dupe Ready", Color3.fromRGB(0, 150, 255))
