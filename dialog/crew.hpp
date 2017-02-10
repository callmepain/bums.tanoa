class HudNames {
	idd = -1;
    fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	name= "HudNames";
	onLoad = "uiNamespace setVariable ['HudNames', _this select 0]";
	
	class controlsBackground {
		class HudNames_1: Life_RscStructuredText
		{
			idc = 99999;
			size = 0.04;
			x = (SafeZoneX + 0.015);
			y = (SafeZoneY + 0.60);
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			font = "PuristaBold";
			shadow = 2;
			class Attributes {
				align = "left";
			};
		};
	};
};