#include "script_component.hpp"

params ["_display"];

private _loadout = getUnitLoadout ace_arsenal_center;
[ace_arsenal_center, _loadout, _loadout] call FUNC(handleLoadout);
