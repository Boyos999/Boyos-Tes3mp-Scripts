local dungeonLoot = {}

local jsonInterface = require("jsonInterface")

--Remove this if you don't care about random items
--randomArmor = require("randomArmor")

local jsondata = nil

--The Id of the chest is extremely important, it determines what loot table is used
--ex. dungeonchest_armor_one will look for the jsonfile "armorone" in the data folder
--additional letter can be added after ex. dungeonchest_armor_one_a, the additional
--letter are not taken into account but will have seperate cooldowns
--If in different Cells, they will ahve different cooldowns regardless

--You will either need to enable places object collision, or set the collision overide on for each id
--If you don't they won't have collision

--Time in seconds between valid loots
--Default is 1 hour
local cooldownTime = 3600

function dungeonLoot.main(pid, objectRefId, locationName)
	if dungeonLoot.CheckId(objectRefId, pid) == true then
		if dungeonLoot.CheckCooldown(pid, locationName, objectRefId) == true then
			dungeonLoot.Reward(pid, objectRefId)
		end
	end
end

function dungeonLoot.CheckId(objectRefId, pid)
	local splitObjectRefId = objectRefId:split("_")
	if splitObjectRefId[1] == "dungeonchest" then
		return true
	else
		return false
	end
end

function dungeonLoot.CheckCooldown(pid, locationName, chestId)
	local state
	local playerName = Players[pid].name
	jsondata = jsonInterface.load("DungeonLoot.json")
	if jsondata == nil then
		jsondata = {}
	end
	
	if jsondata[playerName] == nil then
		jsondata[playerName] = {}
	end
	
	if jsondata[playerName][locationName] == nil then
		jsondata[playerName][locationName] = {}
	end
	
	if jsondata[playerName][locationName][chestId] == nil then
		jsondata[playerName][locationName][chestId] = {}
	end
	
	if jsondata[playerName][locationName][chestId].loottime == nil then
		jsondata[playerName][locationName][chestId].loottime = os.time()
		state = true
	elseif os.time() <= (jsondata[playerName][locationName][chestId].loottime+cooldownTime) then
		state = false
		tes3mp.MessageBox(pid, -1, "The chest is empty")
	else 
		jsondata[playerName][locationName][chestId].loottime = os.time()
		state = true
	end
	dungeonLoot.SaveJson(jsondata)
	
	return state
end

function dungeonLoot.SaveJson(jsondata)
	jsonInterface.save("DungeonLoot.json", jsondata)
end

function dungeonLoot.Reward(pid, objectRefId)
	local splitObjectRefId = objectRefId:split("_")
	local lootTableName = splitObjectRefId[2] .. splitObjectRefId[3]
	local lootTable = jsonInterface.load(lootTableName .. ".json")
	local length = table.getn(lootTable)
	local lootRoll = math.random(1,length)
	local item = lootTable[lootRoll]
	local itemId
	local itemCount = 1
	local itemName = "an item"
	local message
	
	if item.refid ~= nil then
		itemId = item.refid
		if item.count ~= nil then
			itemCount = item.count
		end
		if item.name ~= nil then
			itemName = item.name
		end
	else
		itemId = item
	end
	
	message = "You find " .. itemName .. " within the chest."
	--This is where you handle cases where the table entry isn't an itemId (ex. randomItems)
	--I recommend using a prefix in the id (ex. by_<whatever>) then using the Id to determine what to do with it
	--this example uses the id by_randomarmor_2 to make a random piece of armor with 2 enchants
	local splitItemId = itemId:split("_")
	--[[
	if splitItemId[1] == "by" then		--You'll need an if statement for each non-standard id
		if splitItemId[2] == "randomarmor" then
			local randomarmor = randomArmor.CreateRandArmor(pid, tonumber(splitItemId[3]))
			--table.insert instead of inventoryHelper because I didn't know about it at the time
			table.insert(Players[pid].data.inventory, randomarmor)
		end
		
	else
	--otherwise just add the Id to the player's inventory
	]]--
	inventoryHelper.addItem(Players[pid].data.inventory,itemId,itemCount)
	--end
	
	Players[pid]:LoadInventory()
	Players[pid]:LoadEquipment()
	tes3mp.MessageBox(pid, -1, message)
	
end

return dungeonLoot
