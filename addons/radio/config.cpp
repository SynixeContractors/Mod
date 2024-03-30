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
    class synixe_radio7 {
        name = "Synixe Radio 7 - Alternative Waves";
        url = "https://radio.synixe.contractors/listen/radio7/radio.mp3";
    };
    class synixe_radio8 {
        name = "Synixe Radio 8 - Drenched in Reverb";
        url = "https://radio.synixe.contractors/listen/radio8/radio.mp3";
    };
    class synixe_radio9 {
        name = "Synixe Radio 9 - All Things Math Rock";
        url = "https://radio.synixe.contractors/listen/radio9/radio.mp3";
    };
    class synixe_radio10 {
        name = "Synixe Radio 10 - Alternative Hiphop 90s";
        url = "https://radio.synixe.contractors/listen/radio10/radio.mp3";
    };
    class synixe_radio11 {
        name = "Synixe Radio 11 - Beautiful World";
        url = "https://radio.synixe.contractors/listen/radio11/radio.mp3";
    };
    class synixe_radio12 {
        name = "Synixe Radio 12 - Western Wind Radio";
        url = "https://radio.synixe.contractors/listen/radio12/radio.mp3";
    };
    class synixe_radio13 {
        name = "Synixe Radio 13 - Alt Rock Ascent FM";
        url = "https://radio.synixe.contractors/listen/radio13/radio.mp3";
    };
    class synixe_radio14 {
        name = "Synixe Radio 14 - Iron Anthem FM";
        url = "https://radio.synixe.contractors/listen/radio14/radio.mp3";
    };
    class synixe_radio15 {
        name = "Synixe Radio 15 - Dance India";
        url = "https://radio.synixe.contractors/listen/radio15/radio.mp3";
    };
    class synixe_radio16 {
        name = "Synixe Radio 16 - This Is War";
        url = "https://radio.synixe.contractors/listen/radio16/radio.mp3";
    };
};
