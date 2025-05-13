javelinsConfig = {}

javelinsConfig.speed = 0.75
--In addition to the 2x multiplier from being a thrown weapon
javelinsConfig.damageMult = 1.5
javelinsConfig.subType = 11

javelinsConfig.menuOrder = {
    "t_com_farm_pitchfork_01","t_rga_fishingspear_01","t_qyc_chitin_spear_01","chitin spear","t_yne_iron_shspear","t_yne_iron_spear","iron spear","iron long spear","t_com_iron_longspear_01","t_de_dreugh_spear_01","t_mao_trident_01","t_de_indoril_spear_01","t_de_aena_spear_01","t_imp_reman_spear_01","t_kha_copper_spear_01","t_qy_bronze_spear_01",
    "t_imp_barrow_spear_01","t_nor_iron_spear_01","t_nor_orn_spear_01","t_imp_legion_longspear_01","t_imp_legion_spear_01","t_imp_templar_longspear_01","t_imp_templar_spear_01","t_qyk_obsidian_spear_01","t_nor_ancient_spear_01","t_nor_orn_longspear_01","t_we_wenbone_spear_01","steel spear","t_com_steel_longspear_01","silver spear","t_rga_yoku_spear_01","t_imp_silver_longspear_01","dwarven spear","bm huntsman spear",
    "t_orc_regular_spear_01","t_orc_regular_spear_02","t_orc_regular_longspear_01","t_nor_steel_spear_01","t_de_ashlander_spear_01","t_ayl_regular_spear_01","t_dwe_regular_longspear_01",
    "adamantium_spear","t_de_glass_spear_01","t_de_glass_longspear_01","t_nor_silverspear_01","ebony spear","t_de_ebony_longspear_01","daedric spear","t_nor_stalhrimspear_01",
    "t_dae_regular_trident_01","t_dae_regular_longspear_01"
}

javelinsConfig.craftItem = {
    id = "jav_craft",
    name = "Javelin Crafting Axe",
    icon = "w\\Tx_waraxe_iron.tga",
    model = "w\\W_WARAXE_IRON.nif"
}

javelinsConfig.baseSpears = {
    adamantium_spear = {
        id = "jav_adamantium",
        name = "Adamantium Javelin",
        damage = {
            min = 10,
            max = 30
        },
        flags = "0x01"
    }
}

