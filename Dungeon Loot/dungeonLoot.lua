local dungeonLoot = {}

local jsondata = jsonInterface.load("custom/DungeonLootLog.json")
local lootTableTable = jsonInterface.load("custom/DungeonLootTables.json")

--The Id of the chest determines what loot table is used
--Will look for tables in data/custom/DungeonLootTables.json
--Example included for "dungeonchest_armor_one"

--You will either need to enable places object collision, or set the collision overide on for each id
--If you don't they won't have collision

--Time in seconds between valid loots
--Default is 1 hour
local cooldownTime = 3

function dungeonLoot.main(eventStatus, pid, locationName, objectInfo, players)
    for _,object in pairs(objectInfo) do
        if object.refId ~= nil then
            if dungeonLoot.CheckId(object.refId) == true then
                if dungeonLoot.CheckCooldown(pid, locationName, object.uniqueIndex) == true then
                    dungeonLoot.Reward(pid, object.refId)
                end
            end
        end
    end
end

function dungeonLoot.CheckId(objectRefId)
    if lootTableTable[objectRefId] ~= nil then
        return true
    else
        return false
    end
end

function dungeonLoot.CheckCooldown(pid, locationName, uniqueIndex)
    local state
    local playerName = Players[pid].name
    if jsondata == nil then
        jsondata = {}
    end
    
    if jsondata[playerName] == nil then
        jsondata[playerName] = {}
    end
    
    if jsondata[playerName][locationName] == nil then
        jsondata[playerName][locationName] = {}
    end
    
    if jsondata[playerName][locationName][uniqueIndex] == nil then
        jsondata[playerName][locationName][uniqueIndex] = {}
    end
    
    if jsondata[playerName][locationName][uniqueIndex].loottime == nil then
        jsondata[playerName][locationName][uniqueIndex].loottime = os.time()
        state = true
    elseif os.time() <= (jsondata[playerName][locationName][uniqueIndex].loottime+cooldownTime) then
        state = false
        tes3mp.MessageBox(pid, -1, "The chest is empty")
    else 
        jsondata[playerName][locationName][uniqueIndex].loottime = os.time()
        state = true
    end
    
    return state
end

function dungeonLoot.SaveJson()
    if jsondata ~= nil then
        jsonInterface.save("custom/DungeonLootLog.json", jsondata)
    end
end

function dungeonLoot.Reward(pid, objectRefId)
    local lootTable = lootTableTable[objectRefId]
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
customEventHooks.registerHandler("OnServerExit", dungeonLoot.SaveJson)

return dungeonLoot
