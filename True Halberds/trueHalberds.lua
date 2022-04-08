local trueHalberds = {}

require("custom.trueHalberdsConfig")

function trueHalberds.initRecords()
    if WorldInstance.data.customVariables.trueHalberdsInit == nil or WorldInstance.data.customVariables.trueHalberdsInit ~= 1 then

        local chopMult = trueHalberdsConfig.damageMult.chop
        local slashMult = trueHalberdsConfig.damageMult.slash
        local thrustMult = trueHalberdsConfig.damageMult.thrust
        local speedMult = trueHalberdsConfig.speedMult
        local reachMult = trueHalberdsConfig.reachMult
        local weightMult = trueHalberdsConfig.weightMult

        local recordStore = RecordStores["weapon"]

        for id,weapon in pairs(trueHalberdsConfig.halberds) do
            local recordData = {
                baseId = id,
                speed = weapon.speed*speedMult,
                reach = weapon.reach*reachMult,
                weight = weapon.weight*weightMult,
                damageChop = { min = math.floor(weapon.damageChop.min*chopMult), max = math.floor(weapon.damageChop.max*chopMult) },
                damageSlash = { min = math.floor(weapon.damageSlash.min*slashMult), max = math.floor(weapon.damageSlash.max*slashMult) },
                damageThrust = { min = math.floor(weapon.damageThrust.min*thrustMult), max = math.floor(weapon.damageThrust.max*thrustMult) }
            }
            recordStore.data.permanentRecords[id] = recordData
            tes3mp.LogMessage(enumerations.log.INFO,"TH: Created permanent record for halberd: "..id)
        end
    
        WorldInstance.data.customVariables.trueHalberdsInit = 1
        recordStore:QuicksaveToDrive()
        WorldInstance:QuicksaveToDrive()
    end
end

function trueHalberds.reset(pid)
    if Players[pid].data.settings.staffRank >= trueHalberdsConfig.staffRankReq then
        WorldInstance.data.customVariables.trueHalberdsInit = 0
        WorldInstance:QuicksaveToDrive()
        Players[pid]:Message(color.Red .. "Halberd stats will be reset next time the server starts.")
    end
end

customCommandHooks.registerCommand("truehalberdsreset",trueHalberds.reset)

customEventHooks.registerHandler("OnServerPostInit",trueHalberds.initRecords)

return trueHalberds