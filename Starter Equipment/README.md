# Starter Equipment Script
1. Download starterEquipment.lua and put it in your scripts folder
2. In eventHandler.lua, find the eventHandler.OnPlayerEndCharGen function and just before the end add the following line
```lua
starterEquipment.GiveStarterItems(pid)
```
3. Also in eventHander.lua, add the following line at the top under the [ commandHandler = require("commandHandler") ] line
```lua
starterEquipment = require("starterEquipment")
```
