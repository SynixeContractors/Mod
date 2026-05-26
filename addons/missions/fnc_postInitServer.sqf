["crate_client_missions_introText", {
    ["OCAP_record"] call CBA_fnc_localEvent;
    ["OCAP_setFocusStart"] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[{
    if (allPlayers isEqualTo []) then {
        endMission "END1";
    };
}, [], 60 * 60 * 6] call CBA_fnc_waitAndExecute;
