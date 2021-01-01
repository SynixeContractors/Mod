#include "script_component.hpp"

if (isServer) then {
	if !(pmc_main_enabled) exitWith {};

	[QGVAR(first)] call pmc_db_fnc_variable_track;
	[QGVAR(last)] call pmc_db_fnc_variable_track;
	[QGVAR(role)] call pmc_db_fnc_variable_track;
};

if !(hasInterface) exitWith {};

GVAR(setName) = {
	[{
		private _fullName = [player] call FUNC(getFullname);
		player setVariable ["ACE_nameraw", _fullName, true];  
		player setVariable ["ACE_name", _fullName, true];  
	}, [], 1] call CBA_fnc_waitAndExecute;
};

player addEventHandler ["Respawn", {
  call GVAR(setName);
}];

["pmc_db_set_variable", {
	params ["_key", "_val"];
	if (_key in [QGVAR(first), QGVAR(last)]) then {
		call GVAR(setName);
	};
}] call CBA_fnc_addEventHandler;

addMissionEventHandler ["Map", {
	// params ["_mapIsOpened", "_mapIsForced"];
	[{
		{
			if (ctrlIDC _x isEqualTo IDC_Synixe_CA_PlayerName) exitWith {
				[_x] call FUNC(mapPlayerName);
			};
		} foreach allControls findDisplay 12;
	}] call CBA_fnc_execNextFrame;
}];

["Synixe Contractors", "Register Name", {
	params ["", "_object"];
	if (_object isEqualTo objNull || {!(isPlayer _object)}) exitWith {};
	[
        format ["Register Name - %1", getPlayerUID _object],
        [
			["EDIT","First Name", [_object getVariable [QGVAR(first), ""]]],
			["EDIT","Last Name", [_object getVariable [QGVAR(last), ""]]]
		],
        {
            params ["_values", "_args"];
            _values params ["_first", "_last"];
            _args params ["_object"];
			_object setVariable [QGVAR(first), _first, true];
			_object setVariable [QGVAR(last), _last, true];
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["Synixe Contractors", "Set Role", {
	params ["", "_object"];
	if (_object isEqualTo objNull || {!(isPlayer _object)}) exitWith {};
	[
        format ["Set Role - %1", getPlayerUID _object],
        [
			["LIST","Role", [
				[0,1,2,3,4], GVAR(roles), _object getVariable [QGVAR(role), 0]
			]]
		],
        {
            params ["_values", "_args"];
            _values params ["_role"];
            _args params ["_object"];
			_object setVariable [QGVAR(role), _role, true];
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

call GVAR(setName);
