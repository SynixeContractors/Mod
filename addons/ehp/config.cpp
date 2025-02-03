#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "ace_hearing"
        };
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
