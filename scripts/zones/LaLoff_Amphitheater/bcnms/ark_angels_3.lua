-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels 3 (Mithra)
-----------------------------------
local ID = require("scripts/zones/LaLoff_Amphitheater/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.ARK_ANGELS)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 180, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002, 0, 0, 0, 0, 0, battlefield:getArea(), 180)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(ZILART) == tpz.mission.id.zilart.ARK_ANGELS and player:getCharVar("ZilartStatus") == 1 then
            player:addKeyItem(tpz.ki.SHARD_OF_ENVY)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.SHARD_OF_ENVY)
            if
                player:hasKeyItem(tpz.ki.SHARD_OF_APATHY) and
                player:hasKeyItem(tpz.ki.SHARD_OF_ARROGANCE) and
                player:hasKeyItem(tpz.ki.SHARD_OF_COWARDICE) and
                player:hasKeyItem(tpz.ki.SHARD_OF_ENVY) and
                player:hasKeyItem(tpz.ki.SHARD_OF_RAGE)
            then
                player:completeMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.ARK_ANGELS)
                player:addMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.THE_SEALED_SHRINE)
                player:setCharVar("ZilartStatus", 0)
            end
        end
    end
end

return battlefield_object
