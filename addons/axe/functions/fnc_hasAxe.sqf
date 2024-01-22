#include "..\script_component.hpp"

params ["_unit"];

// because I am too lazy to add a config value to mgp
if ("Tomahawk" in backpack _unit) exitWith {true};

if ((QITEM(axe) in (items _unit))) exitWith {true};

false
