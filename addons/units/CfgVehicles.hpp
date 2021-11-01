#define MACRO_BASE_CLASS_COMMON \
    dlc = QUOTE(PREFIX); \
    scope = 0; \
    side = 2; \
    faction = QCLASS(IND); \
    weapons[] = {"Throw", "Put"}; \
    respawnWeapons[] = {"Throw", "Put"}; \
    magazines[] = {}; \
    respawnMagazines[] = {}; \
    items[] = {"FirstAidKit"}; \
    respawnItems[] = {"FirstAidKit"}; \
    linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"}; \
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"}; \
    modelSides[] = {6}; \
    identityTypes[] = {"LanguageENG_F", "Head_NATO", "Head_TK", "Head_Greek"}; \
    genericNames = QUOTE(PREFIX); \
    class EventHandlers;

class CfgVehicles {
	class B_RangeMaster_F;
	class CLASS(Unit_Polo_Base): B_RangeMaster_F {
		MACRO_BASE_CLASS_COMMON
		nakedUniform = QCLASS(Unit_Underwear_BlueLogo);
	};
	class CLASS(Unit_Contractor_Shirt): CLASS(Unit_Polo_Base) {
		scope = 1;
		author = "Brett";
		uniformClass = QCLASS(Uniform_Contractor_Shirt);
		hiddenSelectionsTextures[] = {QPATHTOF(data\uniform_contractor_shirt_co.paa)};
	};

	// Long Sleeve Plaid
	class B_Soldier_base_F;
	class CLASS(Unit_Combat_LS_C_Base): B_Soldier_base_F {
		MACRO_BASE_CLASS_COMMON
		hiddenSelectionsMaterials[] = {QPATHTOF(data\uniform_combat_plaid.rvmat)};
	};

	class CLASS(Unit_Combat_LS_Synixe_BP_BB): CLASS(Unit_Combat_LS_C_Base) {
		scope = 1;
		author = "Brett";
		uniformClass = QCLASS(Uniform_Combat_LS_Synixe_BP_BB);
		hiddenSelectionsTextures[] = {QPATHTOF(data\uniform_combat_synixe_bp_bb_co.paa)};
	};

	// Rolled Plaid
	class B_Soldier_03_f;
	class CLASS(Unit_Combat_RS_Base): B_Soldier_03_f {
		MACRO_BASE_CLASS_COMMON
		hiddenSelectionsMaterials[] = {QPATHTOF(data\uniform_combat.rvmat)};
	};
	class CLASS(Unit_Combat_RS_C_Base): CLASS(Unit_Combat_RS_Base) {
		hiddenSelectionsMaterials[] = {QPATHTOF(data\uniform_combat_plaid.rvmat)};
	};

	class CLASS(Unit_Combat_RS_Synixe_BP_BB): CLASS(Unit_Combat_RS_C_Base) {
		scope = 1;
		author = "Brett";
		uniformClass = QCLASS(Uniform_Combat_RS_Synixe_BP_BB);
		hiddenSelectionsTextures[] = {QPATHTOF(data\uniform_combat_synixe_bp_bb_co.paa)};
	};

	#include "CfgVehicles_GroundItems.hpp"
};
