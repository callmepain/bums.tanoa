	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class foodHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\ico_food.paa";
				x = safeZoneX+safeZoneW-0.115; 
				y = safeZoneY+safeZoneH-0.36;
				w = 0.03; h = 0.04;
			};
			
			class waterHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\ico_water.paa";
				x = safeZoneX+safeZoneW-0.12; 
				y = safeZoneY+safeZoneH-0.32;
				w = 0.04; h = 0.04;
			};
			
			class healthHIcon : life_RscPicture
			{
				
				idc = -1;
				text = "icons\ico_health.paa";
				x = safeZoneX+safeZoneW-0.11; 
				y = safeZoneY+safeZoneH-0.265;
				w = 0.02; h = 0.03;
			};
			
			// class batteryHIcon : life_RscPicture
			// {
				
				// idc = -1;
				// text = "icons\ico_battery.paa";
				// x = safeZoneX+safeZoneW-0.115; y = safeZoneY+safeZoneH-0.26;
				// w = 0.03; h = 0.03;
			// };
			
			class fatigueHIcon : life_RscPicture
			{
				text = "icons\ico_fatigue.paa";
				idc = -1;
				x = safeZoneX+safeZoneW-0.11; 
				y = safeZoneY+safeZoneH-0.22;
				w = 0.02; h = 0.03;
			};
			
			class compassHIcon : life_RscPicture
			{
				text = "\A3\Weapons_F\Data\UI\gear_item_compass_ca.paa";
				idc = -1;
				x = safeZoneX+safeZoneW-0.125; 
				y = safeZoneY+safeZoneH-0.18;
				w = 0.05; h = 0.05;
			};

			class fpsHIcon : life_RscPicture
			{
				text = "icons\ico_fps.paa";
				idc = -1;
				x = safeZoneX+safeZoneW-0.1225; 
				// y = safeZoneY+safeZoneH-0.31;
				y = safeZoneY+safeZoneH-0.13;
				w = 0.04; h = 0.04;
			};
			
		};
		
		class controls
		{
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx = "0.033"; 
				size=1;
				font="puristaMedium";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,0.8};
				shadow = 2;
				fixedWidth = 0;
				text="";
			};
				
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx = "0.033"; 
				size=1;
				font="puristaMedium";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,0.8};
				shadow = 2;
				fixedWidth = 0;
				text="";
			};
			
			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx = "0.033"; 
				size=1;
				font="puristaMedium";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,0.8};
				shadow = 2;
				fixedWidth = 0;
				text="";
			};
			
			// class batterytext
			// {
				// type=0;
				// idc=23520;
				// style=0;
				// x=-1;
				// y=-1;
				// w=0.3;
				// h=0.05;
				// sizeEx = "0.05"; 
				// size=1;
				// font="puristaMedium";
				// colorBackground[] = {0,0,0,0};
				// colorText[] = {1,1,1,0.8};
				// shadow = 2;
				// fixedWidth = 0;
				// text="";
			// };
			
			class directiontext
			{
				type=0;
				idc=23521;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx = "0.033"; 
				size=1;
				font="puristaMedium";
				colorBackground[] = {0,0,0,0};
				colorText[] = {0,1,0,1};
				shadow = 2;
				fixedWidth = 0;
				text="";
			};

			class fpstext
			{
				type=0;
				idc=23522;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx = "0.033"; 
				size=1;
				font="puristaMedium";
				colorBackground[] = {0,0,0,0};
				colorText[] = {0,1,0,1};
				shadow = 2;
				fixedWidth = 0;
				text="";
			};

			class fatiguetext
			{
				type=0;
				idc=23523;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx = "0.033"; 
				size=1;
				font="puristaMedium";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,0.8};
				shadow = 2;
				fixedWidth = 0;
				text="";
			};
			
			class statusBarText {
				idc = 23524;
				x = safezoneX + safezoneW - 1;
				y = safezoneY + safezoneH - 0.08;
				w = 1;
				h = 0.04;
				shadow = 2;
				colorBackground[] = { 0, 0.0, 0, 0.0};  // uncomment and increase 4th number to have a background
				font = "PuristaSemibold";
				size = 0.037;
				type = 13;
				style = 1;
				text="Serverinfo wird geladen......";
				class Attributes {
					align="right";
					color = "#27F53C";
				};
			};
		};   
 	};