#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_contractors_common"
        };
        author = "Brett";
        authors[] = {"Brett"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
