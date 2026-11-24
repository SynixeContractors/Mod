#include "script_component.hpp"

GVAR(serverSaved) = createHashMap;

[QGVAR(save), {
    params ["_unit", "_data"];
    GVAR(serverSaved) set [getPlayerUID _unit, _data];
}] call CBA_fnc_addEventHandler;

[QGVAR(load), {
    params ["_unit"];
    private _data = GVAR(serverSaved) getOrDefault [getPlayerUID _unit, []];
    // Always answer, the client waits for this before it starts saving
    [QGVAR(loaded), [_data], _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
