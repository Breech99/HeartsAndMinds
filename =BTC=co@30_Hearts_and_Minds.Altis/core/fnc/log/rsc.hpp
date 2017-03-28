
	class btc_log_hud
	{
		idd = 1000;
		movingEnable=0;
		duration=1e+011;
		name = "btc_log_hud";
		onLoad = "uiNamespace setVariable [""btc_log_hud"", _this select 0];";
		controlsBackground[] = {};
		objects[] = {};
		class controls
		{
			class Radar_background
			{
				type = 0;
				idc = 1001;
				style = 48;

				x = 0.82 * safezoneW + safezoneX;
				y = 0.75 * safezoneH + safezoneY;
				w = 0.14 * safezoneW;
				h = 0.14 * safezoneH * (getresolution select 4);

				font = "PuristaMedium";
				sizeEx = 0.03;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {0.1, 0.1, 0.1, 0.6};
				text = "\A3\ui_f\data\igui\rscingameui\rscminimap\gradient_gs.paa";
			};
			class Radar
			{
				type = 0;
				idc = 1002;
				style = 48;

				x = 0.82 * safezoneW + safezoneX;
				y = 0.75 * safezoneH + safezoneY;
				w = 0.14 * safezoneW;
				h = 0.14 * safezoneH * (getresolution select 4);

				font = "PuristaMedium";
				sizeEx = 0.03;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 1, 1, 1};
				text = "\A3\Ui_f\data\GUI\Rsc\RscSlingLoadAssistant\SLA_Circles_ca.paa";
			};
			class Img_Obj
			{
				type = 0;
				idc = 1003;
				style = 48;

				x = 0.85 * safezoneW + safezoneX;
				y = 0.85 * safezoneH + safezoneY;
				w = 0.03 * safezoneW;
				h = 0.03 * safezoneH * (getresolution select 4);

				font = "PuristaMedium";
				sizeEx = 1;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 0, 0, 1};
				text = "\A3\ui_f\data\igui\cfg\simpleTasks\types\target_ca.paa";
			};
			class Pic_Obj
			{
				type = 0;
				idc = 1004;
				style = 48;

				x = 0.82 * safezoneW + safezoneX;
				y = 0.7 * safezoneH + safezoneY;
				w = 0.05 * safezoneW;
				h = 0.05 * safezoneH;

				font = "PuristaMedium";
				sizeEx = 0.03;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 1, 1, 1};
				text = "";
			};
			class Arrow
			{
				type = 0;
				idc = 1005;
				style = 48;

				x = 0.94 * safezoneW + safezoneX;
				y = 0.75 * safezoneH + safezoneY;
				w = 0.02 * safezoneW;
				h = 0.02 * safezoneH * (getresolution select 4);

				font = "PuristaMedium";
				sizeEx = 0.03;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 1, 1, 1};
				text = "";
			};
			class Type_Obj
			{
				type = 0;
				idc = 1006;
				style = 0x00;

				x = 0.8 * safezoneW + safezoneX;
				y = 0.65 * safezoneH + safezoneY;
				w = 0.3 * safezoneW;
				h = 0.1 * safezoneH;

				font = "PuristaMedium";
				sizeEx = 0.03;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 1, 1, 1};
				text = "";
			};
		};
	};