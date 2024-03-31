#include "..\script_component.hpp"

params ["_unit", "_drone"];

private _children = [];

{
    private _container = _x;
    {
        _x params ["_class", "_count"];
        if (_class != QGVAR(battery)) exitWith {
            continue;
        };
        _children pushBack [
            [
                format ["battery_%1", _forEachIndex],
                format ["%1%2", _count, "%"],
                "z\ace\addons\logistics_uavbattery\ui\UAV_battery_ca.paa",
                { 
                    [_this select 0, _this select 2] call FUNC(insertBattery);
                },
                { true },
                {},
                [_container,_count,_drone]
            ] call ace_interact_menu_fnc_createAction,
            [],
            ACE_Player
        ];
    } forEach magazinesAmmoCargo _container;
} forEach [
    uniformContainer _unit,
    vestContainer _unit,
    backpackContainer _unit
];

_children
