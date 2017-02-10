class Life_Vehicle_Shop_v3
{
	idd = 2300;
	name="Life_Vehicle_Shop_v3";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.85 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			idc = 2301;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VehicleTitleBox: Life_RscText
		{
			idc = -1;
			text = "$STR_GUI_ShopStock";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.11;
			y = 0.26;
			w = 0.3625;
			h = 0.04;
		};
		
		class VehicleInfoHeader: Life_RscText
		{
			idc = 2330;
			text = "$STR_GUI_VehInfo";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.495;
			y = 0.26;
			w = 0.4;
			h = 0.04;
		};		
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1.05 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_vehicleShopMarketChange";

			x = 0.11;
			y = 0.312;
			w = 0.3625;
			h = 0.68;
		};
				
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.035;

			x = 0.495;
			y = 0.312;
			w = 0.4;
			h = 0.68;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
	};
};

class Life_Market
{
	idd = 2300;
	name="Life_Market";
	movingEnabled = 0;
	enableSimulation = 1;

	
	class controlsBackground
	{
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.85 - (22 / 250);
		};
		
		class Title : Life_RscStructuredText
		{
			idc = 2301;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VehicleTitleBox: Life_RscStructuredText
		{
			idc = 2302;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.11;
			y = 0.26;
			w = 0.3625;
			h = 0.04;
		};
		
		class VehicleInfoHeader: Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.495;
			y = 0.26;
			w = 0.4;
			h = 0.04;
		};		
		
	};
	
	class controls
	{
	
		class Economy_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.11;
			y = 0.312;
			w = 0.785;
			h = 0.68;
			
			class Controls
			{
				class VehicleList: Life_RscStructuredText
				{
					idc = 2304;
					text = "";
					sizeEx = 0.04;
					colorBackground[] = {0.1,0.1,0.1,0.9};
					w = 0.75; 
					h = 1.5 - (22 / 250);
				};
			};
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1.05 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};