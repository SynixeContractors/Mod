#include "..\script_component.hpp"
/*
 * Author: Brett
 * Quickly create an ACE interaction
 *
 * Call from init.sqf, initPlayerLocal.sqf, a unit init box, or a trigger without server only checked
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Title <STRING>
 * 2: On Activation <CODE>
 * 3: Repeatable <BOOL>, default: false
 * 4: Condition <CODE>, default: {true}
 * 5: Icon <STRING>, default: ""
 *
 * Return Value:
 * None
 *
 * Examples:
 * [player, "Heal", {_target setDamage 0;}] call synixe_missions_fnc_action;
 */

params [
    ["_object", objNull, [objNull]],
    ["_title", "", [""]],
    ["_onActivation", {}, [{}]],
    ["_repeatable", false, [false]],
    ["_condition", {true}, [{}, false]],
    ["_icon", "", [""]]
];

if (isNull _object) exitWith {
    ERROR_MSG("action object is null");
};
if (_title isEqualTo "") exitWith {
    ERROR_MSG("action title is empty");
};
if (_onActivation isEqualTo {}) exitWith {
    ERROR_MSG("action onActivation is empty");
};

if (_condition isEqualType false) then {
    _condition = [{false}, {true}] select _condition;
};

private _id = format ["%1Action%2", QUOTE(ADDON), random 10000];
// Shared between all machines (the action id above is random per machine)
private _usedVar = format [QGVAR(actionUsed_%1), _title];

private _action = [
    _id,
    _title,
    _icon,
    {
        params ["_target", "_player", "_args"];
        _args params ["_id", "_repeatable", "_onActivation", "", "_usedVar"];
        if !(_repeatable) then {
            [_target, 0, ["ACE_MainActions", _id]] call ace_interact_menu_fnc_removeActionFromObject;
            // Hide it for every other player too
            _target setVariable [_usedVar, true, true];
        };
        _this call _onActivation;
    },
    {
        params ["_target", "_player", "_args"];
        _args params ["", "_repeatable", "", "_condition", "_usedVar"];
        (_repeatable || {!(_target getVariable [_usedVar, false])}) && {_this call _condition}
    },
    {},
    [_id, _repeatable, _onActivation, _condition, _usedVar]
] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
