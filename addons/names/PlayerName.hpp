class RscControlsGroup;
class RscText;
class RscPicture;

// REGULAR MAP
class RscDisplayMainMap {
	class controls {
		class TopRight: RscControlsGroup {
			class controls {
				class CA_PlayerName: RscText {
					fade = 1;
				};
				class GVAR(CA_PlayerName): CA_PlayerName {
					fade = 0;
					idc = IDC_Synixe_CA_PlayerName;
					text = "";
				};
				class ProfilePicture: RscPicture {
					fade = 1;
				};
				class ProfileBackground: RscText {
					fase = 1;
				};
			};
		};
	};
};

// DIARY
class RscDisplayDiary {
    class controls {
        class TopRight: RscControlsGroup {
            class controls {
				class CA_PlayerName: RscText {
					fade = 1;
				};
				class GVAR(CA_PlayerName): CA_PlayerName {
					fade = 0;
					idc = IDC_Synixe_CA_PlayerName;
					text = "";
				};
				class ProfilePicture: RscPicture {
					fade = 1;
				};
				class ProfileBackground: RscText {
					fase = 1;
				};
			};
        };
    };
};

// BRIEFING SCREEN
class RscDisplayGetReady: RscDisplayMainMap {
    class controls {
        class TopRight: RscControlsGroup {
            class controls {
				class CA_PlayerName: RscText {
					fade = 1;
				};
				class GVAR(CA_PlayerName): CA_PlayerName {
					fade = 0;
					idc = IDC_Synixe_CA_PlayerName;
					text = "";
				};
				class ProfilePicture: RscPicture {
					fade = 1;
				};
				class ProfileBackground: RscText {
					fase = 1;
				};
			};
        };
    };
};
class RscDisplayClientGetReady: RscDisplayGetReady {
    class controls {
        class TopRight: RscControlsGroup {
            class controls {
				class CA_PlayerName: RscText {
					fade = 1;
				};
				class GVAR(CA_PlayerName): CA_PlayerName {
					fade = 0;
					idc = IDC_Synixe_CA_PlayerName;
					text = "";
				};
				class ProfilePicture: RscPicture {
					fade = 1;
				};
				class ProfileBackground: RscText {
					fase = 1;
				};
			};
        };
    };
};
class RscDisplayServerGetReady: RscDisplayGetReady {
    class controls {
        class TopRight: RscControlsGroup {
            class controls {
				class CA_PlayerName: RscText {
					fade = 1;
				};
				class GVAR(CA_PlayerName): CA_PlayerName {
					fade = 0;
					idc = IDC_Synixe_CA_PlayerName;
					text = "";
				};
				class ProfilePicture: RscPicture {
					fade = 1;
				};
				class ProfileBackground: RscText {
					fase = 1;
				};
			};
        };
    };
};
