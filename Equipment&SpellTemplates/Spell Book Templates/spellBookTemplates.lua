local spellBookTemplates = {}

local spellBookTemplatesTable = {}
spellBookTemplatesTable = jsonInterface.load("custom/spellBookTemplatesTable.json")

function spellBookTemplates.restrictSpells(eventStatus, pid)
    local spellTemplate = Players[pid].data.customVariables.spellBookTemplates
    --If the player has a template active
    if spellTemplate ~= nil then
        --If the spell isn't present in the player's active template
        if not tableHelper.containsValue(spellBookTemplatesTable[spellTemplate],tes3mp.GetSelectedSpellId(pid),false) then
            --Reset Selected spell to previous
            Players[pid]:LoadSelectedSpell()
            --Return false to stop the spell from changing
            return customEventHooks.makeEventStatus(false,false)
        end
    end
    --Proceed normally
    return customEventHooks.makeEventStatus(nil,nil)
end

function spellBookTemplates.setTemplate(pid, spellTemplate)
    if spellTemplate ~= nil and spellBookTemplatesTable[spellTemplate] ~= nil then
        Players[pid].data.customVariables.spellBookTemplates = spellTemplate
        playerPacketHelper.addPlayerSpells(pid, spellBookTemplatesTable[spellTemplate])
        --set the player's spell to an approved spell
        Players[pid].data.miscellaneous.selectedSpell = tableHelper.getAnyValue(spellBookTemplatesTable[spellTemplate])
        Players[pid]:LoadSelectedSpell()
    else
        tes3mp.LogMessage(enumerations.log.ERROR, "Template does not exist, or no template name was given")
    end
end

function spellBookTemplates.removeTemplate(pid)
    spellTemplate = Players[pid].data.customVariables.spellBookTemplates
    --Make sure the player has a template that does exist before removing
    if spellBookTemplatesTable[spellTemplate] ~= nil and spellTemplate ~= nil then
        playerPacketHelper.removePlayerSpells(pid, spellBookTemplatesTable[spellTemplate])
    else
        tes3mp.LogMessage(enumerations.log.ERROR, "Player does not have an active template, or template does not exist")
    end
end
--[[
function spellBookTemplates.setTestTemplate(pid,cmd)
    spellBookTemplates.setTemplate(pid,cmd[2])
end

function spellBookTemplates.removeTestTemplate(pid,cmd)
    spellBookTemplates.removeTemplate(pid)
end

customCommandHooks.registerCommand("testsettemplate",spellBookTemplates.setTestTemplate)
customCommandHooks.registerCommand("testremovetemplate",spellBookTemplates.removeTestTemplate)
]]--
customEventHooks.registerValidator("OnPlayerSelectedSpell",spellBookTemplates.restrictSpells)