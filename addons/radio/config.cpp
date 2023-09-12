#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        VERSION_CONFIG;
    };
};

class CfgRadioStations {
    class synixe_radio2 {
        name = "Synixe Radio 2 - Rock 'n Soul";
        url = "https://radio.synixe.contractors/listen/radio2/radio.mp3";
    };
};
