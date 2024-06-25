RegisterCommand('detach', function(source, args, rawCommand)
    local callId = args[1]

    if callId == nil then
        TriggerEvent('chat:addMessage', { args = { '^1SYSTEM', 'Please provide a call ID.' } })
        print("Detach command received, but no call ID provided.")
        return
    end

    print("Detach command received with call ID:", callId)

    -- Request the server to get the Discord ID and make the API request
    TriggerServerEvent('fivem_detach:detachToCall', callId)
end, false)
