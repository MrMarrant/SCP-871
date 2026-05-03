if (sam) then
    sam.command.set_category("SCP-871") -- any new command will be in that category unless the command uses :SetCategory function

    sam.command.new("scp_871_clear_respawn_cake")
        :SetPermission("superadmin", "admin") -- OR "superadmin" OR "user" OR remove the second argument for no default access OR just remove that line to make it for everyone!

        :Help("Clear all timers created related to SCP-871 in the event that it has been eaten or destroyed.")

        :OnExecute(function(calling_ply, collumns, rows)
            calling_ply:ConCommand("scp_871_clear_respawn_cake")

            sam.player.send_message(nil--[[will send to all player]], "{A} use scp_871_clear_respawn_cake command!", {
                A = calling_ply
            })
        end)
    :End()

    sam.command.new("scp_871_clear_all_cake")
        :SetPermission("superadmin", "admin") -- OR "superadmin" OR "user" OR remove the second argument for no default access OR just remove that line to make it for everyone!

        :Help("Clear all instances of SCP-871 and timers created related to SCP-871.")

        :OnExecute(function(calling_ply)
            calling_ply:ConCommand("scp_871_clear_all_cake")

            sam.player.send_message(nil--[[will send to all player]], "{A} use scp_871_clear_all_cake command!", {
                A = calling_ply
            })
        end)
    :End()
end