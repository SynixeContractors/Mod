# About

Adds Shooting Range framework with a module to set it up. Supports different modes and can be applied to any composition.

### Authors

- [Jonpas](http://github.com/jonpas)
- Originally from [Theseus-Aegis/Mods](https://github.com/Theseus-Aegis/Mods)

### Features

- Event `"synixe_shootingrange_started"` event with parameters `[_controller, _name, _mode, _targets, _targetsInvalid]`
- Event `"synixe_shootingrange_stopped"` event with parameters `[_controller, _name, _mode, _success, _scorePercentage, _timeElapsed]`
- Function `synixe_shootingrange_fnc_configure` for run-time range configuration (description in function header)
