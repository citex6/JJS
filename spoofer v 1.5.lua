-- local Players = game:GetService("Players")
-- local player = Players.LocalPlayer
-- local playerGui = player:WaitForChild("PlayerGui")

-- local screenGui = Instance.new("ScreenGui")
-- screenGui.Name = "CenteredImageGui"
-- screenGui.Parent = playerGui
-- screenGui.DisplayOrder = 100  -- any number above 0; default is 0

-- local img = Instance.new("ImageLabel")
-- img.Parent = screenGui
-- img.BackgroundTransparency = 1
-- img.Image = "rbxassetid://85579381294022"

-- img.Size = UDim2.new(0, 900, 0, 900)
-- img.AnchorPoint = Vector2.new(0.5, 0.5)       -- Center the anchor
-- img.Position = UDim2.new(0.5, 0, 0.5, 0)      -- Center position on screen
-- img.BackgroundTransparency = 1

-- local TweenService = game:GetService("TweenService")

-- -- Wait 5 seconds, then fade out image
-- task.delay(5, function()
--     local fadeOutTween = TweenService:Create(img, TweenInfo.new(1.5), {ImageTransparency = 1})
--     fadeOutTween:Play()
--     fadeOutTween.Completed:Connect(function()
--         img:Destroy() -- remove image after fade out
--     end)
-- end)
-- -- first the image appears for 5 seconds then fades out revealing the rest of the ui





local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- GUI container
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ReverendInsanitySpooferUI"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false


-- Main Frame (collapsed by default)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 400, 0, 350)
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

-- Target Input Box
local inputBox = Instance.new("TextBox", mainFrame)
inputBox.Size = UDim2.new(0.9, 0, 0, 40)
inputBox.Position = UDim2.new(0.05, 0, 0, 60)
inputBox.PlaceholderText = "TARGET USER ID TO FRAME HERE"
inputBox.BackgroundColor3 = Color3.fromRGB(30, 50, 70)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
inputBox.Text = ""
inputBox.TextSize = 18
-- Target Input Box
local killSpoofBox = Instance.new("TextBox", mainFrame)
killSpoofBox.Size = UDim2.new(0.9, 0, 0, 40)
killSpoofBox.Position = UDim2.new(0.05, 0, 0, 110)
killSpoofBox.PlaceholderText = "remove 100 kills from their actual kills"
killSpoofBox.BackgroundColor3 = Color3.fromRGB(30, 50, 70)
killSpoofBox.TextColor3 = Color3.fromRGB(255, 255, 255)
killSpoofBox.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
killSpoofBox.Text = ""
killSpoofBox.TextSize = 18

-- Selected Player Preview Frame
local selectedFrame = Instance.new("TextButton", mainFrame)
selectedFrame.Size = UDim2.new(0.9, 0, 0, 60)
selectedFrame.Position = UDim2.new(0.05, 0, 0, 170)
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
selectedDisplay.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
selectedDisplay.TextSize = 18
selectedDisplay.TextXAlignment = Enum.TextXAlignment.Left
selectedDisplay.Text = "DisplayName Of User in the server to spoof"

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
scrollFrame.Position = UDim2.new(0.05, 0, 0, 230)
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

			isExpanded = false
			tweenMainFrameHeight(350)
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
		tweenMainFrameHeight(350)
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



local function startFrame()

	local Players = game:GetService("Players")
local UserService = game:GetService("UserService")
local CoreGui = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer
local TARGET_PLAYER_IN_SERVER = tostring(selectedDisplay.Text)
local TARGET_ID_TO_FRAME = tonumber(inputBox.Text) 


local success, TARGET_ID_TO_FRAME_RES = pcall(function()
	return UserService:GetUserInfosByUserIdsAsync({ TARGET_ID_TO_FRAME })
end)

-- Function to get actual Player object from partial name
local function GetPlayer(Name)
	Name = Name:lower()
	for _, plr in ipairs(Players:GetPlayers()) do
			if plr.Name:lower():match("^" .. Name) or plr.DisplayName:lower():match("^" .. Name) then
				return plr
			end
	end
