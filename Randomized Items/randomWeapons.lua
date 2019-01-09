
local randomWeapons = {}

tableHelper = require("tableHelper")
jsonInterface = require("jsonInterface")
cfgRandWeap = require("cfgRandWeap")
randomEnchantments = require("randomEnchantments")

--[[
Takes the player's pid, and the maximum number of enchants on the item ctrl+f for "enchants" to find code
A value of 0 in enchEffectsNum skips creating an enchantment.

Returns the weapon in the form of a structured item
]]--
randomWeapons.CreateRandWeap = function(pid, enchEffectsNum)
	local idIterator = WorldInstance.data.customVariables.randCounter	
	local weapType = math.random(1,12)
	local weapBaseRand
	local weapBaseId
	local weapMinChopDmg
	local weapMaxChopDmg
	local weapMinSlashDmg
	local weapMaxSlashDmg
	local weapMinThrustDmg
	local weapMaxThrustDmg
	local weapEnch
	local weapValue
	local numEnchants
	local weapon = {}
	local recordTable = {}
	
	
	local baseIdList = jsonInterface.load("randWeaponBaseIds.json")
	
	if weapType == 1 then
		weapBaseRand = math.random(1,table.getn(baseIdList.axes1h))
		weapon = baseIdList.axes1h[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.axe1hChopMin[1],cfgRandWeap.axe1hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.axe1hChopMax[1],cfgRandWeap.axe1hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.axe1hSlashMin[1],cfgRandWeap.axe1hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.axe1hSlashMax[1],cfgRandWeap.axe1hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.axe1hThrustMin[1],cfgRandWeap.axe1hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.axe1hThrustMax[1],cfgRandWeap.axe1hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.axe1hEnch[1],cfgRandWeap.axe1hEnch[2])
		
	elseif weapType == 2 then
		weapBaseRand = math.random(1,table.getn(baseIdList.axes2h))
		weapon = baseIdList.axes2h[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.axe2hChopMin[1],cfgRandWeap.axe2hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.axe2hChopMax[1],cfgRandWeap.axe2hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.axe2hSlashMin[1],cfgRandWeap.axe2hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.axe2hSlashMax[1],cfgRandWeap.axe2hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.axe2hThrustMin[1],cfgRandWeap.axe2hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.axe2hThrustMax[1],cfgRandWeap.axe2hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.axe2hEnch[1],cfgRandWeap.axe2hEnch[2])
	
	elseif weapType == 3 then
		weapBaseRand = math.random(1,table.getn(baseIdList.bluntMace))
		weapon = baseIdList.bluntMace[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.maceChopMin[1],cfgRandWeap.maceChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.maceChopMax[1],cfgRandWeap.maceChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.maceSlashMin[1],cfgRandWeap.maceSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.maceSlashMax[1],cfgRandWeap.maceSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.maceThrustMin[1],cfgRandWeap.maceThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.maceThrustMax[1],cfgRandWeap.maceThrustMax[2])
		weapEnch = math.random(cfgRandWeap.maceEnch[1],cfgRandWeap.maceEnch[2])
	
	elseif weapType == 4 then
		weapBaseRand = math.random(1,table.getn(baseIdList.bluntHammer))
		weapon = baseIdList.bluntHammer[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.hammerChopMin[1],cfgRandWeap.hammerChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.hammerChopMax[1],cfgRandWeap.hammerChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.hammerSlashMin[1],cfgRandWeap.hammerSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.hammerSlashMax[1],cfgRandWeap.hammerSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.hammerThrustMin[1],cfgRandWeap.hammerThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.hammerThrustMax[1],cfgRandWeap.hammerThrustMax[2])
		weapEnch = math.random(cfgRandWeap.hammerEnch[1],cfgRandWeap.hammerEnch[2])
		
	elseif weapType == 5 then
		weapBaseRand = math.random(1,table.getn(baseIdList.bluntStaff))
		weapon = baseIdList.bluntStaff[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.staffChopMin[1],cfgRandWeap.staffChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.staffChopMax[1],cfgRandWeap.staffChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.staffSlashMin[1],cfgRandWeap.staffSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.staffSlashMax[1],cfgRandWeap.staffSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.staffThrustMin[1],cfgRandWeap.staffThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.staffThrustMax[1],cfgRandWeap.staffThrustMax[2])
		weapEnch = math.random(cfgRandWeap.staffEnch[1],cfgRandWeap.staffEnch[2])
		
	elseif weapType == 6 then
		weapBaseRand = math.random(1,table.getn(baseIdList.longblade1h))
		weapon = baseIdList.longblade1h[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.lb1hChopMin[1],cfgRandWeap.lb1hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.lb1hChopMax[1],cfgRandWeap.lb1hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.lb1hSlashMin[1],cfgRandWeap.lb1hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.lb1hSlashMax[1],cfgRandWeap.lb1hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.lb1hThrustMin[1],cfgRandWeap.lb1hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.lb1hThrustMax[1],cfgRandWeap.lb1hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.lb1hEnch[1],cfgRandWeap.lb1hEnch[2])
	
	elseif weapType == 7 then
		weapBaseRand = math.random(1,table.getn(baseIdList.longblade2h))
		weapon = baseIdList.longblade2h[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.lb2hChopMin[1],cfgRandWeap.lb2hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.lb2hChopMax[1],cfgRandWeap.lb2hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.lb2hSlashMin[1],cfgRandWeap.lb2hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.lb2hSlashMax[1],cfgRandWeap.lb2hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.lb2hThrustMin[1],cfgRandWeap.lb2hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.lb2hThrustMax[1],cfgRandWeap.lb2hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.lb2hEnch[1],cfgRandWeap.lb2hEnch[2])
		
	elseif weapType == 8 then
		weapBaseRand = math.random(1,table.getn(baseIdList.marksBow))
		weapon = baseIdList.marksBow[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.bowChopMin[1],cfgRandWeap.bowChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.bowChopMax[1],cfgRandWeap.bowChopMax[2])
		weapMinSlashDmg = 0
		weapMaxSlashDmg = 0
		weapMinThrustDmg = 0
		weapMaxThrustDmg = 0
		weapEnch = math.random(cfgRandWeap.bowEnch[1],cfgRandWeap.bowEnch[2])
		
	elseif weapType == 9 then
		weapBaseRand = math.random(1,table.getn(baseIdList.marksXbow))
		weapon = baseIdList.marksXbow[weapBaseRand]
		weapBaseId = weapon.refid
		weapMaxChopDmg = math.random(cfgRandWeap.xbowChopMax[1],cfgRandWeap.xbowChopMax[2])
		weapMinChopDmg = weapMaxChopDmg
		weapMinSlashDmg = 0
		weapMaxSlashDmg = 0
		weapMinThrustDmg = 0
		weapMaxThrustDmg = 0
		weapEnch = math.random(cfgRandWeap.xbowEnch[1],cfgRandWeap.xbowEnch[2])
		
	elseif weapType == 10 then
		weapBaseRand = math.random(1,table.getn(baseIdList.shortbladeDagger))
		weapon = baseIdList.shortbladeDagger[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.daggerChopMin[1],cfgRandWeap.daggerChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.daggerChopMax[1],cfgRandWeap.daggerChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.daggerSlashMin[1],cfgRandWeap.daggerSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.daggerSlashMax[1],cfgRandWeap.daggerSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.daggerThrustMin[1],cfgRandWeap.daggerThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.daggerThrustMax[1],cfgRandWeap.daggerThrustMax[2])
		weapEnch = math.random(cfgRandWeap.daggerEnch[1],cfgRandWeap.daggerEnch[2])
		
	elseif weapType == 11 then
		weapBaseRand = math.random(1,table.getn(baseIdList.shortblade))
		weapon = baseIdList.shortblade[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.sbChopMin[1],cfgRandWeap.sbChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.sbChopMax[1],cfgRandWeap.sbChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.sbSlashMin[1],cfgRandWeap.sbSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.sbSlashMax[1],cfgRandWeap.sbSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.sbThrustMin[1],cfgRandWeap.sbThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.sbThrustMax[1],cfgRandWeap.sbThrustMax[2])
		weapEnch = math.random(cfgRandWeap.sbEnch[1],cfgRandWeap.sbEnch[2])
		
	elseif weapType == 12 then
		weapBaseRand = math.random(1,table.getn(baseIdList.spear))
		weapon = baseIdList.spear[weapBaseRand]
		weapBaseId = weapon.refid
		weapMinChopDmg = math.random(cfgRandWeap.spearChopMin[1],cfgRandWeap.spearChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.spearChopMax[1],cfgRandWeap.spearChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.spearSlashMin[1],cfgRandWeap.spearSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.spearSlashMax[1],cfgRandWeap.spearSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.spearThrustMin[1],cfgRandWeap.spearThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.spearThrustMax[1],cfgRandWeap.spearThrustMax[2])
		weapEnch = math.random(cfgRandWeap.spearEnch[1],cfgRandWeap.spearEnch[2])
	
	end
	
	
	--make sure no max values are higher than min, if they are, make them equal
	if weapMinChopDmg > weapMaxChopDmg then
		weapMinChopDmg = weapMaxChopDmg
	end
	if weapMinSlashDmg > weapMaxSlashDmg then
		weapMinSlashDmg = weapMaxSlashDmg
	end
	if weapMinThrustDmg > weapMaxThrustDmg then
		weapMinThrustDmg = weapMaxThrustDmg
	end
	
	--use this to make sure there are no repeat ids
	if WorldInstance.data.customVariables.randCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.randCounter = idIterator
	
	--calculate a new item value based on damage
	weapValue = ((weapMinChopDmg + weapMaxChopDmg + weapMinSlashDmg + weapMaxSlashDmg + weapMinThrustDmg + weapMaxThrustDmg)/6)*10
	if weapBaseId == nil then
		Players[pid]:Message("NIL BASEID DETECTED\nPLEASE REPORT THE FOLLOWING TO YOUR SERVER ADMIN\nTYPE=" .. weapType.."\nBase=" .. weapBaseRand .. "\n")
		weapBaseId = "chitin dagger"
		weapValue = 1
		weapMinChopDmg = 0
		weapMaxChopDmg = 1
		weapMinSlashDmg = 0
		weapMaxSlashDmg = 1
		weapMinThrustDmg = 0
		weapMaxThrustDmg = 1
		weapEnch = 1
	end
	local newRefId = string.lower(idIterator .. "_" .. weapBaseId)	
	recordTable["baseId"] = weapBaseId
	recordTable["value"] = weapValue
	if recordTable["damageChop"] == nil then
		recordTable["damageChop"] = {}
	end
	if recordTable["damageSlash"] == nil then
		recordTable["damageSlash"] = {}
	end
	if recordTable["damageThrust"] == nil then
		recordTable["damageThrust"] = {}
	end
	recordTable["damageChop"]["min"] = weapMinChopDmg
	recordTable["damageChop"]["max"] = weapMaxChopDmg
	recordTable["damageSlash"]["min"] = weapMinSlashDmg
	recordTable["damageSlash"]["max"] = weapMaxSlashDmg
	recordTable["enchantmentCharge"] = weapEnch
	recordTable["damageThrust"]["min"] = weapMinThrustDmg
	recordTable["damageThrust"]["max"] = weapMaxThrustDmg
	
	--enchants
	--bows and xbows don't get enchants since cast when strikes enchants don't work with bows
	if weapType ~= 8 and weapType ~= 9 then
		--Makes a roll to determine if the item has an enchantment based on cfg value
		if math.random(1,100) < cfgRandWeap.CSchance then
			if enchEffectsNum >= 0 then
				numEnchants = enchEffectsNum
			else
				numEnchants = 0
			end
			if numEnchants ~= 0 then
				local enchantId = randomEnchantments.CreateRandEnch(pid, 1,enchEffectsNum)
				recordTable["enchantmentId"] = enchantId
			end
		end
	end
	
	--enchants
	randomWeapons.nuCreateWeaponRecord(pid, newRefId, recordTable)
	
	local structuredItem = { refId = newRefId, count = 1, charge = -1}
	Players[pid]:Save()
	WorldInstance:Save()
	
	return structuredItem
end
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function randomWeapons.nuCreateWeaponRecord(pid, weaponId, recordTable)
	local id = weaponId
	local recordStore = RecordStores["weapon"]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("weapon")])
	packetBuilder.AddWeaponRecord(id, savedTable)
	tes3mp.SendRecordDynamic(pid, true, false)
end

return randomWeapons