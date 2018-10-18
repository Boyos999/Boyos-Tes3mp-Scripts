--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts



Menus["Alternate Start"] = {
text = "Choose your starting location.",
    buttons = {
        { caption = "Default (Balmora)", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"-3,-2",{-23980.693359375, -15561.556640625, 505},{-0.000152587890625, 1.6182196140289}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Balmora\n"})
				}) 
			} 
		},
        { caption = "Seyda Neen", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"-2,-9",{-10912, -71008, 240.122},{0, 0}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Seyda Neen\n"})
				}) 
			}
		},
		{ caption = "Ald-ruhn", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"-2,6",{-12544, 53600, 2384.217},{0, 0}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Ald-ruhn\n"})
				}) 
			}
		},
		{ caption = "Vivec", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"Vivec, Foreign Quarter Plaza",{-64, 128, 290.927},{0, 90}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Vivec\n"})
				}) 
			}
		},
		{ caption = "Sadrith Mora", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"17,4",{143168, 35968, 528.649},{0, 90}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Sadrith Mora\n"})
				}) 
			}
		},
		{ caption = "Gnisis", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"-11,11",{-86144, 92064, 1036.217},{0, 0}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Gnisis\n"})
				}) 
			}
		},
		{ caption = "Suran", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("AltStart", {"6,-7",{53648.527, -51050.477, 224.153},{0, 90}}),
					menuHelper.effects.runPlayerFunction("Message", {"Spawned in Suran\n"})
				}) 
			}
		},
        { caption = "Exit", destinations = nil }
    }
}
