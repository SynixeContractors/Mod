#include "script_component.hpp"

GVAR(blur) = ppEffectCreate ["DynamicBlur", 600];
GVAR(blur) ppEffectEnable true;
GVAR(blurStrength) = 0;

GVAR(blurDampening) = 1.5;

[{
    if (GVAR(blurStrength) > 1.5) then {
        GVAR(blurStrength) = 1.5;
    };
    GVAR(blur) ppEffectAdjust [GVAR(blurStrength)];
    GVAR(blur) ppEffectCommit 0;
    GVAR(blurStrength) = GVAR(blurStrength) - (GVAR(blurDampening) * GVAR(blurStrength) * diag_deltaTime);
    if (GVAR(blurStrength) < 0.05) then {
        GVAR(blurStrength) = 0;
    };
}] call CBA_fnc_addPerFrameHandler;

enableCamShake true;
{
    [_x, "Killed", {call FUNC(shake)}] call CBA_fnc_addClassEventHandler;
} forEach ["Car", "Tank"];
