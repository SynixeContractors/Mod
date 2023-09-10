#define COMPONENT tagging
#define COMPONENT_BEAUTIFIED Tagging
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_TAGGING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TAGGING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TAGGING
#endif

#include "..\main\script_macros.hpp"

#define MARKER_COLORS   ["ColorRed", "ColorGreen", "ColorBlue", "ColorBlack"]
#define TEXTURE_COLORS  ["red", "green", "blue", "black"]
