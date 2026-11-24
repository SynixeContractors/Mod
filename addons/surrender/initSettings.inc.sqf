#define CATEGORY ["Synixe - Surrender", "Influence"]

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enabled", "Allow AI to dynamically surrender"],
    "Synixe - Surrender",
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(roll),
    "SLIDER",
    ["Roll", "Size of the random roll. Higher values make surrendering less likely overall"],
    "Synixe - Surrender",
    [100, 2000, 600, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(influenceHit),
    "SLIDER",
    ["Hit", "How much being hit pushes a unit towards surrendering (scaled by the group's On Hit Multiplier)"],
    CATEGORY,
    [0, 20, 3, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(influenceStun),
    "SLIDER",
    ["Stun", "How much being flashbanged pushes a unit towards surrendering"],
    CATEGORY,
    [0, 20, 6, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(influenceSuppressed),
    "SLIDER",
    ["Suppressed", "How much being suppressed pushes a unit towards surrendering"],
    CATEGORY,
    [0, 20, 1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(influenceSpeak),
    "SLIDER",
    ["Speak", "How much hearing enemy voices pushes a unit towards surrendering"],
    CATEGORY,
    [0, 20, 0.5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(influenceAim),
    "SLIDER",
    ["Aimed At", "How much being aimed at pushes a unit towards surrendering"],
    CATEGORY,
    [0, 20, 0.5, 1],
    1
] call CBA_fnc_addSetting;
