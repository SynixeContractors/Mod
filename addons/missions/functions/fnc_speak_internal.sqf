#include "..\script_component.hpp"
// Handles the unit start speaking, must be called on each client

params ["_unit", "_sound", "_startCode", "_stopCode", "_id", "_replayable"];

if !(_replayable) then {
    [_unit, 0, ["ACE_MainActions", _id]] call ace_interaction_menu_fnc_removeActionFromObject;
};

private _first = !(_unit getVariable [_id, false]);

private _duration = getNumber (missionConfigFile >> "CfgSounds" >> _sound >> "duration");
_unit setVariable [QGVAR(speaking), true];
_unit setRandomLip true;
_unit say3D _sound;
[QGVAR(speakingStarted), [_unit, _sound, _first, _duration]] call CBA_fnc_localEvent;

if (isServer) then {
    [_unit, _sound, _first, _duration] call _startCode;
    _unit setVariable [_id, true, true];
};

[{
    params ["_unit", "_sound", "_duration", "_stopCode", "_first"];
    _unit setRandomLip false;
    _unit setVariable [QGVAR(speaking), false];
    [QGVAR(speakingStopped), [_unit, _sound, _first, _duration]] call CBA_fnc_localEvent;
    if (isServer) then {
        [_unit, _sound, _first, _duration] call _stopCode;
    };
}, [_unit, _sound, _duration, _stopCode, _first], _duration] call CBA_fnc_waitAndExecute;
