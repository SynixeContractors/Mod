#include "..\script_component.hpp"
/*
 * Author: Mike, Jonpas, Brett
 * Only Laptop, Rugged Laptop & PC Set - Screen are actively supported.
 * Has a laptop generate an intel updload after an ACE interaction.
 * Texture source is shown on the object via Attributes > Object Specific > Texture #X
 * Can use getVariable on the laptop to check if upload is complete with synixe_missions_computerUploadComplete
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Laptop <OBJECT>
 * 1: Texture Source <NUMBER>
 * 2: Filesize in Gigabytes <NUMBER>
 * 3: Upload Time in Seconds <NUMBER>
 * 4: Code on start <CODE>
 * 5: Code on completion <CODE>
 * 6: Condition: <CODE> - Condition to allow starting the upload, defaults to always true
 * 7: Options: ARRAY of [<STRING>, <ANY>]
 *      - host <STRING> (default: localhost)
 *      - user <STRING> (default: root)
 *      - allowPause <BOOL> (default: true) - Allow pausing the upload by re-interacting with the laptop
 *      - onPause <CODE> (default: {}) - Code to run when upload is paused
 *      - onResume <CODE> (default: {}) - Code to run when upload is resumed
 *      - showAtStart <BOOL> (default: true) - Show the upload terminal output on initialization
 *
 * Return Value:
 * None
 *
 * Example:
 * [laptop, 0, 100, 60] call synixe_missions_fnc_computerUpload;
 */

params [
    "_object",
    "_textureSource",
    "_fileSizeGB",
    "_uploadTimeSeconds",
    ["_onStart", {}, [{}]],
    ["_onComplete", {}, [{}]],
    ["_condition", {true}],
    ["_options", []]
];

// Legacy options
if (typeName _condition == "STRING") then {
    _options pushBack ["host", _condition];
    _condition = {true};
};
if (typeName _options == "STRING") then {
    _options pushBack ["user", _options];
    _options = [];
};

private _options = createHashMapFromArray _options;

#define WEEKDAYS ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
#define MONTHS ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

