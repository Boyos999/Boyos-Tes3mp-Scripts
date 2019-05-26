local noteWriting = {}
--[[
Takes a pid, and the cmd inputted into chat.
Returns either a structured item, or nil if the player lacks paper.
]]--
function noteWriting.CreateNote(pid,cmd)
    --Make sure there is text after /write
    if cmd[2] == nil then
        Players[pid]:Message(color.Red .. "No text given\n")
        return
    end
    
    --Declare variables here
    local noteId
    local noteName = Players[pid].name .. "'s Note"
    local noteModel = "m\\Text_Note_02.nif"
    local noteIcon = "m\\Tx_note_02.tga"
    local noteWeight = 0.20
    local noteValue = 1
    local noteText
    local packetItem = {}
    local recordTable = {}
    
    --Checks if players have the required Item(s)
    if inventoryHelper.containsItem(Players[pid].data.inventory,"sc_paper plain") then
        playerPacketHelper.removePlayerItems(pid, {{refId = "sc_paper plain", count = 1}})
        Players[pid]:Message(color.Green .. "You made a note\n")
    elseif inventoryHelper.containsItem(Players[pid].data.inventory,"sc_paper_plain_01_canodia") then
        playerPacketHelper.removePlayerItems(pid, {{refId = "sc_paper_plain_01_canodia", count = 1}})
        Players[pid]:Message(color.Green .. "You made a note\n")
    else
        Players[pid]:Message(color.Red .. "You lack the materials to make a note\n")
        return
    end

    --Put the text back together
    noteText = table.concat(cmd, " ",2)

    noteText = "<DIV ALIGN=\"CENTER\">" .. noteText .. "<p>"
    recordTable["weight"] = noteWeight
    recordTable["icon"] = noteIcon
    recordTable["skillId"] = "-1"
    recordTable["model"] = noteModel
    recordTable["text"] = noteText
    recordTable["value"] = noteValue
    recordTable["scrollState"] = true
    recordTable["name"] = noteName

    noteId = noteWriting.nuCreateBookRecord(pid, recordTable)
    Players[pid]:AddLinkToRecord("book", noteId)
    playerPacketHelper.addPlayerItems(pid, {{refId = noteId, count = 1}})
end

customCommandHooks.registerCommand("write", noteWriting.CreateNote)
--[[
Based on Create and store record functions from commandhandler in https://github.com/TES3MP/CoreScripts 
]]--
function noteWriting.nuCreateBookRecord(pid, recordTable)
    local recordStore = RecordStores["book"]
    local id = recordStore:GenerateRecordId()
    local savedTable = recordTable
    
    recordStore.data.generatedRecords[id] = savedTable
    for _, player in pairs(Players) do
        if not tableHelper.containsValue(Players[pid].generatedRecordsReceived, id) then
            table.insert(player.generatedRecordsReceived, id)
        end
    end
    recordStore:Save()
    tes3mp.ClearRecords()
    tes3mp.SetRecordType(enumerations.recordType[string.upper("book")])
    packetBuilder.AddBookRecord(id, savedTable)
    tes3mp.SendRecordDynamic(pid, true, false)
    
    return id
end

return noteWriting
