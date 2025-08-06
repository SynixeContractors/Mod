#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"synixe_main", "MELB"};
        skipWhenMissingDependencies = 1;
        authors[] = {"Jonpas"};
        VERSION_CONFIG;
    };
};

class Mode_FullAuto;
class RscControlsGroup;
class RangeText;

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"
