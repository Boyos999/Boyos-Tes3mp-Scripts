local randomArmor = {}

tableHelper = require("tableHelper")
jsonInterface = require("jsonInterface")
cfgRandArmor = require("cfgRandArmor")

--[[
Takes the player's pid, and the maximum number of enchants on the item ctrl+f for "enchants" to find code
A value of 0 in enchEffectsNum skips creating an enchantment.

Returns the weapon in the form of a structured item
]]--
randomArmor.CreateRandArmor = function(pid, enchEffectsNum)

	--declare variables for clarity
	local idIterator = WorldInstance.data.customVariables.randArmorCounter
	local armorType = math.random(1,3)
	local armorBaseRand
	local armorBaseId
	local armorRating
	local armorRatingOne
	local armorRatingTwo
	local armorValue
	local newRefId
	local enchantRand
	local numEnchants
	local recordTable = {}
	local armor = {}
	local baseIdList = jsonInterface.load("randArmorBaseIds.json")
	
	--light armor
	if armorType == 1 then
		--roll for baseid
		armorBaseRand = math.random(1,table.getn(baseIdList.light))
		--find baseid from json file
		armor = baseIdList.light[armorBaseRand]
		armorBaseId = armor.refid
		--roll armor rating, unlucky set in cfgRandArmor
		if cfgRandArmor.Unlucky == 1 then
			armorRatingOne = math.random(cfgRandArmor.LArange[1],cfgRandArmor.LArange[2])
			armorRatingTwo = math.random(cfgRandArmor.LArange[1],cfgRandArmor.LArange[2])
			if armorRatingOne > armorRatingTwo then
				armorRating = armorRatingTwo
			else
				armorRating = armorRatingOne
			end
		else
			armorRating = math.random(cfgRandArmor.LArange[1],cfgRandArmor.LArange[2])
		end
	
	--medium armor
	elseif armorType == 2 then
		armorBaseRand = math.random(1,table.getn(baseIdList.medium))
		armor = baseIdList.medium[armorBaseRand]
		armorBaseId = armor.refid
		if cfgRandArmor.Unlucky == 1 then
			armorRatingOne = math.random(cfgRandArmor.MArange[1],cfgRandArmor.MArange[2])
			armorRatingTwo = math.random(cfgRandArmor.MArange[1],cfgRandArmor.MArange[2])
			if armorRatingOne > armorRatingTwo then
				armorRating = armorRatingTwo
			else
				armorRating = armorRatingOne
			end
		else
			armorRating = math.random(cfgRandArmor.MArange[1],cfgRandArmor.MArange[2])
		end
		
	--heavy armor
	elseif armorType == 3 then
		armorBaseRand = math.random(1,table.getn(baseIdList.heavy))
		armor = baseIdList.heavy[armorBaseRand]
		armorBaseId = armor.refid
		if cfgRandArmor.Unlucky == 1 then
			armorRatingOne = math.random(cfgRandArmor.HArange[1],cfgRandArmor.HArange[2])
			armorRatingTwo = math.random(cfgRandArmor.HArange[1],cfgRandArmor.HArange[2])
			if armorRatingOne > armorRatingTwo then
				armorRating = armorRatingTwo
			else
				armorRating = armorRatingOne
			end
		else
			armorRating = math.random(cfgRandArmor.HArange[1],cfgRandArmor.HArange[2])
		end
	end
	
	--Counter to append to new id so each id is unique
	if WorldInstance.data.customVariables.randArmorCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.randArmorCounter = idIterator

	--calculate a gold value for custom armor
	armorValue = 10*(armorRating^1.2)
	
	--new refid
	newRefId = string.lower(idIterator .."_" .. armorBaseId)
	
	recordTable["baseId"] = armorBaseId
	recordTable["armorRating"] = armorRating
	recordTable["value"] = armorValue
	--enchants, only const effect for now
	--Makes a roll to determine if the item has an enchantment based on cfg value
	enchantRand = math.random(1,100)
	if enchantRand <= cfgRandArmor.CEchance then
		numEnchants = enchEffectsNum
		--no negative numbers pls
		if numEnchants >= 0 then
			local enchantId = randomEnchantments.CreateRandEnch(pid, 3,numEnchants)
			recordTable["enchantmentId"] = enchantId
		end
	end
	--enchants
	
	--creates custom record
	randomArmor.nuCreateArmorRecord(pid, newRefId, recordTable)
	
	--add custom record to player's inventory
	local structuredItem = { refId = newRefId, count = 1, charge = -1}
	Players[pid]:Save()
	WorldInstance:Save()
	
	return structuredItem
end
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function randomArmor.nuCreateArmorRecord(pid, armorId, recordTable)
	local id = armorId
	local recordStore = RecordStores["armor"]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("armor")])
	packetBuilder.AddArmorRecord(id, savedTable)
	tes3mp.SendRecordDynamic(pid, true, false)
end

return randomArmor