#include "..\script_component.hpp"

params ["_unit", "_params"];
_params params ["_container", "_count", "_case"];

private _drone = getText (configFile >> "CfgMagazines" >> _case >> QGVAR(drone));
if (_drone isEqualTo "") exitWith {};

[_unit, "MedicOther"] call ace_common_fnc_doGesture;
[
    5,
    [_unit, _container, _drone, _case, _count],
    {
        (_this select 0) params ["_unit","_container","_drone","_case","_count"];
        if (local _unit) then {
            _container addMagazineAmmoCargo [_case, -1, _count];
            private _pos = _unit modelToWorld [0,1,0];
            private _drone = _drone createVehicle _pos;
            createVehicleCrew _drone;
            _drone setPos _pos;
            [_drone, _count / 100] remoteExec ["setFuel", _drone];
        };
        [_unit, 'PutDown'] call ace_common_fnc_doGesture;
    },
    {},
    format ["Assembling %1", getText (configFile >> "CfgVehicles" >> _drone >> "displayName")]
] call ace_common_fnc_progressBar;
