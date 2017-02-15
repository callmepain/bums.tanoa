class Life_key_management 
{
    idd = 2700;
    name= "life_key_chain";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_keyMenu;";

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
			// colorText[] = {1,1,1,0.5};
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
		class KeyChainList: Life_RscListBox
		{
			idc = 2701;
			text = "";
			x = 0.318616 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.36795 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class NearPlayers: Life_RscCombo
		{
			idc = 2702;
			text = "";
			x = 0.318616 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.36795 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			sizeEx = 0.03;
		};
		class DropKey: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_keyDrop";

			idc = 1006;
			text = "Wegwerfen"; //--- ToDo: Localize;
			x = 0.318616 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class GiveKey: Life_RscButtonMenu
		{
			idc = 2703;
			onButtonClick = "[] call life_fnc_keyGive";

			text = "Geben"; //--- ToDo: Localize;
			x = 0.505182 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
    };
};