#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"synixe_main"};
        authors[] = {"ArmaForces"};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
