#include "script_component.hpp"

GVAR(saved) = createHashMap;

[QGVAR(save), {
    params ["_unit", "_data"];
    GVAR(saved) set [getPlayerUID _unit, _data];
}] call CBA_fnc_addEventHandler;

[QGVAR(load), {
    params ["_unit"];
    private _data = GVAR(saved) get [getPlayerUID _unit, []];
    if (_data isEqualTo []) exitWith {};
    [QGVAR(loaded), _data, _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
