loadstring([[
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    -- Lista das sementes (com o nome exato que provavelmente está no ReplicatedStorage)
    local seeds = {
        ["Candy Blossom"] = "Candy Blossom",
        ["Carrot Seed"] = "Carrot Seed",
        ["Beanstalk"] = "Beanstalk",
        ["Bamboo"] = "Bamboo",
        ["Cactus"] = "Cactus",
        ["Cacao"] = "Cacao",
        ["Celestiberry"] = "Celestiberry",
        ["Chocolate Carrot"] = "Chocolate Carrot",
        ["Coconut"] = "Coconut",
        ["Corn"] = "Corn",
        ["Cranberry"] = "Cranberry",
        ["Cursed Fruit"] = "Cursed Fruit",
        ["Durian"] = "Durian",
        ["Eggplant"] = "Eggplant",
        ["Grape"] = "Grape",
        ["Mango"] = "Mango",
        ["Moon Blossom"] = "Moon Blossom",
        ["Moon Mango"] = "Moon Mango",
        ["Moon Melon"] = "Moon Melon",
        ["Moonflower"] = "Moonflower",
        ["Nightshade"] = "Nightshade",
        ["Passionfruit"] = "Passionfruit",
        ["Pear"] = "Pear",
        ["Pepper"] = "Pepper",
        ["Pineapple"] = "Pineapple",
        ["Pumpkin"] = "Pumpkin",
        ["Raspberry"] = "Raspberry",
        ["Red Lollipop"] = "Red Lollipop",
        ["Soul Fruit"] = "Soul Fruit",
        ["Strawberry"] = "Strawberry",
        ["Tomato"] = "Tomato",
        ["Watermelon"] = "Watermelon",
        ["Venus Fly Trap"] = "Venus Fly Trap",
        ["Lotus"] = "Lotus",
        ["Moonglow"] = "Moonglow",
        ["Starfruit"] = "Starfruit",
        ["Papaya"] = "Papaya",
        ["Lemon"] = "Lemon",
        ["Banana"] = "Banana",
        ["Cherry Blossom"] = "Cherry Blossom",
        ["Glowshroom"] = "Glowshroom",
        ["Mint"] = "Mint"
    }

    -- Função que dá a seed para o player
    local function giveSeed(seedName)
        local seedKey = nil
        for k,v in pairs(seeds) do
            if k:lower() == seedName:lower() then
                seedKey = v
                break
            end
        end

        if seedKey then
            local seedObj = ReplicatedStorage:FindFirstChild(seedKey)
            if seedObj then
                local playerSeeds = LocalPlayer:FindFirstChild("Seed Items")
                if not playerSeeds then
                    playerSeeds = Instance.new("Folder")
                    playerSeeds.Name = "Seed Items"
                    playerSeeds.Parent = LocalPlayer
                end
                -- Checar se já tem a seed (para evitar duplicatas)
                if not playerSeeds:FindFirstChild(seedKey) then
                    local clone = seedObj:Clone()
                    clone.Parent = playerSeeds
                    notify("Semente '" .. seedKey .. "' adicionada ao seu inventário!")
                else
                    notify("Você já possui essa semente.")
                end
            else
                notify("Semente '" .. seedKey .. "' não foi encontrada no jogo.")
            end
        else
            notify("Semente '" .. seedName .. "' inválida ou não existe.")
        end
    end

    -- Função de notificação simples
    function notify(text)
        local screenGui = LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("SeedNotifyGui")
        if screenGui then screenGui:Destroy() end
        screenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
        screenGui.Name = "SeedNotifyGui"
        local frame = Instance.new("Frame", screenGui)
        frame.Size = UDim2.new(0, 300, 0, 50)
        frame.Position = UDim2.new(0.5, -150, 0.2, 0)
        frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1, -20, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 20
        label.Text = text
        label.TextWrapped = true

        delay(3, function()
            if screenGui then
                screenGui:Destroy()
            end
        end)
    end

    -- Criação da interface

    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

    -- Limpa GUI anterior se existir
    local oldGui = PlayerGui:FindFirstChild("SeedSpawnerGUI")
    if oldGui then oldGui:Destroy() end

    local screenGui = Instance.new("ScreenGui", PlayerGui)
    screenGui.Name = "SeedSpawnerGUI"

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 320, 0, 160)
    frame.Position = UDim2.new(0.5, -160, 0.5, -80)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Active = true
    frame.Draggable = true

    local title = Instance.new("TextLabel", frame)
    title.Text = "Seed Spawner"
    title.Font = Enum.Font.FredokaOne
    title.TextSize = 28
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(180, 0, 255)

    local input = Instance.new("TextBox", frame)
    input.PlaceholderText = "Digite o nome da semente"
    input.Size = UDim2.new(0.85, 0, 0, 40)
    input.Position = UDim2.new(0.075, 0, 0.35, 0)
    input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    input.TextColor3 = Color3.fromRGB(230, 230, 230)
    input.ClearTextOnFocus = false
    input.Font = Enum.Font.Gotham
    input.TextSize = 20
    input.TextWrapped = true

    local button = Instance.new("TextButton", frame)
    button.Text = "Spawn Seed"
    button.Size = UDim2.new(0.85, 0, 0, 40)
    button.Position = UDim2.new(0.075, 0, 0.7, 0)
    button.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 22
    button.AutoButtonColor = true

    button.MouseButton1Click:Connect(function()
        local text = input.Text
        if text == "" then
            notify("Digite o nome da semente!")
            return
        end
        giveSeed(text)
    end)
]])()
