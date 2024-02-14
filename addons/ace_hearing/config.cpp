#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "ace_hearing",
            // Western Sahara
            "Characters_f_lxWS_headgear"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Mike", "Brett"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
