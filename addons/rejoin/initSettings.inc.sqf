[
    QGVAR(enabled),
    "CHECKBOX",
    "Teleport Players",
    "Synixe - Rejoin",
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medical),
    "CHECKBOX",
    ["Restore Medical State", "Players who disconnect and rejoin keep their wounds, blood loss, medications and unconsciousness"],
    "Synixe - Rejoin",
    true,
    true
] call CBA_fnc_addSetting;
