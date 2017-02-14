class jail_time
{
	idd = 26500;
	name = "jail_time";
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
			// colorText[] = {1,1,1,0.75};
		};
		class Hintergrund: IGUIBack
		{
			idc = 2200;

			x = 0.305143 * safezoneW + safezoneX;
			y = 0.2602 * safezoneH + safezoneY;
			w = 0.391787 * safezoneW;
			h = 0.4994 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Titel: RscStructuredText
		{
			idc = 1100;

			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.384743 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Hintergrund2: IGUIBack
		{
			idc = 1600;
			x = 0.388627 * safezoneW + safezoneX;
			y = 0.422974 * safezoneH + safezoneY;
			w = 0.20756 * safezoneW;
			h = 0.154052 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls 
	{
		class Close: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 2400;

			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class Info: Life_RscStructuredText
		{
			idc = 1000;

			text = "Zeit angeben, für wie viele Minuten die Person im Knast bleiben soll. 5 - 120 Minuten möglich."; //--- ToDo: Localize;
			x = 0.393689 * safezoneW + safezoneX;
			y = 0.334944 * safezoneH + safezoneY;
			w = 0.20756 * safezoneW;
			h = 0.0880296 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class Zeit: Life_RscText
		{
			idc = 1001;

			text = "Zeit:"; //--- ToDo: Localize;
			x = 0.398751 * safezoneW + safezoneX;
			y = 0.455985 * safezoneH + safezoneY;
			w = 0.0303746 * safezoneW;
			h = 0.0220074 * safezoneH;
		};
		class Minuten: Life_RscText
		{
			idc = 1002;

			text = "Minuten im Knast"; //--- ToDo: Localize;
			x = 0.459501 * safezoneW + safezoneX;
			y = 0.455985 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
		};
		class Time: Life_RscEdit
		{
			idc = 1400;

			text = "15"; //--- ToDo: Localize;
			x = 0.429126 * safezoneW + safezoneX;
			y = 0.455985 * safezoneH + safezoneY;
			w = 0.0303746 * safezoneW;
			h = 0.0220074 * safezoneH;
		};
		class OKButtonKey: Life_RscButtonMenu
		{
			idc = 2402;
			onButtonClick = "[] spawn life_fnc_jail_time;";

			text = "OK"; //--- ToDo: Localize;
			x = 0.393689 * safezoneW + safezoneX;
			y = 0.687063 * safezoneH + safezoneY;
			w = 0.20756 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Kaution: Life_RscText
		{
			idc = 1100;

			text = "Zeit:"; //--- ToDo: Localize;
			x = 0.398751 * safezoneW + safezoneX;
			y = 0.522007 * safezoneH + safezoneY;
			w = 0.0303746 * safezoneW;
			h = 0.0220074 * safezoneH;
		};
		class Kaution_time: Life_RscEdit
		{
			idc = 1401;

			text = "0"; //--- ToDo: Localize;
			x = 0.429126 * safezoneW + safezoneX;
			y = 0.522007 * safezoneH + safezoneY;
			w = 0.0303746 * safezoneW;
			h = 0.0220074 * safezoneH;
		};
		class KautionMinuten: Life_RscText
		{
			idc = 1101;

			text = "Minuten bis Kaution bezahlbar"; //--- ToDo: Localize;
			x = 0.459501 * safezoneW + safezoneX;
			y = 0.522007 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
		};
		class Info2: Life_RscStructuredText
		{
			idc = 1102;

			text = "Zeit angeben, ab wann es möglich ist, Kaution zu bezahlen. HÃƒÂ¤lfte der Knastzeit angeben, 0 deaktviert das Feature."; //--- ToDo: Localize;
			x = 0.393689 * safezoneW + safezoneX;
			y = 0.577026 * safezoneH + safezoneY;
			w = 0.20756 * safezoneW;
			h = 0.0880296 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
};