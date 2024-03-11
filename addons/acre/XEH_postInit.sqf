#include "script_component.hpp"

GVAR(radioArsenalButton) = [
    ([] call FUNC(getAllRadios)) + ["ACRE_VHF30108MAST", "ACRE_VHF30108SPIKE", "ACRE_VHF30108"],
    LLSTRING(Category),
    "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa"
] call ace_arsenal_fnc_addRightPanelButton;

// Set languages
["en", "English"] call acre_api_fnc_babelAddLanguageType;
["un", "Unconscious"] call acre_api_fnc_babelAddLanguageType;

{
    [_x, "default", "synixe"] call acre_api_fnc_copyPreset;
    [_x, "synixe", 1, "label", "COMMAND"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 2, "label", "ALPHA"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 3, "label", "BRAVO"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 4, "label", "CHARLIE"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 5, "label", "DELTA"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe"] call acre_api_fnc_setPreset;
} forEach ["ACRE_PRC152", "ACRE_PRC117F"];

if (!hasInterface) exitWith {};

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
