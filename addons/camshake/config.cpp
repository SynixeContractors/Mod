#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "A3_Data_F",
            "A3_Data_F_ParticleEffects"
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
