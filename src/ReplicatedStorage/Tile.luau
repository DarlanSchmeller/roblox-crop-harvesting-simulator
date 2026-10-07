local Tile = {}
Tile.__index = Tile

local MAX_STAGES = 2

-- Dependencies
local stages = {
game.ReplicatedStorage.Prefabs.Stage_1,
game.ReplicatedStorage.Prefabs.Stage_2
}

function Tile.new(tileInstance: Instance)
local self = setmetatable({}, Tile)

self.stage = 0
self.instance = tileInstance
self.position = tileInstance.Position
self.model = nil

return self
end

function Tile:isComplete()
return self.stage >= MAX_STAGES
end

function Tile:setStage(stage)
self.stage = stage

-- Destroy old model
if self.model then
	self.model:Destroy()
	self.model = nil
end

-- Handle model change
local prefab = stages[self.stage]

if not prefab then
	return
end

local model = prefab:Clone()
model.Parent = game.Workspace.GrownCropTiles
model:MoveTo(self.position)


self.model = model

-- Handle click detection
if self.stage == MAX_STAGES then
	model.ClickDetector.MouseClick:Connect(function(playerThatClicked)
		self:setStage(0)
		playerThatClicked.leaderstats.Coins.Value += 10
	end)
end
end

return Tile