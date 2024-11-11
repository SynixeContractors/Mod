#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "ace_hearing",
        };
        author = ECSTRING(main,Author);
        authors[] = {"Mike", "Brett"};
        VERSION_CONFIG;
    };
};
