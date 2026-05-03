-- SCP-871 Commands

-- Clear all timers related to SCP-871 Command
function ulx.scp_871_clear_respawn_cake( calling_ply )
    calling_ply:ConCommand("scp_871_clear_respawn_cake")
    ulx.fancyLogAdmin( calling_ply, "#A  use scp_871_clear_respawn_cake command!" )
end
local scp_871_clear_respawn_cake = ulx.command( "SCP-871", "ulx scp_871_clear_respawn_cake", ulx.scp_871_clear_respawn_cake, "!scp_871_clear_respawn_cake" )
scp_871_clear_respawn_cake:defaultAccess( ULib.ACCESS_ADMIN )
scp_871_clear_respawn_cake:help( "Clear all timers created related to SCP-871 in the event that it has been eaten or destroyed." )

-- Clear all cakes and timers related to SCP-871 Command
function ulx.scp_871_clear_all_cake( calling_ply )
    calling_ply:ConCommand("scp_871_clear_all_cake")
    ulx.fancyLogAdmin( calling_ply, "#A  use scp_871_clear_all_cake command!" )
end
local scp_871_clear_all_cake = ulx.command( "SCP-871", "ulx scp_871_clear_all_cake", ulx.scp_871_clear_all_cake, "!scp_871_clear_all_cake" )
scp_871_clear_all_cake:defaultAccess( ULib.ACCESS_ADMIN )
scp_871_clear_all_cake:help( "Clear all instances of SCP-871 and timers created related to SCP-871." )