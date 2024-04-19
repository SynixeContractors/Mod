#include "script_component.hpp"

[QGVAR(say3D), {
    params ["_unit", "_sound"];
    _unit say3D _sound;
}] call CBA_fnc_addEventHandler;

[QGVAR(speak), LINKFUNC(speak_internal)] call CBA_fnc_addEventHandler;

["grad_civs_cars_car_added", {
    params ["_vehicle"];
    if (isNil "_vehicle") exitWith {};
    [_vehicle, true, true] call FUNC(carAlarm);
}] call CBA_fnc_addEventHandler;

{
    if !(_x getVariable [QGVAR(alarmEHRemoved), false]) then {
        [_x, false, true] call FUNC(carAlarm);
    };
} forEach vehicles;

["zen_curatorDisplayLoaded", {
    private _logic = getAssignedCuratorLogic player;
    if (isNil "_logic") exitWith {
        WARNING("No curator logic found when opening interface");
    };
    if (_logic getVariable [QGVAR(didInit), false]) exitWith {};
    _logic setVariable [QGVAR(didInit), true];
    _logic addEventHandler ["CuratorObjectPlaced", {
        params ["_curator", "_entity"];
        [_entity, false, true] call FUNC(carAlarm);
    }];
}] call CBA_fnc_addEventHandler;
