#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_Enoch_Loadorder", "A3_Data_F_Mod_Loadorder", "cba_main", "cba_jr", "cba_events", "ace_common", "ace_grenades", "CUP_Weapons_Ammunition", "CUP_Weapons_Flaregun", "tem_ihantalaw"};
        VERSION_CONFIG;
    };
};

class ACE_Tags {
    class GVAR(logo) {
        displayName = "Synixe Logo";
        requiredItem = "ACE_SpraypaintYellow";
        textures[] = {QPATHTOF(ui\synixe_ca.paa)};
        icon = QPATHTOF(ui\synixe_ca.paa);
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

// GL Bounce

class CfgAmmo {
    class SmokeShell;
    class G_40mm_Smoke: SmokeShell {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.1;
    };
};

class CfgWorlds {
    class CAWorld;
    class hellanmaaw: CAWorld {
        description = "Hellanmaa (Winter)";
    };
    class tem_ihantalawa: CAWorld {
        description = "Ihantala (Winter)";
    };
    class tem_summawcup: CAWorld {
        description = "Summa (Winter)";
    };
    class abramia: CAWorld {
        description = "Abramia";
    };
    class pja307: CAWorld {
        description = "Dariyah";
    };
    class pja308: CAWorld {
        description = "Gunkizli";
    };
};

// Admin Settings

cba_settings_whitelist[] = {
    ADMIN_BRETT
};

enableDebugConsole[] = {
    ADMIN_BRETT
};
