class CfgPatches {
	class AAF {
		name = "AAF Functions";
		author = "AAF";
		requiredVersion = 1.76;
		requiredAddons[] = {"ace_interaction","ace_zeus","cba_main"};
		units[] = {};
		weapons[] = {};
	};
};
class Extended_PreInit_EventHandlers {//CBA Settings
    class AAF_CBA_Settings {
        init = "call compile preprocessFileLineNumbers '\aaf_functions\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {//CBA Keybindings
	class AAF_CBA_Keybinds {
		Init = "call compile preprocessFileLineNumbers '\aaf_functions\XEH_postInit.sqf'";
	};
};
class CfgVehicles {//ACE Self-Interaction Actions
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			/*class fixVanillaDamage {
				displayName = "Fix Vanilla Damage";
				condition = "true";
				exceptions[] = {
					"isNotInside",
					"isNotSitting"
				};
				statement = "[] call aaf_fnc_fixvanilladamage";
				icon = "\aaf_functions\medical_cross.paa";
			};*/
			/*class aaftoggleHUD {
				displayName = "Toggle HUD";
				condition = "true";
				exceptions[] = {
					"isNotInside",
					"isNotSitting"
				};
				statement = "[] call aaf_fnc_hideHUDaceAction";
			};*/
			class AAF_Insignia {
				condition = "true";
				displayName = "Change Badge";
				exceptions[] = {"isNotSwimming","isNotInside","notOnMap","isNotSitting"};
				icon = "";
				priority = 1;
				statement = "";
				class aaf_persig {
					condition = "true";
					displayName = "Change Personal Badge";
					exceptions[] = {"isNotSwimming","isNotInside","notOnMap"};
					icon = "";
					priority = 1;
					statement = "[] call aaf_fnc_personalSigDialog";
				};
				class aaf_grpsig {
					condition = "_player == leader (group _player)";
					displayName = "Change Group Badge";
					exceptions[] = {"isNotSwimming","isNotInside","notOnMap"};
					icon = "";
					priority = 1;
					statement = "[] call aaf_fnc_groupSigDialog";
				};
			};
		};
	};
	//class Module_F;
	class ModuleEmpty_F;
	class ACE_Module;
	class Logic;
	class Module_F: Logic {
		class EventHandlers;
	};
};
class zen_context_menu_actions {//Zen Actions
	//https://zen-mod.github.io/ZEN/#/frameworks/context_menu?id=adding-actions-through-config
	class AAF_Functions {
		displayName = "AAF Functions";
		/*class example {
			displayName = "Example";
			icon = "\folder\icon_name.paa";//Icon file path
			iconColor = [0,0,0,0] //Icon color RGBA
			statement = "";//Code called when action is clicked
			condition = //Condition code required to show action
			priority = 50; //Action sorting priority
			insertChildren = "";//Code to dynamically add children actions
			modifierFunction = "";//Code to modify the action before condition checking
			args = [];//Arguments passed to the action
		};*/
		class aaf_dynsim_on {
			displayName = "Dynamic ON";
			statement = "_hoveredEntity enableDynamicSimulation true;";
			//condition = //group select only, dynSim off only
		};
		class aaf_dynsim_off {
			displayName = "Dynamic OFF";
			statement = "_hoveredEntity enableDynamicSimulation false;";
			//ondition = // group select only, DynaSim on only
		};
		class aaf_sim_on {
			displayName = "Simulation ON";
			statement = "_hoveredEntity enableSimulationGlobal true;";
			//condition = // group/object select, Simulation off only
		};
		class aaf_sim_off {
			displayName = "Simulation OFF";
			statement = "_hoveredEntity enableSimulationGlobal false;";
			//condition = // group/object select, Simulatyion on only
		};
		class aaf_hidezeus {
			displayName ="Hide Zeus";
			statement = "[LOGIC] call zen_modules_fnc_moduleHideZeus";
		};
		class aaf_monitor {
			displayName = "Server Monitor";
			statement = "[1] call aaf_fnc_Monitor";
		};
		class aaf_AIcratorEH {
			displayName = "AIskill Eventhandler";
			statement = "[LOGIC] call aaf_fnc_skill";
		};
	};
};
class CfgFunctions {
	class AAF {
		class Functions {
			tag = "AAF";
			
