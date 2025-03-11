print("Script starting...") -- Debug: Confirm script begins

-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

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
frame.BackgroundTransparency = 0 -- Visible by default
frame.Visible = false -- Hidden initially
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
titleBar.BackgroundTransparency = 0 -- Visible by default
titleBar.Parent = frame

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 12)
titleBarCorner.Parent = titleBar

-- Create title text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "MSB Fucker"
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Pure white
title.TextTransparency = 0 -- Visible by default
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = titleBar

-- Create close button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 220, 220)
closeButton.TextTransparency = 0 -- Visible by default
closeButton.BackgroundTransparency = 0 -- Visible by default
closeButton.TextSize = 24
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 12)
closeButtonCorner.Parent = closeButton

-- Create spam toggle button
local spamButton = Instance.new("TextButton")
spamButton.Size = UDim2.new(0, 160, 0, 50)
spamButton.Position = UDim2.new(0.5, -80, 0, 50)
spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
spamButton.Text = "Start Fucking"
spamButton.TextColor3 = Color3.fromRGB(220, 255, 220)
spamButton.TextTransparency = 0 -- Visible by default
spamButton.BackgroundTransparency = 0 -- Visible by default
spamButton.TextSize = 20
spamButton.Font = Enum.Font.Gotham
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
cooldownBox.TextTransparency = 0 -- Visible by default
cooldownBox.BackgroundTransparency = 0 -- Visible by default
cooldownBox.TextSize = 18
cooldownBox.Font = Enum.Font.Gotham
cooldownBox.PlaceholderText = "CD (Default: 0.1)"
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
useButton.TextTransparency = 0 -- Visible by default
useButton.BackgroundTransparency = 0 -- Visible by default
useButton.TextSize = 20
useButton.Font = Enum.Font.Gotham
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
initialWarningFrame.BackgroundTransparency = 0 -- Visible by default
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
initialWarningText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Pure white
initialWarningText.TextTransparency = 0 -- Visible by default
initialWarningText.TextSize = 20
initialWarningText.Font = Enum.Font.GothamBold
initialWarningText.TextWrapped = true
initialWarningText.Parent = initialWarningFrame
print("Initial warning text added")

local initialHellNahButton = Instance.new("TextButton")
initialHellNahButton.Size = UDim2.new(0, 100, 0, 50)
initialHellNahButton.Position = UDim2.new(0.25, -50, 0, 120)
initialHellNahButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
initialHellNahButton.Text = "Hell Nah"
initialHellNahButton.TextColor3 = Color3.fromRGB(255, 220, 220)
initialHellNahButton.TextTransparency = 0 -- Visible by default
initialHellNahButton.BackgroundTransparency = 0 -- Visible by default
initialHellNahButton.TextSize = 20
initialHellNahButton.Font = Enum.Font.Gotham
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
initialOkButton.TextTransparency = 0 -- Visible by default
initialOkButton.BackgroundTransparency = 0 -- Visible by default
initialOkButton.TextSize = 20
initialOkButton.Font = Enum.Font.Gotham
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
noGloveWarningFrame.BackgroundTransparency = 0 -- Visible by default
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
noGloveWarningText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Pure white
noGloveWarningText.TextTransparency = 0 -- Visible by default
noGloveWarningText.TextSize = 20
noGloveWarningText.Font = Enum.Font.GothamBold
noGloveWarningText.TextWrapped = true
noGloveWarningText.Parent = noGloveWarningFrame

local noGloveHellNahButton = Instance.new("TextButton")
noGloveHellNahButton.Size = UDim2.new(0, 100, 0, 50)
noGloveHellNahButton.Position = UDim2.new(0.25, -50, 0, 120)
noGloveHellNahButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
noGloveHellNahButton.Text = "Hell Nah"
noGloveHellNahButton.TextColor3 = Color3.fromRGB(255, 220, 220)
noGloveHellNahButton.TextTransparency = 0 -- Visible by default
noGloveHellNahButton.BackgroundTransparency = 0 -- Visible by default
noGloveHellNahButton.TextSize = 20
noGloveHellNahButton.Font = Enum.Font.Gotham
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
noGloveFuckOffButton.TextTransparency = 0 -- Visible by default
noGloveFuckOffButton.BackgroundTransparency = 0 -- Visible by default
noGloveFuckOffButton.TextSize = 20
noGloveFuckOffButton.Font = Enum.Font.Gotham
noGloveFuckOffButton.Parent = noGloveWarningFrame

