class SettingsMenu {
    idd = 2900;
    name = "SettingsMenu";
    movingEnable = 1;
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
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
        class SideChatHeader: Life_RscText
		{
			idc = -1;

			text = "Sidechat umschalten"; //--- ToDo: Localize;
			x = 0.417082 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class RevealNearestHeader: Life_RscText
		{
			idc = -1;

			text = "Nahe Objekte anzeigen"; //--- ToDo: Localize;
			x = 0.417082 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class BroacastHeader: Life_RscText
		{
			idc = -1;

			text = "Broadcast umschalten"; //--- ToDo: Localize;
			x = 0.417082 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.145107 * safezoneW;
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
        class VDonFoot: Life_RscText
		{
			idc = -1;

			text = "Zu Fuß:"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VDinCar: Life_RscText
		{
			idc = -1;

			text = "Im Auto:"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VDinAir: Life_RscText
		{
			idc = -1;

			text = "Im Himmel:"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VD_onfoot_slider: life_RscXSliderH
		{
			idc = 2901;
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			text = "";
			x = 0.37044 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.233207 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			tooltip = "Sichtweite zu Fuß"; //--- ToDo: Localize;
		};
		class VD_onfoot_value: Life_RscEdit
		{
			idc = 2902;
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
			text = "";
			x = 0.60883 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0777358 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class VD_car_slider: life_RscXSliderH
		{
			idc = 2911;
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			text = "";
			x = 0.37044 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.233207 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			tooltip = "Sichtweite in Landfahrzeugen"; //--- ToDo: Localize;
		};
		class VD_car_value: Life_RscEdit
		{
			idc = 2912;
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
			text = "";
			x = 0.60883 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0777358 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class VD_air_slider: life_RscXSliderH
		{
			idc = 2921;
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			text = "";
			x = 0.37044 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.233207 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			tooltip = "Sichtweite in Luftfahrzeugen"; //--- ToDo: Localize;
		};
		class VD_air_value: Life_RscEdit
		{
			idc = 2922;
			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
			text = "";
			x = 0.60883 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0777358 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class SideChatONOFF: Life_Checkbox
		{
			idc = 2971;
			onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
			text = "";
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			tooltip = "Sidechat umschalten. Ausschalten, wenn du nicht mit Spielern deiner Fraktion sprechen möchtest."; //--- ToDo: Localize;
		};
		class RevealONOFF: Life_Checkbox
		{
			idc = 2972;
			onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
			text = "";
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			tooltip = "Zeigt automatisch nächstgelegene Objekte innerhalb von 15m an, deaktiviere es, wenn du Leistungprobleme hast."; //--- ToDo: Localize;
		};
		class BroadcastONOFF: Life_Checkbox
		{
			idc = 2973;
			onCheckedChanged = "['broadcast',_this select 1] call life_fnc_s_onCheckedChange;";
			text = "";
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0124377 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			tooltip = "Broadcast umschalten. Ausschalten, wenn du keine Broadcasts von anderen Spielern erhalten möchtest."; //--- ToDo: Localize;
		};
    };
};
