ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('shopmedico')
AddEventHandler('shopmedico', function(value, quantita)
    local xPlayer = ESX.GetPlayerFromId(source)
    local soldidarimuovere = quantita * Config.PrezzoMedikit.medikit
    local soldidarimuovere2 = quantita * Config.PrezzoBende.benda

    if value == 'medikit' then
        if xPlayer.getMoney() >= soldidarimuovere then
            exports.ox_inventory:RemoveItem(source, 'money', soldidarimuovere)
            xPlayer.addInventoryItem('medikit', quantita)
            lib.notify({
                title = 'SHOP MEDICO',
                description = 'Hai comprato un medikit per '..soldidarimuovere..'$',
                type = 'success'
            })
        else
            lib.notify({
                title = 'SHOP MEDICO',
                description = 'Non hai abbastanza soldi',
                type = 'error'
            })
        end
    elseif value == 'bandage' then
        if xPlayer.getMoney() >= soldidarimuovere2 then
            exports.ox_inventory:RemoveItem(source, 'money', soldidarimuovere2)
            xPlayer.addInventoryItem('bandage', quantita)
            lib.notify({
                title = 'SHOP MEDICO',
                description = 'Hai comprato una benda per '..soldidarimuovere2..'$',
                type = 'success'
            })
        else
            lib.notify({
                title = 'SHOP MEDICO',
                description = 'Non hai abbastanza soldi',
                type = 'error'
            })
        end
    end

end)