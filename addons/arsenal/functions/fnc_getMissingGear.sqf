#include "script_component.hpp"

params ["_unit"];

private _missing = [];

private _items = items _unit;

if (uniform _unit isEqualTo "" || {uniform _unit isEqualTo "U_I_CombatUniform"}) then {
	_missing pushBack "A Uniform";
};

if (GVAR(requireVest)) then {
	if (vest _unit isEqualTo "") then {
		_missing pushBack "A Vest";
	};
};

// Check for a weapon
if (GVAR(requirePrimary)) then {
	if (primaryWeapon _unit isEqualTo "") then {
		_missing pushBack "A Rifle";
	};
	private _rounds = 0;
	private _compatible = ([primaryWeapon _unit] call BIS_fnc_compatibleMagazines) apply { toLower _x };
	{
		if (toLower (_x#0) in _compatible) then {
			_rounds = _rounds + _x#1;
		};
	} forEach magazinesAmmoFull _unit;
	if (_rounds < GVAR(requirePrimaryAmmo)) then {
		_missing pushBack format ["%1 Primary Rounds", GVAR(requirePrimaryAmmo) - _rounds];
	};
};

if (GVAR(requireHandgun)) then {
	if (handgunWeapon _unit isEqualTo "") then {
		_missing pushBack "A Handgun";
	};
	private _rounds = 0;
	private _compatible = [handgunWeapon _unit] call BIS_fnc_compatibleMagazines apply { toLower _x };
	{
		if (toLower (_x#0) in _compatible) then {
			_rounds = _rounds + _x#1;
		};
	} forEach magazinesAmmoFull _unit;
	if (_rounds < GVAR(requireHandgunAmmo)) then {
		_missing pushBack format ["%1 Handgun Rounds", GVAR(requireHandgunAmmo) - _rounds];
	};
};

[["ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot"],
							10, "Bandages", _missing] call FUNC(countItem);
[["ACE_bodyBag"], 			1, "Bodybag", _missing] call FUNC(countItem);
[["kat_guedel"], 			1, "Guedel Tube", _missing] call FUNC(countItem);
[["ACE_splint"], 			1, "Splint", _missing] call FUNC(countItem);
[[QITEM(painkillers)], 		2, "Painkillers", _missing] call FUNC(countItem);
// [[QITEM(txa)], 				1, "TXA", _missing] call FUNC(countItem);
[["ACE_tourniquet"], 		2, "Tourniquets", _missing] call FUNC(countItem);
[["ACE_SpraypaintGreen"], 	1, "Spray Paint (Green)", _missing] call FUNC(countItem);

if (_new#9#0 isEqualTo "") then {
	_missing pushBack "A Map";
};

if (_new#9#1 isEqualTo "") then {
	_missing pushBack "A GPS";
};

if (_new#9#3 isEqualTo "") then {
	_missing pushBack "A Compas";
};

if (_new#9#4 isEqualTo "") then {
	_missing pushBack "A Watch";
};

_missing