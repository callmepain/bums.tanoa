class jail_time
{
	idd = 26500;
	name = "jail_time";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground 
	{
		class Life_RscTitleBackground: Life_RscStructuredText
		{
			idc = 1100;

			text = "<t align='center'>Spieler in den Knast stecken</t>"; //--- ToDo: Localize;
			x = 0.1375;
			y = 0.12;
			w = 0.5375;
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
		};
		class MainBackground: Life_RscText
		{
			idc = 2200;

			x = 0.1375;
			y = 0.16;
			w = 0.5375;
			h = 0.58;
			colorBackground[] = {0,0,0,0.7};
		};
		class Background: Life_RscText
		{
			idc = 2201;

			x = 0.15;
			y = 0.34;
			w = 0.5125;
			h = 0.08;
			colorBackground[] = {0,0,0,0.7};
		};
		class Background2: Life_RscText
		{
			idc = 2201;

			x = 0.15;
			y = 0.44;
			w = 0.5125;
			h = 0.08;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls 
	{
		class Info: Life_RscStructuredText
		{
			idc = 1000;

			text = "Zeit angeben, wie viele Minuten die Person im Knast bleiben soll. 5 - 120 Minuten möglich."; //--- ToDo: Localize;
			x = 0.15;
			y = 0.18;
			w = 0.5125;
			h = 0.16;
			colorBackground[] = {0,0,0,0};
		};
		class Zeit: Life_RscText
		{
			idc = 1001;

			text = "Zeit:"; //--- ToDo: Localize;
			x = 0.15;
			y = 0.36;
			w = 0.075;
			h = 0.04;
		};
		class Minuten: Life_RscText
		{
			idc = 1002;

			text = "Minuten im Knast"; //--- ToDo: Localize;
			x = 0.3;
			y = 0.36;
			w = 0.35;
			h = 0.04;
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "closeDialog 0;";

			text = "Schließen"; //--- ToDo: Localize;
			x = 0.330061;
			y = 0.747361;
			w = 0.1875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class Time: Life_RscEdit
		{
			idc = 1400;

			text = "15"; //--- ToDo: Localize;
			x = 0.225;
			y = 0.36;
			w = 0.075;
			h = 0.04;
		};
		class OKButtonKey: Life_RscButtonMenu
		{
			idc = 2402;
			onButtonClick = "[] spawn life_fnc_jail_time;";

			text = "OK"; //--- ToDo: Localize;
			x = 0.138855;
			y = 0.747361;
			w = 0.1875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class Kaution: Life_RscText
		{
			idc = 1100;

			text = "Zeit:"; //--- ToDo: Localize;
			x = 0.15;
			y = 0.46;
			w = 0.075;
			h = 0.04;
		};
		class Kaution_time: Life_RscEdit
		{
			idc = 1401;

			text = "0"; //--- ToDo: Localize;
			x = 0.225;
			y = 0.46;
			w = 0.0625;
			h = 0.04;
		};
		class KautionMinuten: Life_RscText
		{
			idc = 1101;

			text = "Minuten bis Kaution bezahlbar"; //--- ToDo: Localize;
			x = 0.3;
			y = 0.46;
			w = 0.35;
			h = 0.04;
		};
		class Info2: Life_RscStructuredText
		{
			idc = 1102;

			text = "Zeit angeben, ab wann es möglich ist, Kaution zu bezahlen. Hälfte der Knastzeit angeben, 0 deaktviert das Feature."; //--- ToDo: Localize;
			x = 0.15;
			y = 0.54;
			w = 0.5125;
			h = 0.16;
			colorBackground[] = {0,0,0,0};
		};
	};
};