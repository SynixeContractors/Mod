#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "{{project.prefix}}_main",
            "tacs_arcadian"
        };
        author = "AUTHOR";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
