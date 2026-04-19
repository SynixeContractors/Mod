#include "..\script_component.hpp"

params ["_unit", "_soundId", "_temp"];

private _index = (ALLOWED_SOUNDS find _soundId);
private _speedIntensities = [1, 1.5, 2, 1.3, 2.5, 2.5, 1.3, 1.1];
private _preInt = (0.06 * (getFatigue _unit)) max 0.006;
private _cold = 0;
private _lifeTime = 0.2;
if (_temp < 3) then {_cold = 0.02; _lifeTime = 0.4};
if (_temp < -3) then {_cold = 0.035; _lifeTime = 0.6};
if (_temp < -9) then {_cold = 0.055; _lifeTime = 0.8};
private _lifeTimeFraction = _lifeTime / 10;
_lifeTime = random [_lifeTime - _lifeTimeFraction, _lifeTime, _lifeTime + _lifeTimeFraction];
_preInt = _preInt + _cold;
private _int = random [_preInt - (_preInt / 10), _preInt, _preInt + (_preInt / 10)];
(eyeDirection _unit) params ["_dirX", "_dirY"];
private _exhaleDir = _dirX atan2 _dirY;
if (_exhaleDir < 0) then {_exhaleDir = 360 + _exhaleDir};
private _unitVelocity = velocity _unit;
private _getExhaleSpeed = 0.26 * (_speedIntensities select _index);
private _exhaleSpeed = random [_getExhaleSpeed - (_getExhaleSpeed / 10), _getExhaleSpeed, _getExhaleSpeed + (_getExhaleSpeed / 10)];
private _exhaleVelocity = [
    (_unitVelocity select 0) + (sin _exhaleDir * _exhaleSpeed),
    (_unitVelocity select 1) + (cos _exhaleDir * _exhaleSpeed),
    (_unitVelocity select 2)
];
private _source = "logic" createVehicleLocal (getPos _unit);
private _fog = "#particlesource" createVehicleLocal getPos _source;
_fog setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 12, 13,0],
    "",
    "Billboard",
    0.5,
    _lifeTime,
    [0, 0, 0],
    _exhaleVelocity,
    1, 1.195,  1, 0.20,
    [0, 0.2,0],
    [[1, 1, 1, _int], [1, 1, 1, 0.001], [1, 1, 1, 0]],
    [1000],
    1,
    0.04,
    "",
    "",
    _source
];
_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
_fog setDropInterval 0.002;
_source attachTo [_unit, _unit worldToModelVisual ((ASLToAGL (eyePos _unit)) vectorAdd [0,0.09,-0.09])];
private _exhaleTime = 0.4 * ([1, 0.7, 0.5, 0.3, 0.4, 1.2, 1, 1] select _index);
sleep random [_exhaleTime - 0.25, _exhaleTime, _exhaleTime + 0.25];
deleteVehicle _source;
deleteVehicle _fog;
