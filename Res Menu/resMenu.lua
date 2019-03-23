--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts

Menus["Res Menu"] = {
	text = "Would you like to revive at the nearest Tribunal Temple, or Imperial Shrine?",
	buttons = {
		{ caption = "Tribunal Temple", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("resMenuHelper", "ResMenuFunction", {menuHelper.variables.currentPid(),1})
				}) 
			} 
		},
		{ caption = "Imperial Shrine", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runGlobalFunction("resMenuHelper", "ResMenuFunction", {menuHelper.variables.currentPid(),0})
				}) 
			} 
		}
	}
}
