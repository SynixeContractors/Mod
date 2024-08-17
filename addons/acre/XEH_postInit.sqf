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
