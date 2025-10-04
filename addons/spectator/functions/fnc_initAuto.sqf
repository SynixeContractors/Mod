#include "..\script_component.hpp"

if !(isServer) exitWith {};
if (getNumber (missionConfigFile >> "synixe_template") < 3) exitWith {};

GVAR(autoRange) = getNumber (missionConfigFile >> "synixe_spectator_range");
if (GVAR(autoRange) == 0) exitWith {};

GVAR(autoEnabled) = true;

[QGVAR(autoToggle), {
    GVAR(autoEnabled) = !GVAR(autoEnabled);
    missionNamespace setVariable [QGVAR(autoEnabled), GVAR(autoEnabled), true];
}] call CBA_fnc_addEventHandler;

[{
    if !(GVAR(autoEnabled)) exitWith {};
    private _allNear = allPlayers findIf {
        (nearestObjects [getPos _x, [QGVAR(screen)], GVAR(autoRange)]) isEqualTo []
    } == -1;
    if (_allNear) then {
        if !(GVAR(allowed)) exitWith {};
        [QGVAR(disable)] call CBA_fnc_serverEvent;
    } else {
        if (GVAR(allowed)) exitWith {};
        [QGVAR(enable)] call CBA_fnc_serverEvent;
    };
}, 6] call CBA_fnc_addPerFrameHandler;
