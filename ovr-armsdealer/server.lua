local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("ovr-armsdealer:giveWeapon", function(weapon, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not weapon or not price then return end

    if Player.Functions.RemoveMoney("cash", price, "illegal-weapon-purchase") then
        exports['ps-inventory']:AddItem(src, weapon, 1)
        TriggerClientEvent('QBCore:Notify', src, 'Weapon purchased.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough money.', 'error')
    end
end)
