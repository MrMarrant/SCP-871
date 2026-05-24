-- CONVAR
local delayRespawnCake 	= CreateConVar("scp_871_delay_respawn", "300", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Delay Before a cake respawn.")
local healthCake = CreateConVar("scp_871_cake_health", "10", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Health of the cake.")
local limitCake = CreateConVar("scp_871_limit", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Limit of cakes.")
local delayEat = CreateConVar("scp_871_delay_eat", "180", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Delay Before a player can eat another cake.")

-- NET VAR
SCP_871_CONFIG.NetVar = {}

-- Model Path
SCP_871_CONFIG.Models = {}
SCP_871_CONFIG.Models.Cake = Model("models/scp_871/scp_871.mdl")

--Sound Path
SCP_871_CONFIG.Sounds = {}
SCP_871_CONFIG.Sounds.Spawn = Sound("scp_871/spawn_cake.mp3")
SCP_871_CONFIG.Sounds.Explosion = Sound("scp_871/explosion_cake.mp3")

SCP_871_CONFIG.Sounds.Eat = {}
SCP_871_CONFIG.Sounds.Eat[1] = Sound("scp_871/eat_01.mp3")
SCP_871_CONFIG.Sounds.Eat[2] = Sound("scp_871/eat_02.mp3")
SCP_871_CONFIG.Sounds.Eat[3] = Sound("scp_871/eat_03.mp3")
SCP_871_CONFIG.Sounds.Eat[4] = Sound("scp_871/eat_04.mp3")

-- Settings
SCP_871_CONFIG.Settings = {}
SCP_871_CONFIG.Settings.DelayRespawn = delayRespawnCake:GetInt()
SCP_871_CONFIG.Settings.HealthCake = healthCake:GetInt()
SCP_871_CONFIG.Settings.LimitCake = limitCake:GetInt()
SCP_871_CONFIG.Settings.DelayEat = delayEat:GetInt()
SCP_871_CONFIG.Var = {}
SCP_871_CONFIG.Var.CountCake = 0
SCP_871_CONFIG.Var.CurrentTimer = {}

-- AddChangeCallback
cvars.AddChangeCallback("scp_871_delay_respawn", function(convar_name, value_old, value_new)
    SCP_871_CONFIG.Settings.DelayRespawn = tonumber(value_new)
end)
cvars.AddChangeCallback("scp_871_cake_health", function(convar_name, value_old, value_new)
    SCP_871_CONFIG.Settings.HealthCake = tonumber(value_new)
end)
cvars.AddChangeCallback("scp_871_limit", function(convar_name, value_old, value_new)
    SCP_871_CONFIG.Settings.LimitCake = tonumber(value_new)
end)
cvars.AddChangeCallback("scp_871_delay_eat", function(convar_name, value_old, value_new)
    SCP_871_CONFIG.Settings.DelayEat = tonumber(value_new)
end)