#include "script_component.hpp"

if !(hasInterface) exitWith {};

call FUNC(initModules);
call FUNC(initRespawn);

// Spectator
[QGVAR(prohibit), {
    [false] call ace_spectator_fnc_setSpectator;
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
