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

    GVAR(members) = createHashMap;
};

[
    "Synixe Utilities",
    QGVAR(screenshot),
    "HUD Free Screenshot",
    { call FUNC(screenshot); },
    "", [DIK_F11, [false, false, false]]
] call CBA_fnc_addKeybind;

if (hasInterface) then {
    GVAR(playerMarkerIdx) = 0;
    GVAR(clientId) = "";
};

ADDON = true;
