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

    class ACE_surgicalKit: ACE_ItemCore {
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};
