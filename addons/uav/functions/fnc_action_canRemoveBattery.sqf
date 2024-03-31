#include "..\script_component.hpp"

params ["_unit", "_drone"];

fuel _drone != 0 && {
    _unit canAdd QGVAR(battery)
}
