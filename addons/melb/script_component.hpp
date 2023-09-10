#define COMPONENT melb
#define COMPONENT_BEAUTIFIED MELB
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_MELB
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MELB
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MELB
#endif

#include "..\main\script_macros.hpp"

#define MODE_DEFAULT [0, 0]
#define ZOOM_DEFAULT 0.8
#define ZOOM_PREOPEN 28 // value read before camera is first used
