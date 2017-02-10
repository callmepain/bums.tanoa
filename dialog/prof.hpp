class Life_Prof_Dialog
{
	idd = 7730;
	name = "life_prof_dialog";
	movingEnabled = 0;
	enableSimulation = 1;
	 onLoad = "[] spawn life_fnc_profSetup;";
	 
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
		
		class Prof3Header: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Aktuelle Erfahrung"; //--- ToDo: Localize;
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Prof2Header: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Skill Level"; //--- ToDo: Localize;
			x = 0.442994 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class ProfHeader: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Gelehrnte Skills"; //--- ToDo: Localize;
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			tooltip = "Click on your skill to view your stats. If you see no skills, start playing the game, and they will show up"; //--- ToDo: Localize;
		};
		class nextExp: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Nächstes Level"; //--- ToDo: Localize;
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.5132 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
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
	   class Prof4_Text: Life_RscListBox
		{
			idc = 7734;
			style = "0x02 + 0xC0";
			text = "";
			sizeEx = 0.085;
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class Prof3_Text: Life_RscListBox
		{
			idc = 7733;
			style = "0x02 + 0xC0";
			text = "";
			sizeEx = 0.085;
			x = 0.572553 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class Prof2_Text: Life_RscListBox
		{
			idc = 7732;
			style = 2;
			text = "";
			sizeEx = 0.3;
			x = 0.442994 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class Prof_Text: Life_RscListBox
		{
			idc = 7731;
			style = 2;
			sizeEx = 0.04;
			onLBSelChanged = "[_this] spawn life_fnc_grabSkills";
			text = "";
			x = 0.313434 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.114013 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	};
}; 