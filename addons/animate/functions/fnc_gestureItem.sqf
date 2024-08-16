#include "..\script_component.hpp"

params [
    "_unit",
    "_in",
    "_loop",
    ["_until", {}],
    ["_out", ""],
    ["_object", ""],
    ["_pos", [-0.02,0,-0.03]],
    ["_rot", [50,190,-120]]
];
private _duration = [_unit, _in, _loop, _until] call FUNC(gesturePlay);

private _object = createSimpleObject [_object, [0,0,0]];
_object attachTo [_unit, _pos, "leftHand", true];
[_object, _rot] call FUNC(attachedRotate);

if (_loop == "") exitWith {
    [{
        params ["_unit", "_object", "_out"];
        deleteVehicle _object;
        if (_out != "") then {
            _unit playActionNow _out;
        } else {
            _unit playActionNow "ace_common_stop";
        };
    }, [_unit, _object, _out], _duration] call CBA_fnc_waitAndExecute;
};

[{
    params ["","","","_until"];
    [_until, {
        params ["_unit", "_object", "_out"];
        deleteVehicle _object;
        if (_out != "") then {
            _unit playActionNow _out;
        } else {
            _unit playActionNow "ace_common_stop";
        };
    }, _this] call CBA_fnc_waitUntilAndExecute;
}, [_unit, _object, _out, _until], 0.1] call CBA_fnc_waitAndExecute;
