local trainingLimiter = {}

--How many times per level can a player train?
local sessionsPerLevel = 5

--Check if the player packet received indicates a player received training
function trainingLimiter.wasTraining(pid, skills)
    for skill, values in pairs(skills) do
        local playerSkillValue = Players[pid].data.skills[skill].base
        local playerSkillProgress = Players[pid].data.skills[skill].progress

        if playerSkillValue ~= values.base then
            local change = values.base - playerSkillValue
            if change == 1 then
                if playerSkillProgress <= values.progress then
                    return true
                end
            end
        end
        
    end
    return false
end

--Check whether a player can train
function trainingLimiter.canTrain(pid)
    local sessionsRemaining = trainingLimiter.getSessionsRemaining(pid)

    if sessionsRemaining > 0 then
        return true
    end

    return false
end

--Return number of training sessions left
function trainingLimiter.getSessionsRemaining(pid)
    local level = Players[pid].data.stats.level
    local trainingSessions = Players[pid].data.customVariables.trainingSessions
    local sessionsRemaining = sessionsPerLevel*level - trainingSessions
    return sessionsRemaining
end

function trainingLimiter.OnPlayerSkill(eventStatus, pid, playerPacket)
    if trainingLimiter.wasTraining(pid, playerPacket.skills) then
        if trainingLimiter.canTrain(pid) then
            --Increment training sessions
            Players[pid].data.customVariables.trainingSessions = Players[pid].data.customVariables.trainingSessions + 1

            local sessionsRemaining = trainingLimiter.getSessionsRemaining(pid)
            tes3mp.LogMessage(enumerations.log.INFO, "Player: "..logicHandler.GetChatName(pid).." was allowed to train. Sessions remaining: "..sessionsRemaining)
            tes3mp.MessageBox(pid,-1,"Training sessions remaining: "..color.Purple..sessionsRemaining)
            return customEventHooks.makeEventStatus(nil,nil)
        else
            --Reset skill and level progress
            Players[pid]:LoadAttributes()
            Players[pid]:LoadSkills()
            Players[pid]:LoadLevel()

            tes3mp.LogMessage(enumerations.log.INFO, "Player: "..logicHandler.GetChatName(pid).." was prevented from training")
            tes3mp.MessageBox(pid,-1,color.Red.."You were unable to retain what you learned from your instructor.")
            return customEventHooks.makeEventStatus(false,nil)
        end
    end
end

--Set this if it doesn't exist
function trainingLimiter.init(eventStatus,pid)
    if Players[pid].data.customVariables.trainingSessions == nil then
        Players[pid].data.customVariables.trainingSessions = 0
    end
end

--Chat message showing how many more times a player can train
function trainingLimiter.checkTraining(pid,cmd)
    local canTrain = trainingLimiter.canTrain(pid)
    local sessionsRemaining = trainingLimiter.getSessionsRemaining(pid)
    local message = "You have "..sessionsRemaining.." training sessions left.\n"
    if canTrain then
        message = color.Green .. message
    else
        message = color.Red .. message
    end
    Players[pid]:Message(message)
end

customEventHooks.registerValidator("OnPlayerSkill",trainingLimiter.OnPlayerSkill)

customEventHooks.registerHandler("OnPlayerAuthentified",trainingLimiter.init)

customCommandHooks.registerCommand("training",trainingLimiter.checkTraining)

return trainingLimiter
