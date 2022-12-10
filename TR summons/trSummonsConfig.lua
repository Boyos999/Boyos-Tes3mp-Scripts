trSummonsConfig = {}

trSummonsConfig.logPrefix = "TR Summons: "

trSummonsConfig.placeholderEffects = {{
    id = 118, --command creature
    rangeType = 0, --self
    area = 0,
    duration = 60,
    magnitudeMax = 1000,
    magnitudeMin = 1000,
    attribute = -1,
    skill = -1
}}

trSummonsConfig.subtype = 0 --spell
trSummonsConfig.flags = 0 --no autocalc/startspell/etc

trSummonsConfig.summonMap = {
    t_com_cnj_summondevourer = "t_dae_cre_devourer_01",
    t_com_cnj_summondremoraarcher = "t_dae_cre_drem_arch_01",
    t_com_cnj_summondremoracaster = "t_dae_cre_drem_cast_01",
    t_com_cnj_summonguardian = "t_dae_cre_guardian_01",
    t_com_cnj_summonlesserclannfear = "t_dae_cre_lesserclfr_01",
    t_com_cnj_summonogrim = "ogrim",
    t_com_cnj_summonseducer = "t_dae_cre_seduc_01",
    t_com_cnj_summonseducerdark = "t_dae_cre_seducdark_02",
    t_com_cnj_summonvermai = "t_dae_cre_verm_01",
    t_com_cnj_summonstormmonarch = "t_dae_cre_monarchst_01",
    t_nor_cnj_summonicewraith = "t_sky_cre_icewr_01",
    t_dwe_cnj_uni_summondwespectre = "dwarven ghost",
    t_dwe_cnj_uni_summonsteamcent = "centurion_steam",
    t_dwe_cnj_uni_summonspidercent = "centurion_spider",
    t_ayl_cnj_summonwelkyndspirit = "t_ayl_cre_welkspr_01",
    t_com_cnj_summonauroran = "t_dae_cre_auroran_01"
}

trSummonsConfig.summonRecords = {
    t_com_cnj_summondevourer = {
        name = "Summon Devourer",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 155,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summondremoraarcher = {
        name = "Summon Dremora Archer",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 98,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summondremoracaster = {
        name = "Summon Dremora Spellcaster",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 93,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonguardian = {
        name = "Summon Guardian",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 207,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonlesserclannfear = {
        name = "Summon Rock Chisel Clannfear",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 66,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonogrim = {
        name = "Summon Ogrim",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 99,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonseducer = {
        name = "Summon Seducer",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 156,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonseducerdark = {
        name = "Summon Dark Seducer",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 225,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonvermai = {
        name = "Summon Vermai",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 88,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonstormmonarch = {
        name = "Summon Storm Monarch",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 179,
        effects = trSummonsConfig.placeholderEffects
    },
    t_nor_cnj_summonicewraith = {
        name = "Summon Ice Wraith",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 104,
        effects = trSummonsConfig.placeholderEffects
    },
    t_dwe_cnj_uni_summondwespectre = {
        name = "Summon Dwemer Spectre",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 52,
        effects = trSummonsConfig.placeholderEffects
    },
    t_dwe_cnj_uni_summonsteamcent = {
        name = "Summon Dwemer Steam Centurion",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 88,
        effects = trSummonsConfig.placeholderEffects
    },
    t_dwe_cnj_uni_summonspidercent = {
        name = "Summon Dwemer Spider Centurion",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 46,
        effects = trSummonsConfig.placeholderEffects
    },
    t_ayl_cnj_summonwelkyndspirit = {
        name = "Summon Welkynd Spirit",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 78,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonauroran = {
        name = "Summon Auroran",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 130,
        effects = trSummonsConfig.placeholderEffects
    }
}

return trSummonsConfig