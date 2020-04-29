return Component("health", function(e, maxHealth, currentHealth)
    e.maxHealth = maxHealth or 3
    e.currentHealth = currentHealth or e.maxHealth
end)