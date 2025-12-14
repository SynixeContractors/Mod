#include "..\script_component.hpp"

params ["_unit", "_new", "_old"];

GVAR(itemCache) = [];
{
    if ([_x] call acre_api_fnc_isRadio) then {
        GVAR(itemCache) pushBack ([_x] call acre_api_fnc_getBaseRadio);
    } else {
        GVAR(itemCache) pushBack _x;
    };
} forEach (items _unit) + (magazines _unit);

if !(GVAR(enabled)) exitWith {
    {
        private _ctrl = GVAR(arsenalDisplay)#0 displayCtrl _x;
        _ctrl ctrlShow false;
        _ctrl ctrlCommit 0.15;
    } forEach CUSTOM_BOXES;
};

private _yOffset = 0;

private _gearTypes = [
    [[_unit] call FUNC(getMissingGear), IDC_requiredGearBox, IDC_requiredGearTitle, IDC_requiredGearText],
    [[_unit] call FUNC(getSpecialGear), IDC_specialGearBox, IDC_specialGearTitle, IDC_specialGearText],
    [[_unit] call FUNC(getNightGear), IDC_nightGearBox, IDC_nightGearTitle, IDC_nightGearText]
];

private _baseYOffset = 1.8;
{
    _x params ["_missingItems", "_idcBox", "_idcTitle", "_idcText"];
    
    if (_missingItems isEqualTo []) then {
        {
            private _ctrl = GVAR(arsenalDisplay)#0 displayCtrl _x;
            _ctrl ctrlShow false;
            _ctrl ctrlCommit 0.15;
        } forEach [_idcBox, _idcTitle];
    } else {
        private _ctrlTitle = GVAR(arsenalDisplay)#0 displayCtrl _idcTitle;
        _ctrlTitle ctrlSetPosition [
            safeZoneX + safeZoneW - (94 + 48) * GRID_W,
            safeZoneY + (_baseYOffset + _yOffset) * GRID_H,
            47 * GRID_W,
            5 * GRID_H
        ];
        _ctrlTitle ctrlCommit 0;

        private _ctrlBox = GVAR(arsenalDisplay)#0 displayCtrl _idcBox;
        _ctrlBox ctrlSetPosition [
            safeZoneX + safeZoneW - (94 + 48) * GRID_W,
            safeZoneY + (_baseYOffset + _yOffset) * GRID_H,
            47 * GRID_W,
            (5 + (4 * count _missingItems)) * GRID_H
        ];
        _ctrlBox ctrlCommit 0;
        _yOffset = _yOffset + (4 * count _missingItems) + 6;

        private _ctrlText = GVAR(arsenalDisplay)#0 displayCtrl _idcText;
        _ctrlText ctrlSetStructuredText parseText (_missingItems joinString "<br/>");
        _ctrlText ctrlSetPosition [
            0 * GRID_W,
            5 * GRID_H,
            45 * GRID_W,
            (4 * count _missingItems) * GRID_H
        ];
        _ctrlText ctrlCommit 0;
        
        {
            private _ctrl = GVAR(arsenalDisplay)#0 displayCtrl _x;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0.15;
        } forEach [_idcBox, _idcTitle];
    };
} forEach _gearTypes;