			/*class AAF_Init {//Global init - is this needed with Server and Client specific inits ?
				file = "\aaf_functions\functions\AAF_Init.sqf";
				postInit = 1;//call the function upon mission start, before objects are initialized
			};
			*/
			class AAF_PreInit_s {//Mission-Init SERVER functions
				file = "\AAF_Functions\functions\XEH_PreInit_s.sqf";
				preinit = 1;//call the function upon mission start, before objects are initialized
			};
			class AAF_PreInit_c {//Mission-Init CLIENT functions
				file = "\AAF_Functions\functions\XEH_PreInit_c.sqf";
				preinit=1;
			};
			class AAF_PostInit_s {//Mission-PostInit SERVER functions
				file = "\AAF_Functions\functions\XEH_PostInit_s.sqf";
				postInit = 1;// call the function upon mission start, after objects are initialized
			};
			class AAF_PostInit_c {//Mission-PostInit CLIENT functions
				file = "\AAF_Functions\functions\XEH_PostInit_c.sqf";
				postInit = 1;
				recompile = 1;//set to 1 to recompile the function upon mission start
			};

			class Monitor {file = "\aaf_functions\functions\monitor.sqf";};//Server Monitor

			class JIPZeusAssign {file = "\aaf_functions\functions\JIPZeusAssign.sqf";};//JiP Zeus repair - PREINIT_C

			class gear {file = "\aaf_functions\functions\gear.sqf";};//Starting gear respawn - POSTINIT_C
			class addSpectate {file = "\aaf_functions\functions\addSpectate.sqf";};//Easy Spectate

			//INTO Fuctions
			class introC {file = "\aaf_functions\functions\intro_c.sqf";};//client intro Function//POSTINIT_C
			class introS {file = "\aaf_functions\functions\intro_s.sqf";};//server intro Function//POSTINIT_S

			//Reducer - AAF_fnc_reducer - RE-DO and streamline Code
			class rInit {file = "\aaf_functions\functions\rInit.sqf";};//reducer init //POSTINIT_S
			class rTracker {file = "\aaf_functions\functions\rTracker.sqf";};//reducer tracker
			class rCache {file = "\aaf_functions\functions\rCache.sqf";};//reducer unit cache
			class rUncache {file = "\aaf_functions\functions\rUncache.sqf";};//reducer unit uncache
			class grpclean {file = "\aaf_functions\functions\grpclean.sqf";};//AI Empty group cleaner //POSTINIT_S
			class resupply {file = "\aaf_functions\functions\ai_resupply.sqf";};//AI Vehicle refuel and rearm //POSTINIT_S

			class skill {file = "\aaf_functions\functions\skill.sqf";};//Skill settings with BIS_fnc_EXP_camp_setSkill

			//class fixVanillaDamage {file = "\aaf_functions\functions\fixVanillaDamage.sqf";};//REMOVE
			//class hideHUDaceAction {file = "\aaf_functions\functions\hideHUDaceAction.sqf";};//REMOVE
			//class hideHUDkeybind {file = "\aaf_functions\functions\hideHUDkeybind.sqf";};//REMOVE
			
			//Group/Personal Sigs - REMOVE
			class setGroupSig {file = "\aaf_functions\functions\setGroupSig.sqf";};//REMOVE
			class setPersonalSig {file = "\aaf_functions\functions\setPersonalSig.sqf";};//REMOVE
			class dynGroupsReplacer {file = "\aaf_functions\functions\dynGroupsReplacer.sqf";};//REMOVE
			class groupSigDialog {file = "\aaf_functions\dialogs\groupSigDialog.sqf";};//REMOVE
			class personalSigDialog {file = "\aaf_functions\dialogs\personalSigDialog.sqf";};//REMOVE
			
			//ALL TO BE REPLACED WITH LRMINI
			//LRMini_P - AAF_fnc_LRMini_P - Player save functionality
			//LRMini_S - AAF_fnc_LRMini_S - Server save functionality
			//MassPara - AAF_fnc_MassPara - All units in aircraft eject in single action
			//lotsadudes - AAF_fnc_lotsadudes - Wee's wave AI assualt function
			//Monitor - AAF_fnc_Monitor - RSC display server monitor window
		};
	};
};

