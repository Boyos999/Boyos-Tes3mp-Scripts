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
    {refid = "Gold_001", quantity = 50}
}

--Table of starter items
starterEquipmentConfig.rewardTable = {
    block = {
        major = {
            heavyarmor = {{refid = "steel_towershield", quantity = 1}},
            mediumarmor = {{refid = "bonemold_towershield", quantity = 1}},
            lightarmor = {{refid = "chitin_towershield", quantity = 1}}
        },
        minor = {
            heavyarmor = {{refid = "steel_shield", quantity = 1}},
            mediumarmor = {{refid = "bonemold_shield", quantity = 1}},
            lightarmor = {{refid = "bonemold_shield", quantity = 1}}
        }
    },
    armorer = {
        major = {
            {refid = "repair_journeyman_01", quantity = 4}
        },
        minor = {
            {refid = "repair_prongs", quantity = 4}
        }
    },
    mediumarmor = {
        major = {
            {refid = "bonemold_cuirass", quantity = 1}
        },
        minor = {
            {refid = "imperial_chain_cuirass", quantity = 1}
        }
    },
    heavyarmor = {
        major = {
            {refid = "steel_cuirass", quantity = 1}
        },
        minor = {
            {refid = "iron_cuirass", quantity = 1}
        }
    },
    blunt = {
        major = {
            {refid = "steel mace", quantity = 1}
        },
        minor = {
            {refid = "iron club", quantity = 1}
        }
    },
    longblade = {
        major = {
            {refid = "steel longsword", quantity = 1}
        },
        minor = {
            {refid = "iron broadsword", quantity = 1}
        }
    },
    axe = {
        major = {
            {refid = "steel war axe", quantity = 1}
        },
        minor = {
            {refid = "chitin war axe", quantity = 1}
        }
    },
    spear = {
        major = {
            {refid = "steel spear", quantity = 1}
        },
        minor = {
            {refid = "chitin spear", quantity = 1}
        }
    },
    athletics = {},
    enchant = {
        major = {
            {refid = "life ring", quantity = 1},
            {refid = "Misc_SoulGem_Lesser", quantity = 2}
        },
        minor = {
            {refid = "Misc_SoulGem_Petty", quantity = 2}
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
            {refid = "apparatus_j_mortar_01", quantity = 1},
            {refid = "ingred_marshmerrow_01", quantity = 5},
            {refid = "ingred_wickwheat_01", quantity = 5}
        },
        minor = {
            {refid = "apparatus_a_mortar_01", quantity = 1},
            {refid = "ingred_marshmerrow_01", quantity = 2},
            {refid = "ingred_wickwheat_01", quantity = 2}
        }
    },
    unarmored = {},
    security = {
        major = {
            {refid =  "probe_journeyman_01", quantity = 1},
            {refid = "pick_journeyman_01", quantity = 1}
        },
        minor = {
            {refid = "probe_apprentice_01", quantity = 1},
            {refid = "pick_apprentice_01", quantity = 1}
        }
    },
    sneak = {},
    acrobatics = {},
    lightarmor = {
        major = {
            {refid = "chitin cuirass", quantity = 1}
        },
        minor = {
            {refid = "netch_leather_boiled_cuirass", quantity = 1}
        }
    },
    shortblade = {
        major = {
            {refid = "steel shortsword", quantity = 1}
        },
        minor = {
            {refid = "chitin shortsword", quantity = 1}
        }
    },
    marksman = {
        major = {
            {refid = "steel longbow", quantity = 1},
            {refid = "chitin arrow", quantity = 50},
            {refid = "steel arrow", quantity = 15}
        },
        minor = {
            {refid = "steel throwing star", quantity = 20}
        }
    },
    mercantile = {},
    speechcraft = {},
    handtohand = {}
}
return starterEquipmentConfig