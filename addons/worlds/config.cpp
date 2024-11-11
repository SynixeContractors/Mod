#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main"
        };
        author = "Brett";
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class CAWorld;
    class hellanmaaw: CAWorld {
        description = "Hellanmaa (Winter)";
    };
    class tem_summawcup: CAWorld {
        description = "Summa (Winter)";
    };
    class abramia: CAWorld {
        description = "Abramia";
    };
    class pja307: CAWorld {
        description = "Dariyah";
    };
    class pja308: CAWorld {
        description = "Gunkizli";
    };
};
