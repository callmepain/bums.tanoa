  class IceBaseTextHUD
  {
	access = 0;
	type = CT_STATIC;
	style = ST_CENTER;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,0.8};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0;
	w = 0;
	shadow = 2;
	font = "puristaMedium";
	sizeEx = "0.0325";

  };

  class IceBasePictureHUD
  {
	access = 0;
	type = CT_STATIC;
	style = 0x30 + 0x800;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "puristaMedium";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
  };

  class TAG_ICEHUD
  {
	idd = -1; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0; 
	onLoad = "uiNamespace setVariable ['TAG_ICE_display', _this select 0];"; 
		   
	class Controls 
	{
	
		class HUD_DIRECTION : IceBaseTextHUD
		{
			text = "";
			idc = 520500;
			x = safeZoneX+safeZoneW-0.09; 
			y = safeZoneY+safeZoneH-0.18;
			w = 0.04  * safezoneW;
			h = 0.025  * safezoneH;
			sizeEx = "0.033"; 
		};

		class HUD_FPS : IceBaseTextHUD
		{
			text = "";
			idc = 520501;
			x = safeZoneX+safeZoneW-0.09; 
			// y = safeZoneY+safeZoneH-0.3125;
			y = safeZoneY+safeZoneH-0.1325;
			w = 0.04  * safezoneW;
			h = 0.025  * safezoneH;
			sizeEx = "0.033"; 
		};

		

		class HUD_fatigue : IceBaseTextHUD
		{
			text = "";
			idc = 520503;
			x = safeZoneX+safeZoneW-0.09; 
			y = safeZoneY+safeZoneH-0.2275;
			w = 0.025  * safezoneW;
			h = 0.025  * safezoneH;
			sizeEx = "0.033"; 
		};
		
		class HUD_fatigue_PIC : IceBasePictureHUD
		{
			text = "icons\ico_fatigue.paa";
			idc = -1;
			x = safeZoneX+safeZoneW-0.115; 
			y = safeZoneY+safeZoneH-0.22;
			w = 0.03; h = 0.03;
		};
		
		class HUD_compass_PIC : IceBasePictureHUD
		{
			text = "\A3\Weapons_F\Data\UI\gear_item_compass_ca.paa";
			idc = -1;
			x = safeZoneX+safeZoneW-0.125; 
			y = safeZoneY+safeZoneH-0.18;
			w = 0.05; h = 0.05;
		};

		class HUD_fps_PIC : IceBasePictureHUD
		{
			text = "icons\ico_fps.paa";
			idc = -1;
			x = safeZoneX+safeZoneW-0.1225; 
			// y = safeZoneY+safeZoneH-0.31;
			y = safeZoneY+safeZoneH-0.13;
			w = 0.04; h = 0.04;
		};
		
		class statusBarText {
			idc = 520504;
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

