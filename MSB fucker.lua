-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "AbilitySpammerGui"
screenGui.ResetOnSpawn = false -- Prevents closing on character reset

-- Create main frame (the box)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 180)
frame.Position = UDim2.new(0.5, -100, 0.5, -90) -- Centered
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
title.Size = UDim2.new(0.8, 0, 1, 0) -- Reduced width to fit X button
title.BackgroundTransparency = 1
title.Text = "Ability Spammer"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Parent = titleBar

-- Create close button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0) -- Adjusted to fit within frame
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

-- Create single-use button
local useButton = Instance.new("TextButton")
useButton.Size = UDim2.new(0, 120, 0, 40)
useButton.Position = UDim2.new(0.5, -60, 0, 90)
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
    screenGui.Enabled = false -- Hides the GUI
end)

-- Spam button functionality
local isActive = false

spamButton.MouseButton1Click:Connect(function()
    if not isActive then
        isActive = true
        spamButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60) -- Red when active
        spamButton.Text = "Stop Fucking"
        
        -- Start the ability spam
        spawn(function()
            while isActive do
                game:GetService("Players").LocalPlayer.Character.Replica.AbilityEvent:FireServer()
                wait(0.1) -- Adjust this delay as needed
            end
        end)
    else
        isActive = false
        spamButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60) -- Green when inactive
        spamButton.Text = "Start Fucking"
    end
end)

-- Single-use button functionality
useButton.MouseButton1Click:Connect(function()
    game:GetService("Players").LocalPlayer.Character.Replica.AbilityEvent:FireServer()
end)