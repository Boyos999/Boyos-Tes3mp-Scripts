local guarBanker = {}

--[[ add to record store or use something else :)
    "by_bank_guar":{
      "baseId":"guar_pack",
      "name":"Conspicuous Guar",
      "aiFight":0
    },
]]--
local bankerRefId = "by_bank_guar"
local bankerDespawnTime = 60 -- in seconds
local bankerCoolDown = 7200 -- in seconds
local message = "Your banking guar is still on break for another "

local accessData = {}

function guarBanker.SummonBankGuar(pid)
    local uniqueIndex
    local cellDescription = tes3mp.GetCell(pid)
    local bankerTimer
    local playerName = Players[pid].name
    
    if guarBanker.CheckCooldown(pid) then
        uniqueIndex = logicHandler.CreateObjectAtPlayer(pid, {refId = bankerRefId, count = 1}, "spawn")
        bankerTimer = tes3mp.CreateTimerEx("guarBankerDespawnBankGuar",1000 * bankerDespawnTime, "ss", cellDescription, uniqueIndex)
        tes3mp.StartTimer(bankerTimer)
    end
end

function guarBanker.CheckCooldown(pid)
    local playerName = Players[pid].name
    if accessData[playerName] == nil then
        accessData[playerName] = os.time()
        return true
    elseif os.time() <= (accessData[playerName]+bankerCoolDown) then
        local timeLeft = (accessData[playerName]+bankerCoolDown - os.time())/60 -- minutes
        tes3mp.MessageBox(pid, -1, message .. timeLeft .. " minutes.")
        return false
    else
        accessData[playerName] = os.time()
        return true
    end
end

function guarBankerDespawnBankGuar(cellDescription, uniqueIndex)
    if not tableHelper.isEmpty(Players) then
        logicHandler.DeleteObjectForEveryone(cellDescription, uniqueIndex)
    end
    if LoadedCells[cellDescription] ~= nil then
        LoadedCells[cellDescription]:DeleteObjectData(uniqueIndex)
    end
end

customCommandHooks.registerCommand("banker", guarBanker.SummonBankGuar)