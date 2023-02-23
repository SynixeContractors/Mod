#include "script_component.hpp"

params ["_unit"];

private _ret = [];

{
    private _text = markerText _x;
    private _match = _text regexFind [format [PERSON_MARKER_REGEX, name _unit]];
    if (_match isNotEqualTo []) then {
        _ret = [];
        {
            _x deleteAt 0;
            {
                _ret pushBackUnique _x#0;
            } foreach _x;
        } forEach _match;
    };
} forEach allMapMarkers;

_ret
