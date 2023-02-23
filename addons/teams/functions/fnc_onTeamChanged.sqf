#include "script_component.hpp"

{
    private _text = markerText _x;
    if (
        _text isEqualTo (name player) ||
        {(_text regexFind [format [PERSON_MARKER_REGEX, name player]]) isNotEqualTo []}
    ) then {
        _x setMarkerColor (
            switch (assignedTeam player) do {
                case "RED": {
                    "ColorRed"
                };
                case "BLUE": {
                    "ColorBlue"
                };
                case "GREEN": {
                    "ColorGreen"
                };
                case "YELLOW": {
                    "ColorYellow"
                };
                default {
                    "ColorWhite"
                };
            }
        );
    };
} forEach allMapMarkers;
