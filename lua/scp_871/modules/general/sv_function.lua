local SPAWN_ATTEMPTS = 12

--[[
* Find a free position on the ground near the origin for the given cake.
* @Vector origin The position to spawn around.
* @Entity ent The cake to place.
* @return Vector|nil A free position, or nil if none was found.
--]]
function scp_871.FindSpawnPos(origin, ent)
    local mins, maxs = ent:OBBMins(), ent:OBBMaxs()
    local size = math.max(maxs.x - mins.x, maxs.y - mins.y)
    local lift = Vector(0, 0, maxs.z - mins.z)
    local cakes = ents.FindByClass("scp_871")

    local function IsFree(pos)
        local tr = util.TraceHull({
            start = pos + Vector(0, 0, 1),
            endpos = pos + Vector(0, 0, 1),
            mins = mins,
            maxs = maxs,
            filter = ent,
            mask = MASK_SOLID
        })
        return not tr.Hit
    end

    for i = 1, SPAWN_ATTEMPTS do
        local dir = Angle(0, math.Rand(0, 360), 0):Forward()
        local start = origin + lift
        local target = start + dir * size * math.Rand(1.1, 2)

        -- Make sure there is no wall between the original cake and the new spot
        local pathTr = util.TraceHull({
            start = start,
            endpos = target,
            mins = mins,
            maxs = maxs,
            filter = cakes,
            mask = MASK_SOLID
        })

        if not pathTr.Hit then
            -- Drop the new spot to the ground
            local groundTr = util.TraceHull({
                start = target,
                endpos = target - lift * 3,
                mins = mins,
                maxs = maxs,
                filter = cakes,
                mask = MASK_SOLID
            })

            if groundTr.Hit and not groundTr.StartSolid and IsFree(groundTr.HitPos) then
                return groundTr.HitPos
            end
        end
    end

    -- Last resort, the original spot (e.g. the cake has been eaten)
    if IsFree(origin) then return origin end
end

function scp_871.SpawnCake(pos)
    local totalCakes = #ents.FindByClass("scp_871")
    local limitCake = SCP_871_CONFIG.Settings.LimitCake
    if limitCake > 0 and totalCakes >= limitCake then return end

    local ent = ents.Create("scp_871")
    if not IsValid(ent) then return end

    -- Set the model first so the collision bounds are known
    ent:SetModel(SCP_871_CONFIG.Models.Cake)
    local newPos = scp_871.FindSpawnPos(pos, ent)
    if not newPos then
        ent:Remove()
        return
    end

    ent:SetPos(newPos)
    ent:Spawn()
    ent:Activate()
end

function scp_871.OnCakeEaten(ply)
    ply:SetVar("SCP-871:CanEat", false)
    timer.Create("SCP-871:CanEat-" .. ply:SteamID64(), SCP_871_CONFIG.Settings.DelayEat, 1, function()
        if IsValid(ply) then
            ply:SetVar("SCP-871:CanEat", true)
        end
    end)
end
