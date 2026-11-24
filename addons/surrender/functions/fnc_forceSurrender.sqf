#include "..\script_component.hpp"
/*
 * Author: Brett
 * Forces units to surrender, or releases them from surrendering.
 *
 * Arguments:
 * 0: Groups and/or units <ARRAY>
 * 1: Surrender <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[My_Group], true] call synixe_surrender_fnc_forceSurrender
 *
 * Public: Yes
 */

params [["_targets", [], [[]]], ["_state", true, [true]]];

private _units = [];
{
    if (_x isEqualType grpNull) then {
        _units append units _x;
    } else {
        if (_x isKindOf "CAManBase") then {
            _units pushBack _x;
        };
    };
} forEach _targets;

{
    if (!alive _x || {isPlayer _x}) then { continue };
    // Don't touch handcuffed units when releasing
    if (!_state && {_x getVariable ["ace_captives_isHandcuffed", false]}) then { continue };
    ["ACE_captives_setSurrendered", [_x, _state], _x] call CBA_fnc_targetEvent;
} forEach (_units arrayIntersect _units);
