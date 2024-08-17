#include "script_component.hpp"

FUNC(mapAnimate) = {
    if ("synixe_animate_map" in gestureState ace_player) exitWith {};
    private _rot = [50,170,-90];
    private _item = "\A3\Structures_F\Items\Documents\Map_unfolded_F.p3d";
    private _terminal = ace_player getSlotItemName 612;
    if (_terminal != "") then {
        _item = getText (configFile >> "CfgWeapons" >> _terminal >> "model");
        _rot = [70,90,0];
    } else {
        if ([ace_player, "ACE_microDAGR"] call ace_common_fnc_hasItem) then {
            _item = "\z\ace\addons\microdagr\data\MicroDAGR.p3d";
            _rot = [-80,-50,0];
        };
    };
    [ace_player, QGVAR(map_start), QGVAR(map_loop), {!visibleMap && !GVAR(inUAV)}, QGVAR(map_end), _item, [0.02,0.02,0.01], _rot] call FUNC(gestureItem);
};

GVAR(inUAV) = false;

addMissionEventHandler ["Map", {
    params ["_mapIsOpened"];
    if (GVAR(inUAV)) exitWith {};
    if (_mapIsOpened) then {
        call FUNC(mapAnimate);
    };
}];

addUserActionEventHandler ["Compass", "Activate", {
    if (!isNull findDisplay 312) exitWith {}; // don't use in Zeus
    if (ace_player getVariable ["ace_captives_isHandcuffed", false]) exitWith {};
    if ("compass" in gestureState ace_player) exitWith {};
    private _model = getText (configFile >> "CfgWeapons" >> ace_player getSlotItemName 609 >> "model");
    [ace_player, QGVAR(compass_start), QGVAR(compass_loop), {!visibleCompass}, QGVAR(compass_end), _model, [0.02,0.02,0.01], [70,90,0]] call FUNC(gestureItem);
}];

addUserActionEventHandler ["Watch", "Activate", {
    if (!isNull findDisplay 312) exitWith {}; // don't use in Zeus
    if (ace_player getVariable ["ace_captives_isHandcuffed", false]) exitWith {};
    if ("watch" in gestureState ace_player) exitWith {};
    private _model = getText (configFile >> "CfgWeapons" >> ace_player getSlotItemName 610 >> "model");
    [ace_player, "", QGVAR(watch), {!visibleWatch}] call FUNC(gesturePlay);
    [{
        [{!visibleWatch}, {
            ace_player playActionNow "ace_common_stop";
        }, []] call CBA_fnc_waitUntilAndExecute;
    }, [], 0.1] call CBA_fnc_waitAndExecute;
}];

[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    private _model = getText (configFile >> "CfgWeapons" >> _triggerItem >> "model");
    [ace_player, QGVAR(clacker), "", {true}, "", _model, [0.02,0,0], [0,0,-100]] call FUNC(gestureItem);
    true
}] call ace_explosives_fnc_addDetonateHandler;

["ACE_controlledUAV", {
    params ["_uav", "_seatAI", "_turret", "_position"];
    if (isNull _uav) then {
        GVAR(inUAV) = false;
    } else {
        GVAR(inUAV) = true;
        call FUNC(mapAnimate);
    };
}] call CBA_fnc_addEventHandler;

ace_huntir_animatePlayer = false;
GVAR(huntIROpen) = false;
["ace_huntir_monitorOpened", {
    GVAR(huntIROpen) = true;
    private _item = "\z\ace\addons\huntir\data\ace_huntir_monitor.p3d";
    [ace_player, QGVAR(map_start), QGVAR(map_loop), {!GVAR(huntIROpen)}, QGVAR(map_end), _item, [0.02,0.02,0.01], [70,90,0]] call FUNC(gestureItem);
}] call CBA_fnc_addEventHandler;

["ace_huntir_monitorClosed", {
    GVAR(huntIROpen) = false;
}] call CBA_fnc_addEventHandler;

["CBA_settingsInitialized", {
    ["visionMode", {
        params ["_unit", "_visionMode"];
        if (vehicle _unit != _unit) exitWith {};
        if (ace_player getVariable ["ace_captives_isHandcuffed", false]) exitWith {};
        if (_visionMode == 1) then {
            ace_player playActionNow QGVAR(nvg_down);
        } else {
            if (_visionMode == 0) then {
                ace_player playActionNow QGVAR(nvg_up);
            };
        };
    }, false] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
