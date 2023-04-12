#include "script_component.hpp"
/*
 * Author: Puddleflop
 * Save the players state.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the Save to be saved to.
 *
 * Return Value:
 * None
 *
 * Example:
 * [_database] call AAF_LRMSave_fnc_player_save
 *
*/

params ["_database"];

private _sectionName = DATE;

if (GVAR(playerSavePosition)) then {
	[_database, _sectionName] call FUNC(player_savePosition);
};

if (GVAR(playerSaveMedical)) then {
	[_database, _sectionName] call FUNC(player_saveMedical);
};

if (GVAR(playerSaveGear)) then {
	[_database, _sectionName] call FUNC(player_saveGear);
};