class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow[2405,false];ctrlShow[2406,false];";
	
	
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
		class WantedList: Life_RscListBox
		{
			idc = 2401;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			text="";
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class WantedDetails: Life_RscListBox
		{
			idc = 2402;
			text="";
			x = 0.505182 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class BountyPrice: Life_RscStructuredText
		{
			idc = 2403;
			text="";
			x = 0.505182 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class PardonButtonKey: Life_RscButtonMenu
		{
			idc = 2405;
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";

			text = "Begnadigen"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class AddButtonKey: Life_RscButtonMenu
		{
			idc = 2406;
			onButtonClick = "closeDialog 0;createDialog ""life_wantedadd2"";";
			default = "false";

			text = "Hinzufügen"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.191748 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
		};
		
	};
};