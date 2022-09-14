#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(clientId) = "2";

    // publish Direct Play clientId to clients
    addMissionEventHandler ["PlayerConnected", {
        params ["", "", "", "", "_ownerId", "_clientIdStr"];

        // CBA events do not support client Id
        missionNamespace setVariable [QGVAR(clientId), _clientIdStr, _ownerId];
    }];
};

[
    "Synixe Utilities",
    QGVAR(screenshot),
    "HUD Free Screenshot",
    { call FUNC(screenshot); },
    "", [DIK_F11, [false, false, false]]
] call CBA_fnc_addKeybind;

GVAR(screenshotMode) = false;
[
    "Synixe Utilities",
    QGVAR(screenshotToggle),
    "Toggle Screenshot Mode",
    { call FUNC(screenshotMode); },
    "", [DIK_F10, [false, false, false]]
] call CBA_fnc_addKeybind;

[
    QGVAR(mission_start_time),
    "SLIDER",
    "UTC Mission Start Time",
    "Synixe - Missions",
    [0, 23, 2, 0, false],
    2,
    {},
    true
] call CBA_fnc_addSetting;


if (hasInterface) then {
    GVAR(playerMarkerIdx) = 0;
    GVAR(clientId) = "";
};

ADDON = true;
