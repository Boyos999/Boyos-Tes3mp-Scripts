
local randomWeapons = {}

tableHelper = require("tableHelper")
jsonInterface = require("jsonInterface")
cfgRandWeap = require("cfgRandWeap")

randomWeapons.CreateRandWeap = function(pid)
	local idIterator = Players[pid].data.customVariables.randCounter
	
	
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
	
	
	
	local baseIdList = jsonInterface.load("randWeaponBaseIds.json")
	
	if weapType == 1 then
		weapBaseRand = math.random(1,8)
		for i, weapon in pairs(baseIdList.axes1h) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.axe1hChopMin[1],cfgRandWeap.axe1hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.axe1hChopMax[1],cfgRandWeap.axe1hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.axe1hSlashMin[1],cfgRandWeap.axe1hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.axe1hSlashMax[1],cfgRandWeap.axe1hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.axe1hThrustMin[1],cfgRandWeap.axe1hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.axe1hThrustMax[1],cfgRandWeap.axe1hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.axe1hEnch[1],cfgRandWeap.axe1hEnch[2])
		
	elseif weapType == 2 then
		weapBaseRand = math.random(1,6)
		for i, weapon in pairs(baseIdList.axes2h) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.axe2hChopMin[1],cfgRandWeap.axe2hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.axe2hChopMax[1],cfgRandWeap.axe2hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.axe2hSlashMin[1],cfgRandWeap.axe2hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.axe2hSlashMax[1],cfgRandWeap.axe2hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.axe2hThrustMin[1],cfgRandWeap.axe2hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.axe2hThrustMax[1],cfgRandWeap.axe2hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.axe2hEnch[1],cfgRandWeap.axe2hEnch[2])
	
	elseif weapType == 3 then
		weapBaseRand = math.random(1,5)
		for i, weapon in pairs(baseIdList.bluntMace) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.maceChopMin[1],cfgRandWeap.maceChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.maceChopMax[1],cfgRandWeap.maceChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.maceSlashMin[1],cfgRandWeap.maceSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.maceSlashMax[1],cfgRandWeap.maceSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.maceThrustMin[1],cfgRandWeap.maceThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.maceThrustMax[1],cfgRandWeap.maceThrustMax[2])
		weapEnch = math.random(cfgRandWeap.maceEnch[1],cfgRandWeap.maceEnch[2])
	
	elseif weapType == 4 then
		weapBaseRand = math.random(1,6)
		for i, weapon in pairs(baseIdList.bluntHammer) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.hammerChopMin[1],cfgRandWeap.hammerChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.hammerChopMax[1],cfgRandWeap.hammerChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.hammerSlashMin[1],cfgRandWeap.hammerSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.hammerSlashMax[1],cfgRandWeap.hammerSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.hammerThrustMin[1],cfgRandWeap.hammerThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.hammerThrustMax[1],cfgRandWeap.hammerThrustMax[2])
		weapEnch = math.random(cfgRandWeap.hammerEnch[1],cfgRandWeap.hammerEnch[2])
		
	elseif weapType == 5 then
		weapBaseRand = math.random(1,7)
		for i, weapon in pairs(baseIdList.bluntStaff) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.staffChopMin[1],cfgRandWeap.staffChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.staffChopMax[1],cfgRandWeap.staffChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.staffSlashMin[1],cfgRandWeap.staffSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.staffSlashMax[1],cfgRandWeap.staffSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.staffThrustMin[1],cfgRandWeap.staffThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.staffThrustMax[1],cfgRandWeap.staffThrustMax[2])
		weapEnch = math.random(cfgRandWeap.staffEnch[1],cfgRandWeap.staffEnch[2])
		
	elseif weapType == 6 then
		weapBaseRand = math.random(1,12)
		for i, weapon in pairs(baseIdList.longblade1h) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.lb1hChopMin[1],cfgRandWeap.lb1hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.lb1hChopMax[1],cfgRandWeap.lb1hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.lb1hSlashMin[1],cfgRandWeap.lb1hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.lb1hSlashMax[1],cfgRandWeap.lb1hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.lb1hThrustMin[1],cfgRandWeap.lb1hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.lb1hThrustMax[1],cfgRandWeap.lb1hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.lb1hEnch[1],cfgRandWeap.lb1hEnch[2])
	
	elseif weapType == 7 then
		weapBaseRand = math.random(1,10)
		for i, weapon in pairs(baseIdList.longblade2h) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.lb2hChopMin[1],cfgRandWeap.lb2hChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.lb2hChopMax[1],cfgRandWeap.lb2hChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.lb2hSlashMin[1],cfgRandWeap.lb2hSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.lb2hSlashMax[1],cfgRandWeap.lb2hSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.lb2hThrustMin[1],cfgRandWeap.lb2hThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.lb2hThrustMax[1],cfgRandWeap.lb2hThrustMax[2])
		weapEnch = math.random(cfgRandWeap.lb2hEnch[1],cfgRandWeap.lb2hEnch[2])
		
	elseif weapType == 8 then
		weapBaseRand = math.random(1,6)
		for i, weapon in pairs(baseIdList.marksBow) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.bowChopMin[1],cfgRandWeap.bowChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.bowChopMax[1],cfgRandWeap.bowChopMax[2])
		weapMinSlashDmg = 0
		weapMaxSlashDmg = 0
		weapMinThrustDmg = 0
		weapMaxThrustDmg = 0
		weapEnch = math.random(cfgRandWeap.bowEnch[1],cfgRandWeap.bowEnch[2])
		
	elseif weapType == 9 then
		weapBaseRand = math.random(1,3)
		for i, weapon in pairs(baseIdList.marksXbow) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMaxChopDmg = math.random(cfgRandWeap.xbowChopMax[1],cfgRandWeap.xbowChopMax[2])
		weapMinChopDmg = weapMaxChopDmg
		weapMinSlashDmg = 0
		weapMaxSlashDmg = 0
		weapMinThrustDmg = 0
		weapMaxThrustDmg = 0
		weapEnch = math.random(cfgRandWeap.xbowEnch[1],cfgRandWeap.xbowEnch[2])
		
	elseif weapType == 10 then
		weapBaseRand = math.random(1,9)
		for i, weapon in pairs(baseIdList.shortbladeDagger) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.daggerChopMin[1],cfgRandWeap.daggerChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.daggerChopMax[1],cfgRandWeap.daggerChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.daggerSlashMin[1],cfgRandWeap.daggerSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.daggerSlashMax[1],cfgRandWeap.daggerSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.daggerThrustMin[1],cfgRandWeap.daggerThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.daggerThrustMax[1],cfgRandWeap.daggerThrustMax[2])
		weapEnch = math.random(cfgRandWeap.daggerEnch[1],cfgRandWeap.daggerEnch[2])
		
	elseif weapType == 11 then
		weapBaseRand = math.random(1,12)
		for i, weapon in pairs(baseIdList.shortblade) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
		weapMinChopDmg = math.random(cfgRandWeap.sbChopMin[1],cfgRandWeap.sbChopMin[2])
		weapMaxChopDmg = math.random(cfgRandWeap.sbChopMax[1],cfgRandWeap.sbChopMax[2])
		weapMinSlashDmg = math.random(cfgRandWeap.sbSlashMin[1],cfgRandWeap.sbSlashMin[2])
		weapMaxSlashDmg = math.random(cfgRandWeap.sbSlashMax[1],cfgRandWeap.sbSlashMax[2])
		weapMinThrustDmg = math.random(cfgRandWeap.sbThrustMin[1],cfgRandWeap.sbThrustMin[2])
		weapMaxThrustDmg = math.random(cfgRandWeap.sbThrustMax[1],cfgRandWeap.sbThrustMax[2])
		weapEnch = math.random(cfgRandWeap.sbEnch[1],cfgRandWeap.sbEnch[2])
		
	elseif weapType == 12 then
		weapBaseRand = math.random(1,13)
		for i, weapon in pairs(baseIdList.spear) do
			if i == weapBaseRand then
				weapBaseId = weapon.refid
			end
		end
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
	if Players[pid].data.customVariables.randCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	Players[pid].data.customVariables.randCounter = idIterator
	
	--calculate a new item value based on damage
	weapValue = ((weapMinChopDmg + weapMaxChopDmg + weapMinSlashDmg + weapMaxSlashDmg + weapMinThrustDmg + weapMaxThrustDmg)/6)*10
	
	local newRefId = idIterator .. "_" .. weapBaseId .. "_" .. Players[pid].name
	randomWeapons.StoreRecord(pid, "/storerecord weapon id " .. newRefId)
	randomWeapons.StoreRecord(pid, "/storerecord weapon baseId " .. weapBaseId)
	randomWeapons.StoreRecord(pid, "/storerecord weapon enchantmentCharge " .. weapEnch)
	randomWeapons.StoreRecord(pid, "/storerecord weapon value " .. weapValue)
	randomWeapons.StoreRecord(pid, "/storerecord weapon damageChop " .. weapMinChopDmg .. " " .. weapMaxChopDmg)
	randomWeapons.StoreRecord(pid, "/storerecord weapon damageSlash " .. weapMinSlashDmg .. " " .. weapMaxSlashDmg)
	randomWeapons.StoreRecord(pid, "/storerecord weapon damageThrust " .. weapMinThrustDmg .. " " .. weapMaxThrustDmg)
	randomWeapons.CreateRecord(pid, "/createrecord weapon")
	
	local structuredItem = { refId = newRefId, count = 1, charge = -1}
	table.insert(Players[pid].data.inventory, structuredItem)
	Players[pid]:LoadInventory()
	Players[pid]:LoadEquipment()
	Players[pid]:Save()
	
