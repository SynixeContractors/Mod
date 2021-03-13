#include "script_component.hpp"

params ["", "_object"];

RscDisplayCurator_sections params ["_mode"];

if (GVAR(addMasks)) then {
	if (_mode == 0 || {_mode == 4 && {isClass (configFile >> "CfgVehicles" >> zen_editor_recentTreeData)}}) then {
		{
			_x spawn {
				sleep 3;
				removeGoggles _this;
				_this addGoggles (selectRandom EGVAR(covid,masks));
			};
		} forEach crew _object;
	} else {
		_object spawn {
			sleep 3;
			removeGoggles _this;
			_this addGoggles (selectRandom EGVAR(covid,masks));
		};
	}
};
