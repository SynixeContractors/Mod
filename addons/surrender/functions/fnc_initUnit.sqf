#include "..\script_component.hpp"
/*
 * Author: Brett
 * Adds the surrender event handlers to a unit.
 * Runs on every machine through a CBA class init handler, so the handlers exist
 * wherever the unit is local (server, headless client or Zeus).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit"];

if (_unit getVariable [QGVAR(unitInit), false]) exitWith {};
_unit setVariable [QGVAR(unitInit), true];

_unit addEventHandler ["Suppressed", {
    params ["_unit", "", "_shooter"];
    if (isPlayer _unit) exitWith {};
    private _side = side group _unit;
    if (_side != civilian && {_side getFriend side group _shooter > 0.6}) exitWith {};
    if ((_unit distance2D _shooter) > 300) exitWith {};
    if (CBA_missionTime < (_unit getVariable [QGVAR(suppressedTimeout), 0])) exitWith {};
    _unit setVariable [QGVAR(suppressedTimeout), CBA_missionTime + 0.5];
    [QGVAR(check), [_unit, "suppressed"]] call CBA_fnc_serverEvent;
}];

_unit addEventHandler ["Hit", {
    params ["_unit", "_shooter"];
    if (isPlayer _unit) exitWith {};
    private _side = side group _unit;
    if (_side != civilian && {_side getFriend side group _shooter > 0.6}) exitWith {};
    if ((_unit distance2D _shooter) > 300) exitWith {};
    [QGVAR(check), [_unit, "hit"]] call CBA_fnc_serverEvent;
}];
