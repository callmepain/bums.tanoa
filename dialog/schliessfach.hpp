class SchliessfachMenu
{
	idd = 4500;
	name = "SchliessfachMenu";
	movingEnable = 0;
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
			//colorText[] = {1,1,1,0.7};
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
			idc = 4100;

			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class RscTrunkText: RscStructuredText
		{
			idc = 4200;

			text = "<t align='center'>Schliessfach Inhalt</t>"; //--- ToDo: Localize;
			x = 0.318616 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.176201 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class RscPlayerText: RscStructuredText
		{
			idc = 4201;

			text = "<t align='center'>Spieler Inventar</t>"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class RscKaufenText: RscStructuredText
		{
			idc = 4202;

			text = "<t align='center'>Du hast noch kein Schliessfach! Möchtest du dir eins kaufen?</t>"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
	};
	
	class Controls
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
		class TrunkGear: Life_RscListBox
		{
			idc = 4502;

			x = 0.318616 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class PlayerGear: Life_RscListBox
		{
			idc = 4503;

			x = 0.500915 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class TrunkEdit: Life_RscEdit
		{
			idc = 4505;

			text = "1"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.176201 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class PlayerEdit: Life_RscEdit
		{
			idc = 4506;

			text = "1"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class TakeItem: Life_RscButtonMenu
		{
			onButtonClick = "[false] call life_fnc_schliessfachTakeItem;";
			idc = 4010;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.176201 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class StoreItem: Life_RscButtonMenu
		{
			onButtonClick = "[false] call life_fnc_schliessfachStoreItem;";
			idc = 4011;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class TakeAllItem: Life_RscButtonMenu
		{
			onButtonClick = "[true] call life_fnc_schliessfachTakeItem;";
			idc = 4013;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.176201 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class StoreAllItem: Life_RscButtonMenu
		{
			onButtonClick = "[true] call life_fnc_schliessfachStoreItem;";
			idc = 4014;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class expand: Life_RscButtonMenu
		{
			idc = 1600;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class kaufen: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_buyschliessfach;";
			idc = 1601;
			colorBackgroundFocused[] = {1,1,1,0.12};

			text = "Kaufen für 10000$"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
	};
};


