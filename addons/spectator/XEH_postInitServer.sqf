#include "script_component.hpp"

[QGVAR(disable), {
    if !(GVAR(allowed)) exitWith {};
    // Not global because the event will set it
    missionNamespace setVariable [QGVAR(allowed), false];
    [QGVAR(prohibit)] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(enable), {
    if (GVAR(allowed)) exitWith {};
    // Not global because the event will set it
    missionNamespace setVariable [QGVAR(allowed), true];
    [QGVAR(allow)] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

call FUNC(initAuto);
