#include "..\script_component.hpp"

params [["_url", ""]];

EXT callExtension ["browser", [_url]];
