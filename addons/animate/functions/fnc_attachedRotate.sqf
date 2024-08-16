#include "..\script_component.hpp"

params [
    "_object",
    "_rotations",
    ["_dirX", 0],
    ["_dirY", 1],
    ["_dirZ", 0],
    ["_upX", 0],
    ["_upY", 0],
    ["_upZ", 1]
];
[] params [["_aroundX", _rotations#0], ["_aroundY", _rotations#1], ["_aroundZ", (360 - (_rotations#2)) - 360]];
if (_aroundX != 0) then {_dirY = cos _aroundX; _dirZ = sin _aroundX; _upY = -sin _aroundX; _upZ = cos _aroundX};
if (_aroundY != 0) then {_dirX = _dirZ * sin _aroundY; _dirZ = _dirZ * cos _aroundY; _upX = _upZ * sin _aroundY; _upZ = _upZ * cos _aroundY};
if (_aroundZ != 0) then {
    [_dirX, _upX] params ["_dirXTemp", "_upXTemp"];
    _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
    _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);
    _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
    _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
};
_object setVectorDirAndUp [[_dirX, _dirY, _dirZ],[_upX, _upY, _upZ]];
