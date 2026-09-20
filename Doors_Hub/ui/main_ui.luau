local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local UI = {}
local isVisible = true
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

function UI.Create()
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "DoorsHubUI"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = CoreGui

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Size = UDim2.new(0, 550, 0, 350)
	MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
	MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Parent = ScreenGui

	local Sidebar = Instance.new("Frame")
	Sidebar.Name = "Sidebar"
	Sidebar.Size = UDim2.new(0, 150, 1, 0)
	Sidebar.Position = UDim2.new(0, 0, 0, 0)
	Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Sidebar.BorderSizePixel = 0
	Sidebar.Parent = MainFrame

	MainFrame.Size = UDim2.new(0, 550, 0, 0)
	TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 550, 0, 350)}):Play()

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.LeftShift then
			isVisible = not isVisible
			local targetSize = isVisible and UDim2.new(0, 550, 0, 350) or UDim2.new(0, 550, 0, 0)
			TweenService:Create(MainFrame, tweenInfo, {Size = targetSize}):Play()
		end
	end)
end

return UI
