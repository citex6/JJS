



local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- GUI container
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ReverendInsanityUI"
screenGui.ResetOnSpawn = false


-- Main Frame (collapsed by default)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 400, 0, 270)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
mainFrame.BorderSizePixel = 0

-- Title Label
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
title.Text = "REVEREND INSANITY"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title.TextSize = 24









-- Start Button
local spoofPlayerBtn = Instance.new("TextButton", mainFrame)
spoofPlayerBtn.Size = UDim2.new(0.9, 0, 0, 40)
spoofPlayerBtn.Position = UDim2.new(0.05, 0, 1, -160)
spoofPlayerBtn.AnchorPoint = Vector2.new(0, 1)
spoofPlayerBtn.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
spoofPlayerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
spoofPlayerBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
spoofPlayerBtn.TextSize = 20
spoofPlayerBtn.Text = "AVATAR SPOOFER/ESCAPE MENU/LEADERSTAT"
-- Start Button
local KillsoundIdBtn = Instance.new("TextButton", mainFrame)
KillsoundIdBtn.Size = UDim2.new(0.9, 0, 0, 40)
KillsoundIdBtn.Position = UDim2.new(0.05, 0, 1, -100)
KillsoundIdBtn.AnchorPoint = Vector2.new(0, 1)
KillsoundIdBtn.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
KillsoundIdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KillsoundIdBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
KillsoundIdBtn.TextSize = 20
KillsoundIdBtn.Text = "Kill Sound Id Method"
-- Start Button
local BillboardIdBtn = Instance.new("TextButton", mainFrame)
BillboardIdBtn.Size = UDim2.new(0.9, 0, 0, 40)
BillboardIdBtn.Position = UDim2.new(0.05, 0, 1, -40)
BillboardIdBtn.AnchorPoint = Vector2.new(0, 1)
BillboardIdBtn.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
BillboardIdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BillboardIdBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
BillboardIdBtn.TextSize = 20
BillboardIdBtn.Text = "Billboard Id Method"



-- Define thanks list

-- Dynamic Special Thanks Section
local thanksList = {
	{ name = "@dragonfly50101", contribution = "Saving us with a GOATED Morph Script" },
	{ name = "@reap4985", contribution = "Saved us with CharacterMesh method" },
	{ name = "@avrogottermed16", contribution = "Escape Menu Persistence Method, so smart boii, Co Owner of JJS UG, Day 0 Great Friend, we are the exception holder" },
	{ name = "@ffj2.0", contribution = "Inspiration" },
	{ name = "@bar5", contribution = "Trust funds, JJS comp demon & Great friend, we are the exception holder" },
	{ name = "@sttrigger0", contribution = "Underground Plug, putting us on sketchy websites, opinion & emotion stylist" },
	{ name = "@pman42", contribution = "FDN EMPEROR And The Mayday dance gif Progenitor" },
	{ name = "@21_zs", contribution = "Going undercover in enemy territory, RNE Aura Stylist" },
}
-- Container Frame
local thanksFrame = Instance.new("Frame", mainFrame)
thanksFrame.Position = UDim2.new(0, 0, 1, 0)
thanksFrame.Size = UDim2.new(1, 0, 0, 50) -- Temporary, will be resized
thanksFrame.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
thanksFrame.BorderSizePixel = 0
thanksFrame.ClipsDescendants = true

-- Overlay Holder Frame (for image background, no layout)
local overlayHolder = Instance.new("Frame", thanksFrame)
overlayHolder.Size = UDim2.new(1, 0, 1, 0)
overlayHolder.Position = UDim2.new(0, 0, 0, 0)
overlayHolder.BackgroundTransparency = 1
overlayHolder.ZIndex = 1

local overlayImage = Instance.new("ImageLabel", overlayHolder)
overlayImage.Size = UDim2.new(1, 0, 1, 0)
overlayImage.Position = UDim2.new(0, 0, 0, 0)
overlayImage.BackgroundTransparency = 1
overlayImage.Image = "rbxassetid://72347679289589" -- your image asset id here
overlayImage.ImageTransparency = 0.7 -- adjust opacity here
overlayImage.ZIndex = 1

-- Content Frame (holds all text, above overlay)
local contentFrame = Instance.new("Frame", thanksFrame)
contentFrame.Size = UDim2.new(1, 0, 1, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.ZIndex = 2

-- Title Label
local thanksTitle = Instance.new("TextLabel", contentFrame)
thanksTitle.Size = UDim2.new(1, 0, 0, 30)
thanksTitle.Position = UDim2.new(0, 0, 0, 0)
thanksTitle.BackgroundTransparency = 1
thanksTitle.Text = "        DISCORD           SPECIAL THANKS TO:"
thanksTitle.Font = Enum.Font.SourceSansBold
thanksTitle.TextSize = 20
thanksTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
thanksTitle.TextXAlignment = Enum.TextXAlignment.Left
thanksTitle.LayoutOrder = 0

-- UIListLayout inside contentFrame for dynamic entries
local uiList = Instance.new("UIListLayout", contentFrame)
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 4)
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Left
uiList.VerticalAlignment = Enum.VerticalAlignment.Top


