javelinsConfig = {}

javelinsConfig.speed = 0.75
--In addition to the 2x multiplier from being a thrown weapon
javelinsConfig.damageMult = 1.5
javelinsConfig.subType = 11

javelinsConfig.menuOrder = {
    "t_com_farm_pitchfork_01","chitin spear","iron spear","iron long spear","t_de_aena_spear_01","t_imp_reman_spear_01",
    "t_imp_barrow_spear_01","t_nor_iron_spear_01","t_nor_orn_spear_01","steel spear","silver spear","dwarven spear","bm huntsman spear",
    "t_orc_regular_spear_01","t_orc_regular_spear_02","t_nor_steel_spear_01","t_ayl_regular_spear_01","t_dwe_regular_longspear_01",
    "adamantium_spear","t_de_glass_spear_01","t_nor_silverspear_01","ebony spear","daedric spear","t_nor_stalhrimspear_01",
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

    javelinsConfig.baseSpears["t_de_glass_spear_01"] = {
        id = "jav_t_glass",
        name = "Glass Javelin",
        damage = {
            min = 6,
            max = 32
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

    javelinsConfig.baseSpears["t_imp_reman_spear_01"] = {
        id = "jav_t_reman",
        name = "Reman Javelin",
        damage = {
            min = 7,
            max = 15
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

    javelinsConfig.baseSpears["t_orc_regular_spear_01"] = {
        id = "jav_t_nor_orc_01",
        name = "Orcish Javelin",
        damage = {
            min = 8,
            max = 24
        },
        flags = "0x01"
    }

    javelinsConfig.baseSpears["t_orc_regular_spear_02"] = {
        id = "jav_t_nor_orc_02",
        name = "Orcish Javelin",
        damage = {
            min = 8,
            max = 24
        },
        flags = "0x01"
    }

return javelinsConfig
