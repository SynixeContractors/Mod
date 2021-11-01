#include "script_component.hpp"

["pmc_db_serverReady", {
	[QGVAR(discordid)] call pmc_db_fnc_variable_track;

	addMissionEventHandler ["ExtensionCallback", {
		params ["_name", "_function", "_data"];
		if !(_name == "synixe") exitWith {};
		switch (_function) do {
			case "member": {
				(parseSimpleArray _data) params ["_name", "_id", "_instructor"];
				GVAR(members) set [format ["D%1", _id], _name];
				if (_instructor isEqualTo "true") then {
					GVAR(instructors) pushBack [_id];
				};
			};
			case "member_publish": {
				[QGVAR(members_loaded), GVAR(members)] call CBA_fnc_globalEventJIP;
			};
		};
	}];

	EXT callExtension "get_members";
}] call CBA_fnc_addEventHandler;
