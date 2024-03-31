#include "..\script_component.hpp"

params ["_unit", "_drone"];

fuel _drone == 0 && {
    QGVAR(battery) in magazines _unit
}
