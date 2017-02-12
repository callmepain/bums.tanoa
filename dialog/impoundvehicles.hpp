class Life_impoundVehicles_menu
{
	idd = 3800;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [3330,false];ctrlShow [3303,false];";
	
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
			w = 0.384743 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
		class VehicleTitleBox: Life_RscText
		{
			idc = -1;

			text = "Deine Fahrzeuge"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class VehicleInfoHeader: Life_RscText
		{
			idc = 2830;

			text = "Fahrzeuginformationen"; //--- ToDo: Localize;
			x = 0.505182 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
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
		
		class RentCar : Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_unimpoundvehicles;closeDialog 0;";
			text = "Ausparken"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0881006 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
		class SellCar : life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_sellGarage;closeDialog 0;";

			text = "Verkaufen"; //--- ToDo: Localize;
			x = 0.406717 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0881006 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
		class VehicleList : Life_RscListBox
		{
			idc = 3802;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_garageLBChangeImpound;";
			
			//Position & height
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.385 * safezoneH;
		};
		
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 3803;
			text = "";
			sizeEx = 0.035;
			x = 0.505182 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.181384 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
				
		class MainHideText : Life_RscText
		{
			idc = 3811;
			text = "$STR_ANOTF_QueryGarage";
			x = 0.318616 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.362767 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};