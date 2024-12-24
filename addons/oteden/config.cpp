#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "A3_expEden_characters",
            "A3_expEden",
            "A3_Props_F_Globe_Items_Decorative",
            "A3_Props_F_Globe_Items_Documents",
            "A3_Structures_F_Globe_Items_Electronics",
            "Props_Globe_Humanitarian_Supplies",
            "Props_Globe_Items_Electronics",
        };
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
