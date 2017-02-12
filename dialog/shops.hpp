class life_weapon_shop {
    idd = 38400;
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
			// colorText[] = {1,1,1,0.7};
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
			
			text = ""; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.384743 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};		
		
		class ItemListTitel: Life_RscStructuredText
		{
			idc = 1101;

			text = ""; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.302084 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
		class MagsListTitel: Life_RscStructuredText
		{
			idc = 1102;
			// onButtonClick = "_this call life_fnc_weaponShopMags; _this call life_fnc_weaponShopFilter";

			text = ""; //--- ToDo: Localize;
			x = 0.439251 * safezoneW + safezoneX;
			y = 0.302084 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class AccsListTitel: Life_RscStructuredText
		{
			idc = 1103;

			text = ""; //--- ToDo: Localize;
			x = 0.565812 * safezoneW + safezoneX;
			y = 0.302084 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
    };

    class controls 
	{
		class Close: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class PreisInfo: Life_RscStructuredText
		{
			idc = 38401;

			x = 0.565812 * safezoneW + safezoneX;
			y = 0.687063 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0550185 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class FilterList: Life_RscCombo
		{
			idc = 38402;
			onLBSelChanged = "_this spawn life_fnc_weaponShopFilter";

			x = 0.31269 * safezoneW + safezoneX;
			y = 0.686921 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
		};
		class itemList: Life_RscListBox
		{
			idc = 38403;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection;";

			x = 0.31269 * safezoneW + safezoneX;
			y = 0.33507 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.340856 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class MagsList: Life_RscListBox
		{
			idc = 38404;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection;";

			x = 0.439251 * safezoneW + safezoneX;
			y = 0.33507 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.340856 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class AccsList: Life_RscListBox
		{
			idc = 38405;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection;";

			x = 0.565812 * safezoneW + safezoneX;
			y = 0.33507 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.340856 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class ButtonBuySell: Life_RscButtonMenu
		{
			idc = 38406;

			text = "Kaufen"; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.719907 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class AnzahlMags: Life_RscEdit
		{
			idc = 38407;
			text = "1"; //--- ToDo: Localize;
			x = 0.439251 * safezoneW + safezoneX;
			y = 0.687063 * safezoneH + safezoneY;
			w = 0.121498 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
    };
};