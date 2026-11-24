#include "script_component.hpp"

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

// Radio damage
// HitPart fires on the shooter's machine, so forward the hit to where the target is local
["CAManBase", "HitPart", {
    (_this select 0) params ["_target", "", "", "", "", "_selection"];
    if !((_selection param [0, ""]) in ["spine", "spine1", "spine2", "spine3"]) exitWith {};
    [QGVAR(radioHit), [_target], _target] call CBA_fnc_targetEvent;
}] call CBA_fnc_addClassEventHandler;

[QGVAR(radioHit), {
    params ["_target"];
    if !(alive _target) exitWith {};
    private _radios = [_target] call acre_sys_core_fnc_getGear;
    {
        if (round (random 100) > GVAR(breakChance)) then {
            continue;
        };
        private _baseRadio = [_x] call acre_api_fnc_getBaseRadio;
        private _damagedRadio = _baseRadio + "_destroyed";
        private _radio = toUpper _x;
        switch (true) do {
            case (_radio in uniformItems _target): {
                _target removeItem _x;
                _target addItemToUniform _damagedRadio;
            };
            case (_radio in vestItems _target): {
                _target removeItem _x;
                _target addItemToVest _damagedRadio;
            };
            case (_radio in backpackItems _target): {
                _target removeItem _x;
                _target addItemToBackpack _damagedRadio;
            };
        };
        [_target, QGVAR(break), nil, true, true, true] call CBA_fnc_globalSay3D;
    } forEach _radios;
}] call CBA_fnc_addEventHandler;
