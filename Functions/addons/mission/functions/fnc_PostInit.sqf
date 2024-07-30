#include "..\script_component.hpp"
/*
	Author: AAF
	Description: AAF_Functions post-Init Global
	Runs AFTER objects are initialised
	Parameters: none
	Returns: nothing
	Example: none
*/
private _aafMission = missionNamespace getVariable ["aaf_mission", false];
if !(_aafMission) exitWith {};
if (hasInterface) then {
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
	private _loadout = missionNamespace getVariable ["aaf_loadout", false];
	player setVariable ["Saved_Loadout", nil];
	if (_loadout) then {
		player setVariable["Saved_Loadout", getUnitLoadout player];
		private _debugMode = missionNamespace getVariable ["aaf_DebugMode", false];
		if (_debugMode) then {
			systemchat "I saved ya loadout"
		};
		player addEventHandler ["respawn", {
			player setUnitLoadout (player getVariable["Saved_Loadout", []]);
		} ];
	};
};

if (isServer) then {
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
	private _useReducer = missionNamespace getVariable ["aaf_reducer", false];
	if (_useReducer) then {
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