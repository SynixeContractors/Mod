#include "..\script_component.hpp"
/*
 * Author: Brett
 * Initializes a group to be able to surrender.
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Group] call MFUNC(surrenderInit)
 */

INFO_1("init surrender for %1",_group);

params ["_group"];

if (_group isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows group, detected unit.");
};

_group setVariable [QGVAR(surrender), true];

if (hasInterface && {_group getVariable [QGVAR(surrenderOnAimChance), 0.5] > 0}) then {
    GVAR(aimTimeout) = 0;
    if (isNil QGVAR(surrenderAim)) then {
        GVAR(surrenderAim) = [{
            if (CBA_missionTime < GVAR(aimTimeout)) exitWith {};
            private _target = cursorTarget;
            if (isNull _target) exitWith {};
            if (isPlayer _target) exitWith {};
            if (!alive _target) exitWith {};
            private _side = side _target;
            if (_side != civilian && {_side getFriend side ace_player > 0.6}) exitWith {};
            if !((group _target) getVariable [QGVAR(surrender), false]) exitWith {};
            if (_target distance ace_player > 20) exitWith {};
            if (acos (vectorNormalized (eyeDirection _target) vectorDotProduct (eyeDirection ace_player)) < 100) exitWith {};
            [QGVAR(surrenderCheck), [_target, "aimed"]] call CBA_fnc_serverEvent;
            GVAR(aimTimeout) = CBA_missionTime + 0.5;
        }, 0.1] call CBA_fnc_addPerFrameHandler;
    };
};

{
    if (isPlayer _x) exitWith {};

    _x addEventHandler ["Suppressed", {
        params ["_unit", "", "_shooter"];
        private _side = side _unit;
        if (_side != civilian && {_side getFriend side ace_player > 0.6}) exitWith {};
        if ((_unit distance2d _shooter) > 300) exitWith {};
        if (CBA_missionTime < (_unit getVariable [QGVAR(suppressedTimeout), 0])) exitWith {};
        _unit setVariable [QGVAR(suppressedTimeout), CBA_missionTime + 0.5];
        [QGVAR(surrenderCheck), [_unit, "suppressed"]] call CBA_fnc_serverEvent;
    }];

    _x addEventHandler ["Hit", {
        params ["_unit", "_shooter"];
        private _side = side _unit;
        if (_side != civilian && {_side getFriend side ace_player > 0.6}) exitWith {};
        if ((_unit distance2d _shooter) > 300) exitWith {};
        [QGVAR(surrenderCheck), [_unit, "hit"]] call CBA_fnc_serverEvent;
    }];
} forEach units _group;
