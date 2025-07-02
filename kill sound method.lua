
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- GUI container
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ReverendInsanityKillsoundUI"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false


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

-- Target Audio ID Input Box
local inputBox = Instance.new("TextBox", mainFrame)
inputBox.Size = UDim2.new(0.9, 0, 0, 40)
inputBox.Position = UDim2.new(0.05, 0, 0, 60)
inputBox.PlaceholderText = "AUDIO ID TO PLAY ON DEATH (e.g. 12345678)"
inputBox.BackgroundColor3 = Color3.fromRGB(30, 50, 70)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
inputBox.Text = ""
inputBox.TextSize = 18

-- Selected Player Preview Frame
local selectedFrame = Instance.new("TextButton", mainFrame)
selectedFrame.Size = UDim2.new(0.9, 0, 0, 60)
selectedFrame.Position = UDim2.new(0.05, 0, 0, 110)
selectedFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
selectedFrame.AutoButtonColor = true
selectedFrame.Text = ""

-- Avatar image
local selectedAvatar = Instance.new("ImageLabel", selectedFrame)
selectedAvatar.Size = UDim2.new(0, 50, 0, 50)
selectedAvatar.Position = UDim2.new(0, 5, 0.5, -25)
selectedAvatar.BackgroundTransparency = 1
selectedAvatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

-- Info container
local infoContainer = Instance.new("Frame", selectedFrame)
infoContainer.Size = UDim2.new(1, -65, 1, -10)
infoContainer.Position = UDim2.new(0, 60, 0, 5)
infoContainer.BackgroundTransparency = 1

-- Display name
local selectedDisplay = Instance.new("TextLabel", infoContainer)
selectedDisplay.Size = UDim2.new(1, 0, 0.5, 0)
selectedDisplay.Position = UDim2.new(0, 0, 0, 0)
selectedDisplay.BackgroundTransparency = 1
selectedDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
selectedDisplay.Font = Enum.Font.SourceSans
selectedDisplay.TextSize = 18
selectedDisplay.TextXAlignment = Enum.TextXAlignment.Left
selectedDisplay.Text = "DisplayName"

-- Username
local selectedUsername = Instance.new("TextLabel", infoContainer)
selectedUsername.Size = UDim2.new(1, 0, 0.5, 0)
selectedUsername.Position = UDim2.new(0, 0, 0.5, 0)
selectedUsername.BackgroundTransparency = 1
selectedUsername.TextColor3 = Color3.fromRGB(180, 180, 180)
selectedUsername.Font = Enum.Font.SourceSans
selectedUsername.TextSize = 16
selectedUsername.TextXAlignment = Enum.TextXAlignment.Left
selectedUsername.Text = "@username"

-- Hidden Scrollable Player Selector
local scrollFrame = Instance.new("ScrollingFrame", mainFrame)
scrollFrame.Size = UDim2.new(0.9, 0, 0, 180)
scrollFrame.Position = UDim2.new(0.05, 0, 0, 180)
scrollFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.Visible = false

-- Tween function
local function tweenMainFrameHeight(toHeight)
	local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 400, 0, toHeight)
	})
	tween:Play()
end

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

local mainPageBtn = Instance.new("TextButton", mainFrame)
mainPageBtn.Size = UDim2.new(0.9, 0, 0, 40)

-- Place it 20 pixels below thanksFrame
mainPageBtn.Position = UDim2.new(
    0.05, -- X offset (centered)
    0,
    thanksFrame.Position.Y.Scale,
    thanksFrame.Position.Y.Offset + thanksFrame.Size.Y.Offset + 250
)

mainPageBtn.AnchorPoint = Vector2.new(0, 0)
mainPageBtn.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
mainPageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
mainPageBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
mainPageBtn.TextSize = 20
mainPageBtn.Text = "<< Main Page <<"

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

-- Variables for target player and sound id
local targetPlayer = nil
local soundId = ""

