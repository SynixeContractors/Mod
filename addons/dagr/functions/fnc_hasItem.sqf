params [["_unit", objNull, [objNull]], ["_item", "", [""]]];

_item in assignedItems _unit || {_item in (_unit call ace_common_fnc_uniqueItems)}
