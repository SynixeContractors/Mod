#include "..\script_component.hpp"
/*
 * Author: Brett
 * Deprecated: every AI unit is now initialized automatically.
 * Kept so existing missions calling it don't break.
 * Use synixe_surrender_fnc_enable to enable or disable groups.
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Group] call synixe_surrender_fnc_init
 */

params ["_group"];

if !(_group isEqualType grpNull) exitWith {
    ERROR_MSG("Input only allows group, detected unit.");
};

{
    [_x] call FUNC(initUnit);
} forEach units _group;
