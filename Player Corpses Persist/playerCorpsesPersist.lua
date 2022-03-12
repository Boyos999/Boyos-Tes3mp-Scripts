local playerCorpsesPersist = {}
local corpsesTracker = {}
corpsesTracker = jsonInterface.load("custom/playerCorpses.json")

--At greater than this number of corpses the oldest will be removed
--set to -1 for infinite
local maxCorpsesPerPlayer = 2
--Will let players dispose of corpses by activating them
--If set to false regular cell resets are highly recommended
local disposeCorpses = true

function playerCorpsesPersist.createCorpseRecord(pid)
    local corpseRecord = {}
    corpseRecord["name"] = Players[pid].name
    corpseRecord["race"] = Players[pid].data.character.race
    corpseRecord["head"] = Players[pid].data.character.head
    corpseRecord["hair"] = Players[pid].data.character.hair
    corpseRecord["gender"] = Players[pid].data.character.gender
    corpseRecord["class"] = "warrior"
    corpseRecord["level"]= 100
    corpseRecord["items"] = {}
    corpseRecord["autoCalc"] = 1
    corpseRecord["heath"] = 0
    
    for _,item in pairs(Players[pid].data.equipment) do
        local tempItem = {}
        tempItem.id = item.refId
        tempItem.count = item.count
        table.insert(corpseRecord["items"],tempItem)
    end

    local recordStore = RecordStores["npc"]
    local id = recordStore:GenerateRecordId()
    recordStore.data.generatedRecords[id] = corpseRecord

    for _, player in pairs(Players) do
        if not tableHelper.containsValue(Players[pid].generatedRecordsReceived, id) then
            table.insert(player.generatedRecordsReceived, id)
        end
    end

    recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("npc")])
    packetBuilder.AddNpcRecord(id, corpseRecord)
    tes3mp.SendRecordDynamic(pid, true, false)

    tes3mp.LogMessage(enumerations.log.INFO,"PCP: Created corpse record id: "..id.." for player: ".. logicHandler.GetChatName(pid))

    return id
end

function playerCorpsesPersist.spawnCorpse(pid)
    local corpseId = playerCorpsesPersist.createCorpseRecord(pid)
    local corpseIndex = logicHandler.CreateObjectAtPlayer(pid, {refId = corpseId, count = 1, scale = 1}, "spawn")
    logicHandler.RunConsoleCommandOnObject(pid,"SetHealth 0",Players[pid].data.location.cell,corpseIndex,true)
    tes3mp.LogMessage(enumerations.log.INFO,"PCP: Spawned Corpse for player: ".. logicHandler.GetChatName(pid) .. " in cell: "..Players[pid].data.location.cell)
    return corpseIndex, corpseId
end

function playerCorpsesPersist.trackCorpse(pid,corpseIndex,corpseRefId)
    local playerName = Players[pid].name
    local playerCell = Players[pid].data.location.cell

    table.insert(WorldInstance.data.customVariables.playerCorpses,corpseIndex)
    if corpsesTracker == nil then
        corpsesTracker = {}
    end
    if corpsesTracker[playerName] == nil then
        corpsesTracker[playerName] = {}
        corpsesTracker[playerName].numCorpses = 1
        corpsesTracker[playerName].corpses = {}
    else
        corpsesTracker[playerName].numCorpses = corpsesTracker[playerName].numCorpses + 1
    end
    local corpse = { cell = playerCell, refId = corpseRefId }
    corpsesTracker[playerName].corpses[corpseIndex] = corpse
    playerCorpsesPersist.saveCorpseTracker()
end

function playerCorpsesPersist.saveCorpseTracker()
    jsonInterface.save("custom/playerCorpses.json",corpsesTracker)
end

function playerCorpsesPersist.checkCorpseNum(pid)
    local playerName = Players[pid].name
    if corpsesTracker == nil then
        return
    elseif corpsesTracker[playerName] == nil then
        return
    elseif corpsesTracker[playerName].numCorpses < maxCorpsesPerPlayer then
        return
    else
        local oldestCorpse = playerCorpsesPersist.getOldestCorpse(corpsesTracker[playerName].corpses)
        local oldestCorpseCell = corpsesTracker[playerName].corpses[oldestCorpse].cell
        playerCorpsesPersist.deleteCorpse(playerName,oldestCorpseCell,oldestCorpse)
        tes3mp.LogMessage(enumerations.log.INFO,"PCP: corpse: "..playerName.."("..oldestCorpse..") in cell: "..oldestCorpseCell.." was deleted due to exceeding limit of "..maxCorpsesPerPlayer)
    end
