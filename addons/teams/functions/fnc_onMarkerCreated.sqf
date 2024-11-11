#include "..\script_component.hpp"

params ["_marker"];

private _text = markerText _marker;
if (
    _text isEqualTo (name player) ||
    {(_text regexFind [format [PERSON_MARKER_REGEX, name player]]) isNotEqualTo []}
) then {
    switch (markerColor _marker) do {
        case "ColorRed": {
            player assignTeam "RED";
        };
        case "ColorBlue": {
            player assignTeam "BLUE";
        };
        case "ColorGreen": {
            player assignTeam "GREEN";
        };
        case "ColorYellow": {
            player assignTeam "YELLOW";
        };
        default {
            player assignTeam "MAIN";
        };
    };
    private _roles = [player] call synixe_common_fnc_findRoles;
    if (count _roles == 0) then {
        _roles = [""];
    };
    player setVariable ["diwako_dui_nametags_customGroup", _roles select 0, true];
    [QGVAR(roleUpdated), [player, _roles]] call CBA_fnc_globalEvent;
};
