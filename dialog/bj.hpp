class Life_Black_Jack {
    idd = 2300;
    name="Life_Black_Jack";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "";
    onUnLoad = "";

    class controlsBackground 
	{
		class HG: life_RscPicture
		{
			 idc = -1;
			 text = "images\tablet\tablet.paa";
			 x = 0.258501 * safezoneW + safezoneX;
			 y = 0.0716 * safezoneH + safezoneY;
			 w = 0.485625 * safezoneW;
			 h = 0.854 * safezoneH;
			 //colorText[] = {1,1,1,0.8};
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
		class Titel: Life_RscStructuredText
		{
			idc = 1104;
			text = "Black Jack ohne Nutten"; //--- ToDo: Localize;
			x = 0.308235 * safezoneW + safezoneX;
			y = 0.266898 * safezoneH + safezoneY;
			w = 0.384743 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};	
		class Punkte_Dealer: Life_RscStructuredText
		{
			idc = 1100;

			text = "Punkte: 21"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Punkte_Meins: Life_RscStructuredText
		{
			idc = 1101;

			text = "Punkte: 21"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Status: Life_RscStructuredText
		{
			idc = 1102;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
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
		////////kartendealer
		class RscPicture_1201: life_RscPicture
		{
			idc = 1201;

			text = "textures\cards\herz\herz2.paa"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1202: life_RscPicture
		{
			idc = 1202;

			text = "textures\cards\herz\herz3.paa"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1203: life_RscPicture
		{
			idc = 1203;

			text = "textures\cards\herz\herz4.paa"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1204: life_RscPicture
		{
			idc = 1204;

			text = "textures\cards\herz\herz5.paa"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1205: life_RscPicture
		{
			idc = 1205;

			text = "textures\cards\herz\herz6.paa"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1206: life_RscPicture
		{
			idc = 1206;

			text = "textures\cards\herz\herz7.paa"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1207: life_RscPicture
		{
			idc = 1207;

			text = "textures\cards\herz\herz8.paa"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1208: life_RscPicture
		{
			idc = 1208;

			text = "textures\cards\herz\herz9.paa"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1209: life_RscPicture
		{
			idc = 1209;

			text = "textures\cards\herz\herz10.paa"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1210: life_RscPicture
		{
			idc = 1210;

			text = "textures\cards\herz\herzbube.paa"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		
		////////////meins
		class RscPicture_1301: life_RscPicture
		{
			idc = 1301;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1302: life_RscPicture
		{
			idc = 1302;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1303: life_RscPicture
		{
			idc = 1303;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1304: life_RscPicture
		{
			idc = 1304;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1305: life_RscPicture
		{
			idc = 1305;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1306: life_RscPicture
		{
			idc = 1306;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1307: life_RscPicture
		{
			idc = 1307;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1308: life_RscPicture
		{
			idc = 1308;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1309: life_RscPicture
		{
			idc = 1309;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		class RscPicture_1310: life_RscPicture
		{
			idc = 1310;

			text = "textures\cards\herz\herzdame.paa"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.064 * safezoneW;
			h = 0.128 * safezoneH;
		};
		
		
		class Karte_nehmen: Life_ButtonMenu
		{
			idc = 1600;
			onButtonClick = "call life_fnc_bj_nehmen";
			text = "Karte nehmen"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Karte_genug: Life_ButtonMenu
		{
			idc = 1601;
			onButtonClick = "call life_fnc_bj_stop";
			text = "Genug"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Spiel_Starten: Life_ButtonMenu
		{
			idc = 1602;
			onButtonClick = "call life_fnc_bj_mischen";

			text = "Spiel starten"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class einsatz: Life_RscCombo
		{
			idc = 2100;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

