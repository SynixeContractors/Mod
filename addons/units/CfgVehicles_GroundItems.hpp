#define MACRO_ITEM_COMMON \
    dlc = QUOTE(PREFIX); \
    scope = 2; \
    scopeCurator = 2; \
    vehicleClass = "ItemsUniforms"; \
    model = "\A3\Weapons_F\DummySuitpack.p3d";

class Item_Base_F;

class CLASS(Item_Uniform_Contractor_Shirt): Item_Base_F {
    MACRO_ITEM_COMMON
    author = "Brett";
    displayName = CSTRING(Uniform_Contractor_Shirt);

    class TransportItems {
        MACRO_ADDITEM(CLASS(Uniform_Contractor_Shirt),1);
    };
};

class CLASS(Item_Uniform_Combat_LS_Synixe_BP_BB): Item_Base_F {
    MACRO_ITEM_COMMON
    author = "Brett";
    displayName = CSTRING(Uniform_Combat_LS_Synixe_BP_BB);

    class TransportItems {
        MACRO_ADDITEM(CLASS(Uniform_Combat_LS_Synixe_BP_BB),1);
    };
};

class CLASS(Item_Uniform_Combat_RS_Synixe_BP_BB): Item_Base_F {
    MACRO_ITEM_COMMON
    author = "Brett";
    displayName = CSTRING(Uniform_Combat_RS_Synixe_BP_BB);

    class TransportItems {
        MACRO_ADDITEM(CLASS(Uniform_Combat_RS_Synixe_BP_BB),1);
    };
};
