#include "script_component.hpp"

["ace_grenades_flashbangedAI", {
    params ["_unit", "_strength"];
    [QGVAR(check), [_unit, "stun"]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["acre_sys_core_onRevealUnit", {
    params ["", "_unit"];
    [QGVAR(check), [_unit, "speak"]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

{
    if !(_x getVariable [QGVAR(disabled), false]) then {
        [_x] call FUNC(init);
    };
} forEach allGroups;

if (isServer) then {
    [QGVAR(check), LINKFUNC(check)] call CBA_fnc_addEventHandler;
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
        [_group] call FUNC(init);
    }];
}] call CBA_fnc_addEventHandler;
