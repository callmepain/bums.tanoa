class Life_cop_Ausweis
{
	idd = -1;
	movingEnable = 0;
	fadein = 1;
	duration = 10;
	fadeout = 1;
	name = "Life_cop_Ausweis";
	onLoad = "uiNamespace setVariable ['playerAusweis',_this select 0];";
	objects[] = {};
	class controlsBackground
	{
		class hg: life_RscPicture
		{
			idc = 300024;

			text = "textures\cop_ausweis.paa"; //--- ToDo: Localize;
			x = 0.742344 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.429 * safezoneH;
		};
	};
	class controls
	{
		class Name: Life_RscStructuredText
		{
			idc = 30000;

			x = 0.874 * safezoneW + safezoneX;
			y = 0.442 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class rang: Life_RscStructuredText
		{
			idc = 30002;

			x = 0.897031 * safezoneW + safezoneX;
			y = 0.487 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class geburt: Life_RscStructuredText
		{
			idc = 30001;

			x = 0.9125 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
	};
};