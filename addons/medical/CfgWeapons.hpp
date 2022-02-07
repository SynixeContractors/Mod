class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class ITEM(painkillers): ACE_ItemCore {
        scope = 2;
        author = "Alganthe";
        model = "\A3\Structures_F_EPA\Items\Medical\PainKillers_F.p3d";
        picture = QPATHTOF(ui\painkillers_inventory_ca.paa);
        displayName = CSTRING(Painkillers_Name);
        descriptionShort = ACECSTRING(Medical,Morphine_Desc_Short);
        descriptionUse = ACECSTRING(Medical,Morphine_Desc_Use);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class ITEM(txa): ACE_ItemCore {
        scope = 2;
        author = "Synixe Contractors";
        model = "a3\Props_F_Orange\Humanitarian\Garbage\MedicalGarbage_01_Injector_F.p3d";
        picture = QPATHTOF(ui\txa_inventory_ca.paa);
        displayName = CSTRING(TXA_Name);
        descriptionShort = CSTRING(TXA_Desc_Short);
        descriptionUse = CSTRING(TXA_Desc_Use);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
