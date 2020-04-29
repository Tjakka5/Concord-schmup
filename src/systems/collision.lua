local Collision = System({
    collideable = {"position", "collider", "health"},
    colliders = {"position", "collider"},
})

function Collision:update(_)
    for _, e in ipairs(self.collideable) do
        if (not e.invulnerable) then
            for _, o in ipairs(self.colliders) do
                if (e ~= o) then
                    local dx = Util.getWorldX(e) - Util.getWorldX(o)
                    local dy = Util.getWorldY(e) - Util.getWorldY(o)

                    local dist = math.sqrt(dx * dx + dy * dy)

                    if (dist <= e.collider.size + o.collider.size) then
                        e.health.currentHealth = e.health.currentHealth - 1
                        print("Oof ouch Ive been hit")

                        if (e.health.currentHealth <= 0) then
                            e:destroy()
                        else
                            e:give("invulnerable")
                        end

                        break
                    end
                end
            end
        end
    end
end


return Collision