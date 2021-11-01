#include "script_component.hpp"

params ["_unit"];

private _children = [];

private _cases = ((magazines _unit) apply { [_x, getText (configFile >> "CfgMagazines" >> _x >> QGVAR(drone))] }) select { _x#1 isNotEqualTo "" };

{
	_x params ["_case", "_drone"];
	private _droneCfg = configFile >> "CfgVehicles" >> _drone;
	_children pushBack [
		[
			format ["drone_%1", _forEachIndex],
			getText (_droneCfg >> "displayName"),
			getText (_droneCfg >> "picture"),
			{ [_this select 0, _this select 2] call FUNC(assemble) },
			{ true },
			{},
			_case
		] call ace_interact_menu_fnc_createAction,
		[],
		ACE_Player
	];
} forEach _cases;

_children
