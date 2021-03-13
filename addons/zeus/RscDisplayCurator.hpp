class RscText;
class RscFrame;
class RscCheckBox;
class RscControlsGroupNoScrollbars;

class RscDisplayCurator {
	class Controls {
		class Add: RscControlsGroupNoScrollbars {
			class controls {
				class Mask: RscControlsGroupNoScrollbars {
					x = 0;
                    y = safeZoneH - POS_EDGE(2,1) * GUI_GRID_H - pixelH;
                    w = 11 * GUI_GRID_W;
                    h = GUI_GRID_H + 2 * pixelH;
					class controls {
						class Background: RscText {
                            x = 0;
                            y = 0;
                            w = 11 * GUI_GRID_W;
                            h = GUI_GRID_H + 2 * pixelH;
                            colorBackground[] = {0, 0, 0, 0.2};
                        };
                        class Frame: RscFrame {
                            x = 0;
                            y = 0;
                            w = 11 * GUI_GRID_W;
                            h = GUI_GRID_H + 2 * pixelH;
                        };
                        class Label: RscText {
                            text = "Add Masks";
                            x = GUI_GRID_W;
                            y = POS_EDGE(0,1) * pixelH;
                            w = 10 * GUI_GRID_W;
                            h = GUI_GRID_H;
                            sizeEx = 0.9 * GUI_GRID_H;
                            shadow = 0;
                        };
                        class Toggle: RscCheckBox {
                            idc = 91911;
                            onLoad = QUOTE((_this select 0) cbSetChecked GVAR(addMasks));
                            onCheckedChanged = QUOTE(GVAR(addMasks) = !GVAR(addMasks));
                            x = 0.1 * GUI_GRID_W;
                            y = POS_EDGE(0,1) * pixelH;
                            w = GUI_GRID_W;
                            h = GUI_GRID_H;
                            soundClick[] = {"\a3\ui_f\data\sound\rscbutton\soundclick", 0.09, 1};
                            soundEnter[] = {"\a3\ui_f\data\sound\rscbutton\soundenter", 0.09, 1};
                            soundEscape[] = {"\a3\ui_f\data\sound\rscbutton\soundescape", 0.09, 1};
                            soundPush[] = {"\a3\ui_f\data\sound\rscbutton\soundpush", 0.09, 1};
                        };
					};
				};
			};
		};
	};
};
