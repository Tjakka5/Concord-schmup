local InvulnerableTimer = System({
    pool = {"invulnerable"},
})

function InvulnerableTimer:update(dt)
    for _, e in ipairs(self.pool) do
        e.invulnerable.timeLeft = e.invulnerable.timeLeft - dt

        if (e.invulnerable.timeLeft <= 0) then
            e:remove("invulnerable")
        end
    end
end

return InvulnerableTimer