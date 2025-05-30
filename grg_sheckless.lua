loadstring([[
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    -- Lista de sementes disponíveis no jogo
    local seeds = {
        Beanstalk = "Beanstalk",
        Bamboo = "Bamboo",
        Cactus = "Cactus",
        Cacao = "Cacao",
        CandyBlossom = "Candy Blossom",
        Celestiberry = "Celestiberry",
        ChocolateCarrot = "Chocolate Carrot",
        Coconut = "Coconut",
        Corn = "Corn",
        Cranberry = "Cranberry",
        CursedFruit = "Cursed Fruit",
        Durian = "Durian",
        Eggplant = "Eggplant",
        Grape = "Grape",
        Mango = "Mango",
        MoonBlossom = "Moon Blossom",
        MoonMango = "Moon Mango",
        MoonMelon = "Moon Melon",
        Moonflower = "Moonflower",
        Nightshade = "Nightshade",
        Passionfruit = "Passionfruit",
        Pear = "Pear",
        Pepper = "Pepper",
        Pineapple = "Pineapple",
        Pumpkin = "Pumpkin",
        Raspberry = "Raspberry",
        RedLollipop = "Red Lollipop",
        SoulFruit = "Soul Fruit",
        Strawberry = "Strawberry",
        Tomato = "Tomato",
        Watermelon = "Watermelon",
        VenusFlyTrap = "Venus Fly Trap",
        Lotus = "Lotus",
        Moonglow = "Moonglow",
        Starfruit = "Starfruit",
        Papaya = "Papaya",
        Lemon = "Lemon",
        Banana = "Banana",
        CherryBlossom = "Cherry Blossom",
        Glowshroom = "Glowshroom",
        Mint = "Mint",
        Moonflower = "Moonflower",
        Glowshroom = "Glowshroom"
    }

    -- Função para verificar e dar a semente ao jogador
    local function giveSeed(seedName)
        local seed = seeds[seedName]
        if seed then
            local seedItem = ReplicatedStorage:FindFirstChild(seed)
            if seedItem then
                local playerSeedFolder = LocalPlayer:FindFirstChild("Seed Items")
                if not playerSeedFolder then
                    playerSeedFolder = Instance.new("Folder")
                    playerSeedFolder.Name = "Seed Items"
                    playerSeedFolder.Parent = LocalPlayer
                end
                local seedClone = seedItem:Clone()
                seedClone.Parent = playerSeedFolder
                print("Semente '" .. seedName .. "' adicionada ao seu inventário.")
            else
                print("Semente '" .. seedName .. "' não encontrada no jogo.")
            end
        else
            print("Nome de semente inválido.")
        end
    end

    -- Interface do usuário para entrada do nome da semente
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.Parent = screenGui

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 200, 0, 50)
    textBox.Position = UDim2.new(0.5, -100, 0.5, -25)
    textBox.PlaceholderText = "Digite o nome da semente"
    textBox.Parent = frame

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0.5, -50, 0.5, 50)
    button.Text = "Obter Semente"
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        giveSeed(textBox.Text)
    end)
]])()
