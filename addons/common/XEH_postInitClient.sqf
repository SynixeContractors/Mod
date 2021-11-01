#include "script_component.hpp"

// Always holster when leaving the arsenal
["ace_arsenal_displayClosed", {
    [{
        if ((currentWeapon ACE_player) != "") then {
            if (ACE_player isEqualTo player) then {
                [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;
            };
            [ACE_player] call ace_weaponselect_fnc_putWeaponAway;
        }
    }] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

// Disable all chats except global
0 enableChannel [true, false];  //Global - Text Only
1 enableChannel [true, false];  //Side   - Text Only
2 enableChannel false;          //Command
3 enableChannel false;          //Group
4 enableChannel false;          //Vehicle
5 enableChannel false;          //Direct
setCurrentChannel 0;            //Change to Global
