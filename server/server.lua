local QBCore = exports['qb-core']:GetCoreObject()




QBCore.Functions.CreateUseableItem("sprite", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('sprite', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['sprite'], "remove")
    TriggerClientEvent('mc-lean:drinksprite', source)
end)

QBCore.Functions.CreateUseableItem("foamcup", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('foamcup', 1)
    if Player.Functions.RemoveItem('leanbottle', 1) then
        Player.Functions.AddItem('leancup', 1)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leanbottle'], "remove")
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leancup'], "add")
    elseif Player.Functions.RemoveItem('sprite', 1) then
        if Player.Functions.RemoveItem('jollyranchers', Config.JollyRanchers) then
            if Player.Functions.RemoveItem('coughsyrup', Config.JollyRanchers) then
                Player.Functions.AddItem('leancup', 1)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['sprite'], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['jollyranchers'], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coughsyrup'], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leancup'], "add")
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, 'Missing Materials', "error", 2700)
                elseif Config.NotifyType == 'okok' then
                    TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'Missing Materials', 2700, 'error', false)
                elseif Config.NotifyType == 'k5' then
                    TriggerClientEvent("k5_notify:notify", src, 'Lean', 'Missing Materials', 'error', 2700)
                end
                Player.Functions.AddItem('foamcup', 1)
                Player.Functions.AddItem('sprite', 1)
                Player.Functions.AddItem('jollyranchers', Config.JollyRanchers)
            end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, 'Missing Materials', "error", 2700)
            elseif Config.NotifyType == 'okok' then
                TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'Missing Materials', 2700, 'error', false)
            elseif Config.NotifyType == 'k5' then
                TriggerClientEvent("k5_notify:notify", src, 'Lean', 'Missing Materials', 'error', 2700)
            end
            Player.Functions.AddItem('foamcup', 1)
            Player.Functions.AddItem('sprite', 1)
        end
    else
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'Missing Materials', "error", 2700)
        elseif Config.NotifyType == 'okok' then
            TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'Missing Materials', 2700, 'error', false)
        elseif Config.NotifyType == 'k5' then
            TriggerClientEvent("k5_notify:notify", src, 'Lean', 'Missing Materials', 'error', 2700)
        end
        Player.Functions.AddItem('foamcup', 1)
    end
end)

QBCore.Functions.CreateUseableItem("jollyrancherbag", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('jollyrancherbag', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['jollyrancherbag'], "remove")
    Player.Functions.AddItem('jollyranchers', Config.JollyRancherBag)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['jollyranchers'], "add")
end)

QBCore.Functions.CreateUseableItem("jollyranchers", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('jollyranchers', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['jollyranchers'], "remove")
    TriggerClientEvent('mc-lean:eatjolly', source)
end)

QBCore.Functions.CreateUseableItem("leancup", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('leancup', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leancup'], "remove") 
    TriggerClientEvent('mc-lean:drinklean', source)
end)

QBCore.Functions.CreateUseableItem("leanbottle", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('leanbottle', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leanbottle'], "remove") 
    TriggerClientEvent('mc-lean:drinklean', source)
end)

QBCore.Functions.CreateUseableItem("coughsyrup", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

	if Player.Functions.RemoveItem('coughsyrup', Config.CoughSyrup) then
        if Player.Functions.RemoveItem('foamcup', 1) then
            if Player.Functions.RemoveItem('sprite', 1) then
                if Player.Functions.RemoveItem('jollyranchers', 1) then
                    Player.Functions.AddItem('foamcup', 1) 
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coughsyrup'], "remove")
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['sprite'], "remove")
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['jollyranchers'], "remove")
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['foamcup'], "remove")
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leancup'], "add")
                else
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, 'No Jolly Ranchers', "error", 2700)
                    elseif Config.NotifyType == 'okok' then
                        TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'No Jolly Ranchers', 2700, 'error', false)
                    elseif Config.NotifyType == 'k5' then
                        TriggerClientEvent("k5_notify:notify", src, 'Lean', 'No Jolly Ranchers', 'error', 2700)
                    end
                end
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, 'No Sprite', "error", 2700)
                elseif Config.NotifyType == 'okok' then
                    TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'No Sprite', 2700, 'error', false)
                elseif Config.NotifyType == 'k5' then
                    TriggerClientEvent("k5_notify:notify", src, 'Lean', 'No Sprite', 'error', 2700)
                end
            end
        elseif Player.Functions.RemoveItem('sprite', 1) then
            if Player.Functions.RemoveItem('jollyranchers', 1) then
                Player.Functions.AddItem('leanbottle', 1)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coughsyrup'], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['jollyranchers'], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['sprite'], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leanbottle'], "add")
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, 'No Jolly Ranchers', "error", 2700)
                elseif Config.NotifyType == 'okok' then
                    TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'No Jolly Ranchers', 2700, 'error', false)
                elseif Config.NotifyType == 'k5' then
                    TriggerClientEvent("k5_notify:notify", src, 'Lean', 'No Jolly Ranchers', 'error', 2700)
                end
                Player.Functions.AddItem('coughsyrup', Config.CoughSyrup)
                Player.Functions.AddItem('sprite', 1)
            end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, 'No Sprite or Foam Cup', "error", 2700)
            elseif Config.NotifyType == 'okok' then
                TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'No Sprite or Foam Cup', 2700, 'error', false)
            elseif Config.NotifyType == 'k5' then
                TriggerClientEvent("k5_notify:notify", src, 'Lean', 'No Sprite or Foam Cup', 'error', 2700)
            end
            Player.Functions.AddItem('coughsyrup', Config.CoughSyrup)
        end   
	else
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'No Cough Syrup', "error", 2700)
        elseif Config.NotifyType == 'okok' then
            TriggerClientEvent('okokNotify:Alert', src, 'Lean', 'No Cough Syrup', 2700, 'error', false)
        elseif Config.NotifyType == 'k5' then
            TriggerClientEvent("k5_notify:notify", src, 'Lean', 'No Cough Syrup', 'error', 2700)
        end
    end
end)


RegisterNetEvent('mc-lean:stolelean', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Config.Random then
        Config.Reward = math.random(1, Config.Reward)
    end
    Player.Functions.AddItem('coughsyrup', Config.Reward)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coughsyrup'], "add", Config.Reward)
    local number = math.random(0, 100)
    if number <= Config.Police and number ~= 0 then
        if Config.Dispatch == 'ps' then 
            exports['ps-dispatch']:DrugSale()
        elseif Config.Dispatch == 'qs' then
            TriggerEvent('qs-dispatch:server:CreateDispatchCall', {
                job = Config.PoliceJobs,
                callLocation = Config.Syrup.xyz,
                callCode = { code = 'Stealing', snippet = '10-54' },
                message = "Suspect Caught Stealing",
                flashes = false, -- you can set to true if you need call flashing sirens...
                image = nil,
                blip = {
                    sprite = 488, --blip sprite
                    scale = 1.5, -- blip scale
                    colour = 1, -- blip colour
                    flashes = true, -- blip flashes
                    text = 'Stealing', -- blip text
                    time = (20 * 1000), --blip fadeout time (1 * 60000) = 1 minute
                }
            })
        end
    end
end)





