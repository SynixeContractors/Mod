#include "..\script_component.hpp"
/*
 * Author: Mike, Brett
 * Returns count of alive units in given groups.
 *
 * Arguments:
 * 0: Groups <ARRAY>
 *
 * Return Value:
 * Count of alive units <NUMBER>
 *
 * Example:
 * [[My_Group_One, My_Group_Two]] call synixe_missions_fnc_countAlive;
 *
 */

params ["_groups"];

if (_groups findIf {!(_x isEqualType "GROUP")}) exitWith {
    ERROR_MSG("countAlive input only allows groups, detected unit.");
};

private _count = 0;

{
    _count = _count + ({alive _x} count units _x);
} forEach _groups;

_count
