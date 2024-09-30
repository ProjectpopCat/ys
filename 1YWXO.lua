local ys_search_window = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("YS_Search_Window")
if ys_search_window then
    ys_search_window:Destroy()
end


local lib = {RainbowColorValue = 0, HueSelectionPosition = 0}
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ui = Instance.new("ScreenGui")
ui.Name = "YS_Search_Window"
ui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

coroutine.wrap(
    function()
        while wait() do
            lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
            lib.HueSelectionPosition = lib.HueSelectionPosition + 1

            if lib.RainbowColorValue >= 1 then
                lib.RainbowColorValue = 0
            end

            if lib.HueSelectionPosition == 80 then
                lib.HueSelectionPosition = 0
            end
        end
    end
)()

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = ui
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
Main.BorderColor3 = Color3.new(0.815686, 0.831373, 0.905882)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 292, 0, 319)

local DragFrame = Instance.new("Frame")
DragFrame.Name = "DragFrame"
DragFrame.Parent = Main
DragFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DragFrame.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
DragFrame.BorderSizePixel = 0
DragFrame.Position = UDim2.new(0.5, 0, 0.0521642976, 0)
DragFrame.Size = UDim2.new(0, 292, 0, 34)

local UICorner = Instance.new("UICorner")
UICorner.Parent = DragFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0171466991, 0, 0.0142997336, 0)
Title.Size = UDim2.new(0, 280, 0, 24)
Title.Font = Enum.Font.SourceSans
Title.Text = "ywxoscripts search lib"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 20

local function MakeDraggable(DragFrame, object)
    local Dragging = false
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local NewPosition = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        object.Position = NewPosition
    end

    DragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position

            UserInputService.InputChanged:Connect(function(movementInput)
                if Dragging and movementInput.UserInputType == Enum.UserInputType.MouseMovement then
                    Update(movementInput)
                end
            end)

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
end

MakeDraggable(Main, Main)

local GamesHolder = Instance.new("ScrollingFrame")
local UICorner_2 = Instance.new("UICorner")

GamesHolder.Name = "GamesHolder"
GamesHolder.Parent = Main
GamesHolder.Active = true
GamesHolder.BackgroundColor3 = Color3.new(1, 1, 1)
GamesHolder.BackgroundTransparency = 1
GamesHolder.BorderColor3 = Color3.new(1, 1, 1)
GamesHolder.BorderSizePixel = 0
GamesHolder.Position = UDim2.new(0.0167675279, 0, 0.106196769, 0)
GamesHolder.Size = UDim2.new(0, 280, 0, 246)
GamesHolder.ScrollBarThickness = 5
GamesHolder.CanvasSize = UDim2.new(0, 0, 0, 0)

UICorner_2.Parent = GamesHolder

local function UpdateTitle(newTitle)
    Title.Text = newTitle
end

local buttonSpacing = 0.1



local tabFolder = Instance.new("Folder")
tabFolder.Name = "TabFolder"
tabFolder.Parent = Main

