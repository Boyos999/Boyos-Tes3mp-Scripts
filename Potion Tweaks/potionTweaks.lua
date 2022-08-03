require("custom.potionConfig")

local potionTweaks = {}

function potionTweaks.getValue(baseValue)
    if potionConfig.overrides.value ~= nil then
        return potionConfig.overrides.value
    else
        return baseValue*potionConfig.valueMult
    end
end

function potionTweaks.getWeight(baseWeight)
    if potionConfig.overrides.weight ~= nil then
        return potionConfig.overrides.weight
    else
        return baseWeight*potionConfig.weightMult
    end
end

function potionTweaks.getMagnitude(effect, enum)
    if potionConfig.effects[enum] ~= nil then
        if potionConfig.effects[enum].magMult ~= nil then
            return math.floor(effect.magnitudeMax*potionConfig.effects[enum].magMult)
        end
    else
        return math.floor(effect.magnitudeMax*potionConfig.magMult)
    end
end

function potionTweaks.getDuration(effect, enum)
    if potionConfig.effects[enum] ~= nil then
        if potionConfig.effects[enum].durationMult ~= nil then
            return math.floor(effect.duration*potionConfig.effects[enum].durationMult)
        end
    else
        return math.floor(effect.duration*potionConfig.durationMult)
    end
end

function potionTweaks.getEnum(id)
    for enum,val in pairs(enumerations.effects) do
        if val == id then
            return enum
        end
    end
end

function potionTweaks.OnRecordDynamic(eventStatus, pid, recordArray, storeType)
    if storeType == "potion" then
        for _,record in pairs(recordArray) do
            record.value = potionTweaks.getValue(record.value)
            record.weight = potionTweaks.getWeight(record.weight)
            for _,effect in pairs(record.effects) do
                local enum = potionTweaks.getEnum(effect.id)
                local mag = potionTweaks.getMagnitude(effect, enum)
                effect.magnitudeMax = mag
                effect.magnitudeMin = mag
                effect.duration = potionTweaks.getDuration(effect, enum)
            end
        end
    end
end

customEventHooks.registerValidator("OnRecordDynamic",potionTweaks.OnRecordDynamic)

return potionTweaks