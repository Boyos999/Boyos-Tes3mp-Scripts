# Alternate Start Script
Allows the player to select a location to spawn at when their character is first created

To Install:

1. Download alternateStart.lua and put it in your scripts\menu folder

2. Download altStartHelper.lua and put it in your scripts folder

3. Go to config.lua, find config.menuHelperFiles and add "alternateStart" to the list

4. In eventHandler.lua, find the eventHandler.OnPlayerEndCharGen function and just before the end add the following two lines
```lua
Players[pid].currentCustomMenu = "Alternate Start"
menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
```

5. In serverCore.lua, at the top of the file paste the following with the other require statements
```lua
altStartHelper = require("altStartHelper")
```

6. In Scripts\Players\base.lua Comment or Delete the following block from BasePlayer:EndCharGen
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