local function newButton(buttonName)
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Parent = GamesHolder
    button.BackgroundColor3 = Color3.new(0.815686, 0.831373, 0.905882)
    button.BorderColor3 = Color3.new(0, 0, 0)
    button.BorderSizePixel = 0
    button.Size = UDim2.new(0, 261, 0, 37)
    button.Font = Enum.Font.SourceSans
    button.Text = buttonName
    button.TextColor3 = Color3.new(0, 0, 0)
    button.TextSize = 18

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = button

    local buttonCount = #GamesHolder:GetChildren() - 1
    button.Position = UDim2.new(0, 0, 0, buttonCount * (button.Size.Y.Offset + (buttonSpacing * 37)))
    GamesHolder.CanvasSize = UDim2.new(0, 0, 0, (buttonCount + 1) * (button.Size.Y.Offset + (buttonSpacing * 37)))

    local tabFrame = Instance.new("Frame")
    tabFrame.Name = buttonName
    tabFrame.Parent = tabFolder
    tabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    tabFrame.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
    tabFrame.BorderSizePixel = 0
    tabFrame.Position = UDim2.new(1.35202575, 0, 0.5, 0)
    tabFrame.Size = UDim2.new(0, 187, 0, 319)
    tabFrame.Visible = false

    local UICorner_7 = Instance.new("UICorner")
    UICorner_7.Parent = tabFrame

    local RandomImageBackground = Instance.new("Frame")
    RandomImageBackground.Name = "RandomImageBackground"
    RandomImageBackground.Parent = tabFrame
    RandomImageBackground.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
    RandomImageBackground.BorderColor3 = Color3.new(0, 0, 0)
    RandomImageBackground.BorderSizePixel = 0
    RandomImageBackground.Position = UDim2.new(0.192513362, 0, 0.068965517, 0)
    RandomImageBackground.Size = UDim2.new(0, 113, 0, 113)

    local RandomImage = Instance.new("ImageLabel")
    RandomImage.Name = "RandomImage"
    RandomImage.Parent = RandomImageBackground
    RandomImage.BackgroundColor3 = Color3.new(1, 1, 1)
    RandomImage.BorderColor3 = Color3.new(0, 0, 0)
    RandomImage.BorderSizePixel = 0
    RandomImage.Position = UDim2.new(0.0529552884, 0, 0.0555109344, 0)
    RandomImage.Size = UDim2.new(0, 100, 0, 100)
    RandomImage.BackgroundTransparency = 1 
    RandomImage.Image = "rbxthumb://type=Asset&id=IDHIEREDITIEREN&w=150&h=150"

    local UICorner_8 = Instance.new("UICorner")
    UICorner_8.Parent = RandomImage

    local UICorner_9 = Instance.new("UICorner")
    UICorner_9.Parent = RandomImageBackground

    local LoadBackground = Instance.new("Frame")
    LoadBackground.Name = "LoadBackground"
    LoadBackground.Parent = tabFrame
    LoadBackground.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
    LoadBackground.BorderColor3 = Color3.new(0, 0, 0)
    LoadBackground.BorderSizePixel = 0
    LoadBackground.Position = UDim2.new(0.133689836, 0, 0.702194333, 0)
    LoadBackground.Size = UDim2.new(0, 136, 0, 38)

    local LoadButton = Instance.new("TextButton")
    LoadButton.Name = "LoadButton"
    LoadButton.Parent = LoadBackground
    LoadButton.BackgroundColor3 = Color3.new(0.815686, 0.831373, 0.905882)
    LoadButton.BorderColor3 = Color3.new(0, 0, 0)
    LoadButton.BorderSizePixel = 0
    LoadButton.Position = UDim2.new(0.0354277678, 0, 0.0718761608, 0)
    LoadButton.Size = UDim2.new(0, 127, 0, 34)
    LoadButton.Font = Enum.Font.SourceSans
    LoadButton.Text = "Load Script"
    LoadButton.TextColor3 = Color3.new(0, 0, 0)
    LoadButton.TextSize = 18

    local UICorner_10 = Instance.new("UICorner")
    UICorner_10.Parent = LoadButton

    local UICorner_11 = Instance.new("UICorner")
    UICorner_11.Parent = LoadBackground

    local CancelBackground = Instance.new("Frame")
    CancelBackground.Name = "CancelBackground"
    CancelBackground.Parent = tabFrame
    CancelBackground.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
    CancelBackground.BorderColor3 = Color3.new(0, 0, 0)
    CancelBackground.BorderSizePixel = 0
    CancelBackground.Position = UDim2.new(0.133689836, 0, 0.840125382, 0)
    CancelBackground.Size = UDim2.new(0, 136, 0, 38)

    local CancelButton = Instance.new("TextButton")
    CancelButton.Name = "CancelButton"
    CancelButton.Parent = CancelBackground
    CancelButton.BackgroundColor3 = Color3.new(0.537255, 0.545098, 0.596078)
    CancelButton.BorderColor3 = Color3.new(0, 0, 0)
    CancelButton.BorderSizePixel = 0
    CancelButton.Position = UDim2.new(0.0354277678, 0, 0.0718761608, 0)
    CancelButton.Size = UDim2.new(0, 127, 0, 34)
    CancelButton.Font = Enum.Font.SourceSans
    CancelButton.Text = "Close Window"
    CancelButton.TextColor3 = Color3.new(0, 0, 0)
    CancelButton.TextSize = 18

    local UICorner_12 = Instance.new("UICorner")
    UICorner_12.Parent = CancelButton

    local UICorner_13 = Instance.new("UICorner")
    UICorner_13.Parent = CancelBackground

    local GameTitle = Instance.new("TextLabel")
    GameTitle.Name = "GameTitle"
    GameTitle.Parent = tabFrame
    GameTitle.BackgroundColor3 = Color3.new(1, 1, 1)
    GameTitle.BackgroundTransparency = 1
    GameTitle.BorderColor3 = Color3.new(0, 0, 0)
    GameTitle.BorderSizePixel = 0
    GameTitle.Position = UDim2.new(0.0320855603, 0, 0.432601869, 0)
    GameTitle.Size = UDim2.new(0, 174, 0, 28)
    GameTitle.Font = Enum.Font.SourceSansItalic
    GameTitle.Text = "Game Title"
    GameTitle.TextColor3 = Color3.new(1, 1, 1)
    GameTitle.TextSize = 16

    local GameId = Instance.new("TextLabel")
    GameId.Name = "GameId"
    GameId.Parent = tabFrame
    GameId.BackgroundColor3 = Color3.new(1, 1, 1)
    GameId.BackgroundTransparency = 1
    GameId.BorderColor3 = Color3.new(0, 0, 0)
    GameId.BorderSizePixel = 0
    GameId.Position = UDim2.new(0.0320855603, 0, 0.489028215, 0)
    GameId.Size = UDim2.new(0, 174, 0, 28)
    GameId.Font = Enum.Font.SourceSansItalic
    GameId.Text = "Game ID"
    GameId.TextColor3 = Color3.new(1, 1, 1)
    GameId.TextSize = 14

    local LatestUpdate = Instance.new("TextLabel")
    LatestUpdate.Name = "LatestUpdate"
    LatestUpdate.Parent = tabFrame
    LatestUpdate.BackgroundColor3 = Color3.new(1, 1, 1)
    LatestUpdate.BackgroundTransparency = 1
    LatestUpdate.BorderColor3 = Color3.new(0, 0, 0)
    LatestUpdate.BorderSizePixel = 0
    LatestUpdate.Position = UDim2.new(0.0213903747, 0, 0.576802492, 0)
    LatestUpdate.Size = UDim2.new(0, 174, 0, 28)
    LatestUpdate.Font = Enum.Font.SourceSansItalic
    LatestUpdate.Text = "Update : Date"
    LatestUpdate.TextColor3 = Color3.new(1, 1, 1)
    LatestUpdate.TextSize = 16

    local function setRandomImage(id)
        RandomImage.Image = "rbxthumb://type=Asset&id=" .. id .. "&w=150&h=150"
    end

    button.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabFolder:GetChildren()) do
            if tab:IsA("Frame") then
                tab.Visible = false
            end
        end

        tabFrame.Visible = true
    end)

    CancelButton.MouseButton1Click:Connect(function()
        tabFrame.Visible = false
    end)

    return {
        GameTitle = function(title) GameTitle.Text = title end,
        GameId = function(id) GameId.Text = id end,
        LatestUpdate = function(update) LatestUpdate.Text = "Update : " .. update end,
        LoadButton = function(callback) LoadButton.MouseButton1Click:Connect(callback) end,
        CancelButton = function(callback)
            CancelButton.MouseButton1Click:Connect(function()
                callback()
                tabFrame.Visible = false
            end)
        end,
        RandomImage = setRandomImage
    }