end
local targetPlr = GetPlayer(TARGET_PLAYER_IN_SERVER)
if not targetPlr then
	warn("Target player not found")
	return
end

local targetUserId = targetPlr.UserId

local container = CoreGui
	.PlayerList.Children.OffsetFrame.PlayerScrollList
	.SizeOffsetFrame.ScrollingFrameContainer
	.ScrollingFrameClippingFrame.ScollingFrame
	.OffsetUndoFrame

for _, frame in ipairs(container:GetChildren()) do
	if frame:IsA("Frame") and frame.Name:match("^p_%d+$") then
		local userIdStr = frame.Name:match("^p_(%d+)")
		local userId = tonumber(userIdStr)
		if userId then
			local success, result = pcall(function()
				return UserService:GetUserInfosByUserIdsAsync({ userId })
			end)

			if success and result and result[1] then
				local displayName = result[1].DisplayName
				if displayName == targetPlr.DisplayName  then
					print("Found user:", displayName)

					local nameLabel = frame.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName

					if nameLabel then
						nameLabel.Text = TARGET_ID_TO_FRAME_RES[1].DisplayName
					end
				end
			end
		end
	end
end




for _, frame in ipairs(container:GetChildren()) do
	if frame:IsA("Frame") and frame.Name:match("^p_%d+$") then
		local userIdStr = frame.Name:match("^p_(%d+)")
		local userId = tonumber(userIdStr)

		if userId == targetUserId then
			local newName = "p_" .. tostring(TARGET_ID_TO_FRAME)
			print("Found target frame for", targetPlr.Name, "- renaming to:", newName)
			frame.Name = newName
			break
		end
	end
end



local TARGET_PLAYER_IN_SERVER = TARGET_ID_TO_FRAME_RES[1].DisplayName -- replace with the real target name





local Players = game:GetService("Players")
local UserService = game:GetService("UserService")

local container = game:GetService("CoreGui")
    .PlayerList.Children.OffsetFrame.PlayerScrollList
    .SizeOffsetFrame.ScrollingFrameContainer
    .ScrollingFrameClippingFrame.ScollingFrame
    .OffsetUndoFrame

local dropdownHeader = game:GetService("CoreGui")
    .PlayerList.Children.OffsetFrame.PlayerScrollList
    .SizeOffsetFrame.ScrollingFrameContainer
    .PlayerDropDown.InnerFrame.PlayerHeader

local avatarImage = dropdownHeader:FindFirstChild("AvatarImage")
local displayNameLabel = dropdownHeader.Background.TextContainerFrame:FindFirstChild("DisplayName")
local playerNameLabel = dropdownHeader.Background.TextContainerFrame:FindFirstChild("PlayerName")

local userCache = {}

for _, frameX in ipairs(container:GetChildren()) do
    if frameX:IsA("Frame") and frameX.Name:match("^p_%d+$") and frameX.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text == TARGET_PLAYER_IN_SERVER then
        for _, buttonY in ipairs(frameX:GetDescendants()) do
            if buttonY:IsA("TextButton")  then
                buttonY.MouseButton1Click:Connect(function()
                    local userIdStr = frameX.Name:match("^p_(%d+)")
                    local userId = tonumber(userIdStr)

                    if userId and not userCache[userId] then
                        local success, result = pcall(function()
                            return UserService:GetUserInfosByUserIdsAsync({ userId })
                        end)

                        if success and result and result[1] then
                            local userInfo = result[1]
                            local username = "@"..userInfo.Username
                            local displayName = userInfo.DisplayName
                            local thumbUrl = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150"

                            userCache[userId] = {
                                Username = username,
                                DisplayName = displayName,
                                ThumbUrl = thumbUrl
                            }
                        else
                            warn("Failed to fetch user info for UserId:", userId)
                            return
                        end
                    end

                    local user = userCache[userId]
                    if user then
                        if avatarImage then
                            avatarImage.Image = user.ThumbUrl
                        end
                        if displayNameLabel then
                            displayNameLabel.Text = user.DisplayName
                        end
                        if playerNameLabel then
                            playerNameLabel.Text = user.Username
                        end

                        print("Updated dropdown with:", user.Username, user.DisplayName, user.ThumbUrl)
                    end
                end)
            end
        end
    end
