#include "script_component.hpp"

params ["_unit"];

if (!createDialog QGVAR(CardDialog)) exitWith {};

private _name = [_unit] call FUNC(getNames);
private _certs = format [
	"<t align=""center"" color=""#000000"">%1</t>",
	([_unit] call FUNC(getCertifications)) joinString "<br/>"
];
private _background = format ["\z\synixe_contractors\addons\names\ui\%1.paa", [
	"card", "recruit", "junior", "member", "senior"
] select (_unit getVariable [QGVAR(role), 0])];

private _display = uiNamespace getVariable QGVAR(display);

ctrlSetText [IDC_PHOTO, _background];

// Set First name
ctrlSetText [IDC_FIRST, _name select 0];

// Set Last name
if (count _name isEqualTo 2) then {
	ctrlSetText [IDC_LAST, _name select 1];
};

// Set Certifications
(_display displayCtrl IDC_CERTS) ctrlSetStructuredText parseText _certs;

// Set Steam ID
ctrlSetText [IDC_STEAM, getPlayerUID _unit];
