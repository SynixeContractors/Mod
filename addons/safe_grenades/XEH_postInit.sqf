#include "script_component.hpp"

if (is3DEN) exitWith {};

// Don't run when using HEMTT commands
if (profileName != "hemtt") then {
    call FUNC(bindWarn);
};
