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
 * [_groups] call synixe_surrender_fnc_enable
 */

params ["_groups", ["_state", true]];

{
    _x setVariable [QGVAR(disable), !_state, true];
} forEach _groups;
