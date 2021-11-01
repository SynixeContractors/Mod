#include "script_component.hpp"

if !(hasInterface) exitWith {};

call FUNC(initModules);

[QGVAR(members_loaded), {
	GVAR(members) = _this;
	[QGVAR(setName)] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(setName), {
	private _discordid = player getVariable [QGVAR(discordid), ""];
	private _fullname = if (_discordid isEqualTo "") then {
		format ["U: %1", name player]
	} else {
		GVAR(members) get _discordid
	};
	player setVariable ["ACE_nameraw", _fullName, true];
	player setVariable ["ACE_name", _fullName, true];
}] call CBA_fnc_addEventHandler;

["pmc_db_set_variable", {
	params ["_key", "_val"];
	if (_key isEqualTo QGVAR(discordid)) then {
		[QGVAR(setName)] call CBA_fnc_localEvent;
	};
}] call CBA_fnc_addEventHandler;

[{player isNotEqualTo objNull}, {
	"synixe" callExtension ["discord_setup", [getPlayerUID player, profileName]];

	[{
		private _role = "https://synixe.contractors";
		private _mission = "";

		if (isServer) then {
			_mission = "Editing Missions";
		} else {
			_mission = missionName;
			if (_mission == "tempMissionSP") then {
				_mission = "Editing Missions";
			} else {
				_mission = briefingName;
			};
		};

		"synixe" callExtension [
			"discord_update",
			[
				_mission,
				_role,
				toLower(worldName),
				getText (configfile >> "CfgWorlds" >> worldname >> "description")
			]
		];
	}, 20] call CBA_fnc_addPerFrameHandler;

	player addEventHandler ["Respawn", {
		[QGVAR(setName)] call CBA_fnc_localEvent;
	}];
}] call CBA_fnc_waitUntilAndExecute;

addMissionEventHandler ["ExtensionCallback", {
	params ["_name", "_function", "_data"];
	if !(_name == "synixe") exitWith {};
	switch (_function) do {
		case "discord_user_ready": {
			(parseSimpleArray _data) params ["_id"];
			_object setVariable [QGVAR(discordid), _id, true];
			[QGVAR(setName)] call CBA_fnc_localEvent;
		};
	};
}];
