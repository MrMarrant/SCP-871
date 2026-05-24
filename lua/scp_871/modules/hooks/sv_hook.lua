hook.Add("SCP-871:OnEatingCake", "SCP-871:OnEatingCake-RespawnCake", function(cake)
    local cakePos = cake:GetPos()
    local cakeEntIndex = cake:EntIndex()
    SCP_871_CONFIG.Var.CurrentTimer[cakeEntIndex] = true
    timer.Create("Timer-SCP-871:OnEatingCake-" .. cakeEntIndex, SCP_871_CONFIG.Settings.DelayRespawn + math.random(0, 2), 1, function()
        SCP_871_CONFIG.Var.CurrentTimer[cakeEntIndex] = nil
        scp_871.SpawnCake(cakePos)
    end)
end)

hook.Add("PlayerDeath", "SCP-871:PlayerDeath-ResetEat", function(victim, inflictor, attacker)
    if not IsValid(victim) or not victim:IsPlayer() then return end

    victim:SetVar("SCP-871:CanEat", true)
    timer.Remove("SCP-871:CanEat-" .. victim:SteamID64())
end)

hook.Add( "PlayerChangedTeam", "SCP-871:PlayerChangedTeam", function( ply, oldTeam, newTeam )
    if not IsValid(ply) or not ply:IsPlayer() then return end

    ply:SetVar("SCP-871:CanEat", true)
    timer.Remove("SCP-871:CanEat-" .. ply:SteamID64())
end )

hook.Add( "PlayerInitialSpawn", "SCP-871:PlayerInitialSpawn", function( ply )
    if not IsValid(ply) or not ply:IsPlayer() then return end

    ply:SetVar("SCP-871:CanEat", true)
end)