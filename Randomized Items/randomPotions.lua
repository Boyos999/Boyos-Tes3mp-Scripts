local randomPotions = {}

jsonInterface = require("jsonInterface")

--[[
Takes the player's pid and the number of effects for the potion.
Returns a potion in the form of a structured item
]]--

function randomPotions.CreateRandomPotion(pid, numEffects)
	
	local idIterator = WorldInstance.data.customVariables.randPotionCounter
	local effectList = jsonInterface.load("randPotionEffects.json")
	local effectRand = {}
	local effectIndex = {}
	local effectMag = {}
	local effectDur = {}
	local effectAoe = 0
	local effectAttr = {}
	local effectSkill = {}
	local effectName = {}
	local effectRange = 0
	local potionId
	local potionName
	local potionIcon
	local potionModel
	local potionWeight
	local recordTable = {}
	local graphics = {}
	local effect = {}
	local grapihcsRand
	
	for i = 1, numEffects do
		effectRand[i] = math.random(1,table.getn(effectList.Effects))
		--find effect from json file
		effect = effectList.Effects[effectRand[i]]
		--roll values based on ranges in json file
		effectIndex[i] = effect.EffectIndex
		effectMag[i] = math.random(effect.EffectMagMin,effect.EffectMagMax)
		effectDur[i] = math.random(effect.EffectDurMin,effect.EffectDurMax)
		effectName[i] = effect.EffectName
		--magic effects that require an attribute field get one
		if tonumber(effectIndex[i]) == 74 or tonumber(effectIndex[i]) == 79 then
			effectAttr[i] = math.random(0,7)
		else
			effectAttr[i] = -1
		end
		--magic effects that require a skill field get one
		if tonumber(effectIndex[i]) == 78 or tonumber(effectIndex[i]) == 83 then
			effectSkill[i] = math.random(0,26)
		else
			effectSkill[i] = -1
		end
		--If summon spell, determine which creature it summons
		if tonumber(effectIndex[i]) == 102 then
			effectIndex[i] = tonumber(effectIndex[i]) + math.random(0,14)
		end
		--If bound spell, determine what it binds
		if tonumber(effectIndex[i]) == 120 then
			local temp = math.random(0,10)
			--Thanks bethesda for putting "extraspell" in the middle of the bound spells, you the real mvp
			--I bet one day this will get removed in OpenMW and break everything
			if temp > 5 then
				temp = temp + 1
			end
			effectIndex[i] = tonumber(effectIndex[i]) + temp
		end
	end
	
	--Counter to append to new id so each id is unique
	if WorldInstance.data.customVariables.randPotionCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.randPotionCounter = idIterator
	
	--assign unique id
	potionId = "random_potion_" .. idIterator
	potionName = "Potion of " .. effectName[1]
	
	--choose what this potion will look like
	graphicsRand = math.random(1,table.getn(effectList.Graphics))
	graphics = effectList.Graphics[graphicsRand]
	potionModel = graphics.Model
	potionIcon = graphics.Icon
	potionWeight = graphics.Weight
	
	--store and create record statements
	recordTable["name"] = potionName
	recordTable["icon"] = potionIcon
	recordTable["model"] = potionModel
	recordTable["weight"] = potionWeight
	recordTable["value"] = math.random(10,100)
	if recordTable.effects == nil then
		recordTable.effects = {}
	end
	for i = 1, numEffects do
		local effect = { id = effectIndex[i], rangeType = effectRange,
                        duration = effectDur[i], area = effectAoe,
                        magnitudeMin = effectMag[i], magnitudeMax = effectMag[i],
                        attribute = effectAttr[i], skill = effectSkill[i] }
        table.insert(recordTable.effects, effect)
	end
	randomPotions.nuCreatePotionRecord(pid, potionId, recordTable)
	
	--returns structured potion
	local structuredItem = { refId = potionId, count = 1, charge = -1}
	Players[pid]:Save()
	WorldInstance:Save()
	return structuredItem
	
end
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function randomPotions.nuCreatePotionRecord(pid, potionId, recordTable)
	local id = potionId
	local recordStore = RecordStores["potion"]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("potion")])
	packetBuilder.AddPotionRecord(id, savedTable)
	tes3mp.SendRecordDynamic(pid, true, false)
end

return randomPotions