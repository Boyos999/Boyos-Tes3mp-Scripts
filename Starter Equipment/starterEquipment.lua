--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts

--This script will add some starting gear to the player's inventory after finishing character creation based on the
--values of their skills

require("custom.starterEquipmentConfig")

local starterEquipment = {}

function starterEquipment.GetHighestWeapon(pid)
    --[[
    weapon priority to reduce item spam (marksman not included)
    long blade (5)
    axe (6)
    blunt (4)
    spear (7)
    short blade (22)
    ]]--
    local highest = 5
    if tes3mp.GetSkillBase(pid, 6) > tes3mp.GetSkillBase(pid,highest) then
        highest = 6
    end
    if tes3mp.GetSkillBase(pid, 4) > tes3mp.GetSkillBase(pid,highest) then
        highest = 4
    end
    if tes3mp.GetSkillBase(pid, 7) > tes3mp.GetSkillBase(pid,highest) then
        highest = 7
    end
    if tes3mp.GetSkillBase(pid, 22) > tes3mp.GetSkillBase(pid,highest) then
        highest = 22
    end
    return highest
end

function starterEquipment.GetHighestArmor(pid)
    --[[
    Armor priority to reduce item spam
    Heavy armor (3)
    medium armor (2)
    Light armor (21)
    ]]--
    local highest = 3
    if tes3mp.GetSkillBase(pid, 2) > tes3mp.GetSkillBase(pid,highest) then
        highest = 2
    end
    if tes3mp.GetSkillBase(pid, 21) > tes3mp.GetSkillBase(pid,highest) then
        highest = 21
    end
    return highest
end

function starterEquipment.GiveItems(pid,items)
    if items ~= nil then
        for _,item in pairs(items) do
            inventoryHelper.addItem(Players[pid].data.inventory, item.refId, item.count)
        end
        Players[pid]:LoadItemChanges(items,enumerations.inventory.ADD)
    end
end

function starterEquipment.IsWeapon(skill)
    if tableHelper.containsValue(starterEquipmentConfig.weaponArray,skill) then
        return true
    else
        return false
    end
end

function starterEquipment.IsArmor(skill)
    if tableHelper.containsValue(starterEquipmentConfig.armorArray,skill) then
        return true
    else
        return false
    end
end

function starterEquipment.CheckHighest(skill,highestWeapon,highestArmor)
    if starterEquipment.IsWeapon(skill) then
        if starterEquipmentConfig.giveHighestWeapon then
            if skill == highestWeapon then
                return true
            else
                return false
            end
        end
    end
    if starterEquipment.IsArmor(skill) then
        if starterEquipmentConfig.giveHighestArmor then
            if skill == highestArmor then
                return true
            else
                return false
            end
        end
    end
    
    return true
end

function starterEquipment.MergeItemTables(baseTable,addTable)
    if addTable ~= nil and baseTable ~= nil then
        for _,item in pairs(addTable) do
            table.insert(baseTable,item)
        end
    end
    return baseTable
end

function starterEquipment.GiveStarterItems(eventStatus, pid)
    local major = starterEquipmentConfig.majorThreshold
    local minor = starterEquipmentConfig.minorThreshold
    local highestWeapon = starterEquipmentConfig.skillArray[starterEquipment.GetHighestWeapon(pid)+1]
    local highestArmor = starterEquipmentConfig.skillArray[starterEquipment.GetHighestArmor(pid)+1]
    local starterTable = tableHelper.deepCopy(starterEquipmentConfig.baseItems)

    for i,skill in pairs(starterEquipmentConfig.skillArray) do
        local index = i-1
        if tes3mp.GetSkillBase(pid,index) >= major then
            if skill == "block" then
                starterTable = starterEquipment.MergeItemTables(starterTable,starterEquipmentConfig.rewardTable[skill].major[highestArmor])
            elseif starterEquipment.CheckHighest(skill,highestWeapon,highestArmor) then
                starterTable = starterEquipment.MergeItemTables(starterTable,starterEquipmentConfig.rewardTable[skill].major)
            end
        elseif tes3mp.GetSkillBase(pid,index) >= minor then
            if skill == "block" then
                starterTable = starterEquipment.MergeItemTables(starterTable,starterEquipmentConfig.rewardTable[skill].minor[highestArmor])
            elseif starterEquipment.CheckHighest(skill,highestWeapon,highestArmor) then
                starterTable = starterEquipment.MergeItemTables(starterTable,starterEquipmentConfig.rewardTable[skill].minor)
            end
        end
    end
    
    starterEquipment.GiveItems(pid,starterTable)
end

customEventHooks.registerHandler("OnPlayerEndCharGen",starterEquipment.GiveStarterItems)

return starterEquipment
