class Life_FuelStat {
    idd = 20300;
    name="life_fuelStat";
    movingEnabled = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";

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

			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.384743 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class VehicleTitleBox: RscStructuredText
		{
			idc = 20301;

			text = "Lagerbestand"; //--- ToDo: Localize;
			x = 0.314239 * safezoneW + safezoneX;
			y = 0.297531 * safezoneH + safezoneY;
			w = 0.246008 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class VehicleInfoHeader: RscStructuredText
		{
			idc = 20302;

			text = "Fahrzeuginformationen"; //--- ToDo: Localize;
			x = 0.570288 * safezoneW + safezoneX;
			y = 0.297531 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class FuelPrice: RscStructuredText
		{
			idc = 20303;

			text = "Price:"; //--- ToDo: Localize;
			x = 0.570288 * safezoneW + safezoneX;
			y = 0.555018 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class literfuel: RscStructuredText
		{
			idc = 20304;

			text = "Fuel:"; //--- ToDo: Localize;
			x = 0.570288 * safezoneW + safezoneX;
			y = 0.522007 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class Totalfuel: RscStructuredText
		{
			idc = 20305;

			text = "Total:"; //--- ToDo: Localize;
			x = 0.570288 * safezoneW + safezoneX;
			y = 0.58803 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,0.5};
		};
    };

    class controls 
	{
		class Close: RscButtonMenu
		{
			onButtonClick = "closeDialog 0; life_tanken = false;";

			idc = -1;
			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class VehicleList: Life_RscListBox
		{
			idc = 20306;
			onLBSelChanged = "_this call life_fnc_fuelLBChange";

			x = 0.314239 * safezoneW + safezoneX;
			y = 0.329442 * safezoneH + safezoneY;
			w = 0.246008 * safezoneW;
			h = 0.418141 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.0375;
		};
		class fuelTank: life_RscXSliderH
		{
			idc = 20307;
			onSliderPosChanged = "[3,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.570288 * safezoneW + safezoneX;
			y = 0.488996 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 20308;

			x = 0.570288 * safezoneW + safezoneX;
			y = 0.334944 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.143048 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.0375;
		};
		class refuelCar: Life_RscButtonMenu
		{
			idc = 20309;
			onButtonClick = "[] spawn life_fnc_fuelRefuelCar;";

			text = "Refuel"; //--- ToDo: Localize;
			x = 0.570288 * safezoneW + safezoneX;
			y = 0.621041 * safezoneH + safezoneY;
			w = 0.120493 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
    };
};