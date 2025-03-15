print("Script starting...")

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui", 5)
screenGui.Name = "MSBfucker"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
print("ScreenGui created and parented to PlayerGui")

-- Create main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 280)
frame.Position = UDim2.new(0.5, -120, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0
frame.Visible = false
frame.ZIndex = 5
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame
print("Main frame created and initially hidden")

-- Create title bar (draggable)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
titleBar.BorderSizePixel = 0
titleBar.BackgroundTransparency = 0
titleBar.ZIndex = 6
titleBar.Parent = frame

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 12)
titleBarCorner.Parent = titleBar

-- Create title text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "MSB Fucker"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextTransparency = 0
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.ZIndex = 6
title.Parent = titleBar

-- Create close button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 220, 220)
closeButton.TextTransparency = 0
closeButton.BackgroundTransparency = 0
closeButton.TextSize = 24
closeButton.Font = Enum.Font.GothamBold
closeButton.ZIndex = 6
closeButton.Parent = titleBar

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 12)
closeButtonCorner.Parent = closeButton

-- Create minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 40, 0, 40)
minimizeButton.Position = UDim2.new(1, -80, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
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

-- Create spam toggle button
local spamButton = Instance.new("TextButton")
spamButton.Size = UDim2.new(0, 160, 0, 50)
spamButton.Position = UDim2.new(0.5, -80, 0, 50)
spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
spamButton.Text = "Start Fucking"
spamButton.TextColor3 = Color3.fromRGB(220, 255, 220)
spamButton.TextTransparency = 0
spamButton.BackgroundTransparency = 0
spamButton.TextSize = 20
spamButton.Font = Enum.Font.Gotham
spamButton.ZIndex = 5
spamButton.Parent = frame

local spamButtonCorner = Instance.new("UICorner")
spamButtonCorner.CornerRadius = UDim.new(0, 10)
spamButtonCorner.Parent = spamButton

-- Create cooldown text box
local cooldownBox = Instance.new("TextBox")
cooldownBox.Size = UDim2.new(0, 160, 0, 40)
cooldownBox.Position = UDim2.new(0.5, -80, 0, 110)
cooldownBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
cooldownBox.Text = ""
cooldownBox.TextColor3 = Color3.fromRGB(200, 200, 220)
cooldownBox.TextTransparency = 0
cooldownBox.BackgroundTransparency = 0
cooldownBox.TextSize = 18
cooldownBox.Font = Enum.Font.Gotham
cooldownBox.PlaceholderText = "CD (Default: 0.1)"
cooldownBox.ZIndex = 5
cooldownBox.Parent = frame

local cooldownBoxCorner = Instance.new("UICorner")
cooldownBoxCorner.CornerRadius = UDim.new(0, 10)
cooldownBoxCorner.Parent = cooldownBox

-- Create single-use button
local useButton = Instance.new("TextButton")
useButton.Size = UDim2.new(0, 160, 0, 50)
useButton.Position = UDim2.new(0.5, -80, 0, 160)
useButton.BackgroundColor3 = Color3.fromRGB(70, 90, 130)
useButton.Text = "Fuck Them Once"
useButton.TextColor3 = Color3.fromRGB(220, 220, 255)
useButton.TextTransparency = 0
useButton.BackgroundTransparency = 0
useButton.TextSize = 20
useButton.Font = Enum.Font.Gotham
useButton.ZIndex = 5
useButton.Parent = frame

local useButtonCorner = Instance.new("UICorner")
useButtonCorner.CornerRadius = UDim.new(0, 10)
useButtonCorner.Parent = useButton

-- Create initial warning frame
local initialWarningFrame = Instance.new("Frame")
initialWarningFrame.Size = UDim2.new(0, 280, 0, 180)
initialWarningFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
initialWarningFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
initialWarningFrame.BorderSizePixel = 0
initialWarningFrame.BackgroundTransparency = 0
initialWarningFrame.Parent = screenGui
initialWarningFrame.Visible = true
initialWarningFrame.ZIndex = 10
print("Initial warning frame created")

local initialWarningFrameCorner = Instance.new("UICorner")
initialWarningFrameCorner.CornerRadius = UDim.new(0, 12)
initialWarningFrameCorner.Parent = initialWarningFrame

local initialWarningText = Instance.new("TextLabel")
initialWarningText.Size = UDim2.new(1, -20, 0, 100)
initialWarningText.Position = UDim2.new(0, 10, 0, 10)
initialWarningText.BackgroundTransparency = 1
initialWarningText.Text = "Before using, note: this may lead to a kick/ban. Ensure your glove has an ability."
initialWarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
initialWarningText.TextTransparency = 0
initialWarningText.TextSize = 20
initialWarningText.Font = Enum.Font.GothamBold
initialWarningText.TextWrapped = true
initialWarningText.ZIndex = 10
initialWarningText.Parent = initialWarningFrame
print("Initial warning text added")

local initialHellNahButton = Instance.new("TextButton")
initialHellNahButton.Size = UDim2.new(0, 100, 0, 50)
initialHellNahButton.Position = UDim2.new(0.25, -50, 0, 120)
initialHellNahButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
initialHellNahButton.Text = "Hell Nah"
initialHellNahButton.TextColor3 = Color3.fromRGB(255, 220, 220)
initialHellNahButton.TextTransparency = 0
initialHellNahButton.BackgroundTransparency = 0
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
initialOkButton.TextTransparency = 0
initialOkButton.BackgroundTransparency = 0
initialOkButton.TextSize = 20
initialOkButton.Font = Enum.Font.Gotham
initialOkButton.ZIndex = 10
initialOkButton.Parent = initialWarningFrame

local initialOkButtonCorner = Instance.new("UICorner")
initialOkButtonCorner.CornerRadius = UDim.new(0, 10)
initialOkButtonCorner.Parent = initialOkButton
print("Initial warning buttons added")

-- Create no-glove warning frame
local noGloveWarningFrame = Instance.new("Frame")
noGloveWarningFrame.Size = UDim2.new(0, 280, 0, 180)
noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
noGloveWarningFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
noGloveWarningFrame.BorderSizePixel = 0
noGloveWarningFrame.BackgroundTransparency = 0
noGloveWarningFrame.Parent = screenGui
noGloveWarningFrame.Visible = false
noGloveWarningFrame.ZIndex = 10

local noGloveWarningFrameCorner = Instance.new("UICorner")
noGloveWarningFrameCorner.CornerRadius = UDim.new(0, 12)
noGloveWarningFrameCorner.Parent = noGloveWarningFrame

local noGloveWarningText = Instance.new("TextLabel")
noGloveWarningText.Size = UDim2.new(1, -20, 0, 100)
noGloveWarningText.Position = UDim2.new(0, 10, 0, 10)
noGloveWarningText.BackgroundTransparency = 1
noGloveWarningText.Text = "Equip a damn glove first!"
noGloveWarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
noGloveWarningText.TextTransparency = 0
noGloveWarningText.TextSize = 20
noGloveWarningText.Font = Enum.Font.GothamBold
noGloveWarningText.TextWrapped = true
noGloveWarningText.ZIndex = 10
noGloveWarningText.Parent = noGloveWarningFrame

local noGloveHellNahButton = Instance.new("TextButton")
noGloveHellNahButton.Size = UDim2.new(0, 100, 0, 50)
noGloveHellNahButton.Position = UDim2.new(0.25, -50, 0, 120)
noGloveHellNahButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
noGloveHellNahButton.Text = "Hell Nah"
noGloveHellNahButton.TextColor3 = Color3.fromRGB(255, 220, 220)
noGloveHellNahButton.TextTransparency = 0
noGloveHellNahButton.BackgroundTransparency = 0
noGloveHellNahButton.TextSize = 20
noGloveHellNahButton.Font = Enum.Font.Gotham
noGloveHellNahButton.ZIndex = 10
noGloveHellNahButton.Parent = noGloveWarningFrame

local noGloveHellNahButtonCorner = Instance.new("UICorner")
noGloveHellNahButtonCorner.CornerRadius = UDim.new(0, 10)
noGloveHellNahButtonCorner.Parent = noGloveHellNahButton

local noGloveFuckOffButton = Instance.new("TextButton")
noGloveFuckOffButton.Size = UDim2.new(0, 100, 0, 50)
noGloveFuckOffButton.Position = UDim2.new(0.75, -50, 0, 120)
noGloveFuckOffButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
noGloveFuckOffButton.Text = "Fuck Off"
noGloveFuckOffButton.TextColor3 = Color3.fromRGB(220, 255, 220)
noGloveFuckOffButton.TextTransparency = 0
noGloveFuckOffButton.BackgroundTransparency = 0
noGloveFuckOffButton.TextSize = 20
noGloveFuckOffButton.Font = Enum.Font.Gotham
noGloveFuckOffButton.ZIndex = 10
noGloveFuckOffButton.Parent = noGloveWarningFrame

local noGloveFuckOffButtonCorner = Instance.new("UICorner")
noGloveFuckOffButtonCorner.CornerRadius = UDim.new(0, 10)
noGloveFuckOffButtonCorner.Parent = noGloveFuckOffButton

-- Animation setup
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local isMinimized = false

-- Minimize/Maximize Functionality
minimizeButton.MouseButton1Click:Connect(function()
    print("Minimize button clicked, isMinimized: " .. tostring(isMinimized))
    if isMinimized then
        print("Maximizing UI")
        minimizeButton.Text = "−"
        local tweenExpand = TweenService:Create(frame, tweenInfo, {
            Size = UDim2.new(0, 240, 0, 280)
        })
        tweenExpand:Play()
        tweenExpand.Completed:Connect(function()
            for _, child in pairs(frame:GetChildren()) do
                if child ~= titleBar and child:IsA("GuiObject") then
                    child.Visible = true
                end
            end
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            print("Maximized, frame color: " .. tostring(frame.BackgroundColor3))
        end)
        isMinimized = false
    else
        print("Minimizing UI")
        minimizeButton.Text = "+"
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
        end)
        isMinimized = true
    end
end)

