ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Author = "MrMarrant"
ENT.PrintName = "SCP-871"
ENT.Spawnable = true
ENT.Category = "SCP"
ENT.RenderGroup = RENDERGROUP_BOTH

-- Duration of the fade in when a cake spawn
ENT.FadeDuration = 0.25

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "SpawnTime")
end

if CLIENT then
	function ENT:GetFadeAlpha()
		return math.Clamp((CurTime() - self:GetSpawnTime()) / self.FadeDuration, 0, 1)
	end

	-- Opaque pass, once the fade is over
	function ENT:Draw()
		if self:GetFadeAlpha() < 1 then return end
		self:DrawModel()
	end

	-- Translucent pass, during the fade
	function ENT:DrawTranslucent()
		local alpha = self:GetFadeAlpha()
		if alpha >= 1 then return end

		render.SetBlend(alpha)
		self:DrawModel()
		render.SetBlend(1)
	end
end
