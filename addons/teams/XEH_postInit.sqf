#include "script_component.hpp"

["created", { _this call FUNC(onMarkerCreated)}] call CBA_fnc_addMarkerEventHandler;

["CBA_teamColorChanged", {
	params ["_unit"];
	if (_unit == player) then {
		[FUNC(onTeamChanged)] call CBA_fnc_execNextFrame;
	};
}] call CBA_fnc_addEventHandler;

[{
	{
		[_x] call FUNC(onMarkerCreated);
	} forEach allMapMarkers;
}, [], 0.5] call CBA_fnc_waitAndExecute; 
