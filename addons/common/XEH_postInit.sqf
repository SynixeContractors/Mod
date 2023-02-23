#include "script_component.hpp"

{
    [_x, "default", "synixe"] call acre_api_fnc_copyPreset;
    [_x, "synixe", 1, "label", "UDF"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 2, "label", "RED"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 3, "label", "GREEN"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 4, "label", "BLUE"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 5, "label", "YELLOW"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe", 6, "label", "COMMAND"] call acre_api_fnc_setPresetChannelField;
    [_x, "synixe"] call acre_api_fnc_setPreset;
} forEach ["ACRE_PRC152", "ACRE_PRC117F"];
