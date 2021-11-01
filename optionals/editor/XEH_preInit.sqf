#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

add3DENEventHandler ["OnMissionNew", {
	systemChat "Changing the settings to Synixe's defaults";

	set3DENMissionAttributes [["Scenario", "EnableDebugConsole", 1]];
	set3DENMissionAttributes [["Multiplayer", "DisabledAI", true]];
	set3DENMissionAttributes [["Multiplayer", "Respawn", 3]];
	set3DENMissionAttributes [["Multiplayer", "RespawnButton", 0]];
	set3DENMissionAttributes [["Multiplayer", "RespawnTemplates", []]];
	set3DENMissionAttributes [["Multiplayer", "RespawnDialog", false]];
	set3DENMissionAttributes [["Multiplayer", "RespawnDelay", 10]];

	systemChat "Creating Admin Modules";

	private _module = create3DENEntity ["Logic", "ModuleCurator_F", [0, 0, 0]];
	_module set3DENAttribute ["ModuleCurator_F_Owner", "#adminLogged"];

	systemChat "Creating Headless Modules";

	private _module = create3DENEntity ["Logic", "HeadlessClient_F", [0,0,0]];
	_module set3DENAttribute ["name", "trevor"];
}];
