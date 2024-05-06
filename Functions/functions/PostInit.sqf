/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions post-Init Global
			Runs AFTER objects are initialised
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
missionNamespace getVariable ["aaf_mission", false];//AAF cba mission settings check
if !(aaf_mission) exitwith {};
if (isServer) then {//SERVER //////////////////////////////////////////////////////////////////////
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
	missionNamespace getVariable ["aaf_reducer", false];
	if (aaf_reducer) then {
		f_var_reducerAggressiveness = 2;
		_reducer = [30] spawn aaf_fnc_rInit;
	};
	//_aafGrpClean = [] spawn aaf_fnc_grpclean;//empty group cleaner
	{_x deleteGroupWhenEmpty true} forEach allGroups;//group cleaner redux
	_aafaiResupply = [] spawn aaf_fnc_aiResupply;//ai resupply
		{_x addEventHandler ["CuratorGroupPlaced", { _group deleteGroupWhenEmpty true}]; } foreach allCurators;
};
if (hasInterface) then {//PLAYER //////////////////////////////////////////////////////////////////
	["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
	missionNamespace getVariable ["aaf_loadout", false];
	player setVariable ["Saved_Loadout", nil];
	if (aaf_loadout) then {
		player setVariable["Saved_Loadout", getUnitLoadout player];
		if (aaf_DebugMode) then {systemchat "I saved ya loadout"};
		player addEventHandler ["respawn",{ player setUnitLoadout (player getVariable["Saved_Loadout",[]]);} ];
	};
};
//GLOBAL///////////////////////////////////////////////////////////////////////////////////////////
missionNamespace getvariable ["aaf_intro", false];//Intro Setting check
if (aaf_intro) then { [] spawn aaf_fnc_intro;};