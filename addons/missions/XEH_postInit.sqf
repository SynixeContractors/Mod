#include "script_component.hpp"

[QGVAR(say3D), {
    params ["_unit", "_sound"];
    _unit say3D _sound;
}] call CBA_fnc_addEventHandler;

["grad_civs_cars_car_added", {
    params ["_vehicle"];
    if (isNil "_vehicle") exitWith {};
    [_vehicle, true, true] call FUNC(carAlarm);
}] call CBA_fnc_addEventHandler;

["ace_grenades_flashbangedAI", {
    params ["_unit", "_strength"];
    [QGVAR(surrenderCheck), [_unit, "stun"]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["acre_sys_core_onRevealUnit", {
    params ["", "_unit"];
    [QGVAR(surrenderCheck), [_unit, "speak"]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

{
    if !(_x getVariable [QGVAR(surrenderDisabled), false]) then {
        [_x] call FUNC(surrenderInit);
    };
} forEach allGroups;

{
    if !(_x getVariable [QGVAR(alarmEHRemoved), false]) then {
        [_x, false, true] call FUNC(carAlarm);
    };
} forEach vehicles;

if (isServer) then {
    [QGVAR(surrenderCheck), LINKFUNC(surrenderCheck)] call CBA_fnc_addEventHandler;
};

["zen_curatorDisplayLoaded", {
    private _logic = getAssignedCuratorLogic player;
    if (isNil "_logic") exitWith {
        WARNING("No curator logic found when opening interface");
    };
    if (_logic getVariable [QGVAR(didInit), false]) exitWith {};
    _logic setVariable [QGVAR(didInit), true];
    _logic addEventHandler ["CuratorGroupPlaced", {
        params ["_curator", "_group"];
        [_group] call FUNC(surrenderInit);
    }];
    _logic addEventHandler ["CuratorObjectPlaced", {
        params ["_curator", "_entity"];
        [_entity, false, true] call FUNC(carAlarm);
    }];
}] call CBA_fnc_addEventHandler;
