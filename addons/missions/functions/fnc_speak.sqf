#include "..\script_component.hpp"
/*
 * Author: Brett
 * Handles a unit speaking with an audio file
 *
 * Arguments:
 * 0: Unit to speak <OBJECT>
 * 1: CfgSounds class to play <STRING>
 * 2: Code to run when the unit starts speaking (Runs only on the server) <CODE> Default: {}
 * 3: Code to run when the unit stops speaking (Runs only on the server) <CODE> Default: {}
 * 4: Whether the sound can be replayed <BOOL> Default: true
 * 5: Condition to check if the sound can be played <CODE> Default: {true}
 * 6: Title of the action <STRING> Default: "Speak"
 *
 * Call from initPlayerLocal.sqf
 *
 * Return Value:
 * None
 *
 * Examples:
 * [officer, "briefing"] call synixe_missions_fnc_speak;
 */

params [
    ["_unit", objNull, [objNull]],
    ["_sound", "", [""]],
    ["_startCode", {}, [{}]],
    ["_stopCode", {}, [{}]],
    ["_replayable", true, [true]],
    ["_condition", {true}, [{}]],
    ["_title", "Speak", [""]]
];

if !(hasInterface) exitWith {
    ERROR_MSG("speak must be called on all clients");
};

if (isNull _unit) exitWith {
    ERROR_MSG("speak _unit must be a valid object");
};
if (_sound isEqualTo "") exitWith {
    ERROR_MSG("speak _sound must be a valid string");
};
if (typeName _startCode != "CODE") exitWith {
    ERROR_MSG("speak _startCode must be a valid code");
};
if (typeName _stopCode != "CODE") exitWith {
    ERROR_MSG("speak _stopCode must be a valid code");
};

// Check the sound exists
if !(isClass (missionConfigFile >> "CfgSounds" >> _sound) || {isClass (configFile >> "CfgSounds" >> _sound)}) exitWith {
    ERROR_MSG("speak _sound must be a valid sound in CfgSounds");
};

private _id = format ["%1Speak%2%3", ADDON, _title, _sound];

private _action = [
    _id,
    _title,
    "\a3\ui_f\data\igui\cfg\actions\talk_ca.paa",
    {
        _this#2 params ["", "_unit", "_sound", "_startCode", "_stopCode", "_id", "_replayable"];
        [QGVAR(speak), [_unit, _sound, _startCode, _stopCode, _id, _replayable]] call CBA_fnc_globalEvent;
    },
    {
        alive _target && !(_target getVariable [QGVAR(speaking), false]) && {[_sound] call _this#2#0}
    },
    {},
    [
        _condition,
        _unit,
        _sound,
        _startCode,
        _stopCode,
        _id,
        _replayable
    ]
] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
