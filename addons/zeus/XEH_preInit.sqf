#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(addMasks) = false;

["ModuleCurator_F", "Init", {
    params ["_logic"];
    _logic addEventHandler ["CuratorObjectPlaced", {call FUNC(handleObjectPlaced)}];
}, true, [], true] call CBA_fnc_addClassEventHandler;

ADDON = true;
