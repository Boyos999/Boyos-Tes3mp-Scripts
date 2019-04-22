local playerPacketHelper = {}
--[[
proper formatting of add/remove itemTable entries (only refid is mandatory)
{ refid = "refid", count = #,charge = #, enchantmentCharge = #, soul = #}

add/remove spellbook entries
{"spellId","spellId","spellId"}
]]--

function playerPacketHelper.addPlayerItems(pid, itemTable)
    for _,item in pairs(itemTable) do
        if item.count == nil or item.count <= 0 then
            item.count = 1
        end
        inventoryHelper.addItem(Players[pid].data.inventory, item.refId, item.count, item.charge, item.enchantmentCharge, item.soul)
    end
    playerPacketHelper.sendInventoryChanges(pid, itemTable, enumerations.inventory.ADD)
end

function playerPacketHelper.addPlayerSpells(pid, spellList)
    local newSpellList = {}
    for _,spell in pairs(spellList) do
        if tableHelper.containsValue(Players[pid].data.spellbook, spell) then
            tes3mp.LogMessage(enumerations.log.INFO, "Player already knows spell: " .. spell .. ", ignoring")
        else
            table.insert(Players[pid].data.spellbook, spell)
            table.insert(newSpellList, spell)
        end
    end
    playerPacketHelper.sendSpellbookChanges(pid, newSpellList, enumerations.spellbook.ADD)
end

function playerPacketHelper.removePlayerItems(pid, itemTable)
    for _,item in pairs(itemTable) do
        if item.count == nil or item.count <= 0 then
            item.count = 1
        end
        inventoryHelper.removeClosestItem(Players[pid].data.inventory, item.refId, item.count, item.charge, item.enchantmentCharge, item.soul)
    end
    playerPacketHelper.sendInventoryChanges(pid, itemTable, enumerations.inventory.REMOVE)
end

function playerPacketHelper.removePlayerSpells(pid, spellList)
    local newSpellList = {}
    for _,spell in pairs(spellList) do
        if tableHelper.containsValue(Players[pid].data.spellbook, spell) then
            tableHelper.removeValue(Players[pid].data.spellbook, spell)
            table.insert(newSpellList, spell)
        else
            tes3mp.LogMessage(enumerations.log.INFO, "Player doesn't know spell: " .. spell .. ", ignoring")
        end
    end
    playerPacketHelper.sendSpellbookChanges(pid, newSpellList, enumerations.spellbook.REMOVE)
end

function playerPacketHelper.sendInventoryChanges(pid, packetTable, enumeration)
    tes3mp.ClearInventoryChanges(pid)
    tes3mp.SetInventoryChangesAction(pid, enumeration)
    for _,item in pairs(packetTable) do
        packetBuilder.AddPlayerInventoryItemChange(pid, item)
    end
    tes3mp.SendInventoryChanges(pid)
end

function playerPacketHelper.sendSpellbookChanges(pid, spellList, enumeration)
    if tableHelper.isEmpty(spellList) == false then
        tes3mp.ClearSpellbookChanges(pid)
        tes3mp.SetSpellbookChangesAction(pid, enumeration)
        for _,spell in pairs(spellList) do
            tes3mp.AddSpell(pid, spell)
        end
        tes3mp.SendSpellbookChanges(pid)
    end
end

--[[
Testing functions

function playerPacketHelper.testAddFunc(pid, cmd)
    local testInventoryTable = {}
    local testSpellTable = {"absorb agility","absorb endurance","absorb health"}
    table.insert(testInventoryTable, {refId = "iron dagger"})
    table.insert(testInventoryTable, {refId = "iron spider dagger",count = 2})
    playerPacketHelper.addPlayerItems(pid, testInventoryTable)
    playerPacketHelper.addPlayerSpells(pid,testSpellTable)
end

function playerPacketHelper.testRemoveFunc(pid, cmd)
    local testInventoryTable = {}
    local testSpellTable = {"absorb agility","absorb endurance","absorb health"}
    table.insert(testInventoryTable, {refId = "iron dagger"})
    table.insert(testInventoryTable, {refId = "iron spider dagger",count = 2})
    playerPacketHelper.removePlayerItems(pid, testInventoryTable)
    playerPacketHelper.removePlayerSpells(pid, testSpellTable)
end

customCommandHooks.registerCommand("testpph", playerPacketHelper.testAddFunc)
customCommandHooks.registerCommand("untestpph", playerPacketHelper.testRemoveFunc)
]]--
return playerPacketHelper