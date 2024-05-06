aaf_skill = missionNamespace getvariable["aaf_skill",false];//NEEDED??
aaf_debugmode = missionNamespace getvariable["aaf_debugmode",false];//NEEDED??

if ( aaf_skill) then {
	[WEST, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;
	[EAST, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;
	[RESISTANCE, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;
	if (aaf_debugmode) then {systemChat/*player globalchat*/ format ["Skills Set Skill:%1 Aim: %2",aaf_skillMax, aaf_skillAimMax]};//DEBUG
};

//[side,aaf_skillMin,aaf_skillAimMin,aaf_skillMax,aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill

//[WEST, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill;
//[EAST, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill;
//[GUER, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill;