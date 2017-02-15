class kaution
{
	idd = 55550;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		
		class HintergrundPic: RscPicture
		{
			idc = -1;

			text = "images\tablet\tablet.paa";
			x = 0.258501 * safezoneW + safezoneX;
			y = 0.07166 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.854 * safezoneH;
			// colorText[] = {1,1,1,0.7};
		};
		
		class Hintergrund: IGUIBack
		{
			idc = 2200;

			x = 0.300306 * safezoneW + safezoneX;
			y = 0.2602 * safezoneH + safezoneY;
			w = 0.401645 * safezoneW;
			h = 0.50617 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class Titel: RscStructuredText
		{
			idc = 1100;

			text = ""; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.384743 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
		class Kaution: RscStructuredText
		{
			idc = 55551;

			x = 0.494979 * safezoneW + safezoneX;
			y = 0.301933 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.0550185 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.7};
		};
		class Zeit: RscStructuredText
		{
			idc = 55552;

			x = 0.494979 * safezoneW + safezoneX;
			y = 0.378959 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.143048 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls
	{
		class Close: RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";

			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		
		class PlayerList: Life_RscListBox
		{
			idc = 55553;
			onLBSelChanged = "_this call life_fnc_kautionLBChange;";
			x = 0.314239 * safezoneW + safezoneX;
			y = 0.301933 * safezoneH + safezoneY;
			w = 0.170699 * safezoneW;
			h = 0.440148 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.7};
		};
		class KautionBezahlen: Life_RscButtonMenu
		{
			onButtonclick = "[] call life_fnc_kaution;";
			idc = 55554;

			x = 0.494979 * safezoneW + safezoneX;
			y = 0.544015 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
	};
};