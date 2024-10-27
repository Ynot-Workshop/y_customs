local zoneId
local allowAccess = false
local sharedConfig = require 'config.shared'
local openMenu = require('client.menus.main')

--- Check if the player has access to the zone based on their job and optionally vehicle class and model
--- @param zone ZoneOptions
---@param checkVehicle boolean
---@return boolean
local function checkAccess(zone, checkVehicle)
    while not cache.vehicle do
        Wait(50)
    end

    if checkVehicle then
        local vehicleClass = GetVehicleClass(cache.vehicle)

        if (zone.deniedClasses and zone.deniedClasses[vehicleClass]) or (zone.allowedClasses and not zone.allowedClasses[vehicleClass]) or (zone.modelBlacklist and zone.modelBlacklist[GetEntityModel(cache.vehicle)]) then
            return false
        end
    end

    if zone.job and QBX?.PlayerData then
        local playerJob = QBX.PlayerData.job.name
        for i = 1, #zone.job do
            if playerJob == zone.job[i] then
                return true
            end
        end
    end

    if zone.jobTypes and QBX?.PlayerData then
        local playerJobType = QBX.PlayerData.job.type
        for i = 1, #zone.jobTypes do
            if playerJobType == zone.jobTypes[i] then
                return true
            end
        end
    end

    return not zone.job
end

---@param vertices vector3[]
---@return vector3
local function calculatePolyzoneCenter(vertices)
    local xSum = 0
    local ySum = 0
    local zSum = 0

    for i = 1, #vertices do
        xSum = xSum + vertices[i].x
        ySum = ySum + vertices[i].y
        zSum = zSum + vertices[i].z
    end

    local center = vec3(xSum / #vertices, ySum / #vertices, zSum / #vertices)

    return center
end

CreateThread(function()
    for _, v in ipairs(sharedConfig.zones) do
        lib.zones.poly({
            points = v.points,
            onEnter = function(s)
                zoneId = s.id
                if not cache.seat == -1 then return end
                allowAccess = checkAccess(v, true)

                if not allowAccess then
                    return
                end

                lib.showTextUI(locale('textUI.tune'), {
                    icon = 'fa-solid fa-car',
                    position = 'left-center',
                })
            end,
            onExit = function()
                zoneId = nil
                lib.hideTextUI()
            end,
            inside = function()
                if cache.seat == -1 and allowAccess then
                    if not lib.isTextUIOpen() then
                        lib.showTextUI(locale('textUI.tune'), {
                            icon = 'fa-solid fa-car',
                            position = 'left-center',
                        })
                    end
                    if IsControlJustPressed(0, 38) then
                        SetEntityVelocity(cache.vehicle, 0.0, 0.0, 0.0)
                        openMenu()
                    end
                end
            end,
        })

        if not v.blip.hide and v.blip and (not v.blip.checkAccess or checkAccess(v, false)) then
            local center = calculatePolyzoneCenter(v.points)
            local blip = AddBlipForCoord(center.x, center.y, center.z)
            SetBlipSprite(blip, v.blip.sprite or 72)
            SetBlipColour(blip, v.blip.color or 4)
            SetBlipScale(blip, v.blip.scale or 0.8)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(v.blip.label or 'Customs')
            EndTextCommandSetBlipName(blip)
        end
    end
end)

lib.callback.register('qbx_customs:client:zone', function()
    return zoneId
end)

lib.onCache('vehicle', function(vehicle)
    if not zoneId then return end
    if cache.vehicle and not vehicle then
        lib.hideTextUI()
        allowAccess = false
        return
    end
    allowAccess = checkAccess(sharedConfig.zones[zoneId], true)
    checkAccess()
end)