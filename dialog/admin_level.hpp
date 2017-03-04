class Admin_Level
{
	idd = 4500;
	name = "Admin_level";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class adac: life_RscStructuredText
		{
			idc = 1100;

			text = "ADAC:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ems: life_RscStructuredText
		{
			idc = 1101;
			text = "EMS:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cop: life_RscStructuredText
		{
			idc = 1102;
			text = "Cop:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class donator: life_RscStructuredText
		{
			idc = 1103;
			text = "Donator:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class admin: life_RscStructuredText
		{
			idc = 1104;
			text = "Admin:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class back: IGUIBack
		{
			idc = 2200;

			x = 0.314375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.297 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class titel: life_RscStructuredText
		{
			idc = 1105;
			text = "Level einstellen"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
	};
	class Controls
	{
		class list: Life_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "[_this,player] remoteExec ['TON_fnc_player_level_get'];";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class adac: Life_RscCombo
		{
			idc = 2100;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ems: Life_RscCombo
		{
			idc = 2101;

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cop: Life_RscCombo
		{
			idc = 2102;

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class donator: Life_RscCombo
		{
			idc = 2103;

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class admin: Life_RscCombo
		{
			idc = 2104;

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class save: Life_RscButtonMenu
		{
			idc = 1600;
			text = "save"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class close: Life_RscButtonMenu
		{
			idc = 1601;
			onButtonClick = "closeDialog 0;";
			text = "close"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};