end

function randomWeapons.StoreRecord(pid, cmd)

	cmd = cmd:split(" ")
    if Players[pid].data.customVariables == nil then
        Players[pid].data.customVariables = {}
    end

    if Players[pid].data.customVariables.storedRecords == nil then
        Players[pid].data.customVariables.storedRecords = {}
    end

    for recordKey, _ in pairs(config.validRecordSettings) do
        if Players[pid].data.customVariables.storedRecords[recordKey] == nil then
            Players[pid].data.customVariables.storedRecords[recordKey] = {}
        end
    end

    local inputType = string.lower(cmd[2])

    if config.validRecordSettings[inputType] == nil then
        Players[pid]:Message("Record type " .. inputType .. " is invalid. Please use one of the following " ..
            "valid types instead: " .. tableHelper.concatenateTableIndexes(config.validRecordSettings, ", ") .. "\n")
        return
    end

    local storedTable = Players[pid].data.customVariables.storedRecords[inputType]
    local inputSetting = cmd[3]

    if inputSetting == "clear" then
        Players[pid].data.customVariables.storedRecords[inputType] = {}
        Players[pid]:Message("Clearing stored " .. inputType .. " data\n")
    elseif inputSetting == "print" then
        local text = "for a record of type " .. inputType

        if tableHelper.isEmpty(storedTable) then
            text = "You have no values stored " .. text .. "."
        else
            text = "You have the current values stored " .. text .. ":\n\n"

            for index, value in pairs(storedTable) do
                text = text .. index .. ": "

                if type(value) == "table" then
                    text = text .. tableHelper.getSimplePrintableTable(value)
                else
                    text = text .. value
                end

                text = text .. "\n"
            end
        end

        tes3mp.CustomMessageBox(pid, config.customMenuIds.recordPrint, text, "Ok")
    elseif inputSetting ~= nil then

        if inputSetting == "add" then
            local inputAdditionType = cmd[4]
            local inputConcatenation
            local inputValues

            if inputAdditionType == nil or cmd[5] == nil then
                Players[pid]:Message("Please provide the minimum number of arguments required.\n")
                return
            else
                inputConcatenation = tableHelper.concatenateFromIndex(cmd, 5)
                inputValues = tableHelper.getTableFromCommaSplit(inputConcatenation)
            end

            if inputAdditionType == "effect" and (inputType == "spell" or
                inputType == "potion" or inputType == "enchantment") then

                if storedTable.effects == nil then
                    storedTable.effects = {}
                end

                local inputEffectId = inputValues[1]

                if type(tonumber(inputEffectId)) == "number" then

                    local effect = { id = tonumber(inputEffectId), rangeType = tonumber(inputValues[2]),
                        duration = tonumber(inputValues[3]), area = tonumber(inputValues[4]),
                        magnitudeMin = tonumber(inputValues[5]), magnitudeMax = tonumber(inputValues[6]),
                        attribute = tonumber(inputValues[7]), skill = tonumber(inputValues[8]) }
                    table.insert(storedTable.effects, effect)
                    Players[pid]:Message("Added effect " .. inputConcatenation .. "\n")
                else
                    Players[pid]:Message("Please use a numerical value for the effect ID.\n")
                end
            elseif inputAdditionType == "part" and (inputType == "armor" or inputType == "clothing") then

                if storedTable.parts == nil then
                    storedTable.parts = {}
                end

                local inputPartType = inputValues[1]

                if type(tonumber(inputPartType)) == "number" then

                    local part = { partType = tonumber(inputPartType), malePart = inputValues[2],
                        femalePart = inputValues[3] }
                    table.insert(storedTable.parts, part)
                    Players[pid]:Message("Added part " .. inputConcatenation .. "\n")
                else
                    Players[pid]:Message("Please use a numerical value for the part type.\n")
                end
            elseif inputAdditionType == "item" and (inputType == "creature" or inputType == "npc") then

                if storedTable.items == nil then
                    storedTable.items = {}
                end

                local inputItemId = inputValues[1]
                local inputItemCount = tonumber(inputValues[2])

                if type(inputItemCount) ~= "number" then
                    inputItemCount = 1
                end

                local item = { id = inputItemId, count = inputItemCount }
                table.insert(storedTable.items, item)
                Players[pid]:Message("Added item " .. inputItemId .. " with count " .. inputItemCount .. "\n")
            else
                Players[pid]:Message(tostring(inputAdditionType) .. " is not a valid addition type for " ..
                    inputType .. " records.\n")
            end

        elseif tableHelper.containsValue(config.validRecordSettings[inputType], inputSetting) then

            local inputValue = tableHelper.concatenateFromIndex(cmd, 4)

            -- Although numerical values are accepted for gender, allow "male" and "female" input
            -- as well
            if inputSetting == "gender" and type(tonumber(inputValue)) ~= "number" then
                local gender

                if inputValue == "male" then
                    gender = 1
                elseif inputValue == "female" then
                    gender = 0
                end

                if type(gender) == "number" then
                    storedTable.gender = gender
                else
                    Players[pid]:Message("Please use either 0/1 or female/male as the gender input.\n")
                    return
                end
            elseif tableHelper.containsValue(config.numericalRecordSettings, inputSetting) then
                inputValue = tonumber(inputValue)

                if type(inputValue) == "number" then
                    storedTable[inputSetting] = inputValue
                else
                    Players[pid]:Message("Please use a valid numerical value as the input for " ..
                        inputSetting .. "\n")
                    return
                end
            elseif tableHelper.containsValue(config.minMaxRecordSettings, inputSetting) then
                local minValue = tonumber(cmd[4])
                local maxValue = tonumber(cmd[5])

                if type(minValue) == "number" and type(maxValue) == "number"  then
                    storedTable[inputSetting] = { min = minValue, max = maxValue }
                else
                    Players[pid]:Message("Please use two valid numerical values as the input for " ..
                        inputSetting .. "\n")
                    return
                end
            elseif tableHelper.containsValue(config.booleanRecordSettings, inputSetting) then
                if inputValue == "true" or inputValue == "on" or tonumber(inputValue) == 1 then
                    storedTable[inputSetting] = true
                elseif inputValue == "false" or inputValue == "off" or tonumber(inputValue) == 0 then
                    storedTable[inputSetting] = false
                else
                    Players[pid]:Message("Please use a valid boolean as the input for " .. inputSetting .. "\n")
                    return
                end
            else
                storedTable[inputSetting] = inputValue
            end

            local message = "Storing " .. inputType .. " " .. inputSetting .. " with value " .. inputValue .. "\n"
            --Players[pid]:Message(message)
        else
            local validSettingsArray = config.validRecordSettings[inputType]
            --Players[pid]:Message(inputSetting .. " is not a valid setting for " .. inputType .. " records. " ..
            --    "Try one of these:\n" .. tableHelper.concatenateArrayValues(validSettingsArray, 1, ", ") .. "\n")
        end
    end
