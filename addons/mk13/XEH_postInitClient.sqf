#include "script_component.hpp"

GVAR(holder) = objNull;

// Big credit to KJW for these positions <3
GVAR(positions) = [
    [
        "spine3",
        [
            [-0.942853,0.330874,0.0362221],
            [-0.33272,-0.939935,-0.0747082]
        ],
        [-0.145057,-0.196157,0.06247]
    ],
    [
        "pelvis",
        [
            [-0.0943458,-0.427608,0.899012],
            [-0.967039,0.253845,0.0192545]
        ],
        [-0.252735,-0.122696,-0.1525394]
    ],
    [
        "spine3",
        [
            [-0.959775,-0.212544,0.18281],
            [-0.200409,0.976095,0.0826827]
        ],
        [0.0795696,0.2779,-0.314365]
    ],
    [
        "pelvis",
        [
            [-0.713304,0.700795,-0.00756299],
            [0.698764,0.710324,-0.0845198] 
        ],
        [-0.163846,-0.163029,-0.1981146]
    ],
    [
        "spine3",
        [
            [0.901187,0.00443262,0.433132],
            [0.0447066,-0.99544,-0.0828307]
        ],
        [-0.0853765,-0.324295,0.106977]
    ],
    [
        "spine3",
        [
            [0.748651,-0.66266,-0.012813],
            [-0.662772,-0.748614,-0.00845503]
        ],
        [-0.228363,-0.109022,0.067251]
    ]
];
GVAR(positionNames) = [
    "Back",
    "Side Sling",
    "Front Sling",
    "Breacher",
    "Backpack",
    "Back 2"
];

FUNC(show) = {
    params ["_unit"];
    if !(local _unit) exitWith {};
    if !(isNull GVAR(holder)) then {
        deleteVehicle GVAR(holder);
    };
    private _position = GVAR(positions) select (_unit getVariable [QGVAR(position), 0]);
    private _holder = createVehicle [QGVAR(Holder),[0,0,0]];
    _holder addWeaponCargoGlobal [handgunWeapon _unit, 1];
    _holder setDamage 1;
    _holder attachTo [_unit, _position#2, _position#0, true];
    _holder setVectorDirAndUp _position#1;
    GVAR(holder) = _holder;
};

FUNC(handleWeapon) = {
    params ["_unit"];
    if !(local _unit) exitWith {};
    private _has = handgunWeapon _unit in ["vtf_MK13", "vtf_MK13_black"];
    private _held = currentWeapon _unit == handgunWeapon _unit;
    private _shown = !(isNull GVAR(holder));

    if (!_has && !_shown) exitWith {};
    if (_has && _held && !_shown) exitWith {};
    if (_has && !_held && _shown) exitWith {};

    if (_has && !_held && !_shown) exitWith {
        [_unit] call FUNC(show);
    };

    // Remove the weapon holder
    deleteVehicle GVAR(holder);
    GVAR(holder) = objNull;
};

["weapon", LINKFUNC(handleWeapon), true] call CBA_fnc_addPlayerEventHandler;

[[0,2,3,4,5], QGVAR(position), "Mk13 Sling", [
    ["position", "Position", {true}, "", {GVAR(positionNames) select ((_this select 0) getVariable [QGVAR(position), 0])}],
    ["next", "Next", {true}, "", {}, {
        private _position = (_this select 0) getVariable [QGVAR(position), 0];
        private _next = _position + 1;
        if (_next >= count GVAR(positions)) then {
            _next = 0;
        };
        (_this select 0) setVariable [QGVAR(position), _next];
        [ace_player] call FUNC(show);
    }]
], {
    handgunWeapon (_this select 0) in ["vtf_MK13", "vtf_MK13_black"]
}] call ace_arsenal_fnc_addAction;

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extradata"];
    private _pos = _extradata getOrDefault [QGVAR(position), -1];
    if (_pos != -1) then {
        _unit setVariable [QGVAR(position), _pos min (count GVAR(positions) - 1)];
        [ace_player] call FUNC(show);
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "_loadout", "_extradata"];
    private _pos = _unit getVariable [QGVAR(position), -1];
    if (_pos != -1) then {
        _extradata set [QGVAR(position), _pos];
    };
}] call CBA_fnc_addEventHandler;
