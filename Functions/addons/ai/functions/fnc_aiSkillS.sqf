#include "..\script_component.hpp"
/*
	AAF Zen setSkill function
	"[_groups, _args] call aaf_fnc_aiSkill";
	
    https// cbateam.github.io/CBA_A3/docs/files/events/fnc_targetEvent-sqf.html
*/
params ["_objects", "_args"];
{
	[_x, _args] remoteExec ["setSkill", 0];
} forEach _objects;