-----------------------------------
-- ID: 4544
-- Item: mushroom_stew
-- Food Effect: 3hours, All Races
-----------------------------------
-- Magic Points 40
-- Strength -1
-- Mind 4
-- MP Recovered While Healing 4
-- Enmity -4
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 4544)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(tpz.mod.MP, 40)
    target:addMod(tpz.mod.STR, -1)
    target:addMod(tpz.mod.MND, 4)
    target:addMod(tpz.mod.MPHEAL, 4)
    target:addMod(tpz.mod.ENMITY, -4)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(tpz.mod.MP, 40)
    target:delMod(tpz.mod.STR, -1)
    target:delMod(tpz.mod.MND, 4)
    target:delMod(tpz.mod.MPHEAL, 4)
    target:delMod(tpz.mod.ENMITY, -4)
end

return item_object
