local Controller = System({
    pool = {"position", "controllable"}
})
Controller.movementSpeed = 1000

function Controller:update(dt)
    local ix = (love.keyboard.isDown("a") and -1 or 0) + (love.keyboard.isDown("d") and 1 or 0)
    local iy = (love.keyboard.isDown("w") and -1 or 0) + (love.keyboard.isDown("s") and 1 or 0)

    local mx = self.movementSpeed * ix
    local my = self.movementSpeed * iy

    for _, e in ipairs(self.pool) do
        e.velocity.vx = e.velocity.vx * 0.92
        e.velocity.vy = e.velocity.vy * 0.92

        e.velocity.vx = e.velocity.vx + mx * dt
        e.velocity.vy = e.velocity.vy + my * dt

        
    end
end

return Controller