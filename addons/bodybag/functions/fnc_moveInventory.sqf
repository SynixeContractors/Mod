#include "..\script_component.hpp"
/*
 * Author: Jonpas, Brett
 * Puts killed unit's inventory into the body bag.
 *
 * Arguments:
 * 0: Killed Unit <OBJECT>
 * 1: Body Bag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [killed, bodybag] call synixe_bodybag_fnc_moveInventory
 *
 * Public: No
 */

params ["_unit", "_bodybag"];

private _items = [];
private _weapons = [];

_items pushBack (headgear _unit);
_items pushBack (goggles _unit);
_items pushBack (uniform _unit);
_items append (uniformItems _unit);
_items pushBack (vest _unit);
_items append (vestItems _unit);
_items append (backpackItems _unit);
_weapons pushBack (primaryWeapon _unit);
_items append (primaryWeaponItems _unit);
_items append (primaryWeaponMagazine _unit);
_weapons pushBack (secondaryWeapon _unit);
_items append (secondaryWeaponItems _unit);
_items append (secondaryWeaponMagazine _unit);
_weapons pushBack (handgunWeapon _unit);
_items append (handgunItems _unit);
_items append (handgunMagazine _unit);
_items append (assignedItems _unit);
//_weapons pushBack (binocular _unit); // dropped into inventory on death
_items pushBack (_unit call CBA_fnc_binocularMagazine);

// Process items from the weapon holders
private _holders = getCorpseWeaponholders (_unit getVariable [QGVAR(corpse), objNull]);
_holders append getCorpseWeaponholders _unit;
_holders append (_unit getVariable [QGVAR(holders), []]);
{
    if (isNull _x) then { continue };
    if (_bodybag distance _x < 5) then {
        private _cargo = getItemCargo _x;
        _cargo append (getMagazineCargo _x);
        _cargo append (getBackpackCargo _x);
        for "_c" from 0 to (count (_cargo select 0)) - 1 do {
            private _class = (_cargo select 0) select _c;
            private _count = (_cargo select 1) select _c;
            for "_i" from 0 to _count do {
                _items pushBack _class;
            };
        };
        {
            _weapons pushBack _x#0;
            _items pushBack _x#1;
            _items pushBack _x#2;
            _items pushBack _x#3;
            _items pushBack _x#4#0;
            _items pushBack _x#5#0;
            _items pushBack _x#6;
        } forEach (weaponsItemsCargo _x);
        deleteVehicle _x;
    } else {
        INFO_2("Bodybag: Holder %1 too far from bodybag %2",_x,_bodybag);
        if !(_x in (getCorpseWeaponholders _unit)) then {continue};
        private _newHolder = createVehicle [
            "WeaponHolderSimulated",
            getPos _x,
            [],
            0,
            "CAN_COLLIDE"
        ];
        private _itemCargo = getItemCargo _x;
        {
            _newHolder addItemCargoGlobal [_x, _itemCargo select 1 select _forEachIndex];
        } forEach (_itemCargo select 0);
        private _magCargo = getMagazineCargo _x;
        {
            _newHolder addMagazineCargoGlobal [_x, _magCargo select 1 select _forEachIndex];
        } forEach (_magCargo select 0);
        private _backpackCargo = getBackpackCargo _x;
        {
            _newHolder addBackpackCargoGlobal [_x, _backpackCargo select 1 select _forEachIndex];
        } forEach (_backpackCargo select 0);
        private _weaponItemsCargo = weaponsItemsCargo _x;
        {
            _newHolder addWeaponWithAttachmentsCargoGlobal [_x, 1];
        } forEach _weaponItemsCargo;
    };
} forEach _holders;

INFO_2("Body Inventory: %1 %2",_items,_weapons);

// Clear empty names and destroy items with a random chance
_items = _items select {_x != "" && {random 100 > GVAR(destroyChance)} };
_weapons = _weapons select {_x != "" && {random 100 > GVAR(destroyChance)} };

{
    _bodybag addItemCargoGlobal [_x, 1];
} forEach _items;

// Weapons with preset attachments and no non-preset parent will get attachments duplicated
{
    private _weaponNonPreset = [_x] call CBA_fnc_getNonPresetClass;
    if (_weaponNonPreset == "") then {
        _weaponNonPreset = _x;
    };
    _bodybag addWeaponCargoGlobal [_weaponNonPreset, 1];
} forEach _weapons;

// Backpacks with items already in them and no non-preset parent (special classes) will get those copied over as well, resulting in duplicated items)
private _backpack = backpack _unit;
if (_backpack != "" && {random 100 > GVAR(destroyChance)}) then {
    private _backpackNonPreset = [_backpack, "CfgVehicles"] call CBA_fnc_getNonPresetClass;
    if (_backpackNonPreset == "") then {
        _backpackNonPreset = _backpack;
    };
    _bodybag addBackpackCargoGlobal [_backpackNonPreset, 1];
};

if !(isNil "GRAD_slingHelmet_fnc_weaponHolder") then {
    private _slungWH = [_unit] call GRAD_slingHelmet_fnc_weaponHolder;
    if (_slungWH != objNull) then {
        _bodybag addItemCargoGlobal [(itemCargo _slungWH) select 0, 1];
        deleteVehicle _slungWH;
    };
};

_bodybag setMaxLoad 1000 max (loadAbs _bodybag + 100);
