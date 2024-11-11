#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "live_radio_interface"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

class CfgRadioStations {
    // class synixe_radio1 {
    //     name = "Synixe Radio 1 - It's the #1!";
    //     url = "https://radio.synixe.contractors/listen/radio1/radio.mp3";
    // };
};
