local coopInstruments = {}
require("custom.coopInstrumentsConfig")

function coopInstruments.OnObjectActivate(eventStatus, pid, cellDescription, objects, players)
    for _,object in pairs(objects) do
        if coopInstruments.isInstrument(object.refId) then
            local instrument = coopInstrumentsConfig.instruments[object.refId]
            coopInstruments.playSound(pid, cellDescription, object.uniqueIndex, instrument.sound)
            return customEventHooks.makeEventStatus(instrument.allowActivate, nil)

        elseif coopInstruments.isDulcimer(object.refId) then
            local dulcimer = coopInstrumentsConfig.trdulcimers[object.refId]
            local stage = Players[pid].data.customVariables.ciDulcimer

            if stage == nil then
                stage = 1
            end

            local sound = dulcimer.sounds[stage]

            coopInstruments.playSound(pid, cellDescription, object.uniqueIndex, sound)

            stage = stage + 1
            Players[pid].data.customVariables.ciDulcimer = stage

            return customEventHooks.makeEventStatus(dulcimer.allowActivate, nil)
        end

    end
end

function coopInstruments.playSound(pid, cellDescription, uniqueIndex, sound)
    logicHandler.RunConsoleCommandOnObject(pid, "playsound3d "..sound, cellDescription, uniqueIndex, true)
end

--function coopInstruments.handleDulcimer(uniqueIndex, sound )

function coopInstruments.isInstrument(refId)
    if coopInstrumentsConfig.instruments[refId] ~= nil then
        return true
    end
    return false
end

--These need to be handled separately because more complicated
function coopInstruments.isDulcimer(refId)
    if coopInstrumentsConfig.trdulcimers[refId] ~= nil then
        return true
    end
    return false
end

customEventHooks.registerValidator("OnObjectActivate",coopInstruments.OnObjectActivate)
