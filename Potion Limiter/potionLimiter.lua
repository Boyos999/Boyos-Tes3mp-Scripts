local potionLimiter = {}

local vanillaPotionTable = {}
vanillaPotionTable = jsonInterface.load("custom/vanillapotions.json")

--config
local BaseMaxActivePotions = 3
local alchemy25Potions = 3
local alchemy50Potions = 4
local alchemy75Potions = 5
local alchemy100Potions = 6

function potionLimiter.OnPlayerItemUseValidator(eventStatus, pid, itemRefId)
    local isPotion = false
    local recordStore = RecordStores["potion"]
    local maxActivePotions = BaseMaxActivePotions
    
    if tes3mp.GetSkillBase(pid, 16) == 100 then
        maxActivePotions = alchemy100Potions
    elseif tes3mp.GetSkillBase(pid, 16) == 75 then
        maxActivePotions = alchemy75Potions
    elseif tes3mp.GetSkillBase(pid, 16) == 50 then
        maxActivePotions = alchemy50Potions
    elseif tes3mp.GetSkillBase(pid, 16) == 50 then
        maxActivePotions = alchemy25Potions
    end
     
    if recordStore.data.generatedRecords[itemRefId] ~= nil then
        isPotion = true
    elseif recordStore.data.permanentRecords[itemRefId] ~= nil then
        isPotion = true
    elseif vanillaPotionTable[itemRefId] ~= nil then
        isPotion = true
    end
    
    if isPotion == true and Players[pid].data.customVariables.activePotions < maxActivePotions then
        return customEventHooks.makeEventStatus(nil,nil)
    elseif isPotion == true and Players[pid].data.customVariables.activePotions >= maxActivePotions then
        tes3mp.MessageBox(pid, -1, color.Red .. "You cannot drink more potions at this time")
        return customEventHooks.makeEventStatus(false,false)
    end
    return customEventHooks.makeEventStatus(nil,false)
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
    if potionRecord.baseId ~= nil and potionRecord.effects == nil then
        potionDuration = potionLimiter.getVanillaPotionDuration(potionRecord.baseId)
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
    if eventStatus.validCustomHandlers ~= false and eventStatus.validDefaultHandler ~= false then
        potionDuration = potionLimiter.getPotionDuration(itemRefId)
        if potionDuration > 1 then
            Players[pid].data.customVariables.activePotions = Players[pid].data.customVariables.activePotions + 1
            local potTimer = tes3mp.CreateTimerEx("potionLimiterTimer",1000 * potionDuration,"i", pid)
            tes3mp.StartTimer(potTimer)
        end
    end
end

function potionLimiterTimer(pid)
    if Players[pid] ~= nil then
        if Players[pid]:IsLoggedIn() then
            Players[pid].data.customVariables.activePotions = Players[pid].data.customVariables.activePotions - 1
            tes3mp.MessageBox(pid, -1, "The effects of a potion have worn off")
        end
    end
end

function potionLimiter.resetActivePotions(eventStatus, pid)
    Players[pid].data.customVariables.activePotions = 0
end

customEventHooks.registerValidator("OnPlayerItemUse",potionLimiter.OnPlayerItemUseValidator)
customEventHooks.registerHandler("OnPlayerItemUse",potionLimiter.OnPlayerItemUseHandler)
customEventHooks.registerHandler("OnPlayerAuthentified",potionLimiter.resetActivePotions)