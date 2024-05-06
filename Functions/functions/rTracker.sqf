/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: F3 + AAF
Description: Reducer Tracker - Main running function
Parameters: none
Returns: true
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
private ["_groups","_debug","_exclude","_cached"];
params [ ["_range", 0, [0]] ];

// BEGIN THE TRACKING LOOP ////////////////////////////////////////////////////////////////////////
//aaf_debugmode = missionNamespace getvariable["aaf_debugmode",false];
while {f_var_reducerRun} do {
	_groups = allGroups select { ! isNull _x };
	if (aaf_debugmode) then{player globalchat format ["f_fnc_cache DBG: Tracking %1 groups",count _groups]};//DEBUG
	{
		_exclude = _x getVariable ["f_cacheExcl",false];//excluded value, defults to reduce
		_cached  = _x getVariable ["f_cached", false];//is it cached already
		if (!_exclude) then {
			if (_cached) then {
				if (aaf_debugmode) then {systemChat/*player globalchat*/ format ["f_fnc_cache DBG: Checking group: %1",_x]};//DEBUG
				if ([leader _x, _range] call CBA_fnc_nearPlayer) then {
					if (aaf_debugmode) then {SystemChat/*player globalchat*/ format ["f_fnc_cache DBG: Decaching: %1",_x]};//DEBUG
					_x setvariable ["f_cached", false];
					_x spawn aaf_fnc_rUncache;
				};
			} else {
				if !([leader _x, _range * 1.1] call CBA_fnc_nearPlayer) then {
					if (aaf_debugmode) then {SystemChat/*player globalchat*/ format ["f_fnc_cache DBG: Caching: %1",_x]};//DEBUG
					_x setvariable ["f_cached", true];
					[_x] spawn aaf_fnc_rCache;
				};
			};
		} else {
			if (aaf_debugmode) then {SystemChat/*player globalchat*/ format ["f_fnc_cache DBG: Group is excluded: %1",_x]};//DEBUG
		};
	} foreach _groups;
	sleep f_var_reducerSleep;
};
// If the caching loop is terminated, uncache all cached groups
{
	if (_x getvariable ["f_cached", false]) then {
		_x spawn aaf_fnc_rUncache;
		_x setvariable ["f_cached", false];
	};
} forEach allGroups;