-- Dragging functionality
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

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
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
    end)
end)

-- Initial warning UI OK! button functionality
initialOkButton.MouseButton1Click:Connect(function()
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
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0.5, 0)
        local tweenIn = TweenService:Create(frame, tweenInfo, {Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0.5, -140)})
        tweenIn:Play()
        print("Initial warning OK! clicked, main menu animated in")
    end)
end)

-- Initial warning UI Hell Nah button functionality
initialHellNahButton.MouseButton1Click:Connect(function()
    Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

-- No-glove warning UI Fuck Off button functionality
noGloveFuckOffButton.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(noGloveWarningFrame, tweenInfo, {
        Position = UDim2.new(0.5, -140, 0.5, 0),
        BackgroundTransparency = 1
    })
    tween:Play()
    for _, child in pairs(noGloveWarningFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                TweenService:Create(child, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
            elseif child:IsA("Frame") then
                TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
            end
        end
    end
    tween.Completed:Connect(function()
        noGloveWarningFrame.Visible = false
        noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
        noGloveWarningFrame.BackgroundTransparency = 0
        noGloveWarningText.TextTransparency = 0
        noGloveHellNahButton.TextTransparency = 0
        noGloveHellNahButton.BackgroundTransparency = 0
        noGloveFuckOffButton.TextTransparency = 0
        noGloveFuckOffButton.BackgroundTransparency = 0
    end)
end)

-- No-glove warning UI Hell Nah button functionality
noGloveHellNahButton.MouseButton1Click:Connect(function()
    Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

-- Glove detection and ability firing
local player = Players.LocalPlayer
local isActive = false

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

local function fireAbility()
    local glove, gloveNameNoSpaces = getEquippedGlove()
    if not glove or not player.Character then
        noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
        noGloveWarningFrame.Visible = true
        local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)})
        tweenIn:Play()
        return
    end
    
    local success = false
    local char = player.Character
    
    if char:FindFirstChild(gloveNameNoSpaces) then
        local abilityEvent = char[gloveNameNoSpaces]:FindFirstChild("AbilityEvent")
        if abilityEvent then
            pcall(function()
                abilityEvent:FireServer()
                success = true
                print("Ability fired via glove event")
            end)
        end
    end
    
    if not success then
        local remoteEvents = ReplicatedStorage:FindFirstChild("RemoteEvents")
        if remoteEvents then
            local fallbackEvent = remoteEvents:FindFirstChild("AbilityEvent")
            if fallbackEvent then
                pcall(function()
                    fallbackEvent:FireServer()
                    print("Ability fired via fallback event")
                end)
            else
                warn("No AbilityEvent found in RemoteEvents!")
            end
        else
            warn("No RemoteEvents folder found!")
        end
    end
