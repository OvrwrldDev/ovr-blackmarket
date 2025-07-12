local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    RequestModel(Config.DealerPed)
    while not HasModelLoaded(Config.DealerPed) do Wait(10) end

    local ped = CreatePed(0, Config.DealerPed, Config.DealerLocation.x, Config.DealerLocation.y, Config.DealerLocation.z - 1.0, 0.0, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

-- If using qb-target
exports['qb-target']:AddBoxZone("ovr_armsdealer", Config.DealerLocation, 1.5, 1.5, {
    name = "ovr_armsdealer",
    heading = 0,
    debugPoly = false,
    minZ = Config.DealerLocation.z - 1.5,
    maxZ = Config.DealerLocation.z + 1.0,
}, {
    options = {
        {
            type = "client",
            event = "ovr-armsdealer:openMenu",
            icon = "fas fa-gun",
            label = Config.TargetLabel
        }
    },
    distance = 2.0
})

RegisterNetEvent("ovr-armsdealer:openMenu", function()
    local options = {}
    for _, weapon in ipairs(Config.Weapons) do
        table.insert(options, {
            header = weapon.label .. " - $" .. weapon.price,
            txt = "Buy this weapon illegally",
            params = {
                event = "ovr-armsdealer:buyWeapon",
                args = {
                    weapon = weapon.name,
                    price = weapon.price
                }
            }
        })
    end
    table.insert(options, { header = "Close", txt = "", params = { event = "" } })
    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent("ovr-armsdealer:buyWeapon", function(data)
    TriggerServerEvent("ovr-armsdealer:giveWeapon", data.weapon, data.price)
end)
