#define MAINPREFIX x
#define PREFIX synixe

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCH
#define VERSION_AR MAJOR,MINOR,PATCH

#define REQUIRED_VERSION 2.06

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Synixe - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Synixe - COMPONENT)
#endif
