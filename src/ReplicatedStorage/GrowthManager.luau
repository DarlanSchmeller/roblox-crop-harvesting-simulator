local growthManager = {}
local growthChancePerSecond = 0.05

function growthManager:run(deltaTime: number)
	local tiles = _G.gameData.tiles
	
	for _, tile in tiles do
		-- Ignore complete tiles
		if tile:isComplete() then
			continue
		end
		
		-- Calculate growth chance
		local growthChance = growthChancePerSecond * deltaTime
		
		if math.random() > growthChance then
			continue
		end

		-- Grow tile
		tile:setStage(tile.stage + 1)
	end
end

return growthManager
