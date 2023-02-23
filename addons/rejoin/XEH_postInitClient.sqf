#include "script_component.hpp"

[{!isNull player}, {
    if (GVAR(enabled)) then {
        [QGVAR(teleportRequest), [player]] call CBA_fnc_serverEvent;
    };
}] call CBA_fnc_waitUntilAndExecute;

// `vehicle _unit` in the disconnect handler was always the player
["vehicle", {
    params ["_unit", "_newVehicle", "_oldVehicle"];
    _unit setVariable [QGVAR(currentVehicle), _newVehicle, true];
}, true] call CBA_fnc_addPlayerEventHandler;

[QGVAR(teleportResponse), {
    params ["_position", "_vehicleInfo"];
    player setPos _position;
    if (_vehicleInfo isNotEqualTo []) then {
        _vehicleInfo params ["_vehicle", "_role"];
        if (!alive _vehicle) exitWith {};
        if (count _role == 2) exitWith {
            _vehicle moveInCargo [_vehicle, _role select 1];
        };
        switch (_role) do {
            case "commander": {
                if (commander _vehicle isEqualTo objNull) then {
                    player moveInCommander _vehicle;
                } else {
                    player moveInAny _vehicle;
                };
            };
            case "gunner": {
                if (gunner _vehicle isEqualTo objNull) then {
                    player moveInGunner _vehicle;
                } else {
                    player moveInAny _vehicle;
                };
            };
            case "driver": {
                if (driver _vehicle isEqualTo objNull) then {
                    player moveInDriver _vehicle;
                } else {
                    player moveInAny _vehicle;
                };
            };
            default {
                player moveInAny _vehicle;
            };
        };
    };
}] call CBA_fnc_addEventHandler;
