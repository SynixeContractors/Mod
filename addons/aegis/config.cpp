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
            "A3_Aegis_Weapons_F_Aegis",
            "A3_Atlas_Weapons_F_Atlas"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(main,Authors);
        authors[] = {"Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
