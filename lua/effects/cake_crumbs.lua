EFFECT.Mat = Material("particle/particle_smokegrenade")

function EFFECT:Init(data)

    local pos = data:GetOrigin()
    local emitter = ParticleEmitter(pos)

    if not emitter then return end

    for i = 1, 35 do

        local particle = emitter:Add(self.Mat, pos)

        if particle then

            local vel = VectorRand() * math.Rand(40,120)

            particle:SetVelocity(vel)

            particle:SetLifeTime(0)
            particle:SetDieTime(math.Rand(1.2,2.5))

            particle:SetColor(70, 40, 20)

            particle:SetStartSize(math.Rand(2,4))
            particle:SetEndSize(0)

            particle:SetGravity(Vector(0,0,-200))

            particle:SetRoll(math.Rand(0,360))
            particle:SetRollDelta(math.Rand(-5,5))

            particle:SetAirResistance(50)

            particle:SetCollide(true)
            particle:SetBounce(0.3)

        end
    end

    emitter:Finish()
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end
