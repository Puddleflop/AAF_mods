#include "..\script_component.hpp"
/*
	Author: AAF
	Description: AAF_Functions post-Init Global
	Runs AFTER objects are initialised
	Parameters: none
	Returns: nothing
	Example: none
*/
missionNamespace getVariable ["aaf_mission", false]; // AAF cba mission settings check
if !(aaf_mission) exitWith {};
if (isServer) then {
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
	private _userReducer = missionNamespace getVariable ["aaf_reducer", false];
	if (_userReducer) then {
		f_var_reducerAggressiveness = 2;
		private _reducer = [30] spawn aaf_fnc_rInit;
	};
	{
		_x deleteGroupWhenEmpty true;
	} forEach allGroups;
	private _aafaiResupply = [] spawn aaf_fnc_aiResupply;
	{
		_x addEventHandler ["CuratorGroupPlaced", {
			_group deleteGroupWhenEmpty true
		}];
	} forEach allCurators;
};

private _introRun = missionNamespace getvariable ["aaf_intro", false];
if (_introRun) then {
	[] spawn FUNC(intro);
};