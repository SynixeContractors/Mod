#include "script_component.hpp"

GVAR(positions) = createHashMap;

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    if (_unit isKindOf "HeadlessClient_F") exitWith {};
    if (!alive _unit) exitWith {};
    private _vehicleInfo = [];
    private _vehicle = _unit getVariable [QGVAR(currentVehicle), vehicle _unit];
    if (_vehicle isNotEqualTo _unit) then {
        _vehicleInfo = [
            _vehicle,
            switch (true) do {
                case (commander _vehicle isEqualTo _unit): {
                    ["commander"]
                };
                case (driver _vehicle isEqualTo _unit): {
                    ["driver"]
                };
                case (gunner _vehicle isEqualTo _unit): {
                    ["gunner"]
                };
                case (_vehicle getCargoIndex _unit != -1): {
                    ["cargo", _vehicle getCargoIndex _unit]
                };
                default {
                    // FFV and other turret seats
                    ["turret", _vehicle unitTurret _unit]
                };
            }
        ];
    };
    GVAR(positions) set [_uid, [getPos _unit, _vehicleInfo]];
    false
}];

[QGVAR(teleportRequest), {
    params ["_unit"];
    private _info = GVAR(positions) getOrDefault [getPlayerUID _unit, []];
    if (_info isEqualTo []) exitWith {};
    [QGVAR(teleportResponse), _info, _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
