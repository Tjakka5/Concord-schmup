local function none() end

return Component("spawner", function(e, waveFunction)
    e.waveFunction = waveFunction or none

    e.routine = nil
end)