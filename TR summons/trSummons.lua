local trSummons = {}

require("custom.trSummonsConfig")

function trSummons.isSummonSpell(refId)
    if trSummonsConfig.summonRecords[refId] ~= nil then
        return true
    end
    return false
end

function trSummons.hasSummon(pid, refId)
    if Players[pid].summons ~= nil then
        for summonUniqueIndex, summonRefId in pairs(Players[pid].summons) do
            if summonRefId == refId then
                return summonUniqueIndex
            end
        end
    end
    return false
end

function trSummons.spawnSummon(pid, summonRefId)
    --Check for and remove a previous summon from this spell
    local existingSummon = trSummons.hasSummon(pid, summonRefId)
    if existingSummon ~= false then
        trSummons.removeSummon(pid, summonRefId, existingSummon)
    end

    local summonUniqueIndex = logicHandler.CreateObjectAtPlayer(pid, {refId = summonRefId}, "spawn")
    logicHandler.SetAIForActor(LoadedCells[Players[pid].data.location.cell], summonUniqueIndex, enumerations.ai.FOLLOW, pid)
    Players[pid].summons[summonUniqueIndex] = summonRefId
    tes3mp.LogMessage(enumerations.log.INFO, trSummonsConfig.logPrefix .. logicHandler.GetChatName(pid) .. " summoned " .. summonRefId .. "(".. summonUniqueIndex..")")
end

function trSummons.removeSummon(pid, refId, uniqueIndex)
    --Get unique index if not passed to function
    if uniqueIndex == nil then
        uniqueIndex = trSummons.hasSummon(pid, refId)
    end

    if uniqueIndex ~= false then 
        --Remove from player summons table
        local newSummonTable = {}
        for summonUniqueIndex, summonRefId in pairs(Players[pid].summons) do
            if summonUniqueIndex ~= uniqueIndex then
                newSummonTable[summonUniqueIndex] = summonRefId
            end
        end
        Players[pid].summons = tableHelper.deepCopy(newSummonTable)

        --Delete from world
        local cell = logicHandler.GetCellContainingActor(uniqueIndex)
        if cell ~= nil then
            cell:DeleteObjectData(uniqueIndex)
            logicHandler.DeleteObjectForEveryone(cell.description, uniqueIndex)
        end
        tes3mp.LogMessage(enumerations.log.INFO, trSummonsConfig.logPrefix .. "Removed "..logicHandler.GetChatName(pid).."'s summoned creature " .. refId .. "(".. uniqueIndex..")")
    end
end

function trSummons.OnPlayerSpellsActive(eventStatus,pid,playerPacket)
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        local action = playerPacket.action
        local spells = playerPacket.spellsActive

        for spellId,spellTable in pairs(spells) do
            if trSummons.isSummonSpell(spellId) then
                if action == enumerations.spellbook.ADD then
                    trSummons.spawnSummon(pid, trSummonsConfig.summonMap[spellId])
                elseif action == enumerations.spellbook.REMOVE then
                    trSummons.removeSummon(pid, trSummonsConfig.summonMap[spellId])
                end
            end
        end
    end
end

function trSummons.initRecords()
    local recordStore = RecordStores["spell"]
    for id,spell in pairs(trSummonsConfig.summonRecords) do
        recordStore.data.permanentRecords[id] = spell
        tes3mp.LogMessage(enumerations.log.VERBOSE, trSummonsConfig.logPrefix .. "Initialized record for spell "..id)
    end
    recordStore:QuicksaveToDrive()
    tes3mp.LogMessage(enumerations.log.INFO, trSummonsConfig.logPrefix .. "Initialized custom records")
end

--Handle summoning/desummoning by spell effect
customEventHooks.registerHandler("OnPlayerSpellsActive",trSummons.OnPlayerSpellsActive)
--Generate records
customEventHooks.registerHandler("OnServerPostInit",trSummons.initRecords)

return trSummons