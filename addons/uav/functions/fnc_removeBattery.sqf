#include "..\script_component.hpp"

params ["_unit", "_drone"];

scopeName "main";

{
    if (_x canAdd QGVAR(battery)) exitWith {
        _x addMagazineAmmoCargo [QGVAR(battery), 1, round ((fuel _drone) * 100)];
        breakTo "main";
    };
} forEach [
    vestContainer _unit,
    uniformContainer _unit,
    backpackContainer _unit
];

[_drone, 0] remoteExec ["setFuel", _drone];
[_unit, "MedicOther"] call ace_common_fnc_doGesture;
