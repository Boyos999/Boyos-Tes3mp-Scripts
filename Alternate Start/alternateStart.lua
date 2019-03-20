--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts
--After character creation, this menu pops up and lets the player choose a city they want to spawn in

Menus["Alternate Start"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = "Hlaalu", 
			destinations = { 
				menuHelper.destinations.setDefault("Hlaalu") 
			} 
		},
		{ caption = "Imperial", 
			destinations = { 
				menuHelper.destinations.setDefault("Imperial") 
			} 
		},
		{ caption = "Redoran", 
			destinations = { 
				menuHelper.destinations.setDefault("Redoran") 
			} 
		},
		{ caption = "Telvanni", 
			destinations = { 
				menuHelper.destinations.setDefault("Telvanni") 
			} 
		},
		{ caption = "Other", 
			destinations = { 
				menuHelper.destinations.setDefault("Other") 
			} 
		}	
    }
}
Menus["Hlaalu"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = color.Green .. "Balmora (Default)", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", 
						{menuHelper.variables.currentPid(),"-3,-2",-23980, -15561, 505,0, 1.5}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Balmora\n"})
				}) 
			} 
		},
		{ caption = color.Orange .. "Gnaar Mok", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-8,3",-61448.434, 27527.604, 538.173,0, 2.3561925}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Gnaar Mok\n"})
				}) 
			}
		},
		{ caption = color.Yellow .. "Hla Oad", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-6,-5",-46720, -38176, 224,0, 5.4977825}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Hla Oad\n"})
				}) 
			}
		},
		{ caption = color.Yellow .. "Suran", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"6,-7",53648.527, -51050.477, 224.153,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Suran\n"})
				}) 
			}
		},
		{ caption = "Back", 
			destinations = { 
				menuHelper.destinations.setDefault("Alternate Start") 
			} 
		}
	}
}
Menus["Redoran"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = color.Yellow .. "Ald-ruhn", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-2,6",-12544, 53600, 2384.217,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Ald-ruhn\n"})
				}) 
			}
		},
		{ caption = color.Red .. "Ald Velothi", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-11,15",-85550.742, 125592.445, 808.023,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Ald Velothi\n"})
				}) 
			}
		},
		{ caption = color.Orange .. "Maar Gan", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-3,12",-22400, 101728, 2000.414,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Maar Gan\n"})
				}) 
			}
		},
		{ caption = color.Red .. "Khuul", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-9,17",-67072, 139264, 196.649,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Khuul\n"})
				}) 
			}
		},
		{ caption = "Back", 
			destinations = { 
				menuHelper.destinations.setDefault("Alternate Start") 
			} 
		}
	}
}
Menus["Telvanni"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = color.Yellow .. "Sadrith Mora", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"17,4",143168, 35968, 528.649,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Sadrith Mora\n"})
				}) 
			}
		},
		{ caption = color.Orange .. "Tel Aruhn", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"15,5",126458.367, 48817.922, 930.067,0, 3.14159}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Tel Aruhn\n"})
				}) 
			}
		},
		{ caption = color.Red .. "Tel Branora", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"15,-13",125216, -105216, 681.306,0, 0.7853975}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Tel Branora\n"})
				}) 
			}
		},
		{ caption = color.Orange .. "Tel Mora", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"13,14",107072, 117312, 226.805,0, 0.7853975}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Tel Mora\n"})
				}) 
			}
		},
		{ caption = color.Orange .. "Vos", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"11,14",92832, 116800, 1482.128,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vos\n"})
				}) 
			}
		},
		{ caption = "Back", 
			destinations = { 
				menuHelper.destinations.setDefault("Alternate Start") 
			} 
		}
	}
}
Menus["Imperial"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = color.Yellow .. "Buckmoth Legion Fort", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-2,5",-13024, 43040, 2547.548,0, 4.712385}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Buckmoth Legion Fort\n"})
				}) 
			}
		},
		{ caption = color.Green .. "Caldera", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-2,2",-11296, 20768, 1650.637,0, 3.14159}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Caldera\n"})
				}) 
			}
		},
		{ caption = color.Red .. "Dagon Fel", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"7,22",61856, 182080, 387.496,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Dagon Fel\n"})
				}) 
			}
		},
		{ caption = color.Yellow .. "Ebonheart", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"2,-13",18112, -101984, 386.442,0, 4.712385}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Ebonheart\n"})
				}) 
			}
		},
		{ caption = color.Orange .. "Gnisis", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-11,11",-86144, 92064, 1036.217,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Gnisis\n"})
				}) 
			}
		},
		{ caption = color.Green .. "Moonmoth Legion Fort", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-1,-3",-5088, -18784, 1033.433,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Moonmoth Legion Fort\n"})
				}) 
			}
		},
		{ caption = color.Green .. "Pelagiad", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"0,-7",1248, -56800, 1437.433,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Pelagiad\n"})
				}) 
			}
		},
		{ caption = color.Green .. "Seyda Neen", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"-2,-9",-10912, -71008, 240.122,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Seyda Neen\n"})
				}) 
			}
		},
		{ caption = color.Yellow .. "Wolverine Hall", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"18,3",149248, 29856, 712.153,0, 4.712385}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Wolverine Hall\n"})
				}) 
			}
		},
		{ caption = "Back", 
			destinations = { 
				menuHelper.destinations.setDefault("Alternate Start") 
			} 
		}
	}
}
Menus["Other"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = color.Red .. "Molag Mar", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"13,-8",109056, -61856, 2112.152,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Molag Mar\n"})
				}) 
			}
		},
		{ caption = color.Yellow .. "Vivec", 
			destinations = { 
				menuHelper.destinations.setDefault("Vivec") 
			}
		},
		{ caption = "Back", 
			destinations = { 
				menuHelper.destinations.setDefault("Alternate Start") 
			} 
		}
	}
}
Menus["Vivec"] = {
	text = "Choose your starting location.",
	buttons = {
		{ caption = "Arena Canton", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, Arena Fighters Training",-640, -864, 195.318,0, 0.7853975}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Foreign Quarter", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, Foreign Quarter Plaza",-64, 128, 290.927,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Hlaalu Canton", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, Hlaalu Plaza",96, -1184, 98.493,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Redoran Canton", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, Redoran Plaza",1376, -224, 1568.493,0, 4.712385}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "St. Delyn", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, St. Delyn Plaza",-1568, -64, -1758.507,0, 1.570795}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "St. Olms", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, St. Olms Plaza",1472, -64, -1823.507,0, 4.712385}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Temple", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"4,-13",32864, -99200, 1120,0, 3.14159}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Telvanni Canton", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("logicHandler", "TeleportPlayerToLocation", {menuHelper.variables.currentPid(),"Vivec, Telvanni Plaza",224, -1376, -959.507,0, 0}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Back", 
			destinations = { 
				menuHelper.destinations.setDefault("Other") 
			} 
		}
	}
}
