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

    class ITEM(txaItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(TXA_Name);
        author = "Synixe Contractors";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ITEM(txa),1);
        };
    };
    class ITEM(txaLitter): ACE_MedicalLitterBase {
        model = "a3\Props_F_Orange\Humanitarian\Garbage\MedicalGarbage_01_Injector_F.p3d";
    };
};
