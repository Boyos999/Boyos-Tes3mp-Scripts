# Random weapons, now with enchantments proof of concept (and armor without enchantments)
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

NOTE: Random enchantments script currently only supports on strike enchantments (type 1), I'll work on random armor w/enchants at some point
