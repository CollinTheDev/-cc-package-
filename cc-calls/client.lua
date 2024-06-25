RegisterNetEvent('cad-announcer:newCallAnnouncement')
AddEventHandler('cad-announcer:newCallAnnouncement', function(callId)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0 },
        multiline = true,
        args = { 'CAD', 'A new call with ID ' .. callId .. ' was made.' }
    })
end)
