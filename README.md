# Various Tes3mp scripts

# Alternate Start
Opens a menu at the end of character creation, allowing the player to choose a city they want to start in

# Dungeon Loot
Using this script, if you activate an object with an entry in DungeonLootTables.json
It will then add a random item from that list (should be formatted like DungeonLootTables.json) to the activating player's inventory

# Starter Equipment
A simple script to add some basic starter equipment to players based on their skills

# Note Writing
Use ```/write <text>``` (without <>) to create a note with given text.
Makes a check to see if the player has the required item(s) (only paper) by default.

# Potion Limiter
Limits the number of active potion effects a player can have on them, by default this is 3 at alchemy less
than 50, gaining one extra at 50, 75, and 100 alchemy.
For use with non-vanilla potions, you need to add the required information following the format in vanillapotions.json, any custom records should work by default

Disclaimer: I have no idea what the performance impact of this is

# Player Packet Helper
Contains add/remove item/spell functions for use specifically on players. These functions will also send
players relevant packet data (which are contained as separate functions). Required by Note Writing, Dungeon Loot, 
and Dungeon Tomes.

# Guar Banker
NOT A BANK SCRIPT, Allows players to use /banker to spawn a refId (configurable) on a cooldown, and despawn after a set interval (I tested with kanaBank)