end


function Morph(userId)
    local morphAssets = game.Players:GetCharacterAppearanceAsync(userId)
    local player = game.Players.LocalPlayer
    local character = targetPlr.Character
    for _, element in pairs(character:GetChildren()) do
        if element:IsA("Accessory") or element:IsA("Shirt") or element:IsA("Pants") or element:IsA("CharacterMesh") or element:IsA("BodyColors") or element:IsA("ShirtGraphic") then
            element:Destroy()
        end
    end
    for _, mesh in pairs(character.Head:GetChildren()) do
        if mesh:IsA("SpecialMesh") and mesh:GetAttribute("FromMorph") == true then
            mesh:Destroy()
        end
    end
    local existingFace = character.Head:FindFirstChild("face")
    if existingFace then
        existingFace:Destroy()
    end
    for _, asset in pairs(morphAssets:GetChildren()) do
        if asset:IsA("Shirt") or asset:IsA("Pants") or asset:IsA("BodyColors") or asset:IsA("ShirtGraphic") then
            asset.Parent = character
        elseif asset:IsA("Accessory") then
            asset.Name = "#ACCESSORY_" .. asset.Name
            asset.Parent = character
            print("Accessory Applied:", asset.Name)
        elseif asset:IsA("SpecialMesh") then
            asset:SetAttribute("FromMorph", true)
            asset.Parent = character.Head
        elseif asset.Name == "R6" and character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            local mesh = asset:FindFirstChildOfClass("CharacterMesh")
            if mesh then
                mesh.Parent = character
            end
        elseif asset.Name == "R15" and character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
            local mesh = asset:FindFirstChildOfClass("CharacterMesh")
            if mesh then
                mesh.Parent = character
            end
        end
    end
    local morphFace = morphAssets:FindFirstChild("face")
    if morphFace then
        morphFace.Parent = character.Head
    else
        local defaultFace = Instance.new("Decal")
        defaultFace.Name = "face"
        defaultFace.Face = Enum.NormalId.Front
        defaultFace.Texture = "rbxasset://textures/face.png"
        defaultFace.Transparency = 0
        defaultFace.Parent = character.Head
    end
    local originalParent = character.Parent
    character.Parent = nil
    character.Parent = originalParent
end

Morph(TARGET_ID_TO_FRAME)

targetPlr.Character.Humanoid.DisplayName = TARGET_ID_TO_FRAME_RES[1].DisplayName





-- settings animation on so there are some frames to spoof fast





local Players = game:GetService("Players")
local UserService = game:GetService("UserService")
local CoreGui = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer


local success, TARGET_ID_TO_FRAME_RES = pcall(function()
	return UserService:GetUserInfosByUserIdsAsync({ TARGET_ID_TO_FRAME })
end)



local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local username = localPlayer and localPlayer.Name or ""

local PlayersFrame = game:GetService("CoreGui")
    .RobloxGui
    .SettingsClippingShield
    .SettingsShield
    .MenuContainer
    .PageViewClipper
    .PageView
    .PageViewInnerFrame
    .Players

for _, child in ipairs(PlayersFrame:GetChildren()) do
    if child.Name:find("^PlayerLabel") then
		if child.DisplayNameLabel.Text == targetPlr.DisplayName then
			print("found")

			child.DisplayNameLabel.Text = TARGET_ID_TO_FRAME_RES[1].DisplayName
			child.NameLabel.Text = "@" .. TARGET_ID_TO_FRAME_RES[1].Username
			-- child.Icon.Image = "rbxthumb://type=Avatar&id=" .. TARGET_ID_TO_FRAME .. "&w=100&h=100"

            local icon = child:FindFirstChild("Icon") or child:FindFirstChild("BayHarbour")
            if icon then
                icon.Image = "rbxthumb://type=Avatar&id=" .. TARGET_ID_TO_FRAME .. "&w=100&h=100"
            end
		end
	end
