/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions Global Pre-Init Global
			AAF Functions replaces the old disfunctional AAF mission settings
			No exit conditions, These run client and server
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
/* CBA_Settings_fnc_init
	_setting		Unique setting name. Matches resulting variable name STRING
	_settingType	Type of setting. Can be “CHECKBOX”, “EDITBOX”, “LIST”, “SLIDER” or “COLOR” STRING
	_title			Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	_category		Category for the settings menu + optional sub-category <STRING, ARRAY>
	_valueInfo		Extra properties of the setting depending of _settingType.  See examples below <ANY>
	_isGlobal		1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
	_script			Script to execute when setting is changed.  (optional) <CODE>
	_needRestart	Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
*/
[//aaf_mission
	"aaf_mission",
	"CHECKBOX",
	["AAF Mission","Check this to turn on AAF Mission Functions"],//DisplayName + ToolTip
	["AAF Settings","Mission Settings"],//Settings menu + sub-category
	false,//Value info
	1,//isGlobal
	{}//Script
] call CBA_Settings_fnc_init;
[//aaf_debugmode
	"aaf_debugmode",
	"CHECKBOX",
	["Debug Mode","For ModDev use, seriously leave it alone!"],
	["AAF Settings","Mission Settings"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;
[//aaf_Intro
	"aaf_intro",
	"CHECKBOX",
	["AAF Intro Enable","Enable Mission Intro Camera"],
	["AAF Settings","Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
[//aaf_loadout
	"aaf_loadout",
	"CHECKBOX",
	["Loadout Save","Enable initial loadout save for custom player loadouts"],
	["AAF Settings","Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
[//aaf_reducer
	"aaf_reducer",
	"CHECKBOX",
	["AAF AI Reducer","Enable the AI Reducer (Range determined by dynamic simulation range)"],
	["AAF Settings","Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
[//aaf_aiSkill
	"aaf_aiDifficulty",
	"LIST",
	["AAF AI Dificulty","Set AI difficulty"],
	["AAF Settings","Mission Settings"],
	[["Editor","Civilian","Insurgents","Regular","Professional","SpecialForces"],["No change from Editor Values","Civilian","Insurgents","Regular","Professional","SpecialForces"],0],
	true
] call CBA_Settings_fnc_init;

//WORKING /////////////////////////////////////////////////////////////////////////////////////////
/*[//aaf_breakable
	"aaf_breakable",
	LIST,
	["AAF Breakable","Can AI equipment be damaged?"],
	["AAF Settings","Mission Settings"],
	["All Equipment", "Weapons only","Ammunition Only", "Launchers Only"],["All equipemnt get's damaged", "Only weapons can be damaged", "Only ammunition can be damaged"],
] call CBA_Settings_fnc_init;*/
/*[//aaf_rZone
	"aaf_rZone",
	"CHECKBOX",
	["AAF Zone Reducer","Enable reducer zones"],
	["AAF Settings","WiP"],
	false, //default
	1
] call CBA_Settings_fnc_init;*/
/*[//aaf_pSave
	"aaf_pSave",
	"CHECKBOX",
	["AAF Player Save","Enable player gear and location saving"],
	["AAF Settings","WiP"],
	false, //default
	1
] call CBA_Settings_fnc_init;*/
/*[//aaf_sSave
	"aaf_sSave",
	"CHECKBOX",
	["AAF Server Save","Enable server saving"],
	["AAF Settings","WiP"],
	false, //default
	1
] call CBA_Settings_fnc_init;*/
//CBA SKILL SETTINGS //////////////////////////////////////////////////////////////////////////////
/*
[//Skill setting
	"aaf_skill",
	"CHECKBOX",
	"Debug Mode",
	["AAF Settings","AI Skills"],
	true,
	1,//Global
	{}
] call CBA_Settings_fnc_init;
[//Skill Min
	"aaf_skillMin", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"AI Skill Minimum", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings", "AI Skills"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0.00, 1.00, 0.50, 2, false], // data for this setting: [_min, _max, _default, _trailingDecimals, _isPercentage]
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{ call aaf_fnc_skill; } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Skill Max
	"aaf_skillMax",
	"SLIDER",
	"AI Skill Maximum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 1.00, 2, false],
	true,
	{ call aaf_fnc_skill; }
] call CBA_Settings_fnc_init;
[//Skill Precision Min
	"aaf_skillAimMin",
	"SLIDER",
	"AI Aim Minimum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 0.15, 2, false],
	true,
	{ call aaf_fnc_skill; }
] call CBA_Settings_fnc_init;
[//Skill Precision Max
	"aaf_skillAimMax",
	"SLIDER",
	"AI Aim Maximum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 0.30 ,2, false],
	true,
	{ call aaf_fnc_skill; }
] call CBA_Settings_fnc_init;
*/
