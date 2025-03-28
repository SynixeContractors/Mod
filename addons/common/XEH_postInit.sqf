// Uncon Collision
["ace_unconscious", {
    params ["_unit", "_state"];

    _unit setPhysicsCollisionFlag !state;
}] call CBA_fnc_addEventHandler;
