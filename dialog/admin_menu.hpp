class life_admin_menu {
    idd = 2900;
    name= "life_admin_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_adminMenu";

    class controlsBackground {
		class HG: life_RscPicture
		{
			 idc = -1;
			 text = "images\tablet\tablet.paa";
			 x = 0.258501 * safezoneW + safezoneX;
			 y = 0.0716 * safezoneH + safezoneY;
			 w = 0.485625 * safezoneW;
			 h = 0.854 * safezoneH;
			// colorText[] = {1,1,1,0.8};
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
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			text = "$STR_Admin_Title"; //--- ToDo: Localize;
			x = 0.306593 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class PlayerList_Admin: Life_RscListBox
		{
			idc = 2902;
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			sizeEx = 0.04;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

        class PlayerBInfo: Life_RscStructuredText
		{
			idc = 2903;
			sizeEx = 0.04;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
    };

    class controls {
		class Close: RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0";

			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};

        class ID_abfragen: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_adminGetID";

			idc = 1002;
			text = "$STR_Admin_GetID"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

       class Entschadigen: Life_RscButtonMenu
		{
			idc = 2904;
			onButtonClick = "createDialog 'Life_Admin_Compensate'";

			text = "$STR_Admin_Compensate"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class Zuschauen: Life_RscButtonMenu
		{
			idc = 2905;
			onButtonClick = "[] call life_fnc_adminSpectate";

			text = "$STR_Admin_Spectate"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class Teleport: Life_RscButtonMenu
		{
			idc = 2906;
			onButtonClick = "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport'";

			text = "$STR_Admin_Teleport"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class TPHIER: Life_RscButtonMenu
		{
			idc = 2907;
			onButtonClick = "[] call life_fnc_adminTpHere";

			text = "$STR_Admin_TpHere"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class GottMod: Life_RscButtonMenu
		{
			idc = 2908;
			onButtonClick = "[] call life_fnc_adminGodMode";

			text = "$STR_Admin_God"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class Einfrieren: Life_RscButtonMenu
		{
			idc = 2909;
			onButtonClick = "[] call life_fnc_adminFreeze";

			text = "$STR_Admin_Freeze"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class Spieler_Markierungen: Life_RscButtonMenu
		{
			idc = 2910;
			onButtonClick = "[] spawn life_fnc_adminMarkers;closeDialog 0";

			text = "$STR_Admin_Markers"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

        class Debug: Life_RscButtonMenu
		{
			idc = 2911;
			onButtonClick = "[] call life_fnc_adminDebugCon";

			text = "$STR_Admin_Debug"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class Level: Life_RscButtonMenu
		{
			idc = 2912;
			onButtonClick = "[] call life_fnc_admin_level";

			text = "Level"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
    };
};