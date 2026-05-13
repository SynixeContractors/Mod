#include "script_component.hpp"

if !(hasInterface) exitWith {};

params ["_display"];

_display displayAddEventHandler ["KeyDown", {
    params ["", "_key"];
    private _actions = ["showMap", "compass", "compassToggle", "watch", "watchToggle", "gear", "diary", "tasks", "nightVision"];
    private _index = _actions findIf { _key in actionKeys _x };
    if (_index == -1) exitWith {};

    if (call FUNC(canAnimate)) exitWith {};

    true
}];
