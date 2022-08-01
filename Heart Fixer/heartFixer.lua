local heartFixer = {}

--These may be different if you have mods that
--makes changes to the cell "Akulakhan's Chamber"
local akulakhanUniqueIndex = "197818-0"
local dagothBridgeUniqueIndex = "197672-0"
local dagothVoice = {
    {
        sound = "vo\\misc\\Hit Heart 1.wav",
        message = "What are you doing?"
    },
    {
        sound = "vo\\misc\\Hit Heart 2.wav",
        message = "WHAT ARE YOU DOING?!"
    },
    {
        sound = "vo\\misc\\Hit Heart 3.wav",
        message = "FOOL!"
    },
    {
        sound = "vo\\misc\\Hit Heart 4.wav",
        message = "STOP!"
    },
    {
        sound = "vo\\misc\\Hit Heart 6.wav",
        message = "This is the end. The bitter, bitter end."
    }
}
--what the sounds are named
local recordPrefix = "hf_dagoth_heart_"
--Modified LorkhanHeart script to remove redundant "Say" commands
local heartScript = 'begin LorkhanHeart\n\nshort sunderHit\n\nshort keeningHit\n\nshort countHits\n\nshort countSays\n\nshort doOnce\n\n\n\nif ( menumode == 1 )\n\treturn\nendif\n\nif ( HeartDestroyed == 1 )\n\tif ( doOnce == 2 )\n\t\treturn\n\tendif\n\n\tif ( CellChanged == 1 )\n\t\tDisable\n\t\tSet doOnce to 2\n\tendif\n\n\tif ( CellChanged == 0 )\n\t\tif ( GetSoundPlaying "endrumble" == 0 )\n\n\t\t\tPlayLoopSound3D "endrumble"\n\t\tendif\n\tendif\n\tif ( GetSoundPlaying "heart" == 1 )\n\t\tStopSound "heart"\n\tendif\n\tif ( GetSoundPlaying "heartSunder" == 1 )\n\t\tStopSound "heartSunder"\n\tendif\n\n\treturn\nendif\n\nif ( sunderHit == 0 )\n\tSet sunderHit to HitOnMe Sunder\nendif\n\nSet keeningHit to HitOnMe Keening\nSetHealth 5000\n\nif ( doOnce == 0 )\n\tif ( GetDistance Player < 500 )\n\t\t"dagoth_ur_2"->PositionCell -40 2590 -180 320 "Akulakhan\'s Chamber"\n\t\t"dagoth_ur_2"->StartCombat Player\n\tSet doOnce to 1\n\tendif\nendif\n\n\nif ( sunderHit == 1 )\n\tif ( HeartDestroyed == 0 )\n\t\tif ( CellChanged == 0 )\n\t\t\tif ( GetSoundPlaying "heartSunder" == 0 )\n\n\t\t\tPlayLoopSound3D "heartsunder"\n\t\t\tendif\n\t\tendif\n\tendif\nelse\n\tif ( CellChanged == 0 )\n\t\tif ( GetSoundPlaying "heart" == 0 )\n\t\t\tPlayLoopSound3D, "heart"\n\t\tendif\n\tendif\n\treturn\nendif\n\nif ( keeningHit == 0 )\n\treturn\nendif\n\n\nSet countHits to ( countHits + 1 )\n\nif ( countHits == 0 )\n\tif ( countSays != 0 )\n\t\tSet countSays to 0\n\tendif\n\treturn\nendif\n\nif ( countHits == 1 )\n\tif ( countSays == 0 )\n\t\t"dagoth_ur_2"->SetFight 100\n\t\t"dagoth_ur_2"->StartCombat Player\n\t\tSet countSays to 1\n\tendif\n\tPlayGroup Idle2\nendif\n\nif ( countHits == 2 )\n\tif ( countSays == 1 )\n\t\tSet countSays to 2\n\tendif\n\tPlayGroup Idle3\nendif\n\nif ( countHits == 3 )\n\tif ( countSays == 2 )\n\t\tSet countSays to 3\n\tendif\n\tPlayGroup Idle4\nendif\n\nif ( countHits == 4 )\n\tif ( countSays == 3 )\n\t\tSet countSays to 4\n\tendif\n\tPlayGroup Idle5\nendif\n\nif ( countHits > 4 )\n\tif ( countSays == 4 )\n\t\tSet countSays to 5\n\tendif\n\tif ( GetSoundPlaying "heart" == 1 )\n\t\tStopSound "heart"\n\tendif\n\tif ( GetSoundPlaying "heartSunder" == 1 )\n\t\tStopSound "heartSunder"\n\tendif\n\tPlayGroup Death1\n\tset HeartDestroyed to 1\nendif\n\nEnd'

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
    RecordStores["activator"].data.permanentRecords["dagoth destroy detector"] = {
        baseId = "dagoth destroy detector",
        script = ""
    }
    RecordStores["script"].data.permanentRecords["lorkhanheart"] = {
        scriptText = heartScript
    }
    for i,voiceLine in pairs(dagothVoice) do
        local id = recordPrefix .. i
        RecordStores["sound"].data.permanentRecords[id] = {
            sound = voiceLine.sound,
            volume = 1,
            pitch = 1
        }
    end
    --This is so the # of times hit is synced and also so the heart dies properly
    table.insert(config.synchronizedClientScriptIds, "LorkhanHeart")
    tes3mp.LogMessage(enumerations.log.INFO, "HeartFixer: Loaded custom record overrides")
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
                                logicHandler.RunConsoleCommandOnPlayer(visitorPid, "playsoundVP "..recordPrefix..value.." 100 1")
                                tes3mp.MessageBox(visitorPid,-1,dagothVoice[value].message)
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