class Life_my_smartphone {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone;";
	class controlsBackground 
	{
		class HintergrundPic: Life_RscPicture
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
		
		class Titel: Life_RscStructuredText
		{
			idc = 1100;

			text = ""; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Close: Life_RscButtonMenu
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
	};

	class controls 
	{
		class AlleNachrichtenTitle: Life_RscStructuredText
		{
			idc = 88886;
			text = ""; //
			x = 0.408876 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.283496 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			sizeEx = 0.04;
		};
		class NachrichtTitle: Life_RscStructuredText
		{
			idc = 88890;

			text = "Wähle eine Nachricht aus, um sie zu lesen"; //--- ToDo: Localize;
			x = 0.408876 * safezoneW + safezoneX;
			y = 0.5022 * safezoneH + safezoneY;
			w = 0.283496 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			sizeEx = 0.04;
		};
		class PlayerList: Life_RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			text = ""; 
			x = 0.312689 * safezoneW + safezoneX;
			y = 0.3284 * safezoneH + safezoneY;
			w = 0.0911237 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class AlleNachrichtenList: Life_RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call life_fnc_showMsg;";
			columns[] = {0,0.6};
			x = 0.408876 * safezoneW + safezoneX;
			y = 0.3306 * safezoneH + safezoneY;
			w = 0.283496 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.04;
		};
		class Nachricht: Life_RscListBox
		{
			idc = 88887;
			text = ""; 
			x = 0.408876 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.283496 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = 0.04;
		};
		class Schreiben: Life_RscButtonMenu
		{
			idc = 887892;
			onButtonClick = "[3] call life_fnc_smartphone;";
			// onButtonClick = "createDialog ""Life_smartphone_schreiben"";";

			text = "Nachricht schreiben"; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.16706 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		class PlayerListTitle: Life_RscStructuredText
		{
			idc = 88889;

			text = ""; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.2976 * safezoneH + safezoneY;
			w = 0.0911237 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			sizeEx = 0.04;
		};
		class Notruf: Life_RscButtonMenu
		{
			onButtonClick = "[4] call life_fnc_smartphone;";

			idc = 887893;
			text = "Emergency call"; //--- ToDo: Localize;
			x = 0.525312 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.16706 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};
	};
};

class Life_smartphone_schreiben
{
	idd = 88883;
	name = "life_my_smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_newMsgInit;";
	class controlsBackground 
	{

		class HintergrundPic: Life_RscPicture
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
		
		class Titel: Life_RscStructuredText
		{
			idc = 2100;

			text = ""; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	class controls 
	{
		class Close: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.702092 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};
		
		class textEdit: Life_RscEdit
		{
			idc = 88884;
			sizeEx = 0.04;
			style = 16;
			lineSpacing = 1;
			text = "";
			x = 0.322815 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.359432 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class Zeichenlimit: Life_RscStructuredText
		{
			idc = 2101;

			x = 0.322815 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.359432 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class Absenden: Life_RscButtonMenu
		{
			idc = 92000;
			onButtonClick = "[1,(ctrlText 88884)] call life_fnc_newMsgSend;";
			
			text = "Send"; //--- ToDo: Localize;
			x = 0.322815 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.359432 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class AdminMsg: Life_RscButtonMenu
		{
			idc = 92001;
			onButtonClick = "[4,(ctrlText 88884)] call life_fnc_newMsgSend;";

			text = "Admin-Nachricht senden"; //--- ToDo: Localize;
			x = 0.510124 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.172123 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class MedicMsg: Life_RscButtonMenu
		{
			idc = 92002;
			onButtonClick = "[2,(ctrlText 88884)] call life_fnc_newMsgSend;";
			
			text = "Medic-Nachricht senden"; //--- ToDo: Localize;
			x = 0.322815 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.172123 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class ADACMsg: Life_RscButtonMenu
		{
			idc = 92003;
			onButtonClick = "[3,(ctrlText 88884)] call life_fnc_newMsgSend;";
			
			text = "ADAC-Nachricht senden"; //--- ToDo: Localize;
			x = 0.322815 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.172123 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class CopMsg: Life_RscButtonMenu
		{
			idc = 92004;
			onButtonClick = "[5,(ctrlText 88884)] call life_fnc_newMsgSend;";
			
			text = "Cop-Nachricht senden"; //--- ToDo: Localize;
			x = 0.510125 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.172123 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
	};	
};

class Life_smartphone_notruf 
{
	idd = 88885;
	name= "life_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn life_fnc_newMsgInit;";
	class controlsBackground 
	{
		class HintergrundPic: Life_RscPicture
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
		
		class Titel: Life_RscStructuredText
		{
			idc = 3100;

			text = ""; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.584,0.086,0.086,1};
		};
	};
	class controls 
	{
		class Close: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.702092 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0259119 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Schließt das Fenster"; //--- ToDo: Localize;
		};

		class textEdit: Life_RscEdit
		{
			idc = 88886;
			sizeEx = 0.04;
			style = 16;
			lineSpacing = 1;
			text = "";
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.37462 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class Zeichenlimit: Life_RscStructuredText
		{
			idc = 3101;
			sizeEx = 0.04;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.37462 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class AnCops: Life_RscButtonMenu
		{
			idc = 93000;
			onButtonClick = "[6,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "An die Polizei"; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Nachricht an alle Cops"; //--- ToDo: Localize;
		};
		
		class AnAdmins: Life_RscButtonMenu
		{
			idc = 93001;
			onButtonClick = "[9,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "An die Admins"; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Nachricht an alle Admins"; //--- ToDo: Localize;
		};
				
		class AnMedic: Life_RscButtonMenu
		{
			idc = 93002;
			onButtonClick = "[7,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "An die SanitÃƒÂ¤ter"; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Nachricht an alle Medics"; //--- ToDo: Localize;
		};
		
		class AnADAC: Life_RscButtonMenu
		{
			idc = 93004;
			onButtonClick = "[8,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "an ADAC"; //--- ToDo: Localize;
			x = 0.31269 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Nachricht an alle ADAC-Mitarbeiter"; //--- ToDo: Localize;
		};
		
		class AdminsAnAlle: Life_RscButtonMenu
		{
			idc = 93005;
			onButtonClick = "[13,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "Admin-Nachricht an alle"; //--- ToDo: Localize;
			x = 0.510125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Admin-Nachricht an alle "; //--- ToDo: Localize;
		};
		
		class CopsAnAlle: Life_RscButtonMenu
		{
			idc = 93006;
			onButtonClick = "[10,(ctrlText 88886)] call life_fnc_newMsgSend;";
			
			text = "Cop-Nachricht an alle"; //--- ToDo: Localize;
			x = 0.510125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Cop-Nachricht an alle "; //--- ToDo: Localize;
		};
		
		class MedicsAnAlle: Life_RscButtonMenu
		{
			idc = 93007;
			onButtonClick = "[11,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "Medic-Nachricht an alle"; //--- ToDo: Localize;
			x = 0.510125 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die Medic-Nachricht an alle "; //--- ToDo: Localize;
		};
		
		class ADACanAlle: Life_RscButtonMenu
		{
			idc = 93008;
			onButtonClick = "[12,(ctrlText 88886)] call life_fnc_newMsgSend;";

			text = "ADAC-Nachricht an alle"; //--- ToDo: Localize;
			x = 0.510125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.177185 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
			tooltip = "Sendet die ADAC-Nachricht an alle "; //--- ToDo: Localize;
		};		
	};
};