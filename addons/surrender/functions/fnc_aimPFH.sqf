#include "..\script_component.hpp"
/*
 * Author: Brett
 * Per-client loop that triggers a surrender check when the player aims at a nearby
 * AI unit whose group has an On Aim Multiplier above 0.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

if (CBA_missionTime < GVAR(aimTimeout)) exitWith {};
private _target = cursorTarget;
if (isNull _target) exitWith {};
if !(_target isKindOf "CAManBase") exitWith {};
if (isPlayer _target) exitWith {};
if (!alive _target) exitWith {};
private _targetGroup = group _target;
if (_targetGroup getVariable [QGVAR(onAimMultiplier), 0] <= 0) exitWith {};
if (_targetGroup getVariable [QGVAR(disable), false]) exitWith {};
private _side = side _targetGroup;
if (_side != civilian && {_side getFriend side group ace_player > 0.6}) exitWith {};
if (_target distance ace_player > [4, 20] select (_side == civilian)) exitWith {};
if (acos (vectorNormalized (eyeDirection _target) vectorDotProduct (eyeDirection ace_player)) < 100) exitWith {};
[QGVAR(check), [_target, "aimed"]] call CBA_fnc_serverEvent;
GVAR(aimTimeout) = CBA_missionTime + 0.5;
