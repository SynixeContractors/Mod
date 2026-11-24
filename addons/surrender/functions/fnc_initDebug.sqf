#include "..\script_component.hpp"
/*
 * Author: Brett
 * Sets up the Zeus-only surrender debug overlay.
 * Toggled from the ZEN context menu (Dynamic Surrender > Toggle Debug).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

GVAR(debugUnits) = [];

// Refresh the list of units near the Zeus camera once a second
[{
    if !(missionNamespace getVariable [QGVAR(debug), false]) exitWith { GVAR(debugUnits) = []; };
    if (isNull findDisplay 312) exitWith { GVAR(debugUnits) = []; };
    GVAR(debugUnits) = (positionCameraToWorld [0, 0, 0]) nearEntities ["CAManBase", 300] select {
        alive _x && {!isPlayer _x}
    };
}, 1] call CBA_fnc_addPerFrameHandler;

addMissionEventHandler ["Draw3D", {
    if (GVAR(debugUnits) isEqualTo []) exitWith {};
    call FUNC(debugDraw);
}];
