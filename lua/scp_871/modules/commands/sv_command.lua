concommand.Add("scp_871_clear_respawn_cake", function(ply, cmd, args, argStr)
    if (ply:IsAdmin() or ply:IsSuperAdmin()) then
        PrintTable(SCP_871_CONFIG.Var.CurrentTimer)
        for key, value in pairs(SCP_871_CONFIG.Var.CurrentTimer) do
            timer.Remove("Timer-SCP-871:OnEatingCake-" .. key)
        end
        SCP_871_CONFIG.Var.CurrentTimer = {}
    else
        ply:ChatPrint("You need to be admin/superadmin for using this command.")
    end
end, nil, "Clear all timers created related to SCP-871 in the event that it has been eaten or destroyed.")