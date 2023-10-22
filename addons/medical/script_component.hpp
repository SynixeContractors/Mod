#define COMPONENT medical
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#include "..\main\script_macros.hpp"
