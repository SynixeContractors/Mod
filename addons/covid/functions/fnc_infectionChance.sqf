#include "script_component.hpp"

// A is the transmitter
params ["_a", "_b"];

private _b_covid = [_b] call FUNC(hasCovid);
if (_b_covid) exitWith {
	1
};

private _a_covid = [_a] call FUNC(hasCovid);
if !(_a_covid) exitWith {
	0
};

private _a_mask = [_a] call FUNC(hasMask);
private _b_mask = [_b] call FUNC(hasMask);

private _ret = 1;

if (_a_mask) then {
	if (_b_mask) then {
		_ret = _ret * 0.015;
	} else {
		_ret = _ret * 0.05;
	};
} else {
	if (_b_mask) then {
		_ret = _ret * 0.6;
	} else {
		_ret = _ret * 0.8;
	};
};

_ret = _ret * (1 min (0.3 / (_a distance _b)));
_ret = _ret min 0.8;

_ret

