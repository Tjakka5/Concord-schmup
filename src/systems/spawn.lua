local Spawn = System({
    pool = {"position", "spawner"}
})

function Spawn:update(dt)
    for _, e in ipairs(self.pool) do
        if (not e.spawner.routine) then
            e.spawner.routine = coroutine.create(e.spawner.waveFunction)
        else
            if (coroutine.status(e.spawner.routine) ~= "dead") then
                coroutine.resume(e.spawner.routine, e)
            end
        end
    end
end

return Spawn