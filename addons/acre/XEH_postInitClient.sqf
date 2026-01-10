#include "script_component.hpp"

GVAR(radioArsenalButton) = [
    ([] call FUNC(getAllRadios)) + ["ACRE_VHF30108MAST", "ACRE_VHF30108SPIKE", "ACRE_VHF30108"],
    "Radios",
    "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa"
] call ace_arsenal_fnc_addRightPanelButton;

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
GVAR(saved) = [];
[{
    private _data = call FUNC(getRadioData);
    if (GVAR(saved) isNotEqualTo _data) then {
        GVAR(saved) = _data;
        [QGVAR(save), [player, GVAR(saved)]] call CBA_fnc_serverEvent;
    };
}, 30] call CBA_fnc_addPerFrameHandler;

[QGVAR(loaded), {
    params ["_data"];
    [_data] call FUNC(setRadioData);
}] call CBA_fnc_addEventHandler;

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

// Radio damage
["CAManBase", "HitPart", {
    (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo"];
    if !(local _target) exitWith {};
    private _selectionName = _selection select 0;
    private _radios = [] call acre_api_fnc_getCurrentRadioList;
    if !(_selectionName in ["spine", "spine1", "spine2", "spine3"]) exitWith {};
    {
        if (round(random 100) > 3) then {
            continue;
        };
        private _baseRadio = [_x] call acre_api_fnc_getBaseRadio;
        private _damagedRadio = _baseRadio + "_destroyed";
        if (_baseRadio in uniformItems _target) then {
            _target removeItem _baseRadio;
            _target addItemToUniform _damagedRadio;
        };
        if (_baseRadio in vestItems _target) then {
            _target removeItem _baseRadio;
            _target addItemToVest _damagedRadio;
        };
        if (_baseRadio in backpackItems _target) then {
            _target removeItem _baseRadio;
            _target addItemToBackpack _damagedRadio;
        };
        [_target, QGVAR(break), nil, true, true, true] call CBA_fnc_globalSay3D;
    } forEach _radios;
}] call CBA_fnc_addClassEventHandler;
