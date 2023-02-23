#include "script_component.hpp"

private _vehicle = if (getConnectedUAV ace_player isNotEqualTo objNull) then {
    // need to fix with https://community.bistudio.com/wiki/UAVControl
    getConnectedUAV ace_player
} else {
    vehicle ace_player
};

if (_vehicle isEqualTo ace_player) exitWith {};

private _targets = [];
{
    if ((_x select 3) isNotEqualTo []) then {
        _targets pushBackUnique (_x select 0);
    };
} forEach (getSensorTargets _vehicle);

if (count (_vehicle isVehicleSensorEnabled "LaserSensorComponent") > 0) then {
    // Display ACE laser codes
    {
        _x params ["_source"];
        private _target = laserTarget _source;
        if (_target in _targets) then {
            drawIcon3D ["", [1,1,1,1], ASLToAGL getPosASLVisual _target, 0, -0.5, 0, format ["%1", _source getVariable ["ace_laser_code", 1111]], 1, 0.035, GUNNER_FONT];
        };
    } forEach (values ace_laser_laserEmitters);
};

if (count (_vehicle isVehicleSensorEnabled "VisualSensorComponent") > 0) then {
    // Markers
    {
        if (markerShape _x != "ICON") then { continue };
        if (worldToScreen (markerPos [_x, true]) isEqualTo []) then { continue };
        if (markerShape _x == "Empty") then { continue };

        private _type = markerType _x;
        private _icon = GVAR(iconCache) getOrDefault [_type, "-"];
        if (_icon isEqualTo "-") then {
            _icon = getText (configFile >> "CfgMarkers" >> _type >> "icon");
            GVAR(iconCache) set [_type, _icon];
        };
        private _colorType = markerColor _x;
        private _color = GVAR(colorCache) getOrDefault [_colorType, []];
        if (_color isEqualTo []) then {
            private _color = getArray (configFile >> "CfgMarkerColors" >> _colorType >> "color");
            GVAR(colorCache) set [_colorType, _color];
        };
        _color set [3, markerAlpha _x];
        private _pos = markerPos [_x, true];
        drawIcon3D [_icon, _color, _pos, 1, 1, 0, format ["%1 (%2)", markerText _x, round (_vehicle distance _pos)], 1, 0.035, GUNNER_FONT];
    } forEach allMapMarkers;
};

// Compass
if (GVAR(compassEnabled)) then {
    private _center = screenToWorld [0.5,0.5];
    {
        _x params ["_letter", "_color", "_offset"];
        drawIcon3D [
            "",
            _color,
            _center vectorAdd (_offset vectorMultiply (5 * GVAR(compassSpread))),
            0,
            0,
            0,
            _letter,
            2,
            0.05,
            "PuristaMedium"
        ];
        for "_i" from 1 to 4 do {
            drawIcon3D [
                "",
                _color,
                _center vectorAdd (_offset vectorMultiply (_i * GVAR(compassSpread))),
                0,
                0,
                0,
                ".",
                2,
                0.05,
                "PuristaMedium"
            ];
        };
    } forEach [
        ["N",[1,1,1,1],[0,1,0]], 
        ["S",[1,1,1,0.7],[0,-1,0]], 
        ["E",[1,1,1,0.7],[1,0,0]], 
        ["W",[1,1,1,0.7],[-1,0,0]]
    ];
};
