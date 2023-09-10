#include "..\script_component.hpp"

if (is3DEN) exitWith {};

if (isServer) then {
    ["Helicopter", "init", {
        _this call ACEFUNC(fastroping,equipFRIES);
    }, true, ["ACE_friesBase"], true] call CBA_fnc_addClassEventHandler;
};
