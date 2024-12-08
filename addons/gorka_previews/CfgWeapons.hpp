#define PICTURE(BASE) \
    class BASE: Uniform_Base { \
        picture = QPATHTOF(pictures\##BASE##.paa); \
    }

class CfgWeapons {
    class Uniform_Base;

    #include "PicGorkas.hpp"
};
