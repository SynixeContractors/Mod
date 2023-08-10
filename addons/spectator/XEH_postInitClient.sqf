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

// Admin chat command to toggle auto spectator
["autospec", {
    if (getNumber (missionConfigFile >> "synixe_spectator_range") == 0) exitWith {
        systemChat "Auto spectator is disabled by the mission";
    };
    systemChat format ["Auto spectator %1", ["disabled", "enabled"] select (missionNamespace getVariable [QGVAR(autoEnabled), true])];
    [QGVAR(autoToggle)] call CBA_fnc_serverEvent;
}, "admin"] call CBA_fnc_registerChatCommand;

[QGVAR(toggleSpectator), {
    [!ace_spectator_isSet] call ace_spectator_fnc_setSpectator;
}] call CBA_fnc_addEventHandler;
