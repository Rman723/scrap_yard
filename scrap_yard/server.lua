ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Sell Rims
RegisterNetEvent('esx:sell')
AddEventHandler('esx:sell', function(source, item, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(item)


    if xItem.count < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~No '..item..'!')
        return
    end
    xPlayer.addMoney(price)
    xPlayer.removeInventoryItem(item, 1)
    TriggerClientEvent('esx:showNotification', source, '~g~You sold a '..item..' for $'..price..'!')
end)
--Scap Items
RegisterNetEvent('esx:decraft')
AddEventHandler('esx:decraft', function(source, item, b1, b2,b3,b4,b5,b6,b7)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(item)


    if xItem.count < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~No '..item..'!')
        return
    end

    xPlayer.removeInventoryItem(item, 1)
    if b1 > 0 then 
        xPlayer.addInventoryItem('zink', b1)
    end
    if b2 > 0 then 
        xPlayer.addInventoryItem('battery_acid', b2)
    end
    if b3 > 0 then 
        xPlayer.addInventoryItem('copper', b3)
    end
    if b4 > 0 then 
        xPlayer.addInventoryItem('plastic', b4)
    end
    if b5 > 0 then 
        xPlayer.addInventoryItem('wires', b5)
    end
    if b6 > 0 then 
        xPlayer.addInventoryItem('aluminum', b6)
    end
    if b7 > 0 then 
        xPlayer.addInventoryItem('steel', b7)
    end
end)