end

function playerCorpsesPersist.getOldestCorpse(corpses)
    local oldestIndex
    for uniqueIndex,corpse in pairs(corpses) do
        local corpseMpNum = uniqueIndex:split("-")[2]
        if oldestIndex == nil then
            oldestIndex = uniqueIndex
        elseif corpseMpNum < oldestIndex:split("-")[2] then
            oldestIndex = uniqueIndex
        end
    end
    return oldestIndex
end

function playerCorpsesPersist.deathHandler(eventStatus,pid)
    local corpseIndex, corpseRefId = playerCorpsesPersist.spawnCorpse(pid)
    if maxCorpsesPerPlayer ~= -1 then
        playerCorpsesPersist.checkCorpseNum(pid)
    end
    playerCorpsesPersist.trackCorpse(pid,corpseIndex,corpseRefId)

end

function playerCorpsesPersist.deleteCorpse(playerName,cell,uniqueIndex)
    local unloadCell
    if LoadedCells[cell] == nil then
        logicHandler.LoadCell(cell)
        unloadCell = true
    end
    logicHandler.DeleteObjectForEveryone(cell,uniqueIndex)
    LoadedCells[cell]:DeleteObjectData(uniqueIndex)
    LoadedCells[cell]:RemoveLinkToRecord("npc",corpsesTracker[playerName].corpses[uniqueIndex].refId,uniqueIndex)
    if unloadCell then
        logicHandler.UnloadCell(cellDescription)
    end
    corpsesTracker[playerName].numCorpses = corpsesTracker[playerName].numCorpses - 1
    local newTable = {}
    for i,corpse in pairs(corpsesTracker[playerName].corpses) do
        if i == uniqueIndex then
        else
            newTable[i] = corpse
        end
    end
    corpsesTracker[playerName].corpses = newTable
    tableHelper.removeValue(WorldInstance.data.customVariables.playerCorpses,uniqueIndex)
    playerCorpsesPersist.saveCorpseTracker()
end

function playerCorpsesPersist.cleanCorpse(eventStatus,pid,cell,objects,players)
    if eventStatus.validCustomHandlers ~= false and disposeCorpses == true and not tableHelper.isEmpty(WorldInstance.data.customVariables.playerCorpses) then
        for uniqueIndex,object in pairs(objects) do
            if tableHelper.containsValue(WorldInstance.data.customVariables.playerCorpses, uniqueIndex) then
                if RecordStores["npc"].data.generatedRecords[object.refId].name ~= nil then
                    local playerName = RecordStores["npc"].data.generatedRecords[object.refId].name
                    playerCorpsesPersist.deleteCorpse(playerName,cell,uniqueIndex)
                    tes3mp.LogMessage(enumerations.log.INFO,"PCP: player: " ..logicHandler.GetChatName(pid).." deleted the corpse of: "..playerName.."("..uniqueIndex..") in cell: "..cell)
                end
            end
        end
    end
end

function playerCorpsesPersist.corpseValidator(eventStatus,pid,cell,objects,players)
    for uniqueIndex,object in pairs(objects) do
        if tableHelper.containsValue(WorldInstance.data.customVariables.playerCorpses, uniqueIndex) then
            return customEventHooks.makeEventStatus(false,nil)
        end
    end
end

function playerCorpsesPersist.init()
    if WorldInstance.data.customVariables.playerCorpses == nil then
        WorldInstance.data.customVariables.playerCorpses = {}
    end
end

customEventHooks.registerHandler("OnPlayerDeath",playerCorpsesPersist.deathHandler)

customEventHooks.registerValidator("OnObjectActivate",playerCorpsesPersist.corpseValidator)
customEventHooks.registerHandler("OnObjectActivate",playerCorpsesPersist.cleanCorpse)
customEventHooks.registerHandler("OnServerPostInit",playerCorpsesPersist.init)
