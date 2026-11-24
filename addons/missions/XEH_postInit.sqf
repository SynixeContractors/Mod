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

// Every machine sets up every car (existing and future, including Zeus placed),
// so the Hit handler exists wherever the car is local
["Car_F", "init", {
    params ["_vehicle"];
    [_vehicle, false, true] call FUNC(carAlarm);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["crate_client_missions_introText", {
    ["synixe_start"] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
