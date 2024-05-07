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
class Extended_InitPost_EventHandlers {//Like init eventhandler, initiated aftermission start
    class Wheeled_APC_F {
        init = "(_this select 0) allowCrewInImmobile true";
    };
    class Tank {
        init = "(_this select 0) allowCrewInImmobile true";
    };
};
class CfgVehicles {//ACE Self-Interaction Actions
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class AAF_Actions {
				displayName = "AAF Actions";
				condition = "true";
				exceptions[] = {};
				icon = "\aaf_functions\img\AAF_icon.paa";
				class aaf_afk {//AFK self-interaction
					displayName = "AFK";
					condition = "true";//Condition to show the action
					exceptions[] = {};
					statement = "[] call AAF_fnc_AFK";
					icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\Use_ca.paa";
				};
				class aaf_stuck {//Stuck in a Rock self-interaction
					displayName = "I'm stuck in a rock!";
					condition = "true";
					exceptions[] = {};
					statement = "[] call AAF_fnc_Stuck";
					icon = "\a3\ui_f\data\map\mapcontrol\Rock_CA.paa";
				};
				class aaf_SHBF {//Super Head Bug Fix self-interaction
					displayName = "Super Head Bug Fix™";
					condition = "true";
					exceptions[] = {};
					statement = "[] spawn AAF_fnc_SHBF";//can suspend
					icon = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
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
			args = ;//Arguments passed to the action
		};*/
		class dynsim_on {
			displayName = "Dynamic ON";
			statement = "_hoveredEntity enableDynamicSimulation true;";
			//condition = //group select only, dynSim off only
		};
		class dynsim_off {
			displayName = "Dynamic OFF";
			statement = "_hoveredEntity enableDynamicSimulation false;";
			//condition = // group select only, DynaSim on only
		};
		class sim_on {
			displayName = "Simulation ON";
			statement = "_hoveredEntity enableSimulationGlobal true;";
			//condition = // group/object select, Simulation off only
		};
		class sim_off {
			displayName = "Simulation OFF";
			statement = "_hoveredEntity enableSimulationGlobal false;";
			//condition = // group/object select, Simulatyion on only
		};
		class hidezeus {
			displayName ="Hide Zeus";
			statement = "[LOGIC] call zen_modules_fnc_moduleHideZeus";
		};
		class aiSkills {
			displayName = "AI Skill Level";
			class aiCivilian {
				displayName = "Civilian";
				statement = "[_objects, _args] call aaf_fnc_aiSkillS";
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.00;
			};
			class aiInsurgents {
				displayName = "Insurgents";
				statement = "[_objects, _args] call aaf_fnc_aiSkillS";
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.25;
			};
            class aiRegular {
				displayName = "Regular";
				statement = "[_objects, _args] call aaf_fnc_aiSkillS";
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.50;
			};
            class aiProfessional {
				displayName = "Professional";
				statement = "[_objects, _args] call aaf_fnc_aiSkillS";
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.75;
			};
            class aiSpecialForces {
				displayName = "Special Forces";
				statement = "[_objects, _args] call aaf_fnc_aiSkillS";
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 1.00;
			};
		};
	};
};
class CfgFunctions {
	class AAF {
		class Functions {
			class PreInit {//aaf_fnc_preinit
				file = "\AAF_Functions\functions\PreInit.sqf";
				preinit=1;//call the function upon mission start, before objects are initialized
			};
			class PostInit {//aaf_fnc_postinit
				file = "\AAF_Functions\functions\PostInit.sqf";
				postInit=1;// call the function upon mission start, after objects are initialized
			};
			class intro {//aaf_fnc_intro
				file = "\aaf_functions\functions\intro.sqf";
			};
			class aiSkillS {//aaf_fnc_aiSkillS
				file = "\AAF_Functions\functions\aiSkillS.sqf";
			};
			class aiAkillG {//aaf_fnc_aiSkillG
				file = "\AAF_Functions\functions\aiSkillG.sqf";
				postinit = 1;
			};
			/*class aiBreakable {//aaf_fnc_aiBreakable
				file = "\AAF_Functions\functions\aiBreakable.sqf";
				postinit = 1;
			};*/
			//REDUCER /////////////////////////////////////////////////////////////////////////////
			class rInit {//AAF_fnc_rInit
				file = "\aaf_functions\functions\rInit.sqf";
			};
			class rTracker {//AAF_fnc_rTracker
				file = "\aaf_functions\functions\rTracker.sqf";
			};
			class rCache {//AAF_fnc_rCache
				file = "\aaf_functions\functions\rCache.sqf";
			};
			class rUncache {//AAF_fnc_rUncache
				file = "\aaf_functions\functions\rUncache.sqf";
			};
			/*class zrInit {//AAF_fnc_zInit
				file = "";
			};*/
			/*class zrTracker {AAF_fnc_zTracker
				file = "";
			};*/
			/*class zrCache {//AAF_fnc_zCache
				file = "";
			};*/
			/*class zrUncache {//AAF_fnc_zUncahe
				file = "";
			};*/
			//LRM /////////////////////////////////////////////////////////////////////////////////
			/*class lrmInit {//AAF_fnc_lrmInit
				file= "";
				preinit=1;//call the function upon mission start, before objects are initialized
			 	postInit = 1;// call the function upon mission start, after objects are initialized
				recompile = 1;//set to 1 to recompile the function upon mission start
			};*/
			//class lrmPlayerL {};//LRM player load
			//class lrmPlayerS {};LRM Player saveloop
			//class lrmServerL {};LRM Server Load
			//class lrmServerS {};LRM Server saveloop

