local DebugRender = System({
    pool = {"position"}
})
DebugRender.velocityMultiplier = 0.1

function DebugRender:draw()
    love.graphics.push("all")

    for _, e in ipairs(self.pool) do
        local x = Util.getWorldX(e)
        local y = Util.getWorldY(e)

        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.circle("fill", x, y, 6)

        if (e.collider) then
            love.graphics.setColor(0, 0, 1, 1)
            love.graphics.circle("line", x, y, e.collider.size)
        end

        if (e.velocity) then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.line(
                x,
                y,
                x + e.velocity.vx * self.velocityMultiplier,
                y + e.velocity.vy * self.velocityMultiplier
            )
        end
    end

    love.graphics.pop()
end

return DebugRender