#define COMPONENT medical
#include "\{{project.mainprefix}}\{{project.prefix}}\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#include "\{{project.mainprefix}}\{{project.prefix}}\addons\main\script_macros.hpp"

#define ALL_MEDICAL_ITEMS [\
    "ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot",\
    "ACE_tourniquet", "ACE_splint",\
    "ACE_morphine", "ACE_adenosine", "ACE_atropine", "ACE_epinephrine",\
    "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250",\
    "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250",\
    "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250",\
    "ACE_personalAidKit", "ACE_surgicalKit", "ACE_bodyBag",\
    "ACE_suture",\
    QITEM(painkillers),\
    "kat_aatKit", "kat_accuvac",\
    "kat_X_AED", "kat_AED", "kat_crossPanel", "kat_chestSeal",\
    "kat_guedel", "kat_larynx", "kat_Pulseoximeter", "kat_Painkiller",\
    "kat_bloodIV_O", "kat_bloodIV_O_500", "kat_bloodIV_O_250",\
    "kat_bloodIV_A", "kat_bloodIV_A_500", "kat_bloodIV_A_250",\
    "kat_bloodIV_B", "kat_bloodIV_B_500", "kat_bloodIV_B_250",\
    "kat_bloodIV_AB", "kat_bloodIV_AB_500", "kat_bloodIV_AB_250",\
    "kat_stethoscope", "KAT_Empty_bloodIV_250",\
    "KAT_Empty_bloodIV_500", "kat_amiodarone", "kat_atropine",\
    "kat_IO_FAST", "kat_lidocaine", "kat_naloxone",\
    "kat_nitroglycerin", "kat_norepinephrine", "kat_phenylephrine",\
    "kat_TXA"\
]
