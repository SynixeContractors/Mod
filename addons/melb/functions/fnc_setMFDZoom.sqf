#include "..\script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Set MFD Zoom.
 *
 * Arguments:
 * 0: Zoom <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.3] call synixe_compat_melb_fnc_setMFDZoom
 *
 * Public: No
 */

params ["_zoom"];

GVAR(camera) camSetFov (0.3 / _zoom);
