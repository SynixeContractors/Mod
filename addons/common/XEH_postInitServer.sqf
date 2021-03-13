#include "script_component.hpp"

[QGVAR(discordid)] call pmc_db_fnc_variable_track;

addMissionEventHandler ["ExtensionCallback", {
	params ["_name", "_function", "_data"];
	systemChat format ["[%3] %1(): %2", _function, _data, _name];
	if !(_name == "synixe_contractors") exitWith {};
	switch (_function) do {
		case "member": {
			(parseSimpleArray _data) params ["_name", "_id"];
			GVAR(members) set [format ["D%1", _id], _name];
		};
		case "member_publish": {
			[QGVAR(members_loaded), GVAR(members)] call CBA_fnc_globalEventJIP;
		};
	};
}];

EXT callExtension "get_members";