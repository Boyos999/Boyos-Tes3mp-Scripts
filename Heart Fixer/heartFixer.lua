local heartFixer = {}

--These may be different if you have mods that
--makes changes to the cell "Akulakhan's Chamber"
local akulakhanUniqueIndex = "197818-0"
local dagothBridgeUniqueIndex = "197672-0"
local heartVoice = {'Say "vo\\misc\\Hit Heart 1.wav" "What are you doing?"',
                    'Say "vo\\misc\\Hit Heart 2.wav" "WHAT ARE YOU DOING?!"',
                    'Say "vo\\misc\\Hit Heart 3.wav" "FOOL!"',
                    'Say "vo\\misc\\Hit Heart 4.wav" "STOP!"',
                    'Say "vo\\misc\\Hit Heart 6.wav" "This is the end. The bitter, bitter end."'
}

function heartFixer.scriptGlobal(eventStatus, pid, variables)
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        for id, variable in pairs(variables) do
            if id == "heartdestroyed" and variable.intValue == 1 then
                tes3mp.LogMessage(enumerations.log.INFO, "HeartFixer: Running end game script")
                heartFixer.endGame(pid)
            end
        end
    end
end

function heartFixer.endGame(pid)
    --Assume shared journal for now
    if LoadedCells["Akulakhan's Chamber"] ~= nil then
        --Update journal, journal sharing settings will handle this
        logicHandler.RunConsoleCommandOnPlayer(pid, "journal C3_DestroyDagoth 20", false)
        logicHandler.RunConsoleCommandOnPlayer(pid, "ModReputation 10", false)
        logicHandler.RunConsoleCommandOnPlayer(pid, "set DestroyBlight to -1", false)
        --Kill dagoth ur
        for uniqueIndex, object in pairs(LoadedCells["Akulakhan's Chamber"].data.objectData) do
            if object.refId == "dagoth_ur_2" then
                logicHandler.RunConsoleCommandOnObject(pid, "SetHealth 0", "Akulakhan's Chamber", uniqueIndex, true)
            end
        end
        --Re-enable teleporting for players
        for _,pid in pairs(LoadedCells["Akulakhan's Chamber"].visitors) do
            logicHandler.RunConsoleCommandOnPlayer(pid, "EnableTeleporting", false)
        end
        --Update Weather
        logicHandler.RunConsoleCommandOnPlayer(pid, 'ModRegion "red mountain region" 50 50 0 0 0 0 0 0', true)
        logicHandler.RunConsoleCommandOnPlayer(pid, 'ChangeWeather "red mountain region" 0', true)
        --akulakhan
        logicHandler.RunConsoleCommandOnObject(pid, "PlayGroup, Death1", "Akulakhan's Chamber", akulakhanUniqueIndex, true)
        --bridge collapses 10 seconds after the akulakhan animation starts
        bridgeTimer = tes3mp.CreateTimerEx("heartFixerTimerEnd",1000 * 10, "i", pid)
        tes3mp.StartTimer(bridgeTimer)
    end
end

function heartFixerTimerEnd(pid)
    --bridge, make sure player didn't sprint out of the room
    if LoadedCells["Akulakhan's Chamber"] ~= nil then
        logicHandler.RunConsoleCommandOnObject(pid, "PlayGroup, Death1", "Akulakhan's Chamber", dagothBridgeUniqueIndex, true)
    end
end

function heartFixer.scriptOverride()
    local recordStore = RecordStores["activator"]
    recordStore.data.permanentRecords["dagoth destroy detector"] = {
        baseId = "dagoth destroy detector",
        script = ""
    }
    --This is so the # of times hit is synced and also so the heart dies properly
    table.insert(config.synchronizedClientScriptIds, "LorkhanHeart")
    tes3mp.LogMessage(enumerations.log.INFO, "HeartFixer: Added record to disable dagoth destroy detector")
end

function heartFixer.scriptLocal(eventStatus, pid, cellDescription, objects, players)
    if cellDescription == "Akulakhan's Chamber" and eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        for uniqueIndex, object in pairs(objects) do
            if object.refId == "heart_akulakhan" and object.variables ~= nil and object.variables[0] ~= nil then
                local variableTable = object.variables[0]
                if type(variableTable) == "table" then
                    for internalIndex, value in pairs(variableTable) do
                        if internalIndex == 2 and value > 0 and value <=5 then
                            for _,visitorPid in pairs(LoadedCells[cellDescription].visitors) do
                                if visitorPid ~= pid then
                                    logicHandler.RunConsoleCommandOnPlayer(visitorPid, heartVoice[value])
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

customEventHooks.registerHandler("OnClientScriptGlobal",heartFixer.scriptGlobal)
customEventHooks.registerHandler("OnServerPostInit",heartFixer.scriptOverride)
customEventHooks.registerHandler("OnClientScriptLocal",heartFixer.scriptLocal)

return heartFixer