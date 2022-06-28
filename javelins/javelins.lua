local javelins = {}

require("custom.javelinsConfig")

local javelinsTable = javelinsConfig.baseSpears
local craftItem = javelinsConfig.craftItem
local menuOrder = javelinsConfig.menuOrder

function javelins.OnPlayerItemUse(eventStatus, pid, refId)
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        if refId == craftItem.id then
            --Generate javelin crafting menu based on player inventory
            javelins.generateMenu(pid)
            Players[pid].currentCustomMenu = "javMain" .. pid
            menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
        end
    end
end

function javelins.craftJavelins(pid,spearRefId,itemCount)
    local itemCount = tonumber(itemCount)
    local javelinId = javelinsTable[spearRefId].id
    inventoryHelper.removeItem(Players[pid].data.inventory,spearRefId, itemCount)
    Players[pid]:LoadItemChanges({{refId = spearRefId, count = itemCount}},enumerations.inventory.REMOVE)

    inventoryHelper.addItem(Players[pid].data.inventory,javelinsTable[spearRefId].id, itemCount)
    Players[pid]:LoadItemChanges({{refId = javelinId, count = itemCount}},enumerations.inventory.ADD)

    tes3mp.LogMessage(enumerations.log.INFO, "Jav: "..logicHandler.GetChatName(pid).." Crafted "..itemCount.." "..craftItem.id.."from "..spearRefId)

    javelins.generateMenu(pid)
end

function javelins.generateMenu(pid)
    local invSpears = {}
    Menus["javMain"..pid] = {
        text = "Craft Javelins",
        buttons = {}
    }
    local exitButton = { 
        caption = color.Red .. "Exit",
        destinations = {
            menuHelper.destinations.setDefault(nil)
        }
    }
    for _,spearRefId in pairs(menuOrder) do
        index = inventoryHelper.getItemIndex(Players[pid].data.inventory,spearRefId)
        if index ~= nil then
            local button = {
                caption = javelinsTable[spearRefId].name,
                destinations = {
                    menuHelper.destinations.setDefault("javCraft"..spearRefId..pid)
                }
            }
            table.insert(Menus["javMain"..pid].buttons,button)

            local count = Players[pid].data.inventory[index].count
            Menus["javCraft"..spearRefId..pid] = {
                text = "Craft amount",
                buttons = {}
            }
            for val=1,count do
                local valButton = {
                    caption = val,
                    destinations = {
                        menuHelper.destinations.setDefault("javMain"..pid,
                        {
                            menuHelper.effects.runGlobalFunction("javelins","craftJavelins",{menuHelper.variables.currentPid(),spearRefId,val})
                        })
                    }
                }
                table.insert(Menus["javCraft"..spearRefId..pid].buttons, valButton)
            end
            table.insert(Menus["javCraft"..spearRefId..pid].buttons,exitButton)
        end
    end

    table.insert(Menus["javMain"..pid].buttons,exitButton)
    tes3mp.LogMessage(enumerations.log.INFO, "Jav: Generated crafting menu for "..logicHandler.GetChatName(pid))
end

function javelins.OnServerPostInit()
    if WorldInstance.data.customVariables.javelinsInit == nil or WorldInstance.data.customVariables.javelinsInit ~= 1 then
        local javSpeed = javelinsConfig.speed
        local damageMult = javelinsConfig.damageMult
        local weaponType = javelinsConfig.subType
        local recordStore = RecordStores["weapon"]

        for javBaseId, item in pairs(javelinsTable) do
            local recordData = {
                baseId = javBaseId,
                speed = javSpeed,
                name = item.name,
                subtype = weaponType,
                damageChop = {
                    min = math.floor(item.damage.min*damageMult),
                    max = math.floor(item.damage.max*damageMult)
                }
                flags = item.flags
            }
            recordStore.data.permanentRecords[item.id] = recordData
            tes3mp.LogMessage(enumerations.log.INFO, "Jav: Created permanent record for: "..item.id)
        end

        RecordStores["miscellaneous"].data.permanentRecords[craftItem.id] = {
            name = craftItem.name,
            icon = craftItem.icon,
            model = craftItem.model
        }
        tes3mp.LogMessage(enumerations.log.INFO, "Jav: Created permanent record for: "..craftItem.id)
        WorldInstance.data.customVariables.javelinsInit = 1
        recordStore:QuicksaveToDrive()
        WorldInstance:QuicksaveToDrive()
    end
end

customEventHooks.registerHandler("OnPlayerItemUse",javelins.OnPlayerItemUse)
customEventHooks.registerHandler("OnServerPostInit",javelins.OnServerPostInit)

return javelins