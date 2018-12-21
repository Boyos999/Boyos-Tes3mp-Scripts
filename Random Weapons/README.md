# Random weapons and armor with random enchantments, as well as random potions
1. Download randomWeapons.lua, randomEnchantments.lua, randomPotions, and randomArmor.lua and put them in your scripts folder
2. Download randWeaponBaseIds.json, randEnchEffects.json, randPotionEffects.json, and randArmorBaseIds.json and put them in your data folder
3. Download cfgRandWeap.lua, and cfgRandArmor.lua and put it in your scripts folder
4. FOR TESTING: put the following require statement in commandHandler
```lua
randomWeapons = require("randomWeapons")
randomArmor = require("randomArmor")
randomPotions = require("randomPotions")
```
5. FOR TESTING: put the following elseif block in process commands also in command handler
```lua
	elseif cmd[1] == "randweap" then
		local randomWeap = randomWeapons.CreateRandWeap(pid,1)
		table.insert(Players[pid].data.inventory, randomWeap)
		Players[pid]:LoadInventory()
		Players[pid]:LoadEquipment()
		Players[pid]:Save()
		
	elseif cmd[1] == "randarmor" then
		local randomArmor = randomArmor.CreateRandArmor(pid,1)
		table.insert(Players[pid].data.inventory, randomArmor)
		Players[pid]:LoadInventory()
		Players[pid]:LoadEquipment()
		Players[pid]:Save()
		
	elseif cmd[1] == "randpotion" then
		local randomPotion = randomPotions.CreateRandomPotion(pid, 1)
		table.insert(Players[pid].data.inventory, randomPotion)
		Players[pid]:LoadInventory()
		Players[pid]:LoadEquipment()
		Players[pid]:Save()
```
6. you can now spawn random weapons using /randweap (you probably don't want to do this on a public server, this is for testing purposes)
7. you can also spawn random armor using /randarmor (only constant effect enchants right now)
8. And Random potions with /randpotion
9. While not required I would recommend pasting the following line into the function OnServerInit in serverCore.lua (if you don't use this the random seed for math.random will be the same each time the server starts, potentially resulting in the same results from math.random rolls and producing duplicate equipment)
```lua
math.randomseed(os.time())
```

NOTE: Random enchantments script currently only supports on strike enchantments (type 1), and constant effect enchantments (type 3), in both randomArmor.lua and randomWeapons.lua there is a block of code with the comment "enchants," the code here determines the chance of an item being enchanted.
