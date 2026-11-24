#include "..\script_component.hpp"
/*
 * Author: Brett
 * Draws the surrender debug text above units near the Zeus camera.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

{
    private _unit = _x;
    private _group = group _unit;
    private _pos = _unit modelToWorldVisual (_unit selectionPosition "head") vectorAdd [0, 0, 0.6];

    private _text = "";
    private _color = [1, 1, 1, 0.9];
    switch (true) do {
        case (captive _unit): {
            _text = "Captive";
            _color = [0.5, 0.5, 0.5, 0.9];
        };
        case (!GVAR(enabled) || {_group getVariable [QGVAR(disable), false]}): {
            _text = "Surrender disabled";
            _color = [0.5, 0.5, 0.5, 0.9];
        };
        default {
            private _last = _unit getVariable [QGVAR(lastCheck), []];
            if (_last isEqualTo []) then {
                _text = "No checks yet";
            } else {
                _last params ["_reason", "_check", "_roll", "_success", "_time"];
                private _chance = 0 max (_check / _roll * 100) min 100;
                _text = format ["%1: %2%3 (%4s ago)", _reason, _chance toFixed 1, "%", round (CBA_missionTime - _time)];
                if (_success) then { _color = [0.2, 1, 0.2, 0.9]; };
            };
        };
    };

    drawIcon3D ["", _color, _pos, 0, 0, 0, _text, 1, 0.03, "PuristaMedium", "center"];
} forEach GVAR(debugUnits);
