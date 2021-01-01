#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"synixe_contractors_main"};
        author = "Brett";
        authors[] = {"Brett"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgRanks.hpp"

#include "PlayerName.hpp"
#include "RscDialog.hpp"
