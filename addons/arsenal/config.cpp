#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "ace_arsenal"
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\RscAttributes.hpp"
