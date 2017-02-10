class msg_text {
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "PuristaSemibold";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = { 1 , 1 , 1 , 1 };
	colorBackground[] = {0, 0, 0, 0};
};
class msg_sText {
	type = 13;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	//font = "PuristaMedium";
	font = "PuristaSemibold";
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};

	class Attributes {
		color = "#ffffff";
		align = "center";
		shadow = 1;
	};
};