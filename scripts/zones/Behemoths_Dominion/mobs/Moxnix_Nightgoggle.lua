-----------------------------------
-- Area: Behemoth's Dominion
--   NM: Moxnix Nightgoggle
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if player:getQuestStatus(tpz.quest.log_id.BASTOK, tpz.quest.id.bastok.THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED then
        player:addCharVar("theTalekeepersGiftKilledNM", 1)
    end
end

return entity
