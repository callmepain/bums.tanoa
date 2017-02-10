class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground 
	{
		
		class HintergrundPic: RscPicture
		{
			idc = -1;

			text = "images\tablet\tablet.paa";
			x = 0.258522 * safezoneW + safezoneX;
			y = 0.0716208 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.854001 * safezoneH;
			// colorText[] = {1,1,1,0.5};
		};
		class Titel: RscStructuredText
		{
			idc = 1100;

			x = 0.308235 * safezoneW + safezoneX;
			y = 0.266898 * safezoneH + safezoneY;
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Hintergrund: IGUIBack
		{
			idc = 2200;

			x = 0.305096 * safezoneW + safezoneX;
			y = 0.260301 * safezoneH + safezoneY;
			w = 0.391786 * safezoneW;
			h = 0.4994 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class vasText: Life_RscStructuredText
		{
			idc = -1;

			x = 0.307628 * safezoneW + safezoneX;
			y = 0.297686 * safezoneH + safezoneY;
			w = 0.18731 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class vasgText: Life_RscStructuredText
		{
			idc = -1;

			x = 0.505062 * safezoneW + safezoneX;
			y = 0.295487 * safezoneH + safezoneY;
			w = 0.18731 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
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
		
		class itemList: Life_RscListBox
		{
			idc = 2401;

			x = 0.307628 * safezoneW + safezoneX;
			y = 0.324074 * safezoneH + safezoneY;
			w = 0.18731 * safezoneW;
			h = 0.318865 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class pItemlist: Life_RscListBox
		{
			idc = 2402;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.324074 * safezoneH + safezoneY;
			w = 0.192372 * safezoneW;
			h = 0.318865 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class Title: Life_RscTitle
		{
			idc = 2403;

			x = 0.307628 * safezoneW + safezoneX;
			y = 0.269097 * safezoneH + safezoneY;
			w = 0.323996 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class buyEdit: Life_RscEdit
		{
			idc = 2404;

			text = "1"; //--- ToDo: Localize;
			x = 0.307628 * safezoneW + safezoneX;
			y = 0.653935 * safezoneH + safezoneY;
			w = 0.18731 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class Cash: Life_RscStructuredText
		{
			idc = 601;
			style = 1;

			x = 0.368377 * safezoneW + safezoneX;
			y = 0.269097 * safezoneH + safezoneY;
			w = 0.323996 * safezoneW;
			h = 0.0175926 * safezoneH;
		};
		class ButtonAddG: Life_ButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_virt_buy;";
			idc = 1009;

			x = 0.307628 * safezoneW + safezoneX;
			y = 0.697916 * safezoneH + safezoneY;
			w = 0.18731 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class sellEdit: Life_RscEdit
		{
			idc = 2405;

			text = "1"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.653935 * safezoneH + safezoneY;
			w = 0.192372 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class ButtonRemoveG: Life_ButtonMenu
		{
			onButtonClick = "[false] call life_fnc_virt_sell";
			idc = 1011;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.686921 * safezoneH + safezoneY;
			w = 0.192372 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class ButtonRemoveA: Life_ButtonMenu
		{
			onButtonClick = "[true] call life_fnc_virt_sell";
			idc = 1013;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.719907 * safezoneH + safezoneY;
			w = 0.192372 * safezoneW;
			h = 0.0219907 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};
};