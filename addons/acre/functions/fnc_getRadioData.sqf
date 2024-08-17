// Some code used from https://github.com/16AA-Milsim/ACRE-Persistence under GPLv3

private _radios = [] call acre_api_fnc_getCurrentRadioList;
private _ptt = call acre_api_fnc_getMultiPushToTalkAssignment;
private _sortedRadios = [];
{
    private _pttRadio = _x;
    {
        if (_pttRadio == _x) then {
            _sortedRadios pushBack _x;
        };
    } forEach (_radios);
} forEach _ptt;
{
    if (_sortedRadios find _x == -1) then {
        _sortedRadios pushBack _x;
    };
} forEach _radios;
_radios = _sortedRadios;
private _data = [];

{
    if (_forEachIndex >= 6) exitWith {};
    _data pushBack [
        [_x] call acre_api_fnc_getBaseRadio,
        [_x] call acre_api_fnc_getRadioChannel,
        [_x] call acre_api_fnc_getRadioVolume,
        [_x] call acre_api_fnc_getRadioSpatial
    ];
} forEach _radios;

_data
