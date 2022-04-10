#include "script_component.hpp"

// Always holster when leaving the arsenal
["ace_arsenal_displayClosed", {
	if !(missionName in ["Arsenal", "pmc_training"]) then {
		[{
			if ((currentWeapon ACE_player) != "") then {
				if (ACE_player isEqualTo player) then {
					[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;
				};
				[ACE_player] call ace_weaponselect_fnc_putWeaponAway;
			}
		}] call CBA_fnc_execNextFrame;
	};
}] call CBA_fnc_addEventHandler;

// Disable all chats except global
0 enableChannel [true, false];  //Global - Text Only
1 enableChannel [true, false];  //Side   - Text Only
2 enableChannel false;          //Command
3 enableChannel false;          //Group
4 enableChannel false;          //Vehicle
5 enableChannel false;          //Direct
setCurrentChannel 0;            //Change to Global

// Setup discord extension
[{player isNotEqualTo objNull}, {
	EXT callExtension ["discord_setup", [getPlayerUID player, profileName]];

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

		EXT callExtension [
			"discord_update",
			[
				_mission,
				_role,
				toLower(worldName),
				getText (configfile >> "CfgWorlds" >> worldname >> "description")
			]
		];
	}, 20] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
