-- taidepzai hehehehe
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "taidepzai hub"
screenGui.Parent = playerGui

local keyboardFrame = Instance.new("Frame")
keyboardFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
keyboardFrame.Position = UDim2.new(0.25, 0, 0.6, 0)
keyboardFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
keyboardFrame.BorderSizePixel = 0
keyboardFrame.Visible = false 
keyboardFrame.Parent = screenGui

local outputBox = Instance.new("TextBox")
outputBox.Size = UDim2.new(0.5, 0, 0.1, 0)
outputBox.Position = UDim2.new(0.25, 0, 0.45, 0)
outputBox.Text = ""
outputBox.TextScaled = true
outputBox.BackgroundColor3 = Color3.new(1, 1, 1)
outputBox.TextColor3 = Color3.new(0, 0, 0)
outputBox.ClearTextOnFocus = false
outputBox.Parent = screenGui

-- dm chúng mày bố tài là nhất
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0.1, 0, 0.05, 0)
toggleButton.Position = UDim2.new(0.45, 0, 0.4, 0)
toggleButton.Image = "rbxassetid://96693216224872" -- Thay thế bằng ID hình ảnh của bạn
toggleButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
toggleButton.Parent = screenGui

toggleButton.MouseButton1Click:Connect(function()
    keyboardFrame.Visible = not keyboardFrame.Visible
end)

local keys = {
    {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"},
    {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"},
    {"A", "S", "D", "F", "G", "H", "J", "K", "L"},
    {"Z", "X", "C", "V", "B", "N", "M", "SPACE"}
}

local function createButton(parent, text, position, size)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.Text = text
    button.TextScaled = true
    button.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
    button.TextColor3 = Color3.new(0, 0, 0)
    button.Parent = parent
    return button
end

local buttonSize = UDim2.new(0.09, 0, 0.2, 0)
for rowIndex, row in ipairs(keys) do
    for colIndex, key in ipairs(row) do
        local xPos = (colIndex - 1) * 0.1
        local yPos = (rowIndex - 1) * 0.25
        local button = createButton(
            keyboardFrame,
            key == "SPACE" and " " or key,
            UDim2.new(xPos, 0, yPos, 0),
            buttonSize
        )
        
        button.MouseButton1Click:Connect(function()
            if key == "SPACE" then
                outputBox.Text = outputBox.Text .. " "
            else
                outputBox.Text = outputBox.Text .. key
            end
        end)
    end
end