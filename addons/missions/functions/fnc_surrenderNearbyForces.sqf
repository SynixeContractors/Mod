#include "..\script_component.hpp"
/*
 * Author: Brett
 * Checks if a unit should surrender
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Range <NUMBER>, default: 150
 *
 * Return Value:
 * None
 */

params ["_group", ["_range", 150]];

private _hostiles = 0;
private _fighters = 0;
private _side = side _group;

{
    private _xSide = side _x;
    if (_xSide == civilian) then {
        continue;
    };
    if (_xSide getFriend _side < 0.6 && !captive _x) then {
        _hostiles = _hostiles + 1;
        continue;
    };
    if (_xSide == _side && !captive _x) then {
        _fighters = _fighters + 1;
    };
} foreach ((getPos leader _group) nearEntities ["Man", _range]);

[_fighters, _hostiles]
