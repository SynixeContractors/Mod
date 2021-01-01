#include "script_component.hpp"

params ["_unit"];

private _certs = [];

{
	private _parts = _x splitString "_";
	if (
		count _parts == 3 &&
		{ _parts select 0 isEqualTo "pmc" } &&
		{ _parts select 1 isEqualTo "traits" }
	) then {
		if (_unit getVariable [_x, false]) then {
			private _cert = _parts select 2;
			_certs pushBackUnique (format ["%1%2", toUpper (_cert select [0,1]), _cert select [1]]);
		};
	};
} forEach allVariables _unit;

if ([_unit] call ace_common_fnc_isMedic) then {
	_certs pushBackUnique "Medic";
};

if ([_unit] call ace_common_fnc_isEngineer) then {
	_certs pushBackUnique "Engineer";
};

if ([_unit] call ace_common_fnc_isEOD) then {
	_certs pushBackUnique "EOD";
};

_certs sort true;

_certs
