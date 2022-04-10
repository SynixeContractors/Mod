class CfgVehicles {
    class Item_Base_F;
    class ACE_MedicalLitterBase;

    class ITEM(painkillersItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Painkillers_Name);
        author = "Alganthe";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ITEM(painkillers),1);
        };
    };
};
