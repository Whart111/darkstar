---------------------------------------------
--  Call of the Grave
--
--  Description: Lowers INT of targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_INT_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_FIRE);
	if(resist > 0.2) then
		target:delStatusEffect(typeEffect);
		skill:setMsg(MSG_ENFEEB_IS);
		target:addStatusEffect(typeEffect,10,0,120*resist);--power=50;tic=0;duration=180;
	else
		skill:setMsg(MSG_MISS);
	end
	return typeEffect;
end;
