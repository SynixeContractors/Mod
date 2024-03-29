#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Warns the player that he has default bind "G" to throw grenade.
 * It's considered good pratice to rebind it ;-)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#define CONFIRMED 1
#define DISCARDED 2
#define THROW_KEYBIND "STR_USRACT_THROW"

if (!(call FUNC(bindCondition))) exitWith { nil };

private _fnc_secondWarning = {
    params ["", "_confirm"];
    if (_confirm isEqualTo CONFIRMED) exitWith {
        // Open rebinding screen
        [{
            [THROW_KEYBIND] call FUNC(openKeybinding);
        }] call CBA_fnc_execNextFrame;
    };

    // Ask again
    [{
        [
            LLSTRING(ThrowBind_Title),
            LLSTRING(ThrowBind_Warn2),
            false,
            {},
            {
                params ["", "_confirm"];
                if (_confirm isEqualTo CONFIRMED) exitWith {
                    // Open rebinding screen
                    [{
                        [THROW_KEYBIND] call FUNC(openKeybinding);
                    }] call CBA_fnc_execNextFrame;
                };

                // Do not ask again
                profileNamespace setVariable [QGVAR(bindConfirmed), true];
                saveProfileNamespace;
            }
        ] call EFUNC(common,modal);
    }] call CBA_fnc_execNextFrame;
};

[{!isNull (findDisplay 46)}, {
    params ["_fnc_onClose"];

    [
        LLSTRING(ThrowBind_Title),
        LLSTRING(ThrowBind_Warn),
        false,
        {},
        _this
    ] call EFUNC(common,modal);
}, _fnc_secondWarning] call CBA_fnc_waitUntilAndExecute;

nil
