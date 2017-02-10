class car_processing
{
	idd = 39400;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0;
			y = 0.2;
			w = 0.75;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackGround: Life_RscText
		{
			idc = -1;

			x = 0;
			y = 0.244;
			w = 0.75;
			h = 0.52;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscStructuredText
		{
			idc = -1;

			text = "<t align='center'>Fahrzeuge, zu denen du den Schlüssel hast</t>";
			x = 0;
			y = 0.2;
			w = 0.75;
			h = 0.05;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
	
	class controls
	{
		class vehicleList: Life_RscListBox
		{
			idc = 39402;

			x = 0.01;
			y = 0.25;
			w = 0.7375;
			h = 0.50;
			sizeEx = 0.035; 
		};
		class BtnSell: Life_RscButtonMenu
		{
			onButtonclick = "[] spawn life_fnc_processCarAction;";

			idc = 1005;
			text = "Herstellen";
			x = 0.164163;
			y = 0.770999;
			w = 0.15625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class BtnClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0";

			idc = 1006;
			text = "Schließen";
			x = 0;
			y = 0.770801;
			w = 0.15625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};