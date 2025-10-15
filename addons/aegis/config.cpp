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
            "A3_Atlas_Characters_F_Atlas",
        };
        skipWhenMissingDependencies = 1;
        authors[] = {"Brett"};
        VERSION_CONFIG;
    };
};

#include "CfgGroups.hpp"
