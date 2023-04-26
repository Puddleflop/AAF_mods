class CfgPatches {
	class AAF_CDS {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F_BLUFOR","CBA_Extended_EventHandlers","cba_main","A3_Modules_F"};
		author = "AAF";
		projectName = "AAFs CDS + A.CM";
	};
};
class CfgWeapons {
	class itemCore;
	class ItemGPS;
	class ItemCDS : ItemGPS {
		author = "AAF";
		displayName = "CDS Controller";
		descriptionShort = "Controller and communicator for the MDTech Combat Data System";
	};
};
class CfgGlasses {
	class None;
	class ADFU_glasses_class;
	class AAF_g_CDS_Idis : ADFU_glasses_class {
		scope=2;
		author = "Adacas + AAF";
		displayname = "CDS infantry Glasses";
		model = "AAF_CDS\f_cds_glasses.p3d";
		//picture = "adfu_facewear\textures\icons\icon_face_cover_01_tan.paa";
		mass = 4;
		hiddenSelections[] = {"overlay"};
		hiddenSelectionsTextures[] = {"AAF_CDS\data\CDSi_ca.paa"};
	};
	class AAF_g_CDS_Adis : AAF_g_CDS_Idis {
		displayname = "CDS Pilot glasses";
		hiddenSelectionsTextures[] = {"AAF_CDS\data\CDSa_ca.paa"};
	};
	class AAF_g_CDS_Cdis : AAF_g_CDS_Idis {
		displayname = "CDS CiC glasses";
		hiddenSelectionsTextures[] = {"AAF_CDS\data\CDSc_ca.paa"};
	};
};

/*class CfgUIGrids {
	class IGUI {
		class Presets {
			class Arma3 {
				class Variables {
					aaf_cds_infodisplay[] = {{"0.5 + (pixelW * (128 / 2 + 10))","safeZoneY + safeZoneH - (pixelH * (128 + 10))","0.5 * safeZoneW - (pixelW * (128 / 2 + 10))","pixelH * (128 + 10)"},"(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
					//diwako_dui_namelist[] = {{"0.5 + (pixelW * (128 / 2 + 10))","safeZoneY + safeZoneH - (pixelH * (128 + 10))","0.5 * safeZoneW - (pixelW * (128 / 2 + 10))","pixelH * (128 + 10)"},"(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
					//diwako_dui_compass[] = {{"((0.5) * safezoneW + safezoneX) - (pixelW * 64)","safeZoneY + safeZoneH - (pixelH * (128 + 10))","pixelW * 128","pixelH * 128"},"(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
				};
			};
		};
		class Variables {
			class aaf_cds_infodisplay {
				displayName = "CDS Information";
				description = "Combat Data Systems information display panel";
				preview = "#(argb,8,8,3)color(0,0,0,0.75)";
				saveToProfile[] = {0,1,2,3};
				//setvariable ["igui_diwako_dui_namelist_x", 0.5 + (pixelW * (EGVAR(radar,uiPixels) / 2 + 10))];
				//setvariable ["igui_diwako_dui_namelist_y", safeZoneY + safeZoneH - (pixelH * (EGVAR(radar,uiPixels) + 10))];
				//"igui_diwako_dui_namelist_w"
				//"igui_diwako_dui_namelist_h"
				canResize = 1;
			};
			class diwako_dui_namelist {
				displayName = "$STR_dui_cat_namelist";
				description = "$STR_dui_cat_namelist_desc";
				preview = "#(argb,8,8,3)color(0,0,0,0.75)";
				saveToProfile[] = {0,1,2,3};
				canResize = 1;
			};
			class diwako_dui_compass {
				displayName = "$STR_dui_cat_compass";
				description = "$STR_dui_cat_compass_desc";
				preview = "\z\diwako_dui\addons\radar\UI\compass_styles\standard\compass.paa";
				saveToProfile[] = {0,1,2,3};
				canResize = 1;
				keepAspectRatio = 1;
			};
		};
	};
};*/