			//class lrmPlayerR {};LRM Player respawn
			//MISC ////////////////////////////////////////////////////////////////////////////////
			class afk {//AAF_fnc_afk
				file = "\aaf_functions\functions\afk.sqf";
			}; 
			class shbf {//AAF_fnc_shbf
				file = "\aaf_functions\functions\shbf.sqf";
			};
			class stuck {//AAF_fnc_stuck
				file = "\aaf_functions\functions\stuck.sqf";
			};
			class monitor {//AAF_fnc_Monitor
				file = "\aaf_functions\functions\monitor.sqf";
			};
			class addSpectate {//AAF_fnc_addSpectate
				file = "\aaf_functions\functions\addSpectate.sqf";
			};
			class aiResupply {//AI Vehicle refuel and rearm
				file = "\aaf_functions\functions\aiResupply.sqf";
			};
			//class massPara {};//All units in aircraft eject in single action
			//class lotsaDudes {};//Wee's wave AI assualt
			//class groupInsert {};//reinset player to group leader
		};
	};
};
class cfgAiSkill { //Current at 10/03/2024
	aimingAccuracy[] = 	{ 0,0.25,1,0.37 };//0.25 - 0.37
	aimingShake[] = 	{ 0,0.25,1,0.37 };//0.25 - 0.37
	aimingSpeed[] = 	{ 0,0.67,1,0.76 };//0.67 - 0.76
	commanding[] = 		{ 0,0.10,1,1.00 };//0.10 - 1.00
	courage[] = 		{ 0,0.10,1,0.50 };//0.10 - 0.50
	endurance[] = 		{ 0,1.00,1,1.00 };
	general[] =			{ 0,0.00,1,1.00 };//0.00 - 1.00
	reloadSpeed[] = 	{ 0,0.50,1,1.00 };//0.50 - 1.00
	spotDistance[] =	{ 0,0.35,1,0.52 };//0.35 - 0.52
	spotTime[] =		{ 0,0.35,1,0.52 };//0.35 - 0.52
};
/* Skill Notes
	0.00 is Civilien,
	0.25 Insurgents,
	0.50 is Regular,
	0.75 is Professional,
	1 is is SF
*/
#include "cfgDifficultyPresets.hpp" //New custom preset
#include "cfgSurfaces.hpp" //AI prove fix
