#define COMPONENT zeus
#define COMPONENT_BEAUTIFIED Zeus
#include "\z\synixe_contractors\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_ZEUS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ZEUS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ZEUS
#endif

#include "\z\synixe_contractors\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define GETMVAR(var1,var2) (missionNamespace GETVAR_SYS(var1,var2))

#define POS_EDGE(DEFAULT,MOVED) ([ARR_2(DEFAULT,MOVED)] select GETMVAR(zen_editor_moveDisplayToEdge,false))
