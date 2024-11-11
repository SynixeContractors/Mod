#include "..\script_component.hpp"
/*
 * Author: Brett
 * Checks if a unit should surrender
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason <STRING>
 *
 * Return Value:
 * None
 */

params ["_unit", "_reason"];

if (captive _unit) exitWith {};
if (missionNamespace getVariable [QGVAR(disable), false]) exitWith {};

private _group = group _unit;

if (_group getVariable [QGVAR(disable), false]) exitWith {};

private _state = if (CBA_missionTime > (_group getVariable [QGVAR(stateTimeout), 0])) then {
    private _state = createHashMap;

    ([_group] call FUNC(nearbyForces)) params ["_fighters", "_hostiles"];
    _state set ["fighters", _fighters];
    _state set ["hostiles", _hostiles];

    _group setVariable [QGVAR(state), _state];
    _group setVariable [QGVAR(stateTimeout), CBA_missionTime + 2];
    _state
} else {
    _group getVariable [QGVAR(state), createHashMap]
};

private _base = (_unit skill "courage") * 3;
_base = _base + (parseNumber (currentWeapon _unit != "")) * 3;
_base = _base + parseNumber (vest _unit != "");
_base = _base + parseNumber (headgear _unit != "");
_base = _base + parseNumber (damage _unit < 0.5);

private _difference = (_state getOrDefault ["fighters", 0]) - (_state getOrDefault ["hostiles", 0]);
if (_difference > 0) then {
    _difference = _difference * 3;
};
_base = _base + _difference;

switch (_reason) do {
    case "stun": {
        _base = _base - ((missionNamespace getVariable [QGVAR(influenceStun), 6]) * (_group getVariable [QGVAR(onStunMultiplier), 0.5]));
    };
    case "hit": {
        _base = _base - ((missionNamespace getVariable [QGVAR(influenceHit), 3]) * (_group getVariable [QGVAR(onHitMultiplier), 0.5]));
    };
    case "supressed": {
        _base = _base - ((missionNamespace getVariable [QGVAR(influenceSupressed), 1]) * (_group getVariable [QGVAR(onSuppressMultiplier), 0.5]));
    };
    case "speak": {
        _base = _base - ((missionNamespace getVariable [QGVAR(influenceSpeak), 1]) * (_group getVariable [QGVAR(onSpeakMultiplier), 0.5]));
    };
    case "aim": {
        _base = _base - ((missionNamespace getVariable [QGVAR(influenceAim), 0.5]) * (_group getVariable [QGVAR(onAimMultiplier), 0.5]));
    };
};

private _random = random (missionNamespace getVariable [QGVAR(roll), 500]);
private _check = 15 - _base;

if (_random < _check) then {
    [QGVAR(surrendered), [_unit, _check, _random]] call CBA_fnc_globalEvent;
    ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
    if (_group getVariable [QGVAR(rallyLoop), 0] isNotEqualTo 0) exitWith {};
    _group setVariable [QGVAR(rallyLoop), [{
        params ["_args", "_handle"];
        _args params ["_group"];

        ([_group, 100] call FUNC(nearbyForces)) params ["_fighters", "_hostiles"];

        private _roll = _group getVariable [QGVAR(canRallyMultiplier), 0.5] < random 1;
        if (_hostiles < 1 || {_roll && _fighters >= _hostiles * random 2}) then {
            {
                if (!captive _x) then {
                    continue;
                };
                ["ACE_captives_setSurrendered", [_x, false], _x] call CBA_fnc_targetEvent;
            } forEach units _group;
            _group setVariable [QGVAR(rallyLoop), nil];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    }, 15, [_group]] call CBA_fnc_addPerFrameHandler];
};
