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
                getText (configFile >> "CfgWorlds" >> worldName >> "description")
            ]
        ];
    }, 20] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

// Disable GPS minimap
["vehicle", {
    params ["_unit"];
    private _vehicle = vehicle _unit;
    private _driver = if (isNull objectParent _unit) then {
        false
    } else {
        driver _vehicle == _unit
    };
    _vehicle enableInfoPanelComponent ["left", "MinimapDisplayComponent", _driver];
    _vehicle enableInfoPanelComponent ["right", "MinimapDisplayComponent", _driver];
    diag_log format ["vehicle gps: %1 = %2", _unit, _driver];
}, true] call CBA_fnc_addPlayerEventHandler;

player addEventHandler ["SeatSwitchedMan", {
    params ["_unit"];
    private _vehicle = vehicle _unit;
    private _driver = driver _vehicle == _unit;
    _vehicle enableInfoPanelComponent ["left", "MinimapDisplayComponent", _driver];
    _vehicle enableInfoPanelComponent ["right", "MinimapDisplayComponent", _driver];
    diag_log format ["seat switch gps: %1 = %2", _unit, _driver];
}];

// Disable map when handcuffed
addUserActionEventHandler ["showMap", "Activate", {
    if (ace_player getVariable ["ace_captives_isHandcuffed", false]) then {
        disableUserInput true;
        disableUserInput false;
    };
}];

// Recruits can see nametags
["crate_client_discord_updatedRoles", {
    params ["_roles"];
    if ("709889442730475561" in _roles) then {
        ace_nametags_showPlayerNames = 5;
        ace_nametags_playerNamesViewDistance = 3;
    };
}] call CBA_fnc_addEventHandler;

if (getNumber (missionConfigFile >> "synixe_template ") == 3) then {
    GVAR(markers) = [];
    private _index = 0;
    {
        private _name = typeOf _x;
        if (_name select [0,19] == "crate_client_garage") then {
            private _marker = format ["%1_%2", _name, _index];
            _index = _index + 1;
            createMarkerLocal [_marker, getPos _x];
            switch (_name select [20,4]) do {
                case "land": {
                    _marker setMarkerTypeLocal "loc_car";
                };
                case "heli": {
                    _marker setMarkerTypeLocal "loc_heli";
                };
                case "sea_": {
                    _marker setMarkerTypeLocal "loc_boat";
                };
                case "thin": {
                    _marker setMarkerTypeLocal "loc_container";
                };
            };
            _marker setMarkerColorLocal "ColorBlack";
            _marker setMarkerAlphaLocal 0;
            GVAR(markers) pushBack _marker;
        };
    } forEach allMissionObjects "";
    (findDisplay 12) displayAddEventHandler ["MouseZChanged", {
        params ["_display", "_scroll"];
        private _scale = ctrlMapScale (_display displayCtrl 51);
        {
            _x setMarkerAlphaLocal linearConversion [0, 0.05, _scale, 1, 0, true];
        } forEach GVAR(markers);
    }];
};
