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
screenGui.Name = "ReverendInsanityBillboardUI"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false

-- Main Frame (collapsed by default)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 400, 0, 320)
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

-- Audio ID input (ignored for now but preserved)

-- Decal ID input
local decalBox = Instance.new("TextBox", mainFrame)
decalBox.Size = UDim2.new(0.9, 0, 0, 40)
decalBox.Position = UDim2.new(0.05, 0, 0, 60)
decalBox.PlaceholderText = "DECAL ID (e.g. 12345678)"
decalBox.BackgroundColor3 = Color3.fromRGB(30, 50, 70)
decalBox.TextColor3 = Color3.fromRGB(255, 255, 255)
decalBox.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
decalBox.Text = ""
decalBox.TextSize = 18

-- Text Label input
local textBox = Instance.new("TextBox", mainFrame)
textBox.Size = UDim2.new(0.9, 0, 0, 40)
textBox.Position = UDim2.new(0.05, 0, 0, 110)
textBox.PlaceholderText = "TEXT TO SHOW ON SCREEN"
textBox.BackgroundColor3 = Color3.fromRGB(30, 50, 70)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
textBox.Text = ""
textBox.TextSize = 18

-- Selected Screen Preview
local selectedFrame = Instance.new("TextButton", mainFrame)
selectedFrame.Size = UDim2.new(0.9, 0, 0, 60)
selectedFrame.Position = UDim2.new(0.05, 0, 0, 170)
selectedFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
selectedFrame.AutoButtonColor = true
selectedFrame.Text = ""

local selectedAvatar = Instance.new("ImageLabel", selectedFrame)
selectedAvatar.Size = UDim2.new(0, 50, 0, 50)
selectedAvatar.Position = UDim2.new(0, 5, 0.5, -25)
selectedAvatar.BackgroundTransparency = 1
selectedAvatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

local infoContainer = Instance.new("Frame", selectedFrame)
infoContainer.Size = UDim2.new(1, -65, 1, -10)
infoContainer.Position = UDim2.new(0, 60, 0, 5)
infoContainer.BackgroundTransparency = 1

local selectedDisplay = Instance.new("TextLabel", infoContainer)
selectedDisplay.Size = UDim2.new(1, 0, 0.5, 0)
selectedDisplay.Position = UDim2.new(0, 0, 0, 0)
selectedDisplay.BackgroundTransparency = 1
selectedDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
selectedDisplay.Font = Enum.Font.SourceSans
selectedDisplay.TextSize = 18
selectedDisplay.TextXAlignment = Enum.TextXAlignment.Left
selectedDisplay.Text = "Screen"

local selectedUsername = Instance.new("TextLabel", infoContainer)
selectedUsername.Size = UDim2.new(1, 0, 0.5, 0)
selectedUsername.Position = UDim2.new(0, 0, 0.5, 0)
selectedUsername.BackgroundTransparency = 1
selectedUsername.TextColor3 = Color3.fromRGB(180, 180, 180)
selectedUsername.Font = Enum.Font.SourceSans
selectedUsername.TextSize = 16
selectedUsername.TextXAlignment = Enum.TextXAlignment.Left
selectedUsername.Text = "@RealAd"

-- Scroll list for screens
local scrollFrame = Instance.new("ScrollingFrame", mainFrame)
scrollFrame.Size = UDim2.new(0.9, 0, 0, 180)
scrollFrame.Position = UDim2.new(0.05, 0, 0, 250)
scrollFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.Visible = false

-- Tween for opening/closing
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


local adsFolder = Workspace.Map.Destructible.Model.Ads
local realAds = {}

for _, child in ipairs(adsFolder:GetChildren()) do
	if child.Name == "RealAd" then
		table.insert(realAds, child)
	end
end

local adTargets = {}

-- Assign to Screen 1 and Screen 2 only if those realAds exist
if realAds[1] then
	adTargets["Screen 1"] = realAds[1]
end
if realAds[2] then
	adTargets["Screen 2"] = realAds[2]
end


local targetPlayer = nil
local function getDecalIdFromImage(image)
    -- Try to match rbxassetid://12345678
    local id = image:match("rbxassetid://(%d+)")
    if id then return id end

    -- Try to match https://www.roblox.com/asset/?id=12345678 or similar
    id = image:match("id=(%d+)")
    if id then return id end

    -- Fallback: return whole string if no ID found
    return image
end
local entryUI = {}  -- new table to hold entries by label

