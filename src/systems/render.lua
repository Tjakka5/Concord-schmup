local Render = System({
    pool = {"position", "renderable"}
})

function Render:draw()
    love.graphics.push("all")

    for _, e in ipairs(self.pool) do
        local x = Util.getWorldX(e)
        local y = Util.getWorldY(e)

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.circle("fill", x, y, 6)
    end

    love.graphics.pop()
end

return Render