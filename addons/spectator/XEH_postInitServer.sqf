#include "script_component.hpp"

[QGVAR(disable), {
    if !(GVAR(allowed)) exitWith {};
    [QGVAR(prohibit)] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(enable), {
    if (GVAR(allowed)) exitWith {};
    [QGVAR(allow)] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

call FUNC(initAuto);
