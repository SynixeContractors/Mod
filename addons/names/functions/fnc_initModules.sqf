#include "script_component.hpp"

["Synixe Contractors", "Link Member", {
	params ["", "_object"];
	if (_object isEqualTo objNull || {!(isPlayer _object)}) exitWith {};
	private _keys = keys GVAR(members);
	private _playerCurrentID = _object getVariable [QGVAR(discordid), ""];
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
				[""] + ((keys GVAR(members)) apply {GVAR(members) get _x}),
				_index
			], true]
		],
        {
            params ["_values", "_args"];
            _values params ["_value"];
            _args params ["_object"];
			_object setVariable [QGVAR(discordid), _value, true];
			[QGVAR(setName)] call CBA_fnc_globalEvent;
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;
