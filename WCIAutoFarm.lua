-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local EnableDisable = Instance.new("TextButton")
ScreenGui.Name = "AutoFarm"

if game.Players.LocalPlayer.PlayerGui:FindFirstChild("AutoFarm") then
	game.Players.LocalPlayer.PlayerGui:WaitForChild("AutoFarm"):Destroy()
end

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

EnableDisable.Name = "EnableDisable"
EnableDisable.Parent = ScreenGui
EnableDisable.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
EnableDisable.Position = UDim2.new(0.010819165, 0, 0.767813265, 0)
EnableDisable.Size = UDim2.new(0.0598145351, 0, 0.0705159828, 0)
EnableDisable.Font = Enum.Font.PermanentMarker
EnableDisable.Text = "OFF/ON"
EnableDisable.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableDisable.TextScaled = true
EnableDisable.TextSize = 14.000
EnableDisable.TextWrapped = true

-- Scripts:

local function PDSXMPL_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local enabled = false
	local button =script.Parent.EnableDisable
	
	button.MouseButton1Click:Connect(function()
		if enabled == false then
			button.Text = "ON"
			button.BackgroundColor3 = Color3.new(0, 1, 0)
			enabled = true
		elseif enabled == true then
			button.Text = "OFF"
			button.BackgroundColor3 = Color3.new(1, 0, 0)
			enabled = false
		end
	end)
	
	while wait(.4) do
		if enabled == true then
	      for _, v in pairs(workspace["WHEAT_BUNCH"]:GetChildren()) do
			if v:IsA("Part") and v:WaitForChild("Spawned").Value == true then
				local plr = game.Players.LocalPlayer
				local character = plr.Character
			
				plr.Character.HumanoidRootPart.CFrame = v.CFrame
				end
			end
		end
	end
end
coroutine.wrap(PDSXMPL_fake_script)()
