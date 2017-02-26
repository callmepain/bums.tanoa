class Life_civ_Ausweis
{
	idd = -1;
	movingEnable = 0;
	fadein = 1;
	duration = 10;
	fadeout = 1;
	name = "Life_civ_Ausweis";
	onLoad = "uiNamespace setVariable ['playerAusweis',_this select 0];";
	objects[] = {};
	class controlsBackground
	{
		class hg: life_RscPicture
		{
			idc = 300024;

			text = "textures\civ_ausweis.paa"; //--- ToDo: Localize;
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

			x = 0.876406 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.113 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class geburt: Life_RscStructuredText
		{
			idc = 30001;

			x = 0.927969 * safezoneW + safezoneX;
			y = 0.510 * safezoneH + safezoneY;
			w = 0.056 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
	};
};