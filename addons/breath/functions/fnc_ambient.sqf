#include "..\script_component.hpp"

#define IDLE_INTERVAL 10

params ["_unit"];

if (isNull _unit) exitWith {};
if !(alive _unit) exitWith {};

// Checks that still schedule another check

private _lastBreath = _unit getVariable [QGVAR(lastBreath), -60];
private _timeSinceLastBreath = time - _lastBreath;
if (_timeSinceLastBreath < IDLE_INTERVAL) exitWith {
    [{ _this call FUNC(ambient) }, [_unit], IDLE_INTERVAL - _timeSinceLastBreath] call CBA_fnc_waitAndExecute
};

private _fnc_schedule = {
    [{ _this call FUNC(ambient) }, [_unit], IDLE_INTERVAL + random 2] call CBA_fnc_waitAndExecute;
};

if !(simulationEnabled _unit) exitWith { call _fnc_schedule };
if (eyePos _unit select 2 < 0.1) exitWith { call _fnc_schedule };
if (getPosASL _unit distance getPosASL player > 100) exitWith { call _fnc_schedule };

private _temp = [_unit] call FUNC(temp);
if (_temp > 7.2) exitWith { call _fnc_schedule };

private _damage = damage _unit;
switch (true) do {
    case (_damage > 0.4): {
        [4, random [3,4,5]]
    };
    case (_damage > 0.1): {
        [2, random [3,6,6]]
    };
    default {
        [1, random [3,6,12]]
    };
} params ["_soundId", "_interval"];
_interval = _interval + 3;

if (speed _unit > 10) then {
    _soundId = 1;
    _interval = 2 + random 1;
} else {
    if (isPlayer _unit) then {
        private _stamina = 1 - (if (_unit == ace_player) then {
            ace_advanced_fatigue_anReserve / 2300
        } else {
            _unit getVariable [QGVAR(stamina), 1]
        });
        _interval = _interval - (0.5 * _stamina);
    } else {
        private _fatigue = getFatigue _unit;
        _interval = _interval - (0.5 * _fatigue);
        if (_fatigue > 0.5) then {
            _soundId = 1;
        } else {
            private _behaviour = behaviour _unit;
            _interval = _interval * (switch (_behaviour) do {
                case "AWARE": {
                    0.8
                };
                case "COMBAT": {
                    0.6
                };
                default {
                    1
                };
            });
        };
    };
};

[_unit, _soundId, _temp] spawn FUNC(showBreath);

[{ _this call FUNC(ambient) }, [_unit], _interval] call CBA_fnc_waitAndExecute;
