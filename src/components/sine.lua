return Component("sine", function(e, frequency, magnitude, component, field)
    e.frequency = frequency or 1
    e.magnitude = magnitude or 1
    e.component = component or "position"
    e.field = field or "x"
end)