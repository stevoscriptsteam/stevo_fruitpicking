
lib.locale()
local config = require('config')
local stevo_lib = exports['stevo_lib']:import()
local progress = config.progressCircle and lib.progressCircle or lib.progressBar
local blips = {}
local buyerStand = 0
local buyerPed = 0
local buyerOpen = false

local function pairsInOrder(object, _)
    local a = {}
    for n in pairs(object) do
        a[#a + 1] = n
    end
    table.sort(a, _)
    local i = 0
    local iterator = function()
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], object[a[i]]
        end
    end
    return iterator
end

local function createBlip(type)
    if not type.blip then return end
    local blip = AddBlipForCoord(type.blip.coords.x, type.blip.coords.y, type.blip.coords.z)
    SetBlipSprite(blip, type.blip.sprite or 1)
    SetBlipDisplay(blip, type.blip.display or 4)
    SetBlipScale(blip, type.blip.scale or 1.0)
    SetBlipColour(blip, type.blip.colour or 1)
    SetBlipAsShortRange(blip, type.blip.shortRange or false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(type.blip.name)
    EndTextCommandSetBlipName(blip)
    return blip
end


local function deleteBlips()
    if not blips then return end
    for i = 1, #blips do
        local blip = blips[i]
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    blips = {}
end

local function pickFruit(type)
    if type.skillCheck then 
        if not lib.skillCheck(type.skillCheck) then 
            return stevo_lib.Notify(locale('notify.failedSkill'), 'error', 3000)
        end
    end
    if progress({
        duration = type.pickDuration * 1000,
        position = 'bottom',
        label = (locale('progress.picking'):format(type.type)),
        useWhileDead = false,
        canCancel = false,
        anim = {
            dict = type.animDict,
            clip = type.animClip,
            scenario = type.scenario
        },
        disable = { move = true, car = true, mouse = false, combat = true, },
    }) then    
        local pickedFruit = lib.callback.await('stevo_fruitpicking:pickFruit', false, type)
        if pickedFruit then 
            stevo_lib.Notify((locale('notify.picked'):format(type.type)), 'success', 3000)
        end
        lib.showTextUI(type.textLabel)
    end

end

local function openBuyerMenu(buyer)
    ClearPedTasksImmediately(buyerPed)
    Wait(100)
    PlayPedAmbientSpeechNative(buyerPed, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
    
   

    local buyerOptions = {}
    for item, itemInfo in pairsInOrder(buyer.items) do
        buyerOptions[#buyerOptions + 1] = {
            title = ('%s ($%s)'):format(itemInfo.label, itemInfo.sale),
            icon = itemInfo.icon,
            arrow = true,
            onSelect = function()
                lib.showContext('stevo_fruitpicking_buyer_'..item)
            end
        }
        lib.registerContext({
            id = 'stevo_fruitpicking_buyer_'..item,
            menu = 'stevo_fruitpicking_buyer',
            onExit = function()
                buyerOpen = false
                TaskStartScenarioInPlace(buyerPed, buyer.ped.scenario, 0, true)
            end,
            title = (locale('menu.buyer_sell')):format(itemInfo.label),
            options = {
                {
                    title = locale("menu.buyer_sellall"),
                    arrow = true,
                    onSelect = function()
                        local sellFruit = lib.callback.await('stevo_fruitpicking:sellFruit', false, true, item, buyer)
                        if sellFruit then 
                            stevo_lib.Notify((locale('notify.sold'):format(itemInfo.label, sellFruit)), 'success', 3000)
                        else 
                            stevo_lib.Notify((locale('notify.notenough')):format(itemInfo.label), 'error', 3000)
                        end
                        buyerOpen = false
                        TaskStartScenarioInPlace(buyerPed, buyer.ped.scenario, 0, true)
                    end

                },
                {
                    title = locale("menu.buyer_sellone"),
                    arrow = true,
                    onSelect = function()
                        local sellFruit = lib.callback.await('stevo_fruitpicking:sellFruit', false, false, item, buyer)
                        if sellFruit then 
                            stevo_lib.Notify((locale('notify.sold'):format(itemInfo.label, sellFruit)), 'success', 3000)
                        else 
                            stevo_lib.Notify((locale('notify.notenough')):format(itemInfo.label), 'error', 3000)
                        end
                        buyerOpen = false
                        TaskStartScenarioInPlace(buyerPed, buyer.ped.scenario, 0, true)
                    end
                }
            }
        })
    end
    lib.registerContext({
        id = 'stevo_fruitpicking_buyer',
        title = locale('menu.buyer'),
        onExit = function()
            buyerOpen = false
            TaskStartScenarioInPlace(buyerPed, buyer.ped.scenario, 0, true)
        end,
        options = buyerOptions
    })
    lib.showContext('stevo_fruitpicking_buyer')

end


local function initPoints()
    for i = 1, #config.types do
        local type = config.types[i]
        createBlip(type)

        if config.interaction == 'textui' then
            for i = 1, #type.points do
                local point = type.points[i]
                local fruitProp = 0
                
                lib.points.new({
                    coords = point,
                    distance = type.viewDistance,
                    onEnter = function()
                        if type.prop then
                            local model = type.prop
                            lib.requestModel(model)
                            fruitProp = CreateObject(model, point.x, point.y, point.z, false, false, false)
                            PlaceObjectOnGroundProperly(fruitProp)
                            FreezeEntityPosition(fruitProp, true)
                        end
                        lib.showTextUI(type.textLabel) 
                    end,
                    onExit = function()
                        if DoesEntityExist(fruitProp) then 
                            DeleteEntity(fruitProp)
                        end
                        lib.hideTextUI()
                    end,
                    nearby = function(self)
                        if type.marker then
                            DrawMarker(type.marker.type, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, type.marker.color.r, type.marker.color.g, type.marker.color.b, type.marker.color.a, false, true, 2, false, nil, nil, false)
                        end
                        if self.currentDistance < type.interactDistance and IsControlJustPressed(0, 38) then
                            lib.hideTextUI()
                            pickFruit(type)                   
                        end
                    end,
                })
                
            end
        else          
            for i = 1, #type.points do
                local point = type.points[i]
                local options = {
                    options = {
                        {
                            name = 'pick_fruit',
                            type = "client",
                            action = function() 
                                pickFruit(type) 
                            end,
                            icon =  type.targetIcon,
                            label = type.targetLabel,
                        }
                    },
                    distance = type.interactDistance,
                    rotation = 45
                }
                stevo_lib.target.AddBoxZone('stevopickfruit'..type.item..''..i, point, vec3(3, 3, 3), options)  
            end 
        end
    end

    for i = 1, #config.fruitBuyers do 
        local buyer = config.fruitBuyers[i]
        local textUI = false

        createBlip(buyer)
        
        lib.points.new({
            coords = buyer.ped.coords,
            distance = buyer.viewDistance,
            onEnter = function()
                if buyer.stand then
                    local model = buyer.stand.model
                    lib.requestModel(model)
                    buyerStand = CreateObject(model, buyer.stand.coords.x, buyer.stand.coords.y, buyer.stand.coords.z, false, false, false)
                    SetEntityHeading(buyerStand, buyer.stand.coords.w)
                    PlaceObjectOnGroundProperly(buyerStand)
                    FreezeEntityPosition(buyerStand, true)
                end

                local model = buyer.ped.model
                lib.requestModel(model, 5000)
                
                buyerPed = stevo_lib.createPed(model, buyer.ped.coords.x, buyer.ped.coords.y, buyer.ped.coords.z, buyer.ped.coords.w, false, true)
                
                SetModelAsNoLongerNeeded(buyerPed)
                FreezeEntityPosition(buyerPed, true)
                SetEntityInvincible(buyerPed, true)
                SetBlockingOfNonTemporaryEvents(buyerPed, true)
                TaskStartScenarioInPlace(buyerPed, buyer.ped.scenario, 0, true)

                if not config.interaction == 'textui' then 
                    local options = {
                        options = {
                            {
                                name = 'sell_fruit',
                                type = "client",
                                action = function() 
                                    openBuyerMenu(buyer) 
                                end,
                                icon =  buyer.targetIcon,
                                label = locale("target.buyer"),
                            }
                        },
                        distance = buyer.interactDistance,
                        rotation = 45
                    }
                    stevo_lib.target.AddBoxZone('stevopickfruitbuyer'..i, vec3(3, 3, 3), options)  
                end
            end,
            onExit = function()
                if DoesEntityExist(buyerStand) then 
                    DeleteEntity(buyerStand)
                end
                if DoesEntityExist(buyerPed) then 
                    DeleteEntity(buyerPed)
                end
                if not config.interaction == 'textui' then 
                    stevo_lib.target.RemoveZone('stevopickfruitbuyer'..i)  
                else
                    if textUI then 
                        lib.hideTextUI()
                    end
                end
            end,
            nearby = function(self)
                if not config.interaction == 'textui' then return end
                if self.currentDistance < buyer.interactDistance and not textUI and not buyerOpen then 
                    lib.showTextUI(locale('textui.buyer')) 
                    textUI = true
                end
                if self.currentDistance > buyer.interactDistance and textUI then 
                    lib.hideTextUI()
                    textUI = false 
                end
                if self.currentDistance < buyer.interactDistance and IsControlJustPressed(0, 38) then
                    lib.hideTextUI()
                    textUI = false 
                    buyerOpen = true
                    openBuyerMenu(buyer)                   
                end
            end,
        })
    end
end


RegisterNetEvent('stevo_lib:playerLoaded', function()
    initPoints()
end)


AddEventHandler('onResourceStart', function(resource)
    if resource ~= cache.resource then return end

    initPoints()
end)


AddEventHandler('onResourceStop', function(resource)
    if resource ~= cache.resource then return end

    deleteBlips()

    if DoesEntityExist(buyerStand) then 
        DeleteEntity(buyerStand)
    end
    if DoesEntityExist(buyerPed) then 
        DeleteEntity(buyerPed)
    end
end)
