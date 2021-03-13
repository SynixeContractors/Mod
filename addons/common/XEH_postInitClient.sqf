#include "script_component.hpp"

["ace_arsenal_displayClosed", {
	if ((currentWeapon ACE_player) != "") then {
        [ACE_player] call ace_weaponselect_fnc_putWeaponAway;
    }
}] call CBA_fnc_addEventHandler;

[QGVAR(members_loaded), {
    GVAR(members) = _this;
}] call CBA_fnc_addEventHandler;