#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "ace_hearing",
            // MilGearPack
            "milgp_headgear_cfg",
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(main,Author);
        authors[] = {"Mike", "Brett"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
