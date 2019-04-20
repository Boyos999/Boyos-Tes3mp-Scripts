# INSTALL INSTRUCTIONS
1. Download playerPacketHelper.lua and put it in your scripts/custom folder
2. Add the following to the require statements to the top of customScripts.lua (above any scripts that use it's functions)
```lua
	playerPacketHelper = require("custom.playerPacketHelper")
```

# Functions

`addPlayerItems` and `removePlayerItems` Add the items serverside, and send the player only the information they need
rather than loading the whole inventory using the `sendInventoryChanges` function

`addPlayerSpells` and `removePlayerSpells` Add the spells serverside, and send the player only the information they need
rather than reloading the whole spellbook using the `sendSpellbookChanges` function


* `addPlayerItems`
  * `pid`
  * `itemTable` Table containing information on items to add, see comments and test function for more
* `removePlayerItems`
  * same as above but removes items
* `addPlayerSpells`
  * `pid`
  * `spellList` List containing ids of spells to add, see comments and test function for more
* `removePlayerSpells`
  * same as above but removes spells
* `sendInventoryChanges`
  * `pid`
  * `packetTable` Table of items, the same as is sent to add/remove functions
  * `enumeration` Takes enumerations.inventory.ADD, .REMOVE, or .SET 
    * only .ADD and .REMOVE used here
* `sendSpellbookChanges`
  * `pid`
  * `spellList` List of spell ids to add/remove
  * `enumeration` Takes enumerations.spellbook.ADD, .REMOVE, or .SET
    * only .ADD and .REMOVE used here
