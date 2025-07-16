-- GUI PRINCIPAL
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RockHubAlfa"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 260)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -130)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- FUNÇÃO DRAG
local function dragify(frame)
local dragging, dragInput, dragStart, startPos

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

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 110, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 10)

local buttonLayout = Instance.new("UIListLayout", sidebar)
buttonLayout.SortOrder = Enum.SortOrder.LayoutOrder
buttonLayout.Padding = UDim.new(0, 6)

-- SIDEBAR BUTTONS
local currentButton
local function createSidebarButton(text)
local button = Instance.new("TextButton")
button.Text = text
button.Size = UDim2.new(1, -16, 0, 34)
button.Position = UDim2.new(0, 8, 0, 0)
button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
button.TextColor3 = Color3.fromRGB(230, 230, 230)
button.Font = Enum.Font.Gotham
button.TextSize = 13
button.BorderSizePixel = 0
button.AutoButtonColor = false
button.Parent = sidebar

local corner = Instance.new("UICorner", button)  
corner.CornerRadius = UDim.new(0, 6)  

local stroke = Instance.new("UIStroke", button)  
stroke.Color = Color3.fromRGB(255, 255, 255)  
stroke.Thickness = 1  
stroke.Transparency = 1  

button.MouseEnter:Connect(function()  
	if button ~= currentButton then  
		button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)  
	end  
end)  

button.MouseLeave:Connect(function()  
	if button ~= currentButton then  
		button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  
	end  
end)  

return button, stroke

end

local funButton, funStroke = createSidebarButton("Fun")
local avatarButton, avatarStroke = createSidebarButton("Avatar")
local settingsButton, settingsStroke = createSidebarButton("Settings")
local creditsButton, creditsStroke = createSidebarButton("Credits")

-- CONTEÚDO
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, -50)
contentFrame.Position = UDim2.new(0, 115, 0, 45)
contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame
Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 8)

-- CRIAR TABS
local function createTabFrame(name)
local frame = Instance.new("Frame")
frame.Name = name
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1
frame.Visible = false
frame.Parent = contentFrame
return frame
end

local funFrame = createTabFrame("Fun")
local avatarFrame = createTabFrame("Avatar")
local settingsFrame = createTabFrame("Settings")
local creditsFrame = createTabFrame("Credits")

-- CONTEÚDO DA ABA CREDITS
local creditsText = Instance.new("TextLabel", creditsFrame)
creditsText.Size = UDim2.new(1, -20, 1, -20)
creditsText.Position = UDim2.new(0, 10, 0, 10)
creditsText.BackgroundTransparency = 1
creditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsText.Font = Enum.Font.Gotham
creditsText.TextSize = 16
creditsText.TextXAlignment = Enum.TextXAlignment.Left
creditsText.TextYAlignment = Enum.TextYAlignment.Top
creditsText.TextWrapped = true
creditsText.Text = [[
Credits:

Dev's : Frost230_0 // pedro098888 // rip_luffy1552._1459
Animation: Frost230_0 // pedro098888
Co-Owner: lostzada.com
Owner: imperial_rickz
]]

-- TROCAR TABS
local function switchTab(tab, button, stroke)
funFrame.Visible = false
avatarFrame.Visible = false
settingsFrame.Visible = false
creditsFrame.Visible = false

for _, child in ipairs(sidebar:GetChildren()) do  
	if child:IsA("TextButton") then  
		child.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  
	end  
end  
funStroke.Transparency = 1  
avatarStroke.Transparency = 1  
settingsStroke.Transparency = 1  
creditsStroke.Transparency = 1  

currentButton = button  
button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)  
stroke.Transparency = 0.2  

if tab == "Fun" then  
	funFrame.Visible = true  
elseif tab == "Avatar" then  
	avatarFrame.Visible = true  
elseif tab == "Settings" then  
	settingsFrame.Visible = true  
elseif tab == "Credits" then  
	creditsFrame.Visible = true  
end

end

-- BOTÕES PARA TROCAR TABS
funButton.MouseButton1Click:Connect(function()
switchTab("Fun", funButton, funStroke)
end)

avatarButton.MouseButton1Click:Connect(function()
switchTab("Avatar", avatarButton, avatarStroke)
end)

settingsButton.MouseButton1Click:Connect(function()
switchTab("Settings", settingsButton, settingsStroke)
end)

creditsButton.MouseButton1Click:Connect(function()
switchTab("Credits", creditsButton, creditsStroke)
end)

switchTab("Fun", funButton, funStroke)

-- BOTÃO RESTAURAR (BOLINHA)
local restoreButton = Instance.new("TextButton")
restoreButton.Size = UDim2.new(0, 36, 0, 36)
restoreButton.Position = UDim2.new(0, 20, 1, -56)
restoreButton.AnchorPoint = Vector2.new(0, 1)
restoreButton.Text = "+"
restoreButton.Font = Enum.Font.GothamBold
restoreButton.TextSize = 22
restoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
restoreButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
restoreButton.Visible = false
restoreButton.Parent = screenGui
Instance.new("UICorner", restoreButton).CornerRadius = UDim.new(1, 0)

dragify(restoreButton)

-- AÇÕES DOS BOTÕES
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

Continua com esse

