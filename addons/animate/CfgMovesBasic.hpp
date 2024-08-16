class CfgMovesBasic {
    class ManActions {
        GVAR(map_start) = QGVAR(map_start);
        GVAR(map_loop) = QGVAR(map_loop);
        GVAR(map_end) = QGVAR(map_end);
        GVAR(compass_start) = QGVAR(compass_start);
        GVAR(compass_loop) = QGVAR(compass_loop);
        GVAR(compass_end) = QGVAR(compass_end);
        GVAR(watch) = QGVAR(watch);
        GVAR(clacker) = QGVAR(clacker);
        GVAR(nvg_up) = QGVAR(nvg_up);
        GVAR(nvg_down) = QGVAR(nvg_down);
    };
    class Actions {
        class NoActions: ManActions {
            GVAR(map_start)[] = {QGVAR(map_start), "Gesture"};
            GVAR(map_loop)[] = {QGVAR(map_loop), "Gesture"};
            GVAR(map_end)[] = {QGVAR(map_end), "Gesture"};
            GVAR(compass_start)[] = {QGVAR(compass_start), "Gesture"};
            GVAR(compass_loop)[] = {QGVAR(compass_loop), "Gesture"};
            GVAR(compass_end)[] = {QGVAR(compass_end), "Gesture"};
            GVAR(watch)[] = {QGVAR(watch), "Gesture"};
            GVAR(clacker)[] = {QGVAR(clacker), "Gesture"};
            GVAR(nvg_up)[] = {QGVAR(nvg_up), "Gesture"};
            GVAR(nvg_down)[] = {QGVAR(nvg_down), "Gesture"};
        };
    };
};
