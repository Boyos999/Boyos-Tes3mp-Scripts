local potionLimiter = {}

local vanillaPotionTable = {}
vanillaPotionTable = jsonInterface.load("custom/vanillapotions.json")

--config
local BaseMaxActivePotions = 3
local potionLimitTable = {
    {alch = 0, potions = 3},
    {alch = 50, potions = 4},
    {alch = 75, potions = 5},
    {alch = 100, potions = 6}
}


function potionLimiter.OnPlayerItemUseValidator(eventStatus, pid, itemRefId)
    local isPotion = false
    local maxActivePotions = BaseMaxActivePotions
    
    --Set the appropriate potion max
    for _,limit in pairs(potionLimitTable) do
        if tes3mp.GetSkillBase(pid,16) >= limit.alch then
            maxActivePotions = limit.potions
        end
    end
    
    --Check if the item used is a potion
    isPotion = potionLimiter.getIsPotion(itemRefId)
    
    --If the item used is a potion and the player can/cannot use it
    if isPotion == true and Players[pid].data.customVariables.activePotions < maxActivePotions then
        return customEventHooks.makeEventStatus(nil,nil)
    elseif isPotion == true and Players[pid].data.customVariables.activePotions >= maxActivePotions then
        tes3mp.MessageBox(pid, -1, color.Red .. "You cannot drink more potions at this time")
        return customEventHooks.makeEventStatus(false,false)
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

function potionLimiter.getPotionDuration(itemRefId)
    local recordStore = RecordStores["potion"]
    if recordStore.data.generatedRecords[itemRefId] ~= nil then
        local potionRecord = recordStore.data.generatedRecords[itemRefId]
        potionDuration = potionLimiter.getRecordStorePotionDuration(itemRefId,potionRecord)
        
    elseif recordStore.data.permanentRecords[itemRefId] ~= nil then
        local potionRecord = recordStore.data.permanentRecords[itemRefId]
        potionDuration = potionLimiter.getRecordStorePotionDuration(itemRefId,potionRecord)
        
    elseif vanillaPotionTable[itemRefId] ~= nil then
        potionDuration = potionLimiter.getVanillaPotionDuration(itemRefId)
    end
    
    return potionDuration
end

function potionLimiter.getVanillaPotionDuration(itemRefId)
    local potionDuration = 0
    if vanillaPotionTable[itemRefId].duration ~= nil then
        potionDuration = vanillaPotionTable[itemRefId].duration
    end
    return potionDuration
end

function potionLimiter.getRecordStorePotionDuration(itemRefId,potionRecord)
    local potionDuration = 0
    --If the potion has a baseId and does not overwrite effects
    if potionRecord.baseId ~= nil and potionRecord.effects == nil then
        potionDuration = potionLimiter.getVanillaPotionDuration(potionRecord.baseId)
    --Otherwise find the longest effect duration
    elseif potionRecord.effects ~= nil then
        for _,effect in pairs(potionRecord.effects) do
            if effect.duration > potionDuration then
                potionDuration = effect.duration
            end
        end 
    end
    return potionDuration
end

function potionLimiter.OnPlayerItemUseHandler(eventStatus, pid, itemRefId)
    local potionDuration
    local isPotion = potionLimiter.getIsPotion(itemRefId)
    if isPotion == true then
        --Both event statuses need to be ~false, since if default is false the player can't use the item
        if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
            potionDuration = potionLimiter.getPotionDuration(itemRefId)
            --don't make timers for instant potions
            if potionDuration > 1 then
                Players[pid].data.customVariables.activePotions = Players[pid].data.customVariables.activePotions + 1
                local potTimer = tes3mp.CreateTimerEx("potionLimiterTimer",1000 * potionDuration,"i", pid)
                tes3mp.StartTimer(potTimer)
            end
        end
    end
end

function potionLimiterTimer(pid)
    --Can't do shit to players that aren't logged in (easily at least)
    if Players[pid] ~= nil then
        if Players[pid]:IsLoggedIn() then
            --In case there's any funkiness you can't get negative active potions
            if Players[pid].data.customVariables.activePotions > 0 then
                Players[pid].data.customVariables.activePotions = Players[pid].data.customVariables.activePotions - 1
                tes3mp.MessageBox(pid, -1, "The effects of a potion have worn off")
            end
        end
    end
end

--Reset on login in the case of players logging out before timers end
function potionLimiter.resetActivePotions(eventStatus, pid)
    Players[pid].data.customVariables.activePotions = 0
end

customEventHooks.registerValidator("OnPlayerItemUse",potionLimiter.OnPlayerItemUseValidator)
customEventHooks.registerHandler("OnPlayerItemUse",potionLimiter.OnPlayerItemUseHandler)
customEventHooks.registerHandler("OnPlayerAuthentified",potionLimiter.resetActivePotions)
