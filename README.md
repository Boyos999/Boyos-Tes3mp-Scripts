# Various Tes3mp scripts

# Alternate Start
Opens a menu at the end of character creation, allowing the player to choose a city they want to start in

# Starter Equipment
A simple script to add some basic starter equipment to players based on their skills

# Note Writing
Use ```/write <text>``` (without <>) to create a note with given text.
Makes a check to see if the player has the required item(s) (only paper) by default.

# Potion Limiter
Limits the number of active potion effects a player can have on them, by default this is 3 at alchemy less
than 50, gaining one extra at 50, 75, and 100 alchemy.
For use with non-vanilla potions, you need to add the required information following the format in vanillapotions.json, any custom records should work by default

# Player Packet Helper
Contains add/remove item/spell functions for use specifically on players. These functions will also send
players relevant packet data (which are contained as separate functions). Required by Note Writing, Dungeon Loot, 
and Dungeon Tomes.

# Guar Banker
NOT A BANK SCRIPT, Allows players to use /banker to spawn a refId (configurable) on a cooldown, and despawn after a set interval (I tested with kanaBank)

# Player Corpses Persist
Causes player deaths to leave a persistent, non-interactive (not lootable) corpse. By default retains 2 corpses per player, and corpses can be removed by activating them.

Known Issues 
- Corpse positioning is not exact due to death animations
- When a "corpse" is spawned it will play a death animation

# True Halberds
A simple script that will create custom weapon records for halberds with more reasonable damage values based on the model of the weapon.

# Training Limiter
A script that will prevent players from training more than a specified number of times per level. Unused training carries over to the next level, for example with default values a level 1 player will be able to train 5 times, if they don't use any training when they hit level 2 they will be able to train 10 times.

Known Issues
- Message Box will show increase to player skill even if it was blocked
- Skill increases to Sneak or Security from being jailed will be counted as training

# Javelins
Adds "javelin" records (throwable spears), and a crafting item that can be used to convert spears into javelins

# Coop Instruments
Allows players to hear instruments played by other players, supports 6th house bells and indoril instruments from TR

# Familiars
Adds "carryable" familiars

# Heart Fixer
Fixes/re-implements a couple scripts relating to the final encounter of the main quest to work better in multiplayer when using journal sharing. No more end game scripts triggering from a bucket.
 
 # Potion Tweaks
Allows for easy adjustment of the value, weight, magnitude, and duration of player made potions.

# Enchant Tweaks
Adjust player made constant effect enchantments that have a magnitude range to always take the max, average, or min magnitude

# TR Summons
Workaround script for new Tamriel Rebuilt summon spells that are otherwise MWSE-only
