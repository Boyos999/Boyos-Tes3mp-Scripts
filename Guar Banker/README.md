# Guar Banker
1. Doesn't actually include any banking scripts
2. Allows players to use /banker to spawn a refId (configurable) on a cooldown, and despawn after a set interval (I tested with kanaBank)
3. Put the script in server/scripts/custom, add the following to customScripts.lua
```lua
guarBanker = require("custom.guarBanker")
```