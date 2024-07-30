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
	"aaf_reducer",
	"CHECKBOX",
	["AAF AI Reducer", "Enable the AI Reducer (Range determined by dynamic simulation range)"],
	["AAF Settings", "Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;