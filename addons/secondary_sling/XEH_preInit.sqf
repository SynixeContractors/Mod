#include "script_component.hpp"
ADDON = false;

// Cache of handgun class -> can be slung
GVAR(canSlingCache) = createHashMap;

// A weapon can be slung if it's listed in this setting, or its CfgWeapons class
// (or a parent) has `synixe_secondary_sling_allow = 1;`
[
    QGVAR(weaponList),
    "EDITBOX",
    ["Slingable Weapons", "Comma separated handgun-slot class names that are shown slung on the body. Weapons can also opt in through config with synixe_secondary_sling_allow = 1"],
    "Synixe - Secondary Sling",
    "vtf_MK13, vtf_MK13_black, hgun_esd_01_F, CUP_hgun_MP7, CUP_hgun_MP7_desert, CUP_hgun_MP7_woodland, CUP_hgun_TEC9, CUP_hgun_TEC9_FA, CUP_hgun_UZI",
    1,
    {
        params ["_value"];
        GVAR(weapons) = (_value splitString ", ") apply { toLower _x };
        GVAR(canSlingCache) = createHashMap;
    }
] call CBA_fnc_addSetting;

ADDON = true;
