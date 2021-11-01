#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = "AUTHOR";
        VERSION_CONFIG;
    };
};

// Editor Categories

class CfgEditorCategories {
	class SynixeContractors {
		displayName = "Synixe Contractors";
	};
};

// GL Bounce

class CfgAmmo {
    class FlareBase;
    class F_40mm_White: FlareBase {
        intensity = 1500000;
    };
    class F_40mm_Yellow: F_40mm_White {};
    class F_40mm_Red: F_40mm_White {};
    class F_40mm_Green: F_40mm_White {};

    class FlareCore;
    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 4000000;
    };

    class SmokeShell;
    class G_40mm_Smoke: SmokeShell {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.1;
    };
};

// Admin Settings

cba_settings_whitelist[] = {
    ADMIN_BRETT
};

enableDebugConsole[] = {
    ADMIN_BRETT
};
