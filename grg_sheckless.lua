loadstring([[
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    local remote = ReplicatedStorage:FindFirstChild("Spawn")
    if not remote then
        warn("Remote 'Spawn' não encontrado!")
        return
    end

    local seeds = {
        ["Candy Blossom"] = true,
        ["Carrot Seed"] = true,
        ["Beanstalk"] = true,
        ["Bamboo"] = true,
        ["Cactus"] = true,
        ["Cacao"] = true,
        ["Celestiberry"] = true,
        ["Chocolate Carrot"] = true,
        ["Coconut"] = true,
        ["Corn"] = true,
        ["Cranberry"] = true,
        ["Cursed Fruit"] = true,
        ["Durian"] = true,
        ["Eggplant"] = true,
        ["Grape"] = true,
        ["Mango"] = true,
        ["Moon Blossom"] = true,
        ["Moon Mango"] = true,
        ["Moon Melon"] = true,
        ["Moonflower"] = true,
        ["Nightshade"] = true,
        ["Passionfruit"] = true,
        ["Pear"] = true,
        ["Pepper"] = true,
        ["Pineapple"] = true,
        ["Pumpkin"] = true,
        ["Raspberry"] = true,
        ["Red Lollipop"] = true,
        ["Soul Fruit"] = true,
        ["Strawberry"] = true,
        ["Tomato"] = true,
        ["Watermelon"] = true,
        ["Venus Fly Trap"] = true,
        ["Lotus"] = true,
        ["Moonglow"] = true,
        ["Starfruit"] = true,
        ["Papaya"] = true,
        ["Lemon"] = true,
        ["Banana"] = true,
        ["Cherry Blossom"] = true,
        ["Glowshroom"] = true,
        ["Mint"] = true
    }

    -- Função de notificação simples
    local function notify(text)
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if not playerGui then return end

        local existingGui = playerGui:FindFirstChild("SeedNotifyGui")
        if existingGui then existingGui:Destroy() end

        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "SeedNotifyGui"
        screenGui.Parent = playerGui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 300, 0, 50)
        frame.Position = UDim2.new(0.5, -150, 0.15, 0)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.Parent = screenGui

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1,1,1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 20
        label.TextWrapped = true
        label.Text = text
        label.Parent = frame

        delay(3, function()
            if screenGui then screenGui:Destroy() end
        end)
    end

    -- Cria a interface
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    local oldGui = playerGui:FindFirstChild("SeedSpawnerGUI")
    if oldGui then oldGui:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SeedSpawnerGUI"
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 320, 0, 160)
    frame.Position = UDim2.new(0.5, -160, 0.5, -80)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Text = "Seed Spawner - Grow a Garden"
    title.Font = Enum.Font.FredokaOne
    title.TextSize = 26
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(180, 0, 255)
    title.Parent = frame

    local input = Instance.new("TextBox")
    input.PlaceholderText = "Digite o nome exato da seed"
    input.Size = UDim2.new(0.85, 0, 0, 40)
    input.Position = UDim2.new(0.075, 0, 0.35, 0)
    input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    input.TextColor3 = Color3.fromRGB(230, 230, 230)
    input.ClearTextOnFocus = false
    input.Font = Enum.Font.Gotham
    input.TextSize = 20
    input.TextWrapped = true
    input.Parent = frame

    local button = Instance.new("TextButton")
    button.Text = "Spawn Seed"
    button.Size = UDim2.new(0.85, 0, 0, 40)
    button.Position = UDim2.new(0.075, 0, 0.7, 0)
    button.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 22
    button.AutoButtonColor = true
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local seedName = input.Text
        if seedName == "" then
            notify("Por favor, digite o nome da seed!")
            return
        end

        -- Verifica se a seed existe na lista
        local found = false
        for k,_ in pairs(seeds) do
            if k:lower() == seedName:lower() then
                found = true
                seedName = k -- garante o nome com case correto
                break
            end
        end

        if not found then
            notify("Seed '" .. seedName .. "' não encontrada.")
            return
        end

        -- Envia o nome da seed para o server spawnar
        remote:FireServer(seedName)
        notify("Spawnando a seed '" .. seedName .. "'...")
    end)
]])()
