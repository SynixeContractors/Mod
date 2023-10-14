#include "script_component.hpp"

[QGVAR(disable), {
    if !(GVAR(allowed)) exitWith {};
    missionNamespace setVariable [QGVAR(allowed), false, true];
    [QGVAR(prohibit)] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(enable), {
    if (GVAR(allowed)) exitWith {};
    missionNamespace setVariable [QGVAR(allowed), true, true];
    [QGVAR(allow)] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

call FUNC(initAuto);
