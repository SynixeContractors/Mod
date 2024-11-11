#include "script_component.hpp"

ace_arsenal_enableIdentityTabs = false;

["ace_arsenal_displayOpened", LINKFUNC(handleDisplayOpened)] call CBA_fnc_addEventHandler;
["ace_arsenal_displayClosed", LINKFUNC(handleDisplayClosed)] call CBA_fnc_addEventHandler;
["ace_arsenal_loadoutsDisplayOpened", LINKFUNC(handleLoadoutsDisplayOpened)] call CBA_fnc_addEventHandler;
["ace_arsenal_loadoutsDisplayClosed", LINKFUNC(handleLoadoutsDisplayClosed)] call CBA_fnc_addEventHandler;

["CBA_SettingChanged", {
    params ["_setting", "_value"];
    if !(isNil QGVAR(loadoutEH)) then {
        [ACE_player, getUnitLoadout ACE_player, getUnitLoadout ACE_player] call FUNC(handleLoadout);
    };
}] call CBA_fnc_addEventHandler;
