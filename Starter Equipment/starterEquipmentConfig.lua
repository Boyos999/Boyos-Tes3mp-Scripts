starterEquipmentConfig = {}

--Do not touch
starterEquipmentConfig.skillArray = {"block", "armorer", "mediumarmor", "heavyarmor", "blunt", "longblade", "axe", "spear", "athletics",
"enchant", "destruction", "alteration", "illusion", "conjuration", "mysticism", "restoration", "alchemy", "unarmored",
"security", "sneak", "acrobatics", "lightarmor", "shortblade", "marksman", "mercantile", "speechcraft", "handtohand"}
starterEquipmentConfig.weaponArray = {"blunt", "longblade", "axe", "spear", "shortblade"}
starterEquipmentConfig.armorArray = {"mediumarmor", "heavyarmor", "lightarmor"}

--Skill thresholds for major/minor
starterEquipmentConfig.majorThreshold = 30
starterEquipmentConfig.minorThreshold = 15

--Only give weapon/armor for the highest skill
starterEquipmentConfig.giveHighestWeapon = true
starterEquipmentConfig.giveHighestArmor = true

--Items given to all players regardless of skills
starterEquipmentConfig.baseItems = {
    {refId = "gold_001", count = 50},
    {refId = "bk_a1_1_caiuspackage", count = 1}
}

--Table of starter items
starterEquipmentConfig.rewardTable = {
    block = {
        major = {
            heavyarmor = {{refId = "steel_towershield", count = 1}},
            mediumarmor = {{refId = "bonemold_towershield", count = 1}},
            lightarmor = {{refId = "chitin_towershield", count = 1}}
        },
        minor = {
            heavyarmor = {{refId = "steel_shield", count = 1}},
            mediumarmor = {{refId = "bonemold_shield", count = 1}},
            lightarmor = {{refId = "bonemold_shield", count = 1}}
        }
    },
    armorer = {
        major = {
            {refId = "repair_journeyman_01", count = 4}
        },
        minor = {
            {refId = "repair_prongs", count = 4}
        }
    },
    mediumarmor = {
        major = {
            {refId = "bonemold_cuirass", count = 1}
        },
        minor = {
            {refId = "imperial_chain_cuirass", count = 1}
        }
    },
    heavyarmor = {
        major = {
            {refId = "steel_cuirass", count = 1}
        },
        minor = {
            {refId = "iron_cuirass", count = 1}
        }
    },
    blunt = {
        major = {
            {refId = "steel mace", count = 1}
        },
        minor = {
            {refId = "iron club", count = 1}
        }
    },
    longblade = {
        major = {
            {refId = "steel longsword", count = 1}
        },
        minor = {
            {refId = "iron broadsword", count = 1}
        }
    },
    axe = {
        major = {
            {refId = "steel war axe", count = 1}
        },
        minor = {
            {refId = "chitin war axe", count = 1}
        }
    },
    spear = {
        major = {
            {refId = "steel spear", count = 1}
        },
        minor = {
            {refId = "chitin spear", count = 1}
        }
    },
    athletics = {},
    enchant = {
        major = {
            {refId = "life ring", count = 1},
            {refId = "misc_soulgem_lesser", count = 2}
        },
        minor = {
            {refId = "misc_soulgem_petty", count = 2}
        }
    },
    destruction = {},
    alteration = {},
    illusion = {},
    conjuration = {},
    mysticism = {},
    restoration = {},
    alchemy = {
        major = {
            {refId = "apparatus_j_mortar_01", count = 1},
            {refId = "ingred_marshmerrow_01", count = 5},
            {refId = "ingred_wickwheat_01", count = 5}
        },
        minor = {
            {refId = "apparatus_a_mortar_01", count = 1},
            {refId = "ingred_marshmerrow_01", count = 2},
            {refId = "ingred_wickwheat_01", count = 2}
        }
    },
    unarmored = {},
    security = {
        major = {
            {refId =  "probe_journeyman_01", count = 1},
            {refId = "pick_journeyman_01", count = 1}
        },
        minor = {
            {refId = "probe_apprentice_01", count = 1},
            {refId = "pick_apprentice_01", count = 1}
        }
    },
    sneak = {},
    acrobatics = {},
    lightarmor = {
        major = {
            {refId = "chitin cuirass", count = 1}
        },
        minor = {
            {refId = "netch_leather_boiled_cuirass", count = 1}
        }
    },
    shortblade = {
        major = {
            {refId = "steel shortsword", count = 1}
        },
        minor = {
            {refId = "chitin shortsword", count = 1}
        }
    },
    marksman = {
        major = {
            {refId = "steel longbow", count = 1},
            {refId = "chitin arrow", count = 50},
            {refId = "steel arrow", count = 15}
        },
        minor = {
            {refId = "steel throwing star", count = 20}
        }
    },
    mercantile = {},
    speechcraft = {},
    handtohand = {}
}
return starterEquipmentConfig