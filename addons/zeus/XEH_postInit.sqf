#include "script_component.hpp"

["zen_curatorDisplayLoaded", {
  private _zeusLogo = (findDisplay 312) displayCtrl 15717;
  _zeusLogo ctrlSetText "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
  _zeusLogo ctrlSetTextColor [1, 1, 1, 0.6];
  _zeusLogo ctrlCommit 0;

  // TODO potentionally replace with config
  private _zeusLogo = (findDisplay 312) displayCtrl 15715;
  _zeusLogo ctrlSetText "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
  _zeusLogo ctrlSetTextColor [1, 1, 1, 1];
  _zeusLogo ctrlCommit 0;
}] call CBA_fnc_addEventHandler;
