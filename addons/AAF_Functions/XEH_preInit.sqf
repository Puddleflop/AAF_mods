/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions Global Pre-Init
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
//No exit conditions, These run client and server
//CBA SETTINGS ////////////////////////////////////////////////////////////////////////////////////
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


/*
[//Post init disablers
	"aaf_disable_postinit",
	"CHECKBOX",
	"Completely disable post init",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Server AI functions
	"aaf_disable_serverAI",
	"CHECKBOX",
	"Disable AI skill setter, group cleaner, resupplier",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Repsawn loadouts
	"aaf_disable_respawnLoadout",
	"CHECKBOX",
	"Disable loadout saving for respawn",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Custom Moduals
	"aaf_disable_CustomModules",
	"CHECKBOX",
	"Disable custom Ares modules",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//AI shoot Unco players
	"aaf_disable_AI_DontShootUnco",
	"CHECKBOX",
	"Disable AI ignore unconscious players",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Review Markers
	"aaf_disable_randomDeath_ReviveMarkers",
	"CHECKBOX",
	"Disable random death & revive markers",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//JIP Zues fix
	"aaf_disable_JIPZeus",
	"CHECKBOX",
	"Disable repairing JIP Zeus slots",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Group insignia
	"aaf_disable_groupInsignia",
	"CHECKBOX",
	"Disable arm patches based on group names",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Player skill notification
	"aaf_disable_skillNotification",
	"CHECKBOX",
	"Disable skill notifier (i.e. medic, engineer, EOD etc)",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Crator EH
	"aaf_disable_curatorEH",
	"CHECKBOX",
	"Disable Zeus init eventhandler",
	["AAF Extras","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[//Random Death settings
	"aaf_revive_MinimumRevives",
	"SLIDER",
	"Guaranteed Revives",
	["AAF Extras","Random Death Settings"],
	[0,100,1,0],
	1,
	{}
] call CBA_Settings_fnc_init;

[//Max revives
	"aaf_revive_MaximumRevives",
	"SLIDER",
	"Max Revives",
	["AAF Extras","Random Death Settings"],
	[0,100,5,0],
	1,
	{}
] call CBA_Settings_fnc_init;

[//Chance of death
	"aaf_revive_ChanceofDeath",
	"EDITBOX",
	"Chance at each unguaranteed revive (no spaces)",
	["AAF Extras","Random Death Settings"],
	"33,50,75,90",
	1,
	{
		params ["_values"];
		_value = "[" + _value + "]";
		_value = parseSimpleArray _value;
		missionnamespace setvariable ["aaf_revive_ChanceofDeath",_value];

	}
] call CBA_Settings_fnc_init;

//OLD SKILLS
[//Aim Accuracy
	"aaf_AISkills_AimingAccuracy", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"Aiming accuracy", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.25,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [0,['aimingAccuracy',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Aim Shake
	"aaf_AISkills_West_aimingShake", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West aiming shake", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.15,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [1,['aimingShake',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Aim Speed
	"aaf_AISkills_West_aimingSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West aiming speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.15,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [2,['aimingSpeed',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Commanding
	"aaf_AISkills_West_commanding", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West commanding", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.85,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [3,['commanding',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Courage
	"aaf_AISkills_West_courage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West courage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.5,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [4,['courage',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//General
	"aaf_AISkills_West_general", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West general", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.5,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [5,['general',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//reload Speed
	"aaf_AISkills_West_reloadSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West reloadSpeed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,1,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [6,['reloadSpeed',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Spot Distance
	"aaf_AISkills_West_spotDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West spotDistance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.85,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [7,['spotDistance',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Spot Time
	"aaf_AISkills_West_spotTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"West spotTime", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings, AI Skill"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0,1,0.85,2], // data for this setting:
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_value"];
		aaf_AIDIFWEST set [8,['spotTime',_value]];
		publicVariable "aaf_AIDIFWEST";
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
*/
