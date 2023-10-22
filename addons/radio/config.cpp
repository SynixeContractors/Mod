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
    class synixe_radio1 {
        name = "Synixe Radio 1 - It's the #1!";
        url = "https://radio.synixe.contractors/listen/radio1/radio.mp3";
    };
    class synixe_radio2 {
        name = "Synixe Radio 2 - Rock 'n Soul";
        url = "https://radio.synixe.contractors/listen/radio2/radio.mp3";
    };
    class synixe_radio3 {
        name = "Synixe Radio 3 - Spanish Pop";
        url = "https://radio.synixe.contractors/listen/radio3/radio.mp3";
    };
};
