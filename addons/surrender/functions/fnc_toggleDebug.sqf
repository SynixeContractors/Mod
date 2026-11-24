#include "..\script_component.hpp"
/*
 * Author: Brett
 * Toggles the surrender debug overlay for all Zeuses.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _state = !(missionNamespace getVariable [QGVAR(debug), false]);
[QGVAR(setDebug), [_state]] call CBA_fnc_serverEvent;
systemChat format ["Surrender debug %1", ["disabled", "enabled"] select _state];
