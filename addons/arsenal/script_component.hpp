#define COMPONENT arsenal
#include "\x\synixe\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_ARSENAL
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ARSENAL
#endif

#include "\x\synixe\addons\main\script_macros.hpp"

// Vanilla AI
#define CT_STRUCTURED_TEXT 13

// ACE

#define PIXEL_SCALE  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * PIXEL_SCALE)
#define GRID_H (pixelH * pixelGridNoUIScale * PIXEL_SCALE)

#define IDC_iconBackgroundFace 2032
#define IDC_buttonFace 2033
#define IDC_iconBackgroundVoice 2034
#define IDC_buttonVoice 2035
#define IDC_iconBackgroundInsigna 2036
#define IDC_buttonInsignia 2037

// Synixe

#define IDC_requiredGearBox 24835
#define IDC_requiredGearTitle 24836
#define IDC_requiredGearText 24837
#define IDC_specialGearBox 25835
#define IDC_specialGearTitle 25836
#define IDC_specialGearText 25837

#define CUSTOM_BOXES [IDC_requiredGearBox, IDC_requiredGearTitle, IDC_specialGearBox, IDC_specialGearTitle]