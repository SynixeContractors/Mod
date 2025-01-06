class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {
    class compatibleItems;
};

class CfgWeapons {
    class Rifle;
    class Rifle_Base_F: Rifle {
        class WeaponSlotsInfo;
    };
    class Aegis_arifle_M4A1_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class CowsSlot: asdg_OpticRail1913 {
                class compatibleItems: compatibleItems {
                    #include "IncompatibleScopes.hpp"
                };
            };
        };
    };
    class Aegis_arifle_M16A4_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class CowsSlot: asdg_OpticRail1913 {
                class compatibleItems: compatibleItems {
                    #include "IncompatibleScopes.hpp"
                };
            };
        };
    };
};