class RscPicture;
class RscText;
class RscCombo;
class RscCheckbox;
class RscButton;
class RscButtonMenuCancel;
class aaf_insignia_personal {
	idd = 8401;
	movingEnabled = false;
	class controls {
		class aaf_dialog_bg: RscPicture {
			idc = 1200;
			text = "aaf_functions\dialogs\Generic_1024_1024.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.5};
			colorActive[] = {-1,-1,-1,0.5};
		};
		class aaf_persig_preview_Border: RscPicture {
			idc = 1203;
			text = "#(argb,8,8,3)color(0,0,0,1)";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.242 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
		};
		class aaf_persig_header: RscText {
			idc = 1000;
			text = "Set Personal Badge"; //--- ToDo: Localize;
			style = ST_CENTER;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 3 * 0.04;
		};
		class aaf_persig_combo: RscCombo {
			idc = 2100;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[] call aaf_dlg_persigPreview";
		};
		class RscText_1001: RscText {
			idc = 1001;
			text = "Preview"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 2 * 0.04;
		};
		class aaf_persig_preview_BG: RscPicture {
			idc = 1204;
			text = "#(argb,8,8,3)color(0.5,0.5,0.5,1)";
			x = 0.316405 * safezoneW + safezoneX;
			y = 0.360361 * safezoneH + safezoneY;
			w = 0.140312 * safezoneW;
			h = 0.235278 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
		};
		class aaf_persig_preview: RscPicture {
			idc = 1205;
			text = "";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class RscText_1002: RscText {
			idc = 1002;
			text = "Options"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 2 * 0.04;
		};
		class RscCheckbox_2800: RscCheckbox {
			idc = 2800;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.374139 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Will wipe your saved badge when you click Save.";
			OnCheckedChanged = "[_this] call aaf_dlg_persigCheckboxPreview";
		};
		class RscCheckbox_2801: RscCheckbox {
			idc = 2801;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Wear specialist badges before personal badges when available.";
		};
		class RscText_1003: RscText {
			idc = 1003;
			text = "Clear Saved Badge"; //--- ToDo: Localize;
			tooltip = "Will wipe your saved badge when you click Save.";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 1 * 0.04;
		};
		class RscText_1004: RscText {
			idc = 1004;
			text = "Use Specialist Before Personal"; //--- ToDo: Localize;
			tooltip = "Wear specialist badges before personal badges when available.";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1 * 0.04;
		};
		class RscButton_2600: RscButton {
			text = "Save"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[] call aaf_dlg_persigFinish";
		};
		class RscButtonMenuCancel_2700: RscButton {
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			action = "closedialog 0";
		};
	};
};
class aaf_insignia_group {
	idd = 8402;
	movingEnabled = false;
	class controls {
		class aaf_dialog_bg: RscPicture {
			idc = 1200;
			text = "aaf_functions\dialogs\Generic_1024_1024.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.5};
			colorActive[] = {-1,-1,-1,0.5};
		};
		class aaf_persig_preview_Border: RscPicture {
			idc = 1203;
			text = "#(argb,8,8,3)color(0,0,0,1)";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.242 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
		};
		class aaf_persig_header: RscText {
			idc = 1000;
			text = "Set Group Badge"; //--- ToDo: Localize;
			style = ST_CENTER;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 3 * 0.04;
		};
		class RscText_1002: RscText {
			idc = 1002;
			text = "Options"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 2 * 0.04;
		};
		class aaf_persig_combo: RscCombo {
			idc = 2100;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[] call aaf_dlg_groupSigPreview";
		};
		class RscText_1001: RscText {
			idc = 1001;
			text = "Preview"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 2 * 0.04;
		};
		class aaf_persig_preview_BG: RscPicture {
			idc = 1204;
			text = "#(argb,8,8,3)color(0.5,0.5,0.5,1)";
			x = 0.316405 * safezoneW + safezoneX;
			y = 0.360361 * safezoneH + safezoneY;
			w = 0.140312 * safezoneW;
			h = 0.235278 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
		};
		class aaf_persig_preview: RscPicture {
			idc = 1205;
			text = "";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class RscButton_2600: RscButton {
			text = "Save"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[] call aaf_dlg_groupSigFinish";
		};
		class RscButtonMenuCancel_2700: RscButton {
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			action = "closedialog 0";
		};
		class RscCheckbox_2800: RscCheckbox {
			idc = 2800;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.374139 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Forces group members to use the group badge when enabled.";
		};
		class RscText_1003: RscText {
			idc = 1003;
			text = "Override Personal Badges"; //--- ToDo: Localize;
			tooltip = "Forces group members to use the group badge when enabled."; // Tooltip text
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 1 * 0.04;
		};
	};
};