#include "script_component.hpp"

player addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];
    _unit setVariable [QGVAR(corpse), _corpse, true];
}];