local quitBtn = Instance.new("TextButton", mainFrame)
quitBtn.Size = UDim2.new(0.9, 0, 0, 40)

-- Place it 20 pixels below thanksFrame
quitBtn.Position = UDim2.new(
    0.05, -- X offset (centered)
    0,
    thanksFrame.Position.Y.Scale,
    thanksFrame.Position.Y.Offset + thanksFrame.Size.Y.Offset + 250
)

quitBtn.AnchorPoint = Vector2.new(0, 0)
quitBtn.BackgroundColor3 = Color3.fromRGB(255,105,97)
quitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
quitBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
quitBtn.TextSize = 20
quitBtn.Text = "<< Close GUI <<"
-- Add dynamic entries
for i, entry in ipairs(thanksList) do
	local row = Instance.new("Frame", contentFrame)
	row.Size = UDim2.new(1, -20, 0, 0) -- Auto-size height
	row.BackgroundTransparency = 1
	row.LayoutOrder = i

	local nameLabel = Instance.new("TextLabel", row)
	nameLabel.Size = UDim2.new(0.3, 0, 0, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
	nameLabel.Font =  Enum.Font.SourceSans
	nameLabel.TextSize = 15
	nameLabel.TextXAlignment = Enum.TextXAlignment.Center
	nameLabel.Text = entry.name
	nameLabel.TextWrapped = true
	nameLabel.AutomaticSize = Enum.AutomaticSize.Y

	local contribLabel = Instance.new("TextLabel", row)
	contribLabel.Size = UDim2.new(0.7, 0, 0, 0)
	contribLabel.Position = UDim2.new(0.3, 10, 0, 0)
	contribLabel.BackgroundTransparency = 1
	contribLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	contribLabel.Font = Enum.Font.SourceSans
	contribLabel.TextSize = 16
	contribLabel.TextXAlignment = Enum.TextXAlignment.Left
	contribLabel.Text = entry.contribution
	contribLabel.TextWrapped = true
	contribLabel.AutomaticSize = Enum.AutomaticSize.Y

	row.AutomaticSize = Enum.AutomaticSize.Y
end

-- Automatically resize parent frame height after layout updates
task.defer(function()
	-- Wait a frame to allow layout updates
	task.wait()
	
	local totalHeight = thanksTitle.AbsoluteSize.Y + 10 -- some padding
	for _, child in ipairs(contentFrame:GetChildren()) do
		if child:IsA("Frame") then
			totalHeight += child.AbsoluteSize.Y + 4
		end
	end
	thanksFrame.Size = UDim2.new(1, 0, 0, totalHeight + 20)
	contentFrame.Size = UDim2.new(1, 0, 0, totalHeight + 20)
	overlayHolder.Size = UDim2.new(1, 0, 0, totalHeight + 20)
end)


local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Your dragging function with UserInputService and TweenService in scope
local function AddDraggingFunctionality(DragPoint, Main)
    local Dragging, DragInput, MousePos, FramePos = false, nil, nil, nil
    
    DragPoint.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            MousePos = input.Position
            FramePos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    DragPoint.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local Delta = input.Position - MousePos
            TweenService:Create(Main, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
            }):Play()
        end
    end)
end

-- Call this after your UI elements are created:
AddDraggingFunctionality(title, mainFrame)
AddDraggingFunctionality(thanksFrame, mainFrame)

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://8388724806"
clickSound.Volume = 1
clickSound.Parent = workspace-- or workspace


local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Reference existing ScreenGui by name
local ReverendInsanitySpooferUI = playerGui:WaitForChild("ReverendInsanitySpooferUI")
local ReverendInsanityKillsoundUI = playerGui:WaitForChild("ReverendInsanityKillsoundUI")
local ReverendInsanityBillboardUI = playerGui:WaitForChild("ReverendInsanityBillboardUI")

-- Connect click event
spoofPlayerBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	ReverendInsanitySpooferUI.Enabled = true
	screenGui.Enabled = false
end)
KillsoundIdBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	ReverendInsanityKillsoundUI.Enabled = true
	screenGui.Enabled = false
end)
BillboardIdBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	ReverendInsanityBillboardUI.Enabled = true
	screenGui.Enabled = false
end)
quitBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	screenGui.Enabled = false
end)


local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = screenGui


UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end -- ignore if typing in chat, etc.

	if input.KeyCode == Enum.KeyCode.RightControl then
		screenGui.Enabled = not screenGui.Enabled
	end
end)