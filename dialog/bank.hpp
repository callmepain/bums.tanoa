class life_atm_menu 
{
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;
	
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
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class MenuTitle: Life_RscStructuredText
		{
			idc = -1;

			text = "<t align='center'>Was möchtest du tun?</t>"; //--- ToDo: Localize;
			x = 0.348127 * safezoneW + safezoneX;
			y = 0.466989 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {0,0,1,0.75};
		};
		class CashTitle: Life_RscStructuredText
		{
			idc = 2701;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.301933 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.143048 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls 
	{	
		class Close: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 2400;

			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class GangDeposit: Life_RscButtonMenu
		{
			idc = 2705;
			onButtonClick = "createDialog ""Life_atm_management"";[""gangeinzahlen""] call life_fnc_bankMenu";

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.511004 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Geld wird in die Gang-Bank eingezahlt."; //--- ToDo: Localize;
		};
		class GangWithdraw: Life_RscButtonMenu
		{
			idc = 2706;
			onButtonClick = "createDialog ""Life_atm_management"";[""gangabheben""] call life_fnc_bankMenu";

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.555018 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Geld wird von der Gang-Bank abgehoben"; //--- ToDo: Localize;
		};
		class Deposit: Life_RscButtonMenu
		{
			idc = 2707;
			onButtonClick = "createDialog ""Life_atm_management"";[""einzahlen""] call life_fnc_bankMenu";

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.599033 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Geld wir auf deinem Konto eingezahlt."; //--- ToDo: Localize;
		};
		class Withdraw: Life_RscButtonMenu
		{
			idc = 2708;
			onButtonClick = "createDialog ""Life_atm_management"";[""abheben""] call life_fnc_bankMenu";

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.643048 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Geld wird von deinem Konto abgehoben."; //--- ToDo: Localize;
		};
		class Transfer: Life_RscButtonMenu
		{
			idc = 2709;
			onButtonClick = "createDialog ""Life_atm_management"";[""transfer""] call life_fnc_bankMenu";

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.687063 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
			tooltip = "Geld an Spieler überweisen. "; //--- ToDo: Localize;
		};
	};
};

class Life_atm_management {
	idd = 2750;
	name= "life_atm";
	movingEnable = 0;
	enableSimulation = 1;
	
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
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class CashTitle: Life_RscStructuredText
		{
			idc = 2751;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.301933 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.143048 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class MenuTitle: Life_RscStructuredText
		{
			idc = 2752;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.455985 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorBackground[] = {0,0,1,0.75};
		};
	};
	
	class controls 
	{		
		class Close: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 2400;

			x = 0.702113 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		class moneyEdit: Life_RscEdit
		{
			idc = 2753;

			text = "1"; //--- ToDo: Localize;
			x = 0.348127 * safezoneW + safezoneX;
			y = 0.488996 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.7};
		};
		class PlayerList: Life_RscCombo
		{
			idc = 2754;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.522007 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.7};
		};
		class Deposit100: Life_RscButtonMenu
		{
			idc = 2760;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.555018 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit500: Life_RscButtonMenu
		{
			idc = 2761;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.599033 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit1000: Life_RscButtonMenu
		{
			idc = 2762;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.643048 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit5000: Life_RscButtonMenu
		{
			idc = 2763;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.687063 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit10000: Life_RscButtonMenu
		{
			idc = 2764;

			x = 0.510125 * safezoneW + safezoneX;
			y = 0.555018 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit50000: Life_RscButtonMenu
		{
			idc = 2765;

			x = 0.510125 * safezoneW + safezoneX;
			y = 0.599033 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit100000: Life_RscButtonMenu
		{
			idc = 2766;

			x = 0.510125 * safezoneW + safezoneX;
			y = 0.643048 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Deposit: Life_RscButtonMenu
		{
			idc = 2767;

			x = 0.510125 * safezoneW + safezoneX;
			y = 0.687063 * safezoneH + safezoneY;
			w = 0.141748 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class DepositAll: Life_RscButtonMenu
		{
			idc = 2768;

			x = 0.348127 * safezoneW + safezoneX;
			y = 0.720074 * safezoneH + safezoneY;
			w = 0.303746 * safezoneW;
			h = 0.0220074 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
	};
};	