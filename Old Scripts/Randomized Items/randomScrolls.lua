local randomScrolls = {}

--[[
Takes the player's pid and the number of effects for the scroll.
Returns a scroll in the form of a structured item
]]--

function randomScrolls.CreateRandomScroll(pid,numEffects)
	local idIterator = WorldInstance.data.customVariables.randScrollCounter
	local scrollIcon = "m\\tx_scroll_open_01.tga"
	local scrollModel = "m\\text_scroll_01.nif"
	local scrollName = "Ancient Scroll"
	local scrollId
	local enchId
	local scrollValue
	local scrollWeight = 0.20
	local recordTable = {}
	
	enchId = randomEnchantments.CreateRandEnch(pid,0,numEffects)
	
	if WorldInstance.data.customVariables.randScrollCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.randScrollCounter = idIterator
	
	scrollId = "random_scroll_" .. idIterator
	scrollValue = math.random(150,450)

	recordTable["name"] = scrollName
	recordTable["model"] = scrollModel
	recordTable["icon"] = scrollIcon
	recordTable["scrollState"] = true
	recordTable["weight"] = scrollWeight
	recordTable["value"] = scrollValue
	recordTable["enchantmentId"] = enchId
	recordTable["skillId"] = "-1"
	randomScrolls.nuCreateScrollRecord(pid, scrollId, recordTable)
	
	local structuredItem = { refId = scrollId, count = 1, charge = -1}
	Players[pid]:Save()
	WorldInstance:Save()
	return structuredItem
	
end
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function randomScrolls.nuCreateScrollRecord(pid, scrollId, recordTable)
	local id = scrollId
	local recordStore = RecordStores["book"]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("book")])
	packetBuilder.AddBookRecord(id, savedTable)
	tes3mp.SendRecordDynamic(pid, true, false)
	
end

return randomScrolls