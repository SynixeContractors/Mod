#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        magazines[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "CUP_Weapons_AmmoBoxes",
            "CUP_Weapons_Grenades",
            "CUP_Weapons_Put",
            "CUP_Weapons_ACE_compat"
        };
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
