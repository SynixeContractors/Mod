#include "..\script_component.hpp"

/*
*   Original function from ace_logistics_wirecutter by gpgpgpgp, edited by commy2, PabstMirror
*   Adapted for grad_axe by McDiod
*/

params ["_unit", "_treeObject"];

if (_unit != ACE_player) exitWith {};

private _boundingBoxTree = boundingBox _treeObject;
private _treeSize = (_boundingBoxTree select 0) distance (_boundingBoxTree select 1);
private _specialistFactor = [1,0.70] select ([_unit] call ace_common_fnc_isEngineer);
private _timeToCut = _treeSize * _specialistFactor * (GVAR(timeFactor) min GVAR(maxTime) max 5) * 0.20;

if !(_unit call ace_common_fnc_isSwimming) then {
    [_unit, "Acts_Executioner_Forehand", 0] call ace_common_fnc_doAnimation;
};

private _onCompletion = {
    (_this select 0) params ["_treeObject", "", "_unit"];
    _treeObject setDamage 1;
    [_treeObject] call FUNC(checkCutDown);
    if !(_unit call ace_common_fnc_isSwimming) then {
        [_unit, "AmovPknlMstpSrasWrflDnon", 1] call ace_common_fnc_doAnimation;
    };
};

private _onFail = {
    (_this select 0) params ["", "", "_unit"];
    if !(_unit call ace_common_fnc_isSwimming) then {
        [_unit, "AmovPknlMstpSrasWrflDnon", 1] call ace_common_fnc_doAnimation;
    };
};

private _progressCheck = {
    params ["_args", "_passedTime"];
    _args params ["_treeObject", "_lastSoundEffectTime", "_unit"];

    if (_passedTime > (_lastSoundEffectTime + SOUND_CLIP_TIME_SPACEING)) then {
        _args set [1, _passedTime];
        playSound3D [format [QPATHTO_R(sound\chop_%1.ogg), (round(random 25)) +1], objNull, false, (getPosASL _unit), 3, 1, 80];
    };

    ((!isNull _treeObject) && {(damage _treeObject) < 1} && {(QITEM(axe) in (items _unit))})
};

[_timeToCut, [_treeObject,0,_unit], _onCompletion, _onFail, LLSTRING(CuttingTree), _progressCheck, ["isNotSwimming"]] call ace_common_fnc_progressBar;

[QGVAR(choppingStarted), [_unit, _treeObject]] call CBA_fnc_globalEvent;