end

-- Spam button functionality
spamButton.MouseButton1Click:Connect(function()
    if not isActive then
        local glove = getEquippedGlove()
        if not glove or not player.Character then
            noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
            noGloveWarningFrame.Visible = true
            local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)})
            tweenIn:Play()
            return
        end
        
        isActive = true
        spamButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
        spamButton.Text = "Stop Fucking"
        print("Spamming started")
        
        spawn(function()
            while isActive do
                if not getEquippedGlove() or not player.Character then
                    isActive = false
                    spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
                    spamButton.Text = "Start Fucking"
                    noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
                    noGloveWarningFrame.Visible = true
                    local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)})
                    tweenIn:Play()
                    break
                end
                fireAbility()
                local cooldown = tonumber(cooldownBox.Text) or 0.1
                task.wait(math.max(0, cooldown))
            end
        end)
    else
        isActive = false
        spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
        spamButton.Text = "Start Fucking"
        print("Spamming stopped")
    end
end)

-- Single-use button functionality
useButton.MouseButton1Click:Connect(function()
    print("Single use clicked")
    fireAbility()
end)

-- Stop spamming on character respawn
player.CharacterAdded:Connect(function()
    if isActive then
        isActive = false
        spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
        spamButton.Text = "Start Fucking"
        print("Spamming stopped due to character respawn")
    end
end)

print("Script fully loaded")
