# Various Tes3mp scripts

# Alternate Start
Opens a menu at the end of character creation, allowing the player to choose a city they want to start in


# Dungeon Loot
Script for a hopefully modular system of cooldown based looting. Explaining how it determines which table it uses is easier with an example
For the Id "dungeonchest_armor_one_a" the script looks for a table "armorone.json"
When a player activates the chest (which could really be any object), the playername, location, id, and time are recorded if it has been long enough since the last activation.
If everything checks out it gives the player an item from the respective table, more details both on file comments and the readme

# Old Scripts
Scripts that I no longer have interest in updating but should technically still work

# Res Menu
Gives the player the choice of respawning at an imperial shrine or tribunal temple on death, as opposed to it being random

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
