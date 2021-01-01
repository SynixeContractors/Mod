// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX synixe_contractors
#define SUBPREFIX addons

#include "script_version.hpp"

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.56

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Synixe - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Synixe - COMPONENT)
#endif
