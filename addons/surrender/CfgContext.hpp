class zen_context_menu_actions {
    class GVAR(surrender) {
        displayName = "Dynamic Surrender";
        priority = 50;
        icon = "\z\ace\addons\captives\UI\Surrender_ca.paa";
        class GVAR(enable) {
            displayName = "Enable";
            statement = QUOTE([ARR_2(_groups,true)] call FUNC(enable));
            condition = QUOTE(_groups findIf {_x getVariable [ARR_2(QQGVAR(disable),false)]} != -1);
        };
        class GVAR(disable) {
            displayName = "Disable";
            statement = QUOTE([ARR_2(_groups,false)] call FUNC(enable));
            condition = QUOTE(_groups findIf {!(_x getVariable [ARR_2(QQGVAR(disable),false)])} != -1);
        };
    };
};
