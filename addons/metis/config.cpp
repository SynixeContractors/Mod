#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"synixe_main", "ace_missileguidance"};
        skipWhenMissingDependencies = 1;
        authors[] = {"Synixe Contractors"};
        VERSION_CONFIG;
    };
};

class ace_missileguidance_type_Metis {
    seekerMaxRange = 2000;
};
