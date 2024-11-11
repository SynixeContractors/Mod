["CAManBase", "Deleted", {
    params ["_unit"];
    {
        deleteVehicle _x;
    } forEach attachedObjects _unit;
}, true, []] call CBA_fnc_addClassEventHandler;
