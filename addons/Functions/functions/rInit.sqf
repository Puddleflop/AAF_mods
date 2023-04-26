/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: F3 + AAF
Description: Reducer Script Init
Parameters: none
Returns: true
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
private ["_range", "_str1"];

params [
	["_sleep", 0, [0]]
];
f_var_reducerAggressiveness = 2;
///////////////////////////////////////////////////////////////////////////////////////////////////
// Wait for the mission to have launched before starting to cache.
sleep 0.1;

// Wait up to the desired time into the mission to give AI and players time to settle
waitUntil {sleep 0.1; time > _sleep};
///////////////////////////////////////////////////////////////////////////////////////////////////
// Player and the headless client's (if present) groups are always excluded from being cached
if (!isDedicated && !(group player getVariable ["f_cacheExcl", false])) then {
	(group player) setVariable ["f_cacheExcl", true, true];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// Rest of the reducer is only run server-side
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
// Make sure script is only run once
if (missionNameSpace getVariable ["f_rInit", false]) exitWith {};
f_rInit = true;
///////////////////////////////////////////////////////////////////////////////////////////////////
// All groups with playable units are set to be ignored as well
{
	if ({_x in playableUnits} count units _x > 0) then {_x setVariable ["f_cacheExcl",true,true];};
} forEach allGroups;
///////////////////////////////////////////////////////////////////////////////////////////////////
// Define parameters
_range = (dynamicSimulationDistance "Group");// The range outside of which to cache units - dynasim value
f_var_reducerSleep = 6; 		// The time to sleep between checking
f_var_reducerRun = true;

[_range] spawn aaf_fnc_rTracker;

// Start the debug tracker if enabled
aaf_debugmode = missionNamespace getvariable["aaf_debugmode",false];
if (aaf_debugMode) then {
	player globalchat format ["aaf_fnc_rInit DBG: Starting to track %1 groups, %2 range, %3 sleep",count allGroups,_range,f_var_reducerSleep];

	[] spawn {
		// Giving the tracker a head start
		sleep (f_var_reducerSleep * 1.1);
		while {f_var_reducerRun} do {
			_str1 = "f_fnc_cache DBG:<br/>"
			+ format ["Total groups: %1<br/>",count allGroups]
			+ format ["Cached groups:%1<br/>",{_x getvariable "f_cached"} count allGroups]
			+ format ["Activated groups:%1<br/>",{!(_x getvariable "f_cached")} count allGroups]
			+ format ["Excluded groups:%1<br/>",{(_x getvariable "f_cacheExcl")} count allGroups];
			hintsilent parseText (_str1);
			diag_log (_str1);

			sleep f_var_reducerSleep;
		};
	};
};
