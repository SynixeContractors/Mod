#include "..\script_component.hpp"

if (getNumber (missionConfigFile >> "synixe_template") < 3) exitWith {};

createMarkerLocal ["respawn", getPos player];

GVAR(locations) = [];
GVAR(triggers) = [];

{
    _x setVariable [QGVAR(active), true];
    hideObject _x;
    GVAR(locations) pushBack _x;
} forEach allMissionObjects QGVAR(respawn);

{
    private _locations = synchronizedObjects _x select { _x isKindOf QGVAR(respawn) };
    if (_locations isNotEqualTo []) then {
        GVAR(triggers) pushBack [_x, triggerActivated _x];
    };
    {
        _x setVariable [QGVAR(active), false];
    } forEach _locations;
} forEach allMissionObjects "EmptyDetector";

player addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];
    private _locations = GVAR(locations) select { _x getVariable [QGVAR(active), false] };
    if (_locations isEqualTo []) exitWith {};
    [{
        params ["_unit", "_pos"];
        _unit setPosASL _pos;
    }, [_unit, getPosASL selectRandom _locations]] call CBA_fnc_execNextFrame;
}];

if (GVAR(triggers) isEqualTo []) exitWith {};
[{
    {
        _x params ["_trigger", "_wasActivated"];
        if (_wasActivated && {triggerActivated _trigger}) then {
            continue;
        };
        if (_wasActivated && {!triggerActivated _trigger}) then {
            GVAR(triggers) set [_forEachIndex, [_trigger, false]];
        };
        if (!_wasActivated && {triggerActivated _trigger}) then {
            GVAR(triggers) set [_forEachIndex, [_trigger, true]];
            {
                _x setVariable [QGVAR(active), false];
            } forEach GVAR(locations);
            {
                _x setVariable [QGVAR(active), true];
            } forEach synchronizedObjects _trigger select { _x isKindOf QGVAR(respawn) };
        };
    } forEach GVAR(triggers);
}, 2] call CBA_fnc_addPerFrameHandler;
