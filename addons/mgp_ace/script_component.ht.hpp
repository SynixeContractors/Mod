#define COMPONENT mpg_ace
#define COMPONENT_BEAUTIFIED MGP ACE
#include "\{{project.mainprefix}}\{{project.prefix}}\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MGP_ACE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MGP_ACE
#endif

#include "\{{project.mainprefix}}\{{project.prefix}}\addons\main\script_macros.hpp"
