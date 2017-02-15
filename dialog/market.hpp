class marketView
{
	idd = 39500;
	movingEnabled = 0;
	enableSimulation = 1;
	// onLoad = "[] spawn life_fnc_boerse;";
	onLoad = "[true] spawn life_fnc_boerse;";
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
			// colorText[] = {1,1,1,1};
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
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class ResourceName: RscStructuredText
		{
			idc = 1000;

			x = 0.541459 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.150289 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class ResourcePreis: RscStructuredText
		{
			idc = 1001;

			x = 0.54146 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.150289 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0.7};
		};
		class EntwicklungTitel: RscStructuredText
		{
			idc = 1101;

			text = ""; //--- ToDo: Localize;
			x = 0.54146 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.150289 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TrendGlobalPic: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.54146 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0362767 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TrendLocalPic: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.54146 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0362767 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TrendGlobalTitel: RscText
		{
			idc = 1002;

			text = "Preisänderung seit Serverrestart"; //--- ToDo: Localize;
			x = 0.582918 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TrendLocalTitel: RscText
		{
			idc = 1003;

			text = "Preisänderung vor kurzem"; //--- ToDo: Localize;
			x = 0.582918 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TrendGlobal: RscStructuredText
		{
			idc = 1004;

			x = 0.582918 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TrendLocal: RscStructuredText
		{
			idc = 1005;

			x = 0.582918 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class NahrungTitel: RscStructuredText
		{
			idc = 1102;

			x = 0.313434 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RohstoffeTitel: RscStructuredText
		{
			idc = 1103;

			x = 0.427447 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class DrogenTitel: RscStructuredText
		{
			idc = 1104;

			x = 0.313434 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class MultiTitel: RscStructuredText
		{
			idc = 1105;

			x = 0.427447 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.022 * safezoneH;
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
		class ResourceNahrung: RscListBox
		{
			idc = 1500;
			onLBSelChanged = "_this spawn life_fnc_boerseLBChange";

			x = 0.313434 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class ResourceRohstoffe: RscListBox
		{
			idc = 1501;
			onLBSelChanged = "_this spawn life_fnc_boerseLBChange";

			x = 0.427447 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class ResourceDrogen: RscListBox
		{
			idc = 1502;
			onLBSelChanged = "_this spawn life_fnc_boerseLBChange";

			x = 0.313434 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class ResourceMulti: RscListBox
		{
			idc = 1503;
			onLBSelChanged = "_this spawn life_fnc_boerseLBChange";

			x = 0.427447 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.10883 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
	};	
};