// Some code used from https://github.com/16AA-Milsim/ACRE-Persistence under GPLv3

params ["_data"];

private _radios = [] call acre_api_fnc_getCurrentRadioList;

// Match each saved entry to a radio of the same base type, keeping them paired
private _matched = [];
private _used = [];
{
    private _entry = _x;
    _entry params ["_baseType"];
    private _index = _radios findIf {
        !(_x in _used) && {([_x] call acre_api_fnc_getBaseRadio) isEqualTo _baseType}
    };
    if (_index != -1) then {
        private _radio = _radios select _index;
        _used pushBack _radio;
        _matched pushBack [_radio, _entry];
    };
} forEach _data;

// Saved radios first (in saved PTT order), then any radios that weren't saved
[_used + (_radios - _used)] call acre_api_fnc_setMultiPushToTalkAssignment;

{
    _x params ["_radio", "_entry"];
    _entry params ["", "_channel", "_volume", "_spatial"];
    [_radio, _channel] call acre_api_fnc_setRadioChannel;
    [_radio, _volume] call acre_api_fnc_setRadioVolume;
    [_radio, _spatial] call acre_api_fnc_setRadioSpatial;
} forEach _matched;
