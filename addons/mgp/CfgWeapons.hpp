class CfgWeapons {
    #undef HIDE
    #define HIDE(CLASS) class CLASS: ItemCore { scope = 1; scopeArsenal = 1; scopeCurator = 1; }
    #undef RENAME
    #define RENAME(CLASS,DISPLAY) class CLASS: ItemCore { displayName = DISPLAY; picture = QPATHTOF(ui\CLASS.paa); }

    class ItemCore;

    #include "HideBelts.hpp"
    #include "HideHats.hpp"
    #include "HideHelmets.hpp"
    #include "HideVests.hpp"
};
