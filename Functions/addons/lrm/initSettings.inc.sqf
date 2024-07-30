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
