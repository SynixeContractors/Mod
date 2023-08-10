class CfgVehicles {
    class Land_TripodSCreen_01_large_F;
    class GVAR(screen): Land_TripodSCreen_01_large_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Spectator Screen";
        editorCategory = "SynixeContractors";
        hiddenSelectionsTextures[] = {
            QPATHTOF(ui\screen_co.paa),
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "#(argb,8,8,3)color(0,0,0,0.0,co)",
            "a3\props_f_exp\military\camps\data\tripodscreen_01_co.paa"};
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 2;
                condition = "true";
                class GVAR(open) {
                    displayName = "Spectator";
                    condition = QGVAR(allowed);
                    statement = "[true, false] call ace_spectator_fnc_setSpectator";
                    icon = "\a3\3den\data\cfg3den\camera\cameratexture_ca.paa";
                };
            };
        };
    };

    class VR_3DSelector_01_default_F;
    class GVAR(respawn): VR_3DSelector_01_default_F {
        scope = 2;
        scopeCurator = 0;
        displayName = "Respawn";
        editorCategory = "SynixeContractors";
    };
};
