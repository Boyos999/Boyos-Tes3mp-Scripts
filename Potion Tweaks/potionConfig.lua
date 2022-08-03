potionConfig = {}

--Global multipliers, applied if not overrides or effect specific multipliers are applied
potionConfig.durationMult = 1
potionConfig.weightMult = 1
potionConfig.magMult = 1
potionConfig.valueMult = 1

--Can specify weight and value for all player made potions
potionConfig.overrides = {
    weight = 0.1,
    value = 0
}

--Used to customize magnitude and duration multipliers on a per-effect basis
potionConfig.effects = {
    RESTORE_HEALTH = {
        durationMult = 0.5,
        magMult = 2
    },
    RESTORE_MAGICKA = {
        durationMult = 0.5,
        magMult = 2
    },
    FORTIFY_ATTRIBUTE = {
        durationMult = 2,
        magMult = 0.5
    }
}

