function scp_871.SpawnCake(pos)
    local ent = ents.Create("scp_871")
    if not IsValid(ent) then return end

    -- TODO : En faire une convar ?
    local newPos = pos + Vector(math.random(-10, 10), math.random(-10, 10), 0)
    ent:SetPos(pos)
    ent:Spawn()
    ent:Activate()
end