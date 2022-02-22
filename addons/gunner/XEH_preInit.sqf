#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(iconCache) = createHashMap;
GVAR(colorCache) = createHashMap;

GVAR(compassEnabled) = false;
GVAR(compassSpread) = 4;

ADDON = true;
