#include "..\script_component.hpp"

params ["_unit"];

(magazines _unit) findIf { _x in [
    QGVAR(B_UAV_01_CASE),
    QGVAR(O_UAV_01_CASE),
    QGVAR(I_UAV_01_CASE)
] } >= 0