local function refreshPlayerList()
    -- Clear old entries
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    entryUI = {}

    local yPos = 0
    for label, realAd in pairs(adTargets) do
        local surfaceGui = realAd:FindFirstChildOfClass("SurfaceGui")
        if not surfaceGui then continue end
        
        local imageLabel = surfaceGui:FindFirstChildOfClass("ImageLabel")
        local textLabel = surfaceGui:FindFirstChildOfClass("TextLabel")

        local decalId = imageLabel and getDecalIdFromImage(imageLabel.Image) or "N/A"
        local displayName = textLabel and textLabel.Text or "N/A"
        local image = imageLabel and imageLabel.Image or "rbxasset://textures/ui/GuiImagePlaceholder.png"

        local entry = Instance.new("TextButton", scrollFrame)
        entry.Size = UDim2.new(1, -10, 0, 60)
        entry.Position = UDim2.new(0, 5, 0, yPos)
        entry.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
        entry.AutoButtonColor = true
        entry.Text = ""

        -- Add image display on left
        local imgDisplay = Instance.new("ImageLabel", entry)
        imgDisplay.Size = UDim2.new(0, 50, 0, 50)
        imgDisplay.Position = UDim2.new(0, 5, 0.5, -25)
        imgDisplay.BackgroundTransparency = 1
        imgDisplay.Image = image

        -- Add Text container frame
        local textContainer = Instance.new("Frame", entry)
        textContainer.Size = UDim2.new(1, -65, 1, 0)
        textContainer.Position = UDim2.new(0, 60, 0, 0)
        textContainer.BackgroundTransparency = 1

        -- Name label (from TextLabel)
        local nameLabel = Instance.new("TextLabel", textContainer)
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.Font = Enum.Font.SourceSansBold
        nameLabel.TextSize = 18
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Text = displayName

        -- Decal ID label
        local decalLabel = Instance.new("TextLabel", textContainer)
        decalLabel.Size = UDim2.new(1, 0, 0.5, 0)
        decalLabel.Position = UDim2.new(0, 0, 0.5, 0)
        decalLabel.BackgroundTransparency = 1
        decalLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        decalLabel.Font = Enum.Font.SourceSans
        decalLabel.TextSize = 16
        decalLabel.TextXAlignment = Enum.TextXAlignment.Left
        decalLabel.Text = "ID: " .. decalId

        entry.MouseButton1Click:Connect(function()

			local textLabel = surfaceGui:FindFirstChildOfClass("TextLabel")
			local imageLabel = surfaceGui:FindFirstChildOfClass("ImageLabel")

			local displayName = textLabel and textLabel.Text or "N/A"
       		local image = imageLabel and imageLabel.Image or "rbxasset://textures/ui/GuiImagePlaceholder.png"



            selectedDisplay.Text = label
            selectedUsername.Text = displayName
            selectedAvatar.Image = image
            targetPlayer = realAd

            isExpanded = false
            tweenMainFrameHeight(320)
            scrollFrame.Visible = false
        end)

        -- Save references to this entry's UI elements for later updates
        entryUI[label] = {
            Entry = entry,
            ImgDisplay = imgDisplay,
            NameLabel = nameLabel,
            DecalLabel = decalLabel
        }

        yPos += 65
    end

    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end


refreshPlayerList()

-- Expand/collapse
local isExpanded = false
selectedFrame.MouseButton1Click:Connect(function()
	if isExpanded then
		tweenMainFrameHeight(320)
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
startBtn.Position = UDim2.new(0.05, 0, 1, -20)
startBtn.AnchorPoint = Vector2.new(0, 1)
startBtn.BackgroundColor3 = Color3.fromRGB(100, 160, 255)
startBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
startBtn.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
startBtn.TextSize = 20
startBtn.Text = "START THE OPERATION"

startBtn.MouseButton1Click:Connect(function()
	if not targetPlayer then
		StarterGui:SetCore("SendNotification", {
			Title = "ERROR",
			Text = "No screen selected!",
			Duration = 3
		})
		return
	end

	local gui = targetPlayer:FindFirstChildOfClass("SurfaceGui")
	if not gui then return end

	local imageLabel = gui:FindFirstChildOfClass("ImageLabel")
	local textLabel = gui:FindFirstChildOfClass("TextLabel")

	if imageLabel and tonumber(decalBox.Text) then
		imageLabel.Image = "rbxassetid://" .. decalBox.Text
	end

	if textLabel then
		textLabel.Text = textBox.Text
	end

	-- Update the entry UI in the dropdown
	for label, realAd in pairs(adTargets) do
		if realAd == targetPlayer and entryUI[label] then
			local newImage = imageLabel.Image
			local newDecalId = getDecalIdFromImage(newImage)
			local newText = textLabel.Text

			entryUI[label].ImgDisplay.Image = newImage
			entryUI[label].NameLabel.Text = newText
			entryUI[label].DecalLabel.Text = "ID: " .. newDecalId
			break
		end
	end

	StarterGui:SetCore("SendNotification", {
		Title = "UPDATED",
		Text = "Ad screen updated.",
		Duration = 3
	})
end)


-- Drag functionality
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

