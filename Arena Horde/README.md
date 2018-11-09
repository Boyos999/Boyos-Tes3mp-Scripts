# Arena Horde script UNFINISHED
1. Download arenaHorde.lua and put it in your scripts folder
2. Download arenaCreatures.json and put it in your data folder
3. For testing purposes put the following require statement in commandHandler and eventHandler
```lua
arenaHorde = require("arenaHorde")
```
4. put the following elseif block in process commands also in command handler
```lua
	elseif cmd[1] == "arena" and admin then
		if cmd[2] == nil then
			arenaHorde.ArenaStart(pid, 1, 1)
		elseif cmd[3] == nil then
			arenaHorde.ArenaStart(pid, cmd[2], 1)
		else
			arenaHorde.ArenaStart(pid, cmd[2],cmd[3])
		end
	elseif cmd[1] == "arenastop" and admin then
		arenaHorde.ArenaStop(pid)
```
5. In eventHandler paste the following block in eventHandler.OnWorldKillCount = function(pid)
```lua
	if WorldInstance.data.customVariables.arenaStatus == 1 then
		arenaHorde.ArenaContinue(pid)
	end
```
6. example of previous step
```lua
eventHandler.OnWorldKillCount = function(pid)
	if Players[pid] ~= nil and Players[pid]:IsLoggedIn() then
		WorldInstance:SaveKills(pid)
	end
	if WorldInstance.data.customVariables.arenaStatus == 1 then
		arenaHorde.ArenaContinue(pid)
	end
end

```
