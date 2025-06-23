#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "map_north_takistan"
        };
        skipWhenMissingDependencies = 1;
        author = "Brett";
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class Altis;
    class archipelago: Altis {
        description = "L’Archipel d’Émeraude";
        class Names {
            class Sarcasma {
                name = "Zar Kalay";
            };
        };
    };
};
