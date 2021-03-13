#include "script_component.hpp"

params ["_a", "_b"];

if ([_b] call FUNC(hasCovid)) exitWith {};
if ((_a distance2D _b) > 10) exitWith {};

if (lineIntersects [eyePos _a, eyePos _b, _a, _b]) exitWith {};

private _chance = [_a, _b] call FUNC(infectionChance);
private _vulnerability = _b getVariable [QGVAR(vulnerability), 1];
_chance = _chance * _vulnerability;

// Based on a 15 second tick, now down to 3
_chance = _chance / 5;

_b setVariable [QGVAR(hasCovid), ((random 1) < _chance), true];
