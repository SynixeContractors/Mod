#include "script_component.hpp"

GVAR(cameraChangedEH) = ["cameraView", {
	params ["", "_new", "_old"];
	if (_old isEqualTo "GUNNER") then {
		GVAR(inISR) = true;
		if !(isNil QGVAR(pfh)) then {
			[GVAR(pfh)] call CBA_fnc_removePerFrameHandler;
			GVAR(pfh) = nil;
		};
	};
	if (_new isEqualTo "GUNNER" && call FUNC(isISR)) then {
		GVAR(inISR) = true;
		GVAR(pfh) = [FUNC(perFrameHandler)] call CBA_fnc_addPerFrameHandler;
	};
}, true] call CBA_fnc_addPlayerEventHandler;

["Synixe ISR", "SynixeISRCompass", ["Compass", "Show a 3D compass in the ISR"], {
	if (GVAR(inISR) && {(vehicle ace_player) isNotEqualTo ace_player}) then {
		GVAR(compassEnabled) = !GVAR(compassEnabled);
	};
}, {}, [DIK_K, [false, false, false]]] call CBA_fnc_addKeybind;

["Synixe ISR", "SynixeISRCompassIncreaseSpread", ["Compass - Increase Spread", "Increase the compass spread"], {
    GVAR(compassSpread) = GVAR(compassSpread) + 1;
	if (GVAR(compassSpread) > 12) then {
		GVAR(compassSpread) = 12;
	};
}, {}, [DIK_K, [false, true, false]]] call CBA_fnc_addKeybind;

["Synixe ISR", "SynixeISRCompassDecreaseSpread", ["Compass - Decrease Spread", "Decrease the compass spread"], {
    GVAR(compassSpread) = GVAR(compassSpread) - 1;
	if (GVAR(compassSpread) < 1) then {
		GVAR(compassSpread) = 1;
	};
}, {}, [DIK_K, [false, false, true]]] call CBA_fnc_addKeybind;
