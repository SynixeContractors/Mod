#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "acre_sys_radio",
            "acre_api"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class acre_attributes {
                class Attributes {
                    delete acre_sys_radio_edenSetup;
                };
            };
        };
    };
};

class CfgVehicles {
    class Module_F;
    class acre_api_basicMissionSetup: Module_F {
        scope = 1;
    };
    class acre_api_nameChannels: Module_F {
        scope = 1;
    };
};
