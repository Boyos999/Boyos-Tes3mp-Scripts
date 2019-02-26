# INSTALL INSTRUCTIONS
1. it's basically the same as dungeonloot but for spells
2. included example table is for item with id dungeontome_tome_gods
3. eventhandler thing in onobjectactivate just under/above dungeonloot function
```lua
dungeonTome.main(pid, objectRefId, tes3mp.GetCell(pid))
```
4. require statement
```lua
dungeonTome = require("dungeonTome")
```