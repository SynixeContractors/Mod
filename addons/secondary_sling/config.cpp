#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class CfgVehicles {
    class CargoNet_01_box_F;
    class GVAR(Holder): CargoNet_01_box_F {
        scope = 1;
        model="\A3\Weapons_f\DummyWeapon_Single.p3d";
        showWeaponCargo=1;
    };
};

