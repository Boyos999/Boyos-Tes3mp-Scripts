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
        { caption = "Exit", destinations = nil }
    }
}
