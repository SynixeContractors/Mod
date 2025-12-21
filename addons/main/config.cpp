#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_Enoch_Loadorder", "A3_Data_F_Mod_Loadorder", "cba_main", "cba_jr", "cba_events", "ace_common", "ace_grenades"};
        VERSION_CONFIG;
    };
};

class ACE_Tags {
    class GVAR(logo) {
        displayName = "Synixe Logo";
        requiredItem = "ACE_SpraypaintYellow";
        textures[] = {QPATHTOF(tag_ca.paa)};
        icon = QPATHTOF(tag_ca.paa);
    };
};

// Editor Categories

class CfgEditorCategories {
    class SynixeContractors {
        scope = 2;
        curatorScope = 2;
        displayName = "Synixe Contractors";
    };
};

// Admin Settings

cba_settings_whitelist[] = {
    ADMIN_BRETT
};

enableDebugConsole[] = {
    ADMIN_BRETT
};
