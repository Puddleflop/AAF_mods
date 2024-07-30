#include "..\script_component.hpp"
/*
	Author: F3 + AAF
	Description: Reducer function Init
	Parameters: none
	Returns: true
	Example: none
*/
private ["_range", "_str1"];
f_var_reducerAggressiveness = 2;

// MISSION SETTING DISABLE
if (aaf_debugmode) then {
	SystemChat "Reducer Enabled";
	player globalchat format ["aaf_fnc_rInit DBG: Starting to track %1 groups, %2 range, %3 sleep", count allGroups, _range, f_var_reducerSleep];
	[] spawn {
		// Giving the tracker a head start
		sleep (f_var_reducerSleep * 1.1);
		while { f_var_reducerRun } do {
			_str1 = "f_fnc_cache DBG:<br/>"
			+ format ["Total groups: %1<br/>", count allGroups]
			+ format ["Cached groups:%1<br/>", {
				_x getvariable "f_cached"
			} count allGroups]
			+ format ["Activated groups:%1<br/>", {
				!(_x getvariable "f_cached")
			} count allGroups]
			+ format ["Excluded groups:%1<br/>", {
				(_x getvariable "f_cacheExcl")
			} count allGroups];
			hintSilent parseText (_str1);
			diag_log (_str1);
			sleep f_var_reducerSleep;
		};
	};
};

// START UP DELAY
waitUntil {
	time > 60
};

// player and HEADLESS group EXCLUDE
// Check this and looks suspect
if (!isDedicated && !(group player getVariable ["f_cacheExcl", false])) then {
	(group player) setVariable ["f_cacheExcl", true, true];
};

// RUN ONCE CHECK
if (missionNameSpace getVariable ["f_rInit", false]) exitWith {};
f_rInit = true;

// MISSION GROUPS
{
	if ({
		_x in playableUnits
	} count units _x > 0) then {
		_x setVariable ["f_cacheExcl", true, true]; // Playerable units groups are auto excluded
	};
} forEach allGroups;
{
	if ((_x getVariable "f_cacheExcl") != true) then {
		_x setVariable ["f_cacheExcl", false, true]; // if not excluded, then include!
	}
} forEach allGroups;

// PARAMETERS and RUN
_range = (dynamicSimulationDistance "Group");// The range to cache units - dynasim value
f_var_reducerSleep = 30;
f_var_reducerRun = true;

[_range] spawn aaf_fnc_rTracker;

true
