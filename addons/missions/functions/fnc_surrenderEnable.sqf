#include "..\script_component.hpp"
/*
 * Author: Brett
 * Enabled groups to surrender
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_groups] call MFUNC(surrenderEnable)
 */

params ["_groups", ["_state", true]];

{
    _x setVariable [QGVAR(disableSurrender), !_state, true];
} forEach _groups;