end

function randomWeapons.CreateRecord(pid, cmd)

	cmd = cmd:split(" ")
    if Players[pid].data.customVariables == nil then
        Players[pid].data.customVariables = {}
    end

    if Players[pid].data.customVariables.storedRecords == nil then
        Players[pid].data.customVariables.storedRecords = {}
    end
--[[
    if tableHelper.getCount(cmd) > 2 then
        Players[pid]:Message("This command does not take more than 1 argument. Did you mean to use " ..
            "/storerecord instead?\n")
        return
    end
]]--
    local inputType = string.lower(cmd[2])
    local storedTable = Players[pid].data.customVariables.storedRecords[inputType]
--[[
    if storedTable == nil then
        Players[pid]:Message("Record type " .. inputType .. " is invalid. Please use one of the following " ..
            "valid types instead: " .. tableHelper.concatenateTableIndexes(config.validRecordSettings, ", "))
        return
    end
]]--
    if storedTable.baseId == nil then
--[[        
		if inputType == "creature" then
            Players[pid]:Message("As of now, you cannot create creatures from scratch because of how many " ..
                "different settings need to be implemented for them. Please use a baseId for your creature " ..
                "instead.\n")
            return
        end
]]--
        local missingSettings = {}

        for _, requiredSetting in pairs(config.requiredRecordSettings[inputType]) do
            if storedTable[requiredSetting] == nil then
                table.insert(missingSettings, requiredSetting)
            end
        end

        if not tableHelper.isEmpty(missingSettings) then
            isValid = false
            Players[pid]:Message("You cannot create a record of type " .. inputType .. " because it is missing the " ..
                "following required settings: " .. tableHelper.concatenateArrayValues(missingSettings, 1, ", ") .. "\n")
        end
    end

    if inputType == "enchantment" and (storedTable.effects == nil or tableHelper.isEmpty(storedTable.effects)) then
        Players[pid]:Message("Records of type " .. inputType .. " require at least 1 effect.\n")
        return
    end

    local id = storedTable.id
    local isGenerated = id == nil or logicHandler.IsGeneratedRecord(id)

    local enchantmentStore
    local hasGeneratedEnchantment = tableHelper.containsValue(config.enchantableRecordTypes, inputType) and
        storedTable.enchantmentId ~= nil and logicHandler.IsGeneratedRecord(storedTable.enchantmentId)

    if hasGeneratedEnchantment then
        -- Ensure the generated enchantment used by this record actually exists
        if isGenerated then
            enchantmentStore = RecordStores["enchantment"]

            if enchantmentStore.data.generatedRecords[storedTable.enchantmentId] == nil then
                Players[pid]:Message("The generated enchantment record (" .. storedTable.enchantmentId ..
                    ") you are trying to use for this " .. inputType .. " record does not exist.\n")
                return
            end
        -- Permanent records should only use other permanent records as enchantments, so
        -- go no further if that is not the case
        else
            Players[pid]:Message("You cannot use a generated enchantment record (" .. storedTable.enchantmentId ..
                ") with a permanent record (" .. id .. ").\n")
            return
        end
    end

    local recordStore = RecordStores[inputType]

    if id == nil then
        id = recordStore:GenerateRecordId()
        isGenerated = true
    end

    -- We don't want to insert a direct reference to the storedTable in our record data,
    -- so create a copy of the storedTable and insert that instead
    local savedTable = tableHelper.shallowCopy(storedTable)

    -- The id and the savedTable will form a key-value pair, so there's no need to keep
    -- the id in the savedTable as well
    savedTable.id = nil

    -- Use an autoCalc of 1 by default for entirely new NPCs to avoid spawning them
    -- without any stats
    if inputType == "npc" and savedTable.baseId == nil and savedTable.autoCalc == nil then
        savedTable.autoCalc = 1
        Players[pid]:Message("autoCalc is defaulting to 1 for this record.\n")
    end

    -- Use a skillId of -1 by default for entirely new books to avoid having them
    -- increase a skill
    if inputType == "book" and savedTable.skillId == nil then
        savedTable.skillId = -1
        Players[pid]:Message("skillId is defaulting to -1 for this record.\n")
    end

    local message = "Your record has now been saved as a "

    if isGenerated then
        message = message .. "generated record that will be deleted when no longer used.\n"
        recordStore.data.generatedRecords[id] = savedTable

        -- This record will be sent to everyone on the server below, so track it
        -- as having already been received by players
        for _, player in pairs(Players) do
            if not tableHelper.containsValue(Players[pid].generatedRecordsReceived, id) then
                table.insert(player.generatedRecordsReceived, id)
            end
        end

        -- Is this an enchantable record using an enchantment from a generated record?
        -- If so, add a link to this record for that enchantment record
        if hasGeneratedEnchantment then
            enchantmentStore:AddLinkToRecord(savedTable.enchantmentId, id, inputType)
            enchantmentStore:Save()
        end
    else
        message = message .. "permanent record that you'll have to remove manually when you no longer need it.\n"
        recordStore.data.permanentRecords[id] = savedTable
    end

    recordStore:Save()

    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper(inputType)])

    if inputType == "armor" then packetBuilder.AddArmorRecord(id, savedTable)
    elseif inputType == "book" then packetBuilder.AddBookRecord(id, savedTable)
    elseif inputType == "clothing" then packetBuilder.AddClothingRecord(id, savedTable)
    elseif inputType == "creature" then packetBuilder.AddCreatureRecord(id, savedTable)
    elseif inputType == "enchantment" then packetBuilder.AddEnchantmentRecord(id, savedTable)
    elseif inputType == "miscellaneous" then packetBuilder.AddMiscellaneousRecord(id, savedTable)
    elseif inputType == "npc" then packetBuilder.AddNpcRecord(id, savedTable)
    elseif inputType == "potion" then packetBuilder.AddPotionRecord(id, savedTable)
    elseif inputType == "spell" then packetBuilder.AddSpellRecord(id, savedTable)
    elseif inputType == "weapon" then packetBuilder.AddWeaponRecord(id, savedTable) end

    tes3mp.SendRecordDynamic(pid, true, false)

    if inputType ~= "enchantment" then
        if inputType == "creature" or inputType == "npc" then
            message = message .. "You can spawn an instance of it using /spawnat "
        else
            message = message .. "You can place an instance of it using /placeat "
        end

        message = message .. "<pid> " .. id .. "\n"
    else
        message = message .. "To use it, create an armor, book, clothing or weapon record with an " ..
            "enchantmentId of " .. id .. "\n"
    end

    --Players[pid]:Message(message)
end

return randomWeapons