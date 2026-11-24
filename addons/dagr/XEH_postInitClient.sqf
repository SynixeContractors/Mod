#include "script_component.hpp"

addMissionEventHandler ["Map", {
    params ["_mapIsOpened"];
    if (_mapIsOpened && !ace_dagr_run) then {
        call ace_dagr_fnc_toggleOverlay;
    };
    if (!_mapIsOpened && ace_dagr_run) then {
        call ace_dagr_fnc_toggleOverlay;
    };
}];

private _index = ace_common_deviceKeyHandlingArray findIf {_x#0 == "DAGR"};
if (_index != -1) then {
    ace_common_deviceKeyHandlingArray deleteAt _index;
};
