-- KEY SYSTEM CONFIG
local CorrectKey = "aru"
local KeyVerified = false

-- 1. CREATE KEY UI
local KeyGui = Instance.new("ScreenGui")
local KeyMain = Instance.new("Frame")
local KeyTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local KeyCheck = Instance.new("TextButton")

KeyGui.Name = "KeySystem"
KeyGui.Parent = game.CoreGui

KeyMain.Name = "KeyMain"
KeyMain.Parent = KeyGui
KeyMain.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyMain.Position = UDim2.new(0.5, -125, 0.5, -75)
KeyMain.Size = UDim2.new(0, 250, 0, 150)
KeyMain.Active = true
KeyMain.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = KeyMain

KeyTitle.Parent = KeyMain
KeyTitle.Text = "ENTER KEY"
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.TextColor3 = Color3.new(1, 1, 1)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.TextSize = 20

KeyInput.Parent = KeyMain
KeyInput.PlaceholderText = "Type Key Here..."
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 30)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
KeyInput.TextColor3 = Color3.new(1, 1, 1)
KeyInput.Text = ""

KeyCheck.Parent = KeyMain
KeyCheck.Text = "Check Key"
KeyCheck.Position = UDim2.new(0.1, 0, 0.65, 0)
KeyCheck.Size = UDim2.new(0.8, 0, 0, 35)
KeyCheck.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
KeyCheck.TextColor3 = Color3.new(1, 1, 1)
KeyCheck.Font = Enum.Font.SourceSansBold

-- KEY CHECK LOGIC
KeyCheck.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyGui:Destroy() -- Close Key Screen
        
        -- ==========================================================
        -- YOUR FULL SCRIPT STARTS HERE (GALAXY HUB)
        -- ==========================================================
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

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

        -- ADMIN TAB
        local AdminTab = Window:NewTab("Admin Panel")
        local AdminSection = AdminTab:NewSection("Player List (Bypass Gamepass)")
        AdminSection:NewButton("Open Admin Player List", "Block players officially", function()
            local ScreenGui = Instance.new("ScreenGui")
            local MainFrame = Instance.new("Frame")
            local PlayerScroll = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            ScreenGui.Parent = game.CoreGui
            MainFrame.Parent = ScreenGui
            MainFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
            MainFrame.Size = UDim2.new(0, 320, 0, 400); MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
            MainFrame.Draggable = true; MainFrame.Active = true
            PlayerScroll.Parent = MainFrame; PlayerScroll.Position = UDim2.new(0, 10, 0, 10); PlayerScroll.Size = UDim2.new(1, -20, 1, -20)
            PlayerScroll.BackgroundTransparency = 1; PlayerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
            UIListLayout.Parent = PlayerScroll; UIListLayout.Padding = UDim.new(0, 5)

            local function UpdateList()
                for _, v in pairs(PlayerScroll:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= game.Players.LocalPlayer then
                        local Row = Instance.new("Frame")
                        local BlockBtn = Instance.new("TextButton")
                        Row.Size = UDim2.new(1, 0, 0, 35); Row.BackgroundColor3 = Color3.fromRGB(45, 50, 60); Row.Parent = PlayerScroll
                        local nl = Instance.new("TextLabel"); nl.Text = plr.DisplayName; nl.Size = UDim2.new(0.5, 0, 1, 0); nl.Parent = Row; nl.BackgroundTransparency = 1; nl.TextColor3 = Color3.new(1,1,1)
                        BlockBtn.Text = "BLOCK"; BlockBtn.Size = UDim2.new(0.4, 0, 0.8, 0); BlockBtn.Position = UDim2.new(0.55, 0, 0.1, 0); BlockBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50); BlockBtn.Parent = Row
                        BlockBtn.MouseButton1Click:Connect(function() game:GetService("StarterGui"):SetCore("PromptBlockPlayer", plr) end)
                    end
                end
            end
            UpdateList()
        end)

        -- AMBITIOUS TAB
        local AmbTab = Window:NewTab("Ambitious SAB")
        local ProtectSection = AmbTab:NewSection("Item Protection")
        ProtectSection:NewToggle("Auto-Kick on Steal", "Safety kick", function(state)
            _G.AutoKick = state
            game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function() if _G.AutoKick then task.wait(0.05); game.Players.LocalPlayer:Kick("SAB SECURED") end end)
        end)

        local TradeSection = AmbTab:NewSection("Trade Exploits")
        TradeSection:NewButton("Open Meow Toggle Panel", "Trade/Dupe UI", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Aiki022/x/refs/heads/main/TradeFreeze"))()
        end)

        -- MOVEMENT
        local MoveTab = Window:NewTab("Movement")
        MoveTab:NewSection("Options"):NewSlider("Speed", "Walk fast", 500, 16, function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)

        Library:Notify("ACCESS GRANTED", "Welcome, Arham.", Color3.fromRGB(0, 255, 100))
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "WRONG KEY! TRY AGAIN"
        KeyInput.PlaceholderColor3 = Color3.new(1, 0, 0)
    end
end)
