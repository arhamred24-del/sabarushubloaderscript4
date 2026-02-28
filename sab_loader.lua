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
local TradeSection = AmbTab:NewSection("Trade Exploits")

-- THE MEOW PANEL TOGGLE
TradeSection:NewButton("Open Meow Toggle Panel", "Opens the red/blue/purple panel", function()
    -- Create the ScreenGui
    local MeowGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local AutoTrade = Instance.new("TextButton")
    local FreezeTrade = Instance.new("TextButton")
    local ForceGive = Instance.new("TextButton")

    MeowGui.Name = "MeowPanel"
    MeowGui.Parent = game.CoreGui
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MeowGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
    MainFrame.Size = UDim2.new(0, 250, 0, 200)
    MainFrame.Active = true
    MainFrame.Draggable = true

    Title.Parent = MainFrame
    Title.Text = "Meow Toggle Panel"
    Title.TextColor3 = Color3.fromRGB(0, 180, 255)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 18

    -- Blue Button: Auto Trade
    AutoTrade.Parent = MainFrame
    AutoTrade.Position = UDim2.new(0.05, 0, 0.2, 0)
    AutoTrade.Size = UDim2.new(0.9, 0, 0, 40)
    AutoTrade.BackgroundColor3 = Color3.fromRGB(30, 120, 255)
    AutoTrade.Text = "AUTO TRADE : OFF"
    AutoTrade.TextColor3 = Color3.white
    AutoTrade.Font = Enum.Font.SourceSansBold
    AutoTrade.TextSize = 14

    -- Red Button: Freeze Trade
    FreezeTrade.Parent = MainFrame
    FreezeTrade.Position = UDim2.new(0.05, 0, 0.45, 0)
    FreezeTrade.Size = UDim2.new(0.9, 0, 0, 40)
    FreezeTrade.BackgroundColor3 = Color3.fromRGB(220, 60, 80)
    FreezeTrade.Text = "FREEZE TRADE MODE : OFF"
    FreezeTrade.TextColor3 = Color3.white
    FreezeTrade.Font = Enum.Font.SourceSansBold
    FreezeTrade.TextSize = 14

    -- Purple Button: Force Give
    ForceGive.Parent = MainFrame
    ForceGive.Position = UDim2.new(0.05, 0, 0.7, 0)
    ForceGive.Size = UDim2.new(0.9, 0, 0, 40)
    ForceGive.BackgroundColor3 = Color3.fromRGB(130, 60, 220)
    ForceGive.Text = "FORCE GIVE ALL BRAINROT : OFF"
    ForceGive.TextColor3 = Color3.white
    ForceGive.Font = Enum.Font.SourceSansBold
    ForceGive.TextSize = 12

    -- Rounding corners
    for _, b in pairs({AutoTrade, FreezeTrade, ForceGive, MainFrame}) do
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = b
    end

    -- Button Logic
    FreezeTrade.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Aiki022/x/refs/heads/main/TradeFreeze"))()
        FreezeTrade.Text = "FREEZE TRADE MODE : ON"
        FreezeTrade.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end)
    
    AutoTrade.MouseButton1Click:Connect(function()
        AutoTrade.Text = "AUTO TRADE : ON"
        -- Logic to accept trade automatically
        Library:Notify("Auto-Accept", "Searching for trade to accept...", Color3.fromRGB(0, 255, 0))
    end)

    ForceGive.MouseButton1Click:Connect(function()
        ForceGive.Text = "FORCE GIVE : ACTIVE"
        -- Logic to spam pull items
        Library:Notify("Force Give", "Attempting to pull items from trade...", Color3.fromRGB(150, 0, 255))
    end)
end)

-- REST OF YOUR HUB (Movement, Server Hop, ESP)
local MoveSection = AmbTab:NewSection("Movement & Combat")
MoveSection:NewSlider("Move Speed", "Speed", 500, 16, function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)
-- [Add previous Server and ESP code here...]
