#define PICTURE(BASE) \
    class BASE: Uniform_Base { \
        picture = QPATHTOF(pictures\##BASE##.paa); \
    }

class CfgWeapons {
    class Uniform_Base;

    #include "PicPlaid.hpp"
    #include "PicPolo.hpp"
    #include "PicSolid.hpp"
};
