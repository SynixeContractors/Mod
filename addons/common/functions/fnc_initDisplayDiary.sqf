#include "..\script_component.hpp"

(findDisplay 12) displayAddEventHandler ["MouseZChanged", {
    params ["_display", "_scroll"];
    private _scale = ctrlMapScale (_display displayCtrl 51);
    {
        _x setMarkerAlphaLocal linearConversion [0.5, 0.2, _scale, 1, 0, true];
    } forEach GVAR(markers);
}];
