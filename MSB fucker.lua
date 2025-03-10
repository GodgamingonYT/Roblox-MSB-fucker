print("Script starting...") -- Debug: Confirm script begins

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 5) -- Wait for PlayerGui with timeout
screenGui.Name = "MSBfucker"
screenGui.ResetOnSpawn = false
print("ScreenGui created and parented to PlayerGui") -- Debug: Confirm ScreenGui setup

-- Create main frame (the box)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 220)
frame.Position = UDim2.new(0.5, -100, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Visible = false -- Hide main menu initially
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame
print("Main frame created and initially hidden") -- Debug: Confirm main frame

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

-- Create initial warning frame (shown when script runs)
local initialWarningFrame = Instance.new("Frame")
initialWarningFrame.Size = UDim2.new(0, 250, 0, 150)
initialWarningFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
initialWarningFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
initialWarningFrame.BorderSizePixel = 0
initialWarningFrame.Parent = screenGui
initialWarningFrame.Visible = true -- Visible when script starts
print("Initial warning frame created") -- Debug: Confirm initial warning

local initialWarningFrameCorner = Instance.new("UICorner")
initialWarningFrameCorner.CornerRadius = UDim.new(0, 10)
initialWarningFrameCorner.Parent = initialWarningFrame

local initialWarningText = Instance.new("TextLabel")
initialWarningText.Size = UDim2.new(1, 0, 0, 80)
initialWarningText.Position = UDim2.new(0, 0, 0, 0)
initialWarningText.BackgroundTransparency = 1
initialWarningText.Text = "Before using the script, be aware that using this may result in a kick/ban. Make sure the glove you want to spam has an ability."
initialWarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
initialWarningText.TextSize = 20
initialWarningText.Font = Enum.Font.SourceSansBold
initialWarningText.TextWrapped = true
initialWarningText.Parent = initialWarningFrame
print("Initial warning text added") -- Debug: Confirm text

local initialHellNahButton = Instance.new("TextButton")
initialHellNahButton.Size = UDim2.new(0, 80, 0, 40)
initialHellNahButton.Position = UDim2.new(0.25, -40, 0, 100) -- Left side
initialHellNahButton.BackgroundColor3 = Color3.fromRGB(139, 0, 0) -- Dark red
initialHellNahButton.Text = "Hell Nah"
initialHellNahButton.TextColor3 = Color3.fromRGB(255, 255, 255)
initialHellNahButton.TextSize = 18
initialHellNahButton.Font = Enum.Font.SourceSans
initialHellNahButton.Parent = initialWarningFrame

local initialHellNahButtonCorner = Instance.new("UICorner")
initialHellNahButtonCorner.CornerRadius = UDim.new(0, 10)
initialHellNahButtonCorner.Parent = initialHellNahButton

local initialOkButton = Instance.new("TextButton")
initialOkButton.Size = UDim2.new(0, 80, 0, 40)
initialOkButton.Position = UDim2.new(0.75, -40, 0, 100) -- Right side
initialOkButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60) -- Green
initialOkButton.Text = "OK!"
initialOkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
initialOkButton.TextSize = 18
initialOkButton.Font = Enum.Font.SourceSans
initialOkButton.Parent = initialWarningFrame

local initialOkButtonCorner = Instance.new("UICorner")
initialOkButtonCorner.CornerRadius = UDim.new(0, 10)
initialOkButtonCorner.Parent = initialOkButton
print("Initial warning buttons added") -- Debug: Confirm buttons

-- Create no-glove warning frame
local noGloveWarningFrame = Instance.new("Frame")
noGloveWarningFrame.Size = UDim2.new(0, 250, 0, 150)
noGloveWarningFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
noGloveWarningFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noGloveWarningFrame.BorderSizePixel = 0
noGloveWarningFrame.Parent = screenGui
noGloveWarningFrame.Visible = false

local noGloveWarningFrameCorner = Instance.new("UICorner")
noGloveWarningFrameCorner.CornerRadius = UDim.new(0, 10)
noGloveWarningFrameCorner.Parent = noGloveWarningFrame

