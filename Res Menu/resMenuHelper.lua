
local resMenuHelper = {}

resMenuHelper.OnDeathTimeExpirationValidator = function(eventStatus, pid)
    return customEventHooks.makeEventStatus(false,nil)
end

resMenuHelper.OnDeathTimeExpirationHandler = function(eventStatus, pid)
    Players[pid].currentCustomMenu = "Res Menu"
    menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
end

customEventHooks.registerValidator("OnDeathTimeExpiration", resMenuHelper.OnDeathTimeExpirationValidator)
customEventHooks.registerHandler("OnDeathTimeExpiration", resMenuHelper.OnDeathTimeExpirationHandler)

resMenuHelper.ResMenuFunction = function(pid, location)

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
    if Players[pid].data.shapeshift.isWerewolf == true then
        Players[pid]:SetWerewolfState(false)
    end

    -- Ensure that we unequip deadly items when applicable, to prevent an
    -- infinite death loop
    contentFixer.UnequipDeadlyItems(pid)

    tes3mp.Resurrect(pid, currentResurrectType)

    if config.deathPenaltyJailDays > 0 then
        local resurrectionText = "You've been revived and brought back here, " ..
            "but your skills have been affected by "
        local jailTime = config.deathPenaltyJailDays

        if config.bountyResetOnDeath == true then
            if config.bountyDeathPenalty == true then
                local currentBounty = tes3mp.GetBounty(pid)

                if currentBounty > 0 then
                    jailTime = jailTime + math.floor(currentBounty / 100)
                    resurrectionText = resurrectionText .. "your bounty and "
                end
            end

            tes3mp.SetBounty(pid, 0)
            tes3mp.SendBounty(pid)
            Players[pid]:SaveBounty()
        end

        resurrectionText = resurrectionText .. "your time spent incapacitated.\n"
        tes3mp.Jail(pid, jailTime, true, true, "Recovering", resurrectionText)
    end

    tes3mp.SendMessage(pid, message, false)
end


return resMenuHelper