#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {
            QCLASS(Arcadian_I_Black),
            QCLASS(Arcadian_I_Green),
            QCLASS(Arcadian_I_Tan),
            QCLASS(Arcadian_I_Grey),
            QCLASS(Arcadian_Armed_I_Black),
            QCLASS(Arcadian_Armed_I_Green),
            QCLASS(Arcadian_Armed_I_Tan),
            QCLASS(Arcadian_Armed_I_Grey)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "{{project.prefix}}_main",
            "tacs_arcadian"
        };
        author = "AUTHOR";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
