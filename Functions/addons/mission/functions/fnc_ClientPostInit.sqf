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

private _introRun = missionNamespace getvariable ["aaf_intro", false];
if (_introRun) then {
	[] spawn FUNC(intro);
};