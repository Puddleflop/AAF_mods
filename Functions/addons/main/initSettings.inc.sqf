/* CBA_Settings_fnc_init
	_settingUnique setting name. Matches resulting variable name STRING
	_settingTypetype of setting. Can be “CHECKBOX”, “EDITBOX”, “list”, “SLIDER” or “COLOR” STRING
	_titleDisplay name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	_categoryCategory for the settings menu + optional sub-category <STRING, ARRAY>
	_valueInfoExtra properties of the setting depending of _settingType.  See examples below <ANY>
	_isGlobal1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
	_scriptScript to execute when setting is changed.  (optional) <CODE>
	_needRestartSetting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
*/
[
	"aaf_debugmode",
	"CHECKBOX",
	["Debug Mode", "For ModDev use, seriously leave it alone!"],
	["AAF Settings", "Mission Settings"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;


// WORKING
/*// aaf_breakable
"aaf_breakable",
list,
["AAF Breakable", "Can AI equipment be damaged?"],
["AAF Settings", "Mission Settings"],
["All Equipment", "Weapons only", "Ammunition Only", "Launchers Only"], ["All equipemnt get's damaged", "Only weapons can be damaged", "Only ammunition can be damaged"],
] call CBA_Settings_fnc_init;*/
/*// aaf_rZone
"aaf_rZone",
"CHECKBOX",
["AAF Zone Reducer", "Enable reducer zones"],
["AAF Settings", "WiP"],
false, // default
1
] call CBA_Settings_fnc_init;*/

// CBA skill SETTINGS
/*
// skill setting
	"aaf_skill",
	"CHECKBOX",
	"Debug Mode",
	["AAF Settings", "AI Skills"],
	true,
1// Global
	{}
	] call CBA_Settings_fnc_init;
// skill min
"aaf_skillMin", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
"SLIDER", // setting type
"AI Skill Minimum", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
["AAF Settings", "AI Skills"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
[0.00, 1.00, 0.50, 2, false], // data for this setting: [_min, _max, _default, _trailingDecimals, _isPercentage]
true, // "_isGlobal" flag. set this to true to always have this setting synchronized between all clients in multiplayer
	{
		call aaf_fnc_skill;
} // function that will be executed once on mission start and every time the setting is changed.
	] call CBA_Settings_fnc_init;
// skill max
	"aaf_skillMax",
	"SLIDER",
	"AI Skill Maximum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 1.00, 2, false],
	true,
	{
		call aaf_fnc_skill;
	}
	] call CBA_Settings_fnc_init;
// skill precision min
	"aaf_skillAimMin",
	"SLIDER",
	"AI Aim Minimum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 0.15, 2, false],
	true,
	{
		call aaf_fnc_skill;
	}
	] call CBA_Settings_fnc_init;
// skill precision max
	"aaf_skillAimMax",
	"SLIDER",
	"AI Aim Maximum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 0.30, 2, false],
	true,
	{
		call aaf_fnc_skill;
	}
	] call CBA_Settings_fnc_init;
*/