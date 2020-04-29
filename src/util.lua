local Util = {}

function Util.getWorldX(e)
    if (e.child) then
        return e.position.x + Util.getWorldX(e.child.parent)
    end

    return e.position.x
end

function Util.getWorldY(e)
    if (e.child) then
        return e.position.y + Util.getWorldY(e.child.parent)
    end

    return e.position.y
end

function Util.setWorldX(e, x)
    local wx = Util.getWorldX(e)
    e.position.x = x - wx
end

function Util.setWorldY(e, y)
    local wx = Util.getWorldY(e)
    e.position.y = y - wx
end

return Util