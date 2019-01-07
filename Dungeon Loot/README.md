# INSTALL INSTRUCTIONS
1. Using this script, if you activate an object with an id that begins with "dungeonchest_", (ex. dungeonchest_armor_one), following the example it will look for the example table armorone.json
2. It will then add a random item from that list (should be formatted like armorone.json) to the activating player's inventory
3. Cooldown time is specified at the top of the file, during which players will not get items
4. Check the comments for more information (or ask), the table included is an example ex. custom chest (the name and model don't matter, but the id and noPickUp script are important) You'll also have to override collision for the placed objects
```lua
      "dungeonchest_armor_one_a":{
      "name":"Armor Chest",
      "model":"o\\Contain_De_Chest_01.NIF",
      "script":"noPickUp"
    }
```
5. Download dungeonLoot.lua and armorone.json, put them in scripts and data folders respectively
6. paste the following block in event handler's OnObjectActivate function after 
```lua 
objectUniqueIndex = tes3mp.GetObjectRefNum(index) .. "-" .. tes3mp.GetObjectMpNum(index)
```

```lua
--dungeonLoot
if dungeonLoot.CheckId(objectRefId,pid) == true then
	if dungeonLoot.CheckCooldown(pid, tes3mp.GetCell(pid), objectRefId) == true then
		dungeonLoot.Reward(pid, objectRefId)
		isValid = false
	end
end
--dungeonLoot
```
7. Add the following require statement at the top of evenhandler with the rest
```lua
dungeonLoot = require("dungeonLoot")
```
