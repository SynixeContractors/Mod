#include "script_component.hpp"

params ["_unit", "_case"];

private _drone = getText (configFile >> "CfgMagazines" >> _case >> QGVAR(drone));
if (_drone isEqualTo "") exitWith {};

[_unit, "MedicOther"] call ace_common_fnc_doGesture;
[
	5,
	[_unit, _drone, _case],
	{
		(_this select 0) params ["_unit","_drone","_case"];
		if (local _unit) then {
			_unit removeItem _case;
			private _pos = _unit modelToWorld [0,1,0];
			private _drone = _drone createVehicle _pos;
			createVehicleCrew _drone;
			_drone setPos _pos;
			_drone setFuel 0;
		};
		[_unit, 'PutDown'] call ace_common_fnc_doGesture;
	},
	{},
	format ["Assembling %1", getText (configFile >> "CfgVehicles" >> _drone >> "displayName")]
] call ace_common_fnc_progressBar;
