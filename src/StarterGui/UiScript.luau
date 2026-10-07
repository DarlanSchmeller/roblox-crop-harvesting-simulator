-- Dependencies
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gameGui = script.Parent.ScreenGui.CoinsLabel

-- Wait to load leaderstats
local leaderstats = player:WaitForChild("leaderstats")
local coins = leaderstats:WaitForChild("Coins")

local function updateUi(newAmount: number)
	gameGui.Text = "Coins: " .. newAmount
end

-- Update the first initial value
updateUi(coins.Value)

coins.Changed:Connect(updateUi)