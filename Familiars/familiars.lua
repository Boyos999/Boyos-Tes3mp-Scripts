local familiars = {}
require("custom.familiarsConfig")

function familiars.isInvFamiliar(refId)
    for id,familiar in pairs(familiarsConfig.familiars) do
        if id..familiarsConfig.appendInv == refId then
            return id
        end
    end
    return false
end

function familiars.OnObjectPlaceValidator(eventStatus, pid, cellDescription, objects, targetPlayers)
    for _,object in pairs(objects) do
        local familiarId = familiars.isInvFamiliar(object.refId)
        if familiarId ~= false then
            --This is a familiar inventory item being placed
            local famUniqueIndex = logicHandler.CreateObjectAtLocation(cellDescription, object.location, {refId = familiarId}, "spawn")
            logicHandler.SetAIForActor(LoadedCells[cellDescription], famUniqueIndex, enumerations.ai.FOLLOW, pid)
            table.insert(Players[pid].data.customVariables.familiars.active, famUniqueIndex)
            
            return customEventHooks.makeEventStatus(false,nil)
        end
    end
end

function familiars.OnObjectActivateValidator(eventStatus, pid, cellDescription, objects, targetPlayers)
    for _,object in pairs(objects) do
        if familiarsConfig.familiars[object.refId] ~= nil then
            --This is a familiar being activated
            if Players[pid].data.customVariables.familiars ~= nil then
                if tableHelper.containsValue(Players[pid].data.customVariables.familiars.active, object.uniqueIndex) then
                    --This familiar belongs to the player activating it
                    logicHandler.DeleteObject(pid, cellDescription, object.uniqueIndex, true)
                    inventoryHelper.addItem(Players[pid].data.inventory, object.refId..familiarsConfig.appendInv, 1, -1, -1, "")
                    Players[pid]:LoadItemChanges({{refId = object.refId..familiarsConfig.appendInv, count = 1, charge = -1, enchantmentCharge = -1, soul = ""}},enumerations.inventory.ADD)
                end
            end
            --Prevent players from looting familiar corpses
            return customEventHooks.makeEventStatus(false,nil)
        end
    end
end

function familiars.initRecords()
    local creatureStore = RecordStores["creature"]
    local miscStore = RecordStores["miscellaneous"]
    local appendInv = familiarsConfig.appendInv
    local recordBuilt = false

    for id, familiar in pairs(familiarsConfig.familiars) do
        if creatureStore.data.permanentRecords[id] == nil then
            creatureStore.data.permanentRecords[id] = {
                baseId = familiar.baseId,
                name = familiar.name,
                aiFight = 0,
                aiAlarm = 0,
                aiFlee = 0,
                damageChop = { min = 0, max = 0},
                damageSlash = { min = 0, max = 0},
                damageThrust = { min = 0, max = 0},
                health = 20,
                magicka = 0,
                scale = familiar.scale,
                script = ""
            }
            recordBuilt = true
        end
        if miscStore.data.permanentRecords[id..appendInv] == nil then
            miscStore.data.permanentRecords[id..appendInv] = {
                name = familiar.name,
                icon = familiar.icon,
                model = "m\\Text_Octavo_08.nif"
            }
            recordBuilt = true
        end
    end

    if recordBuilt then
        creatureStore:Save()
        miscStore:Save()
    end
end

function familiars.addFamiliarToPlayer(pid, familiarId)
    if Players[pid].data.customVariables.familiars == nil then
        Players[pid].data.customVariables.familiars = {
            ids = {},
            active = {}
        }
    end

    if Players[pid].data.customVariables.familiars.ids[familiarId] == nil then
        Players[pid].data.customVariables.familiars.ids[familiarId] = {count = 1}
    else
        Players[pid].data.customVariables.familiars.ids[familiarId].count = Players[pid].data.customVariables.familiars.ids[familiarId].count + 1
    end

    inventoryHelper.addItem(Players[pid].data.inventory, familiarId..familiarsConfig.appendInv, 1, -1, -1, "")
    Players[pid]:LoadItemChanges({{refId = familiarId..familiarsConfig.appendInv, count = 1, charge = -1, enchantmentCharge = -1, soul = ""}},enumerations.inventory.ADD)
end

function familiars.commandHandler(pid, cmd)
    if Players[pid].data.settings.staffRank >= familiarsConfig.staffRankRequired then
        local message = ""
        if cmd[2] ~= nil then
            if cmd[2] == "help" then
                message = familiarsConfig.helpText
            elseif cmd[2] == "give" then
                if cmd[3] ~= nil and cmd[4] ~= nil then
                    local targetPid = tonumber(cmd[3])
                    if Players[targetPid] ~= nil and familiarsConfig.familiars[cmd[4]] ~= nil then
                        familiars.addFamiliarToPlayer(targetPid,cmd[4])
                        message = color.Green .. "Added " ..cmd[4].." to "..logicHandler.GetChatName(targetPid)
                    else
                        message = familiarsConfig.badCmdMsg
                    end
                else
                    message = familiarsConfig.badCmdMsg
                end
            end
        else
            message = familiarsConfig.badCmdMsg
        end
        Players[pid]:Message(message)
    end
end

customEventHooks.registerValidator("OnObjectPlace",familiars.OnObjectPlaceValidator)
customEventHooks.registerValidator("OnObjectActivate",familiars.OnObjectActivateValidator)

customEventHooks.registerHandler("OnServerPostInit",familiars.initRecords)

customCommandHooks.registerCommand("familiar",familiars.commandHandler)

return familiars