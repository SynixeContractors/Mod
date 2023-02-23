#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "CUP_Wheeled_SUV",
            "acre_sys_rack"
        };
        authors[] = {"JoramD"};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
