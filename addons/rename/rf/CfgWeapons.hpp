class CfgWeapons {
    // VS-121
    class srifle_DMR_01_black_RF;
    class srifle_DMR_01_tan_RF: srifle_DMR_01_black_RF {
        displayName = "VS-121 (Sand)";
    };

    // Vortex Spitfire Prism
    class ItemCore;
    class optic_VRCO_RF: ItemCore {
        displayName = "Vortex Spitfire Prism (Black)";
    };

    // Desert Eagle
    class Pistol_Base_F;
    class hgun_DEagle_RF: Pistol_Base_F {
        displayName = "Desert Eagle Mark XIX L5 (Black)";
    };

    // Glock 19X
    class hgun_Glock19_RF: Pistol_Base_F {
        displayName = "Glock 19X (Black)";
    };
    class hgun_Glock19_auto_RF: hgun_Glock19_RF {
        displayName = "Glock 19X Auto (Black)";
    };

    // Sound Suppressor
    class muzzle_snds_H;
    class suppressor_127x55_small_RF: muzzle_snds_H {
        displayName = "Sound Suppressor (12.7 mm, Black)";
    };
    class suppressor_127x55_big_RF: muzzle_snds_H {
        displayName = "Large Sound Suppressor (12.7 mm, Black)";
    };
};
