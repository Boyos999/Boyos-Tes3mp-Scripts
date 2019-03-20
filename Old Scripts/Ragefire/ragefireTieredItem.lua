local ragefireTieredItem = {}

jsonInterface = require("jsonInterface")


ragefireTieredItem.BaseFunction = function(pid, tier)
	local itemType = math.random(1,3)
	local itemId
	if itemType == 1 then
		itemId = ragefireTieredItem.Weapon(pid,tier)
	end
	if itemType == 2 then
		itemId = ragefireTieredItem.Armor(pid,tier)
	end
	if itemType == 3 then
		itemId = ragefireTieredItem.Clothing(pid,tier)
	end
	return itemId
end

ragefireTieredItem.Weapon = function(pid, tier)
	local weaponType = math.random(1,6)
	local weaponRand
	local weaponBaseId
	local weaponName
	local weaponBaseRand
	local enchantmentId
	local idIterator = WorldInstance.data.customVariables.ragefireTieredItemCounter
	local weaponId
	local recordTable = {}
	local weaponTable
	local enchTier
	if tier == 1 then
		weaponTable = jsonInterface.load("tierOneWeapons.json")
		enchTier = 1
	end
	if weaponType == 1 then
		weaponBaseRand = math.random(1,table.getn(weaponTable.axes))
		weaponBaseId = weaponTable.axes[weaponBaseRand].refid
		weaponName = weaponTable.axes[weaponBaseRand].name
	elseif weaponType == 2 then
		weaponBaseRand = math.random(1,table.getn(weaponTable.marksman))
		weaponBaseId = weaponTable.marksman[weaponBaseRand].refid
		weaponName = weaponTable.marksman[weaponBaseRand].name
	elseif weaponType == 3 then
		weaponBaseRand = math.random(1,table.getn(weaponTable.Blunt))
		weaponBaseId = weaponTable.Blunt[weaponBaseRand].refid
		weaponName = weaponTable.Blunt[weaponBaseRand].name
	elseif weaponType == 4 then
		weaponBaseRand = math.random(1,table.getn(weaponTable.longblade))
		weaponBaseId = weaponTable.longblade[weaponBaseRand].refid
		weaponName = weaponTable.longblade[weaponBaseRand].name
	elseif weaponType == 5 then
		weaponBaseRand = math.random(1,table.getn(weaponTable.shortblade))
		weaponBaseId = weaponTable.shortblade[weaponBaseRand].refid
		weaponName = weaponTable.shortblade[weaponBaseRand].name
	else
		weaponBaseRand = math.random(1,table.getn(weaponTable.spear))
		weaponBaseId = weaponTable.spear[weaponBaseRand].refid
		weaponName = weaponTable.spear[weaponBaseRand].name
	end
	
	--add enchantment
	enchantmentId = ragefireTieredItem.Enchantment(pid, enchTier)
	
	--make Id Unique
	if WorldInstance.data.customVariables.ragefireTieredItemCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.ragefireTieredItemCounter = idIterator
	weaponId = string.lower("TieredItem_" .. idIterator)
	
	--Build record table
	recordTable["baseId"] = weaponBaseId
	recordTable["name"] = weaponName .. " of " .. enchantmentId.name
	recordTable["enchantmentId"] = enchantmentId.id
	
	ragefireTieredItem.CreateRecord(pid, weaponId, "weapon", recordTable)
	return weaponId
end

ragefireTieredItem.Armor = function(pid, tier)
	--variables
	local armorTypeRand = math.random(1,3)
	local armorBaseId
	local armorName
	local armorBaseRand
	local enchantmentId
	local armorId
	local idIterator = WorldInstance.data.customVariables.ragefireTieredItemCounter
	local armorTable
	local recordTable = {}
	local enchTier
	
	--Define Tier
	if tier == 1 then
		armorTable = jsonInterface.load("tierOneArmor.json")
		enchTier = 1
	end
	
	--Determine Armor
	if armorTypeRand == 1 then
		armorBaseRand = math.random(1,table.getn(armorTable.light))
		armorBaseId = armorTable.light[armorBaseRand].refid
		armorName = armorTable.light[armorBaseRand].name
	elseif armorTypeRand == 2 then
		armorBaseRand = math.random(1,table.getn(armorTable.medium))
		armorBaseId = armorTable.medium[armorBaseRand].refid
		armorName = armorTable.medium[armorBaseRand].name
	else
		armorBaseRand = math.random(1,table.getn(armorTable.heavy))
		armorBaseId = armorTable.heavy[armorBaseRand].refid
		armorName = armorTable.heavy[armorBaseRand].name
	end
	
	--add enchantment
	enchantmentId = ragefireTieredItem.Enchantment(pid, enchTier)
	
	--make Id Unique
	if WorldInstance.data.customVariables.ragefireTieredItemCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.ragefireTieredItemCounter = idIterator
	armorId = string.lower("TieredItem_" .. idIterator)
	
	--Build record table
	recordTable["baseId"] = armorBaseId
	recordTable["name"] = armorName .. " of " .. enchantmentId.name
	recordTable["enchantmentId"] = enchantmentId.id
	
	ragefireTieredItem.CreateRecord(pid, armorId, "armor", recordTable)
	return armorId
