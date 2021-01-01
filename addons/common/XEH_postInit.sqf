#include "script_component.hpp"

["ace_arsenal_displayClosed", {
	if ((currentWeapon ACE_player) != "") then {
        [ACE_player] call ace_weaponselect_fnc_putWeaponAway;
    }
}] call CBA_fnc_addEventHandler;
