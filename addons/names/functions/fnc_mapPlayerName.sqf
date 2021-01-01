#include "script_component.hpp"

params ["_control"];

_control ctrlSetText ([ace_player] call FUNC(getFullname));
