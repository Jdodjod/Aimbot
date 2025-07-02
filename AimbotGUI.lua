-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AutoAimGUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(1, -210, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Create Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "AIMBOT"
title.BackgroundTransparency = 0
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 0, 0) -- 🔴 RED TEXT
title.Font = Enum.Font.GothamBlack
title.TextSize = 18
title.Parent = frame

-- Create Status Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -20, 0, 25)
label.Position = UDim2.new(0, 10, 0, 40)
label.Text = "Auto Aim: OFF"
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 0, 0) -- 🔴 RED TEXT
label.Font = Enum.Font.Gotham
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = frame

-- Create Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 30)
button.Position = UDim2.new(0.5, -50, 1, -40)
button.Text = "Toggle"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.Parent = frame

-- Variables
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local autoAimEnabled = false

-- Get closest target
local function getClosestTarget()
	local shortest = math.huge
	local closest = nil
	for _, model in pairs(workspace:GetChildren()) do
		if model:IsA("Model") and model:FindFirstChild("Humanoid") and model:FindFirstChild("HumanoidRootPart") and model ~= player.Character then
			local dist = (player.Character.HumanoidRootPart.Position - model.HumanoidRootPart.Position).Magnitude
			if dist < shortest then
				shortest = dist
				closest = model
			end
		end
	end
	return closest
end

-- Auto Aim Loop (CFrame-based, shift lock–safe)
button.MouseButton1Click:Connect(function()
	autoAimEnabled = not autoAimEnabled
	label.Text = "Auto Aim: " .. (autoAimEnabled and "ON" or "OFF")

	if autoAimEnabled then
		task.spawn(function()
			while autoAimEnabled do
				local target = getClosestTarget()
				if target then
					local camPos = camera.CFrame.Position
					local lookAt = target.HumanoidRootPart.Position
					camera.CFrame = CFrame.new(camPos, lookAt)
				end
				task.wait(0.1)
			end
		end)
	end
end)-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AutoAimGUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(1, -210, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Create Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "AIMBOT"
title.BackgroundTransparency = 0
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 0, 0) -- 🔴 RED TEXT
title.Font = Enum.Font.GothamBlack
title.TextSize = 18
title.Parent = frame

-- Create Status Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -20, 0, 25)
label.Position = UDim2.new(0, 10, 0, 40)
label.Text = "Auto Aim: OFF"
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 0, 0) -- 🔴 RED TEXT
label.Font = Enum.Font.Gotham
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = frame

-- Create Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 30)
button.Position = UDim2.new(0.5, -50, 1, -40)
button.Text = "Toggle"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.Parent = frame

-- Variables
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local autoAimEnabled = false

-- Get closest target
local function getClosestTarget()
	local shortest = math.huge
	local closest = nil
	for _, model in pairs(workspace:GetChildren()) do
		if model:IsA("Model") and model:FindFirstChild("Humanoid") and model:FindFirstChild("HumanoidRootPart") and model ~= player.Character then
			local dist = (player.Character.HumanoidRootPart.Position - model.HumanoidRootPart.Position).Magnitude
			if dist < shortest then
				shortest = dist
				closest = model
			end
		end
	end
	return closest
end

-- Auto Aim Loop (CFrame-based, shift lock–safe)
button.MouseButton1Click:Connect(function()
	autoAimEnabled = not autoAimEnabled
	label.Text = "Auto Aim: " .. (autoAimEnabled and "ON" or "OFF")

	if autoAimEnabled then
		task.spawn(function()
			while autoAimEnabled do
				local target = getClosestTarget()
				if target then
					local camPos = camera.CFrame.Position
					local lookAt = target.HumanoidRootPart.Position
					camera.CFrame = CFrame.new(camPos, lookAt)
				end
				task.wait(0.1)
			end
		end)
	end
end)
