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
    params ["_position", "_vehicleInfo", ["_medical", ""]];
    player setPos _position;
    INFO_2("Rejoin: Position %1, VehicleInfo %2",_position,_vehicleInfo);
    // Must run where the unit is local; ACE waits for medical init itself if needed
    if (_medical isNotEqualTo "" && {!isNil "ace_medical_fnc_deserializeState"}) then {
        [player, _medical] call ace_medical_fnc_deserializeState;
    };
    if (_vehicleInfo isEqualTo []) exitWith {};
    _vehicleInfo params ["_vehicle", "_role"];
    if (!alive _vehicle) exitWith {};
    _role params ["_seat", ["_index", -1]];
    switch (_seat) do {
        case "commander": {
            if (isNull commander _vehicle) then {
                player moveInCommander _vehicle;
            } else {
                player moveInAny _vehicle;
            };
        };
        case "gunner": {
            if (isNull gunner _vehicle) then {
                player moveInGunner _vehicle;
            } else {
                player moveInAny _vehicle;
            };
        };
        case "driver": {
            if (isNull driver _vehicle) then {
                player moveInDriver _vehicle;
            } else {
                player moveInAny _vehicle;
            };
        };
        case "cargo": {
            private _free = (fullCrew [_vehicle, "cargo", true]) findIf {
                _x#2 == _index && {isNull (_x#0)}
            } != -1;
            if (_free) then {
                player moveInCargo [_vehicle, _index];
            } else {
                player moveInAny _vehicle;
            };
        };
        case "turret": {
            if (_index isNotEqualTo [] && {isNull (_vehicle turretUnit _index)}) then {
                player moveInTurret [_vehicle, _index];
            } else {
                player moveInAny _vehicle;
            };
        };
        default {
            player moveInAny _vehicle;
        };
    };
}] call CBA_fnc_addEventHandler;
