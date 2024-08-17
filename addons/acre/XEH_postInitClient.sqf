#include "script_component.hpp"

GVAR(radioArsenalButton) = [
    ([] call FUNC(getAllRadios)) + ["ACRE_VHF30108MAST", "ACRE_VHF30108SPIKE", "ACRE_VHF30108"],
    LLSTRING(Category),
    "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa"
] call ace_arsenal_fnc_addRightPanelButton;

// Set spoken
["en"] call acre_api_fnc_babelSetSpokenLanguages;

// Switch language on unconscious toggle
["ace_unconscious", {
    params ["_unit", "_state"];

    if (_unit != ACE_player) exitWith {}; // Ignore if remote unit

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
// TODO make events for ACRE
GVAR(saved) = [];
[{
    private _data = call FUNC(getRadioData);
    if GVAR(saved) != _data then {
        GVAR(saved) = _data;
        [QGVAR(save), [ACE_player, GVAR(saved)]] call CBA_fnc_serverEvent;
    };
}, 30] call CBA_fnc_addPerFrameHandler;

[QGVAR(loaded), {
    params ["_data"];
    [_data] call FUNC(setRadioData);
}] call CBA_fnc_addEventHandler;

["crate_client_gear_loadout_set", {
    [{
        [QGVAR(load), [ACE_player]] call CBA_fnc_serverEvent;
    }, [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["crate_client_gear_shop_enter_ok", {
    GVAR(shopRadios) = call FUNC(getRadioData);
}] call CBA_fnc_addEventHandler;

["crate_client_gear_shop_leave_ok", {
    [{
        [QGVAR(load), [ACE_player]] call CBA_fnc_serverEvent;
    }, [], 1] call CBA_fnc_waitAndExecute;
}];
