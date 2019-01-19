# Various Tes3mp scripts

# Alternate Start
Opens a menu at the end of character creation, allowing the player to choose a city they want to start in

# Arena Horde
(Currently shelved)An attempt at making a sort of horde mode in the arena, put on hold due to weird issues with spawning enemies and not knowing how to auto-remove corpses leading to a very cluttered arena

# Armor Reinforcement
Uses a menu to allow a player with a required armorer skill to improve lower tier armor to fill in gaps in armor progression

# Dungeon Loot
Script for a hopefully modular system of cooldown based looting. Explaining how it determines which table it uses is easier with an example
For the Id "dungeonchest_armor_one_a" the script looks for a table "armorone.json"
When a player activates the chest (which could really be any object), the playername, location, id, and time are recorded if it has been long enough since the last activation.
If everything checks out it gives the player an item from the respective table, more details both on file comments and the readme

# Randomized Items
Contains scripts to generate randomized:
Weapons
Armor
Scrolls
Potions
Enchantments (no cast on use yet)
Designed to be customizable and configurable to a specific server's needs

# Res Menu
Gives the player the choice of respawning at an imperial shrine or tribunal temple on death, as opposed to it being random

# Starter Equipment
A simple script to add some basic starter equipment to players based on their skills

# Note Writing
Use ```/write <text>``` (without <>) to create a note with given text.
Makes a check to see if the player has the required item(s) (only paper) by default.
