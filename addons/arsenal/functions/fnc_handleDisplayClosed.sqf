#include "..\script_component.hpp"

["loadout", GVAR(loadoutEH)] call CBA_fnc_removePlayerEventHandler;
GVAR(loadoutEH) = nil;

GVAR(arsenalDisplay) = nil;
