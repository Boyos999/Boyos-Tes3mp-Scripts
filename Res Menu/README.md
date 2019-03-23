# INSTALL INSTRUCTIONS
1. Download resMenu.lua, put it in scripts\Menu folder
2. Download resMenuHelper.lua and put it in your scripts/custom folder
3. Go to config.lua, find config.menuHelperFiles and add "resMenu" to the list
4. In customScripts.lua add the following require statement
```
resMenuHelper = require("custom.resMenuHelper")
```
