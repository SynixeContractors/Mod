#include "..\script_component.hpp"

params [
    ["_unit", objNull],
    ["_soundId", 6]
];

// TODO: hold breath on sound id 15? but there doesn't seem to be a release sound for it

if !(_soundId in ALLOWED_SOUNDS) exitWith {};
if (isNull _unit) exitWith {};
if !(alive _unit) exitWith {};

if (eyePos _unit select 2 < 0.1) exitWith {};
if (getPosASL _unit distance getPosASL player > 100) exitWith {};

private _temp = [_unit] call FUNC(temp);
if (_temp > 7.2) exitWith {};

[_unit, _soundId, _temp] spawn FUNC(showBreath);
_unit setVariable [QGVAR(lastBreath), time];
