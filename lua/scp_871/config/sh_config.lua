-- CONVAR
local delayRespawnCake 	= CreateConVar("scp_871_delay_respawn", "300", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Delay Before a cake respawn.")

-- NET VAR
SCP_871_CONFIG.NetVar = {}

-- Model Path
SCP_871_CONFIG.Models = {}
SCP_871_CONFIG.Models.Cake = Model("")

--Sound Path
SCP_871_CONFIG.Sounds = {}
SCP_871_CONFIG.Sounds.Eat = Sound("")

-- Settings
SCP_871_CONFIG.Settings = {}
SCP_871_CONFIG.Settings.DelayRespawn = delayRespawnCake:GetInt()

SCP_871_CONFIG.Var = {}
SCP_871_CONFIG.Var.CountCake = 0

-- AddChangeCallback
cvars.AddChangeCallback("scp_871_delay_respawn", function(convar_name, value_old, value_new)
    SCP_871_CONFIG.Settings.DelayRespawn = tonumber(value_new)
end)