local noGloveFuckOffButtonCorner = Instance.new("UICorner")
noGloveFuckOffButtonCorner.CornerRadius = UDim.new(0, 10)
noGloveFuckOffButtonCorner.Parent = noGloveFuckOffButton

-- Animation setup
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

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

-- Close button functionality with slide down and fade
closeButton.MouseButton1Click:Connect(function()
    local currentPos = frame.Position
    local tween = TweenService:Create(frame, tweenInfo, {
        Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, currentPos.Y.Offset + 200), -- Slide down
        BackgroundTransparency = 1
    })
    tween:Play()
    
    -- Fade all children
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

-- Initial warning UI OK! button functionality with slide and fade
initialOkButton.MouseButton1Click:Connect(function()
    local tweenOut = TweenService:Create(initialWarningFrame, tweenInfo, {
        Position = UDim2.new(0.5, -140, 0.5, 0), -- Slide down
        BackgroundTransparency = 1
    })
    tweenOut:Play()
    
    -- Fade all children
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
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0.5, 0) -- Start below
        local tweenIn = TweenService:Create(frame, tweenInfo, {Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0.5, -140)}) -- Slide up
        tweenIn:Play()
        print("Initial warning OK! clicked, main menu animated in")
    end)
end)

-- Initial warning UI Hell Nah button functionality
initialHellNahButton.MouseButton1Click:Connect(function()
    Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

-- No-glove warning UI Fuck Off button functionality with slide and fade
noGloveFuckOffButton.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(noGloveWarningFrame, tweenInfo, {
        Position = UDim2.new(0.5, -140, 0.5, 0), -- Slide down
        BackgroundTransparency = 1
    })
    tween:Play()
    
    -- Fade all children
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
        -- Reset position and transparency for next trigger
        noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
        noGloveWarningFrame.BackgroundTransparency = 0
        for _, child in pairs(noGloveWarningFrame:GetDescendants()) do
            if child:IsA("GuiObject") then
                if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                    child.TextTransparency = 0
                    child.BackgroundTransparency = 0
                elseif child:IsA("Frame") then
                    child.BackgroundTransparency = 0
                end
            end
        end
    end)
end)

-- No-glove warning UI Hell Nah button functionality
noGloveHellNahButton.MouseButton1Click:Connect(function()
    Players.LocalPlayer:Kick("Hell nah? Go fucking eat a shit right now")
end)

-- Glove detection and ability firing
local player = Players.LocalPlayer

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
    if not glove then
        noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0) -- Start below
        noGloveWarningFrame.Visible = true
        local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)}) -- Slide up
        tweenIn:Play()
        return
    end
    
    local char = player.Character
    if not char then
        noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
        noGloveWarningFrame.Visible = true
        local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)})
        tweenIn:Play()
        return
    end
    
    local success = false
    
    if char:FindFirstChild(gloveNameNoSpaces) then
        local abilityEvent = char[gloveNameNoSpaces]:FindFirstChild("AbilityEvent")
        if abilityEvent then
            pcall(function()
                abilityEvent:FireServer()
                success = true
            end)
        end
    end
    
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
            noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
            noGloveWarningFrame.Visible = true
            local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)})
            tweenIn:Play()
            return
        end
        
        isActive = true
        spamButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
        spamButton.Text = "Stop Fucking"
        
        spawn(function()
            while isActive do
                if not getEquippedGlove() or not player.Character then
                    isActive = false
                    spamButton.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
                    spamButton.Text = "Start Fucking"
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
    end
end)

-- Single-use button functionality
useButton.MouseButton1Click:Connect(function()
    local glove = getEquippedGlove()
    if not glove or not player.Character then
        noGloveWarningFrame.Position = UDim2.new(0.5, -140, 0.5, 0)
        noGloveWarningFrame.Visible = true
        local tweenIn = TweenService:Create(noGloveWarningFrame, tweenInfo, {Position = UDim2.new(0.5, -140, 0.5, -90)})
        tweenIn:Play()
        return
    end
    fireAbility()
end)

print("Script fully loaded")
