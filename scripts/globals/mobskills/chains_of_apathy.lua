---------------------------------------------
-- Chains of Apathy
--
---------------------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
---------------------------------------------
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local targets = mob:getEnmityList();
    for i,v in pairs(targets) do
        if (v:isPC()) then
            local race = v:getRace()
            if (race == 1 or race == 2) and not v:hasKeyItem(LIGHT_OF_VAHZL) then
                mob:showText(mob, PROMATHIA_TEXT);
                return 0;
            end
        end
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_TERROR;
    local power = 30;
    local duration = 30;

    if target:isPC() and ((target:getRace() == 1 or target:getRace() == 2) and not target:hasKeyItem(LIGHT_OF_VAHZL)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
    else
        skill:setMsg(msgBasic.SKILL_NO_EFFECT);
    end
    return typeEffect;
end;
