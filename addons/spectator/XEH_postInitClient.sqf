#include "script_component.hpp"

if !(hasInterface) exitWith {};

call FUNC(initModules);
call FUNC(initRespawn);

FUNC(switchScreen) = {
    params ["_texture"];
    {
        _x setObjectTexture [0, _texture];
    } forEach allMissionObjects QGVAR(screen);
};

// Spectator
[QGVAR(allow), {
    systemChat "Spectator Allowed";
    [QPATHTOF(ui\screen_enabled_co.paa)] call FUNC(switchScreen);
}] call CBA_fnc_addEventHandler;

[QGVAR(prohibit), {
    systemChat "Spectator Prohibited";
    [false] call ace_spectator_fnc_setSpectator;
    [QPATHTOF(ui\screen_disabled_co.paa)] call FUNC(switchScreen);
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
    systemChat format ["Auto spectator %1", ["enabled", "disabled"] select (missionNamespace getVariable [QGVAR(autoEnabled), true])];
    [QGVAR(autoToggle)] call CBA_fnc_serverEvent;
}, "admin"] call CBA_fnc_registerChatCommand;

[QGVAR(toggleSpectator), {
    [!ace_spectator_isSet] call ace_spectator_fnc_setSpectator;
}] call CBA_fnc_addEventHandler;
