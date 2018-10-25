--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts

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
--End Results
Menus["Insufficient Materials"] = {
    text = "To reinforce a piece of armor you must have an original piece as well as a repair hammer and armorer skill of relevant level.",
    buttons = {
		{ caption = "Back", destinations = { menuHelper.destinations.setFromCustomVariable("previousCustomMenu") } },
		{ caption = "Exit", destinations = nil },
    }
}

Menus["Generic Success"] = {
	text = "Would you like to continue reinforcing armor?",
    buttons = {
		{ caption = "Yes", destinations = { menuHelper.destinations.setFromCustomVariable("previousCustomMenu") } },
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
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_helm", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_helm",20,150})
				})
			}
		},
		{ caption = "Boiled Netch Leather Helmet",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_boiled_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_boiled_helm", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_boiled_helm",25,150})
				})
			}
		},
		{ caption = "Netch Leather Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_cuirass", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_cuirass",20,300})
				})
			}
		},
		{ caption = "Boiled Netch Leather Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_boiled_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_boiled_cuirass", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_boiled_cuirass",25,300})
				})
			}
		},
		{ caption = "Netch Leather Pauldrons",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_pauldron_left", 1),
					menuHelper.conditions.requireItem("netch_leather_pauldron_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_pauldron_left", 1),
					menuHelper.effects.removeItem("netch_leather_pauldron_right", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_pauldron_left",20,150}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_pauldron_right",20,150})
				})
			}
		},
		{ caption = "Netch Leather Gauntlets",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_gauntlet_left", 1),
					menuHelper.conditions.requireItem("netch_leather_gauntlet_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_gauntlet_left", 1),
					menuHelper.effects.removeItem("netch_leather_gauntlet_right", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_gauntlet_left",20,100}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_gauntlet_right",20,100})
				})
			}
		},
		{ caption = "Netch Leather Greaves",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_greaves", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_greaves", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_greaves",20,150})
				})
			}
		},
		{ caption = "Netch Leather Boots",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_boots", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_boots", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_boots",20,150})
				})
			}
		},
		{ caption = "Netch Leather Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_shield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_shield", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "netch_leather_shield",20,200})
				})
			}
		},
		{ caption = "Netch Leather Tower Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("netch_leather_towershield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("netch_leather_towershield", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
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
		{ caption = "Bonemold",
			destinations = {
				menuHelper.destinations.setDefault("Bonemold")
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

---Bonemold
Menus["Bonemold"] = {
	text = "What type of Bonemold Armor would you like to reinforce?",
	buttons = {
		{ caption = "Armun-An",
			destinations = {
				menuHelper.destinations.setDefault("Armun-An")
			}
		},
		{ caption = "Chuzei",
			destinations = {
				menuHelper.destinations.setDefault("Chuzei")
			}
		},
		{ caption = "Gah-Julan",
			destinations = {
				menuHelper.destinations.setDefault("Gah-Julan")
			}
		},
		{ caption = "Standard",
			destinations = {
				menuHelper.destinations.setDefault("Standard Bonemold")
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Medium Armor") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
	
}
----Armun-An
Menus["Armun-An"] = {
	text = "Reinforcing a piece of Bonemold Armor requires an original piece, a Journeyman's Repair Hammer, and an armorer skill of 50",
	buttons = {
		{ caption = "Native Armun-An Bonemold Helm",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_armun-an_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_armun-an_helm", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_armun-an_helm",28,300})
				})
			}
		},
		{ caption = "Armun-An Bonemold Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_armun-an_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_armun-an_cuirass", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_armun-an_cuirass",26,800})
				})
			}
		},
		{ caption = "Armun-An Bonemold Pauldrons",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_armun-an_pauldron_l", 1),
					menuHelper.conditions.requireItem("bonemold_armun-an_pauldron_r", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_armun-an_pauldron_l", 1),
					menuHelper.effects.removeItem("bonemold_armun-an_pauldron_r", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_armun-an_pauldron_l",25,300}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_armun-an_pauldron_r",25,300})
				})
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Bonemold") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}

----chuzei
Menus["Chuzei"] = {
	text = "Reinforcing a piece of Bonemold Armor requires an original piece, a Journeyman's Repair Hammer, and an armorer skill of 50",
	buttons = {
		{ caption = "Native Chuzei Bonemold Helm",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_chuzei_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_chuzei_helm", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_chuzei_helm",27,300})
				})
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Bonemold") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}

----Gah-Julan
Menus["Gah-Julan"] = {
	text = "Reinforcing a piece of Bonemold Armor requires an original piece, a Journeyman's Repair Hammer, and an armorer skill of 50",
	buttons = {
		{ caption = "Native Gah-Julan Bonemold Helm",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_gah-julan_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_gah-julan_helm", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_gah-julan_helm",26,300})
				})
			}
		},
		{ caption = "Gah-Julan Bonemold Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_gah-julan_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_gah-julan_cuirass", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_gah-julan_cuirass",27,900})
				})
			}
		},
		{ caption = "Gah-Julan Bonemold Pauldrons",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_gah-julan_pauldron_l", 1),
					menuHelper.conditions.requireItem("bonemold_gah-julan_pauldron_r", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_gah-julan_pauldron_l", 1),
					menuHelper.effects.removeItem("bonemold_gah-julan_pauldron_r", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_gah-julan_pauldron_l",27,300}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_agah-julan_pauldron_r",27,300})
				})
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Bonemold") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}

