#include "script_component.hpp"

[QGVAR(disable), {
    [QGVAR(prohibit)] call CBA_fnc_globalEvent;
    missionNamespace setVariable [QGVAR(allowed), false, true];
	["ace_common_systemChatGlobal", "Spectator Prohibited"] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(enable), {
    missionNamespace setVariable [QGVAR(allowed), true, true];
	["ace_common_systemChatGlobal", "Spectator Allowed"] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;
