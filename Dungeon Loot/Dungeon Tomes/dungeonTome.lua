local dungeonTome = {}


local jsondata = jsonInterface.load("custom/DungeonTomeLog.json")
local lootTableTable = jsonInterface.load("custom/DungeonTomeTables.json")


--The Id of the item determines what loot table is used
--Will look for tables in data/custom/DungeonTomeTables.json
--Example included for "dungeontome_tome_gods"

--You will either need to enable places object collision, or set the collision overide on for each id
--If you don't they won't have collision

--Time in seconds between valid loots
--Default is 1 hour
local cooldownTime = 3600

function dungeonTome.main(eventStatus, pid, locationName, objectInfo, players)
    for _,object in pairs(objectInfo) do
        if object.refId ~= nil then
            if dungeonTome.CheckId(object.refId) == true then
                if dungeonTome.CheckCooldown(pid, locationName, object.uniqueIndex) == true then
                    dungeonTome.Reward(pid, object.refId)
                end
            end
        end
    end
end

function dungeonTome.CheckId(objectRefId)
    if lootTableTable[objectRefId] ~= nil then
        return true
    else
        return false
    end
end

function dungeonTome.CheckCooldown(pid, locationName, uniqueIndex)
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
        tes3mp.MessageBox(pid, -1, "There is nothing of interest remaining within the tome.")
    else 
        jsondata[playerName][locationName][uniqueIndex].loottime = os.time()
        state = true
    end
    
    return state
end

function dungeonTome.SaveJson()
    if jsondata ~= nil then
        jsonInterface.save("custom/DungeonTomeLog.json", jsondata)
    end
end

function dungeonTome.Reward(pid, objectRefId)
    local lootTable = lootTableTable[objectRefId]
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
        --table.insert(Players[pid].data.spellbook, spellId)
        message = "You find a spell of " .. spellName .. " within the tome."
    end
    
    playerPacketHelper.addPlayerSpells(pid,{spellId})
    tes3mp.MessageBox(pid, -1, message)
end

customEventHooks.registerHandler("OnObjectActivate", dungeonTome.main)
customEventHooks.registerHandler("OnServerExit", dungeonTome.SaveJson)

return dungeonTome