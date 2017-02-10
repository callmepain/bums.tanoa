class life_economy_buy {
	idd = 2700;
	name= "life_economy_buy";
	movingEnable = false;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.2;
			y = 0.2;
			w = 0.65;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.2;
			y = 0.2 + (11 / 250);
			w = 0.65;
			h = 0.8 - (22 / 250);
		};
	};
	
	class controls {
		
		class Economy_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.21;
			y = 0.26;
			w = 0.6;
			h = 0.65;
			
			class Controls
			{
				class Life_Economy : Life_RscStructuredText
				{
					idc = 2701;
					sizeEx = 0.020;
					x = 0;
					y = 0;
					w = 0.58; 
					h = 1.5 - (22 / 250);
				};
			};
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Einkaufspreise";
			x = 0.2;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.2;
			y = 0.96;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class life_economy_sell {
	idd = 2700;
	name= "life_economy_sell";
	movingEnable = false;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.2;
			y = 0.2;
			w = 0.65;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.2;
			y = 0.2 + (11 / 250);
			w = 0.65;
			h = 0.8 - (22 / 250);
		};
	};
	
	class controls {
		
		class Economy_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.21;
			y = 0.26;
			w = 0.6;
			h = 0.65;
			
			class Controls
			{
				class Life_Economy : Life_RscStructuredText
				{
					idc = 2701;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.58; 
					h = 1 - (22 / 250);
				};
			};
		}
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Verkaufspreise";
			x = 0.2;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.2;
			y = 0.96;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class life_economy_vehicle {
	idd = 2700;
	name= "life_economy_vehicle";
	movingEnable = false;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.2;
			y = 0.2;
			w = 0.65;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.2;
			y = 0.2 + (11 / 250);
			w = 0.65;
			h = 0.8 - (22 / 250);
		};
	};
	
	class controls {
		
		class Economy_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.21;
			y = 0.26;
			w = 0.6;
			h = 0.65;
			
			class Controls
			{
				class Life_Economy : Life_RscStructuredText
				{
					idc = 2701;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.58; 
					h = 1.5 - (22 / 250);
				};
			};
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Fahrzeugpreise (permanent)";
			x = 0.2;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.2;
			y = 0.96;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
class life_economy_license {
	idd = 2700;
	name= "life_economy_license";
	movingEnable = false;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.2;
			y = 0.2;
			w = 0.65;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.2;
			y = 0.2 + (11 / 250);
			w = 0.65;
			h = 0.8 - (22 / 250);
		};
	};
	
	class controls {
		
		class Economy_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.21;
			y = 0.26;
			w = 0.6;
			h = 0.65;
			
			class Controls
			{
				class Life_Economy : Life_RscStructuredText
				{
					idc = 2701;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.58; 
					h = 1.2 - (22 / 250);
				};
			};
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Lizenzpreise";
			x = 0.2;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.2;
			y = 0.96;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};