concommand.Add("scp_871_clear_respawn_cake", function(ply, cmd, args, argStr)
    if (ply:IsAdmin() or ply:IsSuperAdmin()) then
        PrintTable(SCP_871_CONFIG.Var.CurrentTimer)
        for key, value in pairs(SCP_871_CONFIG.Var.CurrentTimer) do
            timer.Remove("Timer-SCP-871:OnEatingCake-" .. key)
        end
        SCP_871_CONFIG.Var.CurrentTimer = {}
        ply:ChatPrint("All timers related to SCP-871 have been cleared.")
    else
        ply:ChatPrint("You need to be admin/superadmin for using this command.")
    end
end, nil, "Clear all timers created related to SCP-871 in the event that it has been eaten or destroyed.")

concommand.Add("scp_871_clear_all_cake", function(ply, cmd, args, argStr)
    if (ply:IsAdmin() or ply:IsSuperAdmin()) then
        for key, value in pairs(SCP_871_CONFIG.Var.CurrentTimer) do
            timer.Remove("Timer-SCP-871:OnEatingCake-" .. key)
        end
        for k, v in ipairs( ents.FindByClass( "scp_871" ) ) do
            v:Remove()
        end
        ply:ChatPrint("All cakes and timers related to SCP-871 have been cleared.")
    else
        ply:ChatPrint("You need to be admin/superadmin for using this command.")
    end
end, nil, "Clear all cakes and timers created related to SCP-871.")