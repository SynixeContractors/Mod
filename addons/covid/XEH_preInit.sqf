#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(masks) = [
	"JAS_Surgical_Mask_White",
	"JAS_Surgical_Mask_Blue",
	"G_Respirator_blue_F",
	"G_Respirator_white_F",
	"G_Respirator_yellow_F"
];

GVAR(transmissionQueue) = [];
publicVariable QGVAR(civsMaskUsage);
GVAR(civsMaskUsage) = 0;

ADDON = true;
