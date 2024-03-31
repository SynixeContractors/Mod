class CfgMagazines {
    class CA_Magazine;

    class GVAR(battery): CA_Magazine {
        scope = 2;
        author = "Synixe Contractors";
        displayName = "UAV Battery";
        model = "\z\ace\addons\logistics_uavbattery\data\ace_battery.p3d";
        picture = "\z\ace\addons\logistics_uavbattery\ui\UAV_battery_ca.paa";
        descriptionShort = "A UAV battery";
        ACE_isUnique = 1;
        ACE_asItem = 1;
        count = 100;
        mass = 20;
    };

    class GVAR(base): CA_Magazine {
        author = "Synixe Contractors";
        count = 1;
        mass = 500;
        ACE_isUnique = 1;

        model = "\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_small_F.p3d";
        hiddenSelections[] = {"Camo","Camo2"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Supplies\Data\PlasticCase_01_black_CO.paa"};
        editorPreview = "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_PlasticCase_01_small_black_F.jpg";
    };

    class GVAR(B_UAV_01_CASE): GVAR(base) {
        scope = 2;
        scopeCurator = 2;
        displayName = "AR-2 (BLUFOR)";
        descriptionShort = "Contains a BLUFOR AR-2 Darter";
        picture = "\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\UAV_01_CA.paa";
        count = 100;

        GVAR(drone) = "B_UAV_01_F";
    };
    class GVAR(I_UAV_01_CASE): GVAR(base) {
        scope = 2;
        scopeCurator = 2;
        displayName = "AR-2 (INDEP)";
        descriptionShort = "Contains an INDEP AR-2 Darter";
        picture = "\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\UAV_01_CA.paa";
        count = 100;

        GVAR(drone) = "I_UAV_01_F";
    };
    class GVAR(O_UAV_01_CASE): GVAR(base) {
        scope = 2;
        scopeCurator = 2;
        displayName = "AR-2 (OPFOR)";
        descriptionShort = "Contains an OPFOR AR-2 Darter";
        picture = "\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\UAV_01_CA.paa";
        count = 100;

        GVAR(drone) = "O_UAV_01_F";
    };
};
