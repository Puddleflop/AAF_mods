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
	"aaf_mission",
	"CHECKBOX",
	["AAF Mission", "Check this to turn on AAF Mission Functions"],
	["AAF Settings", "Mission Settings"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;
[
	"aaf_intro",
	"CHECKBOX",
	["AAF Intro Enable", "Enable Mission Intro Camera"],
	["AAF Settings", "Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
[
	"aaf_loadout",
	"CHECKBOX",
	["Loadout Save", "Enable initial loadout save for custom player loadouts"],
	["AAF Settings", "Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;

[
	"aaf_aiDifficulty",
	"LIST",
	["AAF AI Dificulty", "Set AI difficulty"],
	["AAF Settings", "Mission Settings"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;