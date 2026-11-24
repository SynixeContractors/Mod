#include "script_component.hpp"

GVAR(positions) = createHashMap;

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    if (_unit isKindOf "HeadlessClient_F") exitWith {};
    // Don't restore anything older than this disconnect
    if (!alive _unit) exitWith { GVAR(positions) deleteAt _uid; false };
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
    // Medical vars are broadcast by ACE, so the server can read them for a remote unit
    private _medical = "";
    if (GVAR(medical) && {!isNil "ace_medical_fnc_serializeState"}) then {
        _medical = [_unit] call ace_medical_fnc_serializeState;
    };
    GVAR(positions) set [_uid, [getPos _unit, _vehicleInfo, _medical]];
    false
}];

[QGVAR(teleportRequest), {
    params ["_unit"];
    private _info = GVAR(positions) getOrDefault [getPlayerUID _unit, []];
    if (_info isEqualTo []) exitWith {};
    // Only restore once per disconnect
    GVAR(positions) deleteAt getPlayerUID _unit;
    [QGVAR(teleportResponse), _info, _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
