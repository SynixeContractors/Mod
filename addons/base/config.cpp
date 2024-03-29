#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_contractors_main",
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgGroups.hpp"
