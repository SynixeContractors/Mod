class CfgVehicles {
    #undef RENAME
    #define RENAME(CLASS,DISPLAY) class CLASS: milgp_Bag_Base { displayName = DISPLAY; }

    class milgp_Bag_Base;

    #include "HideBackpacks.hpp"
};
