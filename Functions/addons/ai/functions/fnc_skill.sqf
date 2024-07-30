#include "..\script_component.hpp"
aaf_skill = missionNamespace getvariable["aaf_skill", false];
aaf_debugmode = missionNamespace getvariable["aaf_debugmode", false];

if (aaf_skill) then {
	[west, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;
	[east, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;
	[resistance, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;
	if (aaf_debugmode) then {
		systemChat format ["Skills Set Skill:%1 Aim: %2", aaf_skillMax, aaf_skillAimMax]
	};
};

// [side, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill

// [west, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill;
// [east, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill;
// [GUER, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill;F