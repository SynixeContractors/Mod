class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class ACRE_PRC343_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_prc343\Data\prc343_icon.paa";
        model = "\idi\acre\addons\sys_prc343\Data\models\acre_prc343_model.p3d";
        displayName = "AN/PRC-343 (Destroyed)";
        descriptionShort = "AN/PRC-343 PRR Radio";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };
    class ACRE_PRC148_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_prc148\Data\prc148_icon.paa";
        model = "\idi\acre\addons\sys_prc148\Data\models\prc148.p3d";
        displayName = "AN/PRC-148 (Destroyed)";
        descriptionShort = "AN/PRC-148 Radio";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };
    class ACRE_PRC152_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_prc152\Data\PRC152c_ico.paa";
        model = "\idi\acre\addons\sys_prc152\Data\Models\PRC152.p3d";
        displayName = "AN/PRC-152 (Destroyed)";
        descriptionShort = "AN/PRC-152 VHF/UHF Radio";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };
    class ACRE_PRC117F_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_prc117f\Data\PRC117F_ico.paa";
        displayName = "AN/PRC-117F (Destroyed)";
        descriptionShort = "AN/PRC-117F Manpack Radio";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 120;
            allowedSlots[] = {901};
        };
    };
    class ACRE_PRC77_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_prc77\Data\prc77_icon.paa";
        model = "\idi\acre\addons\sys_prc77\Data\models\prc_77.p3d";
        displayName = "AN/PRC-77 (Destroyed)";
        descriptionShort = "AN/PRC-77 Manpack Radio";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 120;
            allowedSlots[] = {901};
        };
    };
    class ACRE_SEM52SL_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_sem52sl\data\ui\sem52sl_icon.paa";
        model = "\idi\acre\addons\sys_sem52sl\Data\model\sem52sl.p3d";
        displayName = "SEM 52 SL (Destroyed)";
        descriptionShort = "Sender/Empfänger, mobil SEM 52 SL";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };
    class ACRE_SEM70_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_sem70\data\ui\sem70_icon.paa";
        model = "\idi\acre\addons\sys_sem70\data\model\sem70.p3d";
        displayName = "SEM 70 (Destroyed)";
        descriptionShort = "Sender/Empfänger, mobil SEM 70";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 120;
            allowedSlots[] = {901};
        };
    };
    class ACRE_BF888S_destroyed: ACE_ItemCore {
        scope = 1;
        author = "Mighty";
        picture = "\idi\acre\addons\sys_bf888s\Data\static\bf888s_icon.paa";
        model = "\idi\acre\addons\sys_bf888s\Data\models\acre_bf888s_model.p3d";
        displayName = "Beofeng 888S (Destroyed)";
        descriptionShort = "Beofeng BF-888S UHF Radio";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };
};
