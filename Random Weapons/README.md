# Random weapons proof of concept
1. Download randomWeapons.lua and put it in your scripts folder
2. Download randWeaponBaseIds.json and put it in your data folder
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