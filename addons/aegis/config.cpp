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

            // Hide Factions
            "A3_Atlas_Characters_F_Atlas",

            // Aegis M4A1 & M16 Scopes
            "A3_Aegis_Weapons_F_Aegis_Rifles_M4A1",
        };
        skipWhenMissingDependencies = 1;
        authors[] = {"Mike", "Brett"};
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgGroups.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