end


local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local username = localPlayer and localPlayer.Name or ""

local PlayersFrame = CoreGui.RobloxGui
    .SettingsClippingShield.SettingsShield.MenuContainer
    .PageViewClipper.PageView.PageViewInnerFrame.Players

local playerLabels = {}

-- Step 1: Collect PlayerLabels info (except local player)
for _, child in ipairs(PlayersFrame:GetChildren()) do
    if child.Name:find("^PlayerLabel") and not child.Name:find(username) then
        local icon = child:FindFirstChild("Icon")
        local displayNameLabel = child:FindFirstChild("DisplayNameLabel")
        local nameLabel = child:FindFirstChild("NameLabel")

        if icon and displayNameLabel and nameLabel then
            table.insert(playerLabels, {
                frame = child,
                layoutOrder = child.LayoutOrder, -- original layoutOrder
                iconImage = icon.Image,
                displayText = displayNameLabel.Text,
                nameText = nameLabel.Text,
                iconRef = icon,
                displayNameRef = displayNameLabel,
                nameLabelRef = nameLabel,
            })
        end
    end
end

-- Step 2: Sort playerLabels alphabetically by nameText
table.sort(playerLabels, function(a, b)
    return a.nameText:lower() < b.nameText:lower()
end)

-- Step 3: For each alphabetical index i, find the PlayerLabel with (layoutOrder - 2) == i
for i, sortedEntry in ipairs(playerLabels) do
    for _, pl in ipairs(playerLabels) do
        if (pl.layoutOrder - 2) == i then
            -- Replace pl's icon, displayName, and nameLabel with sortedEntry's info
            pl.iconRef.Image = sortedEntry.iconImage
            pl.displayNameRef.Text = sortedEntry.displayText
            pl.nameLabelRef.Text = sortedEntry.nameText
            break
        end
    end
end



end



local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local PlayersService = game:GetService("Players")

local function getPlayersFrame()
    local success, result = pcall(function()
        return CoreGui
            :FindFirstChild("RobloxGui")
            :FindFirstChild("SettingsClippingShield")
            :FindFirstChild("SettingsShield")
            :FindFirstChild("MenuContainer")
            :FindFirstChild("PageViewClipper")
            :FindFirstChild("PageView")
            :FindFirstChild("PageViewInnerFrame")
            :FindFirstChild("Players")
    end)
    return success and result or nil
end

-- Wait until the full Players path exists
local PlayersFrame = nil
repeat
    RunService.RenderStepped:Wait()
    PlayersFrame = getPlayersFrame()
until PlayersFrame

print("✅ Players frame found. Running script...")

local username = game:GetService("Players").LocalPlayer.Name

local playerLabel = game:GetService("CoreGui").RobloxGui
    .SettingsClippingShield.SettingsShield.MenuContainer
    .PageViewClipper.PageView.PageViewInnerFrame.Players:FindFirstChild("PlayerLabel" .. username)

if playerLabel then
    local icon = playerLabel:FindFirstChild("Icon")
    if icon then
        icon.Name = "BayHarbour"
        print("Icon name set to BayHarbour")
    else
        warn("Icon not found in your PlayerLabel")
    end
else
    warn("Your PlayerLabel was not found")
end



local function spoofKillList()
    local username = selectedUsername.Text:gsub("^@", "")

    local targetPlayer = game:GetService("Players"):FindFirstChild(username)
    if not targetPlayer then
        warn("Player not found:", username)
        return
    end

    local leaderstats = targetPlayer:FindFirstChild("leaderstats")
    if not leaderstats then
        warn("No leaderstats found for player:", username)
        return
    end

    local kills = leaderstats:FindFirstChild("Kills")


    local spoofedValue = tonumber(killSpoofBox.Text)
    if spoofedValue then
        kills.Value = spoofedValue
    else
        warn("Invalid number in killSpoofBox.Text")
    end
end




startBtn.MouseButton1Click:Connect(function()
	print("Target:", selectedDisplay.Text)
	print("userid:", inputBox.Text)
	startFrame()
    spoofKillList()

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


