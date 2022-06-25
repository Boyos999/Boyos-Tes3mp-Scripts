familiarsConfig = {}

familiarsConfig.staffRankRequired = 2

--Not implemented
familiarsConfig.enableSpell = false
familiarsConfig.penalty = false
familiarsConfig.buffs = false

--String to append to refid of inventory item of familiar
familiarsConfig.appendInv = "_faminv"

familiarsConfig.familiars = {
    fam_guar = {
        baseId = "guar",
        name = "Guar Familiar",
        icon = "n\\Tx_guarhide_01.tga",
        scale = 0.3
    }
}

familiarsConfig.spell = {}

familiarsConfig.badCmdMsg = color.Red .. "Use /familiar help for proper command usage\n"
familiarsConfig.helpText = color.Purple .. "Usage: ".. color.White .. "/familiar <give> <pid> <familiar_id>\n"

return familiarsConfig