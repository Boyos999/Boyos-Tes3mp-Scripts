# INSTALL INSTRUCTIONS
1. Download noteWriting.lua, put it in your scripts folder
2. Add the following to the require statements at the top of commandHandler.lua
```lua
	noteWriting = require("noteWriting")
```
3. In commandHandler.lua add the following block to the end of the commmand chain elseif block
```lua
	elseif cmd[1] == "write" then
		local playerNote = noteWriting.CreateNote(pid,cmd)
		if playerNote ~= nil then
			table.insert(Players[pid].data.inventory, playerNote)
			Players[pid]:LoadInventory()
			Players[pid]:LoadEquipment()
		end
```
4. This will allow players to write notes using /write followed by the text of the note
