class RscPicture;
class RscText;
class RscStructuredText;

class GVAR(CardDialog) {
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(display),_this select 0)]);
	class ControlsBackground {
		class CardBackground: RscPicture {
			idc = IDC_PHOTO;
			text = "\z\synixe_contractors\addons\names\ui\card.paa";
			x = QUOTE(0.434258 * safezoneW + safezoneX);
			y = QUOTE(0.181 * safezoneH + safezoneY);
			w = QUOTE(0.135352 * safezoneW);
			h = QUOTE(0.627 * safezoneH);
		};
	};
	class Controls {
		class FirstName: RscText {
			idc = IDC_FIRST;
			text = "";
			x = QUOTE(0.484531 * safezoneW + safezoneX);
			y = QUOTE(0.34 * safezoneH + safezoneY);
			w = QUOTE(0.06 * safezoneW);
			h = QUOTE(0.055 * safezoneH);
			colorText[] = {0,0,0,1};
			shadow = 0;
		};
		class LastName: RscText {
			idc = IDC_LAST;
			text = "";
			x = QUOTE(0.484531 * safezoneW + safezoneX);
			y = QUOTE(0.3825 * safezoneH + safezoneY);
			w = QUOTE(0.06 * safezoneW);
			h = QUOTE(0.055 * safezoneH);
			colorText[] = {0,0,0,1};
			shadow = 0;
		};
		class Certifications: RscStructuredText {
			idc = IDC_CERTS;
			text = "";
			x = QUOTE(0.449727 * safezoneW + safezoneX);
			y = QUOTE(0.47 * safezoneH + safezoneY);
			w = QUOTE(0.108281 * safezoneW);
			h = QUOTE(0.286 * safezoneH);
		};
		class ID: RscText {
			idc = IDC_STEAM;
			text = "";
			x = QUOTE(0.449727 * safezoneW + safezoneX);
			y = QUOTE(0.76 * safezoneH + safezoneY);
			w = QUOTE(0.108281 * safezoneW);
			h = QUOTE(0.044 * safezoneH);
			shadow = 0;
			colorText[] = {0,0,0,1};
			align = "center";
		};
	};
};
