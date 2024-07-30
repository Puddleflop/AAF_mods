#include "..\script_component.hpp"
/*
	
	AI skill Setter from AAF Settings
    https// community.bistudio.com/wiki/BIS_fnc_EXP_camp_setSkill
	
*/
// missionNamespace getVariable ["aaf_mission", false]// AAF cba mission settings check
// if !(aaf_mission) exitWith {};
missionNamespace getVariable ["aaf_aiDifficulty", "Editor"];
// Leave editor set skills
If (aaf_aiDifficulty == "Editor") exitWith {};

_skillset = 0.50;
switch (aaf_aiDifficulty) do {
	case "Civilian": {
		_skillset = 0.0
	};
	case "Insurgents": {
		_skillset = 0.25
	};
	case "Regular": {
		_skillset = 0.50
	};
	case "Professional": {
		_skillset = 0.75
	};
	case "SpecialForces": {
		_skillset = 1.0
	};
};
[east, _skillset, _skillset, _skillset, _skillset] call BIS_fnc_EXP_camp_setSkill;
[west, _skillset, _skillset, _skillset, _skillset] call BIS_fnc_EXP_camp_setSkill;
[independent, _skillset, _skillset, _skillset, _skillset] call BIS_fnc_EXP_camp_setSkill;