local noGloveWarningText = Instance.new("TextLabel")
noGloveWarningText.Size = UDim2.new(1, 0, 0, 80)
noGloveWarningText.Position = UDim2.new(0, 0, 0, 0)
noGloveWarningText.BackgroundTransparency = 1
noGloveWarningText.Text = "Can bro fucking equip a glove to use this?"
noGloveWarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
noGloveWarningText.TextSize = 20
noGloveWarningText.Font = Enum.Font.SourceSansBold
noGloveWarningText.TextWrapped = true
noGloveWarningText.Parent = noGloveWarningFrame

local noGloveHellNahButton = Instance.new("TextButton")
noGloveHellNahButton.Size = UDim2.new(0, 80, 0, 40)
noGloveHellNahButton.Position = UDim2.new(0.25, -40, 0, 100) -- Left side
noGloveHellNahButton.BackgroundColor3 = Color3.fromRGB(139, 0, 0) -- Dark red
noGloveHellNahButton.Text = "Hell Nah"
noGloveHellNahButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noGloveHellNahButton.TextSize = 18
noGloveHellNahButton.Font = Enum.Font.SourceSans
noGloveHellNahButton.Parent = noGloveWarningFrame

local noGloveHellNahButtonCorner = Instance.new("UICorner")
noGloveHellNahButtonCorner.CornerRadius = UDim.new(0, 10)
noGloveHellNahButtonCorner.Parent = noGloveHellNahButton

local noGloveFuckOffButton = Instance.new("TextButton")
noGloveFuckOffButton.Size = UDim2.new(0, 80, 0, 40)
noGloveFuckOffButton.Position = UDim2.new(0.75, -40, 0, 100) -- Right side
noGloveFuckOffButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60) -- Green
noGloveFuckOffButton.Text = "Fuck off"
noGloveFuckOffButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noGloveFuckOffButton.TextSize = 18
noGloveFuckOffButton.Font = Enum.Font.SourceSans
noGloveFuckOffButton.Parent = noGloveWarningFrame

local noGloveFuckOffButtonCorner = Instance.new("UICorner")
noGloveFuckOffButtonCorner.CornerRadius = UDim.new(0, 10)
noGloveFuckOffButtonCorner.Parent = noGloveFuckOffButton

-- Create no-ability warning frame
local noAbilityWarningFrame = Instance.new("Frame")
noAbilityWarningFrame.Size = UDim2.new(0, 250, 0, 150)
noAbilityWarningFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
noAbilityWarningFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noAbilityWarningFrame.BorderSizePixel = 0
noAbilityWarningFrame.Parent = screenGui
noAbilityWarningFrame.Visible = false

local noAbilityWarningFrameCorner = Instance.new("UICorner")
noAbilityWarningFrameCorner.CornerRadius = UDim.new(0, 10)
noAbilityWarningFrameCorner.Parent = noAbilityWarningFrame

local noAbilityWarningText = Instance.new("TextLabel")
noAbilityWarningText.Size = UDim2.new(1, 0, 0, 80)
noAbilityWarningText.Position = UDim2.new(0, 0, 0, 0)
noAbilityWarningText.BackgroundTransparency = 1
noAbilityWarningText.Text = "This glove do not have a fucking ability"
noAbilityWarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
noAbilityWarningText.TextSize = 20
noAbilityWarningText.Font = Enum.Font.SourceSansBold
noAbilityWarningText.TextWrapped = true
noAbilityWarningText.Parent = noAbilityWarningFrame

local noAbilityHellNahButton = Instance.new("TextButton")
noAbilityHellNahButton.Size = UDim2.new(0, 80, 0, 40)
noAbilityHellNahButton.Position = UDim2.new(0.25, -40, 0, 100) -- Left side
noAbilityHellNahButton.BackgroundColor3 = Color3.fromRGB(139, 0, 0) -- Dark red
noAbilityHellNahButton.Text = "Hell Nah"
noAbilityHellNahButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noAbilityHellNahButton.TextSize = 18
noAbilityHellNahButton.Font = Enum.Font.SourceSans
noAbilityHellNahButton.Parent = noAbilityWarningFrame

