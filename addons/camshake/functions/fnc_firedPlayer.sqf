#include "script_component.hpp"

params [
	"_shooter",
	"_weapon",
	"",
	"",
	"_ammo",
	"",
	"_projectile"
];

if ((toLower _weapon) isEqualTo "put") exitWith {};
if ((toLower _weapon) isEqualTo "throw") exitWith {};
if (isWeaponDeployed _shooter) exitWith {};

addCamshake (if (isWeaponRested _shooter) then {[0.6, 0.4, 10]} else {[1.2, 0.4, 15]});

