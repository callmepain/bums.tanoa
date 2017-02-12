class Life_My_Gang_Diag 
{
    idd = 2620;
    name= "life_my_gang_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "";

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
        class GangMemberList: Life_RscListBox
		{
			idc = 2621;
			sizeEx = 0.04;
			x = 0.311362 * safezoneW + safezoneX;
			y = 0.2976 * safezoneH + safezoneY;
			w = 0.248755 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class GangLeave: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_gangLeave";

			idc = 1005;
			text = "Verlassen"; //--- ToDo: Localize;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class GangLock: Life_RscButtonMenu
		{
			idc = 2622;
			onButtonClick = "[] spawn life_fnc_gangUpgrade";

			text = "Anzahl erhöhen"; //--- ToDo: Localize;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class GangKick: Life_RscButtonMenu
		{
			idc = 2624;
			onButtonClick = "[] call life_fnc_gangKick";

			text = "Kicken"; //--- ToDo: Localize;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class GangLeader: Life_RscButtonMenu
		{
			idc = 2625;
			onButtonClick = "[] spawn life_fnc_gangNewLeader";

			text = "Neuer Anführer"; //--- ToDo: Localize;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class InviteMember: GangLeader
		{
			idc = 2630;
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";

			text = "Spieler einladen"; //--- ToDo: Localize;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class DisbandGang: InviteMember
		{
			idc = 2631;
			onButtonClick = "[] spawn life_fnc_gangDisband";

			text = "Gang auflösen"; //--- ToDo: Localize;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class ColorList: Life_RscCombo
		{
			idc = 2632;
			// sizeEx = 0.04;
			x = 0.567371 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class GangBank: RscStructuredText
		{
			idc = 601;
			style = 1;

			x = 0.567372 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
    };
};

class Life_Create_Gang_Diag 
{
    idd = 2520;
    name= "life_my_gang_menu_create";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format [localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";

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

			text = "<t align='center'>Gang erstellen</t>"; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.383497 * safezoneW;
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
        class InfoMsg: Life_RscStructuredText
		{
			idc = 2523;
			text="";
			x = 0.385987 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.222843 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class GangCreateField: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_createGang";

			idc = 1005;
			text = "Erstellen"; //--- ToDo: Localize;
			x = 0.385987 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.222843 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class CreateGangText: Life_RscEdit
		{
			idc = 2522;

			text = "Dein Gangname"; //--- ToDo: Localize;
			x = 0.385987 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.222843 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	};
};