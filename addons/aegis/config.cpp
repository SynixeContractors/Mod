#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        magazines[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "A3_Aegis_Weapons_F_Aegis",
            "A3_Atlas_Weapons_F_Atlas",
            "A3_Aegis_Soft_F_Aegis_Offroad_01",
            "A3_Aegis_Soft_F_Aegis_Truck_02",
            "Vehicles_F_lxWS_Truck_02",
            "A3_Aegis_Soft_F_Aegis_UGV_01",
            "A3_Aegis_Soft_F_Aegis_Van_02",
            "A3_Aegis_Armor_F_Aegis_APC_Tracked_03",
            "A3_Aegis_Armor_F_Aegis_APC_Wheeled_01",
            "A3_Aegis_Armor_F_Aegis_MBT_03",
            "A3_Aegis_Characters_F_Aegis",
            "A3_Aegis_Characters_F_Aegis_RF",
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(main,Authors);
        authors[] = {"Mike", "Brett"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"
