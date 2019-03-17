logicHandler = require("logicHandler")

local arenaHorde = {}

function arenaHorde.ArenaStart(pid,playerMult,diffMult)
	if Players[pid].data.location.cell == "Vivec, Arena Pit" then
		WorldInstance.data.customVariables.arenaStatus = 1
		WorldInstance.data.customVariables.arenaWave = 1
		WorldInstance.data.customVariables.arenaCreature = "scrib" .. "_arena_" .. diffMult
		WorldInstance.data.customVariables.arenaDiffMult = diffMult
		WorldInstance.data.customVariables.arenaPlayerMult = playerMult
		WorldInstance.data.customVariables.arenaWaveKills = 0
		arenaHorde.ArenaWave(pid,playerMult,diffMult,1)
	else
		Players[pid]:Message("You can't begin without being in the arena\n")
	end	
end

function arenaHorde.ArenaContinue(pid)
	local killID
	local arenaCreatureRefid = WorldInstance.data.customVariables.arenaCreature
	local currentWave = WorldInstance.data.customVariables.arenaWave
	local diffMult = WorldInstance.data.customVariables.arenaDiffMult
	local playerMult = WorldInstance.data.customVariables.arenaPlayerMult
	local waveKills = WorldInstance.data.customVariables.arenaWaveKills
	local arenaWave = WorldInstance.data.customVariables.arenaWave
	local i
    for i = 0, tes3mp.GetKillChangesSize(pid) - 1 do
        killID = tes3mp.GetKillRefId(pid, i)
        if killID == arenaCreatureRefid then
            waveKills = waveKills + 1
        end
    end
	
	WorldInstance.data.customVariables.arenaWaveKills = waveKills
	
	if waveKills == playerMult*3 then
		arenaWave = arenaWave + 1
		WorldInstance.data.customVariables.arenaWave = arenaWave
		WorldInstance.data.customVariables.arenaWaveKills = 0
		arenaHorde.ArenaWave(pid,playerMult,diffMult,arenaWave)
	end
end

function arenaHorde.ArenaStop(pid)
	WorldInstance.data.customVariables.arenaStatus = 0
	Players[pid]:Message("stopping arena script\n")
end


function arenaHorde.ArenaWave(pid,playerMult,diffMult,wave)
	local packetType = "spawn"
	local creatureTable = jsonInterface.load("arenaCreatures.json")
	local posXRange = {-672,576}
	local posYRange = {-352,416}
	local posZset = -395
	local cell = "Vivec, Arena Pit"
	local playerMultNum = tonumber(playerMult)
	local diffMultNum = tonumber(diffMult)
	
	local creatureRefid
	local arenaCreatureRefid
	local i = 0
	local j = 1
	for i, creature in pairs(creatureTable.creatures) do
		if i == wave then
			creatureRefid = creature.refid
		end
	end
	
	if creatureRefid == nil then
		arenaHorde.ArenaStop(pid)
	else
		arenaCreatureRefid = creatureRefid .. "_arena_" .. diffMult
		
		WorldInstance.data.customVariables.arenaCreature = arenaCreatureRefid
		
		arenaHorde.StoreRecord(pid, "/storerecord creature clear")
		arenaHorde.StoreRecord(pid, "/storerecord creature id " .. arenaCreatureRefid)
		arenaHorde.StoreRecord(pid, "/storerecord creature baseId " .. creatureRefid)
		arenaHorde.CreateRecord(pid, "/createrecord creature")
		
		for j=1,playerMultNum*3 do
			local structuredLocation = {
				posX = math.random(posXRange[1],posXRange[2]),
				posY = math.random(posYRange[1],posYRange[2]),
				posZ = posZset,
				rotX = 0,
				rotY = 0,
				rotZ = math.random(0,360)
			}
			logicHandler.CreateObjectAtLocation(cell,structuredLocation,arenaCreatureRefid,packetType)
		end
	end
end

function arenaHorde.StoreRecord(pid, cmd)

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
        --Players[pid]:Message("Clearing stored " .. inputType .. " data\n")
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

function arenaHorde.CreateRecord(pid, cmd)

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


return arenaHorde
