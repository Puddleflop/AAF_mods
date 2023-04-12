#include "script_component.hpp"
/*
 * Author: Puddleflop
 * Save the players state.
 *
 * Arguments:
 * 0: _database <CODE>: The database for the save to be saved to.
 * 1: _sectionName <SRTING>: The section in the database for the save to be saved to.
 *
 * Return Value:
 * True <BOOL>
 *
 * Example:
 * 
 *
*/

params["_database", "_sectionName"];

_playerPos = getPos player;
_playerStance = stance player;
_playerDirection = getDir player;
_playerInfo = [_playerPos, _playerStance, _playerDirection];
["write", [_sectionName, "position", _playerInfo]] call _database;
true