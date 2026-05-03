function scp_871.SpawnCake(pos)
    local totalCakes = #ents.FindByClass("scp_871")
    local limitCake = SCP_871_CONFIG.Settings.LimitCake
    if limitCake > 0 and totalCakes >= limitCake then return end

    local ent = ents.Create("scp_871")
    if not IsValid(ent) then return end

    -- TODO : En faire une convar ?
    local newPos = pos + Vector(math.random(-10, 10), math.random(-10, 10), 0)
    ent:SetPos(pos)
    ent:Spawn()
    ent:Activate()
end