--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts
--UNFINISHED
--to install add the following block at the bottom of eventHandler.lua, before the return
--[[
eventHandler.ArmorReinforcement = function(pid, armorName, armorRating, armorHealth)
	local newRefId = Players[pid].name .. "_" .. armorName
	eventHandler.OnPlayerSendMessage(pid, "/storerecord armor id " .. newRefId)
	eventHandler.OnPlayerSendMessage(pid, "/storerecord armor baseId " .. armorName)
	eventHandler.OnPlayerSendMessage(pid, "/storerecord armor armorRating " .. armorRating)
	eventHandler.OnPlayerSendMessage(pid, "/storerecord armor health " .. armorHealth)
	eventHandler.OnPlayerSendMessage(pid, "/createrecord armor")
	local structuredItem = { refId = newRefId, count = 1, charge = -1}
	table.insert(Players[pid].data.inventory, structuredItem)
	Players[pid]:LoadInventory()
	Players[pid]:LoadEquipment()
end
]]--
Menus["Armor Reinforcement"] = {
	text = "What class of armor would you like to reinforce?",
	buttons = {
		{ caption = "Light Armor", 
			destinations = { 
				menuHelper.destinations.setDefault("Light Armor") 
			} 
		},
		{ caption = "Medium Armor", 
			destinations = { 
				menuHelper.destinations.setDefault("Medium Armor") 
			} 
		},
		{ caption = "Heavy Armor", 
			destinations = { 
				menuHelper.destinations.setDefault("Heavy Armor") 
			} 
		},
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}	
    }
}

Menus["Insufficient Materials"] = {
    text = "To improve a piece of armor you must have an original piece as well as a repair hammer and armorer skill of relevant level.",
    buttons = {
		{ caption = "Back", destinations = { menuHelper.destinations.setFromCustomVariable("previousCustomMenu") } },
		{ caption = "Exit", destinations = nil },
    }
}

Menus["Generic Success"] = {
	text = "Would you like to continue improving armor?",
    buttons = {
		{ caption = "Yes", destinations = { menuHelper.destinations.setFromCustomVariable("Armor Reinforcement") } },
		{ caption = "No", destinations = nil },
    }
}
--Light Armor
Menus["Light Armor"] = {
	text = "What set of armor would you like to reinforce?",
	buttons = {
		{ caption = "Netch Leather",
			destinations = {
				menuHelper.destinations.setDefault("Netch Leather")
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Armor Reinforcement") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}
----Netch Leather
Menus["Netch Leather"] = {
	text = "Reinforcing a piece of Netch Leather Armor requires an original piece, a Journeyman's Repair Hammer, and an armorer skill of 50",
	buttons = {
		{ caption = "Netch Leather Helmet",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_helm", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_helm",20,150})
				})
			}
		},
		{ caption = "Boiled Netch Leather Helmet",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_boiled_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_boiled_helm", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_boiled_helm",25,150})
				})
			}
		},
		{ caption = "Netch Leather Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_cuirass", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_cuirass",20,300})
				})
			}
		},
		{ caption = "Boiled Netch Leather Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_boiled_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_boiled_cuirass", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_boiled_cuirass",25,300})
				})
			}
		},
		{ caption = "Netch Leather Pauldrons",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_pauldron_left", 1),
					menuHelper.conditions.requireItem("netch_leather_pauldron_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_pauldron_left", 1),
					menuHelper.effects.removeItem("netch_leather_pauldron_right", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_pauldron_left",20,150}),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_pauldron_right",20,150})
				})
			}
		},
		{ caption = "Netch Leather Gauntlets",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_gauntlet_left", 1),
					menuHelper.conditions.requireItem("netch_leather_gauntlet_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_gauntlet_left", 1),
					menuHelper.effects.removeItem("netch_leather_gauntlet_right", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_gauntlet_left",20,100}),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_gauntlet_right",20,100})
				})
			}
		},
		{ caption = "Netch Leather Greaves",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_greaves", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_greaves", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_greaves",20,150})
				})
			}
		},
		{ caption = "Netch Leather Boots",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_boots", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_boots", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_boots",20,150})
				})
			}
		},
		{ caption = "Netch Leather Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_shield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_shield", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_shield",20,200})
				})
			}
		},
		{ caption = "Netch Leather Tower Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional(nil,
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_towershield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_towershield", 1),
					menuHelper.effects.runGlobalFunction("eventHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_towershield",25,200})
				})
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Light Armor") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}

--Medium Armor
Menus["Medium Armor"] = {
	text = "What set of armor would you like to reinforce?",
	buttons = {
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Armor Reinforcement") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
	
}
--Heavy Armor
Menus["Heavy Armor"] = {
	text = "What set of armor would you like to reinforce?",
	buttons = {
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Armor Reinforcement") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}
