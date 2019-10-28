# INSTALL INSTRUCTIONS
1. Download spellBookTemplates.lua and put it in your scripts/custom folder
2. Download spellBookTemplatesTable.json and put it in your data/custom folder
3. Add the following to the require statements to the top of customScripts.lua (above any scripts that use it's functions)
```lua
	spellBookTemplates = require("custom.spellBookTemplates")
```

# Functions

`spellBookTemplates.setTemplate` and `spellBookTemplates.removeTemplate` Add and remove the spells listed in the respective table, and restrict
player spell use to the spells in the table while they have a template active. See spellBookTemplatesTable.json for example formatting


* `setTemplate`
  * `pid`
  * `spellTemplate` String index of the spellBookTemplate from spellBookTemplatesTable.json
* `removeTemplate`
  * `pid`