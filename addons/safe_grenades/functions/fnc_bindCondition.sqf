#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Checks if player has G bound to Throw and if he was not warned yet.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True if warning should be shown <BOOL>
 *
 * Public: No
 */

DIK_G in actionKeys "Throw" && {!(profileNamespace getVariable [QGVAR(bindConfirmed), false])}
