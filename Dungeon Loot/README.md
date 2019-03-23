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
5. Download dungeonLoot.lua and armorone.json, put them in scripts/custom and data/custom folders respectively
6. Add the following require statement to customScripts.lua
```lua
dungeonLoot = require("custom.dungeonLoot")
```
7. While technically optional, I'd recommend using randomnessHelper or some equivalent so the server doesn't have the same randomseed on each restart.