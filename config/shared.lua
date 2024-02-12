return {
    -- If you experience issues with your zones not working, please ensure the Z value of your vec3 points match. Using different heights may cause problems.
    ---@type ZoneOptions[]
    zones = {
        --[[
            These MUST be configured with your own location before using them. The current coordinates are set for MOLO MRPD and Benny's
            {
                freeRepair = {'police'},
                freeMods = {'police'},
                job = {'police'},
                hideBlip = true,
                blip = {
                    sprite = 72,
                    color = 38,
                    scale = 0.8,
                    label = 'Police Garage',
                }
                points = {
                    vec3(455.15, -991.55, 25.75),
                    vec3(444.83, -991.55, 25.75),
                    vec3(444.84, -1000.55, 25.75),
                    vec3(455.13, -1000.56, 25.75),
                }
            },
            {
                freeRepair = {'police'},
                freeMods = {'ambulance'},
                points = {
                    vec3(-344.36, -121.92, 38.60),
                    vec3(-319.43, -130.65, 38.60),
                    vec3(-324.77, -147.93, 38.60),
                    vec3(-348.59, -139.1, 38.60),
                }
            },
        ]]
        {
            job = {
                "bennys"
            },
            blip = {
                sprite = 446,
                color = 44,
                scale = 0.9,
                label = 'Benny\'s',
            },
            points = {
                vec3(-224.97, -1314.69, 30.89),
                vec3(-225.63, -1339.28, 30.89),
                vec3(-191.95, -1339.87, 30.89),
                vec3(-192.85, -1314.59, 30.89),
            }
        },
        {
            job = {
                "harmony"
            },
            blip = {
                label = "Harmony Repair",
                scale = 1.25,
                color = 6,
                sprite = 402,
            },
            points = {
                vec3(-1405.72, -445.51, 34.48),
                vec3(-1427.71, -460.16, 34.48),
                vec3(-1434.71, -449.5, 34.48),
                vec3(-1411.64, -435.57, 34.48),
            }
        },
        {
            job = {
                "harmony"
            },
            blip = {
                label = "Harmony Repair",
                scale = 1.0,
                color = 6,
                sprite = 402,
            },
            points = {
                vec3(1171.9, 2635.58, 37.77),
                vec3(1171.87, 2644.71, 37.77),
                vec3(1189.76, 2644.09, 37.77),
                vec3(1189.77, 2636.05, 37.77),
            }
        },
        {
            job = {
                "beekersgarage"
            },
            blip = {
                label = "Beekers Garage",
                scale = 1.0,
                color = 6,
                sprite = 402
            },
            points = {
                vec3(96.74, 6619.63, 31.79),
                vec3(102.72, 6613.48, 31.79),
                vec3(116.01, 6625.49, 31.79),
                vec3(109.59, 6632.11, 31.79),
            }
        },
        {
            job = {
                "lscustom"
            },
            blip = {
                label = "Los Santos Custom",
                scale = 0.75,
                color = 0,
                sprite = 72,
            },
            points = {
                vec3(-349.09, -139.0, 39),
                vec3(-342.89, -122.48, 39),
                vec3(-319.41, -130.88, 39),
                vec3(-324.7, -147.77, 39)
            }
        }
    },

    prices = {
        ['cosmetic'] = 500,
        ['colors'] = 1000,
        [11] = {0, 10000, 20000, 30000, 40000},     -- Engine
        [12] = {0, 2500, 5000, 7500},               -- Brakes
        [13] = {0, 5000, 10000, 15000, 20000},      -- Transmission
        [15] = {0, 3000, 6000, 9000, 12000, 15000}, -- Suspension
        [18] = 10000                                  -- Turbo
    }
}
