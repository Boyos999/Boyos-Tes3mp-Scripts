# Alternate Start Script
Allows the player to select a location to spawn at when their character is first created

To Install:
1a. Download alternateStart.lua and put it in your scripts\menu folder
1b. Download altStartHelper.lua and put it in your scripts folder
2. Go to config.lua, find config.menuHelperFiles and add "alternateStart" to the list
3a. In eventHandler.lua, find the eventHandler.OnPlayerEndCharGen function and just before the end add the following two lines
```lua
Players[pid].currentCustomMenu = "Alternate Start"
menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
```
3b. In logicHandler.lua, at the top of the file paste the following with the other require statements
```lua
altStartHelper = require("altStartHelper")
```
3c. Then also in logicHandler.lua, paste the following block near the bottom, before the return statements
```lua
logicHandler.TeleportPlayerToLocation = function(pid, altCell,altPos,altRot)
	altStartHelper.altStartFunction(pid, altCell,altPos,altRot)
end
```
4. Comment or Delete the following block from BasePlayer:EndCharGen
NOTE: This step can be skipped if you're unsure, players will just load into balmora before the alternate start menu pops up

```lua

if config.defaultSpawnCell ~= nil then

        tes3mp.SetCell(self.pid, config.defaultSpawnCell)
        tes3mp.SendCell(self.pid)

        if config.defaultSpawnPos ~= nil and config.defaultSpawnRot ~= nil then
            tes3mp.SetPos(self.pid, config.defaultSpawnPos[1],
                config.defaultSpawnPos[2], config.defaultSpawnPos[3])
            tes3mp.SetRot(self.pid, config.defaultSpawnRot[1], config.defaultSpawnRot[2])
            tes3mp.SendPos(self.pid)
        end
    end
```
