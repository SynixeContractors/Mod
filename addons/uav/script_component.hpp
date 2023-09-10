#define COMPONENT uav
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_UAV
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_UAV
#endif

#include "..\main\script_macros.hpp"
