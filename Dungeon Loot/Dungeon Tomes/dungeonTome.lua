local dungeonTome = {}


local jsondata = nil


--[[copied from dungeonchest.lua, it's basically the same but with slightly diff format]]--

--The Id of the chest is extremely important, it determines what loot table is used
--ex. dungeontome_armor_one will look for the jsonfile "armorone" in the data folder
--additional letter can be added after ex. dungeontome_armor_one_a, the additional
--letter are not taken into account but will have seperate cooldowns
--If in different Cells, they will ahve different cooldowns regardless

--You will either need to enable places object collision, or set the collision overide on for each id
--If you don't they won't have collision

--Time in seconds between valid loots
--Default is 1 hour
local cooldownTime = 3600

function dungeonTome.main(eventStatus, pid, locationName, objectInfo, players)
	for _,object in pairs(objectInfo) do
        if object.refId ~= nil then
            if dungeonTome.CheckId(object.refId, pid) == true then
                if dungeonTome.CheckCooldown(pid, locationName, object.refId) == true then
                    dungeonTome.Reward(pid, object.refId)
                end
            end
        end
    end
end

function dungeonTome.CheckId(objectRefId, pid)
	local splitObjectRefId = objectRefId:split("_")
	if splitObjectRefId[1] == "dungeontome" then
		return true
	else
		return false
	end
end

function dungeonTome.CheckCooldown(pid, locationName, chestId)
	local state
	local playerName = Players[pid].name
	jsondata = jsonInterface.load("custom/DungeonTome.json")
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
		tes3mp.MessageBox(pid, -1, "There is nothing of interest remaining within the tome.")
	else 
		jsondata[playerName][locationName][chestId].loottime = os.time()
		state = true
	end
	dungeonTome.SaveJson(jsondata)
	
	return state
end

function dungeonTome.SaveJson(jsondata)
	jsonInterface.save("custom/DungeonTome.json", jsondata)
end

function dungeonTome.Reward(pid, objectRefId)
	local splitObjectRefId = objectRefId:split("_")
	local lootTableName = splitObjectRefId[2] .. splitObjectRefId[3]
	local lootTable = jsonInterface.load("custom/" .. lootTableName .. ".json")
	local length = table.getn(lootTable)
	local lootRoll = math.random(1,length)
	local spell = lootTable[lootRoll]
	local spellId
	--local itemCount = 1
	local spellName = "no name"
	local message
	
	if spell.refid ~= nil then
		spellId = spell.refid
		if spell.name ~= nil then
			spellName = spell.name
		end
	else
		spellId = spell
	end
	
	

	--local splitSpellId = spellId:split("_")
		
	--otherwise just add the Id to the player's inventory
	if tableHelper.containsValue(Players[pid].data.spellbook, spellId) then
		message = "You already know the spell contained within."
	else
		table.insert(Players[pid].data.spellbook, spellId)
		message = "You find a spell of " .. spellName .. " within the tome."
	end
	
	Players[pid]:LoadSpellbook()

	tes3mp.MessageBox(pid, -1, message)
end

customEventHooks.registerHandler("OnObjectActivate", dungeonTome.main)

return dungeonTome