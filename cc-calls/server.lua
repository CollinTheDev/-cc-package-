-- Function to make API request to fetch calls
function FetchCalls()
    local apiUrl = Config.ApiUrl
    local apiKey = Config.ApiKey
    local headers = {
        ['Authorization'] = 'Bearer ' .. apiKey
    }

    PerformHttpRequest(apiUrl, function(statusCode, response, headers)
        if statusCode == 200 then
            local calls = json.decode(response)
            if calls and #calls > 0 then
                for _, call in ipairs(calls) do
                    if not call.closed then
                        TriggerClientEvent('cad-announcer:newCallAnnouncement', -1, call.id)
                        print('Announced new call with ID:', call.id)
                    end
                end
            else
                print('No active calls found.')
            end
        else
            print('Failed to fetch calls. Status code:', statusCode, 'Response:', response)
        end
    end, 'GET', nil, headers)
end

-- Function to periodically fetch calls
Citizen.CreateThread(function()
    while true do
        FetchCalls()
        Citizen.Wait(60000)  -- Fetch calls every 60 seconds
    end
end)

-- Event handler for when a new call is made (replace with your actual event triggering)
RegisterServerEvent('cad-announcer:newCall')
AddEventHandler('cad-announcer:newCall', function(callId)
    -- Here you would typically handle what happens when a new call is made
    print('New call made with ID:', callId)
    -- You can add more functionality here as per your server's requirements
end)
