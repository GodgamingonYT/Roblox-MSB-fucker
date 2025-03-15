print("Script starting...")

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui", 5)
screenGui.Name = "MSBfucker"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
print("ScreenGui created and parented")

-- Create Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 280)
frame.Position = UDim2.new(0.5, -120, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40) -- Dark grey
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0
frame.Visible = false
frame.ZIndex = 5
frame.Parent = screenGui
print("Frame created with color: " .. tostring(frame.BackgroundColor3))

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 6
titleBar.Parent = frame

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 12)
titleBarCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "MSB Fucker"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.ZIndex = 6
title.Parent = titleBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 220, 220)
closeButton.TextSize = 24
closeButton.Font = Enum.Font.GothamBold
closeButton.ZIndex = 6
closeButton.Parent = titleBar

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 12)
closeButtonCorner.Parent = closeButton

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 40, 0, 40)
minimizeButton.Position = UDim2.new(1, -80, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40) -- Matches frame
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 24
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.ZIndex = 6
minimizeButton.Parent = titleBar
print("Minimize button created with color: " .. tostring(minimizeButton.BackgroundColor3))

local minimizeButtonCorner = Instance.new("UICorner")
minimizeButtonCorner.CornerRadius = UDim.new(0, 12)
minimizeButtonCorner.Parent = minimizeButton

-- Main UI Elements
local spamButton = Instance.new("TextButton")
spamButton.Size = UDim2.new(0, 160, 0, 50)
spamButton.Position = UDim2.new(0.5, -80, 0, 50)
spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
spamButton.Text = "Start Fucking"
spamButton.TextColor3 = Color3.fromRGB(220, 255, 220)
spamButton.TextSize = 20
spamButton.Font = Enum.Font.Gotham
spamButton.ZIndex = 5
spamButton.Parent = frame

local spamButtonCorner = Instance.new("UICorner")
spamButtonCorner.CornerRadius = UDim.new(0, 10)
spamButtonCorner.Parent = spamButton

local cooldownBox = Instance.new("TextBox")
cooldownBox.Size = UDim2.new(0, 160, 0, 40)
cooldownBox.Position = UDim2.new(0.5, -80, 0, 110)
cooldownBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
cooldownBox.Text = ""
cooldownBox.TextColor3 = Color3.fromRGB(200, 200, 220)
cooldownBox.TextSize = 18
cooldownBox.Font = Enum.Font.Gotham
cooldownBox.PlaceholderText = "CD (Default: 0.1)"
cooldownBox.ZIndex = 5
cooldownBox.Parent = frame

local cooldownBoxCorner = Instance.new("UICorner")
cooldownBoxCorner.CornerRadius = UDim.new(0, 10)
cooldownBoxCorner.Parent = cooldownBox

local useButton = Instance.new("TextButton")
useButton.Size = UDim2.new(0, 160, 0, 50)
useButton.Position = UDim2.new(0.5, -80, 0, 160)
useButton.BackgroundColor3 = Color3.fromRGB(70, 90, 130)
useButton.Text = "Fuck Them Once"
useButton.TextColor3 = Color3.fromRGB(220, 220, 255)
useButton.TextSize = 20
useButton.Font = Enum.Font.Gotham
useButton.ZIndex = 5
useButton.Parent = frame

local useButtonCorner = Instance.new("UICorner")
useButtonCorner.CornerRadius = UDim.new(0, 10)
useButtonCorner.Parent = useButton

-- Animation Setup
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local isMinimized = false

-- Minimize/Maximize Functionality
minimizeButton.MouseButton1Click:Connect(function()
    print("Minimize button clicked, isMinimized: " .. tostring(isMinimized))
    if isMinimized then
        print("Maximizing UI")
        minimizeButton.Text = "−" -- Back to minimize symbol
        local tweenExpand = TweenService:Create(frame, tweenInfo, {
            Size = UDim2.new(0, 240, 0, 280)
        })
        tweenExpand:Play()
        tweenExpand.Completed:Connect(function()
            -- Show buttons only after animation completes
            for _, child in pairs(frame:GetChildren()) do
                if child ~= titleBar and child:IsA("GuiObject") then
                    child.Visible = true
                end
            end
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            print("Maximized, frame color: " .. tostring(frame.BackgroundColor3))
            print("Minimize button color: " .. tostring(minimizeButton.BackgroundColor3))
        end)
        isMinimized = false
    else
        print("Minimizing UI")
        minimizeButton.Text = "+" -- Show maximize symbol
        -- Hide buttons immediately
        for _, child in pairs(frame:GetChildren()) do
            if child ~= titleBar and child:IsA("GuiObject") then
                child.Visible = false
            end
        end
        local tweenShrink = TweenService:Create(frame, tweenInfo, {
            Size = UDim2.new(0, 240, 0, 40)
        })
        tweenShrink:Play()
        tweenShrink.Completed:Connect(function()
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            print("Minimized, frame color: " .. tostring(frame.BackgroundColor3))
            print("Minimize button color: " .. tostring(minimizeButton.BackgroundColor3))
        end)
        isMinimized = true
    end
end)

