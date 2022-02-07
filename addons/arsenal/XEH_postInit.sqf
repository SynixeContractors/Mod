#include "script_component.hpp"

ace_arsenal_enableIdentityTabs = false;

["ace_arsenal_displayOpened", FUNC(handleDisplayOpened)] call CBA_fnc_addEventHandler;
["ace_arsenal_displayClosed", FUNC(handleDisplayClosed)] call CBA_fnc_addEventHandler;
["ace_arsenal_loadoutsDisplayOpened", FUNC(handleLoadoutsDisplayOpened)] call CBA_fnc_addEventHandler;
["ace_arsenal_loadoutsDisplayClosed", FUNC(handleLoadoutsDisplayClosed)] call CBA_fnc_addEventHandler;

["CBA_SettingChanged", {
    params ["_setting", "_value"];
    if !(isNil QGVAR(loadoutEH)) then {
		[ACE_player, getUnitLoadout ACE_player, getUnitLoadout ACE_player] call FUNC(handleLoadout);
	};
}] call CBA_fnc_addEventHandler;
