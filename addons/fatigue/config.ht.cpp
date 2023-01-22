#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "{{project.prefix}}_main"
        };
        author = "AUTHOR";
        authors[] = {"Jonpas"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
