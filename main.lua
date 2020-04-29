Concord    = require("lib.concord")
Components = Concord.components
Component  = Concord.component
Entity     = Concord.entity
System     = Concord.system
Systems    = {}
World      = Concord.world
Util = require("src.util")

Concord.utils.loadNamespace("src/components")
Concord.utils.loadNamespace("src/systems", Systems)

local gameWorld = World()
gameWorld:addSystems(
    Systems.invulnerableTimer,

    Systems.controller,
    Systems.patternExecutor,
    Systems.motion,
    Systems.bounds,
    Systems.collision,

    Systems.spawn,

    --Systems.debugRender
    Systems.render
)

Entity(gameWorld)
    :give("position", 0, 0)
    :give("velocity", 0, 0)
    :give("controllable")
    :give("collider", 2)
    :give("health")
    :give("renderable")

local parent = Entity(gameWorld)
:give("position", love.graphics.getWidth() / 2, 50)
:give("velocity", 0, 0)

Entity(gameWorld)
:give("position", 0, 0)
:give("velocity", 0, 0)
:give("renderable")
:give("sine", 2, love.graphics.getWidth() / 2)
:give("child", parent)
:give("spawner", function(e)
    local t = 0

    while (true) do
        t = t + love.timer.getDelta()

        if (t >= 0.1) then
            local o = Entity(gameWorld)
            :give("position", Util.getWorldX(e), Util.getWorldY(e))
            :give("velocity", 0, 70)
            :give("renderable")
            :give("spawner", function(o)
                local t2 = 0
                local explodeTime = love.math.random(20, 30) / 10

                while (true) do
                    t2 = t2 + love.timer.getDelta()

                    if (t2 >= explodeTime) then
                        for i = 1, 16 do
                            Entity(gameWorld)
                            :give("position", Util.getWorldX(o), Util.getWorldY(o))
                            :give("velocity", math.cos(math.pi * 2 / 8 * i) * 200, math.sin(math.pi * 2 / 8 * i) * 200)
                            :give("renderable")
                            :give("collider", 3)
                        end

                        o:destroy()
                    end

                    coroutine.yield()
                end
            end)


            t = 0
        end

        coroutine.yield()
    end
end)

local function drawDebugText()
    love.graphics.push("all")

    local str = ""

    str = str .. "FPS: " .. love.timer.getFPS() .. "\n"

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(str, 5, 5)

    love.graphics.pop()
end

function love.load()
    love.graphics.setBackgroundColor(0, 0, 0, 0)
end

function love.update(dt)
    gameWorld:emit("update", dt)

    if love.keyboard.isDown("p") then
        Entity(gameWorld)
        :give("position", love.math.random(0, love.graphics.getWidth()), love.math.random(0, love.graphics.getHeight()))
        :give("velocity", 0, 0)
        :give("collider", 50)
    end
end

function love.draw()
    gameWorld:emit("draw")

    drawDebugText()
end

