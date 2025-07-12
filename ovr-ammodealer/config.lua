Config = {}

Config.DealerLocation = vector3(1260.99, -1071.61, 38.73) -- Change to your desired coords
Config.DealerPed = 'g_m_y_mexgoon_01' -- Ped model
Config.TargetLabel = 'Illegal Ammo Dealer'

-- Weapons available
Config.Weapons = {
    { name = 'smg_ammo', label = 'SMG Ammo', price = 200 },
    { name = 'rifle_ammo', label = 'Rifle Ammo', price = 800 },
    { name = 'shotgun_ammo', label = 'Shotgun Ammo', price = 1000 }
}
