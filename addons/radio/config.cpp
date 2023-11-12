#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"live_radio_interface"};
        VERSION_CONFIG;
    };
};

class CfgRadioStations {
    delete ClassicRock109;
    delete PulseEDM;
    delete LifeIreland;
    // class synixe_radio1 {
    //     name = "Synixe Radio 1 - It's the #1!";
    //     url = "https://radio.synixe.contractors/listen/radio1/radio.mp3";
    // };
    // class synixe_radio2 {
    //     name = "Synixe Radio 2 - Rock 'n Soul";
    //     url = "https://radio.synixe.contractors/listen/radio2/radio.mp3";
    // };
    class synixe_radio3 {
        name = "Synixe Radio 3 - Spanish Pop";
        url = "https://radio.synixe.contractors/listen/radio3/radio.mp3";
    };
    class synixe_radio4 {
        name = "Synixe Radio 4 - El Mejor Rock";
        url = "https://radio.synixe.contractors/listen/radio4/radio.mp3";
    };
    class synixe_radio5 {
        name = "Synixe Radio 5 - Los Mas Chorros Del Condado";
        url = "https://radio.synixe.contractors/listen/radio5/radio.mp3";
    };
    class synixe_radio6 {
        name = "Synixe Radio 6 - Ritmo Pa Tu Cuerpo";
        url = "https://radio.synixe.contractors/listen/radio6/radio.mp3";
    };
};
