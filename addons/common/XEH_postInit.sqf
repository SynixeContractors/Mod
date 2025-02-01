// Uncon Collision
["ace_unconscious", {
    params ["_unit", "_state"];

    {
        if (_state) then {
            _x disableCollisionWith _unit;
            _unit disableCollisionWith _x;
        } else {
            _x enableCollisionWith _unit;
            _unit enableCollisionWith _x;
        };
    } forEach allPlayers;
}] call CBA_fnc_addEventHandler;
