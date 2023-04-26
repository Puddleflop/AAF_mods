/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions Pre-init Client exec
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
if (not hasInterface) exitwith {};//server + Headless exit

//SAVE LOADOUT ////////////////////////////////////////////////////////////////////////////////////
private _value = missionnamespace getVariable ["AAF_respawnLoadout",true];//Settings check
if _value then {
	player setVariable["Saved_Loadout",getUnitLoadout player];
	player addEventHandler ["respawn",{ player setUnitLoadout (player getVariable["Saved_Loadout",[]]);} ];
};

//Dynamic Simulation wake up check ////////////////////////////////////////////////////////////////
//A catch in case the mission maker disabled player's ability to activate dynamically simmed units.
//Things get weird if players get into vehicles they can't wake up.
if not (canTriggerDynamicSimulation player) then {
	player triggerDynamicSimulation true;
};

//JIP Zues Fix/////////////////////////////////////////////////////////////////////////////////////
//When players JIP they won't have access to any non-Adminlogged Zeus modules until they've respawned.
//This checks if there is a module assigned to them and repairs the connection without requiring respawn.
//IS this needed ?  JIP can respawn if required ??
private _value = missionnamespace getVariable ["Jzues",false];
if _value then {
	if didJIP then {
		[] spawn aaf_fnc_JIPZeusAssign;
	};
};

//MISSION INTRO////////////////////////////////////////////////////////////////////////////////////
/*
if (isMultiplayer) then {//check MP first
	if (isDedicated) then { [] spawn aaf_fnc_introS; };
	if (hasInterface) then { [] spawn aaf_fnc_introC; };
};
*/
