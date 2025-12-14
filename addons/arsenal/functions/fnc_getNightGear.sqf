#include "..\script_component.hpp"

params ["_unit"];

private _missing = [];

(date call BIS_fnc_sunriseSunsetTime) params ["_sunrise", "_sunset"];

private _now = dayTime;

// Check if it's between sunset and sunrise, with sunrise more than 45 minutes away
private _isBetweenSunsetAndSunrise = (_now > _sunset) || (_now < _sunrise);
private _timeUntilSunrise = if (_now < _sunrise) then {
    _sunrise - _now
} else {
    (24 - _now) + _sunrise
};
private _sunriseMoreThan45Min = _timeUntilSunrise > (45 / 60);

// Check if within 2 hours of sunset
private _withinTwoHoursOfSunset = (_now < _sunset) && ((_sunset - _now) < 2);

// Exit if neither condition is met
if !((_isBetweenSunsetAndSunrise && _sunriseMoreThan45Min) || _withinTwoHoursOfSunset) exitWith {[]};

[["Chemlight_green"],             4, "Chemlight (Green)", _missing] call FUNC(countItem);
[["Chemlight_red"],               4, "Chemlight (Red)", _missing] call FUNC(countItem);
[["Chemlight_yellow"],            4, "Chemlight (Yellow)", _missing] call FUNC(countItem);
[["Chemlight_blue"],              4, "Chemlight (Blue)", _missing] call FUNC(countItem);
[["ACE_Chemlight_UltraHiOrange"], 2, "Chemlight (Ultra Hi Orange)", _missing] call FUNC(countItem);

[["ACE_Flashlight_MX991", "ACE_Flashlight_XL50", "ACE_Flashlight_Maglite_ML300L", "acc_flashlight", "acc_flashlightMax",
    "saber_light_arid_lxWS", "saber_light_lxWS", "saber_light_khaki_lxWS", "saber_light_lush_lxWS", "saber_light_sand_lxWS", "saber_light_snake_lxWS"],
    1, "Flashlight", _missing] call FUNC(countItem);

_missing