end

ragefireTieredItem.Clothing = function(pid, tier)
	local recordTable = {}
	local idIterator = WorldInstance.data.customVariables.ragefireTieredItemCounter
	local clothingBaseId
	local clothingName
	local clothingBaseRand
	local enchantmentId
	local clothingId
	local clothingTable
	local enchTier
	if tier == 1 then
		clothingTable = jsonInterface.load("tierOneClothing.json")
		enchTier = 1
	end
	
	clothingBaseRand = math.random(1,table.getn(clothingTable.clothing))
	clothingBaseId = clothingTable.clothing[clothingBaseRand].refid
	clothingName = clothingTable.clothing[clothingBaseRand].name
	
	--add enchantment
	enchantmentId = ragefireTieredItem.Enchantment(pid, enchTier)
	
	--make Id Unique
	if WorldInstance.data.customVariables.ragefireTieredItemCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.ragefireTieredItemCounter = idIterator
	clothingId = string.lower("TieredItem_" .. idIterator)
	
	--Build record table
	recordTable["baseId"] = clothingBaseId
	recordTable["name"] = clothingName .. " of " .. enchantmentId.name
	recordTable["enchantmentId"] = enchantmentId.id
	
	ragefireTieredItem.CreateRecord(pid, clothingId, "clothing", recordTable)
	return clothingId
	
end

ragefireTieredItem.Enchantment = function(pid, tier)
	local skillIdList = {4,5,6,7,10,11,12,13,14,15,18,19,20,22,23,25,26}
	local effectRand
	local effectName
	local recordTable = {}
	local effectIndex
	local effectDur = 1
	local effectAoe = 1
	local effectRange = 0
	local effectCost = 0
	local effectCharge = 0
	local effectMag
	local effect
	local effectSkill = -1
	local effectAttr = -1
	local enchantmentId
	local returnTable = {}
	local enchantmentTable
	local idIterator = WorldInstance.data.customVariables.ragefireTieredEnchCounter
	if tier == 1 then
		enchantmentTable = jsonInterface.load("tierOneCE.json")
	end
	effectRand = math.random(1,table.getn(enchantmentTable.Constant))
	effect = enchantmentTable.Constant[effectRand]
	effectIndex = effect.EnchIndex
	effectName = effect.EnchName
	effectMag = math.random(effect.EnchMagMin,effect.EnchMagMax)
	if tonumber(effectIndex) == 83 then
		effectSkill = skillIdList[math.random(1,17)]
	elseif tonumber(effectIndex) == 79 then
		effectAttr = math.random(0,7)
	end
	
	if WorldInstance.data.customVariables.ragefireTieredEnchCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.ragefireTieredEnchCounter = idIterator
	enchantmentId = string.lower("TieredEnchant_" .. idIterator)
	
	recordTable["subtype"] = 3
	recordTable["cost"] = effectCost
	recordTable["charge"] = effectCharge
	if recordTable.effects == nil then
		recordTable.effects = {}
	end
	local nuEffect = { id = effectIndex, rangeType = effectRange,
                        duration = effectDur, area = effectAoe,
                        magnitudeMin = effectMag, magnitudeMax = effectMag,
                        attribute = effectAttr, skill = effectSkill }
    table.insert(recordTable.effects, nuEffect)
	
	ragefireTieredItem.CreateRecord(pid, enchantmentId, "enchantment", recordTable)
	returnTable.id = enchantmentId
	returnTable.name = effectName
	
	return returnTable
	
end

ragefireTieredItem.CreateRecord = function(pid, itemId, recordType, recordTable)
	local id = itemId
	local recordStore = RecordStores[recordType]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper(recordType)])
	
	if recordType == "armor" then packetBuilder.AddArmorRecord(id, savedTable)
	elseif recordType == "clothing" then packetBuilder.AddClothingRecord(id, savedTable)
	elseif recordType == "weapon" then packetBuilder.AddWeaponRecord(id, savedTable)
	elseif recordType == "enchantment" then packetBuilder.AddEnchantmentRecord(id, savedTable)
	end
	tes3mp.SendRecordDynamic(pid, true, false)
end


return ragefireTieredItem