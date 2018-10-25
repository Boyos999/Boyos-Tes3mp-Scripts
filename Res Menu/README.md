# INSTALL INSTRUCTIONS
1. Download resMenu.lua, put it in scripts\Menu folder
2. Download resMenuHelper.lua and put it in your scripts folder
3. Go to config.lua, find config.menuHelperFiles and add "resMenu" to the list
4. Find eventHandler.OnDeathTimeExpiration = function(pid) in eventHandler.lua, replace Players[pid]:Ressurect() 
with the following two lines (inside the if block)
```lua
	Players[pid].currentCustomMenu = "Res Menu"
	menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
```

ex. function should look like
```lua
eventHandler.OnDeathTimeExpiration = function(pid)
    if Players[pid] ~= nil and Players[pid]:IsLoggedIn() then
        Players[pid].currentCustomMenu = "Res Menu"
        menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
    end
end
```
5. In logicHandler.lua add the following line near the top with the rest of the require statements
```lua
resMenuHelper = require("resMenuHelper")
```
6. Also in logicHandler.lua add the following function near the bottom, before the return
```lua
logicHandler.ResMenu = function(pid, location)
	resMenuHelper.ResMenuFunction(pid,location)
end
```
