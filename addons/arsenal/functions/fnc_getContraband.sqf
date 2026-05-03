#include "..\script_component.hpp"

params ["_unit"];

if (isNil "crate_client_gear_fnc_shop_item_price") exitWith { [] };

private _contraband = [];

{
    private _config = _x select 1;
    {
        if (_x == "ItemRadioAcreFlagged") then {continue};
        if (_x == "") then {continue};
        private _price = ([_x, false] call crate_client_gear_fnc_shop_item_price) select 0;
        if (_price < 0) then {
            _contraband pushBackUnique (getText (configFile >> _config >> _x >> "displayName"));
        };
    } forEach (_x select 0);
} forEach [
    [items _unit, "CfgWeapons"],
    [magazines _unit, "CfgMagazines"],
    [assignedItems _unit, "CfgWeapons"],
    [[uniform _unit], "CfgWeapons"],
    [[vest _unit], "CfgWeapons"],
    [[backpack _unit], "CfgVehicles"],
    [[headgear _unit], "CfgWeapons"],
    [[goggles _unit], "CfgGlasses"]
];

_contraband
