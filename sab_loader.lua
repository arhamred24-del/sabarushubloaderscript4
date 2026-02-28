local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local PlayerCount = Instance.new("TextLabel")
local CommandGrid = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local CloseButton = Instance.new("TextButton")

-- Main UI Properties
ScreenGui.Parent = game.CoreGui
MainFrame.Name = "AdminPanel"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 55, 60)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true -- Allows you to move it

Title.Parent = MainFrame
Title.Text = "ADMIN PANEL"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Size = UDim2.new(1, -40, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24

-- Player Counter Logic
PlayerCount.Parent = MainFrame
PlayerCount.Position = UDim2.new(0, 10, 0, 40)
PlayerCount.Size = UDim2.new(0, 200, 0, 20)
PlayerCount.BackgroundTransparency = 1
PlayerCount.TextColor3 = Color3.new(1, 1, 1)
PlayerCount.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while task.wait(1) do
        PlayerCount.Text = "Players in game: " .. #game.Players:GetPlayers()
    end
end)

-- Command Grid
CommandGrid.Parent = MainFrame
CommandGrid.Position = UDim2.new(0, 10, 0, 70)
CommandGrid.Size = UDim2.new(1, -20, 1, -80)
CommandGrid.BackgroundTransparency = 1

UIGridLayout.Parent = CommandGrid
UIGridLayout.CellSize = UDim2.new(0, 185, 0, 40)
UIGridLayout.Padding = UDim2.new(0, 5, 0, 5)

-- Function to create buttons
local function CreateCmd(name)
    local btn = Instance.new("TextButton")
    btn.Parent = CommandGrid
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    
    btn.MouseButton1Click:Connect(function()
        print("Executing: " .. name)
        -- You can link your local functions here
    end)
end

-- Adding the commands from your photo
local cmds = {";rocket", ";ragdoll", ";balloon", ";inverse", ";nightvision", ";jail", ";control", ";tiny", ";jumpscare", ";morph"}
for _, cmd in pairs(cmds) do
    CreateCmd(cmd)
end
