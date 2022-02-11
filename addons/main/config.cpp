#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_Enoch_Loadorder", "A3_Data_F_Mod_Loadorder", "cba_main", "cba_jr", "cba_events", "ace_common", "ace_grenades", "CUP_Weapons_Ammunition", "CUP_Weapons_Flaregun"};
        author = "AUTHOR";
        VERSION_CONFIG;
    };
};

#include "CfgFactionClasses.hpp"

// Editor Categories

class CfgEditorCategories {
	class SynixeContractors {
        curatorScope = 2;
		displayName = "Synixe Contractors";
	};
};

// GL Bounce & Flare Intensity

class CfgAmmo {
    class FlareBase;
    class F_40mm_White: FlareBase {
        intensity = 1500000;
    };

    // Mortar Flare
    class FlareCore;
    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 125000;
        timeToLive = 180;
        coefGravity = 0.8;
    };

    // ACE
    class ACE_40mm_Flare_white: F_40mm_White {
        timeToLive = 180;
    };

    class F_20mm_White;
    class ACE_F_Hand_White: F_20mm_White {
        timeToLive = 120;
    };

    class F_20mm_Red;
    class ACE_F_Hand_Red: F_20mm_Red {
        timeToLive = 120;
    };

    class F_20mm_Green;
    class ACE_F_Hand_Green: F_20mm_Green {
        timeToLive = 120;
    };

    class F_20mm_Yellow;
    class ACE_F_Hand_Yellow: F_20mm_Yellow {
        timeToLive = 120;
    };

    class SmokeShell;
    class ACE_G_Handflare_White: SmokeShell {
        timeToLive = 120;
    };

    // Parachute
    class CUP_F_40mm_Star_White: F_40mm_White {
        timeToLive = 180;
        coefGravity = 0.25;
    };

    // Cluster
    class CUP_F_40mm_StarCluster_White: CUP_F_40mm_Star_White {
        timeToLive = 180;
        coefGravity = 0.6;
    };
    class CUP_F_40mm_StarCluster_Red: CUP_F_40mm_Star_White {
        timeToLive = 180;
        coefGravity = 0.6;
    };
    class CUP_F_40mm_StarCluster_Green: CUP_F_40mm_Star_White {
        timeToLive = 180;
        coefGravity = 0.6;
    };

    // Parachute
    class CUP_F_40mm_Star_White: F_40mm_White {
        timeToLive = 180;
    };

    class CUP_F_40mm_Star_Green: CUP_F_40mm_Star_White {};
    class CUP_F_40mm_Star_Red: CUP_F_40mm_Star_White {};

    // CUP Ilumination Rounds (CUP sets it in this class again instead of inheriting)
    class CUP_F_265mm_Star_White: F_40mm_White {
        timeToLive = 180;
    };

    class SmokeShell;
    class G_40mm_Smoke: SmokeShell {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.1;
    };
};

// Disable GPS minimap
class Extended_DisplayLoad_EventHandlers {
    class RscCustomInfoMiniMap {
        GVAR(nogps) = "params ['_display']; { if ((vehicle ace_player) isEqualTo ace_player) then { _x ctrlShow false; } } forEach allControls _display;";
    };
};


// Admin Settings

cba_settings_whitelist[] = {
    ADMIN_BRETT
};

enableDebugConsole[] = {
    ADMIN_BRETT
};
