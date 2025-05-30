loadstring([[
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    local remote = ReplicatedStorage:WaitForChild("Spawn")

    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SeedSpawnerGUI"
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 250, 0, 150)
    frame.Position = UDim2.new(0.5, -125, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.BackgroundTransparency = 0.1
    frame.Active = true
    frame.Draggable = true

    local title = Instance.new("TextLabel", frame)
    title.Text = "Seed Spawner"
    title.Font = Enum.Font.FredokaOne
    title.TextSize = 22
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.new(1, 1, 1)

    local input = Instance.new("TextBox", frame)
    input.PlaceholderText = "Enter seed"
    input.Size = UDim2.new(0.8, 0, 0, 30)
    input.Position = UDim2.new(0.1, 0, 0.35, 0)
    input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    input.TextColor3 = Color3.new(1, 1, 1)
    input.TextSize = 18
    input.ClearTextOnFocus = false

    local button = Instance.new("TextButton", frame)
    button.Text = "Spawn Seed"
    button.Size = UDim2.new(0.8, 0, 0, 30)
    button.Position = UDim2.new(0.1, 0, 0.65, 0)
    button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 18

    local credits = Instance.new("TextLabel", frame)
    credits.Text = "Made By Twentys2 Scripts"
    credits.Font = Enum.Font.SourceSansItalic
    credits.TextSize = 14
    credits.Position = UDim2.new(0, 0, 1, -20)
    credits.Size = UDim2.new(1, 0, 0, 20)
    credits.TextColor3 = Color3.fromRGB(200, 200, 200)
    credits.BackgroundTransparency = 1

    button.MouseButton1Click:Connect(function()
        local seed = input.Text
        if seed and seed ~= "" then
            remote:FireServer(seed)
        else
            warn("Digite o nome de uma semente.")
        end
    end)
]])()
