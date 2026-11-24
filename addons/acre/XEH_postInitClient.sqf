#include "script_component.hpp"

// Set spoken
["en"] call acre_api_fnc_babelSetSpokenLanguages;

// Switch language on unconscious toggle
["ace_unconscious", {
    params ["_unit", "_state"];

    if (_unit != ace_player) exitWith {}; // Ignore if remote unit

    if (_state) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };
}] call CBA_fnc_addEventHandler;

// Handle unit change (including death)
["unit", {
    params ["_newUnit", "_oldUnit"];

    if (call CBA_fnc_getActiveFeatureCamera != "") exitWith {}; // Ignore if feature camera active (eg. Zeus)

    if (_newUnit getVariable ["ACE_isUnconscious", false]) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };
}, false] call CBA_fnc_addPlayerEventHandler;

// Handle feature camera (eg. Zeus)
["featureCamera", {
    params ["_unit", "_newCamera"]; 

    if (_newCamera == "" && {ACE_player getVariable ["ACE_isUnconscious", false]}) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages; 
    } else { 
        ["en"] call acre_api_fnc_babelSetSpokenLanguages; 
    }; 
}, false] call CBA_fnc_addPlayerEventHandler;

// Save radio data
// ACRE has no events, so save occasionally
// Saving waits until the server has answered the join-time load, so a rejoining
// player's default radios don't overwrite their saved setup
GVAR(saved) = [];
GVAR(ready) = false;
[{
    if !(GVAR(ready)) exitWith {};
    private _data = call FUNC(getRadioData);
    if (GVAR(saved) isNotEqualTo _data) then {
        GVAR(saved) = _data;
        [QGVAR(save), [player, GVAR(saved)]] call CBA_fnc_serverEvent;
    };
}, 30] call CBA_fnc_addPerFrameHandler;

[QGVAR(loaded), {
    params ["_data"];
    if (_data isNotEqualTo []) then {
        [_data] call FUNC(setRadioData);
    };
    GVAR(ready) = true;
}] call CBA_fnc_addEventHandler;

// Restore radios on join (the server only has data if this player was here before, e.g. a rejoin)
// Radios get their unique IDs a moment after spawning, so wait for them (or give up after 30s)
[{
    !isNull player && {([] call acre_api_fnc_getCurrentRadioList) isNotEqualTo []}
}, {
    [QGVAR(load), [player]] call CBA_fnc_serverEvent;
}, [], 30, {
    [QGVAR(load), [player]] call CBA_fnc_serverEvent;
}] call CBA_fnc_waitUntilAndExecute;

["crate_client_gear_loadout_set", {
    [{
        [QGVAR(load), [player]] call CBA_fnc_serverEvent;
    }, [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["crate_client_gear_shop_enter_ok", {
    [QGVAR(save), [player, call FUNC(getRadioData)]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["crate_client_gear_shop_leave_ok", {
    [{
        [QGVAR(load), [player]] call CBA_fnc_serverEvent;
    }, [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
