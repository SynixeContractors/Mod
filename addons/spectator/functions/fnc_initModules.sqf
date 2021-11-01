#include "script_component.hpp"

["Synixe Contractors", "Toggle Spectator", {
	params ["", "_object"];
	if (_object isEqualTo objNull || {!(isPlayer _object)}) exitWith {};
	[QGVAR(toggleSpectator), [], _object] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;
