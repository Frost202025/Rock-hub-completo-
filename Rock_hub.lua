-- GUI PRINCIPAL
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RockHubAlfa"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- FUNÇÃO DRAG UNIVERSAL
local function dragify(frame)
	local dragging = false
	local dragInput, dragStart, startPos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
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

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
									   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 300)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
dragify(mainFrame)

-- TÍTULO
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, -50, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "✦ Rock Hub Alfa"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- BOTÕES DE FECHAR E MINIMIZAR
local function createTopButton(text, positionX)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 25, 0, 25)
	button.Position = UDim2.new(1, positionX, 0, 5)
	button.AnchorPoint = Vector2.new(1, 0)
	button.Text = text
	button.Font = Enum.Font.GothamBold
	button.TextSize = 14
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	button.BorderSizePixel = 0
	button.Parent = mainFrame
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
	return button
end

local closeButton = createTopButton("X", -5)
local minimizeButton = createTopButton("-", -35)

-- SIDEBAR COM SCROLL
local sidebarHolder = Instance.new("Frame")
sidebarHolder.Size = UDim2.new(0, 110, 1, -40)
sidebarHolder.Position = UDim2.new(0, 0, 0, 40)
sidebarHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebarHolder.BorderSizePixel = 0
sidebarHolder.Parent = mainFrame
Instance.new("UICorner", sidebarHolder).CornerRadius = UDim.new(0, 10)

local scrollingFrame = Instance.new("ScrollingFrame", sidebarHolder)
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BackgroundTransparency = 1

local buttonLayout = Instance.new("UIListLayout", scrollingFrame)
buttonLayout.SortOrder = Enum.SortOrder.LayoutOrder
buttonLayout.Padding = UDim.new(0, 5)

-- CONTEÚDO FRAME
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, -50)
contentFrame.Position = UDim2.new(0, 115, 0, 45)
contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame
Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 10)

-- CRIAR ABA COM ÍCONE
local currentTab
local function createTab(name, emoji)
	local button = Instance.new("TextButton")
	button.Text = emoji .. " " .. name
	button.Size = UDim2.new(1, -12, 0, 34)
	button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	button.TextColor3 = Color3.fromRGB(230, 230, 230)
	button.Font = Enum.Font.Gotham
	button.TextSize = 13
	button.BorderSizePixel = 0
	button.Parent = scrollingFrame
	button.AutoButtonColor = false
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

	local tabContent = Instance.new("Frame", contentFrame)
	tabContent.Name = name
	tabContent.Size = UDim2.new(1, 0, 1, 0)
	tabContent.BackgroundTransparency = 1
	tabContent.Visible = false

	button.MouseButton1Click:Connect(function()
		if currentTab then currentTab.Visible = false end
		tabContent.Visible = true
		currentTab = tabContent
	end)

	return tabContent
end

-- TABS COM EMOJIS PRETOS
local tabs = {
	{"Fun", "🎮"},
	{"Avatar", "🧍‍♂️"},
	{"House", "🏠"},
	{"Car", "🚗"},
	{"RGB", "🌈"},
	{"Music All", "🎵"},
	{"Music", "🎶"},
	{"Troll", "😈"},
	{"Spam", "📤"},
	{"Scripts", "📜"},
	{"Teleports", "🗺️"},
	{"Credits", "📌"},
}

local creditsTab = nil

for _, t in ipairs(tabs) do
	local tab = createTab(t[1], t[2])
	if t[1] == "Credits" then creditsTab = tab end
end

-- CONTEÚDO DA ABA DE CRÉDITOS
local creditsText = Instance.new("TextLabel", creditsTab)
creditsText.Size = UDim2.new(1, -20, 1, -20)
creditsText.Position = UDim2.new(0, 10, 0, 10)
creditsText.BackgroundTransparency = 1
creditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsText.Font = Enum.Font.Gotham
creditsText.TextSize = 16
creditsText.TextWrapped = true
creditsText.TextXAlignment = Enum.TextXAlignment.Center
creditsText.TextYAlignment = Enum.TextYAlignment.Center
creditsText.Text = [[
Dev's: Frost230_0 // pedro098888 // rip_luffy1552._1459
Animation: Frost230_0 // pedro098888
Co-Owner: lostzada.com
Owner: imperial_rickz
]]

-- BOTÃO RESTAURAR (BOLINHA PRETA)
local restoreButton = Instance.new("TextButton")
restoreButton.Size = UDim2.new(0, 36, 0, 36)
restoreButton.Position = UDim2.new(0.5, -18, 0, 5)
restoreButton.AnchorPoint = Vector2.new(0.5, 0)
restoreButton.Text = "+"
restoreButton.Font = Enum.Font.GothamBold
restoreButton.TextSize = 20
restoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
restoreButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
restoreButton.Visible = false
restoreButton.Parent = screenGui
Instance.new("UICorner", restoreButton).CornerRadius = UDim.new(1, 0)
dragify(restoreButton)

-- AÇÕES DE MINIMIZAR E FECHAR
minimizeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	restoreButton.Visible = true
end)

restoreButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	restoreButton.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Exibe aba inicial
if creditsTab then
	creditsTab.Visible = true
	currentTab = creditsTab
end
