hook.Add("SCP-871:OnEatingCake", "SCP-871:OnEatingCake-RespawnCake", function(cake)
    local cakePos = cake:GetPos()
    local cakeEntIndex = cake:EntIndex()
    SCP_871_CONFIG.Var.CurrentTimer[cakeEntIndex] = true
    timer.Create("Timer-SCP-871:OnEatingCake-" .. cakeEntIndex, SCP_871_CONFIG.Settings.DelayRespawn + math.random(0, 2), 1, function()
        SCP_871_CONFIG.Var.CurrentTimer[cakeEntIndex] = nil
        scp_871.SpawnCake(cakePos)
    end)
end)