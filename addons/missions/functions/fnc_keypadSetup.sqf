#include "..\script_component.hpp"
/*
 * Author: Mike
 * Prepares an object for keypad GUI
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Keypad <OBJECT>
 * 1: Required Code <STRING>
 * 2: On Complete <CODE>
 * 3: On Fail <CODE>
 * 4: On Attempt <CODE>
 * 5: Maximum Failed Attempts <NUMBER> (default: 3)
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyObject, "1234", { true }, { systemChat format ["on complete %1", _this] }, { systemChat format ["on fail %1", _this] }, { systemChat format ["on attempt %1", _this] }, 3] call synixe_missions_fnc_keypadSetup
 */

params ["_object", "_requiredCode", ["_condition", { true }], ["_onComplete", {}], ["_onFail", {}], ["_onAttempt", {}], ["_maxFailedAttempts", 3]];

if (isServer) then {
    _object setVariable [QGVAR(Keypad_currentFailedAttempts), 0, true];
    _object setVariable [QGVAR(Keypad_maxFailedAttempts), _maxFailedAttempts, true];
    _object setVariable [QGVAR(Keypad_requiredCode), _requiredCode, true];
    _object setVariable [QGVAR(Keypad_Text), "", true];
    _object setVariable [QGVAR(keypad_condition), _condition, true];
    _object setVariable [QGVAR(Keypad_onComplete), _onComplete, true];
    _object setVariable [QGVAR(Keypad_onFail), _onFail, true];
    _object setVariable [QGVAR(Keypad_onAttempt), _onAttempt, true];
};

if (!hasInterface) exitWith {};

private _keypadAction = [
    format [QGVAR(keypadAction_%1), _object],
    "Enter Code",
    "",
    {
        createDialog QGVAR(Keypad);
        _player setVariable [QGVAR(keypadInUse), _target, true];
    },
    {
        !(_target getVariable [QGVAR(keypadFinished), false]) &&
        !(_target getVariable [QGVAR(keypadBlocked), false]) &&
        (_target getVariable [QGVAR(keypad_condition), { true }])
    }
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _keypadAction] call ACEFUNC(interact_menu,addActionToObject);
