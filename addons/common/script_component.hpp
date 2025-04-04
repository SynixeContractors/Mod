#define COMPONENT common
#define COMPONENT_BEAUTIFIED Common
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_COMMON
    #define DEBUG_MODE_FULL
#endif
#ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMON
#endif

#include "..\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define COLOR_BCG { \
    "(profilenamespace getVariable ['GUI_BCG_RGB_R',0.13])", \
    "(profilenamespace getVariable ['GUI_BCG_RGB_G',0.54])", \
    "(profilenamespace getVariable ['GUI_BCG_RGB_B',0.21])", \
    "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.8])" \
}

#define IDC_MODAL_TITLE_L       1000
#define IDC_MODAL_TITLE_R       1001
#define IDC_MODAL_GROUP_CONTENT 2000
#define IDC_MODAL_CONTENT_TEXT  2001
