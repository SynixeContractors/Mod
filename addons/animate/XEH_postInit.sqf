#include "script_component.hpp"

// Clean up our own attached props when a unit is deleted (e.g. player disconnects).
// Only objects flagged with QGVAR(deleteWithUnit): ACE carrying/dragging and other mods attach things we must not delete.
["CAManBase", "Deleted", {
    params ["_unit"];
    {
        if (_x getVariable [QGVAR(deleteWithUnit), false]) then {
            deleteVehicle _x;
        };
    } forEach attachedObjects _unit;
}, true, []] call CBA_fnc_addClassEventHandler;
