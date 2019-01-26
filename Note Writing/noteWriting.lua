local noteWriting = {}

--[[
Takes a pid, and the cmd inputted into chat.
Returns either a structured item, or nil if the player lacks paper.
]]--
function noteWriting.CreateNote(pid,cmd)
	--Make sure there is text after /write
	if cmd[2] == nil then
		Players[pid]:Message("No text given")
		return nil
	end
	
	--Checks if players have the required Item(s)
	if inventoryHelper.containsItem(Players[pid].data.inventory,"sc_paper plain") then
		inventoryHelper.removeItem(Players[pid].data.inventory,"sc_paper plain",1)
		Players[pid]:Message("You made a note")
	else
		Players[pid]:Message("You lack the materials to make a note")
		return nil
	end
	
	--Declare variables here
	local idIterator = WorldInstance.data.customVariables.noteCounter
	local noteId
	local noteName = Players[pid].name .. "'s Note"
	local noteModel = "m\\Text_Note_02.nif"
	local noteIcon = "m\\Tx_note_02.tga"
	local noteWeight = 0.20
	local noteValue = 1
	local noteText = cmd[2]
	local i = 3
	local recordTable = {}
	
	--Put the text back together
	while cmd[i] ~= nil do 
		noteText = noteText .. " " .. cmd[i]
		i = i + 1
	end
	noteText = "<DIV ALIGN=\"CENTER\">" .. noteText .. "<p>"
	--Unique world variable to prevent duplicate Ids
	if WorldInstance.data.customVariables.noteCounter == nil then
		idIterator = 0
	else
		idIterator = idIterator + 1
	end
	WorldInstance.data.customVariables.noteCounter = idIterator
	
	noteId = "player_note_" .. idIterator
	
	--Storing and creating custom records
	--I'll make proper functions at some point I swear
	recordTable["weight"] = noteWeight
	recordTable["icon"] = noteIcon
	recordTable["skillId"] = "-1"
	recordTable["model"] = noteModel
	recordTable["text"] = noteText
	recordTable["value"] = noteValue
	recordTable["scrollState"] = true
	recordTable["name"] = noteName

	noteWriting.nuCreateBookRecord(pid, noteId, recordTable)
	
	local structuredItem = { refId = noteId, count = 1, charge = -1}
	Players[pid]:Save()
	WorldInstance:Save()
	return structuredItem
end
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function noteWriting.nuCreateBookRecord(pid, noteId, recordTable)
	local id = noteId
	local recordStore = RecordStores["book"]
	local savedTable = recordTable
	
	recordStore.data.permanentRecords[id] = savedTable
	recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("book")])
	packetBuilder.AddBookRecord(id, savedTable)
	tes3mp.SendRecordDynamic(pid, true, false)
	
end

return noteWriting