end

local function positionButtons()
    local yOffset = 0
    local buttonSpacing = 0.1

    for _, button in pairs(GamesHolder:GetChildren()) do
        if button:IsA("TextButton") then
            button.Position = UDim2.new(0, 0, 0, yOffset)
            yOffset = yOffset + button.Size.Y.Offset + (buttonSpacing * 37)
        end
    end

    GamesHolder.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

local SearchBox = Instance.new("Frame")
local SearchBar = Instance.new("TextBox")
local UICorner_6 = Instance.new("UICorner")
SearchBox.Name = "SearchBox"
SearchBox.Parent = Main
SearchBox.AnchorPoint = Vector2.new(0.5, 0.5)
SearchBox.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
SearchBox.BorderSizePixel = 0
SearchBox.Position = UDim2.new(0.5, 0, -0.101189211, 0)
SearchBox.Size = UDim2.new(0, 292, 0, 49)
SearchBar.Name = "SearchBar"
SearchBar.Parent = SearchBox
SearchBar.BackgroundColor3 = Color3.new(1, 1, 1)
SearchBar.BackgroundTransparency = 1
SearchBar.BorderColor3 = Color3.new(0, 0, 0)
SearchBar.BorderSizePixel = 0
SearchBar.Position = UDim2.new(0.0205479451, 0, 0.122448981, 0)
SearchBar.Size = UDim2.new(0, 280, 0, 37)
SearchBar.Font = Enum.Font.SourceSans
SearchBar.PlaceholderText = "Search here..."
SearchBar.Text = ""
SearchBar.TextColor3 = Color3.new(255, 255, 255)
SearchBar.TextSize = 14
UICorner_6.Parent = SearchBox
local function filterButtons(searchText)
    local yOffset = 0
    local buttonSpacing = 0.1

    for _, button in pairs(GamesHolder:GetChildren()) do
        if button:IsA("TextButton") then
            if searchText == "" or string.find(string.lower(button.Text), string.lower(searchText)) then
                button.Visible = true
                button.Position = UDim2.new(0, 0, 0, yOffset)
                yOffset = yOffset + button.Size.Y.Offset + (buttonSpacing * 37)
            else
                button.Visible = false
            end
        end
    end

    GamesHolder.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local searchText = SearchBar.Text
    filterButtons(searchText)
