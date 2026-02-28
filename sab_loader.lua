-- ARHAM'S AMBITIOUS ALL-IN-ONE SAB HUB
-- Features: Admin Panel, Meow Panel, Trade Freeze, Auto-Kick, Galaxy Sky

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 1. GALAXY VISUALS (Applied on Load)
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
    Lighting.OutdoorAmbient = Color3.fromRGB(150, 0, 255)
end
ApplyGalaxy()

local Window = Library.CreateLib("ARHAM'S AMBITIOUS SAB", "DarkTheme")

-- ==========================================
-- TAB 1: ADMIN & PLAYER MANAGEMENT
-- ==========================================
local AdminTab = Window:NewTab("Admin Panel")
local AdminSection = AdminTab:NewSection("Player List (Bypass Gamepass)")

AdminSection:NewButton("Open Admin Player List", "Block players officially", function()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local PlayerScroll = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")

    ScreenGui.Parent = game.CoreGui
    MainFrame.Name = "AdminPanel"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
    MainFrame.Size = UDim2.new(0, 320, 0, 400)
    MainFrame.Active = true
    MainFrame.Draggable = true

    Title.Parent = MainFrame
    Title.Text = "ADMIN PLAYER LIST"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.SourceSansBold

    PlayerScroll.Parent = MainFrame
    PlayerScroll.Position = UDim2.new(0, 10, 0, 50)
    PlayerScroll.Size = UDim2.new(1, -20, 1, -60)
    PlayerScroll.BackgroundTransparency = 1
    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    PlayerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    UIListLayout.Parent = PlayerScroll
    UIListLayout.Padding = UDim.new(0, 5)

    local function UpdateList()
        for _, v in pairs(PlayerScroll:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer then
                local Row = Instance.new("Frame")
                local NameLabel = Instance.new("TextLabel")
                local BlockBtn = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")

                Row.Size = UDim2.new(1, 0, 0, 35)
                Row.BackgroundColor3 = Color3.fromRGB(45, 50, 60)
                Row.Parent = PlayerScroll

                NameLabel.Text = plr.DisplayName
                NameLabel.Size = UDim2.new(0.55, 0, 1, 0)
                NameLabel.Position = UDim2.new(0.05, 0, 0, 0)
                NameLabel.TextColor3 = Color3.new(1, 1, 1)
                NameLabel.TextXAlignment = Enum.TextXAlignment.Left
                NameLabel.BackgroundTransparency = 1
                NameLabel.Parent = Row

                BlockBtn.Text = "INSTANT BLOCK"
                BlockBtn.Size = UDim2.new(0.35, 0, 0.8, 0)
                BlockBtn.Position = UDim2.new(0.62, 0, 0.1, 0)
                BlockBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
                BlockBtn.TextColor3 = Color3.new(1, 1, 1)
                BlockBtn.Font = Enum.Font.SourceSansBold
                BlockBtn.TextSize = 10
                BlockBtn.Parent = Row
                
                UICorner.CornerRadius = UDim.new(0, 6)
                UICorner.Parent = BlockBtn
                
                BlockBtn.MouseButton1Click:Connect(function()
                    game:GetService("StarterGui"):SetCore("PromptBlockPlayer", plr)
                end)
            end
        end
    end
    UpdateList()
    game.Players.PlayerAdded:Connect(UpdateList)
    game.Players.PlayerRemoving:Connect(UpdateList)
end)

-- ==========================================
-- TAB 2: EXPLOITS & DUPE
-- ==========================================
local AmbTab = Window:NewTab("Ambitious SAB")

local ProtectSection = AmbTab:NewSection("Item Protection")
ProtectSection:NewToggle("Auto-Kick on Steal", "Kicks you the moment you get Brainrot", function(state)
    _G.AutoKick = state
    game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
        if _G.AutoKick then 
            task.wait(0.05)
            game.Players.LocalPlayer:Kick("ANTI-STEAL: Brainrot Secured! Rejoin a new server.") 
        end
    end)
end)

local TradeSection = AmbTab:NewSection("Trade Exploits")
TradeSection:NewButton("Open Meow Toggle Panel", "Red/Blue/Purple UI", function()
    local MeowGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local AutoTrade = Instance.new("TextButton")
    local FreezeTrade = Instance.new("TextButton")
    local ForceGive = Instance.new("TextButton")

    MeowGui.Parent = game.CoreGui
    MainFrame.Parent = MeowGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    MainFrame.Size = UDim2.new(0, 250, 0, 200)
    MainFrame.Position = UDim2.new(0.5, 50, 0.5, -100)
    MainFrame.Active = true; MainFrame.Draggable = true

    local function Style(btn, text, color, pos)
        btn.Parent = MainFrame
        btn.Text = text; btn.Size = UDim2.new(0.9, 0, 0, 40)
        btn.Position = pos; btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.white; btn.Font = Enum.Font.SourceSansBold
        local c = Instance.new("UICorner"); c.Parent = btn
    end

    Style(AutoTrade, "AUTO TRADE : OFF", Color3.fromRGB(30, 120, 255), UDim2.new(0.05, 0, 0.1, 0))
    Style(FreezeTrade, "FREEZE TRADE MODE : OFF", Color3.fromRGB(220, 60, 80), UDim2.new(0.05, 0, 0.4, 0))
    Style(ForceGive, "FORCE GIVE ALL BRAINROT", Color3.fromRGB(130, 60, 220), UDim2.new(0.05, 0, 0.7, 0))

    FreezeTrade.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Aiki022/x/refs/heads/main/TradeFreeze"))()
        FreezeTrade.Text = "FREEZE TRADE MODE : ACTIVE"
    end)
end)

-- ==========================================
-- TAB 3: MOVEMENT & SERVER
-- ==========================================
local MoveTab = Window:NewTab("Movement")
local MSection = MoveTab:NewSection("Player Options")

MSection:NewSlider("Speed", "Walk faster", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MSection:NewButton("Server Hop", "Join different server", function()
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

Library:Notify("LOADED", "Arham's Ambitious Hub is ready.", Color3.fromRGB(0, 255, 100))
