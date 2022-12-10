# TR Summons Script
1. Download both files and put them your scripts\custom folder
2. In customScripts.lua, add the following require statement
```
trSummons = require("custom.trSummons")
```

# Known issues/workarounds
1. Magic effects for new summon spells show as "Command Creature 1000 levels on self for 60 seconds"
    1. This is because tes3mp has no support for creating custom magic effect records
2. The summons do not despawn on death and are lootable (until the spell expires or the player disconnects)
3. Summons spawn at the player's exact location
4. Summons cannot be used in player-made spells
5. Unlike vanilla summons, the new tr summoned creatures have the same refId as their base versions. Any script that relies on this refId will apply to summoned variants as well.
6. Summons will not work for NPCs