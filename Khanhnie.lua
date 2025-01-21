local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Các vật phẩm có thể mua trong SHOP (Kiếm và Súng)
local shopItems = {
    -- Kiếm
    "Dark Blade", "Flame Sword", "True Triple Katana", "Cursed Dual Katana", "Cutlass", "Ice Sword", "Soul Guitar", 
    "Blade", "Shuriken", "Magma Blade", "Pirate Blade", "Venom Blade", "Dragon Slayer", "Sand Blade",
    
    -- Súng
    "Gun", "Elite Gun", "Sniper", "Flintlock", "Shotgun", "Pistol", 
    "M1 Garand", "Bazooka", "Laser Gun", "Rocket Launcher",

    -- Phụ Kiện
    "Angel Wings", "Demon Wings", "Advanced Haki (Mastery)"
}

-- Các vật phẩm làm nhiệm vụ (Item)
local questItems = {
    "CDK", "Sol Guitar", "Gomu Gomu no Mi", "Magu Magu no Mi", "Hie Hie no Mi", "Pika Pika no Mi", 
    "Goro Goro no Mi", "Mera Mera no Mi", "Tori Tori no Mi", "Zushi Zushi no Mi", "Yami Yami no Mi", 
    "Suna Suna no Mi", "Bara Bara no Mi", "Kilo Kilo no Mi", "Hana Hana no Mi", "Bomu Bomu no Mi",
    "Dragon Slayer", "Venom Blade"
}

local settings = {
    autoFarm = false,
    autoFly = false,
    autoFruit = false,
    autoQuest = false,
    autoRespawn = true,
    godMode = false,
    teleportEnabled = true,
    autoBuyItems = false,
    farmSpeed = 1, 
    flySpeed = 50,  
    flyHeight = 100,  
    randomDelay = true,
    minDelay = 2,
    maxDelay = 4,
    menuEnabled = true,
    raceType = "Human",
    v2QuestComplete = false,
    v3QuestComplete = false,
    v4QuestComplete = false
}

-- Tạo menu GUI
local function createMenu()
    local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 200, 0, 400)
    MainFrame.Position = UDim2.new(0, 10, 0, 10)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.5
    MainFrame.Visible = settings.menuEnabled

    -- Các mục trong menu
    local functions = {
        "autoFarm", "autoFly", "autoFruit", "autoQuest", "autoRespawn",
        "godMode", "autoBuyItems", "teleportEnabled"
    }

    for i, feature in ipairs(functions) do
        local Button = Instance.new("TextButton", MainFrame)
        Button.Size = UDim2.new(0, 180, 0, 30)
        Button.Position = UDim2.new(0, 10, 0, (i - 1) * 35 + 10)
        Button.Text = feature
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.TextColor3 = Color3.new(1, 1, 1)

        Button.MouseButton1Click:Connect(function()
            settings[feature] = not settings[feature]
            Button.Text = feature .. ": " .. (settings[feature] and "ON" or "OFF")
        end)
    end
end

-- Tạo chức năng mua vật phẩm trong SHOP
local function createShopMenu()
    for _, item in ipairs(shopItems) do
        local purchaseButton = Instance.new("TextButton", MainFrame)
        purchaseButton.Size = UDim2.new(0, 270, 0, 30)
        purchaseButton.Position = UDim2.new(0, 10, 0, #functions * 35 + 50 + (_ - 1) * 35)
        purchaseButton.Text = "Buy " .. item
        purchaseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        purchaseButton.TextColor3 = Color3.new(1, 1, 1)

        -- Logic mua vật phẩm
        purchaseButton.MouseButton1Click:Connect(function()
            -- Logic xử lý mua vật phẩm, kiểm tra đủ tiền hoặc điều kiện
            print("Đang mua vật phẩm: " .. item)
            if item == "CDK" then
                print("Bạn phải làm nhiệm vụ để nhận CDK.")
            elseif item == "Sol Guitar" then
                print("Bạn phải làm nhiệm vụ để nhận Sol Guitar.")
            elseif item == "Dark Blade" then
                print("Bạn có thể mua Dark Blade.")
            else
                print("Mua vật phẩm: " .. item)
            end
        end)
    end
end

-- Tạo chức năng lấy vật phẩm làm nhiệm vụ (Item)
local function createItemMenu()
    for _, item in ipairs(questItems) do
        local questButton = Instance.new("TextButton", MainFrame)
        questButton.Size = UDim2.new(0, 270, 0, 30)
        questButton.Position = UDim2.new(0, 10, 0, #functions * 35 + 50 + (#shopItems + _ - 1) * 35)
        questButton.Text = "Quest: " .. item
        questButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        questButton.TextColor3 = Color3.new(1, 1, 1)

        -- Logic nhận vật phẩm qua nhiệm vụ
        questButton.MouseButton1Click:Connect(function()
            print("Đang làm nhiệm vụ để nhận vật phẩm: " .. item)
            if item == "CDK" then
                -- Logic để làm nhiệm vụ CDK
                print("Làm nhiệm vụ CDK để nhận Cursed Dual Katana.")
            elseif item == "Sol Guitar" then
                -- Logic làm nhiệm vụ Sol Guitar
                print("Làm nhiệm vụ Sol Guitar.")
            elseif item == "Gomu Gomu no Mi" then
                -- Logic lấy Gomu Gomu no Mi
                print("Làm nhiệm vụ để nhận Gomu Gomu no Mi.")
            else
                print("Làm nhiệm vụ để nhận vật phẩm: " .. item)
            end
        end)
    end
end

-- Tạo Menu chính cho SHOP và Item
local function createMenu()
    createShopMenu()
    createItemMenu()
end

-- Hàm bắt đầu script
local function startScript()
    createMenu()
    print("Script đã được bật thành công!")
end

-- Bắt đầu chạy script
startScript()
