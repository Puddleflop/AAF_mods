#include "..\script_component.hpp"
// Purpose: To be called by pretty much every lrm function once they've finish. This will be the script that continually saves their data. Once the player dies the loop will end automatically.
// Going to eventually need to check if player is in a vehicle.

profileNamespace setvariable ["lrm_saved_time", CBA_missionTime];// Use this for time sensitive variables, like torniquets, revive time. Doing it in load because that should do the heavy lifting, not the looping save script.

["LRM_Current_Loadout", "save"] call aaf_fnc_gear;
// Saving current loadout.

// Saving player position, facing, stance data.
_parent = objectParent player;// Gets the vehicle player is mounted in, returns null if in nothing.
_pos = getPosATL player;
if (isNull _parent) then// Check if player is not in a vehicle
 {
	lrm_player_loc = [_pos, getDir player, animationState player];
}// saves normal data if not in vehicle.
else
	{
	// if they are in a vehicle, then checks if the vehicle is a static weapon.
	if ((objectParent player) isKindof "StaticWeapon") then {
		lrm_player_loc = [_pos, getdir player, "amovpercmstpslowwrfldnon"];
	}// if they are, saves their loc data, sets default animation.
	 else {
		lrm_player_loc = [[_pos select 0, _pos select 1, 0], getdir player, "amovpercmstpslowwrfldnon"];
	};// if they are not in static, they are in another type of vehicle. Saves loc data except height, sets default animation.
};
// "amovpercmstpslowwrfldnon" is the animation name for standing with rifle down.

profileNamespace setvariable ["lrm_player_loc", lrm_player_loc];

// Medical.

   // Below function goes through each of the medical variables defined in initplayerlocal.sqf and will save them.
private "_result";
_result = [];
{
	_result pushBack [_x, player getVariable _x];
}
forEach medGlobalvars+medLocalvars;
   // _result becomes a big array of arrays, i.e. [ ["medvariablename1", value1], ["medvariablename2", value2] etc ]

{
	profileNamespace setVariable [_x select 0, _x select 1]
} forEach _result;
   // This part goes through each array stored, grabs the name, the value, then saves them in the profileNamespace.

lrm_med_dammage = damage player;
profilenamespace setvariable ["lrm_med_dammage", lrm_med_dammage];

[lrm_fnc_saveloop, [], 1] call CBA_fnc_waitAndExecute;// Calls this function every second. Using call so that this stays out of the scheduler.

// /////////////////////////////////////////////////////////////////////////////////////////////////
// NEW WA// ////////////////////////////////////////////////////////////////////////////////////////
// Save Function
// Put this into an Eventhander HandleDisconnect for dsiconnect to prevent assholes
// All info saved on server, timed or manual ?
/*
saveMissionProfileNamespace// Create file if not already done
_aaf_savegear = (getUnitLoadout player)// get laodout
missionNamespace setVariable ["aaf_mygear", _aaf_savegear]// save loadout
systemChat str _aaf_savegear// DEBUG
saveMissionProfileNamespace// Save file
*/