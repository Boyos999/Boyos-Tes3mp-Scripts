# Random weapons, now with enchantments proof of concept (and armor with constant effect enchants)
1. Download randomWeapons.lua, randomEnchantments.lua, and randomArmor.lua and put them in your scripts folder
2. Download randWeaponBaseIds.json, randEnchEffects.json, and randArmorBaseIds.json and put them in your data folder
3. Download cfgRandWeap.lua, and cfgRandArmor.lua and put it in your scripts folder
4. For testing purposes put the following require statement in commandHandler
```lua
randomWeapons = require("randomWeapons")
randomArmor = require("randomArmor")
```
5. put the following elseif block in process commands also in command handler
```lua
	elseif cmd[1] == "randweap" then
		randomWeapons.CreateRandWeap(pid)
	elseif cmd[1] == "randarmor" then
		randomArmor.CreateRandArmor(pid)
```
6. you can now spawn random weapons using /randweap (you probably don't want to do this on a public server, this is for testing purposes)
7. you can also spawn random armor using /randarmor (no enchants right now)
8. While not required I would recommend pasting the following line into the function OnServerInit in serverCore.lua (if you don't use this the random seed for math.random will be the same each time the server starts, potentially resulting in the same results from math.random rolls and producing duplicate equipment)
```lua
math.randomseed(os.time())
```

NOTE: Random enchantments script currently only supports on strike enchantments (type 1), I'll work on random armor w/enchants at some point
