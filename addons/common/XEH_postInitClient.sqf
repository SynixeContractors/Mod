#include "script_component.hpp"

// Always holster when leaving the arsenal
["ace_arsenal_displayClosed", {
    if !(missionName in ["Arsenal", "TRA30_Synixe_MaldenTrainingFacility"]) then {
        [{
            if ((currentWeapon ACE_player) != "") then {
                if (ACE_player isEqualTo player) then {
                    [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;
                };
                [ACE_player] call ace_weaponselect_fnc_putWeaponAway;
            };
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
    EXT callExtension ["discord:setup", [getPlayerUID player, profileName]];

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
                _mission = getMissionConfigValue ["onLoadName", briefingName];
            };
        };

        EXT callExtension [
            "discord:update",
            [
                _mission,
                _role,
                toLower(worldName),
                getText (configfile >> "CfgWorlds" >> worldName >> "description")
            ]
        ];
    }, 20] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

// Disable GPS minimap

["vehicle", {
    params ["_unit"];
    _unit enableInfoPanelComponent ["left", "MinimapDisplayComponent", false];
    _unit enableInfoPanelComponent ["right", "MinimapDisplayComponent", false];
}, true] call CBA_fnc_addPlayerEventHandler;

// Disable map when handcuffed
[{
    findDisplay 46 displayAddEventHandler ["KeyDown", {
        params ["_display", "_key"];
        _key in (actionKeys "showMap") && (ace_player getVariable ["ace_captives_isHandcuffed", false])
    }];
}, [], 60] call CBA_fnc_waitAndExecute;
