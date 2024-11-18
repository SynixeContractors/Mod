#include "script_component.hpp"

["ACE_weaponThrown", {
    params ["_unit", "_holder", "_data"];
    private _holders = _unit getVariable [QGVAR(holders), []];
    if (_holder in _holders) exitWith {};
    _holders pushBack _holder;
    _unit setVariable [QGVAR(holders), _holders, true];
}] call CBA_fnc_addEventHandler;
