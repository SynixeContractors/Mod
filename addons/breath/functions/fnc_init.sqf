#include "..\script_component.hpp"

params ["_unit"];

[{ _this call FUNC(ambient) }, [_unit], random 10] call CBA_fnc_waitAndExecute;