// Initial setup - Players (ACE Action for upload start)
if (hasInterface) then {
    _object setVariable [QGVAR(computerUploadCondition), _condition];
    private _action = [
        QGVAR(computerUpload),
        "Hack and Upload Data",
        "a3\ui_f\data\igui\rsctitles\rscegprogress\downloadicon_ca.paa",
        {
            (_target setVariable [QGVAR(computerUploadActive), true, true])
        },
        {
            !(_target getVariable [QGVAR(computerUploadActive), false]) &&
            call (_target getVariable [QGVAR(computerUploadCondition), {true}])
        }
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    // Resume action
    private _resumeAction = [
        QGVAR(computerUploadResume),
        "Resume Upload",
        "a3\ui_f\data\igui\rsctitles\rscegprogress\downloadicon_ca.paa",
        {(_target setVariable [QGVAR(computerUploadPaused), false, true]);},
        {
            (_target getVariable [QGVAR(computerUploadActive), false]) &&
            (_target getVariable [QGVAR(computerUploadPaused), false]) &&
            !(_target getVariable [QGVAR(computerUploadComplete), false]) &&
            call (_target getVariable [QGVAR(computerUploadCondition), {true}])
        }
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, ["ACE_MainActions"], _resumeAction] call ace_interact_menu_fnc_addActionToObject;
};

// Initial setup - Server
if (isServer) then {
    private _fnc_randomLastLoginDate = {
        private _date = date;
        private _dateNumber = dateToNumber _date;
        _dateNumber = _dateNumber - ((1 / 365 / 24) * random 23);
        _date = numberToDate [_date select 0, _dateNumber];

        _date params ["_year", "_month", "_day", "_hours", "_minutes"];
        _hours = [_hours, 2] call CBA_fnc_formatNumber;
        _minutes = [_minutes, 2] call CBA_fnc_formatNumber;

        private _seconds = [floor random 59, 2] call CBA_fnc_formatNumber;
        private _weekDay = WEEKDAYS select ([_date] call CBA_fnc_weekDay);
        private _month = MONTHS select (_month - 1);

        [_weekDay, _month, _day, _hours, _minutes, _seconds]
    };
    (call _fnc_randomLastLoginDate) params ["_weekDay", "_month", "_day", "_hours", "_minutes", "_seconds"];

    private _host = _options getOrDefault ["host", "localhost"];
    private _user = _options getOrDefault ["user", "root"];
    private _terminalLogin = format [" %1 login: ", _user];
    private _terminalPrepare = [
        [
            format ["%1 %2", _terminalLogin, _user],
            " Password:"
        ], [
            format [" Last Login: %1 %2 %3 %4:%5:%6 on ttyl", _weekDay, _month, _day, _hours, _minutes, _seconds],
            " $"
        ], [
            " $ sysinfo",
            format ["%1@%2", _user, _host],
            "    -----------",
            "    OS: Arch Linux x86_64",
            "    Kernel: 6.4.8-arch1-1",
            "    Shell: zsh 5.9",
            "    Terminal: /dev/pts/0",
            "    CPU: AMD Ryzen 5 8000G (8) @ 3.6GHz",
            "    Memory: 649MiB / 2147MiB",
            " $"
        ], [
            " $ curl -sSf https://cdn.synixe.contractors/ztu.sh | sh",
            " "
        ], [
            "",
            "                *",
            "              &&&&",
            "           /&&&&&&",
            "         &&&&&&&",
            "        &&&&&%%%%",
            "        &&&%%%%%%%%&&&",
            "                 &&&&&&",
            "              &&&&&&&",
            "            &&&&&&&",
            "            &&&&",
            "             &",
            "",
            "Preparing Zero Trust Security Upload..",
            "Injecting Zero Trust Security Protocol..",
            ""
        ]
    ];

    private _showAtStart = _options getOrDefault ["showAtStart", true];
    if (_showAtStart) then {
        private _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminalLogin];
        _object setObjectTextureGlobal [_textureSource, _texture];
    };
    _object setVariable [QGVAR(computerUploadActive), false, true];
    _object setVariable [QGVAR(computerUploadStage), -1];
    _object setVariable [QGVAR(computerUploadPrepareStage), 0];

    private _handle = [{
        params ["_args", "_handle"];
        _args params ["_lastTime", "_terminal", "_object", "_fileSizeGB", "_textureSource", "_uploadTimeSeconds", "_onStart", "_onComplete", "_terminalPrepare", "_options"];

        // Exit if upload hasn't yet started
        if !(_object getVariable [QGVAR(computerUploadActive), false]) exitWith {};

        private _stage = _object getVariable [QGVAR(computerUploadStage), -1];

        // Prepare
        if (_stage < 0) exitWith {
            // 2s tick rate
            if (_lastTime + 1 > CBA_missionTime) exitWith {};
            _args set [0, CBA_missionTime];

            private _prepareStage = _object getVariable [QGVAR(computerUploadPrepareStage), 0];

            if (_prepareStage == 0) then {
                [_object] call _onStart;
                [QGVAR(computerUploadStarted), [_object, _fileSizeGB, _uploadTimeSeconds]] call CBA_fnc_globalEvent;
            };

            _terminal deleteAt (count _terminal - 1);
            _terminal append (_terminalPrepare select _prepareStage);

            private _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
            _object setObjectTextureGlobal [_textureSource, _texture];
            _object setVariable [QGVAR(computerUploadPrepareStage), _prepareStage + 1];

            if (_prepareStage + 1 >= count _terminalPrepare) then {
                _object setVariable [QGVAR(computerUploadStage), _stage + 1];
            };
        };

        // Handle paused state
        if (_object getVariable [QGVAR(computerUploadPaused), false]) exitWith {};

        // Resume if was paused
        if (_object getVariable [QGVAR(computerUploadWasPaused), false]) then {
            _object setVariable [QGVAR(computerUploadWasPaused), false];
            private _onResume = _options getOrDefault ["onResume", {}];
            [_object] call _onResume;
        };

        // Pause if allowed, and if enemy is closer than 2 meters
        private _allowPause = _options getOrDefault ["allowPause", true];
        private _exit = false;
        if (_allowPause) then {
            private _units = (getPos _object) nearEntities ["Man", 6];
            private _enemy = (_units findIf {side _x == east}) != -1;
            if (_enemy) then {
                _object setVariable [QGVAR(computerUploadPaused), true, true];
                _object setVariable [QGVAR(computerUploadWasPaused), true];
                private _onPause = _options getOrDefault ["onPause", {}];
                [_object] call _onPause;
                _exit = true;
            };
        };
        if (_exit) exitWith {};

        // Follow wanted upload (tick) rate from here
        if (_lastTime + 2 > CBA_missionTime) exitWith {};
        _args set [0, CBA_missionTime];

        // Upload
        private _uploaded = _fileSizeGB * (_stage / _uploadTimeSeconds);
        private _progressBar = "[          ]";
        for "_i" from 1 to floor (_stage / _uploadTimeSeconds * 10) do {
            _progressBar = _progressBar splitString "";
            _progressBar set [_i, "="];
            _progressBar = _progressBar joinString "";
        };

        private _progressString = format ["     %1GB / %2GB  %3 (%4%5)\n", (_fileSizeGB min _uploaded) toFixed 2, _fileSizeGB, _progressBar, (100 min (_stage / _uploadTimeSeconds * 100)) toFixed 2, "%"];
        _terminal set [-1, _progressString];
        _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
        _object setObjectTextureGlobal [_textureSource, _texture];
        _object setVariable [QGVAR(computerUploadStage), _stage + 2];

        // Finish
        if (_stage >= _uploadTimeSeconds) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;

            private _terminalFinal = [
                "     Completed",
                "     Wiping...",
                "     Device wiped"
            ];
            _terminal append _terminalFinal;
            _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
            _object setObjectTextureGlobal [_textureSource, _texture];
            _object setVariable [QGVAR(computerUploadComplete), true, true];

            [_object] call _onComplete;
            [QGVAR(computerUploadComplete), [_object]] call CBA_fnc_globalEvent;
        };

    }, 0.1, [CBA_missionTime, [], _object, _fileSizeGB, _textureSource, _uploadTimeSeconds, _onStart, _onComplete, _terminalPrepare, _options]] call CBA_fnc_addPerFrameHandler;
    _object setVariable [QGVAR(computerUploadHandle), _handle, true];
};
