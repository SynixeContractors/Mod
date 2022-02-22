#include "script_component.hpp"

params ["_items", "_count", "_pretty", "_missing"];

private _itemsWithAcre = [];
{
	_itemsWithAcre pushBack _x;
	if ([_x] call acre_api_fnc_isRadio) then {
		_itemsWithAcre pushBack ([_x] call acre_api_fnc_getBaseRadio);
	};
} forEach _items;

private _have = ({ _x in _itemsWithAcre } count GVAR(itemCache));
if (_have < _count) exitWith {
	_missing pushBackUnique format ["%1 %2", _count - _have, _pretty];
};
