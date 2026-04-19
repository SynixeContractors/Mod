params [
    ["_unit", objNull]
];
((getPosASL _unit) select 2) call ace_weather_fnc_calculateTemperatureAtHeight
