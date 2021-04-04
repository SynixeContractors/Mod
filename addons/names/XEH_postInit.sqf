#include "script_component.hpp"

if !(hasInterface) exitWith {};

[QGVAR(setName), {
	private _discordid = player getVariable [QEGVAR(common,discordid), ""];
	private _fullname = if (_discordid isEqualTo "") then {
		format ["U: %1", name player]
	} else {
		EGVAR(common,members) get _discordid
	};
	player setVariable ["ACE_nameraw", _fullName, true];
	player setVariable ["ACE_name", _fullName, true];

}] call CBA_fnc_addEventHandler;

[{
	[QGVAR(setName)] call CBA_fnc_localEvent;
}, [], 5] call CBA_fnc_waitAndExecute;

player addEventHandler ["Respawn", {
	[QGVAR(setName)] call CBA_fnc_localEvent;
}];

["pmc_db_set_variable", {
	params ["_key", "_val"];
	if (_key in [QEGVAR(common,discordid)]) then {
		[QGVAR(setName)] call CBA_fnc_localEvent;
	};
}] call CBA_fnc_addEventHandler;

addMissionEventHandler ["Map", {
	// params ["_mapIsOpened", "_mapIsForced"];
	[{
		{
			if (ctrlIDC _x isEqualTo IDC_Synixe_CA_PlayerName) exitWith {
				[_x] call FUNC(mapPlayerName);
			};
		} foreach allControls findDisplay 12;
	}] call CBA_fnc_execNextFrame;
}];

["Synixe Contractors", "Link Member", {
	params ["", "_object"];
	if (_object isEqualTo objNull || {!(isPlayer _object)}) exitWith {};
	private _keys = keys EGVAR(common,members);
	private _playerCurrentID = _object getVariable [QEGVAR(common,discordid), ""];
	private _index = -1;
	if !(_playerCurrentID isEqualTo "") then {
		_index = _keys findIf { _x isEqualTo _playerCurrentID };
	};
	_index = _index + 1;
	[
        format ["Register Name - %1", getPlayerUID _object],
        [
			["COMBO","Discord Member", [
				["Unlinked"] + _keys,
				[""] + ((keys EGVAR(common,members)) apply {EGVAR(common,members) get _x}),
				_index
			], true]
		],
        {
            params ["_values", "_args"];
            _values params ["_value"];
            _args params ["_object"];
			_object setVariable [QEGVAR(common,discordid), _value, true];
			[QGVAR(setName)] call CBA_fnc_globalEvent;
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;
