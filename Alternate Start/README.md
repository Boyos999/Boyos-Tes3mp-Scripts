# Alternate Start Script
Allows the player to select a location to spawn at when their character is first created

To Install:

1. Download altStartLocations.json and put it in your data\custom folder

2. Download altStart.lua and put it in your scripts\custom folder

3. In customScripts.lua add the following require statement
```
    altStart = require("custom.altStart")
```

4. If you have `config.useInstancedSpawn = true` in config.lua the script won't do anything, set to false for alternate start

5. If you'd like to add more starting locations, add them to altStartLocations.json in one of the existing categories, or a new category following this format
```
    "<category>":{
        {
            "name": "<what you want this option to appear as in the menu>",
            "cell": "<cell id>",
            "loc": {<X>,<Y>,<Z>,<RotX>,<RotY>}
        }
    }
```
