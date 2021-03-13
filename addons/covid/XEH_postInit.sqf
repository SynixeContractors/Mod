#include "script_component.hpp"

#define COVID_TIME 480

addMissionEventHandler ["Draw3D", {
  	if !(isNull(findDisplay 312)) then {
		{
			if ([_x] call FUNC(hasCovid)) then {
				drawIcon3D ["",[0.8,0,0,1],ASLToAGL getPosASL _x,1,-2,0,"Infected",2,0.05,"PuristaMedium","center"];
			};
		} forEach allUnits;
	};
}];

["Synixe - Covid", "Set Infection", {
	params ["","_object"];
	if (_object isEqualTo objNull) exitWith {};
	[
        "Set Infection",
        [["CHECKBOX","Infected",[[_object] call FUNC(hasCovid)]]],
        {
            params ["_values", "_args"];
            _values params ["_infected"];
            _args params ["_object"];
			_object setVariable [QGVAR(hasCovid), _infected, true];
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["Synixe - Covid", "GRAD Civs Mask Usage", {
	[
        "Set Infection",
        [["SLIDER:PERCENT","Percentage",[0, 1, GVAR(civsMaskUsage)]]],
        {
            params ["_values", "_args"];
            _values params ["_percent"];
			GVAR(civsMaskUsage) = _percent;
        },{},[]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

if (isServer) then {
	[{
		private _transmitter = GVAR(transmissionQueue) deleteAt 0;
		if (_transmitter isEqualTo objNull) exitWith {};
		if ([_transmitter] call FUNC(hasCovid)) then {
			{
				if !(_x isEqualTo _transmitter) then {
					[_transmitter, _x] call FUNC(tryTransmission);
				};
			} forEach allUnits;
			private _time = _transmitter getVariable [QGVAR(time), 0];
			_time = _time + 1;
			if (isPlayer _transmitter) then {
				_transmitter setVariable [QGVAR(time), _time, true];
			};
		};
	}] call CBA_fnc_addPerFrameHandler;

	[{
		if ((count GVAR(transmissionQueue)) isEqualTo 0) then {
			GVAR(transmissionQueue) = allUnits;
		};
	}, 3] call CBA_fnc_addPerFrameHandler;

	["grad_civs_lifecycle_civ_added", {
		params ["_civ"];
		if ((random 1) < GVAR(civsMaskUsage)) then {
			_civ spawn {
				sleep 1;
				removeGoggles _this;
				_this addGoggles (selectRandom GVAR(masks));
			};
		};
	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	[{
		if ([ace_player] call FUNC(hasCovid)) then {
			private _time = ace_player getVariable [QGVAR(time), 0];
			[QGVAR(duty)] call ace_advanced_fatigue_fnc_removeDutyFactor;
			if (_time < COVID_TIME * 2) then {
				if (_time < COVID_TIME) then {
					[QGVAR(duty), _time / COVID_TIME * 8] call ace_advanced_fatigue_fnc_addDutyFactor;
				} else {
					[QGVAR(duty), ((COVID_TIME * 2) - _time) / COVID_TIME * 8] call ace_advanced_fatigue_fnc_addDutyFactor;
				};
			};
		};
	}, 15] call CBA_fnc_addPerFrameHandler;
};