class RscText;
class RSCPicture;
/*class RscPic {
	//access = 0;
	type = CT_STATIC;
	idc = -1;
	style = 48;//ST_PICTURE
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	//font = "TahomaB";
	font = "PuristaSemiBold";//"etelkamonospacepro";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
};*/
class RscTitles {
	//titles[] = {"AAM_lens, AAM_clear"};
	/*class AAM_lens { // basic data
		idd = -1;
		duration = 100000;
		fadein = 0;
		fadeout = 0;
		name="AAM_Lens";
		//onLoad = "uiNamespace setVariable ['Glasses_basic_data', _this select 0]";
		controls[] = {
			Ghost,
			Hudframe
		};
		class alti: RscText { //top right
			idc = 1006;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.6 - 0.01) * safezoneW + safezoneX;
			y = (0.45 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.0825;//0.165;
			h = 0.0825;
		};
		class azu: RscText { //top middle
			idc = 1007;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = ""; //or picture ?  text = "CCOREM\MENU\Core.paa";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.5 - 0.01) * safezoneW + safezoneX;
			y = (0.45 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.12375; //0.165;
			h = 0.0825;
		};
		class grid: RscText { //top left
			idc = 1008;
			style = 0;
			colorBackground[] = {1, 1, 1, 1 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.4 - 0.01) * safezoneW + safezoneX;
			y = (0.45 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.165;
			h = 0.0825;
		};
		class HLT: RscText { //middle left
			idc = 1009;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.4 - 0.01) * safezoneW + safezoneX;
			y = (0.5 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.11;//0.165;
			h = 0.0825;
		};
		class LMT: RscText { //Low left
			idc = 1010;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.4 - 0.01) * safezoneW + safezoneX;
			y = (0.55 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.11;//0.165;
			h = 0.0825;
		};
		class Ghost: RscPicture { //RscPic
			idc = 1011;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "\CDS\data\ghost_i.paa";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = 0 * safezoneW + safezoneX;
			y = 0.79 * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.2;
			h = 0.2;
		};
		class Hudframe: RscPicture {
			idc = 1012;
			text = "\CDS\data\hud\hud2.paa";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = 0.28 * safezoneW + safezoneX;
			y = 0.74 * safezoneW + safezoneX;
			w = 1.1;
			h = 0.45;
		};
	};
	class AAM_clear {
		idd = -1;
		fadein = 0;
		fadeout = 0;
		duration = 0;
		name="AAM_clear";
	};
	*/
	class AAF_cds_TXT {
		type = 13;
		idc = -1;
		moving = 1;
		style=0x00;
		colorbackground[] = {0,0,0,0};
		colortext[] = {0,1,0,0.5};
		size = "0.03 / (getResolution select 5)";
		h = 0.5;
		w = 0.5;
		text = "";
		class Attributes {
			font = "PuristaSemiBold";
			color = "#000000";
			align = "left";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1";
		};
	};
	class AAF_cds_DIALOG {//Make this move ??
		onLoad = "uiNamespace setVariable ['AAF_cds_DISPLAY', _this select 0];";
		idd = -1;
		movingenable = 0;
		enablesimulation = 1;
		controlsbackground[] = {};
		//access = 0;
		duration = 1e+1000;
		fadeIn = 0;
		fadeOut = 0;
		objects[] = {};
		controls[] = {
			AAF_cds_TXT_1,
			AAF_cds_TXT_2,
			AAF_cds_TXT_3,
			AAF_cds_TXT_4,
			AAF_cds_TXT_5,
			AAF_cds_TXT_6,
			AAF_cds_TXT_7,
			AAF_cds_TXT_8,
			AAF_cds_TXT_9
		};
		class AAF_cds_TXT_1 : AAF_cds_TXT {
			idc = 100001;//1160001
			x = 0.38 * safezoneW + safezoneX; //.38
			y = 0.4 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_2 : AAF_cds_TXT {
			idc = 100002;//1160002
			x = 0.48 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_3 : AAF_cds_TXT {
			idc = 100003;//1160003
			x = 0.58 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_4 : AAF_cds_TXT {
			idc = 100004;//1160004
			x = 0.38 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_5 : AAF_cds_TXT {
			idc = 100005;//1160005
			x = 0.48 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_6 : AAF_cds_TXT {
			idc = 100006;//1160006
			x = 0.58 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_7 : AAF_cds_TXT {
			idc = 100007;//1160007
			x = 0.38 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_8 : AAF_cds_TXT {
			idc = 100008;//1160008
			x = 0.48 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
		class AAF_cds_TXT_9 : AAF_cds_TXT {
			idc = 100009;//1160009
			x = 0.58 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
	};
};
class cfgFunctions {
	class AAF { //mytag
		class CDS {//mycategory
			class CDShud {//AAF_fnc_CDShud
				file="\AAF_CDS\functions\AAF_CDS_Hud.sqf";
				//preInit = 0;//call the function upon mission start, before objects are initialized. - unscheduled
				//postInit = 1;//call the function upon mission start, after objects are initialized. - scheduled
				//preStart = 0;//call the function upon game start, before title screen, but after all addons are loaded.
				//recompile = 0;//recompile the function upon mission start
			};
			class CDSactivate {//AAF_fnc_CDSactivate
				file="\AAF_CDS\functions\CDS_activate.sqf";
			};
			class CDShudbright {//AAF_fnc_CDShudbright
				file="\AAF_CDS\functions\CDS_hudbright.sqf";
			};
			/*class CDSid {//AAF_fnc_CDSid  -Scanning type
				file="\AAF_CDS\functions\CDS_id.sqf";
			};*/
			/*class CDSnv {//AAF_fnc__CDSnv
				file="\AAF_CDS\functions\CDSnv.sqf";
			};*/

			/*class CDSnvn {//AAF_fnc_CDSnvb
				file="\AAF_CDS\functions\CDSnvb.sqf";
			};*/
		};
	};
};
class CfgMarkers {
	class bloc {
		scope = 2;
		name = "Base Loc";
		icon = "\AAF_CDS\data\markers\bloc.paa";
		texture = "\AAF_CDS\data\markers\bloc.paa"; //?
		color[] = {0, 0, 0, 1};
		shadow = False;
		markerClass = "Draw";
		side = 1;
		size = 32;
	};
	class eloc {
		scope = 2;
		name = "Enemy Loc";
		icon = "\AAF_CDS\data\markers\eloc.paa";
		texture = "\AAF_CDS\data\markers\eloc.paa"; //?
    color[] = {0, 0, 0, 1};
		shadow = False;
		markerClass = "Draw";
		side = 1;
		size = 32;
	};
	class floc {
		name = "Friendly Position";
		icon = "\AAF_CDS\data\markers\floc.paa";
		texture = "\AAF_CDS\data\markers\floc.paa";
		color[] = {0, 0, 0, 1};
		size = 32;
		shadow = False;
		scope = 2;
		markerClass = "Draw";
	};
	class hloc {
		name = "Hold Marker";
		icon = "\AAF_CDS\data\markers\hloc.paa";
		texture = "\AAF_CDS\data\markers\hloc.paa";
		color[] = {0, 0, 0, 1};
		size = 32;
		shadow = False;
		scope = 2;
		markerClass = "Draw";
	};
	class lzloc {
		name = "Landing Zone";
		icon = "\AAF_CDS\data\markers\lzloc.paa";
		texture = "\AAF_CDS\data\markers\lzloc.paa";
		color[] = {0, 0, 0, 1};
		size = 32;
		shadow = False;
		scope = 2;
		markerClass = "Draw";
	};
	class poiloc {
		name = "Point of Interest";
		icon = "\AAF_CDS\data\markers\poiloc.paa";
		texture = "\AAF_CDS\data\markers\poiloc.paa";
		color[] = {0, 0, 0, 1};
		size = 32;
		shadow = False;
		scope = 2;
		markerClass = "Draw";
	};
	class wploc {
		name = "Waypoint";
		icon = "\AAF_CDS\data\markers\wploc.paa";
		texture = "\AAF_CDS\data\markers\wploc.paa";
		color[] = {0, 0, 0, 1};
		size = 32;
		shadow = False;
		scope = 2;
		markerClass = "Draw";
	};
};
class Extended_PostInit_EventHandlers {
	class CDSPostInit {
		init = "[] spawn AAF_fnc_CDShud; "; //CDS main script
	};
	class CDSEventsPostinit {
		init = "call compile preprocessFileLineNumbers '\AAF_CDS\functions\AAF_CDS_events.sqf'"; //CBA Keybindings
	};
};
