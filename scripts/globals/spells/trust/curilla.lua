-----------------------------------------
-- Trust: Curilla
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    -- TODO: Spells table /cry
    local FLASH  = 112

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH,
                        ai.r.MA, ai.s.SPECIFIC, FLASH)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75,
                        ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 1000,
                        ai.r.WS, ai.s.SPECIFIC, tpz.ws.RED_LOTUS_BLADE)
end
