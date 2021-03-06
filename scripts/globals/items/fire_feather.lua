-----------------------------------
-- ID: 5256
-- Item: Fire Feather
-- Status Effect: Enfire
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(tpz.effect.ENFIRE, 10, 0, 180) -- This is a guess, no potency or duration info is known
end

return item_object
