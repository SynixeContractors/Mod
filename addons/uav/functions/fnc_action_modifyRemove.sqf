#include "..\script_component.hpp"

params ["_drone", "", "", "_actionData"];

_actionData set [1, format ["Remove Battery (%1%2)", round ((fuel _drone) * 100), "%"]];
