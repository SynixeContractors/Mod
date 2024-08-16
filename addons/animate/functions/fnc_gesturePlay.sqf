#include "..\script_component.hpp"

params [
    "_unit",
    ["_in", ""],
    ["_loop", ""],
    ["_until", {true}]
]; 

private _duration = 0.1;
if (_in != "") then {
    _unit playActionNow _in;
    _duration = (abs (1/(getNumber (configFile >> "CfgGesturesMale" >> "States" >> _in >> "speed") + 0.01)))-0.05;
};

if (_loop == "") exitWith {
    _duration
};

[{
    params ["_unit", "_loop", "_until"];
    if !(alive _unit) exitWith {};
    if (call _until) exitWith {};
    if (_loop != "") then {
        _unit playActionNow _loop;
    };
}, [_unit, _loop, _until], _duration] call CBA_fnc_waitAndExecute;

_duration
