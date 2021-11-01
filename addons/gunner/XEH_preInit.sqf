#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(iconCache) = createHashMap;
GVAR(colorCache) = createHashMap;

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

GVAR(compassEnabled) = false;
GVAR(compassSpread) = 4;

ADDON = true;
