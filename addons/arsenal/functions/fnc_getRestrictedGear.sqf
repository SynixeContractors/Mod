#include "..\script_component.hpp"

params ["_unit"];

private _unauthorized = [];

private _roles = [_unit] call EFUNC(common,findRoles);

// Suppressor
private _suppressorAllowed = missionNamespace getVariable ["crate_client_gear_suppressors_allowed", true];
if !(_suppressorAllowed) then {
    {
        if (_x select 0 != "") then {
            _unauthorized pushBackUnique format ["%1 Suppressor", _x#1];
        };
    } forEach [
        [primaryWeaponItems _unit, "Primary Weapon"],
        [secondaryWeaponItems _unit, "Secondary Weapon"],
        [handgunItems _unit, "Handgun"]
    ];
};

// Medic
if !("medic" in _roles) then {
    {
        if ("medic" in toLower (_x#0)) then {
            _unauthorized pushBackUnique format ["Medic %1", _x#1];
        };
    } forEach [
        [uniform _unit, "Uniform"],
        [vest _unit, "Vest"],
        [backpack _unit, "Backpack"],
        [headgear _unit, "Headgear"]
    ];
} else {
    // Medic shouldn't be carrying a launcher
    if (secondaryWeapon _unit != "") then {
        _unauthorized pushBackUnique "Launcher";
    };
};

// UAV
if !("uav" in _roles) then {
    if ("B_UavTerminal" in GVAR(itemCache)) then {
        _unauthorized pushBackUnique "UAV Terminal";
    };
};

// AR & AT
private _needsAmmoBag = _roles findIf { _x in ["ar", "mat", "hat", "ammo"] } != -1;
if !(_needsAmmoBag) then {
    if ("FieldPack" in backpack _unit) then {
        _unauthorized pushBackUnique "Field Pack";
    };
};

// Engineer
private _needsEngineerBag = _roles findIf { _x in ["engineer", "demo", "eod"] } != -1;
if !(_needsEngineerBag) then {
    if ("TacticalPack" in backpack _unit) then {
        _unauthorized pushBackUnique "Tactical Backpack";
    };
};

_unauthorized
