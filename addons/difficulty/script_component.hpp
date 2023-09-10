#define COMPONENT difficulty
#define COMPONENT_BEAUTIFIED Difficulty
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_DIFFICULTY
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DIFFICULTY
#endif

#include "..\main\script_macros.hpp"