local noAbilityHellNahButtonCorner = Instance.new("UICorner")
noAbilityHellNahButtonCorner.CornerRadius = UDim.new(0, 10)
noAbilityHellNahButtonCorner.Parent = noAbilityHellNahButton

local noAbilityFuckOffButton = Instance.new("TextButton")
noAbilityFuckOffButton.Size = UDim2.new(0, 80, 0, 40)
noAbilityFuckOffButton.Position = UDim2.new(0.75, -40, 0, 100) -- Right side
noAbilityFuckOffButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60) -- Green
noAbilityFuckOffButton.Text = "Fuck off"
noAbilityFuckOffButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noAbilityFuckOffButton.TextSize = 18
noAbilityFuckOffButton.Font = Enum.Font.SourceSans
noAbilityFuckOffButton.Parent = noAbilityWarningFrame

local noAbilityFuckOffButtonCorner = Instance.new("UICorner")
noAbilityFuckOffButtonCorner.CornerRadius = UDim.new(0, 10)
noAbilityFuckOffButtonCorner.Parent = noAbilityFuckOffButton

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

-- Initial warning UI OK! button functionality
initialOkButton.MouseButton1Click:Connect(function()
    initialWarningFrame.Visible = false   -- Hide the warning frame
    frame.Visible = true                    -- Show the main menu
    print("Initial warning OK! clicked, main menu is now visible") -- Debug: Confirm OK! works
end)

-- Initial warning UI Hell Nah button functionality
initialHellNahButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Hell nah? Go Fucking eat a shit right now")
end)

-- No-glove warning UI Fuck off button functionality
noGloveFuckOffButton.MouseButton1Click:Connect(function()
    noGloveWarningFrame.Visible = false
end)

-- No-glove warning UI Hell Nah button functionality
noGloveHellNahButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

-- No-ability warning UI Fuck off button functionality
noAbilityFuckOffButton.MouseButton1Click:Connect(function()
    noAbilityWarningFrame.Visible = false
end)

-- No-ability warning UI Hell Nah button functionality
noAbilityHellNahButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

-- Glove detection and ability firing
local player = game.Players.LocalPlayer

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

-- Function to fire ability with fallback
local function fireAbility()
    local glove, gloveNameNoSpaces = getEquippedGlove()
    if not glove then
        noGloveWarningFrame.Visible = true
        return
    end
    
    local char = player.Character
    if not char then
        noGloveWarningFrame.Visible = true
        return
    end
    
    local success = false
    
    -- First attempt: character[gloveNameNoSpaces].AbilityEvent
    if char:FindFirstChild(gloveNameNoSpaces) then
        local abilityEvent = char[gloveNameNoSpaces]:FindFirstChild("AbilityEvent")
        if abilityEvent then
            pcall(function()
                abilityEvent:FireServer()
                success = true
            end)
        else
            noAbilityWarningFrame.Visible = true
            return
        end
    else
        noAbilityWarningFrame.Visible = true
        return
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
        if not glove or not player.Character then
            noGloveWarningFrame.Visible = true
            return
        end
        
        isActive = true
        spamButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60)
        spamButton.Text = "Stop Fucking"
        
        spawn(function()
            while isActive do
                if not getEquippedGlove() or not player.Character then
                    isActive = false
                    spamButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
                    spamButton.Text = "Start Fucking"
                    break -- Exit the loop without warning
                end
                fireAbility()
                local cooldown = tonumber(cooldownBox.Text) or 0.1
                task.wait(math.max(0, cooldown))
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
    local glove = getEquippedGlove()
    if not glove or not player.Character then
        noGloveWarningFrame.Visible = true
        return
    end
    fireAbility()
end)

print("Script fully loaded") -- Debug: Confirm script completion
