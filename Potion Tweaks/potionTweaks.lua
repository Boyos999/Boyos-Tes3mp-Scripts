require("custom.potionConfig")

local potionTweaks = {}

function potionTweaks.getValue(baseValue)
    local value
    if potionConfig.overrides.value ~= nil then
        value = potionConfig.overrides.value
    else
        value = baseValue*potionConfig.valueMult
    end
    return potionTweaks.checkLimits("value",value)
end

function potionTweaks.getWeight(baseWeight)
    local weight
    if potionConfig.overrides.weight ~= nil then
        weight = potionConfig.overrides.weight
    else
        weight = baseWeight*potionConfig.weightMult
    end
    return potionTweaks.checkLimits("weight",weight)
end

function potionTweaks.getMagnitude(effect, enum)
    local mag
    if potionConfig.effects[enum] ~= nil then
        if potionConfig.effects[enum].magMult ~= nil then
            mag = math.floor(effect.magnitudeMax*potionConfig.effects[enum].magMult)
        end
    end
    if mag == nil then
        mag = math.floor(effect.magnitudeMax*potionConfig.magMult)
    end
    return potionTweaks.checkLimits("magnitude",mag,enum)
end

function potionTweaks.getDuration(effect, enum)
    local duration
    if potionConfig.effects[enum] ~= nil then
        if potionConfig.effects[enum].durationMult ~= nil then
            duration = math.floor(effect.duration*potionConfig.effects[enum].durationMult)
        end
    end
    if duration == nil then
        duration = math.floor(effect.duration*potionConfig.durationMult)
    end
    return potionTweaks.checkLimits("duration",duration,enum)
end

function potionTweaks.checkLimits(property, value, enum)
    local limits = {}

    if potionConfig.limits[property] ~= nil then
        if potionConfig.limits[property].max ~= nil then
            limits.max = potionConfig.limits[property].max
        end
        if potionConfig.limits[property].min ~= nil then
            limits.min = potionConfig.limits[property].min
        end
    end
    if property == "magnitude" or property == "duration" then
        if enum ~= nil and potionConfig.effects[enum] ~= nil then
            if potionConfig.effects[enum].limits ~= nil then
                if potionConfig.effects[enum].limits[property] ~= nil then
                    if potionConfig.effects[enum].limits[property].max ~= nil then
                        limits.max = potionConfig.effects[enum].limits[property].max
                    end
                    if potionConfig.effects[enum].limits[property].min ~= nil then
                        limits.min = potionConfig.effects[enum].limits[property].min
                    end
                end
            end
        end
    end

    if limits.max ~= nil then
        if value > limits.max then
            return limits.max
        end
    end
    if limits.min ~= nil then
        if value < limits.min then
            return limits.min
        end
    end
    return value
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