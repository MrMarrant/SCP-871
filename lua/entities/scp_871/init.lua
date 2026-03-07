AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:ManageModel()
	self:RebuildPhysics()
	self:SetHealth( SCP_871_CONFIG.Settings.HealthCake )
	self:SetMaxHealth( SCP_871_CONFIG.Settings.HealthCake )
	SCP_871_CONFIG.Var.CountCake = SCP_871_CONFIG.Var.CountCake + 1
	self:StartDuplication()
	self:EmitSound(SCP_871_CONFIG.Sounds.Spawn, 75, math.random(95, 105), 1, CHAN_AUTO)
end

function ENT:ManageModel()
	self:SetModel(SCP_871_CONFIG.Models.Cake)
	self:SetModelScale(math.random(0.8, 1.5))
	local bg_01 = math.random(0, 1)
	local bg_02 = math.random(0, 1)
	self:SetBodyGroups("0" .. bg_01 .. bg_02)
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

		local eatSounds = SCP_871_CONFIG.Sounds.Eat
		activator:EmitSound(eatSounds[math.random(#eatSounds)])
		self:DestroyOrEaten()
end

function ENT:OnRemove()
	SCP_871_CONFIG.Var.CountCake = SCP_871_CONFIG.Var.CountCake - 1
	timer.Remove("SCP-871:StartDuplication-" .. self:EntIndex())
	local effectdata = EffectData()
	effectdata:SetOrigin( self:GetPos() )
	util.Effect( "cake_crumbs", effectdata )
end

function ENT:OnTakeDamage( dmginfo )
	local DmgReceive = dmginfo:GetDamage()
	self:SetHealth(math.Clamp(0, self:Health() - DmgReceive, self:GetMaxHealth()))
	if (self:Health() <= 0) then
		self:EmitSound(SCP_871_CONFIG.Sounds.Explosion, 100, math.random(95, 105), 1, CHAN_AUTO)
		self:DestroyOrEaten()
	end
end

function ENT:DestroyOrEaten()
	util.Decal( "BirdPoop", self:GetPos() - Vector(0, 0, 1), self:GetPos() + Vector(0, 0, 1), self )
	hook.Call("SCP-871:OnEatingCake", nil, self)
	self:Remove()
end

function ENT:StartDuplication()
	timer.Create("SCP-871:StartDuplication-" .. self:EntIndex(), SCP_871_CONFIG.Settings.DelayRespawn + math.random(0, 2), 0, function()
		if (IsValid(self)) then
			scp_871.SpawnCake(self:GetPos())
		end
	end)
end