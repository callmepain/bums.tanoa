class msg {
	idd = -1;
	duration = 90;
	movingEnable = 0;
	fadein = 1;
	fadeout = 3;
	name = "msg";
	onLoad="uiNamespace setVariable ['msg',_this select 0]";
	objects[] = {};
	class controlsBackground {
		class background: msg_sText
		{
			idc = 9004;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	class controls {
		class titel: msg_sText
		{
			idc = 9001;
			text = "";
			x = 0.842468 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.142219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class colorbar: msg_text
		{
			idc = 9002;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.0055 * safezoneH;
		};
		class messagebox: msg_sText
		{
			idc = 9003;
			text = "";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};
class msg_simpl {
	idd = -1;
	duration = 90;
	movingEnable = 0;
	fadein = 1;
	fadeout = 3;
	name = "msg_simpl";
	onLoad="uiNamespace setVariable ['msg_simpl',_this select 0]";
	objects[] = {};
	class controlsBackground {
		class background: msg_sText
		{
			idc = 9003;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	class controls {
		class colorbar: msg_text
		{
			idc = 9001;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.0055 * safezoneH;
		};
		class messagebox: msg_sText
		{
			idc = 9002;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};