end)
local function showAllButtons()
    local yOffset = 0
    local buttonSpacing = 0.1

    for _, button in pairs(GamesHolder:GetChildren()) do
        if button:IsA("TextButton") then
            button.Visible = true
            button.Position = UDim2.new(0, 0, 0, yOffset)
            yOffset = yOffset + button.Size.Y.Offset + (buttonSpacing * 37)
        end
    end

    GamesHolder.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end
for _, button in pairs(GamesHolder:GetChildren()) do
    if button:IsA("TextButton") then
        button.MouseButton1Click:Connect(function()
            SearchBar.Text = ""
            showAllButtons()
        end)
    end
end



local BottomFrame = Instance.new("Frame")
local UICorner_15 = Instance.new("UICorner")
local OpenCreatorInfo = Instance.new("ImageButton")
local UICorner_16 = Instance.new("UICorner")

BottomFrame.Name = "BottomFrame"
BottomFrame.Parent = Main
BottomFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BottomFrame.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BottomFrame.BorderSizePixel = 0
BottomFrame.Position = UDim2.new(0.5, 0, 0.945581138, 0)
BottomFrame.Size = UDim2.new(0, 292, 0, 34)
UICorner_15.Parent = BottomFrame

OpenCreatorInfo.Name = "OpenCreatorInfo"
OpenCreatorInfo.Parent = BottomFrame
OpenCreatorInfo.BackgroundColor3 = Color3.new(1, 1, 1)
OpenCreatorInfo.BackgroundTransparency = 1
OpenCreatorInfo.BorderColor3 = Color3.new(0, 0, 0)
OpenCreatorInfo.BorderSizePixel = 0
OpenCreatorInfo.Size = UDim2.new(0, 34, 0, 34)
OpenCreatorInfo.Image = "rbxthumb://type=Asset&id=7546954315&w=150&h=150"
UICorner_16.Parent = OpenCreatorInfo




local CloseUi = Instance.new("ImageButton")
local UICorner_19 = Instance.new("UICorner")

CloseUi.Name = "CloseUi"
CloseUi.Parent = BottomFrame
CloseUi.BackgroundColor3 = Color3.new(1, 1, 1)
CloseUi.BackgroundTransparency = 1
CloseUi.BorderColor3 = Color3.new(0, 0, 0)
CloseUi.BorderSizePixel = 0
CloseUi.Position = UDim2.new(1, -34, 0, 0)
CloseUi.Size = UDim2.new(0, 34, 0, 34)
CloseUi.Image = "rbxthumb://type=Asset&id=10002373496&w=150&h=150"
UICorner_19.Parent = CloseUi

CloseUi.MouseButton1Click:Connect(function()
    local ys_search_window = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("YS_Search_Window")
    if ys_search_window then
        ys_search_window:Destroy()
    end
end)


