RegisterCommand('lookup', function(source, args, rawCommand)
    local name = table.concat(args, " ")
    if name and #name > 0 then
        TriggerServerEvent('cc-civilian-lookup:performLookup', name)
    else
        print('Usage: /lookup <name>')
    end
end, false)

RegisterNetEvent('cc-civilian-lookup:displayData')
AddEventHandler('cc-civilian-lookup:displayData', function(data)
    if data then
        SendNUIMessage({
            action = 'displayData',
            data = data
        })
        SetNuiFocus(true, true)
    else
        print('No data found or failed to fetch data.')
    end
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)
