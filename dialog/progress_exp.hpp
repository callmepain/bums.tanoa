class life_progress_exp {
    name = "life_progress_exp";
    idd = 382000;
    fadein=1;
    duration = 10;
    fadeout=3;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['life_progress_exp',_this select 0]";
    objects[]={};

    class controlsBackground {
        class background: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.01 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.3;
            h = 0.025;
        };
        class ProgressBar: Life_RscProgress {
            idc = 382010;
			colorBar[] = {1,0.5,0,1};
            x = 0.010 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.3;
            h = 0.025;
        };

        class ProgressText: Life_RscText {
            idc = 382020;
			sizeEx = 0.03;
            text = "test";
			style = 2;
            x = 0.010 * safezoneW + safezoneX;
            y = 0.495 * safezoneH + safezoneY;
            w = 0.3;
            h = (1 / 25);
        };
		class ProgressTitle: Life_RscText {
            idc = 382021;
			sizeEx = 0.03;
            text = "Erfarung:";
            x = 0.01 * safezoneW + safezoneX;
            y = 0.479 * safezoneH + safezoneY;
            w = 0.3;
            h = (1 / 25);
        };
    };
};

class life_timer_exp {
    name = "life_timer";
    idd = 383000;
    fadeIn = 1;
    duration = 10;
    fadeout = 1;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable ['life_timer',_this select 0]";
    objects[] = {};

    class controlsBackground {
        class TimerIcon: life_RscPicture {
            idc = -1;
            text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.04;
            h = 0.045;
        };

        class TimerText: Life_RscText {
            colorBackground[] = {0,0,0,0};
            idc = 383010;
            text = "";
            x = 0.0204688 * safezoneW + safezoneX;
            y = 0.2778 * safezoneH + safezoneY;
            w = 0.09125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};