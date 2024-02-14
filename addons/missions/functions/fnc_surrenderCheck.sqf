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
if (missionNamespace getVariable [QGVAR(disableSurrender), false]) exitWith {};

private _group = group _unit;

private _state = if (CBA_missionTime > (_group getVariable [QGVAR(stateTimeout), 0])) then {
    private _state = createHashMap;

    ([_group] call FUNC(surrenderNearbyForces)) params ["_fighters", "_hostiles"];
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
    _difference = _difference * 2;
};
_base = _base + _difference;

switch (_reason) do {
    case "stun": {
        _base = _base - ((missionNamespace getVariable [QGVAR(surrenderInfluenceStun), 10]) * (_group getVariable [QGVAR(surrenderOnStunMultiplier), 0.5]));
    };
    case "hit": {
        _base = _base - ((missionNamespace getVariable [QGVAR(surrenderInfluenceHit), 4]) * (_group getVariable [QGVAR(surrenderOnHitMultiplier), 0.5]));
    };
    case "supressed": {
        _base = _base - ((missionNamespace getVariable [QGVAR(surrenderInfluenceSupressed), 1]) * (_group getVariable [QGVAR(surrenderOnSuppressMultiplier), 0.5]));
    };
    case "speak": {
        _base = _base - ((missionNamespace getVariable [QGVAR(surrenderInfluenceSpeak), 1]) * (_group getVariable [QGVAR(surrenderOnSpeakMultiplier), 0.5]));
    };
    case "aim": {
        _base = _base - ((missionNamespace getVariable [QGVAR(surrenderInfluenceAim), 0.5]) * (_group getVariable [QGVAR(surrenderOnAimMultiplier), 0.5]));
    };
};

private _random = random (missionNamespace getVariable [QGVAR(surrenderRoll), 500]);
private _check = 15 - _base;

if (_random < _check) then {
    [QGVAR(surrendered), [_unit, _check, _random]] call CBA_fnc_globalEvent;
    ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
    _group setVariable [QGVAR(rallyLoop), [{
        params ["_args", "_handle"];
        _args params ["_group"];

        ([_group, 100] call FUNC(surrenderNearbyForces)) params ["_fighters", "_hostiles"];

        private _roll = _group getVariable [QGVAR(surrenderCanRallyMultiplier), 0.5] < random 1;
        if (_hostiles < 1 || {_roll && _fighters >= _hostiles * random 2}) then {
            {
                ["ACE_captives_setSurrendered", [_x, false], _x] call CBA_fnc_targetEvent;
            } forEach units _group;
            _group setVariable [QGVAR(rallyLoop), nil];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    }, 15, [_group]] call CBA_fnc_addPerFrameHandler];
};
