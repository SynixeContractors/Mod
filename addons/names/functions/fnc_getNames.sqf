#include "script_component.hpp"

params ["_unit"];

private _first = _unit getVariable [QGVAR(first), ""];

private _ret = if !(_first isEqualTo "") then {
	[_first, _unit getVariable [QGVAR(last), ""]]
} else {
	[[_unit, false, true] call ace_common_fnc_getName]
};
_ret
