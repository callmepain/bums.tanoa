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
			//colorText[] = {1,1,1,0};
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

			text = ""; //--- ToDo: Localize;
			x = 0.308252 * safezoneW + safezoneX;
			y = 0.2668 * safezoneH + safezoneY;
			w = 0.384743 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		
		class Prof3Header: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Aktuelle Erfahrung"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Prof2Header: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Skill Level"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class ProfHeader: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Skills"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class nextExp: Life_RscTitle
		{
			idc = -1;
			style = 2;

			text = "Nächstes Level"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class profverfuegbar: Life_RscTitle
		{
			idc = 1008;
			style = 2;

			text = "Aktuell verfügbar"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class Profnext: Life_RscTitle
		{
			idc = 1009;
			style = 2;

			text = "Als nächstes verfügbar"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class aktuelleffekt: Life_RscTitle
		{
			idc = 1012;
			style = 2;
			
			text = "Aktueller Effekt"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.75};
		};
		class nexteffekt: Life_RscTitle
		{
			idc = 1013;
			style = 2;
			
			text = "Nächster Effekt"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
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
		class next_level_Text: Life_RscListBox
		{
			idc = 7734;
			style = 2;
			sizeEx = 0.08;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class now_level_Text: Life_RscListBox
		{
			idc = 7733;
			style = 2;
			sizeEx = 0.08;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class level_Text: Life_RscListBox
		{
			idc = 7732;
			style = 2;
			sizeEx = 0.08;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class Prof_Text: Life_RscListBox
		{
			idc = 7731;
			style = 2;
			onLBSelChanged = "[_this] spawn life_fnc_grabSkills";
			sizeEx = 0.04;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class verfuegbar_text: Life_RscListBox
		{
			idc = 1500;
			style = 2;
			sizeEx = 0.04;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.242 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class next_text: Life_RscListBox
		{
			idc = 1501;
			style = 2;
			sizeEx = 0.04;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.242 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class akt_effekt_list: Life_RscListBox
		{
			idc = 1502;
			style = 2;
			sizeEx = 0.04;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class next_effekt: Life_RscListBox
		{
			idc = 1503;
			style = 2;
			sizeEx = 0.04;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	};
}; 