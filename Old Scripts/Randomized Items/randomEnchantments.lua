--[[
Currently Only supports strike and constant effect enchantments

valid enchTypes
Cast Once = 0
Cast When Strikes = 1
Cast When Used = 2
Constant Effect = 3

Self RangeType = 0
Touch RangeType = 1
Target RangeType = 2
]]--

local randomEnchantments = {}

jsonInterface = require("jsonInterface")
--[[
Takes the player's pid, the type of enchantment (list above) and the number of effects
for the enchantment.
Returns the id for the created custom enchantment
]]--
function randomEnchantments.CreateRandEnch(pid, enchType, numEffects)
	--declare variables for clarity
	local idIterator = WorldInstance.data.customVariables.randEnchCounter
	local enchList = jsonInterface.load("randEnchEffects.json")
	local effectRand = {}
	local effectIndex = {}
	local effectMagMin = {}
	local effectMagMax = {}
	local effectDur = {}
	local effectAoe = {}
	local effectAttr = {}
	local effectSkill = {}
	local effectCost
	local effectCharge
	local effectRange = {}
	local enchId
	local effect = {}
	local recordTable = {}
	local effectsCount = numEffects
	
	--cast once (scrolls)
	if enchType == 0 then
		for i = 1, effectsCount do
			effectRand[i] = math.random(1,table.getn(enchList.Once))
			effect = enchList.Once[effectRand[i]]
			effectIndex[i] = effect.EnchIndex
			effectMagMin[i] = math.random(effect.EnchMagMinMin,effect.EnchMagMinMax)
			effectMagMax[i] = math.random(effect.EnchMagMaxMin,effect.EnchMagMaxMax)
			effectDur[i] = math.random(effect.EnchDurMin,effect.EnchDurMax)
			effectAoe[i] = math.random(effect.EnchAoeMin,effect.EnchAoeMax)
			if effectAoe[i] < 5 then
				effectAoe[i] = 0
			end
			if effect.EnchRange == "Other" then
				effectRange[i] = math.random(1,2)
			elseif effect.EnchRange == "Self" then
				effectRange[i] = 0
			else
				effectRange[i] = math.random(0,2)
			end
			--if minimun is greater than maximum set them equal
			if effectMagMin[i] > effectMagMax[i] then
				effectMagMax[i] = effectMagMin[i]
			end
			--magic effects that require an attribute field get one
			if tonumber(effectIndex[i]) == 22 or tonumber(effectIndex[i]) == 85 or tonumber(effectIndex[i]) == 79 or tonumber(effectIndex[i]) == 74 then
				effectAttr[i] = math.random(0,7)
			else
				effectAttr[i] = -1
			end
			--magic effects that require a skill field get one
			if tonumber(effectIndex[i]) == 26 or tonumber(effectIndex[i]) == 89 or tonumber(effectIndex[i]) == 83 or tonumber(effectIndex[i]) == 78 then
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
		effectCharge = 10
		effectCost = 10
	end
	
	--cast when strikes
	if enchType == 1 then
		--roll for magic effect
		for i = 1, effectsCount do
			effectRand[i] = math.random(1,table.getn(enchList.Strike))
			--find effect from json file
			effect = enchList.Strike[effectRand[i]]
			effectIndex[i] = effect.EnchIndex
			effectMagMin[i] = math.random(effect.EnchMagMinMin,effect.EnchMagMinMax)
			effectMagMax[i] = math.random(effect.EnchMagMaxMin,effect.EnchMagMaxMax)
			effectDur[i] = math.random(effect.EnchDurMin,effect.EnchDurMax)
			effectAoe[i] = math.random(effect.EnchAoeMin,effect.EnchAoeMax)
			if effectAoe[i] < 5 then
				effectAoe[i] = 0
			end

			
			--if minimun is greater than maximum set them equal
			if effectMagMin[i] > effectMagMax[i] then
				effectMagMax[i] = effectMagMin[i]
			end
			--magic effects that require an attribute field get one
			if tonumber(effectIndex[i]) == 22 or tonumber(effectIndex[i]) == 85 or tonumber(effectIndex[i]) == 79 then
				effectAttr[i] = math.random(0,7)
			else
				effectAttr[i] = -1
			end
			--magic effects that require a skill field get one
			if tonumber(effectIndex[i]) == 26 or tonumber(effectIndex[i]) == 89 or tonumber(effectIndex[i]) == 83 then
				effectSkill[i] = math.random(0,26)
			else
				effectSkill[i] = -1
			end
			effectRange[i] = 1
		end
		--Randomly calculate cost and charge
		effectCost = math.random(10,50)
		--This gives between 5 and 25 uses (default auto-calc gives 10)
		effectCharge = effectCost*math.random(5,25)
		--On Touch
	
		
	--Constant Effect
	elseif enchType == 3 then
		for i = 1, effectsCount do
			effectRand[i] = math.random(1,table.getn(enchList.Const))
			effect = enchList.Const[effectRand[i]]
			effectIndex[i] = effect.EnchIndex
			effectMagMin[i] = math.random(effect.EnchMagMin,effect.EnchMagMax)
			effectMagMax[i] = math.random(effect.EnchMagMin,effect.EnchMagMax)
			--pick whichever is lower and take that magnitude (unlucky)
			if effectMagMin[i] > effectMagMax[i] then
				effectMagMin[i] = effectMagMax[i]
			else
				effectMagMax[i] = effectMagMin[i]
			end
			
			--set appropriate values for constant effect enchants
			effectDur[i] = 1
			effectAoe[i] = 0
			--magic effects that require an attribute field get one
			if tonumber(effectIndex[i]) == 22 or tonumber(effectIndex[i]) == 85 or tonumber(effectIndex[i]) == 79 then
				effectAttr[i] = math.random(0,7)
			else
				effectAttr[i] = -1
			end
			--magic effects that require a skill field get one
			if tonumber(effectIndex[i]) == 26 or tonumber(effectIndex[i]) == 89 or tonumber(effectIndex[i]) == 83 then
				effectSkill[i] = math.random(0,26)
			else
				effectSkill[i] = -1
			end
			effectRange[i] = 0
		end
		--set appropriate values for constant effect enchants
		effectCost = 0
		effectCharge = 0

	end
	
	
	
	--Counter to append to new id so each id is unique
	if WorldInstance.data.customVariables.randEnchCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.randEnchCounter = idIterator
	
	--assign unique id
	enchId = "random_enchant_" .. idIterator
	--store and create record statements
	
	recordTable["subtype"] = enchType
	recordTable["cost"] = effectCost
	recordTable["charge"] = effectCharge
	if recordTable.effects == nil then
		recordTable.effects = {}
	end
	for i = 1, effectsCount do
		local effect = { id = effectIndex[i], rangeType = effectRange[i],
                        duration = effectDur[i], area = effectAoe[i],
                        magnitudeMin = effectMagMin[i], magnitudeMax = effectMagMax[i],
                        attribute = effectAttr[i], skill = effectSkill[i] }
        table.insert(recordTable.effects, effect)
	end
	randomEnchantments.nuCreateEnchantRecord(pid, enchId, recordTable)
	
	--returns custom id
	return enchId
	
end
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function randomEnchantments.nuCreateEnchantRecord(pid, enchId, recordTable)
	local id = enchId
	local recordStore = RecordStores["enchantment"]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("enchantment")])
	packetBuilder.AddEnchantmentRecord(id, savedTable)
	tes3mp.SendRecordDynamic(pid, true, false)
end

return randomEnchantments