#include "..\script_component.hpp"

params ["_display", "_mapCtrl"];

_display displayAddEventHandler ["MouseZChanged", {
    params ["_display", "_scroll"];
    private _scale = ctrlMapScale (_display displayCtrl 51);
    {
        _x setMarkerAlphaLocal linearConversion [0.05, 0.2, _scale, 1, 0, true];
    } forEach GVAR(markers);
}];
