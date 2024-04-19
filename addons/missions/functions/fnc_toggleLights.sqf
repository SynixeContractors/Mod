#include "..\script_component.hpp"
/*
 * Author: Muta, Mike, Brett
 * Switches Lights on or off in a defined radius.
 * Call from init.sqf or Trigger without Server Only checked.
 *
 * Arguments:
 * 0: Marker <STRING>
 * 1: Radius <NUMBER>
 * 2: On <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["LightsOut", 500, true] call synixe_missions_fnc_toggleLights
 * ["LightsOut2", 250, false] call synixe_missions_fnc_toggleLights
 */

params ["_marker", "_radius", "_on"];

private _targetTypes = [
    "Lamps_Base_F",
    "PowerLines_base_F",
    "House"
];

private _state = ["OFF", "ON"] select _on;
private _markerPos = getMarkerPos _marker;

if (_markerPos#0 == 0 || _markerPos#1 == 0) exitWith {
    ERROR_MSG_1("Marker `%1` for toggleLights not found",_marker);
};

{
    private _lights = _markerPos nearObjects [_x, _radius];

    {
        _x switchLight _state;
    } forEach _lights;
} forEach _targetTypes;
