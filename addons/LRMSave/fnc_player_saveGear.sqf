#include "script_component.hpp"
/*
 * Author: Puddleflop
 * Save a player's gear to their database.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the save to be saved to.
 * 1: _sectionName <SRTING>: The section in the database for the save to be saved to.
 *
 * Return Value:
 * True <BOOL>
 *
 * Example:
 * [_database, _sectionName] call AAF_LRMSave_fnc_player_saveGear
 *
*/
params["_database", "_sectionName"];

//Saves the players gear
_playerLoadout = getUnitLoadout player;
["write", [_sectionName, "Gear", _playerLoadout]] call _database;

//Checks for acre and save the radio setting if so.
if !(isnil "acre_api_fnc_getCurrentradiolist") then {
	_playerRadios = [] call acre_api_fnc_getCurrentRadioList;
	_playerRadioList = [];

	{
		// Saves the radio settings
		_channel = [_x] call acre_api_fnc_getradioChannel;
		_volume = [_x] call acre_api_fnc_getradioVolume;
		_spatial = [_x] call acre_api_fnc_getradioSpatial;
		_radioProperties = [_channel, _volume, _spatial];
		_playerRadiolist append [_radioProperties];
	} forEach _playerRadios;
	["write", [_sectionName, "radio", _playerRadiolist]] call _database;
};
true