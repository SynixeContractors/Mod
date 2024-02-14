class zen_context_menu_actions {
    class GVAR(surrender) {
        displayName = "Dynamic Surrender";
        priority = 50;
        icon = "\z\ace\addons\captives\UI\Surrender_ca.paa";
        class GVAR(enableSurrender) {
            displayName = "Enable";
            statement = QUOTE([ARR_2(_groups,true)] call FUNC(surrenderEnable));
            condition = QUOTE(_groups findIf {_x getVariable [ARR_2(QQGVAR(disableSurrender),false)]} != -1);
        };
        class GVAR(disableSurrender) {
            displayName = "Disable";
            statement = QUOTE([ARR_2(_groups,false)] call FUNC(surrenderEnable));
            condition = QUOTE(_groups findIf {!(_x getVariable [ARR_2(QQGVAR(disableSurrender),false)])} != -1);
        };
    };
};
