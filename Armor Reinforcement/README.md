# Armor Reinforcement Script
Menus that allow players to "Reinforce" pieces of armor to increase their armor rating and health to fill in gaps in armor progression

Works by creating a custom record for the piece of armor based on the original

Currently supports reinforcing Netch leather (20-25 armor rating), Bonemold (25-28), and Iron (30).
Current requirements for all are 1 Journeyman's repair hammer (not consumed), 1 original piece of armor, and an armorer skill of 50.




1. Download armorImprovementHelper.lua and put it in your scripts folder
2. Download armorImprovement.lua and put it in your scripts\menu folder
3. In logicHandler.lua, add the following require statement at the top near the rest
```lua
armorImprovementHelper = require("armorImprovementHelper")
```
4. Also in logicHander.lua, add the following function near the bottom, before the return
```lua
logicHandler.ArmorReinforcement = function(pid, armorName, armorRating, armorHealth)	
	armorImprovementHelper.ArmorReinforcementFunction(pid, armorName, armorRating, armorHealth)
end
```
5. In commandHandler.lua, in the function commandHandler.ProcessCommand(pid, cmd) paste the following block near the end, before the else (with not a valid command string)
NOTE: you can change "armorimp" to whatever command you want it to be (ex. with armorimp the chat command is /armorimp)
```lua
	elseif cmd[1] == "armorimp" then
		Players[pid].currentCustomMenu = "Armor Reinforcement"
		menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
```lua
