--[[
INSTALL INSTRUCTIONS
1. Download resMenu.lua, put it in scripts\Menu folder
2. Go to config.lua, find config.menuHelperFiles and add "resMenu" to the list
3. Find eventHandler.OnDeathTimeExpiration = function(pid) in eventHandler.lua, replace Players[pid]:Ressurect() 
with the following two lines (inside the if block)

	Players[pid].currentCustomMenu = "Res Menu"
	menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)

4. paste the commented block found below the menu here at the bottom of scripts\Player\base.lua (before the return)
]]--
Menus["Res Menu"] = {
	text = "Would you like to revive at the nearest Tribunal Temple, or Imperial Shrine?",
	buttons = {
		{ caption = "Tribunal Temple", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("ResMenuFunction", {1})
				}) 
			} 
		},
		{ caption = "Imperial Shrine", 
			destinations = { 
				menuHelper.destinations.setDefault(nil,
				{
					menuHelper.effects.runPlayerFunction("ResMenuFunction", {0})
				}) 
			} 
		}
	}
}

--[[
function BasePlayer:ResMenuFunction(location)

    local currentResurrectType
	if location == 1 then
	    currentResurrectType = enumerations.resurrect.TRIBUNAL_TEMPLE
	else
        currentResurrectType = enumerations.resurrect.IMPERIAL_SHRINE
	end


    local message = "You have been revived"

    if currentResurrectType == enumerations.resurrect.IMPERIAL_SHRINE then
        message = message .. " at the nearest Imperial shrine"
    elseif currentResurrectType == enumerations.resurrect.TRIBUNAL_TEMPLE then
        message = message .. " at the nearest Tribunal temple"
    end

    message = message .. ".\n"

    -- Ensure that dying as a werewolf turns you back into your normal form
    if self.data.shapeshift.isWerewolf == true then
        self:SetWerewolfState(false)
    end

    -- Ensure that we unequip deadly items when applicable, to prevent an
    -- infinite death loop
    contentFixer.UnequipDeadlyItems(self.pid)

    tes3mp.Resurrect(self.pid, currentResurrectType)

    if config.deathPenaltyJailDays > 0 then
        local resurrectionText = "You've been revived and brought back here, " ..
            "but your skills have been affected by "
        local jailTime = config.deathPenaltyJailDays

        if config.bountyResetOnDeath == true then
            if config.bountyDeathPenalty == true then
                local currentBounty = tes3mp.GetBounty(self.pid)

                if currentBounty > 0 then
                    jailTime = jailTime + math.floor(currentBounty / 100)
                    resurrectionText = resurrectionText .. "your bounty and "
                end
            end

            tes3mp.SetBounty(self.pid, 0)
            tes3mp.SendBounty(self.pid)
            self:SaveBounty()
        end

        resurrectionText = resurrectionText .. "your time spent incapacitated.\n"
        tes3mp.Jail(self.pid, jailTime, true, true, "Recovering", resurrectionText)
    end

    tes3mp.SendMessage(self.pid, message, false)
end
]]--
