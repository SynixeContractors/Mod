#include "script_component.hpp"

// Exit on Headless Clients
if (!hasInterface) exitWith {};

[QGVAR(syncMode), {
    params ["_mode"];
    LOG_1("MFD mode sync: %1",_mode);
    [_mode] call FUNC(setMFDMode);
}] call CBA_fnc_addEventHandler;

[QGVAR(syncZoom), {
    params ["_zoom"];
    LOG_1("MFD zoom sync: %1",_zoom);
    [_zoom] call FUNC(setMFDZoom);
}] call CBA_fnc_addEventHandler;

["MELB_base", "GetOut", {
    params ["_vehicle", "_role", "_unit"];

    if (_unit == ACE_player && {_role == "gunner"}) then {
        [_vehicle] call FUNC(unloadMFD);
    };
}] call CBA_fnc_addClassEventHandler;

["MELB_base", "SeatSwitched", {
    params ["_vehicle", "_unit1", "_unit2"];

    private _units = [driver _vehicle, gunner _vehicle] arrayIntersect [_unit1, _unit2];
    if ((_units select 0) == ACE_player) then {
        [_vehicle] call FUNC(unloadMFD);
    };
}] call CBA_fnc_addClassEventHandler;

["zen_curatorDisplayUnloaded", {
    [{
        private _vehicle = vehicle ACE_player;
        if (_vehicle getVariable [QGVAR(drawID), -1] != -1) then {
            GVAR(camera) cameraEffect ["Internal", "BACK", "rendertarget0"];
        };
    }, [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
