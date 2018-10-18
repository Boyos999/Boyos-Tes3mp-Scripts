# Alternate Start Script
Allows the player to select a location to spawn at when their character is first created

To Install:
1. Download alternateStart.lua and put it in your scripts\menu folder
2. Go to config.lua, find config.menuHelperFiles and add "alternateStart" to the list
3. In scripts\player\base.lua, find the BasePlayer:EndCharGen function and just before the end add the following two lines
```lua
Players[self.pid].currentCustomMenu = "Alternate Start"
menuHelper.DisplayMenu(self.pid, Players[self.pid].currentCustomMenu)
```
4. Comment or Delete the following block from BasePlayer:EndCharGen

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

5. Paste the following block at the end of the base.lua file just before Return BasePlayer (will eventually go in its own file)

```lua
function BasePlayer:AltStart(altCell,altPos,altRot)

    if altCell ~= nil then

        tes3mp.SetCell(self.pid, altCell)
        tes3mp.SendCell(self.pid)

        if altPos ~= nil and altRot ~= nil then
            tes3mp.SetPos(self.pid, altPos[1], altPos[2], altPos[3])
            tes3mp.SetRot(self.pid, altRot[1], altRot[2])
            tes3mp.SendPos(self.pid)
        end
    end
end
```

