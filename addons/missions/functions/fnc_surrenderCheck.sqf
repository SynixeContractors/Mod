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

    private _fighters = 0;
    private _hostiles = 0;
    private _side = side _group;
    {
        if (side _x getFriend _side < 0.6 && !captive _x) then {
            _hostiles = _hostiles + 1;
        };
        if (side _x == _side && !captive _x) then {
            _fighters = _fighters + 1;
        };
    } foreach ((getPos leader _group) nearEntities 150);
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
_base = _base + (_difference * 3);

switch (_reason) do {
    case "stun": {
        _base = _base - (20 * (_group getVariable [QGVAR(surrenderOnStunMultiplier), 0.5]));
    };
    case "hit": {
        _base = _base - (10 * (_group getVariable [QGVAR(surrenderOnHitMultiplier), 0.5]));
    };
    case "supressed": {
        _base = _base - (2 * (_group getVariable [QGVAR(surrenderOnSuppressMultiplier), 0.5]));
    };
    case "speak": {
        _base = _base - (2 * (_group getVariable [QGVAR(surrenderOnSpeakMultiplier), 0.5]));
    };
    case "aim": {
        _base = _base - (1 * (_group getVariable [QGVAR(surrenderOnAimMultiplier), 0.5]));
    };
};

private _random = random 400;
private _check = 15 - _base;

if (_random < _check) then {
    ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
    _group setVariable [QGVAR(rallyLoop), [{
        params ["_args", "_handle"];
        _args params ["_group"];

        if (_group getVariable [QGVAR(surrenderCanRallyMultiplier), 0.5] < random 1) exitWith {};

        private _hostiles = 0;
        private _fighters = 0;
        private _side = side _group;
        {
            if (side _x getFriend _side < 0.6 && !captive _x) then {
                _hostiles = _hostiles + 1;
            };
            if (side _x == _side && !captive _x) then {
                _fighters = _fighters + 1;
            };
        } foreach ((getPos leader _group) nearEntities 100);

        if (_hostiles < 1 || _fighters >= _hostiles * random 3) then {
            {
                ["ACE_captives_setSurrendered", [_x, false], _x] call CBA_fnc_targetEvent;
            } forEach units _group;
            _group setVariable [QGVAR(rallyLoop), nil];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    }, 25, [_group]] call CBA_fnc_addPerFrameHandler];
};
