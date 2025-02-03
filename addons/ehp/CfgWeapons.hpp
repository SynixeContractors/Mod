class CfgWeapons {
    // Remove after https://github.com/acemod/ACE3/pull/10713
    class HelmetBase;
    class H_Watchcap_blk: HelmetBase {
        ace_hearing_hasEHP = 0;
    };

    class H_Bandanna_tna_F;
    class H_Bandanna_tna_hs_F: H_Bandanna_tna_F {
        ace_hearing_hasEHP = 1;
    };
    class H_Bandanna_camo;
    class H_Bandanna_camo_hs: H_Bandanna_camo {
        ace_hearing_hasEHP = 1;
    };
};
