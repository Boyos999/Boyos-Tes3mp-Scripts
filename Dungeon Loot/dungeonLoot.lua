local dungeonLoot = {}

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
local cooldownTime = 3

function dungeonLoot.main(eventStatus, pid, locationName, objectInfo, players)
    for _,object in pairs(objectInfo) do
        if object.refId ~= nil then
            if dungeonLoot.CheckId(object.refId, pid) == true then
                if dungeonLoot.CheckCooldown(pid, locationName, object.refId) == true then
                    dungeonLoot.Reward(pid, object.refId)
                end
            end
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
    jsondata = jsonInterface.load("custom/DungeonLoot.json")
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
    jsonInterface.save("custom/DungeonLoot.json", jsondata)
end

function dungeonLoot.Reward(pid, objectRefId)
    local splitObjectRefId = objectRefId:split("_")
    local lootTableName = splitObjectRefId[2] .. splitObjectRefId[3]
    local lootTable = jsonInterface.load("custom/" .. lootTableName .. ".json")
    local length = table.getn(lootTable)
    local lootRoll = math.random(1,length)
    local item = lootTable[lootRoll]
    local itemId
    local itemCount = 1
    local itemName = "an item"
    local packetItem = {}
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
    
    packetItem.refId = itemId
    packetItem.count = itemCount
    playerPacketHelper.addPlayerItems(pid,{packetItem})
    tes3mp.MessageBox(pid, -1, message)
    
end

--customEventHooks.registerValidator("OnObjectActivate", dungeonLoot.CheckId)
customEventHooks.registerHandler("OnObjectActivate", dungeonLoot.main)

return dungeonLoot
