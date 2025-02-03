class CfgWeapons {
    #undef HIDE
    #define HIDE(CLASS) class CLASS: ItemCore { scope = 1; scopeArsenal = 1; scopeCurator = 1; }
    #undef RENAME
    #define RENAME(CLASS,DISPLAY) class CLASS: ItemCore { \
        displayName = DISPLAY; \
        ace_hearing_protection = 0.75; \
        ace_hearing_lowerVolume = 0; \
        ace_hearing_hasEHP = 1; \
    }

    class ItemCore;

    #include "HideBelts.hpp"
    #include "HideHats.hpp"
    #include "HideHelmets.hpp"
    #include "HideVests.hpp"
};
