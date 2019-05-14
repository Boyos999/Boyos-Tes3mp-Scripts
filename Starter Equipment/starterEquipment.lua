--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts

--This script will add some starting gear to the player's inventory after finishing character creation based on the
--values of their skills
--Only gives armor and weapon for highest skills (marksman not included)


-- abbreviated skills and their skill ids
-- 0,1,2, 3, 4, 5, 6, 7, 9,  16, 18, 21,22,23
-- b,a,ma,ha,bl,lb,ax,sp,enc,alc,sec,la,sb,marks

--[[
local skillArray = {"block", "armorer", "mediumarmor", "heavyarmor", "blunt", "longblade", "axe", "spear", "athletics",
"enchant", "destruction", "alteration", "illusion", "conjuration", "mysticism", "restoration", "alchemy", "unarmored",
"security", "sneak", "acrobatics", "lightarmor", "shortblade", "marksman", "mercantile", "speechcraft", "handtohand"}
]]--

local starterEquipment = {}


starterEquipment.GiveStarterItems = function(eventStatus, pid)
    local major = 30
    local minor = 15
    local baseGold = 50
    
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
    
    --[[
    weapon priority to reduce item spam (marksman not included)
    long blade (5)
    axe (6)
    blunt (4)
    spear (7)
    short blade (22)
    ]]--
    local HighestWeapon = 5
    if tes3mp.GetSkillBase(pid, 6) > tes3mp.GetSkillBase(pid,highest) then
        HighestWeapon = 6
    end
    if tes3mp.GetSkillBase(pid, 4) > tes3mp.GetSkillBase(pid,highest) then
        HighestWeapon = 4
    end
    if tes3mp.GetSkillBase(pid, 7) > tes3mp.GetSkillBase(pid,highest) then
        HighestWeapon = 7
    end
    if tes3mp.GetSkillBase(pid, 22) > tes3mp.GetSkillBase(pid,highest) then
        HighestWeapon = 22
    end
    --Block
    if tes3mp.GetSkillBase(pid, 0) >= major then
        --heavyshield
        if highest == 3 then
            inventoryHelper.addItem(Players[pid].data.inventory, "steel_towershield", 1)
        --mediumshield
        elseif highest == 2 then
            inventoryHelper.addItem(Players[pid].data.inventory, "bonemold_towershield", 1)
        --lightshield
        elseif highest == 21 then
            inventoryHelper.addItem(Players[pid].data.inventory, "chitin_towershield", 1)
        end
        
    elseif tes3mp.GetSkillBase(pid, 0) >= minor then
        --heavyshield
        if highest == 3 then
            inventoryHelper.addItem(Players[pid].data.inventory, "steel_shield", 1)
        --mediumshield
        elseif highest == 2 then
            inventoryHelper.addItem(Players[pid].data.inventory, "bonemold_shield", 1)
        --lightshield
        elseif highest == 21 then
            inventoryHelper.addItem(Players[pid].data.inventory, "bonemold_shield", 1)
        end
    end
    
    --armorer
    if tes3mp.GetSkillBase(pid, 1) >= major then
        inventoryHelper.addItem(Players[pid].data.inventory, "repair_journeyman_01", 4)
    elseif tes3mp.GetSkillBase(pid, 1) >= minor then
        inventoryHelper.addItem(Players[pid].data.inventory, "repair_prongs", 4)
    end
    
    --mediumarmor
    if tes3mp.GetSkillBase(pid, 2) >= major and highest == 2 then
        inventoryHelper.addItem(Players[pid].data.inventory, "bonemold_cuirass", 1)
    
    elseif tes3mp.GetSkillBase(pid, 2) >= minor and highest == 2 then
        inventoryHelper.addItem(Players[pid].data.inventory, "imperial_chain_cuirass", 1)
    end
    
    --heavyarmor
    if tes3mp.GetSkillBase(pid, 3) >= major and highest == 3 then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel_cuirass", 1)
    
    elseif tes3mp.GetSkillBase(pid, 3) >= minor and highest == 3 then
        inventoryHelper.addItem(Players[pid].data.inventory, "iron_cuirass", 1)
    end
    
    --blunt
    if tes3mp.GetSkillBase(pid, 4) >= major and HighestWeapon == 4 then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel mace", 1)
    
    elseif tes3mp.GetSkillBase(pid, 4) >= minor and HighestWeapon == 4 then
        inventoryHelper.addItem(Players[pid].data.inventory, "iron club", 1)
    end
    
    --longblade
    if tes3mp.GetSkillBase(pid, 5) >= major and HighestWeapon == 5 then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel longsword", 1)
    
    elseif tes3mp.GetSkillBase(pid, 5) >= minor and HighestWeapon == 5 then
        inventoryHelper.addItem(Players[pid].data.inventory, "iron broadsword", 1)
    end
    
    --axe
    if tes3mp.GetSkillBase(pid, 6) >= major and HighestWeapon == 6 then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel war axe", 1)
    
    elseif tes3mp.GetSkillBase(pid, 6) >= minor and HighestWeapon == 6 then
        inventoryHelper.addItem(Players[pid].data.inventory, "chitin war axe", 1)
    end
    
    --spear
    if tes3mp.GetSkillBase(pid, 7) >= major and HighestWeapon == 7 then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel spear", 1)
    
    elseif tes3mp.GetSkillBase(pid, 7) >= minor and HighestWeapon == 7 then
        inventoryHelper.addItem(Players[pid].data.inventory, "chitin spear", 1)
    end
    
    --enchant
    if tes3mp.GetSkillBase(pid, 9) >= major then
        local enItems = {
            { "life ring",1},
            { "Misc_SoulGem_Lesser",2}
        }
        for i,item in pairs(enItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    
    elseif tes3mp.GetSkillBase(pid, 9) >= minor then
        inventoryHelper.addItem(Players[pid].data.inventory, "Misc_SoulGem_Petty", 2)
    end
    
    --alchemy
    if tes3mp.GetSkillBase(pid, 16) >= major then
        local alcItems = {
            { "apparatus_j_mortar_01",1},
            { "ingred_marshmerrow_01", 5},
            { "ingred_wickwheat_01", 5}
        }
        for i,item in pairs(alcItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    
    elseif tes3mp.GetSkillBase(pid, 16) >= minor then
        local alcItems = {
            { "apparatus_a_mortar_01",1},
            { "ingred_marshmerrow_01", 2},
            { "ingred_wickwheat_01", 2}
        }
        for i,item in pairs(alcItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    end
    
    --security
    if tes3mp.GetSkillBase(pid, 18) >= major then
        local secItems = {
            { "probe_journeyman_01",1},
            { "pick_journeyman_01",1}
        }
        for i,item in pairs(secItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    
    elseif tes3mp.GetSkillBase(pid, 18) >= minor then
        local secItems = {
            { "probe_apprentice_01",1},
            { "pick_apprentice_01", 1}
        }
        for i,item in pairs(secItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    end
    
    --lightarmor
    if tes3mp.GetSkillBase(pid, 21) >= major and highest == 21 then
        local laItems = {
            { "chitin cuirass",1},
            { "chitin boots",1}
        }
        for i,item in pairs(laItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    
    elseif tes3mp.GetSkillBase(pid, 21) >= minor and highest == 21 then
        inventoryHelper.addItem(Players[pid].data.inventory, "netch_leather_boiled_cuirass", 1)
    end
    
    --shortblade
    if tes3mp.GetSkillBase(pid, 22) >= major and HighestWeapon == 22 then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel shortsword", 1)
    
    elseif tes3mp.GetSkillBase(pid, 22) >= minor and HighestWeapon == 22 then
        inventoryHelper.addItem(Players[pid].data.inventory, "chitin shortsword", 1)
    end
    --marksman
    if tes3mp.GetSkillBase(pid, 23) >= major then
        local mItems = {
            { "steel longbow",1},
            { "chitin arrow",50},
            { "steel arrow", 15}
        }
        for i,item in pairs(mItems) do
            inventoryHelper.addItem(Players[pid].data.inventory, item[1], item[2])
        end
    
    elseif tes3mp.GetSkillBase(pid, 23) >= minor then
        inventoryHelper.addItem(Players[pid].data.inventory, "steel throwing star", 20)
    end

    --universal
    inventoryHelper.addItem(Players[pid].data.inventory, "Gold_001", baseGold)
    
    Players[pid]:LoadInventory()
    Players[pid]:LoadEquipment()
end

customEventHooks.registerHandler("OnPlayerEndCharGen",starterEquipment.GiveStarterItems)

return starterEquipment
