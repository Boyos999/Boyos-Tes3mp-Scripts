local enchantTweaks = {}

-- Determines how constant effect enchants with magnitude range are handled
-- so if set to 2 an restore health 1-4 effect will be replaced with restore health 4
-- if set to 1 the resulting effect with be restore health 2
-- 0 = Always minimum (why?)
-- 1 = Always average (round down)
-- 2 = Always maximum
local enchantTweaksMagMode = 1

-- Table of effects to replace (see enumerations.lua for valid effects)
-- This can be used to both block certain effects, or increase/decrease the effectiveness
-- of certain effects
local replaceEffects = {
    --This will replace any constant effect invis enchant with 10 pts of chameleon
    INVISIBILITY = {
        replacementEffect = "CHAMELEON",
        magRatio = 10
    },
    --This will reduce the effectiveness of any chameleon effects by 50%
    CHAMELEON = {
        replacementEffect = "CHAMELEON",
        magRatio = 0.5
    }
}

-- Don't change, this is the subtype on an enchantment record that indicates a constant effect enchant
local constEnchantSubtype = 3

function enchantTweaks.getMagnitude(effect)
    if enchantTweaksMagMode == 0 then
        return effect.magnitudeMin
    elseif enchantTweaksMagMode == 1 then
        return math.floor((effect.magnitudeMax+effect.magnitudeMin)/2)
    elseif enchantTweaksMagMode == 2 then
        return effect.magnitudeMax
    end
end

function enchantTweaks.checkMagnitude(effect)
    if effect.magnitudeMin ~= effect.magnitudeMax then
        local mag = enchantTweaks.getMagnitude(effect)
        effect.magnitudeMin = mag
        effect.magnitudeMax = mag
    end
end

function enchantTweaks.checkReplace(effect)
    for enum, replace in pairs(replaceEffects) do
        if enumerations.effects[enum] == effect.id then
            local newId = enumerations.effects[replace.replacementEffect]
            local newMag = math.floor(effect.magnitudeMax*replace.magRatio)
            effect.id = newId
            effect.magnitudeMax = newMag
            effect.magnitudeMin = newMag
        end
    end
end

function enchantTweaks.OnRecordDynamic(eventStatus, pid, recordArray, storeType)
    if storeType == "enchantment" then
        for _,record in pairs(recordArray) do
            if record.subtype == constEnchantSubtype then
                for _,effect in pairs(record.effects) do
                    enchantTweaks.checkMagnitude(effect)
                    enchantTweaks.checkReplace(effect)
                end
            end
        end
    end
end

customEventHooks.registerValidator("OnRecordDynamic",enchantTweaks.OnRecordDynamic)

return enchantTweaks