#include "script_component.hpp"

GVAR(medicalArsenalButton) = [
	ALL_MEDICAL_ITEMS,
	LLSTRING(Category),
	"\z\ace\addons\medical_gui\data\categories\medication.paa"
] call ace_arsenal_fnc_addRightPanelButton;