-- Player List Population
local function refreshPlayerList()
	-- Clear old entries
	for _, child in ipairs(scrollFrame:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end

	local yPos = 0
	for _, plr in ipairs(Players:GetPlayers()) do

		local entry = Instance.new("TextButton", scrollFrame)
		entry.Size = UDim2.new(1, -10, 0, 60)
		entry.Position = UDim2.new(0, 5, 0, yPos)
		entry.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
		entry.AutoButtonColor = true
		entry.Text = ""

		local thumb = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
		local icon = Instance.new("ImageLabel", entry)
		icon.Size = UDim2.new(0, 48, 0, 48)
		icon.Position = UDim2.new(0, 6, 0.5, -24)
		icon.BackgroundTransparency = 1
		icon.Image = thumb

		local infoFrame = Instance.new("Frame", entry)
		infoFrame.Size = UDim2.new(1, -60, 1, -20)
		infoFrame.Position = UDim2.new(0, 60, 0, 10)
		infoFrame.BackgroundTransparency = 1

		local display = Instance.new("TextLabel", infoFrame)
		display.Size = UDim2.new(1, 0, 0.5, 0)
		display.Position = UDim2.new(0, 0, 0, 0)
		display.BackgroundTransparency = 1
		display.TextColor3 = Color3.fromRGB(255, 255, 255)
		display.Font = Enum.Font.SourceSans
		display.TextSize = 16
		display.TextXAlignment = Enum.TextXAlignment.Left
		display.Text = plr.DisplayName

		local uname = Instance.new("TextLabel", infoFrame)
		uname.Size = UDim2.new(1, 0, 0.5, 0)
		uname.Position = UDim2.new(0, 0, 0.5, 0)
		uname.BackgroundTransparency = 1
		uname.TextColor3 = Color3.fromRGB(180, 180, 180)
		uname.Font = Enum.Font.SourceSans
		uname.TextSize = 14
		uname.TextXAlignment = Enum.TextXAlignment.Left
		uname.Text = "@" .. plr.Name

		entry.MouseButton1Click:Connect(function()
			selectedDisplay.Text = plr.DisplayName
			selectedUsername.Text = "@" .. plr.Name
			selectedAvatar.Image = thumb
			targetPlayer = plr

			isExpanded = false
			tweenMainFrameHeight(270)
			scrollFrame.Visible = false
		end)

		yPos += 65
	end

	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end
refreshPlayerList()

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)



-- Expand/collapse logic
local isExpanded = false

selectedFrame.MouseButton1Click:Connect(function()
	if isExpanded then
		tweenMainFrameHeight(270)
		scrollFrame.Visible = false
	else
		scrollFrame.Visible = true
		tweenMainFrameHeight(500)
	end
	isExpanded = not isExpanded
end)

-- Start Button
local startBtn = Instance.new("TextButton", mainFrame)
startBtn.Size = UDim2.new(0.9, 0, 0, 40)
startBtn.Position = UDim2.new(0.05, 0, 1, -50)
startBtn.AnchorPoint = Vector2.new(0, 1)
startBtn.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
startBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
startBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
startBtn.TextSize = 20
startBtn.Text = "START THE OPERATION"

-- Drag functionality for mainFrame with title bar
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
AddDraggingFunctionality(title, mainFrame)
AddDraggingFunctionality(thanksFrame, mainFrame)

-- Notification utility
local function notify(titleText, text, duration)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = titleText,
			Text = text,
			Duration = duration or 5
		})
	end)
end




-- On Start button click:
startBtn.MouseButton1Click:Connect(function()
	if not targetPlayer then
		--notify("Error", "Select a target player first.", 5)
		return
	end

	local inputId = inputBox.Text
	if not inputId or inputId == "" then
		--notify("Error", "Enter a valid audio ID.", 5)
		return
	end
	if not inputId:match("^rbxassetid://") then
		soundId = "rbxassetid://" .. inputId
	else
		soundId = inputId
	end

	--notify("Started", "Operation started for player: " .. targetPlayer.Name, 5)
end)

-- Your exact humanoid death sound logic, unchanged except using variable soundId:
local function connectHumanoidDeath(humanoid)
	if humanoid and humanoid:IsA("Humanoid") then
		local connection
		connection = humanoid.Died:Connect(function()
			connection:Disconnect()

			local character = humanoid.Parent
			local name = character and character.Name or "Unknown"

			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and character and character:FindFirstChild("HumanoidRootPart") then
				local dist = (targetPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
				if dist <= 40 then
					--notify("Humanoid Died Near Target", name .. " died within " .. math.floor(dist) .. " studs.", 5)

					if not character.HumanoidRootPart:FindFirstChild("DeathSpoofed") then
						local sound = Instance.new("Sound")
						sound.Name = "DeathSpoofed"
						sound.SoundId = soundId
						sound.Looped = false
						sound.PlaybackRegionsEnabled = false
						sound.PlaybackSpeed = 1
						sound.TimePosition = 0
						sound.Volume = 2
						sound.RollOffMaxDistance = 300
						sound.RollOffMinDistance = 10
						sound.RollOffMode = Enum.RollOffMode.Linear
						sound.LoopRegion = NumberRange.new(0, 60000)
						sound.PlaybackRegion = NumberRange.new(0, 60000)

						sound.Parent = character.HumanoidRootPart
						sound:Play()
					end
				end
			end
		end)
	end
end

-- Connect existing humanoids
for _, descendant in ipairs(Workspace:GetDescendants()) do
	if descendant:IsA("Humanoid") then
		connectHumanoidDeath(descendant)
	end
end

-- Connect new humanoids as they spawn
Workspace.DescendantAdded:Connect(function(descendant)
	if descendant:IsA("Humanoid") then
		connectHumanoidDeath(descendant)
	end
end)


local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://8388724806"
clickSound.Volume = 1
clickSound.Parent = workspace-- or workspace

-- Connect click event
startBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
end)
selectedFrame.MouseButton1Click:Connect(function()
	clickSound:Play()
end)

local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local ReverendInsanityUI = playerGui:WaitForChild("ReverendInsanityUI")

mainPageBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
    ReverendInsanityUI.Enabled = true
    screenGui.Enabled = false
end)

