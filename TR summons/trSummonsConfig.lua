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
    t_com_cnj_summonauroran = "t_dae_cre_auroran_01",
    t_com_cnj_summonherne = "t_dae_cre_herne_01",
    t_com_cnj_summonmorphoid = "t_dae_cre_morphoid_01",
    t_nor_cnj_summondraugr = "t_sky_und_drgr_01",
    t_nor_cnj_summonspriggan = "t_sky_cre_spriggan_01",
    t_de_cnj_summongreaterbonelord = "t_mw_und_boneldgr_01",
    t_cyr_cnj_summonghost = "t_cyr_und_ghst_01",
    t_cyr_cnj_summonwraith = "t_cyr_und_wrth_01",
    t_cyr_cnj_summonbarrowguard = "t_cyr_und_mum_01",
    t_cyr_cnj_summonminobarrowguard = "t_cyr_und_minobarrow_01",
    t_com_cnj_summonskeletonchamp = "t_glb_und_skelcmpgls_01",
    t_com_cnj_summonfrostmonarch = "t_dae_cre_monarchfr_01",
    t_com_cnj_summonspiderdaedra = "t_dae_cre_spiderdae_01",
}

trSummonsConfig.summonRecords = {
    t_com_cnj_summondevourer = {
        name = "Summon Devourer",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 156,
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
        cost = 155,
        effects = {{
            id = 118, --command creature
            rangeType = 0, --self
            area = 0,
            duration = 45,
            magnitudeMax = 1000,
            magnitudeMin = 1000,
            attribute = -1,
            skill = -1
        }}
    },
    t_com_cnj_summonlesserclannfear = {
        name = "Summon Rock Chisel Clannfear",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 57,
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
        cost = 169,
        effects = {{
            id = 118, --command creature
            rangeType = 0, --self
            area = 0,
            duration = 45,
            magnitudeMax = 1000,
            magnitudeMin = 1000,
            attribute = -1,
            skill = -1
        }}
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
        cost = 180,
        effects = trSummonsConfig.placeholderEffects
    },
    t_nor_cnj_summonicewraith = {
        name = "Summon Ice Wraith",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 105,
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
        cost = 45,
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
        cost = 138,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonherne = {
        name = "Summon Herne",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 54,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonmorphoid = {
        name = "Summon Morphoid",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 63,
        effects = trSummonsConfig.placeholderEffects
    },
    t_nor_cnj_summondraugr = {
        name = "Summon Draugr",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 78,
        effects = trSummonsConfig.placeholderEffects
    },
    t_nor_cnj_summonspriggan = {
        name = "Summon Spriggan",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 144,
        effects = trSummonsConfig.placeholderEffects
    },
    t_de_cnj_summongreaterbonelord = {
        name = "Summon Bonelord Warder",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 160,
        effects = {{
            id = 118, --command creature
            rangeType = 0, --self
            area = 0,
            duration = 45,
            magnitudeMax = 1000,
            magnitudeMin = 1000,
            attribute = -1,
            skill = -1
        }}
    },
    t_cyr_cnj_summonghost = {
        name = "Summon Ghost",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 21,
        effects = trSummonsConfig.placeholderEffects
    },
    t_cyr_cnj_summonwraith = {
        name = "Summon Wraith",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 147,
        effects = trSummonsConfig.placeholderEffects
    },
    t_cyr_cnj_summonbarrowguard = {
        name = "Summon Barrowguard",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 33,
        effects = trSummonsConfig.placeholderEffects
    },
    t_cyr_cnj_summonminobarrowguard = {
        name = "Summon Minotaur Barrowguard",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 171,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonskeletonchamp = {
        name = "Summon Skeleton Champion",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 96,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonfrostmonarch = {
        name = "Summon Frost Monarch",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 141,
        effects = trSummonsConfig.placeholderEffects
    },
    t_com_cnj_summonspiderdaedra = {
        name = "Summon Spider Daedra",
        subtype = trSummonsConfig.subtype,
        flags = trSummonsConfig.flags,
        cost = 126,
        effects = trSummonsConfig.placeholderEffects
    }
}

return trSummonsConfig