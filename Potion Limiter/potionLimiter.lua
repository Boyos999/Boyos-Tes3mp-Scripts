local potionLimiter = {}

local vanillaPotionTable = {}
vanillaPotionTable = jsonInterface.load("custom/vanillapotions.json")

--config
local potionLimitTable = {
    {alch = 0, potions = 3},
    {alch = 50, potions = 4},
    {alch = 75, potions = 5},
    {alch = 100, potions = 6}
}
local showMessageOnPotionEnd = true

function potionLimiter.OnPlayerItemUseValidator(eventStatus, pid, itemRefId)
    local isPotion = false
    local maxActivePotions = potionLimitTable[1].potions
    local activePotions = 0

    if Players[pid].data.customVariables.activePotions ~= nil then
        activePotions = Players[pid].data.customVariables.activePotions
    end

    --Set the appropriate potion max
    for _,limit in pairs(potionLimitTable) do
        if tes3mp.GetSkillBase(pid,16) >= limit.alch then
            maxActivePotions = limit.potions
        end
    end
    
    --Check if the item used is a potion
    isPotion = potionLimiter.getIsPotion(itemRefId)
    
    --If the item used is a potion and the player can/cannot use it
    if isPotion == true and activePotions < maxActivePotions then
        return customEventHooks.makeEventStatus(nil,nil)
    elseif isPotion == true and activePotions >= maxActivePotions then
        tes3mp.MessageBox(pid, -1, color.Red .. "You cannot drink more potions at this time")
        return customEventHooks.makeEventStatus(false,nil)
    end
    --The item used was not a potion
    return customEventHooks.makeEventStatus(nil,nil)
end

function potionLimiter.getIsPotion(itemRefId)
    local isPotion = false
    local recordStore = RecordStores["potion"]
    --Check if the item used is a potion
    if recordStore.data.generatedRecords[itemRefId] ~= nil then
        isPotion = true
    elseif recordStore.data.permanentRecords[itemRefId] ~= nil then
        isPotion = true
    elseif vanillaPotionTable[itemRefId] ~= nil then
        isPotion = true
    end
    return isPotion
end

--Track potions based on active effects
function potionLimiter.OnPlayerSpellsActiveHandler(eventStatus,pid,playerPacket)
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        
        local action = playerPacket.action
        local spells = playerPacket.spellsActive
        local activePotions = 0

        if Players[pid].data.customVariables.activePotions ~= nil then
            activePotions = Players[pid].data.customVariables.activePotions
        end

        for spellId,spellTable in pairs(spells) do
            if potionLimiter.getIsPotion(spellId) then
                if action == enumerations.spellbook.SET or action == enumerations.spellbook.ADD then
                    activePotions = activePotions + 1
                elseif action == enumerations.spellbook.REMOVE then
                    activePotions = activePotions - 1
                    if potionLimiter.showMessageOnPotionEnd then
                        tes3mp.MessageBox(pid, -1, "The effects of a potion have worn off")
                    end
                end
            end
        end

        if activePotions < 0 then
            activePotions = 0
        end

        Players[pid].data.customVariables.activePotions = activePotions
    end
end

--Effects are removed on player death
function potionLimiter.OnPlayerDeath(eventStatus,pid)
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        Players[pid].data.customVariables.activePotions = 0
    end
end

customEventHooks.registerValidator("OnPlayerItemUse",potionLimiter.OnPlayerItemUseValidator)
customEventHooks.registerHandler("OnPlayerSpellsActive",potionLimiter.OnPlayerSpellsActiveHandler)
customEventHooks.registerHandler("OnPlayerDeath",potionLimiter.OnPlayerDeath)

return potionLimiter
