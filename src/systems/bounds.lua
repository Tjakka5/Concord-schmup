local Bounds = System({
    pool = {"position", "velocity"},
})
Bounds.coefficient = 0.4
Bounds.width = love.graphics.getWidth()

function Bounds:update(_)
    for _, e in ipairs(self.pool) do
        local x = Util.getWorldX(e)

        if (x < 0) then
            Util.setWorldX(e, 0)
            e.velocity.vx = e.velocity.vx * -self.coefficient
        end

        if (x > self.width) then
            Util.setWorldX(e, self.width)
            e.velocity.vx = e.velocity.vx * -self.coefficient
        end
    end
end

function Bounds:resize(w, _)
    self.width = w
end

return Bounds