local CreatorFrame = Instance.new("Frame")
local Cimage = Instance.new("ImageLabel")
local UICorner_17 = Instance.new("UICorner")
local UICorner_18 = Instance.new("UICorner")
local Cline1 = Instance.new("TextLabel")
local Cline2 = Instance.new("TextLabel")
local OpenCredits = Instance.new("TextLabel")

CreatorFrame.Name = "CreatorFrame"
CreatorFrame.Parent = BottomFrame
CreatorFrame.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
CreatorFrame.BorderColor3 = Color3.new(0, 0, 0)
CreatorFrame.BorderSizePixel = 0
CreatorFrame.Position = UDim2.new(0, 0, 1.28177238, 0)
CreatorFrame.Size = UDim2.new(0, 292, 0, 48)
CreatorFrame.Visible = false  -- Initially hidden

Cimage.Name = "Cimage"
Cimage.Parent = CreatorFrame
Cimage.BackgroundColor3 = Color3.new(1, 1, 1)
Cimage.BorderColor3 = Color3.new(0, 0, 0)
Cimage.BorderSizePixel = 0
Cimage.Size = UDim2.new(0, 48, 0, 48)
Cimage.Image = "rbxthumb://type=Asset&id=87812048276361&w=150&h=150" 
UICorner_17.Parent = Cimage

UICorner_18.Parent = CreatorFrame

Cline1.Name = "Cline1"
Cline1.Parent = CreatorFrame
Cline1.BackgroundColor3 = Color3.new(1, 1, 1)
Cline1.BackgroundTransparency = 1
Cline1.BorderColor3 = Color3.new(0, 0, 0)
Cline1.BorderSizePixel = 0
Cline1.Position = UDim2.new(0.184931502, 0, 0, 0)
Cline1.Size = UDim2.new(0, 231, 0, 29)
Cline1.Font = Enum.Font.SourceSans
Cline1.Text = "Developer : ywxo     Discord : .gg/2WXkCdZHVn"
Cline1.TextColor3 = Color3.new(1, 1, 1)
Cline1.TextSize = 14
Cline1.TextXAlignment = Enum.TextXAlignment.Left

Cline2.Name = "Cline2"
Cline2.Parent = CreatorFrame
Cline2.BackgroundColor3 = Color3.new(1, 1, 1)
Cline2.BackgroundTransparency = 1
Cline2.BorderColor3 = Color3.new(0, 0, 0)
Cline2.BorderSizePixel = 0
Cline2.Position = UDim2.new(0.184931502, 0, 0.395833343, 0)
Cline2.Size = UDim2.new(0, 231, 0, 29)
Cline2.Font = Enum.Font.SourceSans
Cline2.Text = "UI Creator : ywxo"
Cline2.TextColor3 = Color3.new(1, 1, 1)
Cline2.TextSize = 14
Cline2.TextXAlignment = Enum.TextXAlignment.Left

OpenCredits.Name = "OpenCredits"
OpenCredits.Parent = BottomFrame
OpenCredits.BackgroundColor3 = Color3.new(1, 1, 1)
OpenCredits.BackgroundTransparency = 1
OpenCredits.BorderColor3 = Color3.new(0, 0, 0)
OpenCredits.BorderSizePixel = 0
OpenCredits.Position = UDim2.new(0.14041096, 0, 0.176470593, 0)
OpenCredits.Size = UDim2.new(0, 142, 0, 21)
OpenCredits.Font = Enum.Font.SourceSans
OpenCredits.Text = "Open Credits"
OpenCredits.TextColor3 = Color3.new(1, 1, 1)
OpenCredits.TextSize = 14
OpenCredits.TextXAlignment = Enum.TextXAlignment.Left

OpenCreatorInfo.MouseButton1Click:Connect(function()
    CreatorFrame.Visible = not CreatorFrame.Visible
end)

local function UpdateCimage(imageId)
    local ImageLabel = Main:FindFirstChild("Cimage")
    if ImageLabel then
        ImageLabel.Image = "rbxthumb://type=Asset&id=" .. imageId .. "&w=150&h=150"
    end
end

local function UpdateCline1(text)
    local Cline1 = Main:FindFirstChild("Cline1")
    if Cline1 then
        Cline1.Text = text
    end
end

local function UpdateCline2(text)
    local Cline2 = Main:FindFirstChild("Cline2")
    if Cline2 then
        Cline2.Text = text
    end
end
