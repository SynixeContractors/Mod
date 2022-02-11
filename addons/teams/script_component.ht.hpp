#define COMPONENT teams
#include "\{{project.mainprefix}}\{{project.prefix}}\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_TEAMS
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TEAMS
#endif

#include "\{{project.mainprefix}}\{{project.prefix}}\addons\main\script_macros.hpp"
