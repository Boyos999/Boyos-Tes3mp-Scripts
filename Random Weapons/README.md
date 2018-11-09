# Random weapons, now with enchantments proof of concept
1. Download randomWeapons.lua and randomEnchantments.lua and put them in your scripts folder
2. Download randWeaponBaseIds.json and randEnchEffects.json and put them in your data folder
3. Download cfgRandWeap.lua and put it in your scripts folder
4. For testing purposes put the following require statement in commandHandler
```lua
randomWeapons = require("randomWeapons")
```
5. put the following elseif block in process commands also in command handler
```lua
	elseif cmd[1] == "randweap" then
		randomWeapons.CreateRandWeap(pid)
```
6. you can now spawn random weapons using /randweap (you probably don't want to do this on a public server, this is for testing purposes)

NOTE: Random enchantments script currently only supports on strike enchantments (type 1), I'll work on random armor w/enchants at some point