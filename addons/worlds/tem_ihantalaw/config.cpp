#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "tem_ihantalaw"
        };
        skipWhenMissingDependencies = 1;
        author = "Brett";
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class CAWorld;
    class tem_ihantalawa: CAWorld {
        description = "Ihantala (Winter)";
    };
};
