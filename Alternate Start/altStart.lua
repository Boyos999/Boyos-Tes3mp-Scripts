local altStart = {}

local spawnLocations = jsonInterface.load("custom/altStartLocations.json")

function altStart.GenerateMenu()
    Menus["Alternate Start"] = {}
    Menus["Alternate Start"].text = "Choose your starting location."
    Menus["Alternate Start"].buttons = {}
    
    local backButton = { 
        caption = "Back", 
        destinations = {menuHelper.destinations.setDefault("Alternate Start")} 
    }
    
    for category,locations in pairs(spawnLocations) do
        local menuButton = {
            caption = category,
            destinations = {menuHelper.destinations.setDefault("AS" .. category)}
        }
        
        table.insert(Menus["Alternate Start"].buttons,menuButton)
        tes3mp.LogMessage(enumerations.log.INFO, "Added menuButton for:" .. category)
        
        Menus["AS" .. category] = {}
        Menus["AS" .. category].text = category
        Menus["AS" .. category].buttons = {}
        for _,location in pairs(locations) do
            local subButton = {
                caption = location.name,
                destinations = {menuHelper.destinations.setDefault(nil,
                    {
                        menuHelper.effects.runGlobalFunction("altStart", "altStartFunction", 
                            {menuHelper.variables.currentPid(),location.cell,location.loc[1],location.loc[2],location.loc[3],location.loc[4],location.loc[5]})
                    }) 
                }
            }
            
            table.insert(Menus["AS" .. category].buttons,subButton)
        end
        
        table.insert(Menus["AS" .. category].buttons,backButton)
        
    end
end

function altStart.OnPlayerEndCharGenReplacement(eventStatus, pid)
    if Menus["Alternate Start"] == nil then
        altStart.GenerateMenu()
    end
    Players[pid].currentCustomMenu = "Alternate Start"
    menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
end

customEventHooks.registerHandler("OnPlayerEndCharGen", altStart.OnPlayerEndCharGenReplacement)

function altStart.altStartFunction(pid, altCell,altPosX, altPosY, altPosZ,altRotX, altRotY)
    if altCell ~= nil then

        tes3mp.SetCell(pid, altCell)
        tes3mp.SendCell(pid)
        
        if altPosX ~= nil and altPosY ~= nil and altPosZ ~= nil and altRotX ~= nil and altRotY ~= nil then
            tes3mp.SetPos(pid, altPosX, altPosY, altPosZ)
            tes3mp.SetRot(pid, altRotX, altRotY)
            tes3mp.SendPos(pid)
        end
    end

end

return altStart