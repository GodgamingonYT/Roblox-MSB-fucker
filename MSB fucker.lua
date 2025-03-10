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

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- Create title bar (for dragging)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 10)
titleBarCorner.Parent = titleBar

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

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 10)
closeButtonCorner.Parent = closeButton

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

local spamButtonCorner = Instance.new("UICorner")
spamButtonCorner.CornerRadius = UDim.new(0, 10)
spamButtonCorner.Parent = spamButton

-- Create cooldown text box
local cooldownBox = Instance.new("TextBox")
cooldownBox.Size = UDim2.new(0, 120, 0, 30)
cooldownBox.Position = UDim2.new(0.5, -60, 0, 90)
cooldownBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
cooldownBox.Text = ""
cooldownBox.TextColor3 = Color3.fromRGB(255, 255, 255)
cooldownBox.TextSize = 16
cooldownBox.Font = Enum.Font.SourceSans
cooldownBox.PlaceholderText = "CD (Default:0.1)"
cooldownBox.Parent = frame

local cooldownBoxCorner = Instance.new("UICorner")
cooldownBoxCorner.CornerRadius = UDim.new(0, 10)
cooldownBoxCorner.Parent = cooldownBox

-- Create single-use button
local useButton = Instance.new("TextButton")
useButton.Size = UDim2.new(0, 120, 0, 40)
useButton.Position = UDim2.new(0.5, -60, 0, 130)
useButton.BackgroundColor3 = Color3.fromRGB(60, 80, 120)
useButton.Text = "Fuck Them Once"
useButton.TextColor3 = Color3.fromRGB(255, 255, 255)
useButton.TextSize = 18
useButton.Font = Enum.Font.SourceSans
useButton.Parent = frame

local useButtonCorner = Instance.new("UICorner")
useButtonCorner.CornerRadius = UDim.new(0, 10)
useButtonCorner.Parent = useButton

-- Create warning UI
local warningGui = Instance.new("ScreenGui")
warningGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
warningGui.Name = "WarningGui"
warningGui.Enabled = false

local warningFrame = Instance.new("Frame")
warningFrame.Size = UDim2.new(0, 250, 0, 150)
warningFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
warningFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
warningFrame.BorderSizePixel = 0
warningFrame.Parent = warningGui

local warningFrameCorner = Instance.new("UICorner")
warningFrameCorner.CornerRadius = UDim.new(0, 10)
warningFrameCorner.Parent = warningFrame

local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(1, 0, 0, 100)
warningText.Position = UDim2.new(0, 0, 0, 0)
warningText.BackgroundTransparency = 1
warningText.Text = "Please equip a glove first!"
warningText.TextColor3 = Color3.fromRGB(255, 255, 255)
warningText.TextSize = 20
warningText.Font = Enum.Font.SourceSansBold
warningText.TextWrapped = true
warningText.Parent = warningFrame

local okButton = Instance.new("TextButton")
okButton.Size = UDim2.new(0, 80, 0, 40)
okButton.Position = UDim2.new(0.5, -40, 0, 105)
okButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
okButton.Text = "OK"
okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
okButton.TextSize = 18
okButton.Font = Enum.Font.SourceSans
okButton.Parent = warningFrame

local okButtonCorner = Instance.new("UICorner")
okButtonCorner.CornerRadius = UDim.new(0, 10)
okButtonCorner.Parent = okButton

-- Dragging functionality for main UI
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

-- Warning UI OK button functionality
okButton.MouseButton1Click:Connect(function()
    warningGui.Enabled = false
end)

-- Glove detection and ability firing
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to find equipped glove and remove spaces from name
local function getEquippedGlove()
    local char = player.Character
    if char then
        for _, child in pairs(char:GetChildren()) do
            if child:IsA("Tool") then
                return child, child.Name:gsub("%s+", "")
            end
        end
    end
    return nil, nil
end

-- Continuous glove checking loop
spawn(function()
    while true do
        character = player.Character
        wait(0.1)
    end
end)

-- Update character reference when respawned
player.CharacterAdded:Connect(function(newChar)
    character = newChar
end)

-- Function to fire ability with fallback
local function fireAbility()
    local glove, gloveNameNoSpaces = getEquippedGlove()
    if not glove or not character then
        warningGui.Enabled = true
        return
    end
    
    local success = false
    
    -- First attempt: character[gloveNameNoSpaces].AbilityEvent
    if character and character:FindFirstChild(gloveNameNoSpaces) then
        local abilityEvent = character[gloveNameNoSpaces]:FindFirstChild("AbilityEvent")
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
        local glove = getEquippedGlove()
        if not glove or not character then
            warningGui.Enabled = true
            return
        end
        
        isActive = true
        spamButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60)
        spamButton.Text = "Stop Fucking"
        
        spawn(function()
            while isActive do
                fireAbility()
                local cooldown = tonumber(cooldownBox.Text) or 0.1
                wait(math.max(0, cooldown))
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
