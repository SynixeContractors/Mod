class CfgAmmo {
    class MineBase;
    class RC40_explosion_Ammo_RF: MineBase {
        hit = 180;
        indirectHit = 30;
        GVAR(enabled) = 1;
        GVAR(force) = 1;

        GVAR(classes)[] = {"ACE_frag_tiny_HD"};
        GVAR(metal) = 300;
        GVAR(charge) = 60;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = "1/2";
    };
};