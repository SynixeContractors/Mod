#include "script_component.hpp"

player addEventHandler ["SoundPlayed", { _this call FUNC(soundPlayed); }];

[{
    if ([ace_player] call FUNC(temp) > 7.2) exitWith {};
    ace_player setVariable [QGVAR(stamina), ace_advanced_fatigue_anReserve / 2300, true];
}, 5] call CBA_fnc_addPerFrameHandler;
