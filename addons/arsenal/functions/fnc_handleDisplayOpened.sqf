#include "script_component.hpp"

params ["_display"];

GVAR(loadoutEH) = ["loadout", FUNC(handleLoadout), true] call CBA_fnc_addPlayerEventHandler;
GVAR(arsenalDisplay) = [_display];

[ACE_player, getUnitLoadout ACE_player, getUnitLoadout ACE_player] call FUNC(handleLoadout);

// Disable Face & Voice

[{
    params ["_display"];
    {
        private _ctrl = _display displayCtrl _x;
        _ctrl ctrlSetFade 1;
        _ctrl ctrlEnable false;
        _ctrl ctrlSetTooltip "";
        _ctrl ctrlCommit 0;
    } forEach [IDC_iconBackgroundVoice, IDC_iconBackgroundVoice, IDC_buttonFace, IDC_buttonVoice];

    private _ctrl = (_display displayCtrl IDC_iconBackgroundInsigna);
    _ctrl ctrlSetPosition [
        0, 150 * GRID_H, 12 * GRID_W, 9 * GRID_H
    ];
    _ctrl ctrlSetFade 1;
    _ctrl ctrlCommit 0;

    private _ctrl = (_display displayCtrl IDC_buttonInsignia);
    _ctrl ctrlSetPosition [
        0, 150 * GRID_H, 9 * GRID_W, 9 * GRID_H
    ];
    _ctrl ctrlCommit 0;
}, [_display], 0.2] call CBA_fnc_waitAndExecute;
