#include "script_component.hpp"

params [["_config", configNull, [configNull, []]], ["_varName", "", [""]], ["_default", ""]];

private _var = GVAR(variableHandler) getVariable _varName;
if (isNil "_var") then {
    if (IS_ARRAY(_config)) then {
        _path = configFile;
        {
            _path = _path >> _x;
        } count _config;
        _config = _path;
    };
    _var = switch (true) do {
        case (isNumber _config): {
            getNumber _config;
        };
        case (isText _config): {
            getText _config;
        };
        case (isArray _config): {
            getArray _config;
        };
        default {_default};
    };

    GVAR(variableHandler) setVariable [_varName, _var];
};

_var