javelinsConfig.baseSpears["bm huntsman spear"] = {
    id = "jav_hunstman",
    name = "Huntsman Javelin",
    damage = {
        min = 1,
        max = 22
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["chitin spear"] = {
    id = "jav_chitin",
    name = "Chitin Javelin",
    damage = {
        min = 5,
        max = 13
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["daedric spear"] = {
    id = "jav_daedric",
    name = "Daedric Javelin",
    damage = {
        min = 6,
        max = 40
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["dwarven spear"] = {
    id = "jav_dwarven",
    name = "Dwarven Javelin",
    damage = {
        min = 5,
        max = 21
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["ebony spear"] = {
    id = "jav_ebony",
    name = "Ebony Javelin",
    damage = {
        min = 5,
        max = 32
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["iron spear"] = {
    id = "jav_iron",
    name = "Iron Javelin",
    damage = {
        min = 6,
        max = 15
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["iron long spear"] = {
    id = "jav_iron",
    name = "Iron Javelin",
    damage = {
        min = 6,
        max = 15
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["silver spear"] = {
    id = "jav_silver",
    name = "Silver Javelin",
    damage = {
        min = 5,
        max = 23
    },
    flags = "0x03"
}

javelinsConfig.baseSpears["steel spear"] = {
    id = "jav_steel",
    name = "Steel Javelin",
    damage = {
        min = 6,
        max = 17
    },
    flags = "0x00"
}

--Tamriel Data
javelinsConfig.baseSpears["t_ayl_regular_spear_01"] = {
    id = "jav_t_ayleid",
    name = "Ayleid Javelin",
    damage = {
        min = 8,
        max = 23
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_com_farm_pitchfork_01"] = {
    id = "jav_t_pitchfork",
    damage = {
        min = 1,
        max = 5
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_com_iron_longspear_01"] = {
    id = "jav_t_iron_long",
    name = "Iron Long Javelin"
    damage = {
        min = 5,
        max = 20
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_com_steel_longspear_01"] = {
    id = "jav_t_steel_long",
    name = "Steel Long Javelin"
    damage = {
        min = 6,
        max = 23
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_dae_regular_longspear_01"] = {
    id = "jav_t_dae_long",
    name = "Daedric Long Javelin",
    damage = {
        min = 10,
        max = 50
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_dae_regular_trident_01"] = {
    id = "jav_t_dae_tri",
    name = "Daedric Trident Javelin",
    damage = {
        min = 7,
        max = 42
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_de_aena_spear_01"] = {
    id = "jav_t_aena",
    name = "Aena Javelin",
    damage = {
        min = 6,
        max = 15
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_de_ashlander_spear_01"] = {
    id = "jav_t_ash",
    name = "Ashlander Javelin",
    damage = {
        min = 6,
        max = 27
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_de_dreugh_spear_01"] = {
    id = "jav_t_dreugh",
    name = "Dreugh Javelin",
    damage = {
        min = 6,
        max = 17
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_de_ebony_longspear_01"] = {
    id = "jav_t_ebony_long",
    name = "Ebony Long Javelin",
    damage = {
        min = 5,
        max = 39
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_de_glass_longspear_01"] = {
    id = "jav_t_glass_long",
    name = "Glass Long Javelin",
    damage = {
        min = 6,
        max = 36
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_de_glass_spear_01"] = {
    id = "jav_t_glass",
    name = "Glass Javelin",
    damage = {
        min = 6,
        max = 32
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_de_indoril_spear_01"] = {
    id = "jav_t_indoril",
    name = "Indoril Javelin",
    damage = {
        min = 5,
        max = 24
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_dwe_regular_longspear_01"] = {
    id = "jav_t_dwe_long",
    name = "Dwarven Long Javelin",
    damage = {
        min = 5,
        max = 29
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_imp_barrow_spear_01"] = {
    id = "jav_t_nedic",
    name = "Nedic Javelin",
    damage = {
        min = 5,
        max = 17
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_imp_legion_longspear_01"] = {
    id = "jav_t_legion_long",
    name = "Imperial Long Javelin",
    damage = {
        min = 5,
        max = 21
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_imp_legion_spear_01"] = {
    id = "jav_t_legion",
    name = "Imperial Javelin",
    damage = {
        min = 5,
        max = 15
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_imp_reman_spear_01"] = {
    id = "jav_t_reman",
    name = "Reman Javelin",
    damage = {
        min = 7,
        max = 15
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_imp_silver_longspear_01"] = {
    id = "jav_t_impsilver_long",
    name = "Silver Long Javelin",
    damage = {
        min = 5,
        max = 29
    },
    flags = "0x03"
}

javelinsConfig.baseSpears["t_imp_templar_longspear_01"] = {
    id = "jav_t_templar_long",
    name = "Templar Long Javelin",
    damage = {
        min = 2,
        max = 29
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_imp_templar_spear_01"] = {
    id = "jav_t_templar",
    name = "Templar Javelin",
    damage = {
        min = 6,
        max = 24
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_kha_copper_spear_01"] = {
    id = "jav_t_kha_copper",
    name = "Copper Javelin",
    damage = {
        min = 5,
        max = 21
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_mao_trident_01"] = {
    id = "jav_t_mao_trident",
    name = "Maomer Trident",
    damage = {
        min = 2,
        max = 28
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_nor_ancient_spear_01"] = {
    id = "jav_t_nor_ancient",
    name = "Ancient Nordic Javelin",
    damage = {
        min = 6,
        max = 21
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_nor_iron_spear_01"] = {
    id = "jav_t_nor_iron",
    name = "Nordic Iron Javelin",
    damage = {
        min = 5,
        max = 20
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_nor_orn_longspear_01"] = {
    id = "jav_t_nor_orn_long",
    name = "Nordic Long Javelin",
    damage = {
        min = 6,
        max = 29
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_nor_orn_spear_01"] = {
    id = "jav_t_nor_orn",
    name = "Nordic Javelin",
    damage = {
        min = 6,
        max = 21
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_nor_silverspear_01"] = {
    id = "jav_t_nor_silver",
    name = "Nordic Silver Javelin",
    damage = {
        min = 2,
        max = 35
    },
    flags = "0x03"
}

javelinsConfig.baseSpears["t_nor_stalhrimspear_01"] = {
    id = "jav_t_nor_stalhrim",
    name = "Stalhrim Javelin",
    damage = {
        min = 5,
        max = 50
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_nor_steel_spear_01"] = {
    id = "jav_t_nor_steel",
    name = "Nordic Steel Javelin",
    damage = {
        min = 6,
        max = 26
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_orc_regular_longspear_01"] = {
    id = "jav_t_orc_long_01",
    name = "Orcish Long Javelin",
    damage = {
        min = 8,
        max = 29
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_orc_regular_spear_01"] = {
    id = "jav_t_orc_01",
    name = "Orcish Javelin",
    damage = {
        min = 8,
        max = 24
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_orc_regular_spear_02"] = {
    id = "jav_t_orc_02",
    name = "Orcish Javelin",
    damage = {
        min = 8,
        max = 24
    },
    flags = "0x01"
}

javelinsConfig.baseSpears["t_qyc_chitin_spear_01"] = {
    id = "jav_t_qyc_chitin",
    name = "Chitin Javelin",
    damage = {
        min = 5,
        max = 13
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_qyk_obsidian_spear_01"] = {
    id = "jav_t_qyk_obsidian",
    name = "Obsidian Javelin",
    damage = {
        min = 4,
        max = 24
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_qy_bronze_spear_01"] = {
    id = "jav_t_qy_bronze",
    name = "Bronze Javelin",
    damage = {
        min = 5,
        max = 19
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_rga_fishingspear_01"] = {
    id = "jav_t_rga_fishing",
    name = "Fishing Spear",
    damage = {
        min = 5,
        max = 13
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_rga_yoku_spear_01"] = {
    id = "jav_t_rga_yoku",
    name = "Yoku Javelin",
    damage = {
        min = 7,
        max = 23
    },
    flags = "0x03"
}

javelinsConfig.baseSpears["t_we_wenbone_spear_01"] = {
    id = "jav_t_we_wenbone",
    name = "Wenbone Javelin",
    damage = {
        min = 6,
        max = 21
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_yne_iron_shspear"] = {
    id = "jav_t_yne_iron_short",
    name = "Ynesai Iron Short Javelin",
    damage = {
        min = 4,
        max = 13
    },
    flags = "0x00"
}

javelinsConfig.baseSpears["t_yne_iron_spear"] = {
    id = "jav_t_yne_iron",
    name = "Ynesai Iron Javelin",
    damage = {
        min = 1,
        max = 18
    },
    flags = "0x00"
}

return javelinsConfig
