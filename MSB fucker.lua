-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "MSBfucker"
screenGui.ResetOnSpawn = false

-- Create main frame (the box)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 220)
frame.Position = UDim2.new(0.5, -100, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create title bar (for dragging)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame

-- Create title text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "MSB Fucker"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Parent = titleBar

-- Create close button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = titleBar

-- Create spam toggle button
local spamButton = Instance.new("TextButton")
spamButton.Size = UDim2.new(0, 120, 0, 40)
spamButton.Position = UDim2.new(0.5, -60, 0, 40)
spamButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
spamButton.Text = "Start Fucking"
spamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spamButton.TextSize = 18
spamButton.Font = Enum.Font.SourceSans
spamButton.Parent = frame

-- Create cooldown text box
local cooldownBox = Instance.new("TextBox")
cooldownBox.Size = UDim2.new(0, 120, 0, 30)
cooldownBox.Position = UDim2.new(0.5, -60, 0, 90)
cooldownBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
cooldownBox.Text = "" -- Empty by default
cooldownBox.TextColor3 = Color3.fromRGB(255, 255, 255)
cooldownBox.TextSize = 16
cooldownBox.Font = Enum.Font.SourceSans
cooldownBox.PlaceholderText = "CD (Default:0.1)"
cooldownBox.Parent = frame

-- Create single-use button
local useButton = Instance.new("TextButton")
useButton.Size = UDim2.new(0, 120, 0, 40)
useButton.Position = UDim2.new(0.5, -60, 0, 130)
useButton.BackgroundColor3 = Color3.fromRGB(60, 80, 120)
useButton.Text = "Use Ability"
useButton.TextColor3 = Color3.fromRGB(255, 255, 255)
useButton.TextSize = 18
useButton.Font = Enum.Font.SourceSans
useButton.Parent = frame

-- Dragging functionality
local dragging
local dragInput
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
end)

-- Gear detection and ability firing
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local currentGear = nil

-- Function to find equipped gear and remove spaces from name
local function getEquippedGear()
    if character then
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("Tool") then
                return child, child.Name:gsub("%s+", "")
            end
        end
    end
    return nil, nil
end

-- Continuous gear checking loop
spawn(function()
    while true do
        if character then
            currentGear = getEquippedGear()
        else
            currentGear = nil
            character = player.Character or player.CharacterAdded:Wait()
        end
        wait(0.1)
    end
end)

-- Update character reference when respawned
player.CharacterAdded:Connect(function(newChar)
    character = newChar
end)

-- Function to fire ability with fallback
local function fireAbility()
    local gear, gearNameNoSpaces = getEquippedGear()
    local success = false
    
    -- First attempt: character[gearNameNoSpaces].AbilityEvent
    if gear and character and character:FindFirstChild(gearNameNoSpaces) then
        local abilityEvent = character[gearNameNoSpaces]:FindFirstChild("AbilityEvent")
        if abilityEvent then
            pcall(function()
                abilityEvent:FireServer()
                success = true
            end)
        end
    end
    
    -- Fallback if first method fails
    if not success then
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local remoteEvents = replicatedStorage:WaitForChild("RemoteEvents")
        local fallbackEvent = remoteEvents:WaitForChild("AbilityEvent")
        if fallbackEvent then
            pcall(function()
                fallbackEvent:FireServer()
            end)
        else
            warn("Both ability fire methods failed!")
        end
    end
end

-- Spam button functionality
local isActive = false

spamButton.MouseButton1Click:Connect(function()
    if not isActive then
        isActive = true
        spamButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60)
        spamButton.Text = "Stop Fucking"
        
        spawn(function()
            while isActive do
                fireAbility()
                local cooldown = tonumber(cooldownBox.Text) or 0.1 -- Default to 0.1 if invalid or empty
                wait(math.max(0, cooldown)) -- Minimum 0s cooldown
            end
        end)
    else
        isActive = false
        spamButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
        spamButton.Text = "Start Fucking"
    end
end)

-- Single-use button functionality
useButton.MouseButton1Click:Connect(function()
    fireAbility()
end)
