-----------------------------------------
-- Spell: Actinic Burst
-- Greatly lowers the accuracy of enemies within range for a brief period of time
-- Spell cost: 24 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+20
-- Level: 74
-- Casting Time: 0.5 seconds
-- Recast Time: 60 seconds
-- Effect Time: About 15 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    -- Pull base stats.
    local dINT = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    local resist = applyResistance(caster,spell,target,dINT,DIVINE_MAGIC_SKILL, 150);
    local duration = 20 * resist;

    if(resist > 0.0625) then
        if(target:addStatusEffect(EFFECT_FLASH,200,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end
    return EFFECT_FLASH;
end;