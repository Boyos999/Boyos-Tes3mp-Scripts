local trSummons = {}

require("custom.trSummonsConfig")

local creatureIdList = {}

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
                    trSummons.spawnSummon(pid, trSummonsConfig.summonMap[spellId] .. "sm")
                elseif action == enumerations.spellbook.REMOVE then
                    trSummons.removeSummon(pid, trSummonsConfig.summonMap[spellId] .. "sm")
                end
            end
        end
    end
end

function trSummons.OnActorDeath(eventStatus,pid,cellDescription,actors)
    if eventStatus.validDefaultHandler then
        for uniqueIndex, actor in pairs(actors) do
            local refId = actor.refId
            if refId ~= nil then
                if creatureIdList[refId] ~= nil then
                    for id, player in pairs(Players) do
                        if player.summons ~= nil then
                            if player.summons[uniqueIndex] ~= nil then
                                trSummons.removeSummon(id, refId, uniqueIndex)
                            end
                        end
                    end
                end
            end
        end
    end
end

function trSummons.initRecords()
    for id,spell in pairs(trSummonsConfig.summonRecords) do
        RecordStores["spell"].data.permanentRecords[id] = spell
        tes3mp.LogMessage(enumerations.log.VERBOSE, trSummonsConfig.logPrefix .. "Initialized record for spell "..id)
    end
    for spellId, creatureId in pairs(trSummonsConfig.summonMap) do
        RecordStores["creature"].data.permanentRecords[creatureId.."sm"] = {
            baseId = creatureId,
            aiFight = 30
        }
        creatureIdList[creatureId.."sm"] = {
            isTrSummon = true
        }
        tes3mp.LogMessage(enumerations.log.VERBOSE, trSummonsConfig.logPrefix .. "Initialized record for creature "..creatureId.."sm")
    end
    RecordStores["spell"]:QuicksaveToDrive()
    RecordStores["creature"]:QuicksaveToDrive()
    tes3mp.LogMessage(enumerations.log.INFO, trSummonsConfig.logPrefix .. "Initialized custom records")
end

--Handle summoning/desummoning by spell effect
customEventHooks.registerHandler("OnPlayerSpellsActive",trSummons.OnPlayerSpellsActive)
--Handle removing summons on death
customEventHooks.registerHandler("OnActorDeath",trSummons.OnActorDeath)
--Generate records
customEventHooks.registerHandler("OnServerPostInit",trSummons.initRecords)

return trSummons