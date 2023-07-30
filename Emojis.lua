--This GUI allows you to add your own emojis to the list, or copy and paste them! (Primarily made for chat, and having fun!)
 
local emojiList = {
    "Select Emoji","😃","😄","😁","😆","😅","🤣","😂","🙂","🙃","😉", "😊","😇","🥰","😍","🤩","😘","😗","☺️","😚","😙","😋","😛", "😜","🤪","😝","🤑","🤗","🤭","🤫","🤔","🤐","🤨","😐","😑","😶","😶‍🌫️","😏","😒","🙄","😬","😮‍💨","🤥","😌","😔","😪","🤤","😴","😷", "🤒","🤕","🤢","🤮","🤧","🥵","🥶","🥴","😵","😵‍💫","🤯","🤠","🥳","🥸","😎","🤓","🧐","😕","😟","🙁","☹️","😮","😯","😲","😳","🥺","🥹","😦","😧","😨","😰","😥","😢","😭","😱","😖","😣","😞","😓","😩","😫","🥱","😤","😡","🤬","😈","👿","💀","☠️","💩","🤡","👹","👺","👻","👽","👾",
    "(•‿•)", "(◑‿◐)","(-‿◦☀)", "ಥ‿ಥ", "(づ ◕‿◕ )づ",  "٩(◕‿◕)۶"
}
 
local selectedEmoji = emojiList[1] -- To store the currently selected emoji
 
-- Create the ScreenGui
local guiName = "TadachiisEmojiGUI"
local existingGUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild(guiName)
if existingGUI then
    existingGUI:Destroy()
end
 
local gui = Instance.new("ScreenGui")
gui.Name = guiName
gui.Parent = game.Players.LocalPlayer.PlayerGui
 
-- Create the Holder Frame
local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Size = UDim2.new(0, 200, 0, 380) -- Increased height to accommodate the dropdown button, GetButton, TextBox, and ClearButton
holder.Position = UDim2.new(0.5, -100, 0.5, -190)
holder.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
holder.BackgroundTransparency = 0.5
holder.Draggable = true
holder.Active = true
holder.Parent = gui
 
-- Create the TitleLabel TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30) -- Reduced height to leave space for the dropdown button
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Tadachii's Emoji GUI"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 20
titleLabel.Parent = holder
 
-- Create the dropdown button
local dropdownButton = Instance.new("TextButton")
dropdownButton.Name = "DropdownButton"
dropdownButton.Size = UDim2.new(1, 0, 0, 30)
dropdownButton.Position = UDim2.new(0, 0, 0, 30) -- Position it below the title label
dropdownButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
dropdownButton.Text = "Select Emoji"
dropdownButton.Font = Enum.Font.SourceSansBold
dropdownButton.TextColor3 = Color3.new(1, 1, 1)
dropdownButton.TextSize = 18
dropdownButton.Parent = holder
 
-- Create the scrollbar frame (which will be the dropdown list)
local scrollbar = Instance.new("ScrollingFrame")
scrollbar.Name = "Scrollbar"
scrollbar.Size = UDim2.new(1, 0, 1, -210) -- Adjust height to leave space for the dropdown button, GetButton, and TextBox
scrollbar.Position = UDim2.new(0, 0, 0, 60) -- Position it below the dropdown button
scrollbar.BackgroundTransparency = 0.8
scrollbar.Visible = false -- Hide the scrollbar initially
scrollbar.ScrollingEnabled = true -- Enable scrolling for the scrollbar
scrollbar.Parent = holder
 
-- Function to create the dropdown options
local function createDropdownOptions()
    scrollbar:ClearAllChildren()
 
    local totalHeight = 0
 
    for index, emoji in ipairs(emojiList) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = "OptionButton"
        optionButton.Size = UDim2.new(1, 0, 0, 30)
        optionButton.Position = UDim2.new(0, 0, 0, totalHeight)
        optionButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
        optionButton.Text = emoji
        optionButton.Font = Enum.Font.SourceSans
        optionButton.TextColor3 = Color3.new(1, 1, 1)
        optionButton.TextSize = 18
        optionButton.Parent = scrollbar
 
        -- Add a MouseButton1Click event to the optionButton to update the dropdown button's text
        optionButton.MouseButton1Click:Connect(function()
            dropdownButton.Text = emoji
            selectedEmoji = emoji -- Update the selected emoji variable
            scrollbar.Visible = false -- Hide the scrollbar after selecting an option
        end)
 
        totalHeight = totalHeight + 30
    end
 
    -- Adjust the scrollbar height based on the number of options
    scrollbar.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end
 
-- Call the function to create the initial dropdown options
createDropdownOptions()
 
-- Connect the dropdown button to show/hide the options list and scrollbar
dropdownButton.MouseButton1Click:Connect(function()
    scrollbar.Visible = not scrollbar.Visible -- Toggle scrollbar visibility
end)
 
-- Create the GetButton
local getButton = Instance.new("TextButton")
getButton.Name = "GetButton"
getButton.Size = UDim2.new(1, 0, 0, 30)
getButton.Position = UDim2.new(0, 0, 1, -150) -- Position it below the dropdown button
getButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
getButton.Text = "Get Emoji"
getButton.Font = Enum.Font.SourceSansBold
getButton.TextColor3 = Color3.new(1, 1, 1)
getButton.TextSize = 18
getButton.Parent = holder
 
-- Create the TextBox
local textBox = Instance.new("TextBox")
textBox.Name = "TextBox"
textBox.Size = UDim2.new(1, 0, 0, 30)
textBox.Position = UDim2.new(0, 0, 1, -120) -- Position it below the GetButton
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.Font = Enum.Font.SourceSans
textBox.TextColor3 = Color3.new(0, 0, 0)
textBox.TextSize = 18
textBox.Text = "" -- Empty initially
textBox.ClearTextOnFocus = false -- Do not clear the text when the TextBox is clicked
textBox.Parent = holder
 
-- Function to set the TextBox text to the selected emoji
getButton.MouseButton1Click:Connect(function()
    if selectedEmoji ~= "Select Emoji" then
        textBox.Text = textBox.Text .. selectedEmoji
    end
end)
 
-- Create the ClearButton
local clearButton = Instance.new("TextButton")
clearButton.Name = "ClearButton"
clearButton.Size = UDim2.new(1, 0, 0, 30)
clearButton.Position = UDim2.new(0, 0, 1, -90) -- Position it below the TextBox
clearButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
clearButton.Text = "Clear"
clearButton.Font = Enum.Font.SourceSansBold
clearButton.TextColor3 = Color3.new(1, 1, 1)
clearButton.TextSize = 18
clearButton.Parent = holder
 
-- Function to clear the TextBox text
clearButton.MouseButton1Click:Connect(function()
    textBox.Text = ""
end)
 
-- Create the DestroyGUIButton
local destroyGUIButton = Instance.new("TextButton")
destroyGUIButton.Name = "DestroyGUIButton"
destroyGUIButton.Size = UDim2.new(1, 0, 0, 60)
destroyGUIButton.Position = UDim2.new(0, 0, 1, -60) -- Position it below the ClearButton
destroyGUIButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Bright red background color
destroyGUIButton.Text = "DestroyGUI"
destroyGUIButton.Font = Enum.Font.SourceSansBold
destroyGUIButton.TextColor3 = Color3.new(0, 0, 0) -- Black text color
destroyGUIButton.TextSize = 18
destroyGUIButton.Parent = holder
 
-- Function to destroy the GUI when the DestroyGUIButton is clicked
destroyGUIButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
 