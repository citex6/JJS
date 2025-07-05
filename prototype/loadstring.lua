local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CenteredImageGui"
screenGui.Parent = playerGui
screenGui.DisplayOrder = 100  -- any number above 0; default is 0

local img = Instance.new("ImageLabel")
img.Parent = screenGui
img.BackgroundTransparency = 1
img.Image = "rbxassetid://85579381294022"

img.Size = UDim2.new(0, 900, 0, 900)
img.AnchorPoint = Vector2.new(0.5, 0.5)       -- Center the anchor
img.Position = UDim2.new(0.5, 0, 0.5, 0)      -- Center position on screen
img.BackgroundTransparency = 1

local TweenService = game:GetService("TweenService")

-- Wait 5 seconds, then fade out image
task.delay(5, function()
    local fadeOutTween = TweenService:Create(img, TweenInfo.new(1.5), {ImageTransparency = 1})
    fadeOutTween:Play()
    fadeOutTween.Completed:Connect(function()
        img:Destroy() -- remove image after fade out
    end)
end)
-- first the image appears for 5 seconds then fades out revealing the rest of the ui

task.wait(2)

-- avatar spoofer / escape menu spoofer / leaderStats spoofer
task.defer(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/citex6/JJS/refs/heads/main/spoofer%20v%201.5.lua'))()

end)

-- kill sound id method
task.defer(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/citex6/JJS/refs/heads/main/kill%20sound%20method.lua'))()

end)

-- decal Id method
task.defer(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/citex6/JJS/refs/heads/main/billboard%20method.lua'))()

end)

-- main page
task.defer(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/citex6/JJS/refs/heads/main/prototype/main%20page.lua'))()

end)



-- anonymous data to globally track script execution counts, unique users, no sensitive or personal identifiable information is getting collected, feel free to remove this section in your own fork or version

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local localPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
local username = localPlayer.Name
local gameId = tostring(game.GameId)
local placeId = game.PlaceId


local gameName = "Unknown Game"
local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(placeId)
end)
if success and info and info.Name then
    gameName = info.Name
end

local url = "https://spoof-stats.onrender.com/webhook"

local embed = {
    title = "Unused Webhook embed",
    color = 3447003,
    thumbnail = {
        url = "x"
    },
    fields = {
        {
            name = "Username",
            value = "0",
            inline = true
        },
        {
            name = "User ID",
            value = 0,
            inline = true
        },
        {
            name = "Game",
            value = gameName,
            inline = false
        },
        {
            name = "Game ID",
            value = gameId,
            inline = false
        }
    },
    footer = {
        text = "Website Stat API"
    },
    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

local payload = {
    embeds = { embed }
}

local headers = {
    ["Content-Type"] = "application/json"
}

local body = HttpService:JSONEncode(payload)

local sendSuccess, response = pcall(function()
    return http_request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end)

if sendSuccess then
    print("Script has fully loaded")
else
    warn("Notify Jack of Error 20", response)
end
