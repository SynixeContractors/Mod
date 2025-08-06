#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Ui_F", "A3_3DEN"};
        authors[] = {"Drofseh"};
        VERSION_CONFIG;
    };
};

#include "RscDisplay.hpp"
#include "Display3DEN.hpp"
