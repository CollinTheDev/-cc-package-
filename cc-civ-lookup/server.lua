local apiUrl = Config.ApiUrl
local apiKey = Config.ApiKey

RegisterServerEvent('cc-civilian-lookup:performLookup')
AddEventHandler('cc-civilian-lookup:performLookup', function(name)
    local src = source
    local requestData = {
        name = name
    }
    local headers = {
        ['Authorization'] = 'Bearer ' .. apiKey,
        ['Content-Type'] = 'application/json'
    }

    PerformHttpRequest(apiUrl, function(statusCode, response, headers)
        if statusCode == 200 then
            local data = json.decode(response)
            TriggerClientEvent('cc-civilian-lookup:displayData', src, data)
        else
            print('Failed to fetch civilian data. Status code:', statusCode, 'Response:', response)
            TriggerClientEvent('cc-civilian-lookup:displayData', src, nil)
        end
    end, 'POST', json.encode(requestData), headers)
end)
