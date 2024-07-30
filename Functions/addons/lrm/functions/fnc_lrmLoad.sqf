#include "..\script_component.hpp"
// Purpose: if the lrm_fnc_init determines the player has played before, this script will load that previous data and then call the lrm saving loop.  Eventually there will need to be check to see if the player has connected after they have used up all their lives, and load into a spectator mode.
// Going to need to check if the player was saved in a vehicle, eventually.

_savedtime = profileNamespace getvariable ["lrm_saved_time", 0];// Using this for time sensitive variables, like torniquets, revive time.

// Loading their saved gear.
["LRM_Current_Loadout", "load"] call aaf_fnc_gear;

lrm_player_loc = profileNamespace getvariable ["lrm_player_loc", nil];
player setPosATL (lrm_player_loc select 0);
player setDir (lrm_player_loc select 1);

If !(profileNamespace getVariable ["ace_isUnconscious", false]) then
{
	player switchMove (lrm_player_loc select 2);
	player playMoveNow (lrm_player_loc select 2);
};
// Loads player position, facing and stance.
// Checks if the player was in the unconscious state last save. if they were, it does not load their previous animation, ACE will handle it when medical is loaded.

// Medical
private "_result";
_result = [];
{
	_result pushBack [_x, profileNamespace getVariable _x];
}
forEach medGlobalvars;

{
	player setVariable [_x select 0, _x select 1, true];
}
forEach _result;

// Makes a multidimensional array consisting of [variablename, value], then feeds that one by one into a global setVariable

_result = [];
{
	_result pushBack [_x, profileNamespace getVariable _x];
}
forEach medLocalvars;

{
	player setVariable [_x select 0, _x select 1];
}
forEach _result;

// As above, but for the few medical variables that can be kept local.

// Need a special case for tourniquets, so people don't pass out from pain if they logged off with tourniquets on.
_result = [];
{
	if (_x > 0) then {
		_x = CBA_missionTime - (_savedtime - _x);
		 if (_x <= 0) then {
			_x = 1
		};// Tourniquets can't be negative.
		_result pushBack _x;
	} else {
		_result pushBack 0;
	};
} forEach (profileNamespace getVariable ["ace_medical_tourniquets", [0, 0, 0, 0, 0, 0]]);
player setvariable ["ace_medical_tourniquets", _result, true];

/*Tourniquets save the time they were applied so they can calculate pain correctly. The position in the array indicates which limb. A typical tourniquets array looks like [0, 0, 0, 810, 813, 0] which would indicate two tourniquets applied at mission time 810 and 813 seconds.
	This loop checks if there was a tourniquet (_x > 0), and if there was, it takes the current mission time at load, subtracts how long the tourniquet was on (_savedtime - _x).
	if this is negative, i.e. was the tourniquet on longer than the server has currently been running, it sets the tourniquet to 1 as they cannot be negative.
It then assembles a new array of these values, and then applies it to the players tourniquets variable.*/

// Making sure ACE medical looping scripts activate.
// Checks if the player had a vital loop last time. if yes calls the relevent event.
If (player getVariable ["ace_medical_addedToUnitLoop", false]) then {
	player setvariable ["ace_medical_addedToUnitLoop", false, true];// Because ACE has checks to make sure shit is not already enabled, need to disable it before calling the function to enable it so it switches on properly.
	[player] call ace_medical_fnc_addVitalLoop;
};

player setdammage (profileNamespace getvariable ["lrm_med_Dammage", 0]);
   // set their damage. The misspelling is fine.
If (player getVariable ["ace_isUnconscious", false]) then
{
	player setvariable ["ace_isUnconscious", false, true];
	[player, true] call ace_medical_fnc_setUnconscious;
};
// Checks if the player was unconscious. if they were, it will set them to be awake and then call the ace set unconscious function.
// Doing it this way to get around ACE animation issues.

if (player getvariable ["ace_medical_inCardiacArrest", false]) then {
	player setvariable ["ace_medical_inCardiacArrest", false, true];
	[player] call ace_medical_fnc_setCardiacArrest;
};
// Checks if they were in cardiac arrest. If they're in it, sets it to false and then calls the function so it initiates properly. I can't capture the time cardiac arrest started, so it'll just have to be reset.

If (player getvariable ["ace_medical_inReviveState", false]) then {
	_reviveStarted = player getvariable ["ace_medical_reviveStartTime", 0];// Grabs the time at which revive started in previous save.
	_timeInRevive = _savedtime - _reviveStarted;
	        player setvariable ["ace_medical_reviveStartTime", (CBA_missionTime - _timeInRevive), true];// Should set revive time to be current time - difference.
	[player] call ace_medical_fnc_reviveStateLoop;
};
 // KNOWN ISSUE: If revive start time ends up being a negative number, i.e., they've been in revive longer than the misison has been running from a restart, CPR won't work.

// After loading call the save loop.

call lrm_fnc_saveloop;

// /////////////////////////////////////////////////////////////////////////////////////////////////
// NEW WA// ////////////////////////////////////////////////////////////////////////////////////////
// load Function
// Loading with error checking
// Blackout screen
/*
	if (isMissionProfileNamespaceLoaded) then {
		systemchat "vars loaded"
}// Check if played here before
player getVariable "aaf_mygear"// load save
systemChat str aaf_mygear// DEBUG
	if (count aaf_mygear > 0) then {
		hint "ping"; player setUnitLoadout aaf_mygear
}// apply save
*/
// Respawn addEventHandler
// -1 token
// spawn Back at base
// Clear player equipemnt and location
