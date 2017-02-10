#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = 1;

	class controlsBackground 
	{
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 3.94 * GUI_GRID_W + GUI_GRID_X;
			y = 2.23 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 20.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class vasText: Life_RscStructuredText
		{
			idc = -1;

			text = "<t align='center'>Shopinventar</t>"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class vasgText: Life_RscStructuredText
		{
			idc = -1;

			text = "<t align='center'>Spielerinventar</t>"; //--- ToDo: Localize;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};
	
	class controls 
	{
		class itemList: Life_RscListBox
		{
			idc = 2401;

			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
			sizeEx = 1.0 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,1};
		};
		class pItemlist: Life_RscListBox
		{
			idc = 2402;

			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
			sizeEx = 1.0 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,1};
		};
		class Title: Life_RscTitle
		{
			idc = 2403;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class buyEdit: Life_RscEdit
		{
			idc = 2404;

			text = "1"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,1};
		};
		class Cash: Life_RscStructuredText
		{
			idc = 601;
			style = 1;
			
			text = "";
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class ButtonAddG: Life_ButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_virt_buy;";
			idc = 1009;

			text = "Kaufen"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.16 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class sellEdit: Life_RscEdit
		{
			idc = 2405;

			text = "1"; //--- ToDo: Localize;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,1};
		};
		class ButtonRemoveG: Life_ButtonMenu
		{
			onButtonClick = "[false] call life_fnc_virt_sell";
			idc = 1011;

			text = "einzeln Verkaufen"; //--- ToDo: Localize;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class ButtonRemoveA: Life_ButtonMenu
		{
			onButtonClick = "[true] call life_fnc_virt_sell";
			idc = 1013;

			text = "alles ausgewählte Verkaufen"; //--- ToDo: Localize;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1013;
			text = "Schließen"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};