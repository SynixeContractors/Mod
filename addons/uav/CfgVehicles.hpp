class CfgVehicles {
    class Weapon_Bag_Base;
    class GVAR(uav_bag_base): Weapon_Bag_Base {
        author = "Synixe Contractors";
        mass = 80;
        maximumLoad = 600;
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsMaterials[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_backpack.rvmat"};
        model = "\A3\Drones_F\Weapons_F_Gamma\Ammoboxes\Bags\UAV_backpack_F.p3d";
    };
    class GVAR(ar2_bag_od): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, OD)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_06_backpack_NATO_co.paa"};
    };
    class GVAR(ar2_bag_green): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, Green)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_06_backpack_AAF_co.paa"};
    };
    class GVAR(ar2_bag_wdl): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, Woodland)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Enoch\Bags\Data\UAV_backpack_EAF_co.paa"};
    };
    class GVAR(ar2_bag_tan): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, Tan)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_06_backpack_CSAT_co.paa"};
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(assemble) {
                    displayName = "Assemble";
                    condition = QUOTE([_player] call FUNC(action_canAssemble));
                    insertChildren = QUOTE([_player] call FUNC(action_assembleInsertChildren));
                    statement = "";
                };
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class Helicopter_Base_F: Helicopter {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };

    // Darter
    class UAV_01_base_F: Helicopter_Base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(pack) {
                    displayName = "Pack";
                    distance = 4;
                    condition = QUOTE(alive _target);
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(pack));
                };
                class GVAR(removeBattery) {
                    displayName = "Remove Battery";
                    distance = 4;
                    modifierFunction = QUOTE(call FUNC(action_modifyRemove));
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(action_canRemoveBattery));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(removeBattery));
                };
                class GVAR(insertBattery) {
                    displayName = "Insert Battery";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(action_canInsertBattery));
                    statement = "";
                    insertChildren = QUOTE([ARR_2(_player,_target)] call FUNC(action_insertBatteryInsertChildren));
                };
            };
        };
    };
    class B_UAV_01_F: UAV_01_base_F {
        GVAR(case) = QGVAR(B_UAV_01_CASE);
        delete assembleInfo;
    };
    class I_UAV_01_F: UAV_01_base_F {
        GVAR(case) = QGVAR(I_UAV_01_CASE);
        delete assembleInfo;
    };
    class O_UAV_01_F: UAV_01_base_F {
        GVAR(case) = QGVAR(O_UAV_01_CASE);
        delete assembleInfo;
    };

    // Bustard
    class UAV_02_Base_lxWS: Helicopter_Base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(pack) {
                    displayName = "Pack";
                    distance = 4;
                    condition = QUOTE(alive _target);
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(pack));
                };
                class GVAR(removeBattery) {
                    displayName = "Remove Battery";
                    distance = 4;
                    modifierFunction = QUOTE(call FUNC(action_modifyRemove));
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(action_canRemoveBattery));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(removeBattery));
                };
                class GVAR(insertBattery) {
                    displayName = "Insert Battery";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(action_canInsertBattery));
                    statement = "";
                    insertChildren = QUOTE([ARR_2(_player,_target)] call FUNC(action_insertBatteryInsertChildren));
                };
                class GVAR(arm) {
                    displayName = "Arm";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_canArm));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_arm));
                    modifierFunction = QUOTE(call FUNC(bustard_armModify));
                };
                class GVAR(disarm) {
                    displayName = "Disarm";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_canDisarm));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_disarm));
                };
                // class GVAR(reload) {
                //     displayName = "Reload";
                //     distance = 4;
                //     condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_canReload));
                //     statement = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_reload));
                // };
            };
        };
    };
    class B_UAV_02_lxWS: UAV_02_Base_lxWS {
        GVAR(case) = QGVAR(B_UAV_02_lxWS_CASE);
        delete assembleInfo;
        lxws_droneWeapon[] = {"","",""};
        class EventHandlers {
            init = QUOTE([_this#0] call FUNC(bustard_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
    class I_UAV_02_lxWS: UAV_02_Base_lxWS {
        GVAR(case) = QGVAR(I_UAV_02_lxWS_CASE);
        delete assembleInfo;
        lxws_droneWeapon[] = {"","",""};
        class EventHandlers {
            init = QUOTE([_this#0] call FUNC(bustard_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
    class O_UAV_02_lxWS: UAV_02_Base_lxWS {
        GVAR(case) = QGVAR(O_UAV_02_lxWS_CASE);
        delete assembleInfo;
        lxws_droneWeapon[] = {"","",""};
        class EventHandlers {
            init = QUOTE([_this#0] call FUNC(bustard_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
};
