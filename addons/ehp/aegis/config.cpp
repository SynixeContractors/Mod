#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "ace_compat_aegis_realisticnames",
            "A3_Aegis_Weapons_F_Aegis",
            "A3_Atlas_Weapons_F_Atlas",
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
