params ["_unit", "_uav"];

if (!alive _unit) exitWith {false};

if ((_uav getVariable ['lxws_holdingWeapon',[]]) isEqualTo []) exitWith {false};

true
