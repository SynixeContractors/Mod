#include "..\script_component.hpp"

params ["_unit", "_params"];
_params params ["_container", "_count", "_drone"];

_container addMagazineAmmoCargo [QGVAR(battery), -1, _count];
[_drone, _count / 100] remoteExec ["setFuel", _drone];
[_unit, "MedicOther"] call ace_common_fnc_doGesture;
