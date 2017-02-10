class Life_Vehicle_Shop_v2_3D {
    idd = 2300;
    name="life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";
    onUnLoad = "[] call life_fnc_vehicleShopEnd3DPreview";

    class controlsBackground 
	{
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.0204218 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.150657 * safezoneW;
			h = 0.678817 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class SecondBackground: Life_RscText
		{
			idc = -1;

			x = 0.810943 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscTitle
		{
			idc = 2301;

			x = -26.27 * GUI_GRID_W + GUI_GRID_X;
			y = -9 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.9294 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
			text = "";
		};
		class VehicleTitleBox: Life_RscText
		{
			idc = -1;

			text = "Lagerbestand"; //--- ToDo: Localize;
			x = 0.0204218 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class VehicleInfoHeader: Life_RscText
		{
			idc = 2330;

			text = "Fahrzeuginformationen"; //--- ToDo: Localize;
			x = 0.809389 * safezoneW + safezoneX;
			y = 0.05802 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class CloseBtn: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1005;
			text = ""; //--- ToDo: Localize;
			x = 0.0232205 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class RentCar: Life_RscButtonMenu
		{
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";

			idc = 1006;
			text = ""; //--- ToDo: Localize;
			x = 0.0232205 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Mietet das ausgewählte Fahrzeug"; //--- ToDo: Localize;
		};
		class BuyCar: Life_RscButtonMenu
		{
			idc = 1007;
			onButtonClick = "[true,false] spawn life_fnc_vehicleShopBuy;";

			text = ""; //--- ToDo: Localize;
			x = 0.0232205 * safezoneW + safezoneX;
			y = 0.659 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Kauft das ausgewählte Fahrzeug ohne Versicherungsschutz"; //--- ToDo: Localize;
		};

		class BuyVCar: Life_RscButtonMenu
		{
			idc = 1008;
			onButtonClick = "[true,true] spawn life_fnc_vehicleShopBuy;";

			text = ""; //--- ToDo: Localize;
			x = 0.0232205 * safezoneW + safezoneX;
			y = 0.634 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Kauft das ausgewählte Fahrzeug mit Versicherungsschutz"; //--- ToDo: Localize;
		};
    };

    class controls 
	{
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";

			x = 0.0235313 * safezoneW + safezoneX;
			y = 0.09498 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.500001 * safezoneH;
			sizeEx = 1.0 * GUI_GRID_H;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class ColorList: Life_RscCombo
		{
			idc = 2304;
			onLBSelChanged = "[] call life_fnc_vehicleColor3DRefresh;";

			x = -26.27 * GUI_GRID_W + GUI_GRID_X;
			y = 17.2 * GUI_GRID_H + GUI_GRID_Y;
			h = 0.999805 * GUI_GRID_H;
			w = 14.4268 * GUI_GRID_W;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;
			x = 0.810943 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			// x = 0.81965 * safezoneW + safezoneX;
			// y = 0.104 * safezoneH + safezoneY;
			// w = 0.175313 * safezoneW;
			// h = 0.275 * safezoneH;
			w = 0.190781 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
    };
};
