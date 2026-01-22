AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:ManageModel()
	self:RebuildPhysics()
	self:SetHealth( 10 )
	SCP_871_CONFIG.Var.CountCake = SCP_871_CONFIG.Var.CountCake + 1
	self:StartDuplication()
end

-- TODO : Gérer les anomalies (mettre des bodygroup ?)
function ENT:ManageModel()
	self:SetModel(SCP_871_CONFIG.Models.Cake)
	self:SetModelScale(math.random(0.3, 2))
end

-- Initialise the physic of the entity
function ENT:RebuildPhysics()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:PhysWake()
end

function ENT:Use(activator, caller)
	if not IsValid(activator) or not activator:IsPlayer() then return end

	activator:EmitSound(SCP_871_CONFIG.Sounds.Eat)
	self:DestroyOrEaten()
end

function ENT:OnRemove()
	SCP_871_CONFIG.Var.CountCake = SCP_871_CONFIG.Var.CountCake - 1
	timer.Remove("SCP-871:StartDuplication-" .. self:EntIndex())
end

function ENT:OnTakeDamage( dmginfo )
	local DmgReceive = dmginfo:GetDamage()
	-- TODO : vérifier si l'entité perd des hp
	self:SetHealth(math.Clamp(0, self:Health() - DmgReceive))
	if (self:Health() <= 0) then
		self:DestroyOrEaten()
	end
end

function ENT:DestroyOrEaten()
	hook.Call("SCP-871:OnEatingCake", nil, self)
	self:Remove()
end

function ENT:StartDuplication()
	timer.Create("SCP-871:StartDuplication-" .. self:EntIndex(), SCP_871_CONFIG.Settings.DelayRespawn, 0, function()
		if (IsValid(self)) then
			scp_871.SpawnCake(self:GetPos())
		end
	end)
end