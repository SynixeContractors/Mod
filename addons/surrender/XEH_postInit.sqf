#include "script_component.hpp"

["ace_grenades_flashbangedAI", {
    params ["_unit", "_strength"];
    [QGVAR(check), [_unit, "stun"]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["acre_sys_core_onRevealUnit", {
    params ["", "_unit"];
    [QGVAR(check), [_unit, "speak"]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

// Every machine adds the handlers to every unit (existing and future), so they fire
// wherever the unit is local, including after transfer to a headless client.
["CAManBase", "init", {
    params ["_unit"];
    [_unit] call FUNC(initUnit);
}, true, [], true] call CBA_fnc_addClassEventHandler;

if (isServer) then {
    [QGVAR(check), LINKFUNC(check)] call CBA_fnc_addEventHandler;

    [QGVAR(setDebug), {
        params ["_state"];
        missionNamespace setVariable [QGVAR(debug), _state, true];
    }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    GVAR(aimTimeout) = 0;
    [LINKFUNC(aimPFH), 0.1] call CBA_fnc_addPerFrameHandler;

    call FUNC(initDebug);
};
