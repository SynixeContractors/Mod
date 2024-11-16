// Some code used from https://github.com/16AA-Milsim/ACRE-Persistence under GPLv3

params ["_data"];

private _radios = [] call acre_api_fnc_getCurrentRadioList;
private _sortedRadios = [];
{
    _x params ["_baseType"];
    _foundRadio = _radios findIf {
        [_x] call acre_api_fnc_getBaseRadio isEqualTo _baseType && !(_x in _sortedRadios)
    };
    if (_foundRadio != -1) then {
        _sortedRadios pushBack (_radios select _foundRadio);
    };
} forEach _data;
_radios = _sortedRadios;
[_radios + (_radios - _sortedRadios)] call acre_api_fnc_setMultiPushToTalkAssignment;
{
    (_data select _forEachIndex) params ["", "_channel", "_volume", "_spatial"];
    [_x, _channel] call acre_api_fnc_setRadioChannel;
    [_x, _volume] call acre_api_fnc_setRadioVolume;
    [_x, _spatial] call acre_api_fnc_setRadioSpatial;
} forEach _radios;
