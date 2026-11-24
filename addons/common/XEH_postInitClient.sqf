#include "script_component.hpp"

// Always holster when leaving the arsenal
["ace_arsenal_displayClosed", {
    if !(missionName in ["Arsenal", "TRA30_Synixe_MaldenTrainingFacility", "TRA30_Synixe_BozcaadaTrainingFacility"]) then {
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
[{!isNull player}, {
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

                // eg. "Medic · Red Team"
                private _parts = [];
                private _roles = [player] call FUNC(findRoles);
                if (_roles isNotEqualTo []) then {
                    private _roleName = _roles select 0;
                    // Short tags (sl, ftl, uav) are acronyms, longer ones are words (medic)
                    _parts pushBack ([
                        (toUpper (_roleName select [0, 1])) + (_roleName select [1]),
                        toUpper _roleName
                    ] select (count _roleName <= 3));
                };
                if (alive player) then {
                    // Team colour (set from map marker colours), MAIN / unassigned is left out
                    private _team = assignedTeam player;
                    if (_team in ["RED", "GREEN", "BLUE", "YELLOW"]) then {
                        _parts pushBack format ["%1%2 Team", _team select [0, 1], toLower (_team select [1])];
                    };
                } else {
                    _parts pushBack "Spectating";
                };
                if (_parts isNotEqualTo []) then {
                    _role = _parts joinString " · ";
                };
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
}, true] call CBA_fnc_addPlayerEventHandler;

player addEventHandler ["SeatSwitchedMan", {
    params ["_unit"];
    private _vehicle = vehicle _unit;
    private _driver = driver _vehicle == _unit;
    _vehicle enableInfoPanelComponent ["left", "MinimapDisplayComponent", _driver];
    _vehicle enableInfoPanelComponent ["right", "MinimapDisplayComponent", _driver];
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

if (getNumber (missionConfigFile >> "synixe_template") == 3) then {
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
};
