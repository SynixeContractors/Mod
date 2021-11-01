class CfgWeapons {
	class Uniform_Base;
	class U_BasicBody: Uniform_Base {
        class ItemInfo;
    };

	class UniformItem;
    class CLASS(Uniform_Base): Uniform_Base {
        dlc = QUOTE(PREFIX);
        scope = 0;
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";

        class ItemInfo: UniformItem {
            uniformModel = "-";
            containerClass = "Supply40";
            mass = 40;
        };
    };

    // Contractor Shirt
    class CLASS(Uniform_Contractor_Shirt): CLASS(Uniform_Base) {
        scope = 2;
        author = "Brett";
		displayName = "Contractor Shirt";
        // picture = QPATHTOF(ui\uniform_combat_ls_synixe_bp_ca.paa);

        class ItemInfo: ItemInfo {
            uniformClass = QCLASS(Unit_Contractor_Shirt);
        };
    };

	// Synixe Tartan
	class CLASS(Uniform_Combat_LS_Synixe_BP_BB): CLASS(Uniform_Base) {
        scope = 2;
        author = "Brett";
		displayName = "Combat Uniform Long (Synixe, Black, Black)";
        picture = QPATHTOF(ui\uniform_combat_ls_synixe_bp_ca.paa);

        class ItemInfo: ItemInfo {
            uniformClass = QCLASS(Unit_Combat_LS_Synixe_BP_BB);
        };
    };
    class CLASS(Uniform_Combat_RS_Synixe_BP_BB): CLASS(Uniform_Base) {
        scope = 2;
        author = "Brett";
		displayName = "Combat Uniform Rolled (Synixe, Black, Black)";
        picture = QPATHTOF(ui\uniform_combat_rs_synixe_bp_ca.paa);

        class ItemInfo: ItemInfo {
            uniformClass = QCLASS(Unit_Combat_RS_Synixe_BP_BB);
        };
    };
};
