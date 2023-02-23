[
    QGVAR(enabled),
    "CHECKBOX",
    "Require Equipment",
    ["Synixe - Arsenal", "Required Equipment"],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requirePrimary),
    "CHECKBOX",
    "Primary Weapon",
    ["Synixe - Arsenal", "Required Equipment"],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requirePrimaryAmmo),
    "SLIDER",
    "Primary Ammunition",
    ["Synixe - Arsenal", "Required Equipment"],
    [0, 180, 120, 0, false],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireHandgun),
    "CHECKBOX",
    "Handgun Weapon",
    ["Synixe - Arsenal", "Required Equipment"],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireHandgunAmmo),
    "SLIDER",
    "Handgun Ammunition",
    ["Synixe - Arsenal", "Required Equipment"],
    [0, 150, 0, 0, false],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireVest),
    "CHECKBOX",
    "Vest",
    ["Synixe - Arsenal", "Required Equipment"],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireNVG),
    "CHECKBOX",
    "NVG",
    ["Synixe - Arsenal", "Required Equipment"],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireRadio),
    "CHECKBOX",
    "Radio",
    ["Synixe - Arsenal", "Required Equipment"],
    true,
    true
] call CBA_fnc_addSetting;
