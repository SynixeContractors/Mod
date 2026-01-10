#include "..\script_component.hpp"

params ["_shooter", "", "", "", "_ammo"];

if (player == _shooter) exitWith {};
if (!isNull objectParent player) exitWith {};
private _dist = ((positionCameraToWorld [0,0,0]) distance _shooter);
if (_dist > 60) exitWith {};

private _hit = (GVAR(hitCache) getOrDefaultCall [_ammo, {
    getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit")
}, true]) * 0.125; // multiplied by 0.125 to scale down the effect, based on balancing when we used caliber

// Reduce the hit value based on hearing protection
_hit = _hit * (1 min ((ace_hearing_volumeAttenuation * ([1,0.3] select (ACE_player getVariable ["ACE_hasEHP", false] || {ACE_player getVariable ["ACE_hasBuiltInEHP", false]})))));

private _maxDist = 14 + (_hit / 1.1);
private _intensity = (_dist / _maxDist);
if (_intensity >= 1) exitWith {};
_intensity = 1 - _intensity;

// Calculate the intensity based on the hit
private _force = (0.4 + (_hit / 20)) * _intensity;
private _length = (0.2 + (_hit / 45));
private _frequency = (35 + (_hit / 6)) * _intensity;

if (_force < 0) then {_force = 0;};
if (_length < 0) then {_length = 0;};
if (_frequency < 0) then {_frequency = 0;};

addCamShake [_force, _length, _frequency];

if (_intensity > 0.6) then {
    GVAR(blurStrength) = GVAR(blurStrength) + ((0.45 + (_hit * 0.02)) * _intensity);
};
