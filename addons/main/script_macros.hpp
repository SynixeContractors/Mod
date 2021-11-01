// #include "\x\cba\addons\main\script_macros_common.hpp" // Included in ACE3's "script_macros.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

// Class
#define CLASS(var1) DOUBLES(PREFIX,var1)
#define QCLASS(var1) QUOTE(DOUBLES(PREFIX,var1))

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
}

// ACE3 reference macros
#define ACE_PREFIX ace

#define ACEGVAR(module,var)         TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var)        QUOTE(ACEGVAR(module,var))

#define ACEFUNC(module,function)    TRIPLES(DOUBLES(ACE_PREFIX,module),fnc,function)
#define QACEFUNC(module,function)   QUOTE(ACEFUNC(module,function))

#define ACELSTRING(module,string)   QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,module),string))
#define ACECSTRING(module,string)   QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,module),string))

// Extension Macros
#define EXT "synixe"

// Admin Macros
#define ADMIN_BRETT "76561198076832016"

// Other Macros
#define ITEM(name) synixe_##name
#define QITEM(name) QUOTE(ITEM(name))
