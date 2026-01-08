#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

GVAR(hitCache) = createHashMap;
GVAR(playerFiredEHID) = -1;

["unit", {
    params ["_newPlayer", "_oldPlayer"];
    if (GVAR(playerFiredEHID) != -1) then {
        _oldPlayer removeEventHandler ["Fired", GVAR(playerFiredEHID)];
    };
    GVAR(playerFiredEHID) = _newPlayer addEventHandler ["Fired", {_this call FUNC(firedPlayer)}];
    resetCamShake;
}] call CBA_fnc_addPlayerEventHandler;

ADDON = true;
