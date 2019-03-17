local armorImprovementHelper = {}

function armorImprovementHelper.ArmorReinforcementFunction(pid, armorName, armorRating, armorHealth)
	local idIterator = WorldInstance.data.customVariables.armorImpCounter
	local recordTable = {}
	if WorldInstance.data.customVariables.armorImpCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.randCounter = idIterator
	
	local newRefId = string.lower(armorName .. "_" .. idIterator)
	
	recordTable["baseId"] = armorName
	recordTable["armorRating"] = armorRating
	recordTable["health"] = armorHealth
	randomArmor.nuCreateArmorRecord(pid, newRefId, recordTable)
	
	local structuredItem = { refId = newRefId, count = 1, charge = -1}
	table.insert(Players[pid].data.inventory, structuredItem)
	Players[pid]:LoadInventory()
	Players[pid]:LoadEquipment()
	WorldInstance:Save()

end

--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function armorImprovementHelper.nuCreateArmorRecord(pid, armorId, recordTable)
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

return armorImprovementHelper
