class life_wantedadd2 {
	idd = 9900;
	name= "life_wantedadd2";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_wantedadd2;";
	
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
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls 
	{		
		class Close: RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_wantedMenu;";

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
			idc = 9902;
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";

			x = 0.313434 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.155472 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class RSUCombo_2101: Life_RscListBox
		{
			idc = 9991;

			x = 0.474088 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.212478 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class WantedAdd: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_wanted2";
			idc = 9992;

			text = "Hinzufügen"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.373132 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
};