-- Dragging Functionality
local dragging, dragInput, dragStart, startPos
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
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    print("Close button clicked")
    local tween = TweenService:Create(frame, tweenInfo, {
        Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset + 200),
        BackgroundTransparency = 1
    })
    tween:Play()
    for _, child in pairs(frame:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                TweenService:Create(child, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
            elseif child:IsA("Frame") then
                TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
            end
        end
    end
    tween.Completed:Connect(function()
        screenGui.Enabled = false
        print("UI closed")
    end)
end)

-- Initial Warning Frame
local initialWarningFrame = Instance.new("Frame")
initialWarningFrame.Size = UDim2.new(0, 280, 0, 180)
initialWarningFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
initialWarningFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
initialWarningFrame.BorderSizePixel = 0
initialWarningFrame.BackgroundTransparency = 0
initialWarningFrame.Parent = screenGui
initialWarningFrame.Visible = true
initialWarningFrame.ZIndex = 10
print("Warning frame created with color: " .. tostring(initialWarningFrame.BackgroundColor3))

local initialWarningFrameCorner = Instance.new("UICorner")
initialWarningFrameCorner.CornerRadius = UDim.new(0, 12)
initialWarningFrameCorner.Parent = initialWarningFrame

local initialWarningText = Instance.new("TextLabel")
initialWarningText.Size = UDim2.new(1, -20, 0, 100)
initialWarningText.Position = UDim2.new(0, 10, 0, 10)
initialWarningText.BackgroundTransparency = 1
initialWarningText.Text = "Before using, note: this may lead to a kick/ban. Ensure your glove has an ability."
initialWarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
initialWarningText.TextSize = 20
initialWarningText.Font = Enum.Font.GothamBold
initialWarningText.TextWrapped = true
initialWarningText.ZIndex = 10
initialWarningText.Parent = initialWarningFrame

local initialHellNahButton = Instance.new("TextButton")
initialHellNahButton.Size = UDim2.new(0, 100, 0, 50)
initialHellNahButton.Position = UDim2.new(0.25, -50, 0, 120)
initialHellNahButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
initialHellNahButton.Text = "Hell Nah"
initialHellNahButton.TextColor3 = Color3.fromRGB(255, 220, 220)
initialHellNahButton.TextSize = 20
initialHellNahButton.Font = Enum.Font.Gotham
initialHellNahButton.ZIndex = 10
initialHellNahButton.Parent = initialWarningFrame

local initialHellNahButtonCorner = Instance.new("UICorner")
initialHellNahButtonCorner.CornerRadius = UDim.new(0, 10)
initialHellNahButtonCorner.Parent = initialHellNahButton

local initialOkButton = Instance.new("TextButton")
initialOkButton.Size = UDim2.new(0, 100, 0, 50)
initialOkButton.Position = UDim2.new(0.75, -50, 0, 120)
initialOkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
initialOkButton.Text = "OK!"
initialOkButton.TextColor3 = Color3.fromRGB(220, 255, 220)
initialOkButton.TextSize = 20
initialOkButton.Font = Enum.Font.Gotham
initialOkButton.ZIndex = 10
initialOkButton.Parent = initialWarningFrame

local initialOkButtonCorner = Instance.new("UICorner")
initialOkButtonCorner.CornerRadius = UDim.new(0, 10)
initialOkButtonCorner.Parent = initialOkButton

-- Warning Button Functionality
initialOkButton.MouseButton1Click:Connect(function()
    print("Initial warning OK clicked")
    local tweenOut = TweenService:Create(initialWarningFrame, tweenInfo, {
        Position = UDim2.new(0.5, -140, 0.5, 0),
        BackgroundTransparency = 1
    })
    tweenOut:Play()
    for _, child in pairs(initialWarningFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                TweenService:Create(child, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
            elseif child:IsA("Frame") then
                TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
            end
        end
    end
    tweenOut.Completed:Connect(function()
        initialWarningFrame.Visible = false
        frame.Visible = true
        frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0.5, 0)
        local tweenIn = TweenService:Create(frame, tweenInfo, {Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0.5, -140)})
        tweenIn:Play()
        -- Ensure buttons are visible on initial show
        spamButton.Visible = true
        cooldownBox.Visible = true
        useButton.Visible = true
        print("Main UI shown, color: " .. tostring(frame.BackgroundColor3))
    end)
end)

initialHellNahButton.MouseButton1Click:Connect(function()
    Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

print("Script fully loaded")
