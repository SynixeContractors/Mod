#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "A3_Sounds_F_Enoch"
        };
        author = "SynixeBrett";
        VERSION_CONFIG;
    };
};

class CfgSoundShaders {
    class Wind_Tent_Large_SoundShader {
        volume = 0;
    };
    class Wind_Tent_Small_SoundShader {
        volume = 0;
    };
};

class CfgWeapons {
    class ItemCore;
    class ace_xm157_prototype: ItemCore {
        scope = 2;
        scopeArsenal = 2;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\RscModal.hpp"
