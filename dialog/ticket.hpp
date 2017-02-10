class Life_ticket_give {
    idd = 2650;
    name = "life_ticket_give";
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
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
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
        class moneyEdit: Life_RscEdit
		{
			idc = 2652;

			text = "100"; //--- ToDo: Localize;
			x = 0.448176 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.103648 * safezoneW;
			h = 0.0165 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class payTicket: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_ticketGive";

			idc = 1004;
			text = "Ticket geben"; //--- ToDo: Localize;
			x = 0.448176 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.103648 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
    };
};

class Life_ticket_pay {
    idd = 2600;
    name = "life_ticket_pay";
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
			w = 0.383497 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.47;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.3;
            y = 0.2 + (11 / 250);
            w = 0.47;
            h = 0.3 - (22 / 250);
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
        class InfoMsg: Life_RscStructuredText {
            idc = 2601;
            sizeEx = 0.020;
            text = "";
            x = 0.287;
            y = 0.2 + (11 / 250);
            w = 0.5;
            h = 0.12;
        };

        class payTicket: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Ticket_PayTicket";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_ticketPay;";
            x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.42 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class refuseTicket: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Ticket_RefuseTicket";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "closeDialog 0;";
            x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.42 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};