---------------------------------------------
--  Wild Oats
--
--  Description: Additional effect: Vitality Down. Duration of effect varies on TP.
--  Type: Physical (Piercing)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_VIT_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
	if(resist > 0.2) then
		message = MSG_ENFEEB_IS;
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,10,0,120*resist);--power=50;tic=0;duration=120;
	end
	skill:setMsg(message);
	return typeEffect;
end;