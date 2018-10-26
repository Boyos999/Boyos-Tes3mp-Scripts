# Random weapons proof of concept
1. Download randomWeapons.lua and put it in your scripts folder
2. Download randWeaponBaseIds and put it in your data folder
3. For testing purposes put the following require statement in commandHandler
```lua
randomWeapons = require("randomWeapons")
```
4. put the following elseif block in process commands also in command handler
```lua
	elseif cmd[1] == "randweap" then
		randomWeapons.CreateRandWeap(pid)
```
5. you can now spawn random weapons using /randweap (only war axes, battle axes, maces, and hammers right now)