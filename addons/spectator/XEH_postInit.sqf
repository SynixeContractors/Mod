#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Spectator
[QGVAR(prohibit), {
    [false] call ace_spectator_fnc_setSpectator;
}] call CBA_fnc_addEventHandlerArgs;

// Admin chat command to toggle spectator availability
["spec", {
    if (GVAR(screens) isEqualTo []) exitWith {
        systemChat "No spectator screens";
    };
    if (missionNamespace getVariable [QGVAR(allowed), false]) then {
        [GVAR(prohibit), nil, call CBA_fnc_players] call CBA_fnc_targetEvent;
        missionNamespace setVariable [QGVAR(allowed), false, true];
        ["ace_common_systemChatGlobal", "Spectator Prohibited"] call CBA_fnc_globalEvent;
    } else {
        missionNamespace setVariable [QGVAR(allowed), true, true];
        ["ace_common_systemChatGlobal", "Spectator Allowed"] call CBA_fnc_globalEvent;
    };
}, "admin"] call CBA_fnc_registerChatCommand;

// Player open spectator on specified object
private _actionOpen = [
    "missionBaseSpectatorOpen",
    "Open Spectator",
    "\a3\3den\data\cfg3den\camera\cameratexture_ca.paa",
    {[true, false] call ace_spectator_fnc_setSpectator}, // Forced by default (second parameter), non-forced allows user to exit
    {missionNamespace getVariable [QGVAR(allowed), false]},
    {}
] call ace_interact_menu_fnc_createAction;

{
	[_x, 0, ["ACE_MainActions"], _actionOpen] call ace_interact_menu_fnc_addActionToObject;
    _x setObjectTexture [0, "\z\synixe_contractors\addons\spectator\ui\spectator.paa"];
} forEach GVAR(screens);
