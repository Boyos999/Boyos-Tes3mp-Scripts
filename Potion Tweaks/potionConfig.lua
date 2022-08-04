potionConfig = {}

--Global multipliers, applied if not overrides or effect specific multipliers are applied
potionConfig.durationMult = 1
potionConfig.weightMult = 1
potionConfig.magMult = 1
potionConfig.valueMult = 1

--Used to set hard limits on properties of player made potions
--See commented config below for format
potionConfig.limits = {}
--[[
potionConfig.limits = {
    duration = {
        max = 180,
        min = 10
    },
    magnitude = {
        max = 50,
        min = 1
    },
    weight = {
        max = 1,
        min = 0.1
    },
    value = {
        max = 100,
        min = 0
    }
}
]]

--Can specify weight and value for all player made potions
potionConfig.overrides = {
    weight = 0.1,
    value = 0
}

--Used to customize magnitude and duration multipliers on a per-effect basis
--Can set limits per-effect, see commented code in RESTORE_MAGICKA effect
--for reference
potionConfig.effects = {
    RESTORE_HEALTH = {
        durationMult = 0.5,
        magMult = 2
    },
    RESTORE_MAGICKA = {
        durationMult = 0.5,
        magMult = 2,
        --[[
        limits = {
            magnitude = {
                max = 1000,
                min = 20
            },
            duration = {
                max = 4,
                min = 1
            }
        }]]
    },
    FORTIFY_ATTRIBUTE = {
        durationMult = 2,
        magMult = 0.5
    }
}

