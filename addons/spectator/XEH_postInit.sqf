#include "script_component.hpp"

if !(hasInterface) exitWith {};

GVAR(allowed) = missionNamespace getVariable [QGVAR(allowed), false];

call FUNC(initModules);

// Spectator
[QGVAR(prohibit), {
    [false] call ace_spectator_fnc_setSpectator;
}] call CBA_fnc_addEventHandler;

[QGVAR(disable), {
    [GVAR(prohibit)] call CBA_fnc_globalEvent;
    missionNamespace setVariable [QGVAR(allowed), false, true];
	["ace_common_systemChatGlobal", "Spectator Prohibited"] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(enable), {
    missionNamespace setVariable [QGVAR(allowed), true, true];
	["ace_common_systemChatGlobal", "Spectator Allowed"] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

// Admin chat command to toggle spectator availability
["spec", {
    if (missionNamespace getVariable [QGVAR(allowed), false]) then {
        [QGVAR(disable)] call CBA_fnc_serverEvent;
    } else {
        [QGVAR(enable)] call CBA_fnc_serverEvent;
    };
}, "admin"] call CBA_fnc_registerChatCommand;

[QGVAR(toggleSpectator), {
	[!ace_spectator_isSet] call ace_spectator_fnc_setSpectator;
}] call CBA_fnc_addEventHandler;
