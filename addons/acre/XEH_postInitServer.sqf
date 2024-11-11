#include "script_component.hpp"

GVAR(saved) = createHashMap;

[QGVAR(save), {
    params ["_unit", "_data"];
    GVAR(saved) set [getPlayerUID _unit, _data];
}] call CBA_fnc_addEventHandler;

[QGVAR(load), {
    params ["_unit"];
    [QGVAR(loaded), GVAR(saved) get [getPlayerUID _unit, []], _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
