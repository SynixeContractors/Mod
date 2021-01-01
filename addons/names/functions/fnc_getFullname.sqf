#include "script_component.hpp"

params ["_unit"];

private _name = [_unit] call FUNC(getNames);

private _ret = if (count _name isEqualTo 1) then {
	_name select 0
} else {
	format ["%1 %2", _name select 0, _name select 1]
};
_ret
