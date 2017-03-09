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

			x = 0.0204217 * safezoneW + safezoneX;
			y = 0.0203867 * safezoneH + safezoneY;
			w = 0.206847 * safezoneW;
			h = 0.928713 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class SecondBackground: Life_RscText
		{
			idc = -1;

			x = 0.788181 * safezoneW + safezoneX;
			y = 0.0884614 * safezoneH + safezoneY;
			w = 0.195801 * safezoneW;
			h = 0.380728 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscStructuredText
		{
			idc = 1002;

			text = "ShopTitel"; //--- ToDo: Localize;
			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.0268408 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0330111 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class VehicleTitleBox: Life_RscStructuredText
		{
			idc = 1003;

			text = "Lagerbestand"; //--- ToDo: Localize;
			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.0642533 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0330111 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class VehicleInfoHeader: Life_RscStructuredText
		{
			idc = 1004;

			text = "Fahrzeuginformationen"; //--- ToDo: Localize;
			x = 0.792197 * safezoneW + safezoneX;
			y = 0.0928632 * safezoneH + safezoneY;
			w = 0.188773 * safezoneW;
			h = 0.0330111 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
    };

    class controls 
	{
		class CloseBtn: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 1005;

			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.918141 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class RentCar: Life_RscButtonMenu
		{
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			idc = 1006;

			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.88513 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Mietet das ausgewählte Fahrzeug"; //--- ToDo: Localize;
		};
		class BuyCar: Life_RscButtonMenu
		{
			idc = 1007;
			onButtonClick = "[true,false] spawn life_fnc_vehicleShopBuy;";

			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.852118 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Kauft das ausgewählte Fahrzeug ohne Versicherungsschutz"; //--- ToDo: Localize;
		};
		class BuyVCar: Life_RscButtonMenu
		{
			idc = 1008;
			onButtonClick = "[true,true] spawn life_fnc_vehicleShopBuy;";

			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.819107 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Kauft das ausgewählte Fahrzeug mit Versicherungsschutz"; //--- ToDo: Localize;
		};
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";

			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.103865 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.671226 * safezoneH;
			sizeEx = 0.04;
			style = 0;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class ColorList: Life_RscCombo
		{
			idc = 2304;
			onLBSelChanged = "[] call life_fnc_vehicleColor3DRefresh;";

			x = 0.0230467 * safezoneW + safezoneX;
			y = 0.786096 * safezoneH + safezoneY;
			w = 0.200822 * safezoneW;
			h = 0.0220074 * safezoneH;
			style = 0;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;

			x = 0.792197 * safezoneW + safezoneX;
			y = 0.132477 * safezoneH + safezoneY;
			w = 0.188772 * safezoneW;
			h = 0.330111 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
    };
};
