local PatternExecutor = System({
    sine = {"position", "sine"},
})

function PatternExecutor:update()
    local t = love.timer.getTime()

    for _, e in ipairs(self.sine) do
        e[e.sine.component][e.sine.field] = math.sin(t * e.sine.frequency) * e.sine.magnitude
    end
end

return PatternExecutor