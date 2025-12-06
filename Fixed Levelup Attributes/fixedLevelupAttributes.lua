local fixedLevelUpAttributes = {}

local setSkillIncrease = 5

function fixedLevelUpAttributes.resetIncrease(eventStatus,pid)
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        Players[pid].data.attributes.Strength.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Agility.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Willpower.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Speed.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Intelligence.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Endurance.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Luck.skillIncrease = setSkillIncrease
        Players[pid].data.attributes.Personality.skillIncrease = setSkillIncrease
        Players[pid]:LoadAttributes()
    end
end

customEventHooks.registerHandler("OnPlayerAttribute",fixedLevelUpAttributes.resetIncrease)