----Standard Bonemold
Menus["Standard Bonemold"] = {
	text = "Reinforcing a piece of Bonemold Armor requires an original piece, a Journeyman's Repair Hammer, and an armorer skill of 50",
	buttons = {
		{ caption = "Bonemold Helm",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_helm", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_helm", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_helm",28,300})
				})
			}
		},
		{ caption = "Bonemold Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_cuirass", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_cuirass",26,800})
				})
			}
		},
		{ caption = "Bonemold Pauldrons",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_pauldron_l", 1),
					menuHelper.conditions.requireItem("bonemold_pauldron_r", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_pauldron_l", 1),
					menuHelper.effects.removeItem("bonemold_pauldron_r", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_pauldron_l",25,300}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_pauldron_r",25,300})
				})
			}
		},
		{ caption = "Bonemold Bracers",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_bracer_left", 1),
					menuHelper.conditions.requireItem("bonemold_bracer_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_bracer_left", 1),
					menuHelper.effects.removeItem("bonemold_bracer_right", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_bracer_left",25,150}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_bracer_right",25,150})
				})
			}
		},
		{ caption = "Bonemold Greaves",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_greaves", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_greaves", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_greaves",25,300})
				})
			}
		},
		{ caption = "Bonemold Boots",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_boots", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_boots", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_boots",25,300})
				})
			}
		},
		{ caption = "Bonemold Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_shield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_shield", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_shield",25,600})
				})
			}
		},
		{ caption = "Bonemold Tower Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_towershield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_towershield", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_towershield",27,650})
				})
			}
		},
		{ caption = "Hlaalu Guard Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_tshield_hlaaluguard", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_tshield_hlaaluguard", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_tshield_hlaaluguard",27,650})
				})
			}
		},
		{ caption = "Redoran Guard Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_tshield_redoranguard", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_tshield_redoranguard", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_tshield_redoranguard",27,650})
				})
			}
		},
		{ caption = "Telvanni Guard Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("bonemold_tshield_telvanniguard", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("bonemold_tshield_telvanniguard", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "bonemold_tshield_telvanniguard",27,650})
				})
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Bonemold") } },
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
		{ caption = "Iron",
			destinations = {
				menuHelper.destinations.setDefault("Iron Armor")
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

---Iron armor
Menus["Iron Armor"] = {
	text = "Reinforcing a piece of Iron Armor requires an original piece, a Journeyman's Repair Hammer, and an armorer skill of 50",
	buttons = {
		{ caption = "Iron Helmet",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_helmet", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_helmet", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_helmet",30,250})
				})
			}
		},
		{ caption = "Iron Cuirass",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_cuirass", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_cuirass", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_cuirass",30,900})
				})
			}
		},
		{ caption = "Iron Pauldrons",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_pauldron_left", 1),
					menuHelper.conditions.requireItem("iron_pauldron_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_pauldron_left", 1),
					menuHelper.effects.removeItem("iron_pauldron_right", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_pauldron_left",30,300}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_pauldron_right",30,300})
				})
			}
		},
		{ caption = "Iron Gauntlets",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_gauntlet_left", 1),
					menuHelper.conditions.requireItem("iron_gauntlet_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_gauntlet_left", 1),
					menuHelper.effects.removeItem("iron_gauntlet_right", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_gauntlet_left",30,150}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_gauntlet_right",30,150})
				})
			}
		},
		{ caption = "Iron Bracers",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_bracer_left", 1),
					menuHelper.conditions.requireItem("iron_bracer_right", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_bracer_left", 1),
					menuHelper.effects.removeItem("iron_bracer_right", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_bracer_left",30,150}),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_bracer_right",30,150})
				})
			}
		},
		{ caption = "Iron Greaves",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_greaves", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_greaves", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_greaves",30,300})
				})
			}
		},
		{ caption = "Iron Boots",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron boots", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron boots", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron boots",30,450})
				})
			}
		},
		{ caption = "Iron Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_shield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_shield", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_shield",30,600})
				})
			}
		},
		{ caption = "Iron Tower Shield",
			destinations = {
				menuHelper.destinations.setDefault("Insufficient Materials"),
				menuHelper.destinations.setConditional("Generic Success",
                {
                    menuHelper.conditions.requireItem("repair_journeyman_01", 1),
					menuHelper.conditions.requireItem("iron_towershield", 1),
					menuHelper.conditions.requireSkill("Armorer", 50),
                },
				{
                    menuHelper.effects.removeItem("iron_towershield", 1),
					menuHelper.effects.runGlobalFunction("logicHandler", "ArmorReinforcement",
						{menuHelper.variables.currentPid(), "iron_towershield",34,680})
				})
			}
		},
		{ caption = "Back", destinations = { menuHelper.destinations.setDefault("Heavy Armor") } },
		{ caption = "Exit", 
			destinations = { 
				menuHelper.destinations.setDefault(nil) 
			} 
		}
	}
}