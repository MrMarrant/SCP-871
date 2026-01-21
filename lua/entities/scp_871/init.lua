AddCSLuaFile("shared.lua")
include("shared.lua")

-- TODO : gérer s'il a été détruit -> alors le respawn direct
function ENT:Initialize()
	self:ManageModel()
	self:RebuildPhysics()
	SCP_871_CONFIG.Var.CountCake = SCP_871_CONFIG.Var.CountCake + 1
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

	self.WasEaten = true
	activator:EmitSound(SCP_871_CONFIG.Sounds.Eat)
	hook.Call("SCP-871:OnEatingCake", nil, self)
	self:Remove()
end

function ENT:OnRemove()
	if (not self.WasEaten) then
		SCP_871_CONFIG.Var.CountCake = SCP_871_CONFIG.Var.CountCake - 1
	end
end